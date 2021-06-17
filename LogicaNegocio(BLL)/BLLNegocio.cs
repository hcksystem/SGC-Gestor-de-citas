using AccesoDatos_DAL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaDeNegocio_BLL_
{
    public class BLLNegocio
    {
        public void InsertarNegocio(string Nombre, byte[] Logo, string Descripcion, string Mision, string Vision)
        {
            DALNegocio daln = new DALNegocio();
            daln.InsertarNegocio(Nombre, Logo, Descripcion, Mision, Vision);
        }
        public void ModificarNegocio(int ID, string Nombre, byte[] Logo, string Descripcion, string Mision, string Vision)
        {
            DALNegocio daln = new DALNegocio();
            daln.ModificarNegocio(ID, Nombre, Logo, Descripcion, Mision, Vision);
        }
        public DataTable ObtenerNegocioPorID(int Identificacion)
        {
            DALNegocio daln = new DALNegocio();
            return daln.ObtenerNegocioPorID(Identificacion);
        }
        public DataTable ObtenerTodosLosNegocios()
        {
            DALNegocio daln = new DALNegocio();
            return daln.ObtenerTodosLosNegocio();
        }


        public void EliminarNegocio(int Identificacion)
        {
            DALNegocio daln = new DALNegocio();
            daln.EliminarNegocio(Identificacion);
        }
    }
}
