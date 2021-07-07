using AccesoDatos_DAL_;
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
        public void InsertarUsuario(string nombreUsuario, string Contrasenna, int idRoll, int Estado, int idPersona)
        {
            DALUsuario dalu = new DALUsuario();
            dalu.InsertarUsuario(nombreUsuario, Contrasenna, idRoll, Estado, idPersona);
        }

        public DataTable ObtenerTodosLosUsuarios()
        {
            DALUsuario dalu = new DALUsuario();
            return dalu.ObtenerTodosUsuarios();
        }

        public void EliminarUsuario(int Identificacion)
        {
            DALUsuario dalu = new DALUsuario();
            dalu.Eliminar(Identificacion);
        }

        public DataTable ObtenerUsuarioPorID(int Identificacion)
        {
            DALUsuario dalu = new DALUsuario();
            return dalu.ObtenerUsuarioPorId(Identificacion);
        }

        public void ModificarUsuario(int ID, string nombreUsuario, string Contrasenna, int idRoll, int estado, int idPersona)
        {
            DALUsuario daln = new DALUsuario();
            daln.Modificar(ID, nombreUsuario, Contrasenna, idRoll, estado, idPersona);
        }

        public DataTable ObtenerUsuarioPorNombreUsuario(string nombreUsuario)
        {
            DALUsuario dalu = new DALUsuario();
            return dalu.ObtenerUsuarioPorNombreUsuario(nombreUsuario);
        }

        public bool VerificarLogin(string user, string pass)
        {
            DALUsuario dalu = new DALUsuario();
            return dalu.Login(user, pass);
        }

        public bool Roles()
        {
            DALUsuario dalu = new DALUsuario();
            return dalu.Roles(); ;
        }

        public string SHA256(string texto)
        {
            DALUsuario dalU = new DALUsuario();
            return dalU.GetSHA256(texto);
        }



    }
}