using Entidades;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace AccesoDatos_DAL_
{


    public class DALUsuario : DALBase
    {
        Usuario us = new Usuario();

        public string InsertarUsuario(Persona persona, Usuario usuario)
        {
            string Resultado = "";
            SqlCommand cmd = new SqlCommand(string.Format("Select count(1)[Total] from Persona where identificacion='{0}'",persona.identificacion),Conexion);
            Conexion.Open();
            int Identificacion = (int)cmd.ExecuteScalar();
            cmd = new SqlCommand(string.Format("Select count(1)[Total] from Usuario where nombreUsuario='{0}'", usuario.NombreUsuario),Conexion);
            int NombreUsuario = (int)cmd.ExecuteScalar();
            if (Identificacion > 0)
            {
                Resultado += String.Format(" (x)Esta Identificacion ya se encuentra registrada {0}", Environment.NewLine);

            }
            if (NombreUsuario > 0)
            {
                Resultado += String.Format(" (x)Este nombre de usuario ya se encuentra registrado {0}", Environment.NewLine);
            }
            Conexion.Close();
            if ((Identificacion + NombreUsuario) == 0)
            {
                cmd = new SqlCommand("if not exists(Select identificacion from Persona where Identificacion=@Identificacion)begin insert into Persona (nombre, apellido, correo, telefono, identificacion) values (@nombre, @apellido, @correo, @telefono, @identificacion); end", Conexion);
                //SqlParameter parametro;
                SqlParameter parametroPersona;
                parametroPersona = new SqlParameter("@nombre", persona.nombre);
                cmd.Parameters.Add(parametroPersona);

                parametroPersona = new SqlParameter("@apellido", persona.apellido);
                cmd.Parameters.Add(parametroPersona);

                parametroPersona = new SqlParameter("@correo", persona.correo);
                cmd.Parameters.Add(parametroPersona);

                parametroPersona = new SqlParameter("@telefono", persona.telefono);
                cmd.Parameters.Add(parametroPersona);

                parametroPersona = new SqlParameter("@identificacion", persona.identificacion);
                cmd.Parameters.Add(parametroPersona);

                int personaInsertada;

                Conexion.Open();
                personaInsertada = (int)cmd.ExecuteNonQuery();
                Conexion.Close();

                if (personaInsertada == 1)
                {
                    cmd = new SqlCommand(String.Format("Select id from Persona where Identificacion='{0}'", persona.identificacion), Conexion);
                    Conexion.Open();
                    int ID = (int)cmd.ExecuteScalar();
                    Conexion.Close();
                    cmd = new SqlCommand(String.Format("INSERT INTO Usuario(nombreUsuario, contrasenna, idRoll, estado, idPersona)VALUES('{0}', hashbytes('MD5','{1}'), {2}, {3}, {4})", usuario.NombreUsuario, usuario.Contrasenna, usuario.idRol, usuario.estado, ID), Conexion);
                    Conexion.Open();
                    personaInsertada += cmd.ExecuteNonQuery();
                    if (personaInsertada == 2)
                    {
                        Resultado = String.Format( "{0} registrada correctamente {2}Usuario {1} asignado correctamente",persona.nombre, usuario.NombreUsuario, Environment.NewLine);
                    }
                    Conexion.Close();
                }
            }
            return Resultado;
        }


        public Usuario ObtenerUsuario()
        {
            return us;
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

        public string ObtenerCorreo(int v)
        {
            SqlCommand cmd = new SqlCommand(string.Format("Select correo from Usuario b inner join Persona c on b.idPersona=c.id where b.id='{0}'",v), Conexion);
            Conexion.Open();
            String correo= (string)cmd.ExecuteScalar();
            Conexion.Close();
            return correo;
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
        { string pass = "";
            if (contrasenna.Length > 0) {
                pass = string.Format("contrasenna=hashbytes('MD5','{0}'),",contrasenna);
            }
            SqlCommand cmd = new SqlCommand(String.Format(String.Format("UPDATE Usuario SET nombreUsuario='{1}',{0}  idRoll={2}, estado={3}, idPersona={4} WHERE id={5}",pass,nombreUsuario,idRoll,estado,idPersona,id)), Conexion);

            Conexion.Open();
            int i=cmd.ExecuteNonQuery();
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

                    command.CommandText = string.Format("Select id,nombreUsuario,contrasenna,idRoll,estado,idPersona  from Usuario where nombreUsuario='{0}' and contrasenna=HASHBYTES('MD5','{1}')", user, pass);
                    command.CommandType = CommandType.Text;
                    DataTable dataTable = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    // this will query your database and return the result to your datatable
                    da.Fill(dataTable);
                    Conexion.Close();
                    da.Dispose();
                    if (dataTable.Rows.Count > 0)
                    {
                        us = (from rw in dataTable.AsEnumerable()
                              select new Usuario()
                              {
                                  id = Convert.ToInt32(rw["id"]),
                                  NombreUsuario = Convert.ToString(rw["nombreUsuario"]),
                                  Contrasenna = Convert.ToString(rw["contrasenna"]),
                                  idRol = Convert.ToInt32(rw["idRoll"]),
                                  estado = Convert.ToInt32(rw["estado"]),
                                  idPersona = Convert.ToInt32(rw["idPersona"])
                              }).ToList().First<Usuario>();
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
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


































