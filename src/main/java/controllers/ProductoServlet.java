package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Producto;
import models.Subcategoria;
import services.CategoriaService;
import services.ProductoService;
import services.impl.CategoriaServiceImpl;
import services.impl.ProductoServiceImpl;

@WebServlet("/productos")
public class ProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ProductoService productoService;

    public ProductoServlet() {
        super();
        productoService = new ProductoServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProductoParam = request.getParameter("idProducto");
        String idSubcategoriaParam = request.getParameter("idSubcategoria");

        if (idProductoParam != null) {            
                Integer idProducto = Integer.parseInt(idProductoParam);
                List<Producto> productos = productoService.listarProductosPorParametros(null, idProducto);

                    Producto producto = productos.get(0);
                    List<String> imagenes = productoService.listarImagenesPorProducto(idProducto);
                    
                    String marcaNombre = productoService.obtenerNombreMarca(producto.getIdMarca());
                    String proveedorNombre = productoService.obtenerNombreProveedor(producto.getIdProveedor());

                    request.setAttribute("producto", producto);
                    request.setAttribute("imagenes", imagenes);
                    request.setAttribute("marca_nombre", marcaNombre);
                    request.setAttribute("proveedor_nombre", proveedorNombre);

                    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/producto_detalle.jsp");
                    dispatcher.forward(request, response);
                
        } else if (idSubcategoriaParam != null) {           
                Integer idSubcategoria = Integer.parseInt(idSubcategoriaParam);
                List<Producto> productos = productoService.listarProductosPorParametros(idSubcategoria, null);

                request.setAttribute("productos", productos);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/productos.jsp");
                dispatcher.forward(request, response);
            
        } 
    }
}