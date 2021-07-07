using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos_DAL_
{
    public class DALHorario : DALBase
    {
        public void InsertarHorario(DateTime fechaAtencion, DateTime InicioAtencion, DateTime FinAtencion, int Estado)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Horarios (fechaAtencion, inicioAtencion, finAtencion, estado) VALUES (@fechaAtencion, @inicioAtencion, @finAtencion, @estado)", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@fechaAtencion", fechaAtencion);
            parametro.DbType = DbType.Date;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@inicioAtencion", InicioAtencion);
            parametro.DbType = DbType.Time;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@finAtencion", FinAtencion);
            parametro.DbType = System.Data.DbType.Time;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", Estado);
            parametro.DbType = System.Data.DbType.Int32;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }

        public DataTable ObtenerHorarioPorID(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, fechaAtencion, inicioAtencion, finAtencion, estado FROM Horario WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public DataTable ObtenerTodosLosHorarios()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, fechaAtencion, inicioAtencion, finAtencion, estado FROM Horario", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void EliminarHorario(int Identificacion)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Horario WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }

        public void ModificarHorario(int ID, DateTime fechaAtencion, DateTime inicioAtencion, DateTime finAtencion, int estado)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Horario SET id = @id, fechaAtencion = @fechaAtencion, inicioAtencion = @inicioAtencion, finAtencion = @finAtencion, estado=@estado WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", ID);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@fechaAtencion", fechaAtencion);
            parametro.DbType = DbType.Date;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@inicioAtencion", inicioAtencion);
            parametro.DbType = DbType.Time;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@finAtencion", finAtencion);
            parametro.DbType = DbType.Time;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", estado);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }

        public DataTable ObtenerHorarioDisponible()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, fechaAtencion, inicioAtencion, finAtencion, estado FROM Horario WHERE estado = '1' ", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public DataTable ObtenerHorarioReservado()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, fechaAtencion, inicioAtencion, finAtencion, estado FROM Horario WHERE estado = '2' ", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
    }
}























