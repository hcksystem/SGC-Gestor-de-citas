using AccesoDatos_DAL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocio_BLL_
{
    public class BLLCategoria
    {
        public DataTable ObtenerTodasCategorias()
        {
            DALCategoria daln = new DALCategoria();
            return daln.ObtenerTodasLasCategorias();
        }

        public DataTable ObtenerRolesPorID(int Identificacion)
        {
            DALCategoria daln = new DALCategoria();
            return daln.ObtenerCategoriaPorID(Identificacion);
        }
        public DataTable ObtenerCategoriaPorID(int Identificacion)
        {
            DALCategoria daln = new DALCategoria();
            return daln.ObtenerCategoriaPorID(Identificacion);
        }
        public void InsertarCategoria(string descripcion)
        {
            DALCategoria daln = new DALCategoria();
            daln.InsertarCategoria(descripcion);
        }

        public void EliminarCategoria(int Identificacion)
        {
            DALCategoria daln = new DALCategoria();
            daln.EliminarCategoria(Identificacion);
        }
        public void ModificarCategoria(int ID, string Descripcion)
        {
            DALCategoria daln = new DALCategoria();
            daln.ModificarCategoria(ID, Descripcion);
        }
    }
}


