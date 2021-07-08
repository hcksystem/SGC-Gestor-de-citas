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

        public void InsertarUsuario(string NombreUsuario, string Contrasenna, int idRoll, int estado)
        {
        SqlCommand cmdPersona = new SqlCommand("insert into Persona (nombre, apellido, correo, telefono, identificacion) values (@nombre, @apellido, @correo, @telefono, @identificacion)", Conexion);
        //SqlParameter parametro;
        SqlParameter parametroPersona;
        parametroPersona = new SqlParameter("@nombreUsuario",NombreUsuario );

        Conexion.Open();
            cmdPersona.ExecuteNonQuery();
            Conexion.Close();

            DataTable dt = new DataTable();
        SqlCommand cmdConsultaMax = new SqlCommand(cmdText: "SELECT max(id) as id FROM Persona", Conexion);
        SqlDataAdapter da = new SqlDataAdapter(cmdConsultaMax);
        da.Fill(dt);
            int idPersona = int.Parse(dt.Rows[0]["id"].ToString());
        SqlCommand cmd = new SqlCommand(cmdText: "INSERT INTO Usuario(nombreUsuario,contrasenna, idRoll, estado, idPersona)VALUES(@nombreUsuario, @contrasenna, @idRoll, @estado, @idPersona)", Conexion);
        SqlParameter parametro;
        parametro =
            parametro = new SqlParameter("@nombreUsuario", NombreUsuario);
        cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@contrasenna",Contrasenna );
        cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@idRoll", idRoll);
        cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@estado", estado);
        cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@idPersona", idPersona);
        cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmdPersona.ExecuteNonQuery();
            //cmd.ExecuteScalar();
            Conexion.Close();
        }

        public DataTable ObtenerTodosUsuarios()//aca va un posible inner join para cambiar el id de roll y persona por los nombres
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT dbo.Usuario.id, dbo.Usuario.nombreUsuario, dbo.Usuario.contrasenna, dbo.Roll.descripcion AS idRoll, dbo.Usuario.estado, dbo.Persona.identificacion as idPersona FROM dbo.Usuario INNER JOIN dbo.Roll ON dbo.Usuario.idRoll = dbo.Roll.id INNER JOIN dbo.Persona ON dbo.Usuario.idPersona = dbo.Persona.id", Conexion);
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
            SqlCommand cmd = new SqlCommand("SELECT id, nombreUsuario, contrasenna, idRoll, estado, idPersona FROM Usuario WHERE id = @id", Conexion);
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


































