using Entidades;
using EnvDTE;
using LogicaDeNegocio_BLL_;
using LogicaNegocio_BLL_;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Button = System.Web.UI.WebControls.Button;
using TextBox = System.Web.UI.WebControls.TextBox;

namespace SGC_Gestor_de_citas
{
    public partial class frmMantenimientoUsuario : System.Web.UI.Page
    {
        public bool editar = true;//variable que se utilizara para identificar si el dato se quiere actualizar o si es un registro nuevo
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatos();
                LlenarCombos();
                txtNombre.Focus();
            }
        }

        private void CargarDatos()
        {
            try
            {
                BLLUsuario bllc = new BLLUsuario();
                DataTable dt = bllc.ObtenerTodosLosUsuariosActivos();
                gridUsuarios.DataSource = dt;
                gridUsuarios.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
           
        }

        private void EditarDatos()//este metodo carga los espacios del formulario con los datos almacenados en la BD 
        {
            int id = Convert.ToInt32(gridUsuarios.SelectedRow.Cells[2].Text);
            BLLUsuario bllc = new BLLUsuario();
            DataTable dt = bllc.ObtenerUsuarioPorID(id);

            txtNombreUsuario.Text = dt.Rows[0]["nombreUsuario"].ToString();
            txtContrasenna.Text = dt.Rows[0]["contrasenna"].ToString();
            dropRol.SelectedValue = dt.Rows[0]["idRoll"].ToString();
            dropEstado.SelectedValue = dt.Rows[0]["estado"].ToString();
            txtNombre.Text = dt.Rows[0]["nombre"].ToString();
            txtApellido.Text = dt.Rows[0]["apellido"].ToString();
            txtCorreo.Text = dt.Rows[0]["correo"].ToString();
            txtTelefono.Text = dt.Rows[0]["telefono"].ToString();
            txtIdentificacion.Text = dt.Rows[0]["identificacion"].ToString();
        }
        private void LlenarCombos()
        {
            Array enumList = Enum.GetValues(typeof(estado));
            // Array enumNombres = Enum.GetNames(typeof(estado));
            foreach (estado getestado in enumList)
            {
                dropEstado.Items.Add(new ListItem(getestado.ToString(), ((int)getestado).ToString()));
            }
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
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtNombreUsuario.Text = "";
            txtIdentificacion.Text = "";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtContrasenna.Text.Length > 0)
                {
                    BLLPersona bllp = new BLLPersona();
                    BLLUsuario bllu = new BLLUsuario();

                    Persona p = new Persona();
                    Usuario u = new Usuario();

                    p.nombre = txtNombre.Text;
                    p.apellido = txtApellido.Text;
                    p.correo = txtCorreo.Text;
                    p.telefono = txtTelefono.Text;
                    p.identificacion = txtIdentificacion.Text;

                    u.NombreUsuario = txtNombreUsuario.Text;
                    u.Contrasenna = txtContrasenna.Text;
                    u.idRol = Convert.ToInt32(dropRol.SelectedValue);
                    u.estado = Convert.ToInt32(dropEstado.SelectedValue);
                    string mensaje = bllu.InsertarUsuario(p, u);
                    mensaje = mensaje.Replace("\r\n", "y ");
                    if (mensaje.Contains("(x)"))
                    {
                        mensaje = mensaje.Replace("(x)", "");
                        mensaje = mensaje.Substring(0, mensaje.Length - 2);
                        ClientScript.RegisterStartupScript(
                                     this.GetType(),
                                     "Registro",
                                      "mensajeRedirect('Usuario','" + mensaje.Replace("(x)", "") + "','error','#')",
                                     true
                                     );
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(
                                     this.GetType(),
                                     "Registro",
                                      "mensajeRedirect('Usuario','" + mensaje.Replace("(x)", "") + "','success','frmMantenimientoUsuario.aspx')",
                                     true
                                     );
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
            LimpiarDatos();
            CargarDatos();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarDatos();
            btnModificar.Visible = false;
            btnGuardar.Visible = true;
            Response.Redirect("frmMenuAdministrador.aspx");
        }

        protected void gridUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                gridUsuarios.EditIndex = -1;
            }
            catch (Exception)
            {
                throw;
            }
            CargarDatos();
        }

        protected void gridUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int index = Convert.ToInt32(gridUsuarios.Rows[e.RowIndex].Cells[2].Text);
            BLLUsuario bllu = new BLLUsuario();
            bllu.CambiarEstadoUsuario(index);
            CargarDatos();

            ClientScript.RegisterStartupScript(
                this.GetType(),
                 "Registro",
                 "mensajeRedirect('Usuario',' Eliminado con éxito','success','frmMantenimientoUsuario.aspx')",
                 true
                 );
        }

        protected void gridUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                //Activa edicion
                gridUsuarios.EditIndex = e.NewEditIndex;
            }
            catch (Exception)
            {
                throw;
            }
            CargarDatos();
        }

        protected void gridUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void gridUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            int usuario = Convert.ToInt32(gridUsuarios.SelectedRow.Cells[2].Text);
            //Server.Transfer("frmMantenimientoUsuario.aspx"+usuario);
            if (gridUsuarios.Columns.Count > 0)

                EditarDatos();
            btnModificar.Visible = true;
            btnGuardar.Visible = false;
        }


        protected void gridUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //esta linea indica o activa, la siguiente pagina del grid
            gridUsuarios.PageIndex = e.NewPageIndex;
            this.CargarDatos();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                BLLPersona bllp = new BLLPersona();
                BLLUsuario bllu = new BLLUsuario();
                int id = Convert.ToInt32(gridUsuarios.SelectedRow.Cells[2].Text);
                int idP = Convert.ToInt32(gridUsuarios.SelectedRow.Cells[7].Text);

                bllp.ModificarPersona(idP, txtNombre.Text, txtApellido.Text, txtCorreo.Text, txtTelefono.Text, txtIdentificacion.Text);
                bllu.ModificarUsuario(id, txtNombreUsuario.Text, txtContrasenna.Text, Convert.ToInt16(dropRol.SelectedValue), Convert.ToInt16(dropEstado.SelectedValue), idP);
                ClientScript.RegisterStartupScript(
                             this.GetType(),
                             "Actualizacion",
                              "mensajeRedirect('Usuario',' Modificado con éxito','success','frmMantenimientoUsuario.aspx')",
                             true
                             );
            }
            catch (Exception)
            {

                throw;
            }
            LimpiarDatos();
            CargarDatos();
            
            txtContrasenna.Visible = false;
            btnGuardar.Visible = true;
            btnModificar.Visible = false;
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == false)
            {
                string pass = txtContrasenna.Text;
                txtContrasenna.TextMode = TextBoxMode.Password;
                txtContrasenna.Attributes.Add("value", pass);
            }
            if (CheckBox1.Checked)
            {
                txtContrasenna.TextMode = TextBoxMode.SingleLine;
            }
        }
    }
}