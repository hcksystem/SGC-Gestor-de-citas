using Entidades;
using LogicaNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmPerfilCliente : System.Web.UI.Page
    {
        protected static Persona persona;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                persona = new Persona();
                CargarDatos();

               

            }

        }

        private void CargarDatos()
        { BLLPersona cbll = new BLLPersona();

            persona =  cbll.ObtenerPersonaPorIDUsuario(Session["ID"].ToString());
            txtApellidos.Text = persona.apellido;
            txtCorreo.Text = persona.correo;
            txtID.Text = persona.identificacion;
            txtNombre.Text = persona.nombre;
            txtTelefono.Text = persona.telefono;
            persona.id = Convert.ToInt32(Session["ID"].ToString());

        }


        protected void Guardar_Click(object sender, EventArgs e)
        {

            BLLPersona bllpersona = new BLLPersona();
            persona.nombre = txtNombre.Text;
            persona.correo = txtCorreo.Text;
            persona.apellido = txtApellidos.Text;
            persona.identificacion = txtID.Text;
            persona.telefono = txtTelefono.Text;
            string nuevaClave = "";
            if (txtNewPassword.Text.Length > 0) {
                //Confirm para que alerte
                if (bllpersona.CompararClave(txtOldPassword.Text))
                {
                    nuevaClave = txtNewPassword.Text;

                    ClientScript.RegisterStartupScript(
                       this.GetType(),
                        "Registro",
                        "mensajeRedirect('Contraseña',' actualizada','success','frmLogin.aspx')",
                        true
                        );
                }
                else {
                    //Alert la clave no coincide
                    ClientScript.RegisterStartupScript(
                       this.GetType(),
                        "Registro",
                        "mensajeRedirect('Contraseña',' No coincide','error','#')",
                        true
                        );
                    txtOldPassword.Text = "";
                    txtNewPassword.Text = "";
                    txtOldPassword.Focus();
                }
            }
           int result= bllpersona.Actualizar(persona,nuevaClave);//1 Actualizo la persona, 2 Actualizo la persona  y la clave y si es 0 no hizo nada
            switch (result) {
                case 1://redirect a la misma pagina para que se vean los cambios
                    ClientScript.RegisterStartupScript(
                       this.GetType(),
                        "Registro",
                        "mensajeRedirect('Información',' Datos Actualizados correctamente','success','frmPerfilCliente.aspx')",
                        true
                        );
                    break;
                case 2://redirect a login para que pruebe la clave, recuerden cerrar la session

                    ClientScript.RegisterStartupScript(
                       this.GetType(),
                        "Registro",
                        "mensajeRedirect('Contraseña',' Por favor inicie sesion de nuevo con su nueva contraseña','success','frmLogin.aspx')",
                        true
                        );
                    break;
                case 0://No paso nada
                    ClientScript.RegisterStartupScript(
                       this.GetType(),
                        "Registro",
                        "mensajeRedirect('Contraseña','Ha ocurrido un error por favor intentar de nuevo, o comunicarse con Soporte','error','#')",
                        true
                        );
                    break;

            }


        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == false)
            {
                string pass = txtOldPassword.Text;
                txtOldPassword.TextMode = TextBoxMode.Password;
                txtOldPassword.Attributes.Add("value", pass);
            }
            if (CheckBox1.Checked)
            {
                txtOldPassword.TextMode = TextBoxMode.SingleLine;
            }
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox2.Checked == false)
            {
                string pass = txtNewPassword.Text;
                txtNewPassword.TextMode = TextBoxMode.Password;
                txtNewPassword.Attributes.Add("value", pass);
            }
            if (CheckBox2.Checked)
            {
                txtNewPassword.TextMode = TextBoxMode.SingleLine;
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMenuCliente.aspx");
        }
    }
}