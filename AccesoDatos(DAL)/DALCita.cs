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
    public class DALCita : DALBase
    {
        public void InsertarCita(string Descripcion, DateTime Fecha, DateTime Hora, bool Activo, int idServicio, int idUsuario)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Cita (Descripcion, Fecha, Hora, Activo, idServicio, idUsuario) VALUES (@descripcion, @fecha, @hora, @activo, @idServicio, @idUsuario)", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@descripcion", Descripcion);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@fecha", Fecha);
            parametro.DbType = System.Data.DbType.DateTime;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@hora", Hora);
            parametro.DbType = System.Data.DbType.DateTime;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@activo", Activo);
            parametro.DbType = System.Data.DbType.Boolean;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idServicio", idServicio);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idUsuario", idUsuario);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }

        public DataTable ObtenerTodasLasCitas()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, descripcion, fecha, hora, activo, idServicio, idUsuario FROM Cita", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public DataTable ObtenerTodasLasCitasActivos()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, descripcion, fecha, hora, activo, idServicio, idUsuario FROM Cita WHERE activo = 'true'", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void CambiarEstadoCita(int id)
        {

            SqlCommand cmd = new SqlCommand("UPDATE Cita SET activo = 'false' where id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            cmd.Parameters.Add(parametro);
            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }
        public DataTable ObtenerCitaPorID(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, descripcion, fecha, hora, activo, idServicio, idUsuario FROM Cita WHERE id = @id", Conexion);
            SqlParameter parametro;
            parametro = new SqlParameter("@id", Identificacion);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public void EliminarCita(int Identificacion)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Cita WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }
        public void CancelarCita(int ID)
        {
            Cita cit = new Cita();
            cit.id = ID;
            cit.Activo = false;
        }

        public void ModificarCita(int ID, string Descripcion, DateTime Fecha, DateTime Hora, bool Activo, int idServicio, int idUsuario)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Cita SET descripcion = @descripcion, fecha = @fecha, hora = @hora, activo = @activo, idServicio = @idServicio, idUsuario=@idUsuario WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", ID);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", Descripcion);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@fecha", Fecha);
            parametro.DbType = System.Data.DbType.DateTime;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@hora", Hora);
            parametro.DbType = System.Data.DbType.DateTime;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@activo", Activo);
            parametro.DbType = System.Data.DbType.Boolean;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idServicio", idServicio);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idUsuario", idUsuario);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }
    }
}
