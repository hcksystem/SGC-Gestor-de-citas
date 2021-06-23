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
        public void InsertarProducto(string Nombre, string Categoria, string Descripcion, int Cantidad, string Proposito, double Precio, bool Estado)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Producto (Nombre, Categoria, Descripcion, Cantidad, Proposito, Precio, Estado ) VALUES (@nombre, @categoria, @descripcion, @cantidad, @proposito, @precio, @estado)", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@nombre", Nombre);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@categoria", Categoria);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", Descripcion);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@cantidad", Cantidad);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@proposito", Proposito);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@precio", Precio);
            parametro.DbType = System.Data.DbType.Double;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", Estado);
            parametro.DbType = System.Data.DbType.Boolean;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }

        public void Modificar(int id, string Nombre, string Categoria, string Descripcion, int Cantidad, string Proposito, double Precio, bool Estado)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Producto SET nombre=@nombre, categoria=@categoria, descripcion=@descripcion, cantidad=@cantidad, proposito=@proposito, precio=@precio, estado=@estado WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@nombre", Nombre);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@categoria", Categoria);
            // parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", Descripcion);
            //parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@cantidad", Cantidad);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@proposito", Proposito);
            // parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@precio", Precio);
            parametro.DbType = DbType.Double;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", Estado);
            parametro.DbType = DbType.Boolean;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }


        public DataTable ObtenerProductoPorID(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, categoria, descripcion, cantidad, proposito, precio, estado FROM Producto WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void CambiarEstadoProducto(int id)
        {
            
            SqlCommand cmd = new SqlCommand("UPDATE Producto SET estado = 'false' where id=@id", Conexion);
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
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, categoria, descripcion, cantidad, proposito, precio, estado FROM Producto", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public DataTable ObtenerTodosLosProductosActivos()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, categoria, descripcion, cantidad, proposito, precio, estado FROM Producto WHERE estado = 'true'", Conexion);
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
