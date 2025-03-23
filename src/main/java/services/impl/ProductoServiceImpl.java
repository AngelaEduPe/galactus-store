package services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import dao.ProductoMapper;
import models.Producto;
import services.ProductoService;

public class ProductoServiceImpl implements ProductoService {

	@Override
	public List<Producto> listarProductosPorParametros(Integer idSubcategoria, Integer idProducto) {
		try {
			SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
			ProductoMapper productoMapper = session.getMapper(ProductoMapper.class);
			
			Map<String, Object> parametros = new HashMap<>();
	        parametros.put("idSubcategoria", idSubcategoria);
	        parametros.put("idProducto", idProducto);
			
			return productoMapper.listarProductosPorParametros(parametros);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public List<String> listarImagenesPorProducto(int idProducto) {
	    try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
	        ProductoMapper productoMapper = session.getMapper(ProductoMapper.class);
	        return productoMapper.listarImagenesPorProducto(idProducto);
	    }
	}
	
	
	public String obtenerNombreMarca(Integer idMarca) {
	    try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
	        return session.selectOne("dao.ProductoMapper.obtenerNombreMarca", idMarca);
	    }
	}

	public String obtenerNombreProveedor(Integer idProveedor) {
	    try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
	        return session.selectOne("dao.ProductoMapper.obtenerNombreProveedor", idProveedor);
	    }
	}




}
