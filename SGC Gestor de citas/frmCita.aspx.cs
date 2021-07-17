using LogicaDeNegocio_BLL_;
using System;
using System.Collections.Generic;
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
            
        }
        public List<Entidades.Servicio> listaServicios_GetData()
        {
            BLLServicio blls = new BLLServicio();
            return blls.ObtenerTodosServiciosLista();


        }

        protected void btnReservar_Command(object sender, CommandEventArgs e)
        {
            cn.Open();
            int id = int.Parse(e.CommandArgument.ToString());
            Session["IdServicio"] = id;
            Response.Redirect("frmCitaHorario.aspx?id=" + id);
            cn.Close();
        }
    }
}