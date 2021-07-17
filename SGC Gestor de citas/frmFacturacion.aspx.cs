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
    public partial class Facturación : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    //cargar combo con enum
                    Array enumList = Enum.GetValues(typeof(enumMetodoPago));
                    foreach (enumMetodoPago getPago in enumList)
                    {
                        dropMetodopago.Items.Add(new ListItem(getPago.ToString(), ((int)getPago).ToString()));
                    }
                }
                catch (Exception)
                {

                    throw;
                }
                
                LlenarCombos();
                
            }
        }


        private void LlenarCombos()
        {
            BLLServicio blls = new BLLServicio();
            DataTable dt = blls.ObtenerTodosLosServicios();
            dropServicio.DataSource = dt;
            dropServicio.DataTextField = "nombre";
            dropServicio.DataValueField = "id";
            dropServicio.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

        }

        protected void dropCodigo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }
    }
}