using AccesoDatos_DAL_;
using Entidades;
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
            DALServicio dals = new DALServicio();
        public String GuardarServicio(int  idServicio,string Nombre, string Descripcion, int idProducto, double PrecioEstimado, int Duracion, String FotoSugerida, int Estado, int idNegocio)
        {
           String mensaje= dals.GuardarServicio(idServicio,Nombre, Descripcion, idProducto, PrecioEstimado, Duracion, FotoSugerida, Estado, idNegocio);
            return mensaje;
        }
        
        public void ModificarServicio(int ID, string Nombre, string Descripcion, double PrecioEstimado, DateTime TiempoEstimado, byte[] FotoSugerida, int Estado, int idProducto, int idNegocio)
        {
            dals.ModificarServicio(ID, Nombre, Descripcion, PrecioEstimado, TiempoEstimado, FotoSugerida, Estado, idProducto, idNegocio);
        }
        public void ModificarServicioSinFoto(int ID, string Nombre, string Descripcion, double PrecioEstimado, DateTime TiempoEstimado, int Estado, int idProducto, int idNegocio)
        {
            dals.ModificarServicioSinFoto(ID, Nombre, Descripcion, PrecioEstimado, TiempoEstimado, Estado, idProducto, idNegocio);
        }

        public DataTable ObtenerServicioPorID(int Identificacion)
        {
            return dals.ObtenerServicioPorID(Identificacion);
        }
        public DataTable ObtenerTodosLosServicios()
        {
            return dals.ObtenerTodosLosServicios();
        }
        public DataTable ObtenerTodosLosServiciosInactivos()
        {
            return dals.ObtenerTodosLosServiciosInactivos();
        }
        public void CambiarEstadoServicio(int id)
        {
            dals.CambiarEstadoServicio(id);
        }
        public void ActivarServicio(int id)
        {
            dals.ActivarServicio(id);
        }
        public DataTable ObtenerTodosLosServiciosActivos()
        {
            return dals.ObtenerTodosLosServiciosActivos();
        }

        public List<Servicio> ObtenerTodosServiciosLista()
        {
            
            List<Servicio> lista = new List<Servicio>();
            DataSet ds = DALServicio.SeleccionarTodosServiciosLista();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Servicio registro = new Servicio();

                registro.ID = Convert.ToInt16(fila["id"]);
                registro.Nombre = fila["nombre"].ToString();
                registro.Descripcion = fila["descripcion"].ToString();
                registro.Duracion = Convert.ToInt32(fila["Duracion"]);
                registro.FotoSugerida = (fila["fotoSugerida"]).ToString();
                registro.Estado = Convert.ToInt16(fila["estado"]);
                registro.idNegocio = Convert.ToInt32(fila["idNegocio"]);
                registro.PrecioEstimado = Convert.ToInt32(fila["precioEstimado"]);
                lista.Add(registro);
            }
            return lista;
        }
        public void EliminarServicio(int Identificacion)
        {
            dals.EliminarServicio(Identificacion);
        }

        public bool TieneImagen(int ID)
        {
           return  dals.TieneImagen(ID);
        }

        public string Imagen(int v)
        {
            return dals.Imagen(v);
        }
    }
}


