using AccesoDatos_DAL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaDeNegocio_BLL_
{
    public class BLLRol
    {
        public DataTable ObtenerTodosRoles()
        {
            DALRol daln = new DALRol();
            return daln.ObtenerTodosLosRoles();
        }

        public DataTable ObtenerRolesPorID(int Identificacion)
        {
            DALRol daln = new DALRol();
            return daln.ObtenerRolPorID(Identificacion);
        }
    }
}
