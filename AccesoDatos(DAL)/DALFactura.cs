using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos_DAL_
{
    public class DALFactura : DALBase
    {
        public string InsertarFactura(Factura factura) {
            Conexion.Close();
            SqlCommand cmd = new SqlCommand(String.Format("set dateformat dmy;Insert into encabezadoFactura(numeroFactura,fecha,idUsuario,idCliente,idMetodoPago,TarjetaDigitos,SubTotal,Iva,Total) values ({0},'{1}',{2},{3},{4},'{5}',{6},{7},{8})",factura.numeroFactura,factura.fecha,factura.idUsuario,factura.idCliente1,factura.idMetodoPago,factura.tarjetaDigitos,factura.totalFactura,factura.totalFactura*0.13,factura.totalFactura*1.13), Conexion);
            
            Conexion.Open();
            int i=cmd.ExecuteNonQuery();

            foreach (DetalleFactura det in factura.Detalle)
            {
                if (det.IdCita == 0) {

                }
                cmd = new SqlCommand(String.Format("Insert into detalleFactura(id,idServicio,cantidad,precio,idEncabezado,idProducto,idCita) values({0},{1}, {2}, {3}, {4}, {5},case  when {6}=0 then null else {6} end)", det.id, det.idServicio, det.cantidad, det.precio, det.idEncabezado, det.idProducto,det.IdCita), Conexion);
                cmd.ExecuteNonQuery();
                if (det.IdCita != null)
                {
                    cmd = new SqlCommand(String.Format("Update a set estado=2 from Cita a where a.id={0}",det.IdCita), Conexion);
                    int CancelarCita = cmd.ExecuteNonQuery();
                }
            }
                Conexion.Close();
            return "Factura Ingresada Correctamente";
        }
    }
}
