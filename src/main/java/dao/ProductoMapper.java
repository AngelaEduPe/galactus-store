package dao;

import java.util.List;
import java.util.Map;

import models.Producto;

public interface ProductoMapper {
	List<Producto> listarProductosPorParametros(Map<String, Object> parametros);
	List<String> listarImagenesPorProducto(int idProducto);
	String obtenerNombreMarca(Integer idMarca);
    String obtenerNombreProveedor(Integer idProveedor);
}
