using AccesoDatos_DAL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaDeNegocio_BLL_
{
    public class BLLProducto
    {
        public void InsertarProducto(string Nombre, string Categoria, string Descripcion, int Cantidad, string Proposito, double Precio, bool Estado)
        {
            DALProducto dalp = new DALProducto();
            dalp.InsertarProducto(Nombre, Categoria, Descripcion, Cantidad, Proposito, Precio, Estado);
        }
        public void ModificarProducto(int ID, string Nombre, string Categoria, string Descripcion, int Cantidad, string Proposito, double Precio, bool Estado)
        {
            DALProducto dalp = new DALProducto();
            dalp.Modificar(ID, Nombre, Categoria, Descripcion, Cantidad, Proposito, Precio, Estado);
        }
        public DataTable ObtenerPorID(int Identificacion)
        {
            DALProducto dalp = new DALProducto();
            return dalp.ObtenerProductoPorID(Identificacion);
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
