﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class AyudaProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFormProductoAyuda_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMantenimientoProducto.aspx");
        }
    }
}