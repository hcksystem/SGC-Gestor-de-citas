using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmLogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            ClientScript.RegisterStartupScript(
                                this.GetType(),
                                "Actualización",
                                 "mensajeRedirect('Sesión','Sesión finalizada con éxito','success','frmLogin.aspx')",
                                true
                                );

        }
    }
}