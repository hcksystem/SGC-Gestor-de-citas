using AccesoDatos_DAL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocio_BLL_
{
    public class BLLHorario
    {
        public void InsertarHorario(DateTime fechaAtencion, DateTime inicioAtencion, DateTime finAtencion, int estado)
        {
            DALHorario daln = new DALHorario();
            daln.InsertarHorario(fechaAtencion, inicioAtencion, finAtencion, estado);
        }
        public void ModificarHorario(int ID, DateTime fechaAtencion, DateTime inciioAtencion, DateTime finAtencion, int estado)
        {
            DALHorario daln = new DALHorario();
            daln.ModificarHorario(ID, fechaAtencion, inciioAtencion, finAtencion, estado);
        }

        public DataTable ObtenerHorarioPorID(int Identificacion)
        {
            DALHorario daln = new DALHorario();
            return daln.ObtenerHorarioPorID(Identificacion);
        }
        public DataTable ObtenerTodosLosHorarios()
        {
            DALHorario daln = new DALHorario();
            return daln.ObtenerTodosLosHorarios();
        }
        public void EliminarHorario(int Identificacion)
        {
            DALHorario daln = new DALHorario();
            daln.EliminarHorario(Identificacion);
        }

        public DataTable ObtenerTodosLosHorariosDisponibles()
        {
            DALHorario daln = new DALHorario();
            return daln.ObtenerHorarioDisponible();
        }

        public DataTable ObtenerTodosLosHorariosReservados()
        {
            DALHorario daln = new DALHorario();
            return daln.ObtenerHorarioReservado();
        }
    }
}





