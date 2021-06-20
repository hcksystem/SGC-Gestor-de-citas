using LogicaDeNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmMantenimientoProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        public void limpiarDatos()
        {
            txtNombreProducto.Text = "";
            txtDescripcionProducto.Text = "";
            txtCategoriaProducto.Text = "";
            txtCantidadProducto.Text = "";
            txtPrecioProducto.Text = "";
            txtPropositoProducto.Text = "";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                BLLProducto bllp = new BLLProducto();
                bllp.InsertarProducto(txtNombreProducto.Text, txtCategoriaProducto.Text, txtDescripcionProducto.Text, Convert.ToInt32(txtCantidadProducto.Text), txtPropositoProducto.Text, Convert.ToDouble(txtPrecioProducto.Text), true);

                string mjs = "Producto Registrado Correctamente";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert",
                    "alert('"+ mjs + "');window.location-'fmrMantenimientoProducto.aspx';",true);

                limpiarDatos();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiarDatos();
            
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int numero = Convert.ToInt16(args.Value);
            if (numero > 0)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}