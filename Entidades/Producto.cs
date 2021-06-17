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
        public string Categoria { get; set; }
        public string Descripcion { get; set; }
        public int Cantidad { get; set; }
        public string Proposito { get; set; }
        public double Precio { get; set; }
        public bool Estado { get; set; }
    }
}
