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
                txtNombre.ToolTip = "-1";
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
           
            Array enumList = Enum.GetValues(typeof(estado));
           

            foreach (estado getestado in enumList)
            {
                dropEstado.Items.Add(new ListItem(getestado.ToString(), ((int)getestado).ToString()));
            }

            BLLProducto bllp = new BLLProducto();
            DataTable dt = bllp.ObtenerTodosLosProductosActivos();
            dropProducto.DataSource = dt;
            dropProducto.DataTextField = "nombre";
            dropProducto.DataValueField = "id";
            dropProducto.DataBind();
            dropProducto.Items.Insert(0,"Seleccione un producto");

            BLLNegocio blln = new BLLNegocio();
            DataTable dt1 = blln.ObtenerTodosLosNegocios();
            dropNegocio.DataSource = dt1;
            dropNegocio.DataTextField = "nombre";
            dropNegocio.DataValueField = "id";
            dropNegocio.DataBind();
            dropNegocio.Items.Insert(0, "Seleccione un negocio");
        }
        public void limpiarDatos()
        {
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtPrecio.Text = "";
            txtTiempoEstimado.Text = "";
            FileUpload1.Dispose();
            txtNombre.ToolTip = "-1";

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int situ = 0;
            bool flag = false;
                BLLServicio blls = new BLLServicio();
            try
            {
                string imagen = "";
                string root = String.Format("~/imagenes/{1}/{0}", txtNombre.Text, dropNegocio.SelectedItem.Text);
                if (txtNombre.ToolTip.Equals("-1"))//Insertando
                {
                    if (!FileUpload1.HasFile)
                    {
                        flag = true;
                    }
                    else {
                        imagen = root+"/"+FileUpload1.FileName;
                    }
                }
                else//Actualizando
                {
                    if (!FileUpload1.HasFile)
                    {
                        if (!blls.TieneImagen(Convert.ToInt32(txtNombre.ToolTip)))
                        {
                            flag = true;
                        }
                        else
                        {
                            imagen = blls.Imagen(Convert.ToInt32(txtNombre.ToolTip));
                            situ = 1;
                        }
                    }
                    else
                    {
                        imagen = root + "/" + FileUpload1.FileName;
                    }
                }
                    if (!flag)
                    {
                        bool exists = System.IO.Directory.Exists(Server.MapPath(root));

                        if (!exists)
                        {
                            System.IO.Directory.CreateDirectory(Server.MapPath(root));
                        }
                        String mensaje = blls.GuardarServicio(Convert.ToInt32(txtNombre.ToolTip), txtNombre.Text, txtDescripcion.Text, Convert.ToInt32(dropProducto.SelectedValue), Convert.ToDouble(txtPrecio.Text), Convert.ToInt32(txtTiempoEstimado.Text), imagen, Convert.ToInt16(dropEstado.SelectedValue), Convert.ToInt16(dropNegocio.SelectedValue));
                    if (situ == 0)
                    {
                        FileUpload1.SaveAs(Server.MapPath(imagen));
                    }
                        limpiarDatos();
                        CargarDatos();
                        ClientScript.RegisterStartupScript(
                                       this.GetType(),
                                       "Registro",
                                        "mensajeRedirect('Servicio','" + mensaje + "','success','frmMantenimientoServicio.aspx')",
                                       true
                                       );
                       
                    }
            }
            catch (Exception ex)
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
            txtTiempoEstimado.Text = dt.Rows[0]["Duracion"].ToString();
            dropEstado.SelectedValue = dt.Rows[0]["estado"].ToString();
            dropNegocio.SelectedValue = dt.Rows[0]["idNegocio"].ToString();
            dropProducto.SelectedValue = dt.Rows[0]["Producto"].ToString();
            FotoSugerida.ImageUrl= dt.Rows[0]["fotoSugerida"].ToString();
            if (FotoSugerida.ImageUrl.Length > 0)
            {
                FotoSugerida.Visible = true;
            }
            else {

                FotoSugerida.Visible = false;
            }
         

        }
        protected void gridServicios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                //Recorre la linea y elimina el id
                int index = Convert.ToInt32(gridServicios.Rows[e.RowIndex].Cells[2].Text);
                BLLServicio bllu = new BLLServicio();
                bllu.CambiarEstadoServicio(index);
                CargarDatos();

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                     "Registro",
                     "mensajeRedirect('Servicio',' Eliminado con éxito','success','frmMantenimientoServicio.aspx')",
                     true
                     );
            }
            catch (Exception)
            {
                throw;
            }
            limpiarDatos();
            CargarDatos();

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
                string item = e.Row.Cells[2].Text;
                foreach (ImageButton button in e.Row.Cells[1].Controls.OfType<ImageButton>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('¿Está seguro que desea eliminar este registro? " + item + "?')){ return false; };";
                    }
                }
            }

        }

        protected void gridServicios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridServicios.PageIndex = e.NewPageIndex;
            this.CargarDatos();
        }

        protected void gridServicios_SelectedIndexChanged(object sender, EventArgs e)
        {
            int servicio = Convert.ToInt32(gridServicios.SelectedRow.Cells[2].Text);
     
            txtNombre.ToolTip =""+servicio;
            if (gridServicios.Columns.Count > 0)

                EditarDatos();
            btnGuardar.Visible = true;
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

                    ClientScript.RegisterStartupScript(
                              this.GetType(),
                              "Actualizacion",
                               "mensajeRedirect('Servicio',' Modificado con éxito','success','frmMantenimientoServicio.aspx')",
                              true
                              );

                }
                else
                {
                    BLLServicio blls = new BLLServicio();
                    int id = Convert.ToInt32(gridServicios.SelectedRow.Cells[2].Text);
                    blls.ModificarServicioSinFoto(id, txtNombre.Text, txtDescripcion.Text, Convert.ToDouble(txtPrecio.Text), Convert.ToDateTime(txtTiempoEstimado.Text), Convert.ToInt16(dropEstado.SelectedValue), Convert.ToInt16(dropProducto.SelectedValue), Convert.ToInt16(dropNegocio.SelectedValue));

                    ClientScript.RegisterStartupScript(
                             this.GetType(),
                             "Actualizacion",
                              "mensajeRedirect('Servicio',' Modificado con éxito','success','frmMantenimientoServicio.aspx')",
                             true
                             );

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

        protected void FotoSugerida_Click(object sender, ImageClickEventArgs e)
        {
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiarDatos();
            Response.Redirect("frmMenuAdministrador.aspx");
        }
    }
}