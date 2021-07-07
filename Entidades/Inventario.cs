using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Inventario
    {
        public int id { get; set; }
        public int idProducto { get; set; }
        public int cantidad { get; set; }
        public string descripcion { get; set; }
    }
}