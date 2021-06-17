using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        public int id { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }

        public string Contrasenna { get; set; }
        public int idRol { get; set; }
    }
}
