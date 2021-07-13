using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos_DAL_
{
    public class DALInventario : DALBase
    {
        public void InsertarInventario(int idProducto, int Cantidad, string Descripcion)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Inventario (idProducto, cantidad, descripcion) VALUES (@idProducto, @cantidad, @descripcion)", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@idProducto", idProducto);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@cantidad", Cantidad);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", Descripcion);
            parametro.DbType = System.Data.DbType.String;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }

        public DataTable inventarioBuscar(string palabra)
        {
            DataTable dt = new DataTable();

            SqlCommand cm = new SqlCommand("SELECT Inventario.id, Producto.id AS idProducto, Producto.nombre, Inventario.cantidad, Inventario.descripcion FROM Inventario INNER JOIN Producto ON Inventario.idProducto = Producto.id where Producto.nombre like @nombre + '%'", Conexion);

            cm.Parameters.AddWithValue("@idProducto", palabra);
            SqlDataAdapter da = new SqlDataAdapter(cm);
            da.Fill(dt);
            return dt;
        }
        public DataTable ObtenerInventarioPorID(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT dbo.Producto.id AS idProducto, dbo.Producto.nombre, dbo.Inventario.cantidad, dbo.Inventario.descripcion FROM dbo.Inventario INNER JOIN dbo.Producto ON dbo.Inventario.idProducto = dbo.Producto.id WHERE dbo.Producto.id = @id", Conexion);
            SqlParameter parametro;
            parametro = new SqlParameter("@id", Identificacion);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public DataTable ObtenerTodosLosInventarios()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT dbo.Inventario.id, dbo.Producto.id AS idProducto, dbo.Producto.nombre, dbo.Inventario.cantidad, dbo.Inventario.descripcion FROM dbo.Inventario INNER JOIN  dbo.Producto ON dbo.Inventario.idProducto = dbo.Producto.id", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void EliminarInventario(int Identificacion)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Inventario WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }
        public void ActualizarInventarioSumRes(int id, int num)
        {

            SqlCommand cmd = new SqlCommand("UPDATE Inventario SET cantidad = @cantidad where id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@cantidad", num);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@id", id);
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }
        public void ModificarInventario(int ID, int idProducto, int Cantidad, string Descripcion)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Inventario SET id = @id, idProducto = @idProducto, cantidad = @cantidad, descripcion = @descripcion WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", ID);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idProducto", idProducto);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@cantidad", Cantidad);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", Descripcion);
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }
    }
}