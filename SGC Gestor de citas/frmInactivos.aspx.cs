using LogicaDeNegocio_BLL_;
using LogicaNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmInactivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //cargarCombos();
                llenarGrid();
            }
           
        }
        //public void cargarCombos()
        //{
        //    Array enumList = Enum.GetValues(typeof(estado));


        //    foreach (estado getestado in enumList)
        //    {
        //        dropServiciosInactivos.Items.Add(new ListItem(getestado.ToString(), ((int)getestado).ToString()));
        //        dropUsuariosInactivos.Items.Add(new ListItem(getestado.ToString(), ((int)getestado).ToString()));
        //        dropProductosInactivos.Items.Add(new ListItem(getestado.ToString(), ((int)getestado).ToString()));
        //    }
        //}
        public void llenarGrid()
        {
            BLLProducto bllp = new BLLProducto();
            DataTable dt = bllp.ObtenerTodosLosProductosInactivos();
            gridProductosInactivos.DataSource = dt;
            gridProductosInactivos.DataBind();

            BLLServicio blls = new BLLServicio();
            DataTable dt1 = blls.ObtenerTodosLosServiciosInactivos();
            gridServiciosInactivos.DataSource = dt1;
            gridServiciosInactivos.DataBind();


            BLLUsuario bllu = new BLLUsuario();
            DataTable dt2 = bllu.ObtenerTodosLosUsuariosInactivos();
            gridUsuariosInactivos.DataSource = dt2;
            gridUsuariosInactivos.DataBind();

            //BLLServicio blls = new BLLServicio();
            //DataTable dt1 = bllp.ObtenerTodosLosProductosInactivos();
            //dropServiciosInactivos.DataSource = dt;
            //dropServiciosInactivos.DataTextField = "nombre";
            //dropServiciosInactivos.DataValueField = "id";
            //dropServiciosInactivos.DataBind();
        }

        protected void gridServiciosInactivos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            gridServiciosInactivos.PageIndex = e.NewPageIndex;
        }

        protected void gridServiciosInactivos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gridServiciosInactivos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[1].Text;
                foreach (ImageButton button in e.Row.Cells[0].Controls.OfType<ImageButton>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Está seguro que desea activar este servicio? " + item + "?')){ return false; };";
                    }
                }
            }
        }
        protected void gridServiciosInactivos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                //Recorre la linea y elimina el id
                int index = Convert.ToInt32(gridServiciosInactivos.Rows[e.RowIndex].Cells[1].Text);
                BLLServicio bllc = new BLLServicio();

                bllc.ActivarServicio(index);

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                     "Registro",
                     "mensajeRedirect('Servicio',' Activado con éxito','success','frmInactivos.aspx')",
                     true
                     );
            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void gridProductosInactivos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridProductosInactivos.PageIndex = e.NewPageIndex;
        }

        protected void gridProductosInactivos_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Recorre la linea y elimina el id
            int index = Convert.ToInt32(gridProductosInactivos.SelectedRow.Cells[2].Text);
            BLLProducto bllc = new BLLProducto();

            


            //bllc.ActivarProducto(index);
            

            //ClientScript.RegisterStartupScript(
            //    this.GetType(),
            //     "Registro",
            //     "mensajeRedirect('Categoría',' Eliminada con éxito','success','frmMantenimientoCategoria.aspx')",
            //     true
            //     );
        }

        protected void gridProductosInactivos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[1].Text;
                foreach (ImageButton button in e.Row.Cells[0].Controls.OfType<ImageButton>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Está seguro que desea activar este producto? " + item + "?')){ return false; };";
                    }
                }
            }
        }
        protected void gridProductosInactivos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                //Recorre la linea y elimina el id
                int index = Convert.ToInt32(gridProductosInactivos.Rows[e.RowIndex].Cells[1].Text);
                BLLProducto bllc = new BLLProducto();

                bllc.ActivarProducto(index);

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                     "Registro",
                     "mensajeRedirect('Producto',' Activado con éxito','success','frmInactivos.aspx')",
                     true
                     );
            }
            catch (Exception)
            {

                throw;
            }
           
        }

        protected void gridUsuariosInactivos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridUsuariosInactivos.PageIndex = e.NewPageIndex;
        }

        protected void gridUsuariosInactivos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gridUsuariosInactivos_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[1].Text;
                foreach (ImageButton button in e.Row.Cells[0].Controls.OfType<ImageButton>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Está seguro que desea eliminar este usuario? " + item + "?')){ return false; };";
                    }
                }
            }
        }

        protected void gridUsuariosInactivos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            try
            {
                //Recorre la linea y elimina el id
                int index = Convert.ToInt32(gridUsuariosInactivos.Rows[e.RowIndex].Cells[1].Text);
                BLLUsuario bllc = new BLLUsuario();

                bllc.ActivarUsuario(index);

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                     "Registro",
                     "mensajeRedirect('Usuario',' Activado con éxito','success','frmInactivos.aspx')",
                     true
                     );
            }
            catch (Exception)
            {

                throw;
            }

        }


    }
}