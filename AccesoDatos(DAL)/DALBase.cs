using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos_DAL_
{
    public class DALBase
    {
        public SqlConnection Conexion { get; }
        public DALBase()
        {
            string cs = ConfigurationManager.ConnectionStrings["SQL1"].ConnectionString;
            SqlConnection cnn = new SqlConnection(cs);
            Conexion = cnn;
        }
    }
}
