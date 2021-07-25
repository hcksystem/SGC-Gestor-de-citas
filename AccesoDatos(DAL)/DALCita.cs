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
        public string InsertarCita(string Descripcion, int estado, int idServicio, int idUsuario,string Fecha , string Hora)
        {
            SqlCommand cmd = new SqlCommand(string.Format("SP_RegistrarCita '{0}','{1}','{2}','{3}','{4}'",Descripcion,idServicio,idUsuario,Fecha,Hora), Conexion);
            Conexion.Open();
            string result=(string)cmd.ExecuteScalar();
            Conexion.Close();
            return result;
        }

        public DataTable ObtenerHorarioDisponible(String Fecha)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand(String.Format("set dateformat dmy;Select * from FNCalcularDisponibilidad('{0}')",Fecha), Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public DataTable ObtenerMisCitas(int iDUsuario,int Tipo)
        {
            DataTable dt = new DataTable();
            string val = "";
            if (Tipo != 0) {
                val = String.Format("and a.estado={0}", Tipo);
            }
            SqlCommand cmd = new SqlCommand(string.Format("SELECT a.id, a.descripcion, a.estado,b.nombre[idServicio], idUsuario, Fecha, Hora FROM Cita a inner join Servicio b on a.idServicio=b.id where idUsuario={0} {1} ", iDUsuario, val), Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public DataTable ObtenerTodasLasCitas()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, descripcion, estado, idServicio, idUsuario, Fecha, Hora FROM Cita", Conexion);
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
            SqlCommand cmd = new SqlCommand("Update a set Estado=2 FROM Cita a WHERE id = @id", Conexion);
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
