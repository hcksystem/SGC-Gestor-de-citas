using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos_DAL_
{
    public class DALPersona : DALBase
    {
        public void InsertarPersona(string Nombre, string Apellido, string Correo, string Telefono, string Identificacion)
        {
            SqlCommand cmd = new SqlCommand("insert into Persona (nombre, apellido, correo, telefono, identificacion) values (@nombre, @apellido, @correo, @telefono, @identificacion)", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@nombre", Nombre);
            cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@apellido", Apellido);
            cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@correo", Correo);
            cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@telefono", Telefono);
            cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@identificacion", Identificacion);
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            //cmd.ExecuteScalar();
            Conexion.Close();
        }

        public DataTable ObtenerTodasPersonas()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, apellido, correo, telefono, identificacion FROM Persona", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void EliminarPersona(int Identificacion)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Persona WHERE id = @id", Conexion);
                SqlParameter parametro;

                parametro = new SqlParameter("@id", Identificacion);
                parametro.DbType = DbType.Int32;
                cmd.Parameters.Add(parametro);

                Conexion.Open();
                cmd.ExecuteNonQuery();
                Conexion.Close();
            }
            catch (Exception)
            {

                throw;
            }

        }
        public DataTable ObtenerPersonaPorId(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, apellido, correo, telefono, identificacion FROM Persona WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public DataTable ObtenerPersonaPorCorreo(string correo)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, apellido, correo, telefono, identificacion FROM Persona WHERE correo = @correo", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@correo", correo);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void Modificar(int id, string Nombre, string Apellido, string Correo, string Telefono, string Identificacion)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Persona SET nombre=@nombre, apellido=@apellido, correo=@correo, telelfono=@telefono, identificacion=@identificacion WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@nombre", Nombre);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@apellido", Apellido);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@correo", Correo);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@telefono", Telefono);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@identificacion", Identificacion);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }
    }
}