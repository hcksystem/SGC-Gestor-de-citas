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
        public void InsertarUsuario(string correoUsuario, string Telefono, string Contrasenna, int idRoll)
        {
            DALUsuario dalu = new DALUsuario();
            dalu.InsertarUsuario(correoUsuario, Telefono, Contrasenna, idRoll);
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
        public void ModificarUsuario(int ID, string Correo, string Telefono, string Contrasenna, int idRoll)
        {
            DALUsuario daln = new DALUsuario();
            daln.Modificar(ID, Correo, Telefono, Contrasenna, idRoll);
        }
        public DataTable ObtenerUsuarioPorCorreo(string correo)
        {
            DALUsuario dalu = new DALUsuario();
            return dalu.ObtenerUsuarioPorCorreo(correo);
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
