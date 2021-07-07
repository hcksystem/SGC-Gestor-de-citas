﻿using AccesoDatos_DAL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocio_BLL_
{
    public class BLLPersona
    {
        public void InsertarPersona(string nombre, string apellido, string correo, string telefono, string Identificacion)
        {
            DALPersona dalu = new DALPersona();
            dalu.InsertarPersona(nombre, apellido, correo, telefono, Identificacion);
        }

        public DataTable ObtenerTodasLasPersonas()
        {
            DALPersona dalu = new DALPersona();
            return dalu.ObtenerTodasPersonas();
        }
        public void EliminarPersona(int Identificacion)
        {
            DALPersona dalu = new DALPersona();
            dalu.EliminarPersona(Identificacion);
        }
        public DataTable ObtenerPersonaPorID(int Identificacion)
        {
            DALPersona dalu = new DALPersona();
            return dalu.ObtenerPersonaPorId(Identificacion);
        }
        public void ModificarPersona(int ID, string nombre, string apellido, string correo, string telefono, string Identificacion)
        {
            DALPersona daln = new DALPersona();
            daln.Modificar(ID, nombre, apellido, correo, telefono, Identificacion);
        }

        public DataTable ObtenerPersonaPorCorreo(string correo)
        {
            DALPersona dalu = new DALPersona();
            return dalu.ObtenerPersonaPorCorreo(correo);
        }
    }
}



