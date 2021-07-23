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
            if (!IsPostBack)
            {
                txtNombre.Focus();
            }
        }
        public void limpiarDatos()
        {
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtTelefono.Text = "";
            txtCorreo.Text = "";
            txtContrasennaInicio.Text = "";
            txtNombreUsuario.Text = "";
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

            string mensaje = bllu.InsertarUsuario(per, usu);
            mensaje = mensaje.Replace("\r\n", "y ");

           // string Mensaje= bllu.InsertarUsuario(per, usu);

            if (mensaje.Contains("(x)"))
            {
                mensaje = mensaje.Replace("(x)", "");
                mensaje = mensaje.Substring(0, mensaje.Length - 2);

                ClientScript.RegisterStartupScript(
                                    this.GetType(),
                                    "Registro",
                                     "mensajeRedirect('Usuario','" + mensaje.Replace("(x)", "") + "','error','#')",
                                    true
                                    );
            }
            else
            {
                ClientScript.RegisterStartupScript(
                                    this.GetType(),
                                    "Registro",
                                     "mensajeRedirect('Usuario','" + mensaje.Replace("(x)", "") + "','success','frmLogin.aspx')",
                                    true
                                    );
   
            }

            limpiarDatos();
            //Response.Redirect("frmLogin.aspx");
           
        }
    }
}