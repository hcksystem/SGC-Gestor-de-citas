﻿using AccesoDatos_DAL_;
using Entidades;
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
        public void InsertarProducto(Producto p, Inventario i)
        {
             DALProducto dalp = new DALProducto();
            dalp.InsertarProducto(p,i);
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
        public void ActivarProducto(int id)
        {
            DALProducto dalp = new DALProducto();
            dalp.ActivarProducto(id);
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
        public DataTable ObtenerTodosLosProductosInactivos()
        {
            DALProducto dalp = new DALProducto();
            return dalp.ObtenerTodosLosProductosInactivos();
        }
        public void EliminarProducto(int Identificacion)
        {
            DALProducto dalp = new DALProducto();
            dalp.EliminarProducto(Identificacion);
        }
    }
}