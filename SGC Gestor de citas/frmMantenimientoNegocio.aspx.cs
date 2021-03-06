using AccesoDatos_DAL_;
using Entidades;
using LogicaDeNegocio_BLL_;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
    public partial class frmMantenimientoNegocio : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                CargarDatos();
            }
        }

        private void CargarDatos(string sortExpression = null)
        {
            DALNegocio bllc = new DALNegocio();
            DataTable dt = bllc.ObtenerTodosLosNegocio();



            gridNegocio.DataSource = dt;
            gridNegocio.DataBind();
        }
        public void limpiarDatos()
        {
            txtDescripcion.Text = "";
            txtMision.Text = "";
            txtVision.Text = "";
            txtNombreNegocio.Text = "";
            FileUpload1.Dispose();

        }
        protected void gridNegocio_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlImage imageControl = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("imageControl");
                if (((DataRowView)e.Row.DataItem)["logo"] != DBNull.Value)
                {
                    imageControl.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])(((DataRowView)e.Row.DataItem))["logo"]);
                }
            }


            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[2].Text;
                foreach (ImageButton button in e.Row.Cells[1].Controls.OfType<ImageButton>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Está seguro que desea eliminar este registro? " + item + "?')){ return false; };";
                    }
                }
            }


        }

        private void EditarDatos()//este metodo carga los espacios del formulario con los datos almacenados en la BD 
        {
            int id = Convert.ToInt32(gridNegocio.SelectedRow.Cells[2].Text);
            BLLNegocio bllc = new BLLNegocio();
            DataTable dt = bllc.ObtenerNegocioPorID(id);

            txtNombreNegocio.Text = dt.Rows[0]["nombre"].ToString();
            //Image1.Visible = true;

            txtDescripcion.Text = dt.Rows[0]["descripcion"].ToString();
            txtMision.Text = dt.Rows[0]["mision"].ToString();
            txtVision.Text = dt.Rows[0]["vision"].ToString();

          

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
               
                ClientScript.RegisterStartupScript(
                               this.GetType(),
                               "Registro",
                                "mensajeRedirect('Negocio',' Guardado con éxito','success','frmMantenimientoNegocio.aspx')",
                               true
                               );
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
            btnGuardar.Visible = true;
            btnModificar.Visible = false;
        }


        protected void gridNegocio_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            try
            {
                //Cancela edicion
                gridNegocio.EditIndex = -1;
            }
            catch (Exception)
            {

                throw;
            }
            CargarDatos();
        }

        protected void gridNegocio_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Toma la columna que se va a editar
            GridViewRow fila = gridNegocio.Rows[e.RowIndex];
            //CargarDatos los datos
            int id = Convert.ToInt32(gridNegocio.DataKeys[e.RowIndex].Values[0]);
            string nombre = (fila.FindControl("txtNombre") as TextBox).Text.ToUpper();
            byte[] logo = (fila.FindControl("fileLogo") as FileUpload).FileBytes;
            string descripcion = (fila.FindControl("txtDescripcion") as TextBox).Text.ToUpper();
            string mision = (fila.FindControl("txtMision") as TextBox).Text.ToUpper();
            string vision = (fila.FindControl("txtVision") as TextBox).Text.ToUpper();


            BLLNegocio bbln = new BLLNegocio();
            Negocio nego = new Negocio();
            bbln.ObtenerNegocioPorID(id);
            nego.ID = id;
            nego.Nombre = nombre;
            nego.Logo = logo;
            nego.Descripcion = descripcion;
            nego.Mision = mision;
            nego.Vision = vision;
            bbln.ModificarNegocio(id, nego.Nombre, nego.Logo, nego.Descripcion, nego.Mision, nego.Vision);


            //Termina proceso de la edicion
            gridNegocio.EditIndex = -1;


            //Carga los datos
            CargarDatos();
        }


        protected void gridNegocio_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                //Recorre la linea y elimina el id
                int index = Convert.ToInt32(gridNegocio.Rows[e.RowIndex].Cells[2].Text);
                BLLNegocio bllu = new BLLNegocio();
                bllu.EliminarNegocio(index);
                CargarDatos();

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                     "Registro",
                     "mensajeRedirect('Negocio',' Eliminado con éxito','success','frmMantenimientoNegocio.aspx')",
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

        protected void gridNegocio_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                //Activa edicion
                gridNegocio.EditIndex = e.NewEditIndex;
            }
            catch (Exception)
            {

                throw;
            }

            CargarDatos();
        }

        protected void gridNegocio_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridNegocio.PageIndex = e.NewPageIndex;
            this.CargarDatos();
        }

        protected void gridNegocio_SelectedIndexChanged(object sender, EventArgs e)
        {
            int negocio = Convert.ToInt32(gridNegocio.SelectedRow.Cells[2].Text);
            //Server.Transfer("frmMantenimientoUsuario.aspx"+usuario);
            if (gridNegocio.Columns.Count > 0)

                EditarDatos();
            btnModificar.Visible = true;
            btnGuardar.Visible = false;
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


                    BLLNegocio blln = new BLLNegocio();
                    int id = Convert.ToInt32(gridNegocio.SelectedRow.Cells[2].Text);
                    blln.ModificarNegocio(id, txtNombreNegocio.Text, imagenOriginal, txtDescripcion.Text, txtMision.Text, txtVision.Text);

                }
                else
                {
                    BLLNegocio blln = new BLLNegocio();
                    int id = Convert.ToInt32(gridNegocio.SelectedRow.Cells[2].Text);
                    blln.ModificarNegocioSinImagen(id, txtNombreNegocio.Text, txtDescripcion.Text, txtMision.Text, txtVision.Text);
                }


                //ese scripManager genera la alerta
                ClientScript.RegisterStartupScript(
                              this.GetType(),
                              "Actualizacion",
                               "mensajeRedirect('Negocio',' Modificado con éxito','success','frmMantenimientoNegocio.aspx')",
                              true
                              );
                CargarDatos();

            }
            catch (Exception)
            {

                throw;
            }
            btnModificar.Visible = false;
            btnGuardar.Visible = true;
            limpiarDatos();
            CargarDatos();
        }
    }
}