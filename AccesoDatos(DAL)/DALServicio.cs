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
        public void InsertarServicio(string nombre, string descripcion, double precioEstimado, DateTime tiempoEstimado, byte[] fotoSugerida, bool estado, int idProducto, int idNegocio)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Servicio (nombre, descripcion, precioEstimado, tiempoEstimado, fotoSugerida, estado, idProducto, idNegocio ) VALUES (@nombre, @descripcion, @precioestimado, @tiempoEstimado, @fotoSugerida, @estado, @idProducto, @idNegocio)", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@nombre", nombre);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", descripcion);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@precioEstimado", precioEstimado);
            parametro.DbType = System.Data.DbType.Double;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@tiempoEstimado", tiempoEstimado);
            parametro.DbType = System.Data.DbType.DateTime;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@fotoSugerida", fotoSugerida);
            parametro.DbType = System.Data.DbType.Binary;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", estado);
            parametro.DbType = System.Data.DbType.Boolean;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idProducto", idProducto);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idNegocio", idNegocio);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }
        public DataTable ObtenerServicioPorID(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, descripcion, precioEstimado, tiempoEstimado, fotoSugerida, estado, idProducto, idNegocio FROM Servicio WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public DataTable ObtenerTodosLosServicios()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, descripcion, precioEstimado, tiempoEstimado, fotoSugerida, estado, idProducto, idNegocio FROM Servicio", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void CambiarEstadoServicio(int id)
        {

            SqlCommand cmd = new SqlCommand("UPDATE Servicio SET estado = 'false' where id=@id", Conexion);
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
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, descripcion, precioEstimado, tiempoEstimado, fotoSugerida, estado, idProducto, idNegocio FROM Servicio WHERE estado = 'true'", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void ModificarServicio(int ID, string nombre, string descripcion, double precioEstimado, DateTime tiempoEstimado, byte[] fotoSugerida, bool estado, int idProducto, int idNegocio)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Servicio SET nombre = @nombre, descripcion = @descripcion, precioEstimado = @precioEstimado, tiempoEstimado = @tiempoEstimado, fotoSugerida = @fotoSugerida,estado=@estado,idProducto=@idProducto,idNegocio=@idNegocio WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", ID);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@nombre", nombre);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", descripcion);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@precioEstimado", precioEstimado);
            parametro.DbType = DbType.Double;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@tiempoEstimado", tiempoEstimado);
            parametro.DbType = DbType.DateTime;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@fotoSugerida", fotoSugerida);
            parametro.DbType = DbType.Binary;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", estado);
            parametro.DbType = DbType.Boolean;
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
