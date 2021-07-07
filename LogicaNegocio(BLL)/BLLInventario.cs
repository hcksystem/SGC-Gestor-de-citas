using AccesoDatos_DAL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocio_BLL_
{

    public class BLLInventario
    {
        public void InsertarInventario(int idProducto, int Cantidad, string Descripcion)
        {
            DALInventario daln = new DALInventario();
            daln.InsertarInventario(idProducto, Cantidad, Descripcion);
        }
        public void ModificarInventario(int ID, int idProducto, int Cantidad, string Descripcion)
        {
            DALInventario daln = new DALInventario();
            daln.ModificarInventario(ID, idProducto, Cantidad, Descripcion);
        }
        public DataTable ObtenerInventarioPorID(int Identificacion)
        {
            DALInventario daln = new DALInventario();
            return daln.ObtenerInventarioPorID(Identificacion);
        }
        public DataTable ObtenerTodosLosInventarios()
        {
            DALInventario daln = new DALInventario();
            return daln.ObtenerTodosLosInventarios();
        }

        public void EliminarInventarios(int Identificacion)
        {
            DALInventario daln = new DALInventario();
            daln.EliminarInventario(Identificacion);
        }

    }
}



