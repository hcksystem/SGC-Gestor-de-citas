using AccesoDatos_DAL_;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocio_BLL_
{
    public static class BLLFactura
    {
        static DALFactura dalf = new DALFactura();
        public static string InsertarFactura(Factura factura)
        {
            return dalf.InsertarFactura(factura);
        }
    }
}
