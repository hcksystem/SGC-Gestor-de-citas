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

        public Persona ObtenerPersonaPorIDUsuario(string v)
        {
            Conexion.Open();
            String osql = string.Format("Select nombre,apellido,correo,telefono,identificacion from Persona a inner join Usuario b on a.id=b.idPersona where b.id='{0}'", v);
            SqlCommand cmd = new SqlCommand(osql, Conexion);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            Conexion.Close();
            Persona temp = new Persona
            {
                nombre = dt.Rows[0]["nombre"].ToString(),
                apellido = dt.Rows[0]["apellido"].ToString(),
                correo = dt.Rows[0]["correo"].ToString(),
                identificacion = dt.Rows[0]["identificacion"].ToString(),
                telefono=dt.Rows[0]["telefono"].ToString(),
            };
            return temp;

        }

        public bool CompararClave(string text1)
        {
            String osql = string.Format("Select count(1) from Usuario where contrasenna=HASHBYTES('MD5','{0}') and id=1",text1);
            SqlCommand cmd = new SqlCommand(osql, Conexion);
            Conexion.Open();
            int result = (int)cmd.ExecuteScalar();
            Conexion.Close();
            if (result == 1)
            {
                return true;
            }
            else { return false; }
        }

        public int Actualizar(Persona persona, string nuevaClave)
        {
            SqlCommand cmd = new SqlCommand(String.Format("Update a set Identificacion='{0}',Nombre='{2}',correo='{3}',apellido='{4}' from Persona a inner join Usuario b on a.id=b.idPersona where b.id={1}",persona.identificacion,persona.id,persona.nombre,persona.correo,persona.apellido), Conexion);
            Conexion.Open();
            int result = cmd.ExecuteNonQuery();
            if (nuevaClave.Length > 0) {
              cmd = new SqlCommand(String.Format("Update b set contrasenna=HashBytes('MD5','"+nuevaClave+"') from Usuario  b where b.id={1}", persona.identificacion, persona.id, persona.nombre, persona.correo, persona.apellido), Conexion);
                result+= cmd.ExecuteNonQuery();
            }
            Conexion.Close();
            return result;
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
            SqlCommand cmd = new SqlCommand("UPDATE Persona SET nombre=@nombre, apellido=@apellido, correo=@correo, telefono=@telefono, identificacion=@identificacion WHERE id=@id", Conexion);
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