package net.colegio.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.colegio.dao.MySqlDocenteDAO;
import net.colegio.entity.Docente;

@WebServlet("/ServletDocente")
public class ServletDocente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ServletDocente() {
        super();
       
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//recuperar el parámetro accion
		String tipo=request.getParameter("accion");
		//validar tipo
		if(tipo.equals("grabar"))
			grabarDocente(request,response);
		else if(tipo.equals("listado"))
			listarDocente(request,response);
		else if(tipo.equals("eliminar"))
			eliminarDocente(request,response);	
	}
	private void eliminarDocente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cod=request.getParameter("codigo");
		//invocar al método deleteById y enviar la variable "cod"
		int estado=new MySqlDocenteDAO().deleteById(Integer.parseInt(cod));
		//validar estado
		if(estado==1)
			System.out.println("SI");
		else
			System.out.println("NO");
		//crear atributo de tipo sesión
		request.getSession().setAttribute("MENSAJE","Docente eliminado");
		//invocar método listarDocente
		//listarDocente(request,response);
		response.sendRedirect("docente.jsp");
	}

	private void listarDocente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//crear atributo
		request.setAttribute("docentes",new MySqlDocenteDAO().findAll());
		//direccionar a la página "docente.jsp"
		request.getRequestDispatcher("/docente.jsp").forward(request,response);
	}

	private void grabarDocente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.recuperar los valores de los controles(cajas,select) del formulario 
		//usar atributo name.
		String cod,nom,pat,mat,hijos,sue,sexo,cole;
		cod=request.getParameter("codigo");
		nom=request.getParameter("nombre");
		pat=request.getParameter("paterno");
		mat=request.getParameter("materno");
		hijos=request.getParameter("hijos");
		sue=request.getParameter("sueldo");
		sexo=request.getParameter("sexo");
		cole=request.getParameter("colegio");
		//2.crear objeto de la clase Docente
		Docente bean=new Docente();
		//3.setear los atributos del objeto "bean" con las variables
		bean.setCodigo(Integer.parseInt(cod));
		bean.setNombre(nom);
		bean.setPaterno(pat);
		bean.setMaterno(mat);
		bean.setSexo(sexo);
		bean.setHijos(Integer.parseInt(hijos));
		bean.setSueldo(Double.parseDouble(sue));
		bean.setCodigoColegio(Integer.parseInt(cole));
		//validar variable cod
		if(Integer.parseInt(cod)==0){
			//4.invocar al método save y enviar el objeto "bean"
			int estado=new MySqlDocenteDAO().save(bean);
			//validar estado
			if(estado==1)
				request.getSession().setAttribute("MENSAJE","Docente registrado");
			else
				request.getSession().setAttribute("MENSAJE","Error en el registro");
		}
		else {
			//4.invocar al método update y enviar el objeto "bean"
			int estado=new MySqlDocenteDAO().update(bean);
			//validar estado
			if(estado==1)
				request.getSession().setAttribute("MENSAJE","Docente actualizado");
			else
				request.getSession().setAttribute("MENSAJE","Error en la actualización");
		}		
		response.sendRedirect("docente.jsp");
	}

}







