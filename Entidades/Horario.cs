using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Horario
    {
        public int id { get; set; }
        public DateTime fechaAtencion { get; set; }
        public DateTime inicioAtencion { get; set; }
        public DateTime finAtencion { get; set; }
        public int estado { get; set; }
    }
}