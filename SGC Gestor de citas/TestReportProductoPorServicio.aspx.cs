using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class TestReportProductoPorServicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtDesde.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtHasta.Text = DateTime.Now.ToString("yyyy-MM-dd");
                divFiltro.Visible = false;
                divRango.Visible = false;
            }

        }
        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            // Set the processing mode for the ReportViewer to Local  
            ReportViewer1.ProcessingMode = ProcessingMode.Local;

            LocalReport localReport = ReportViewer1.LocalReport;

            localReport.ReportPath = "rptProductosPorServicio.rdlc";
            DataSet dataset = new DataSet("DataSet1");
            string Desde = txtDesde.Text;
            string Hasta = txtHasta.Text;
            string Filtro = txtFiltro.Text;
            switch (Convert.ToInt32(RadioButtonList1.SelectedValue))
            {

                case 1:
                    GenerarCitasPorFecha(Desde, Hasta, ref dataset);
                    break;

                case 2:
                    GenerarCitasPorFiltro(Filtro, ref dataset);
                    break;
            }
            ReportDataSource dsCitas = new ReportDataSource();
            dsCitas.Name = "DataSet1";
            dsCitas.Value = dataset.Tables["DataSet1"];
            localReport.DataSources.Clear();
            localReport.DataSources.Add(dsCitas);
        }
        protected void GenerarCitasPorFecha(String Desde, String Hasta, ref DataSet dataset)
        {

            string sqlCitas = String.Format("Select * from VW_ProductoPorServicio where fechaFact between '{0}' and '{1}'", Desde, Hasta);
            SqlConnection connection = new
        SqlConnection(ConfigurationManager.ConnectionStrings["SQL1"].ConnectionString);
            connection.Open();
            SqlCommand command =
        new SqlCommand(sqlCitas, connection);
            SqlDataAdapter salesOrderAdapter = new
        SqlDataAdapter(command);

            salesOrderAdapter.Fill(dataset, "DataSet1");
        }
        protected void GenerarCitasPorFiltro(String Filtro, ref DataSet dataset)
        {

            string sqlCitas = String.Format("Select * from VW_ProductoPorServicio where Filtro like '%{0}%'", Filtro);
            SqlConnection connection = new
        SqlConnection(ConfigurationManager.ConnectionStrings["SQL1"].ConnectionString);
            connection.Open();
            SqlCommand command =
        new SqlCommand(sqlCitas, connection);
            SqlDataAdapter salesOrderAdapter = new
        SqlDataAdapter(command);

            salesOrderAdapter.Fill(dataset, "DataSet1");
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (RadioButtonList1.SelectedIndex)
            {
                case 0:
                    divFiltro.Visible = false;
                    divRango.Visible = true;
                    break;

                case 1:
                    divFiltro.Visible = true;
                    divRango.Visible = false;
                    break;
            }
        }
    }
}