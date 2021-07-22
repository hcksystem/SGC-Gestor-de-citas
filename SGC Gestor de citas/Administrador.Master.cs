using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class Administrador : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                if (Convert.ToInt32(Session["Rol"]) != 1)
                {
                switch (Convert.ToInt32(Session["Rol"])) {
                        case 2:
                            Response.Redirect("frmMenuEmpleado.aspx");
                            break;
                        case 3:
                            Response.Redirect("frmMenuCliente.aspx");
                            break;
                }
                }
            }
        }
    }
}