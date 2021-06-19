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
    public partial class frmMantenimientoUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                LlenarCombos();
            }
        }

        private void LlenarCombos()
        {
            BLLRol bllc = new BLLRol();
            DataTable dt = bllc.ObtenerTodosRoles();
            dropRol.DataSource = dt;
            dropRol.DataTextField = "descripcion";
            dropRol.DataValueField = "id";
            dropRol.DataBind();
        }
        public void LimpiarDatos()
        {
            txtContrasenna.Text = "";
            txtCorreo.Text = "";
            txtTelefono.Text = "";

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                BLLUsuario bllu = new BLLUsuario();
                bllu.InsertarUsuario(txtCorreo.Text, txtTelefono.Text, txtContrasenna.Text, Convert.ToInt16(dropRol.SelectedItem.Value));

                string mjs = "Usuario Registrado Correctamente";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert",
                    "alert('" + mjs + "');window.location-'fmrMantenimientoUsuario.aspx';", true);

                LimpiarDatos();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}