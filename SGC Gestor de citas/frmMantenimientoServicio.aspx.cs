using LogicaDeNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmMantenimientoServicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarCombos();
        }

        private void LlenarCombos()
        {
            BLLProducto bllp = new BLLProducto();
            DataTable dt = bllp.ObtenerTodosLosProductos();
            dropProducto.DataSource = dt;
            dropProducto.DataTextField = "nombre";
            dropProducto.DataValueField = "id";
            dropProducto.DataBind();


            BLLNegocio blln = new BLLNegocio();
            DataTable dt1 = blln.ObtenerTodosLosNegocios();
            dropNegocio.DataSource = dt1;
            dropNegocio.DataTextField = "nombre";
            dropNegocio.DataValueField = "id";
            dropNegocio.DataBind();
        }
        public void limpiarDatos()
        {
            txtDescripcion.Text = "";
            txtNombre.Text = "";
            txtPrecio.Text = "";
            txtTiempoEstimado.Text = "";
            FileUpload1.Dispose();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //obtener datos de imagen//
            int tamanio = FileUpload1.PostedFile.ContentLength;
            byte[] imagenOriginal = new byte[tamanio];
            FileUpload1.PostedFile.InputStream.Read(imagenOriginal, 0, tamanio);
            Bitmap imagenOriginaBinaria = new Bitmap(FileUpload1.PostedFile.InputStream);

            //insertar en bd//
            string imagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(imagenOriginal);
            

            BLLServicio blls = new BLLServicio();
            blls.InsertarServicio(txtNombre.Text, txtDescripcion.Text, Convert.ToDouble(txtPrecio.Text), Convert.ToDateTime(txtTiempoEstimado.Text), imagenOriginal, true, Convert.ToInt16(dropProducto.SelectedValue), Convert.ToInt16(dropNegocio.SelectedValue));

            //ese scripManager genera la alerta
            string mjs = "Servicio Registrado Correctamente";
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('" + mjs + "');window.location-'frmMantenimientoServicio.aspx';", true);
            limpiarDatos();
           
        }
    }
}