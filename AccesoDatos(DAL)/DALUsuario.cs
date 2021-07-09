using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AccesoDatos_DAL_
{


    public class DALUsuario : DALBase
    {
        Usuario us = new Usuario();

        public void InsertarUsuario(Persona persona, Usuario usuario)
        {
        SqlCommand cmdPersona = new SqlCommand("insert into Persona (nombre, apellido, correo, telefono, identificacion) values (@nombre, @apellido, @correo, @telefono, @identificacion); SELECT CAST (scope_identity() as int)", Conexion);
        //SqlParameter parametro;
        SqlParameter parametroPersona;
            parametroPersona = new SqlParameter("@nombre",persona.nombre );
            cmdPersona.Parameters.Add(parametroPersona);

            parametroPersona = new SqlParameter("@apellido", persona.apellido);
            cmdPersona.Parameters.Add(parametroPersona);

            parametroPersona = new SqlParameter("@correo", persona.correo);
            cmdPersona.Parameters.Add(parametroPersona);

            parametroPersona = new SqlParameter("@telefono", persona.telefono);
            cmdPersona.Parameters.Add(parametroPersona);

            parametroPersona = new SqlParameter("@identificacion", persona.identificacion);
            cmdPersona.Parameters.Add(parametroPersona);

            int personaInsertada;

        Conexion.Open();
            personaInsertada = (int)cmdPersona.ExecuteScalar();
            Conexion.Close();

     
        SqlCommand cmd = new SqlCommand("INSERT INTO Usuario(nombreUsuario, contrasenna, idRoll, estado, idPersona)VALUES(@nombreUsuario, @contrasenna, @idRoll, @estado, @idPersona)", Conexion);
        SqlParameter parametro;

            parametro = new SqlParameter("@nombreUsuario", usuario.NombreUsuario);
        cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@contrasenna",usuario.Contrasenna );
        cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@idRoll", usuario.idRol);
        cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@estado", usuario.estado);
        cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@idPersona", personaInsertada);
        cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
             Conexion.Close();
        }

        public DataTable ObtenerTodosUsuarios()//aca va un posible inner join para cambiar el id de roll y persona por los nombres
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT u.id, u.nombreUsuario, u.contrasenna, r.descripcion AS idRoll, u.estado AS IdEstado, CASE WHEN u.estado = 1 THEN 'Activo' ELSE 'Inactivo' END AS estado, p.id AS idPersona, p.nombre, p.apellido, p.correo, p.telefono, p.identificacion " +
                "FROM Usuario AS u INNER JOIN Roll AS r ON u.idRoll = r.id INNER JOIN Persona AS p ON u.idPersona = p.id", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void CambiarEstadoUsuario(int id)
        {
            //aca se cambiaria el estado en casi de trabajar con enum
            SqlCommand cmd = new SqlCommand("UPDATE Usuario SET estado = '2' where id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            cmd.Parameters.Add(parametro);
            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }
        public DataTable ObtenerTodosLosUsuariosActivos()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT dbo.Usuario.id, dbo.Usuario.nombreUsuario, dbo.Usuario.contrasenna, dbo.Roll.descripcion AS idRoll, CASE WHEN Usuario.estado = 1 THEN 'Activo' ELSE 'Inactivo' END AS estado, dbo.Usuario.idPersona, dbo.Persona.nombre, dbo.Persona.apellido, dbo.Persona.correo, dbo.Persona.telefono, dbo.Persona.identificacion FROM dbo.Usuario INNER JOIN dbo.Roll ON dbo.Usuario.idRoll = dbo.Roll.id INNER JOIN dbo.Persona ON dbo.Usuario.idPersona = dbo.Persona.id WHERE(dbo.Usuario.estado = 1)", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public void Eliminar(int Identificacion)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Usuario WHERE id = @id", Conexion);
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

        public DataTable ObtenerUsuarioPorId(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT dbo.Usuario.id, dbo.Usuario.nombreUsuario, dbo.Usuario.contrasenna, dbo.Usuario.idRoll, dbo.Usuario.estado, dbo.Usuario.idPersona, dbo.Persona.nombre, dbo.Persona.apellido, dbo.Persona.correo, dbo.Persona.telefono, dbo.Persona.identificacion FROM dbo.Usuario INNER JOIN dbo.Roll ON dbo.Usuario.idRoll = dbo.Roll.id INNER JOIN dbo.Persona ON dbo.Usuario.idPersona = dbo.Persona.id WHERE dbo.Usuario.id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public DataTable ObtenerUsuarioPorNombreUsuario(string nombreUsuario)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombreUsuario, contrasenna, idRoll, estado, idPersona FROM Usuario WHERE nombreUsuario = @nombreUsuario", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@nombreUsuario", nombreUsuario);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public void Modificar(int id, string nombreUsuario, string contrasenna, int idRoll, int estado, int idPersona)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Usuario SET nombreUsuario=@nombreUsuario, contrasenna=@contrasenna, idRoll=@idRoll, estado=@estado, idPersona=@idPersona WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@nombreUsuario", nombreUsuario);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@contrasenna", contrasenna);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idRoll", idRoll);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", estado);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idPersona", idPersona);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }

        public bool Login(string user, string pass)
        {
            try
            {
                //Conexion.Open();
                using (var command = new SqlCommand())
                {
                    command.Connection = Conexion;
                    Conexion.Open();

                    command.CommandText = "select * from Usuario where nombreUsuario =@nombreUsuario and contrasenna =@contrasenna";
                    command.Parameters.AddWithValue("@nombreUsuario", user);
                    command.Parameters.AddWithValue("@contrasenna", pass);
                    command.CommandType = CommandType.Text;

                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            us.id = reader.GetInt32(0);
                            us.NombreUsuario = reader.GetString(1);
                            us.Contrasenna = reader.GetString(2);
                            us.idRol = reader.GetInt32(3);
                            us.estado = reader.GetInt32(4);
                            us.idPersona = reader.GetInt32(5);
                        }
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Digite los datos requeridos");
                throw;
            }
        }

        public string GetSHA256(string str)
        {
            SHA256 sha256 = SHA256Managed.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = sha256.ComputeHash(encoding.GetBytes(str));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();

        }

        public bool Roles()
        {
            if (us.idRol == 1)
            {
                return true;
            }
            return false;
        }
    }
}


































