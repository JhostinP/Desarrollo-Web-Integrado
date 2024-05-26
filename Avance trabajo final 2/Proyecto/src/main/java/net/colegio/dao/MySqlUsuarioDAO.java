package net.colegio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.colegio.entity.Enlace;
import net.colegio.entity.Usuario;
import net.colegio.interfaces.UsuarioDAO;
import net.colegio.utils.MySqlConectar;

public class MySqlUsuarioDAO implements UsuarioDAO{

	@Override
	public Usuario iniciarSesion(String login, String clave) {
		Usuario bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1. conexión a bd
			cn=new MySqlConectar().getConectar();
			//2. sentencia sql
			String sql="SELECT cod_usu,nombre,apellido,idrol \r\n"
					+ "FROM tb_usuario \r\n"
					+ "WHERE login=? AND PASSWORD=?";
			//3. crear pstm
			pstm=cn.prepareStatement(sql);
			//4. paramétros
			pstm.setString(1, login);
			pstm.setString(2, clave);
			//5. ejecutar
			rs=pstm.executeQuery();
			//6. validar si rs tiene datos
			if(rs.next()) {
				//7. crear objeto bean
				bean=new Usuario();
				//8. asignar valor a los atributos del objeto "bean" con
				//la fila actual de rs
				bean.setCodigo(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setApellido(rs.getString(3));
				bean.setCodigoRol(rs.getInt(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	@Override
	public List<Enlace> traerEnlacesDelUsuario(int codRol) {
		List<Enlace> lista=new ArrayList<Enlace>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=new MySqlConectar().getConectar();
			String sql="SELECT e.idenlace,e.descripcion,e.ruta FROM \r\n"
					+ "tb_enlace e JOIN tb_rol_enlace re ON \r\n"
					+ "e.idenlace=re.idenlace WHERE re.idrol=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, codRol);
			rs=pstm.executeQuery();
			while(rs.next()) {
				//crear objeto de la clase Enlace
				Enlace bean=new Enlace();
				//asignar valor a los atributos del objeto "bean" con la fila actual "rs"
				bean.setCodigo(rs.getInt(1));
				bean.setDescripcion(rs.getString(2));
				bean.setRuta(rs.getString(3));
				//adicionar objeto "bean" dentro del arreglo lista
				lista.add(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}

}








