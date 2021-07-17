using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Servicio
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public double PrecioEstimado { get; set; }
        public int Duracion { get; set; }
        public String FotoSugerida { get; set; }
        public int Estado { get; set; }
        public int idNegocio { get; set; }
        public int idProducto { get; set; }
    }
}
