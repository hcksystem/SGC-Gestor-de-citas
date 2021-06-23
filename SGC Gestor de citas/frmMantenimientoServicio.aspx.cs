using Entidades;
using LogicaDeNegocio_BLL_;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using TextBox = System.Web.UI.WebControls.TextBox;

namespace SGC_Gestor_de_citas
{
    public partial class frmMantenimientoServicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            LlenarCombos();
            CargarDatos();
        }
        }

        private void CargarDatos()
        {
            try
            {
                BLLServicio bllc = new BLLServicio();
                DataTable dt = bllc.ObtenerTodosLosServicios();
                gridServicios.DataSource = dt;
                gridServicios.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
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

        protected void gridServicios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                gridServicios.EditIndex = -1;

            }
            catch (Exception)
            {

                throw;
            }

            CargarDatos();
        }


        protected void gridServicios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DialogResult boton = MessageBox.Show("Esta seguro?", "Consulta", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (boton == DialogResult.Yes)
            {
                try
                {
                    //Recorre la linea, identifica ID y elimina
                    int id = 0;
                    foreach (DictionaryEntry keyEntry in e.Keys)
                    {
                        id = Convert.ToInt32(keyEntry.Value);
                    }

                    BLLServicio bllu = new BLLServicio();
                    bllu.EliminarServicio(id);
                }
                catch (Exception)
                {

                    throw;
                }

                CargarDatos();
            }
  
        }

        protected void gridServicios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                //Activa edicion
                gridServicios.EditIndex = e.NewEditIndex;
            }
            catch (Exception)
            {
               throw;
            }

            CargarDatos();
        }

        protected void gridServicios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow fila = gridServicios.Rows[e.RowIndex];

            int id = Convert.ToInt32(gridServicios.DataKeys[e.RowIndex].Values[0]);
            string nombre = (fila.FindControl("txtNombreServicio") as TextBox).Text.ToUpper();
            string descripcion = (fila.FindControl("txtDescripcionServicio") as TextBox).Text.ToUpper();
            double precio = Convert.ToDouble((fila.FindControl("txtPrecioEstimado") as TextBox).Text.ToUpper());
            DateTime tiempo = Convert.ToDateTime((fila.FindControl("txtTiempoEstimado") as TextBox).Text.ToUpper());
            byte[] foto = (fila.FindControl("fileFoto") as FileUpload).FileBytes;
            bool estado = Convert.ToBoolean((fila.FindControl("txtEstado") as TextBox).Text.ToUpper());
            int producto = Convert.ToInt32((fila.FindControl("dropProducto") as DropDownList).SelectedValue);
            int negocio = Convert.ToInt32((fila.FindControl("dropNegocio") as DropDownList).SelectedValue);


            BLLServicio blls = new BLLServicio();
            Servicio ser = new Servicio();
            blls.ObtenerServicioPorID(id);
            ser.ID = id;
            ser.Nombre = nombre;
            ser.Descripcion = descripcion;
            ser.PrecioEstimado = precio;
            ser.TiempoEstimado = tiempo;
            ser.FotoSugerida = foto;
            ser.Estado = estado;
            ser.idProducto = producto;
            ser.idNegocio = negocio;
            blls.ModificarServicio(ser.ID, ser.Nombre, ser.Descripcion, ser.PrecioEstimado, ser.TiempoEstimado, ser.FotoSugerida, ser.Estado, ser.idProducto, ser.idNegocio);
            //Termina proceso de la edicion
            gridServicios.EditIndex = -1;



            //Carga los datos
            CargarDatos();

        }

        protected void gridServicios_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex == gridServicios.EditIndex)
        {
            DropDownList lista = e.Row.FindControl("dropProducto") as DropDownList;
            BLLProducto bllp = new BLLProducto();
            lista.DataSource = bllp.ObtenerTodosLosProductos();
            lista.DataTextField = "nombre";
            lista.DataValueField = "id";
            lista.DataBind();

            DropDownList lista1 = e.Row.FindControl("dropNegocio") as DropDownList;
            BLLNegocio bllc = new BLLNegocio();
            lista1.DataSource = bllc.ObtenerTodosLosNegocios();
            lista1.DataTextField = "nombre";
            lista1.DataValueField = "id";
            lista1.DataBind();
            }
        }
    }
}