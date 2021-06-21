using LogicaDeNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              //Invoca al metodo cargar datos
                CargarDatos();
            
        }

        private void CargarDatos()
        {
            try
            {
                //Carga los datos de servicio desde la base de datos 
                BLLServicio bllc = new BLLServicio();
                DataTable dt = bllc.ObtenerTodosLosServicios();
                dropServicio.DataSource = dt;
                dropServicio.DataTextField = "nombre";
                dropServicio.DataValueField = "id";
                dropServicio.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            //Redirecciona a pagina gestor cita
            Response.Redirect("frmGestorCita.aspx");
        }

        protected void btnReservar_Click(object sender, EventArgs e)
        {

        }
    }
}