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

        public void InsertarUsuario(string Correo, string Telefono, string Contrasenna, int idRoll)
        {
            SqlCommand cmd = new SqlCommand("insert into Usuario (CorreoUsuario, Telefono, Contrasenna, IdRoll) values (@correoUsuario, @telefono, @contrasenna, @idRoll)", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@correoUsuario", Correo);
            cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@telefono", Telefono);
            cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@contrasenna", Contrasenna);
            cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@idRoll", idRoll);
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }

        public DataTable ObtenerTodosUsuarios()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, correoUsuario, telefono, contrasenna, idRoll FROM Usuario", Conexion);
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
            SqlCommand cmd = new SqlCommand("SELECT id, correoUsuario, telefono, contrasenna, idRoll FROM Usuario WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public DataTable ObtenerUsuarioPorCorreo(string correo)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, correoUsuario, telefono, contrasenna, idRoll FROM Usuario WHERE correoUsuario = @correoUsuario", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@correoUsuario", correo);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public void Modificar(int id, string correoUsuario, string telefono, string contrasenna, int idRoll)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Usuario SET correoUsuario=@correoUsuario, telefono=@telefono, contrasenna=@contrasenna, idRoll=@idRoll WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@correoUsuario", correoUsuario);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@telefono", telefono);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@contrasenna", contrasenna);
            // parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idRoll", idRoll);
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

                    command.CommandText = "select * from Usuario where correoUsuario =@correoUsuario and contrasenna =@contrasenna";
                    command.Parameters.AddWithValue("@correoUsuario", user);
                    command.Parameters.AddWithValue("@contrasenna", pass);
                    command.CommandType = CommandType.Text;

                    SqlDataReader reader = command.ExecuteReader();




                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {

                            us.id = reader.GetInt32(0);
                            us.Correo = reader.GetString(1);
                            us.Telefono = reader.GetString(2);
                            us.Contrasenna = reader.GetString(3);
                            us.idRol = reader.GetInt32(4);
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
