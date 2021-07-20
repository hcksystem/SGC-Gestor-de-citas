using AccesoDatos_DAL_;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaDeNegocio_BLL_
{
    public class BLLUsuario
    {
            DALUsuario dalu = new DALUsuario();
        public void InsertarUsuario(Persona persona, Usuario usuario)
        {
            dalu.InsertarUsuario(persona, usuario);
        }

        public DataTable ObtenerTodosLosUsuarios()
        {
            return dalu.ObtenerTodosUsuarios();
        }
        public DataTable ObtenerTodosLosUsuariosActivos()
        {
            return dalu.ObtenerTodosLosUsuariosActivos();
        }
        public void CambiarEstadoUsuario(int id)
        {
            dalu.CambiarEstadoUsuario(id);
        }

        public void EliminarUsuario(int Identificacion)
        {
            dalu.Eliminar(Identificacion);
        }

        public DataTable ObtenerUsuarioPorID(int Identificacion)
        {
            return dalu.ObtenerUsuarioPorId(Identificacion);
        }

        public void ModificarUsuario(int ID, string nombreUsuario, string Contrasenna, int idRoll, int estado, int idPersona)
        {
            dalu.Modificar(ID, nombreUsuario, Contrasenna, idRoll, estado, idPersona);
        }

        public Usuario ObtenerUsuario()
        {
            return dalu.ObtenerUsuario();
        }

        public bool VerificarLogin(string user, string pass)
        {
            return dalu.Login(user, pass);
        }

        public bool Roles()
        {
            return dalu.Roles(); ;
        }

        public string SHA256(string texto)
        {
            return dalu.GetSHA256(texto);
        }

    }
}