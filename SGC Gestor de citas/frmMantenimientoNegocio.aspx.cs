using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmMantenimientoNegocio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        public void limpiarDatos()
        {
            txtDescripcion.Text = "";
            txtMision.Text = "";
            txtVision.Text = "";
            txtNombreNegocio.Text = "";
            FileUpload1.Dispose();

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }
    }
}