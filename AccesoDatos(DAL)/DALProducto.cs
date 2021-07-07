using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos_DAL_
{
    public class DALProducto : DALBase
    {
        public void InsertarProducto(string Nombre, int idCategoria, string Descripcion, string Proposito, double Precio, int Estado)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Producto (Nombre, idCategoria, Descripcion, Proposito, Precio, Estado ) VALUES (@nombre, @categoria, @descripcion, @proposito, @precio, @estado)", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@nombre", Nombre);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idcategoria", idCategoria);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", Descripcion);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@proposito", Proposito);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@precio", Precio);
            parametro.DbType = System.Data.DbType.Double;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", Estado);
            parametro.DbType = System.Data.DbType.Int32;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();


        }



        public void Modificar(int id, string Nombre, int idCategoria, string Descripcion, string Proposito, double Precio, int Estado)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Producto SET nombre=@nombre, idcategoria=@idcategoria, descripcion=@descripcion, proposito=@proposito, precio=@precio, estado=@estado WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@nombre", Nombre);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idcategoria", idCategoria);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", Descripcion);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@proposito", Proposito);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@precio", Precio);
            parametro.DbType = DbType.Double;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", Estado);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }


        public DataTable ObtenerProductoPorID(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, idcategoria, descripcion, proposito, precio, estado FROM Producto WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void CambiarEstadoProducto(int id)
        {
            //aca se cambiaria el estado en casi de trabajar con enum
            SqlCommand cmd = new SqlCommand("UPDATE Producto SET estado = '1' where id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            cmd.Parameters.Add(parametro);
            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }


        public DataTable ObtenerTodosLosProductos()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, idcategoria, descripcion, proposito, precio, estado FROM Producto", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public DataTable ObtenerTodosLosProductosActivos()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, idcategoria, descripcion, proposito, precio, estado FROM Producto WHERE estado = 'true'", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public void EliminarProducto(int Identificacion)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Producto WHERE id = @id", Conexion);
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