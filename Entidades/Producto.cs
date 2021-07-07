using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Producto
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public int idCategoria { get; set; }
        public string Descripcion { get; set; }

        public string Proposito { get; set; }
        public double Precio { get; set; }
        public int Estado { get; set; }
    }
}
