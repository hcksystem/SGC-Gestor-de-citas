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
        public void InsertarCita(string Descripcion, int Estado, int idServicio, int idUsuario, int idCliente, int idHorario)
        {
            DALCita daln = new DALCita();
            daln.InsertarCita(Descripcion, Estado, idServicio, idUsuario, idCliente, idHorario);
        }

        public void ModificarCita(int id, string Descripcion, int Estado, int idServicio, int idUsuario, int idCliente, int idHorario)
        {
            DALCita daln = new DALCita();
            daln.ModificarCita(id, Descripcion, Estado, idServicio, idUsuario, idCliente, idHorario);
        }

        public DataTable ObtenerTodaLasCitas()
        {
            DALCita daln = new DALCita();
            return daln.ObtenerTodasLasCitas();
        }

        public void CambiarEstadoCita(int id)
        {
            DALCita dalp = new DALCita();
            dalp.CambiarEstadoCita(id);
        }

        public DataTable ObtenerTodasLasCitasActivas()
        {
            DALCita dalp = new DALCita();
            return dalp.ObtenerTodasLasCitasActivos();
        }

        public DataTable ObtenerCitaPorID(int Identificacion)
        {
            DALCita daln = new DALCita();
            return daln.ObtenerCitaPorID(Identificacion);
        }

        public void EliminarCita(int Identificacion)
        {
            DALCita daln = new DALCita();
            daln.EliminarCita(Identificacion);
        }

        public void CancelarCita(int ID)
        {
            DALCita dalc = new DALCita();
            dalc.CancelarCita(ID);
        }
    }
}






