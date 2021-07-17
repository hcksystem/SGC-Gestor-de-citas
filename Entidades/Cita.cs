using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Cita
    {
        public int id { get; set; }
        public string descripcion { get; set; }
        public int estado { get; set; }
        public int idServicio { get; set; }
        public int idUsuario { get; set; }
        public string Fecha { get; set; }
        public string Hora { get; set; }

    }
}