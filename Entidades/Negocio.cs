using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Negocio
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public byte[] Logo { get; set; }
        public string Descripcion { get; set; }
        public string Mision { get; set; }
        public string Vision { get; set; }
    }
}
