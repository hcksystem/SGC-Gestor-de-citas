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
        public void InsertarCita(string Descripcion, int estado, int idServicio, int idUsuario, int idCliente, int idHorario)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Cita (descripcion, estado, idServicio, idUsuario, idCliente, idHorario) VALUES (@descripcion, @estado, @idServicio, @idUsuario, @idCliente, @Horario)", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@descripcion", Descripcion);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", estado);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idServicio", idServicio);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idUsuario", idUsuario);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idCliente", idCliente);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idHorario", idHorario);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }

        public DataTable ObtenerTodasLasCitas()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, descripcion, esado, idServicio, idUsuario. idCliente, idHorario FROM Cita", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public DataTable ObtenerTodasLasCitasActivos()
        {
            DataTable dt = new DataTable();//en este select toca corregir el numero que tenga el estado de activo en el enum, tambien se puede variar para cambiar los id de las cosas por los nombres
            SqlCommand cmd = new SqlCommand("SELECT id, descripcion, estado, idServicio, idUsuario, idCliente, idHorario FROM Cita WHERE estado = '1'", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void CambiarEstadoCita(int id)
        {
            //En este punto tambien se puede hacer la correcion o verificacion de cual numero es el enum para inactiva o lo que sea

            SqlCommand cmd = new SqlCommand("UPDATE Cita SET estado = '2' where id=@id", Conexion);
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
            SqlCommand cmd = new SqlCommand("SELECT id, descripcion, estado, idServicio, idUsuario, idCliente, idHorario FROM Cita WHERE id = @id", Conexion);
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
            cit.estado = 2;
        }

        public void ModificarCita(int ID, string Descripcion, int estado, int idServicio, int idUsuario, int idCliente, int idHorario)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Cita SET descripcion = @descripcion, estado = @estado, idServicio = @idServicio, idUsuario=@idUsuario idCliente=@idCliente, idHorario=@idHorario WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", ID);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", Descripcion);
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", estado);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idServicio", idServicio);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idUsuario", idUsuario);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idCliente", idCliente);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idHorario", idHorario);
            parametro.DbType = System.Data.DbType.Int16;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();



        }
    }
}
