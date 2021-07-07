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
        public DateTime TiempoEstimado { get; set; }
        public byte[] FotoSugerida { get; set; }
        public int Estado { get; set; }
        public int idProducto { get; set; }
        public int idNegocio { get; set; }
    }
}
