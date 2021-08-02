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
    public class DALProducto : DALBase
    {
        public void InsertarProducto(Producto p, Inventario i)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Producto (Nombre, idCategoria, Descripcion, Proposito, Precio, Estado ) VALUES (@nombre, @idcategoria, @descripcion, @proposito, @precio, @estado); SELECT CAST (scope_identity() as int)", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@nombre", p.Nombre);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idcategoria", p.idCategoria);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", p.Descripcion);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@proposito", p.Proposito);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@precio", p.Precio);
            parametro.DbType = System.Data.DbType.Double;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", p.Estado);
            parametro.DbType = System.Data.DbType.Int32;
            cmd.Parameters.Add(parametro);
            int productoInsertado;
            Conexion.Open();
            productoInsertado = (int)cmd.ExecuteScalar();
            Conexion.Close();



            SqlCommand cmdInventario = new SqlCommand("INSERT INTO Inventario (idProducto, cantidad, descripcion) VALUES (@idProducto, @cantidad, @descripcion)", Conexion);
            SqlParameter parametroInventario;

            parametroInventario = new SqlParameter("@idProducto", productoInsertado);
            parametro.DbType = DbType.Int32;
            cmdInventario.Parameters.Add(parametroInventario);

            parametroInventario = new SqlParameter("@cantidad", i.cantidad);
            parametro.DbType = DbType.Int32;
            cmdInventario.Parameters.Add(parametroInventario);

            parametroInventario = new SqlParameter("@descripcion", i.descripcion);
            parametro.DbType = System.Data.DbType.String;
            cmdInventario.Parameters.Add(parametroInventario);

            Conexion.Open();
            cmdInventario.ExecuteNonQuery();
            Conexion.Close();
        }

        public int GetInventory(int index)
        {//aca se cambiaria el estado en casi de trabajar con enum
            SqlCommand cmd = new SqlCommand("Select Cantidad from Inventario where idProducto="+ index, Conexion);
            Conexion.Open();
            int Qty=(int)cmd.ExecuteScalar();
            Conexion.Close();
            return Qty;
        }

        public void Modificar(int id, string Nombre, int idCategoria, string Descripcion, string Proposito, double Precio, int Estado)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Producto SET nombre=@nombre, idcategoria=@idcategoria, descripcion=@descripcion, proposito=@proposito, precio=@precio, estado=@estado WHERE id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@nombre", Nombre);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idcategoria", idCategoria);
            parametro.DbType = DbType.Int16;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@descripcion", Descripcion);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@proposito", Proposito);
            parametro.DbType = DbType.String;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@precio", Precio);
            parametro.DbType = DbType.Double;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@estado", Estado);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }


        public DataTable ObtenerProductoPorID(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, idcategoria, descripcion, proposito, precio, estado FROM Producto WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public DataTable ObtenerProductoPorIDCategoria(int Identificacion)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, idcategoria, descripcion, proposito, precio, estado FROM Producto WHERE idcategoria = @idcategoria", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@idcategoria", Identificacion);
            cmd.Parameters.Add(parametro);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public void CambiarEstadoProducto(int id)
        {
            //aca se cambiaria el estado en casi de trabajar con enum
            SqlCommand cmd = new SqlCommand("UPDATE Producto SET estado = '2' where id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            cmd.Parameters.Add(parametro);
            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }
        public void ActivarProducto(int id)
        {
            //aca se cambiaria el estado en casi de trabajar con enum
            SqlCommand cmd = new SqlCommand("UPDATE Producto SET estado = '1' where id=@id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", id);
            cmd.Parameters.Add(parametro);
            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();
        }


        public DataTable ObtenerTodosLosProductos()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT id, nombre, idcategoria, descripcion, proposito, precio, estado FROM Producto", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public DataTable ObtenerTodosLosProductosActivosPorCategoria(int id)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT Producto.id, Producto.nombre, Producto.descripcion, Producto.precio FROM Producto INNER JOIN Categoria ON Producto.idcategoria = Categoria.id WHERE(Producto.estado = 1 and idcategoria = @idcategoria)", Conexion);
            SqlParameter parametro;
            parametro = new SqlParameter("@idcategoria", id);
            cmd.Parameters.Add(parametro);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public DataTable ObtenerTodosLosProductosActivos()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT dbo.Producto.id, dbo.Producto.nombre, dbo.Categoria.descripcion AS idcategoria, dbo.Producto.descripcion, dbo.Producto.proposito, dbo.Producto.precio, CASE WHEN Producto.estado = 1 THEN 'Activo' ELSE 'Inactivo' END AS estado FROM dbo.Producto INNER JOIN dbo.Categoria ON dbo.Producto.idcategoria = dbo.Categoria.id WHERE(dbo.Producto.estado = 1)", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public DataTable ObtenerTodosLosProductosInactivos()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT dbo.Producto.id, dbo.Producto.nombre, dbo.Producto.descripcion,dbo.Producto.precio, CASE WHEN Producto.estado = 2 THEN 'Inactivo' ELSE 'Activo' END AS estado FROM dbo.Producto WHERE(dbo.Producto.estado = 2)", Conexion);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public void EliminarProducto(int Identificacion)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Producto WHERE id = @id", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@id", Identificacion);
            parametro.DbType = System.Data.DbType.Int32;
            cmd.Parameters.Add(parametro);

            Conexion.Open();
            cmd.ExecuteNonQuery();
            Conexion.Close();

        }
    }
}