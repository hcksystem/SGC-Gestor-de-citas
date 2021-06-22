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
        public void InsertarCita(string Descripcion, DateTime Fecha, DateTime Hora, bool Activo, int idServicio, int idUsuario)
        {
            DALCita daln = new DALCita();
            daln.InsertarCita(Descripcion, Fecha, Hora, Activo, idServicio, idUsuario);
        }
        public void ModificarCita(int id,string Descripcion, DateTime Fecha, DateTime Hora, bool Activo, int idServicio, int idUsuario)
        {
            DALCita daln = new DALCita();
            daln.ModificarCita(id,Descripcion,Fecha,Hora,Activo,idServicio,idUsuario);
        }

        public DataTable ObtenerTodaLasCitas()
        {
            DALCita daln = new DALCita();
            return daln.ObtenerTodasLasCitas();
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
