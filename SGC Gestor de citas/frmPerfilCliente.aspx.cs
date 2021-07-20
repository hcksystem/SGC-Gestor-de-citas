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
            string nuevaClave = "";
            if (txtNewPassword.Text.Length > 0) {
                //Confirm para que alerte
                if (bllpersona.CompararClave(txtOldPassword.Text))
                {
                    nuevaClave = txtNewPassword.Text;
                }
                else { 
                //Alert la clave no coincide
                }
            }
           int result= bllpersona.Actualizar(persona,nuevaClave);//1 Actualizo la persona, 2 Actualizo la persona  y la clave y si es 0 no hizo nada
            switch (result) {
                case 1://redirect a la misma pagina para que se vean los cambios
                    break;
                case 2://redirect a login para que pruebe la clave, recuerden cerrar la session
                    break;
                case 0://No paso nada
                    break;

            }


        }
    }
}