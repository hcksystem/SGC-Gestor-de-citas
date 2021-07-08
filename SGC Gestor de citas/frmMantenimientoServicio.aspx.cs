using Entidades;
using LogicaDeNegocio_BLL_;
using LogicaNegocio_BLL_;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
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
            if (!IsPostBack)
            {
                LlenarCombos();
                CargarDatos();
            }
        }

        private void CargarDatos()
        {
            try
            {
                BLLServicio bllc = new BLLServicio();
                DataTable dt = bllc.ObtenerTodosLosServiciosActivos();
                gridServicios.DataSource = dt;
                gridServicios.DataBind();
            }
            catch (Exception)
            {
                throw;
            }

        }
        private void LlenarCombos()
        {
            //dropEstado.DataSource = Enum.GetNames(typeof(estado));
            //dropEstado.DataBind();
            Array enumList = Enum.GetValues(typeof(estado));
            // Array enumNombres = Enum.GetNames(typeof(estado));

            foreach (estado getestado in enumList)
            {
                dropEstado.Items.Add(new ListItem(getestado.ToString(), ((int)getestado).ToString()));
            }

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
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtPrecio.Text = "";
            txtTiempoEstimado.Text = "";
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


                BLLServicio blls = new BLLServicio();
                blls.InsertarServicio(txtNombre.Text, txtDescripcion.Text, Convert.ToDouble(txtPrecio.Text), Convert.ToDateTime(txtTiempoEstimado.Text), imagenOriginal, Convert.ToInt16(dropEstado.SelectedValue), Convert.ToInt16(dropProducto.SelectedValue), Convert.ToInt16(dropNegocio.SelectedValue));

                //ese scripManager genera la alerta
                string mjs = "Servicio registrado correctamente";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert",
                    "alert('" + mjs + "');window.location-'frmMantenimientoServicio.aspx';", true);

                limpiarDatos();
                CargarDatos();
            }
            catch (Exception)
            {

                throw;
            }

        }

        //este metodo carga los espacios del formulario con los datos almacenados en la BD 
        private void EditarDatos()
        {
            int id = Convert.ToInt32(gridServicios.SelectedRow.Cells[2].Text);
            BLLServicio bllc = new BLLServicio();
            DataTable dt = bllc.ObtenerServicioPorID(id);

            txtNombre.Text = dt.Rows[0]["nombre"].ToString();
            txtDescripcion.Text = dt.Rows[0]["descripcion"].ToString();
            txtPrecio.Text = dt.Rows[0]["precioEstimado"].ToString();
            txtTiempoEstimado.Text = dt.Rows[0]["tiempoEstimado"].ToString();
            dropEstado.SelectedValue = dt.Rows[0]["estado"].ToString();
            dropNegocio.SelectedValue = dt.Rows[0]["idNegocio"].ToString();
            dropProducto.SelectedValue = dt.Rows[0]["idProducto"].ToString();

            //// fileUpLoad = gridServicios.Rows[gridServicios.EditIndex].FindControl("FileUpload1") as FileUpload;
            //string fileName = fileUpLoad.FileName;
            //string fullPath = Path.GetFullPath(fileName);
            //fileUpLoad.SaveAs(fullPath);

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
                    bllu.CambiarEstadoServicio(id);
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


        protected void gridServicios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlImage imageControl = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("imageControl");
                if (((DataRowView)e.Row.DataItem)["fotoSugerida"] != DBNull.Value)
                {
                    imageControl.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])(((DataRowView)e.Row.DataItem))["fotoSugerida"]);
                }
            }
            //if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex == gridServicios.EditIndex)
            //{

            //DropDownList lista = e.Row.FindControl("dropProducto") as DropDownList;
            //BLLProducto bllp = new BLLProducto();
            //lista.DataSource = bllp.ObtenerTodosLosProductos();
            //lista.DataTextField = "nombre";
            //lista.DataValueField = "id";
            //lista.DataBind();

            //DropDownList lista1 = e.Row.FindControl("dropNegocio") as DropDownList;
            //BLLNegocio bllc = new BLLNegocio();
            //lista1.DataSource = bllc.ObtenerTodosLosNegocios();
            //lista1.DataTextField = "nombre";
            //lista1.DataValueField = "id";
            //lista1.DataBind();
            //}
        }

        protected void gridServicios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridServicios.PageIndex = e.NewPageIndex;
            this.CargarDatos();
        }

        protected void gridServicios_SelectedIndexChanged(object sender, EventArgs e)
        {
            int servicio = Convert.ToInt32(gridServicios.SelectedRow.Cells[2].Text);
           // int negocio = Convert.ToInt32(gridServicios.SelectedRow.Cells[2].Text);

            //Server.Transfer("frmMantenimientoUsuario.aspx"+usuario);
            if (gridServicios.Columns.Count > 0)

                EditarDatos();
            btnGuardar.Visible = false;
            btnModificar.Visible = true;
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    //obtener datos de imagen//
                    int tamanio = FileUpload1.PostedFile.ContentLength;
                    byte[] imagenOriginal = new byte[tamanio];
                    FileUpload1.PostedFile.InputStream.Read(imagenOriginal, 0, tamanio);
                    Bitmap imagenOriginaBinaria = new Bitmap(FileUpload1.PostedFile.InputStream);

                    //insertar en bd//
                    string imagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(imagenOriginal);


                    BLLServicio blls = new BLLServicio();
                    int id = Convert.ToInt32(gridServicios.SelectedRow.Cells[2].Text);
                    blls.ModificarServicio(id, txtNombre.Text, txtDescripcion.Text, Convert.ToDouble(txtPrecio.Text), Convert.ToDateTime(txtTiempoEstimado.Text), imagenOriginal, Convert.ToInt16(dropEstado.SelectedValue), Convert.ToInt16(dropProducto.SelectedValue), Convert.ToInt16(dropNegocio.SelectedValue));

                    //ese scripManager genera la alerta
                    string mjs = "Servicio modificamente correctamente";
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('" + mjs + "');window.location-'frmMantenimientoServicio.aspx';", true);

                }
                else
                {
                    BLLServicio blls = new BLLServicio();
                    int id = Convert.ToInt32(gridServicios.SelectedRow.Cells[2].Text);
                    blls.ModificarServicioSinFoto(id, txtNombre.Text, txtDescripcion.Text, Convert.ToDouble(txtPrecio.Text), Convert.ToDateTime(txtTiempoEstimado.Text), Convert.ToInt16(dropEstado.SelectedValue), Convert.ToInt16(dropProducto.SelectedValue), Convert.ToInt16(dropNegocio.SelectedValue));

                    //ese scripManager genera la alerta
                    string mjs = "Servicio modificamente correctamente";
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('" + mjs + "');window.location-'frmMantenimientoServicio.aspx';", true);

                }
            }
            catch (Exception)
            {

                throw;
            }

            limpiarDatos();
            CargarDatos();
            btnGuardar.Visible = true;
            btnModificar.Visible = false;
        }
    }
}