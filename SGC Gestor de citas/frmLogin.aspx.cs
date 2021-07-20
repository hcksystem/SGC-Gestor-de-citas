using Entidades;
using LogicaDeNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmLogin : System.Web.UI.Page
    {
        //Creacion de instancia de usuario
        private Usuario us = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            BLLUsuario bllu = new BLLUsuario();


            if (bllu.VerificarLogin(txtNombreUsuario.Text, txtContrasennaInicio.Text) == true)
            {
                us = bllu.ObtenerUsuario();

                ClientScript.RegisterStartupScript(
                           this.GetType(),
                           us.NombreUsuario,
                            "mensajeRedirect('Bienvenido','Credenciales correctas','success')",
                           true
                           );
                switch (us.idRol)
                {
                    case 1:
                        Session["ID"] = us.id;
                        Session["Usuario"] = us.NombreUsuario;
                        Session["Rol"] = us.idRol;


                        Response.Redirect("frmMenuAdministrador.aspx", false); Context.ApplicationInstance.CompleteRequest();
                        break;
                    case 2:
                        Session["ID"] = us.id;
                        Session["Usuario"] = us.NombreUsuario;
                        Session["Rol"] = us.idRol;
                        break;
                    case 3:
                        Session["ID"] = us.id;
                        Session["Usuario"] = us.NombreUsuario;
                        Session["Rol"] = us.idRol;
                        Response.Redirect("frmMenuCliente.aspx", false); Context.ApplicationInstance.CompleteRequest();
                        break;
                }




                txtContrasennaInicio.Text = "";
                txtNombreUsuario.Text = "";
            }
        }
    }
}
