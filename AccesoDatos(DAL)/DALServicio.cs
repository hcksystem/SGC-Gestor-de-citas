using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos_DAL_
{


    public class DALServicio : DALBase
    {
        public SqlConnection cn = new SqlConnection("Data Source =.; Initial Catalog = SolucionesSGC; User ID = sa; Password=123456");

        public String GuardarServicio(int IDServicio,string nombre, string descripcion,int idProducto, double precioEstimado, int Duracion, String fotoSugerida, int estado, int idNegocio)
        {
            SqlCommand cmd = new SqlCommand(String.Format("exec SP_GuardarServicio {0},'{1}','{2}',{3},'{4}','{5}',{6},{7},{8}",IDServicio,nombre,descripcion,idProducto,precioEstimado,fotoSugerida,estado,idNegocio,Duracion), Conexion);
            Conexion.Open();
           String mensaje=(String) cmd.ExecuteScalar();
            Conexion.Close();
            return mensaje;
        }
        public DataTable ObtenerServicioPorID(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand(String.Format("SELECT a.id, a.nombre, a.descripcion, precioEstimado, duracion, fotoSugerida, a.estado, idNegocio,b.idProducto[Producto] FROM Servicio a left join Servicio_Producto b on a.id=b.idServicio  WHERE a.id = {0}", Identificacion), Conexion);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public DataTable ObtenerTodosLosServicios()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, descripcion, precioEstimado, fotoSugerida, estado, idNegocio FROM Servicio", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void CambiarEstadoServicio(int id)
        {
            //verificar que en el enum el numero dos si corresponda apagado o eliminar
            SqlCommand cmd = new SqlCommand("UPDATE Servicio SET estado = '2' where id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            cmd.Parameters.Add(parametro);
            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }
        public void ActivarServicio(int id)
        {
            //verificar que en el enum el numero dos si corresponda apagado o eliminar
            SqlCommand cmd = new SqlCommand("UPDATE Servicio SET estado = '1' where id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            cmd.Parameters.Add(parametro);
            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }
        public DataTable ObtenerTodosLosServiciosActivos()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("Select * from VW_Servicios", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public DataTable ObtenerTodosLosServiciosInactivos()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, descripcion, estado FROM Servicio where estado =2", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public static DataSet SeleccionarTodosServiciosLista()
        {
         SqlConnection cn = new SqlConnection("Data Source =.; Initial Catalog = SolucionesSGC; User ID = sa; Password=123456");

        DataSet dt = new DataSet();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, descripcion, precioEstimado, fotoSugerida, estado, idNegocio,Duracion FROM dbo.Servicio where estado=1", cn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public bool TieneImagen(int ID)
        {
            SqlConnection cn = new SqlConnection("Data Source =.; Initial Catalog = SolucionesSGC; User ID = sa; Password=123456");
            cn.Open();
            SqlCommand cmd = new SqlCommand(String.Format("select count(1) from Servicio where len(fotoSugerida) > 1 and id = {0}",ID),cn);
            int Result=Convert.ToInt32(cmd.ExecuteScalar());
            if (Result > 0)
            {
                return true;
            }
            else {
                return false;
            }
            cn.Close();

        }

        public string Imagen(int v)
        {
            SqlConnection cn = new SqlConnection("Data Source =.; Initial Catalog = SolucionesSGC; User ID = sa; Password=123456");
            cn.Open();
            SqlCommand cmd = new SqlCommand(String.Format("select fotoSugerida from Servicio where  id = {0}", v),cn);
            string result=(string)cmd.ExecuteScalar();
            cn.Close();
            return result;
        }

        public void ModificarServicio(int ID, string nombre, string descripcion, double precioEstimado, DateTime tiempoEstimado, byte[] fotoSugerida, int estado, int idProducto, int idNegocio)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Servicio SET nombre = @nombre, descripcion = @descripcion, precioEstimado = @precioEstimado, tiempoEstimado = @tiempoEstimado, fotoSugerida = @fotoSugerida,estado=@estado,idProducto=@idProducto,idNegocio=@idNegocio WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", ID);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@nombre", nombre);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", descripcion);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@precioEstimado", precioEstimado);
            parametro.DbType = DbType.Double;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@tiempoEstimado", tiempoEstimado);
            parametro.DbType = DbType.Time;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@fotoSugerida", fotoSugerida);
            parametro.DbType = DbType.Binary;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", estado);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idProducto", idProducto);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idNegocio", idNegocio);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }

        public void ModificarServicioSinFoto(int ID, string nombre, string descripcion, double precioEstimado, DateTime tiempoEstimado, int estado, int idProducto, int idNegocio)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Servicio SET nombre = @nombre, descripcion = @descripcion, precioEstimado = @precioEstimado, tiempoEstimado = @tiempoEstimado,estado=@estado,idProducto=@idProducto,idNegocio=@idNegocio WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", ID);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@nombre", nombre);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", descripcion);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@precioEstimado", precioEstimado);
            parametro.DbType = DbType.Double;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@tiempoEstimado", tiempoEstimado);
            parametro.DbType = DbType.Time;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", estado);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idProducto", idProducto);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idNegocio", idNegocio);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }


        public void EliminarServicio(int Identificacion)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Servicio WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            parametro.DbType = System.Data.DbType.Int32;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }
    }
}





























