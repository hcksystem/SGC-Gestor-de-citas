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
    }
}


