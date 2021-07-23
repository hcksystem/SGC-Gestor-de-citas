using Entidades;
using LogicaNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmFacturacionEmpleado : System.Web.UI.Page
    {
        public static double TotalFactura = 0.0;
        public static DataTable ProductosServicios = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    TotalFactura = 0;
                    lblNumero.Text = "" + NumeroFacturacion();
                    ProductosServicios = new DataTable();
                    ProductosServicios.Clear();
                    ProductosServicios.Columns.Add("ID", typeof(Int32));
                    ProductosServicios.Columns.Add("Tipo", typeof(String));
                    ProductosServicios.Columns.Add("Descripcion", typeof(String));
                    ProductosServicios.Columns.Add("Precio", typeof(Double));
                    ProductosServicios.Columns.Add("Cantidad", typeof(Double));

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
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Double Total = 0;
            int Numeracion = NumeroFacturacion();
            List<DetalleFactura> listDetalle = new List<DetalleFactura>();
            int i = 0;
            foreach (DataRow dr in ProductosServicios.Rows)
            {
                DetalleFactura detalle = new DetalleFactura();
                switch (dr["Tipo"].ToString())
                {
                    case "(S)":
                        detalle.idServicio = Convert.ToInt32(dr["ID"].ToString());
                        break;
                    case "(P)":
                        detalle.idProducto = Convert.ToInt32(dr["ID"].ToString());
                        break;
                }
                detalle.idEncabezado = Numeracion;
                detalle.precio = Convert.ToDouble(dr["Precio"].ToString());
                detalle.id = i + 1;
                i++;
                int Cantidad = Convert.ToInt32(dr["Cantidad"].ToString());
                Double Precio = Convert.ToDouble(dr["Precio"].ToString());
                Total += Precio * Cantidad;
                detalle.cantidad = Cantidad;
                listDetalle.Add(detalle);
            }

            Factura factura = new Factura
            {
                idUsuario = Convert.ToInt32(Session["ID"].ToString()),
                numeroFactura = Numeracion,
                fecha = DateTime.Now,
                idMetodoPago = Convert.ToInt32(dropMetodopago.SelectedValue),
                totalFactura = Total,
                Detalle = listDetalle
            };
            string result = BLLFactura.InsertarFactura(factura);

            ClientScript.RegisterStartupScript(
                              this.GetType(),
                              "Registro",
                               "mensajeRedirect('Factura N° " + Numeracion + "','" + result + "','success','frmFacturacionEmpleado.aspx')",
                              true
                              );
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
        protected int NumeroFacturacion()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SQL1"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Select count(numeroFactura)+1[NoSeq] from encabezadoFactura", con))
                {
                    con.Open();
                    int numFact = (int)cmd.ExecuteScalar();
                    con.Close();
                    return numFact;
                }
            }
        }


        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click1(object sender, EventArgs e)
        {

            string[] detalle = txtBuscar.Text.Split(';');
            DataRow ProServ = ProductosServicios.NewRow();
            ProServ["ID"] = detalle[1].ToString();
            ProServ["Tipo"] = detalle[0].ToString();
            ProServ["Descripcion"] = detalle[2].ToString();
            NumberStyles style = NumberStyles.AllowDecimalPoint | NumberStyles.AllowThousands;
            CultureInfo provider = new CultureInfo("en-US");
            Double precio = Double.Parse(detalle[3].ToString(), style, provider);
            ProServ["Precio"] = precio;
            ProServ["Cantidad"] = txtCantidad.Text;
            ProductosServicios.Rows.Add(ProServ);
            gridFactura.DataSource = ProductosServicios;
            gridFactura.DataBind();
            TotalFactura += precio * Convert.ToDouble(txtCantidad.Text);
            txtBuscar.Text = "";
            txtBuscar.Focus();
            TotalFact.Text = TotalFactura + "";
        }

        protected void gridFactura_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow fila = gridFactura.Rows[e.RowIndex];
            NumberStyles style = NumberStyles.AllowDecimalPoint | NumberStyles.AllowThousands;
            CultureInfo provider = new CultureInfo("en-US");
            Double precio = Double.Parse(fila.Cells[3].Text, style, provider);
            TotalFactura = TotalFactura - (precio * Convert.ToDouble(fila.Cells[4].Text));
            ProductosServicios.Rows[e.RowIndex].Delete();
            ProductosServicios.AcceptChanges();
            TotalFact.Text = TotalFactura + "";
            gridFactura.DataSource = ProductosServicios;
            gridFactura.DataBind();

        }

    }
}