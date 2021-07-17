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
    public class BLLNegocio
    {
        public void InsertarNegocio(string Nombre, byte[] Logo, string Descripcion, string Mision, string Vision)
        {
            DALNegocio daln = new DALNegocio();
            daln.InsertarNegocio(Nombre, Logo, Descripcion, Mision, Vision);
        }
        public void ModificarNegocio(int ID, string Nombre, byte[] Logo, string Descripcion, string Mision, string Vision)
        {
            DALNegocio daln = new DALNegocio();
            daln.ModificarNegocio(ID, Nombre, Logo, Descripcion, Mision, Vision);
        }
        public void ModificarNegocioSinImagen(int ID, string Nombre, string Descripcion, string Mision, string Vision)
        {
            DALNegocio daln = new DALNegocio();
            daln.ModificarNegocioSinImagen(ID, Nombre, Descripcion, Mision, Vision);
        }
        public DataTable ObtenerNegocioPorID(int Identificacion)
        {
            DALNegocio daln = new DALNegocio();
            return daln.ObtenerNegocioPorID(Identificacion);
        }
        public DataTable ObtenerTodosLosNegocios()
        {
            DALNegocio daln = new DALNegocio();
            return daln.ObtenerTodosLosNegocio();
        }

        public List<Negocio> ObtenerTodosNegociosLista()
        {

            List<Negocio> lista = new List<Negocio>();
            DataSet ds = DALNegocio.SeleccionarTodosNegociosLista();

            foreach (DataRow fila in ds.Tables[0].Rows)
            {
                Negocio registro = new Negocio();

                registro.ID = Convert.ToInt16(fila["id"]);
                registro.Nombre = fila["nombre"].ToString();
                registro.Logo = (byte[])fila["logo"];
                registro.Descripcion = fila["descripcion"].ToString();
                registro.Nombre = fila["mision"].ToString();
                registro.Nombre = fila["vision"].ToString();
                lista.Add(registro);
            }
            return lista;
        }
        public void EliminarNegocio(int Identificacion)
        {
            DALNegocio daln = new DALNegocio();
            daln.EliminarNegocio(Identificacion);
        }
    }
}
