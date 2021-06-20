using LogicaDeNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmMantenimientoNegocio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        public void limpiarDatos()
        {
            txtDescripcion.Text = "";
            txtMision.Text = "";
            txtVision.Text = "";
            txtNombreNegocio.Text = "";
            FileUpload1.Dispose();

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {


                //obtener datos de imagen//
                int tamanio = FileUpload1.PostedFile.ContentLength;
                byte[] imagenOriginal = new byte[tamanio];
                FileUpload1.PostedFile.InputStream.Read(imagenOriginal, 0, tamanio);
                Bitmap imagenOriginaBinaria = new Bitmap(FileUpload1.PostedFile.InputStream);

                //insertar en bd//
                string imagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(imagenOriginal);


                BLLNegocio blln = new BLLNegocio();
                blln.InsertarNegocio(txtNombreNegocio.Text, imagenOriginal, txtDescripcion.Text, txtMision.Text, txtVision.Text);

                //ese scripManager genera la alerta
                string mjs = "Negocio Registrado Correctamente";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert",
                    "alert('" + mjs + "');window.location-'frmMantenimientoNegocio.aspx';", true);

            }



            catch (Exception)
            {

                throw;
            }
            limpiarDatos();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiarDatos();
        }
    }
}