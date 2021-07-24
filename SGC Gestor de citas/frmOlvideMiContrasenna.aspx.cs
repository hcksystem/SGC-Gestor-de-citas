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
    public partial class frmOlvideMiContrasenna : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string recuperarContrasenna()
        {
            string a = "";

            return a;
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }

        protected void btnSolicitarContrasenna_Click(object sender, EventArgs e)
        {
            BLLPersona bllp = new BLLPersona();
            DataTable dt =bllp.ObtenerPersonaPorCorreo(txtCorreo.Text);
            
            
        }
    }
}