using LogicaDeNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmCita : System.Web.UI.Page
    {
        
        public SqlConnection cn = new SqlConnection("Data Source =.; Initial Catalog = SolucionesSGC; User ID = sa; Password=123456");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null)
            {
                Response.Redirect("frmLogin.aspx");
            }
        }
        public List<Entidades.Servicio> listaServicios_GetData()
        {
            BLLServicio blls = new BLLServicio();
            return blls.ObtenerTodosServiciosLista();


        }

        protected void btnReservar_Command(object sender, CommandEventArgs e)
        {
            
            cn.Open();
            BLLServicio blls = new BLLServicio();
            
            int id = int.Parse(e.CommandArgument.ToString());
           DataTable dt = blls.ObtenerServicioPorID(id);
            string nombre = dt.Rows[0]["nombre"].ToString();
            Session["IdServicio"] = id;
            Session["NombreServicio"] = nombre;
            Response.Redirect("frmCitaHorario.aspx?id=" + id);
            cn.Close();
        }
    }
}