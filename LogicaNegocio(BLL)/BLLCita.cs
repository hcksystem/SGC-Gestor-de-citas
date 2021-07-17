using AccesoDatos_DAL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocio_BLL_
{
    public class BLLCita
    {
            DALCita daln = new DALCita();
        public string InsertarCita(string Descripcion, int Estado, int idServicio, int idUsuario, string fecha, string hora)
        {
           return  daln.InsertarCita(Descripcion, Estado, idServicio, idUsuario, fecha, hora);
        }

        public void ModificarCita(int id, string Descripcion, int Estado, int idServicio, int idUsuario, int idCliente, int idHorario)
        {
            daln.ModificarCita(id, Descripcion, Estado, idServicio, idUsuario, idCliente, idHorario);
        }

        public DataTable ObtenerTodaLasCitas()
        {
            return daln.ObtenerTodasLasCitas();
        }

        public void CambiarEstadoCita(int id)
        {
            daln.CambiarEstadoCita(id);
        }

        public DataTable ObtenerTodasLasCitasActivas()
        {
            return daln.ObtenerTodasLasCitasActivos();
        }
        public DataTable ObtenerHorarioDisponible(String fecha)
        {
            return daln.ObtenerHorarioDisponible(fecha);
        }

        public DataTable ObtenerCitaPorID(int Identificacion)
        {
            return daln.ObtenerCitaPorID(Identificacion);
        }

        public void EliminarCita(int Identificacion)
        {
            daln.EliminarCita(Identificacion);
        }

        public void CancelarCita(int ID)
        { 
            daln.CancelarCita(ID);
        }
    }
}






