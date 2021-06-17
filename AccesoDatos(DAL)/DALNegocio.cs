using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos_DAL_
{
    public class DALNegocio: DALBase
    {
        public void InsertarNegocio(string Nombre, byte[] Logo, string Descripcion, string Mision, string Vision)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Negocio (Nombre, Logo, Descripcion, Mision, Vision) VALUES (@nombre, @logo, @descripcion, @mision, @vision)", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@nombre", Nombre);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@logo", Logo);
            parametro.DbType = System.Data.DbType.Binary;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", Descripcion);
            parametro.DbType = System.Data.DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@mision", Mision);
            parametro.DbType = System.Data.DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@vision", Vision);
            parametro.DbType = System.Data.DbType.String;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }

        public DataTable ObtenerNegocioPorID(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, logo, descripcion, mision, vision FROM Negocio WHERE id = @id", Conexion);
            SqlParameter parametro;
            parametro = new SqlParameter("@id", Identificacion);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public DataTable ObtenerTodosLosNegocio()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, logo, descripcion, mision, vision FROM Negocio", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public void EliminarNegocio(int Identificacion)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Negocio WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }

        public void ModificarNegocio(int ID, string Nombre, byte[] Logo, string Descripcion, string Mision, string Vision)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Negocio SET nombre = @nombre, logo = @logo, descripcion = @descripcion, mision = @mision, vision = @vision WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", ID);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@nombre", Nombre);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@logo", Logo);
            parametro.DbType = DbType.Binary;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", Descripcion);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@mision", Mision);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@vision", Vision);
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }
    }
}
