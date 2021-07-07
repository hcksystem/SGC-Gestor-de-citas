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


        public DataTable ObtenerInventarioPorID(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, idProducto, cantidad, descripcion FROM Inventario WHERE id = @id", Conexion);
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
            SqlCommand cmd = new SqlCommand("SELECT id, idProducto, cantidad, descripcion FROM Inventario", Conexion);
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