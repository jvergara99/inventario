package mx.uv.javc.inventario.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import mx.uv.javc.inventario.entity.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Long>{
    
}
