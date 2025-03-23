package services;

import java.util.List;

import models.Producto;

public interface ProductoService {
	List<Producto> listarProductosPorParametros(Integer idSubcategoria, Integer idProducto);
	List<String> listarImagenesPorProducto(int idProducto);
	String obtenerNombreMarca(Integer idMarca);
    String obtenerNombreProveedor(Integer idProveedor);
}
