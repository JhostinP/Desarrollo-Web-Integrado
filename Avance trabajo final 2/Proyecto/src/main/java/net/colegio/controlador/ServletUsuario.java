package net.colegio.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.colegio.dao.MySqlUsuarioDAO;
import net.colegio.entity.Enlace;
import net.colegio.entity.Usuario;

@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletUsuario() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("tipo");
		if (accion.equals("INICIAR"))
			iniciarLogin(request,response);
		else if(accion.equals("CERRAR"))	
			cerrarLogin(request,response);
	}
	private void cerrarLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//obtener la sesión actual
		HttpSession session=request.getSession();
		//invalidar todos los atributos de tipo sesión
		session.invalidate();
		request.getSession().setAttribute("MENSAJE", "Sesión terminada");
		response.sendRedirect("login.jsp");
	}
	private void iniciarLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//recuperar cajas
		String vLogin,vClave;
		vLogin=request.getParameter("username");
		vClave=request.getParameter("password");
		//validar si el usuario y la clave coinciden
		Usuario usu=new MySqlUsuarioDAO().iniciarSesion(vLogin, vClave);
		if(usu==null) {
			//atributo de tipo sesion
			request.getSession().setAttribute("MENSAJE", "Usuario y/o clave incorrectos");
			response.sendRedirect("login.jsp");
		}
		else {
			//obtener los enlaces del usuario que inicio sesión(atributo rol)
			List<Enlace>lista=new MySqlUsuarioDAO().traerEnlacesDelUsuario(usu.getCodigoRol());
			//crear objeto de tipo sesión
			HttpSession session=request.getSession();
			//crear atributo de tipo sesión
			session.setAttribute("listaEnlaces", lista);
			session.setAttribute("datosUsuario", usu.getApellido()+" "+usu.getNombre());
			response.sendRedirect("intranet.jsp");
		}
		
		
	}
}








