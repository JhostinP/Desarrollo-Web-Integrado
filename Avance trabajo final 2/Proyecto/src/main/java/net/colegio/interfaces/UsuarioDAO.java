package net.colegio.interfaces;

import java.util.List;

import net.colegio.entity.Enlace;
import net.colegio.entity.Usuario;

public interface UsuarioDAO {
	//definir métodos
	Usuario iniciarSesion(String login,String clave);
	List<Enlace> traerEnlacesDelUsuario(int codRol);	
}



