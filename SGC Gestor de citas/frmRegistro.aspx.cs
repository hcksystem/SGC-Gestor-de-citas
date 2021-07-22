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
    public partial class frmRegistro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistarme_Click(object sender, EventArgs e)
        {
            BLLUsuario bllu = new BLLUsuario();
            Persona per = new Persona();
            Usuario usu = new Usuario();

            per.nombre = txtNombre.Text;
            per.apellido = txtApellido.Text;
            per.correo = txtCorreo.Text;
            per.telefono = txtTelefono.Text;
            per.identificacion = txtIdentificacion.Text;

            usu.NombreUsuario = txtNombreUsuario.Text;
            usu.Contrasenna = txtContrasennaInicio.Text;
            usu.idRol = 3;
            usu.estado = 1;

           string Mensaje= bllu.InsertarUsuario(per, usu);
            if (Mensaje.Contains("(x)"))
            {
                ClientScript.RegisterStartupScript(
               this.GetType(),
               "Registro",
                  "mensajeRedirect('Registro','" + Mensaje.Replace("(x)","") + "','error','#')",
   true
   );
            }
            else
            {
                ClientScript.RegisterStartupScript(
               this.GetType(),
               "Registro",
                  "mensajeRedirect('Registro','" + Mensaje.Replace("(x)", "") + "','success','frmLogin.aspx')",
   true
   );
            }
           
        }
    }
}