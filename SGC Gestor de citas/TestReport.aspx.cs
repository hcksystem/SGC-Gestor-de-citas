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
    public partial class TestReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtFechaDesde.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtFechaHasta.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }

        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {

            // Set the processing mode for the ReportViewer to Local  
            ReportViewer1.ProcessingMode = ProcessingMode.Local;

            LocalReport localReport = ReportViewer1.LocalReport;

            localReport.ReportPath = "ReportCita.rdlc";
            DataSet dataset = new DataSet("DataSet1");
            string Desde = txtFechaDesde.Text;
            string Hasta = txtFechaHasta.Text;
            GenerarCitas(Desde,Hasta, ref dataset);
            ReportDataSource dsCitas = new ReportDataSource();
            dsCitas.Name = "DataSet1";
            dsCitas.Value = dataset.Tables["DataSet1"];

            localReport.DataSources.Add(dsCitas);
        }
        protected void GenerarCitas(String Desde,String Hasta, ref DataSet dataset) {

            string sqlCitas = String.Format("Select * from VW_Citas where Fecha between '{0}' and '{1}'",Desde,Hasta);
            SqlConnection connection = new
        SqlConnection(ConfigurationManager.ConnectionStrings["SQL1"].ConnectionString);
            connection.Open();
            SqlCommand command =
        new SqlCommand(sqlCitas, connection);
            SqlDataAdapter salesOrderAdapter = new
        SqlDataAdapter(command);

            salesOrderAdapter.Fill(dataset, "DataSet1");
        }
    }
}