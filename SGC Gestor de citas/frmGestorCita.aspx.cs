using LogicaNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmGestorCita : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarDatos();
        }

        private void CargarDatos()
        {
            try
            {
                BLLCita bllc = new BLLCita();
                DataTable dt = bllc.ObtenerTodaLasCitas();
                gridCita.DataSource = dt;
                gridCita.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
            



        }

        protected void btnIrgestion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Calendario.aspx");
        }
    }
}