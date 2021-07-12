using AccesoDatos_DAL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocio_BLL_
{

    public class BLLProducto
    {
        public void InsertarProducto(string Nombre, int idCategoria, string Descripcion, string Proposito, double Precio, int Estado)
        {
             DALProducto dalp = new DALProducto();
            dalp.InsertarProducto(Nombre, idCategoria, Descripcion, Proposito, Precio, Estado);
        }
        public void ModificarProducto(int ID, string Nombre, int idCategoria, string Descripcion, string Proposito, double Precio, int Estado)
        {
            DALProducto dalp = new DALProducto();
            dalp.Modificar(ID, Nombre, idCategoria, Descripcion, Proposito, Precio, Estado);
        }
        public DataTable ObtenerPorID(int Identificacion)
        {
            DALProducto dalp = new DALProducto();
            return dalp.ObtenerProductoPorID(Identificacion);
        }
        public DataTable ObtenerPorIDCategoria(int Identificacion)
        {
            DALProducto dalp = new DALProducto();
            return dalp.ObtenerProductoPorIDCategoria(Identificacion);
        }
        public void CambiarEstadoProducto(int id)
        {
            DALProducto dalp = new DALProducto();
            dalp.CambiarEstadoProducto(id);
        }
        public DataTable ObtenerTodosLosProductos()
        {
            DALProducto dalp = new DALProducto();
            return dalp.ObtenerTodosLosProductos();
        }
        public DataTable ObtenerTodosLosProductosActivosPorCategoria(int id)
        {
            DALProducto dalp = new DALProducto();
            return dalp.ObtenerTodosLosProductosActivosPorCategoria(id);
        }
        public DataTable ObtenerTodosLosProductosActivos()
        {
            DALProducto dalp = new DALProducto();
            return dalp.ObtenerTodosLosProductosActivos();
        }
        public void EliminarProducto(int Identificacion)
        {
            DALProducto dalp = new DALProducto();
            dalp.EliminarProducto(Identificacion);
        }
    }
}