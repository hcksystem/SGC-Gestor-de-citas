using AccesoDatos_DAL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaDeNegocio_BLL_
{
    public class BLLServicio
    {
        public void InsertarServicio(string Nombre, string Descripcion, double PrecioEstimado, DateTime TiempoEstimado, byte[] FotoSugerida, int Estado, int idProducto, int idNegocio)
        {
            DALServicio dals = new DALServicio();
            dals.InsertarServicio(Nombre, Descripcion, PrecioEstimado, TiempoEstimado, FotoSugerida, Estado, idProducto, idNegocio);
        }
        
        public void ModificarServicio(int ID, string Nombre, string Descripcion, double PrecioEstimado, DateTime TiempoEstimado, byte[] FotoSugerida, int Estado, int idProducto, int idNegocio)
        {
            DALServicio dals = new DALServicio();
            dals.ModificarServicio(ID, Nombre, Descripcion, PrecioEstimado, TiempoEstimado, FotoSugerida, Estado, idProducto, idNegocio);
        }
        
        public DataTable ObtenerServicioPorID(int Identificacion)
        {
            DALServicio dals = new DALServicio();
            return dals.ObtenerServicioPorID(Identificacion);
        }
        public DataTable ObtenerTodosLosServicios()
        {
            DALServicio dals = new DALServicio();
            return dals.ObtenerTodosLosServicios();
        }
        public void CambiarEstadoServicio(int id)
        {
            DALServicio dalp = new DALServicio();
            dalp.CambiarEstadoServicio(id);
        }
        public DataTable ObtenerTodosLosServiciosActivos()
        {
            DALServicio dalp = new DALServicio();
            return dalp.ObtenerTodosLosServiciosActivos();
        }
        public void EliminarServicio(int Identificacion)
        {
            DALServicio dals = new DALServicio();
            dals.EliminarServicio(Identificacion);
        }
    }
}


