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
        public static int[] Citas = new int[10];
        public static int NoSeq = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    NoSeq = 0;
                    Citas = new int[10];
                    TotalFactura = 0;
                    lblNumero.Text = "" + NumeroFacturacion();
                    ProductosServicios = new DataTable();
                    ProductosServicios.Clear();
                    ProductosServicios.Columns.Add("ID", typeof(Int32));
                    ProductosServicios.Columns.Add("Tipo", typeof(String));
                    ProductosServicios.Columns.Add("Descripcion", typeof(String));
                    ProductosServicios.Columns.Add("Precio", typeof(Double));
                    ProductosServicios.Columns.Add("Cantidad", typeof(Double));
                    dropMetodopago.SelectedIndex = 0;
                    if (dropMetodopago.SelectedIndex == 1)
                    {
                        Ult4Digitos.Visible = true;
                    }
                    else
                    {
                        Ult4Digitos.Visible = false;
                    }
                    //cargar combo con enum
                    Array enumList = Enum.GetValues(typeof(enumMetodoPago));
                    foreach (enumMetodoPago getPago in enumList)
                    {
                        dropMetodopago.Items.Add(new ListItem(getPago.ToString(), ((int)getPago).ToString()));
                    }
                }
                catch (Exception)
                {
                }

                LlenarCombos();
                
            }
           
        }


        private void LlenarCombos()
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
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
                        case "(C)":
                            detalle.IdCita = Convert.ToInt32(dr["ID"].ToString());
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
                String[] Cliente = txtBuscarCliente.Text.Split(';');
                Factura factura = new Factura
                {
                    idUsuario = Convert.ToInt32(Session["ID"].ToString()),
                    numeroFactura = Numeracion,
                    fecha = DateTime.Now,
                    idMetodoPago = Convert.ToInt32(dropMetodopago.SelectedItem.Value),
                    totalFactura = Total,
                    Detalle = listDetalle,
                    idCliente1 = Convert.ToInt32(Cliente[1].ToString()),
                    tarjetaDigitos = txtNumTarjeta.Text
                };
                string result = BLLFactura.InsertarFactura(factura);

                ClientScript.RegisterStartupScript(
                                  this.GetType(),
                                  "Registro",
                                   "mensajeRedirect('Factura N° " + Numeracion + "','" + result + "','success','frmFacturacionEmpleado.aspx')",
                                  true
                                  );
               
            }
            catch (Exception ex)
            {

                ClientScript.RegisterStartupScript(
                                  this.GetType(),
                                  "Registro",
                                   "mensajeRedirect('Error Interno','" + ex.Message + "','error','#')",
                                  true
                                  );
            }
            btnImprimir.Visible = true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMenuAdministrador.aspx");
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
            bool Validaciones = false;
            String MensajeError = "";
            string[] detalle = txtBuscar.Text.Split(';');
            try
            {
                int CantidadProducto = 0;
                int InventarioProducto = 0;
                int CodigoProducto = 0;
                switch (detalle[0].ToString())
                {
                    case "(P)":
                        CodigoProducto = Convert.ToInt32(detalle[1].ToString());
                        InventarioProducto = Convert.ToInt32(detalle[4].ToString());
                        break;
                    case "(S)":
                        CodigoProducto = Convert.ToInt32(detalle[4].ToString());
                        InventarioProducto = Convert.ToInt32(detalle[5].ToString());
                        break;
                    case "(C)":
                        CodigoProducto = Convert.ToInt32(detalle[7].ToString());
                        InventarioProducto = Convert.ToInt32(detalle[8].ToString());
                        break;
                }
                int Cantidad = 0;
                foreach (DataRow dr in ProductosServicios.Rows)
                {
                    string[] pdetalle = dr["Descripcion"].ToString().Split(';');
                    switch (dr["Tipo"].ToString())
                    {
                        case "(P)":
                            if (Convert.ToInt32(pdetalle[0].ToString()) == CodigoProducto)
                            {
                                Cantidad += Convert.ToInt32(dr["Cantidad"].ToString());
                            }
                            break;
                        case "(S)":
                            if (Convert.ToInt32(pdetalle[2].ToString()) == CodigoProducto)
                            {
                                Cantidad += Convert.ToInt32(dr["Cantidad"].ToString());
                            }
                            break;
                        case "(C)":
                            if (Convert.ToInt32(pdetalle[3].ToString()) == CodigoProducto)
                            {
                                Cantidad += Convert.ToInt32(dr["Cantidad"].ToString());
                            }
                            break;
                    }
                }
                if (Cantidad >= InventarioProducto)
                {
                    Validaciones = true;
                    MensajeError = "La cantidad solicitada es mayor a la factura con respecto al inventario";
                }

                if (detalle[0].ToString().Equals("(P)"))
                {
                    if (Convert.ToInt32(detalle[4].ToString()) < Convert.ToInt32(txtCantidad.Text))
                    {
                        Validaciones = true;
                        MensajeError = "La cantidad indicada es mayor a lo que se encuentra en inventario";
                        txtBuscar.Enabled = true;
                    }
                }

                if (Validaciones == false)
                {
                    Boolean flag = false;
                    foreach (int i in Citas)
                    {
                        if (i == Convert.ToInt32(detalle[1].ToString()))
                        {
                            flag = true;
                        };
                    };
                    if (!flag)
                    {
                        DataRow ProServ = ProductosServicios.NewRow();
                        string[] cliente = txtBuscarCliente.Text.Split(';');
                        String IDCitaCliente = "";
                        if (detalle[0].ToString().Equals("(C)"))
                        {
                            IDCitaCliente = detalle[6].ToString();
                            Citas[NoSeq] = Convert.ToInt32(detalle[1].ToString());
                            NoSeq++;
                            ProServ["Cantidad"] = String.Format("{0}", 1);
                        }
                        else
                        {
                            ProServ["Cantidad"] = txtCantidad.Text;
                        }
                        String IDClienteFact = cliente[3].ToString();
                        if (IDCitaCliente.Equals(IDClienteFact) || !detalle[0].Equals("(C)"))
                        {
                            ProServ["ID"] = detalle[1].ToString();
                            ProServ["Tipo"] = detalle[0].ToString();
                            if (detalle[0].ToString().Equals("(C)"))
                            {
                                ProServ["Descripcion"] = String.Format("{0};{1};{2};{3}", detalle[1].ToString(), detalle[2].ToString(), detalle[4].ToString(), detalle[7].ToString());
                            }
                            else
                            {
                                string CodProducto = "";
                                if (detalle[0].ToString().Equals("P"))
                                {
                                    CodProducto = detalle[1].ToString();
                                }
                                else
                                {
                                    CodProducto = detalle[4].ToString();
                                }
                                ProServ["Descripcion"] = String.Format("{0};{1};{2}", detalle[1].ToString(), detalle[2].ToString(), CodProducto);
                            }
                            NumberStyles style = NumberStyles.AllowDecimalPoint | NumberStyles.AllowThousands;
                            CultureInfo provider = new CultureInfo("en-US");
                            Double precio = Double.Parse(detalle[3].ToString(), style, provider);
                            ProServ["Precio"] = precio;
                            ProductosServicios.Rows.Add(ProServ);
                            gridFactura.DataSource = ProductosServicios;
                            gridFactura.DataBind();
                            TotalFactura += precio * Convert.ToDouble(txtCantidad.Text);
                            txtBuscar.Text = "";
                            txtBuscar.Focus();
                            TotalFact.Text = TotalFactura + "";
                            TotalIVA.Text = (TotalFactura * 0.13) + "";
                            TotalTotal.Text = (TotalFactura * 1.13) + "";
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(
                                              this.GetType(),
                                              "Error de Cita",
                                               "mensajeRedirect('Error de Cita','La cita seleccionada no corresponde al cliente','error','#')",
                                              true
                                              );
                        }
                        txtBuscar.Enabled = true;
                        txtBuscar.Focus();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(
                                                  this.GetType(),
                                                  "Error de Cita",
                                                   "mensajeRedirect('Error de Cita','La cita seleccionada ya se encuentra en el detalle de factura','error','#')",
                                                  true
                                                  );
                        txtBuscar.Text = "";
                        txtBuscar.Enabled = true;
                        txtBuscar.Focus();
                    }
                }//FIN FLAG
                else
                {
                    ClientScript.RegisterStartupScript(
                                                      this.GetType(),
                                                      "Error de Cita",
                                                       "mensajeRedirect('Error de Cita','" + MensajeError + "','error','#')",
                                                      true
                                                      );
                    this.txtBuscar.Enabled = true;
                }
            }
            catch (Exception ex)
            {

                ClientScript.RegisterStartupScript(
                                  this.GetType(),
                                  "Registro",
                                   "mensajeRedirect('Error Interno','" + ex.Message + "','error','#')",
                                  true
                                  );
            }
        }
        protected void gridFactura_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow fila = gridFactura.Rows[e.RowIndex];
            NumberStyles style = NumberStyles.AllowDecimalPoint | NumberStyles.AllowThousands;
            if (fila.Cells[1].Text.Equals("(C)"))
            {
                for (int i = 0; i < Citas.Length; i++)
                {
                    if (Citas[i] == Convert.ToInt32(fila.Cells[2].Text.Split(';')[0].ToString()))
                    {
                        Citas[i] = 0;
                    }
                }
            }
            CultureInfo provider = new CultureInfo("en-US");
            Double precio = Double.Parse(fila.Cells[3].Text, style, provider);
            TotalFactura = TotalFactura - (precio * Convert.ToDouble(fila.Cells[4].Text));
            ProductosServicios.Rows[e.RowIndex].Delete();
            ProductosServicios.AcceptChanges();
            TotalFact.Text = TotalFactura + "";
            TotalIVA.Text = (TotalFactura * 0.13) + "";
            TotalTotal.Text = (TotalFactura * 1.13) + "";
            gridFactura.DataSource = ProductosServicios;
            gridFactura.DataBind();

        }

        protected void dropMetodopago_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dropMetodopago.SelectedItem.Text.Equals("Tarjeta"))
            {
                Ult4Digitos.Visible = true;
            }
            else
            {
                Ult4Digitos.Visible = false;
            }
        }

        protected void btnImprimir_Click(object sender, EventArgs e)
        {
            int NoFact = Convert.ToInt32(lblNumero.Text) - 1;
            Response.Write("<script>window.open ('FrmFacturaEmpleado.aspx?NoFact=" + NoFact + "','_blank');</script>");
          
        }
        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            if (txtBuscar.Text.Length > 0)
            {
                txtBuscar.Enabled = false;
            }
        }

        protected void txtBuscarCliente_TextChanged(object sender, EventArgs e)
        {
            if (txtBuscar.Text.Length > 0)
            {
                txtBuscarCliente.Enabled = false;
            }
        }
    }
}