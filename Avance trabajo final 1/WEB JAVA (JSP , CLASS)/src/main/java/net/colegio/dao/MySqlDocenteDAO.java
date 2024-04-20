package net.colegio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import net.colegio.entity.Docente;
import net.colegio.interfaces.DocenteDAO;
import net.colegio.utils.MySqlConectar;
import java.util.ArrayList;
public class MySqlDocenteDAO implements DocenteDAO {

	@Override
	public int save(Docente bean) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="insert into tb_docente values(null,?,?,?,?,?,?,?)";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql);
			//4. parámetros
			pstm.setString(1,bean.getNombre());
			pstm.setString(2,bean.getPaterno());
			pstm.setString(3,bean.getMaterno());
			pstm.setString(4,bean.getSexo());
			pstm.setInt(5,bean.getHijos());
			pstm.setDouble(6,bean.getSueldo());
			pstm.setInt(7,bean.getCodigoColegio());
			//5. ejecutar "pstm"
			//si la sentencia INSERT se ejecuta correctamente el método 
			//executeUpdate retorna "1"
			salida=pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public int update(Docente bean) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="update tb_docente set nom_doc=?,pat_doc=?,mat_doc=?,sex_doc=?,num_hijo_doc=?,sue_doc=?,cod_col_doc=? where cod_doc=?";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql);
			//4. parámetros
			pstm.setString(1,bean.getNombre());
			pstm.setString(2,bean.getPaterno());
			pstm.setString(3,bean.getMaterno());
			pstm.setString(4,bean.getSexo());
			pstm.setInt(5,bean.getHijos());
			pstm.setDouble(6,bean.getSueldo());
			pstm.setInt(7,bean.getCodigoColegio());
			pstm.setInt(8,bean.getCodigo());
			//5. ejecutar "pstm"
			//si la sentencia INSERT se ejecuta correctamente el método 
			//executeUpdate retorna "1"
			salida=pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public int deleteById(int cod) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="delete from tb_docente where cod_doc=?";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql);
			//4. parámetros
			pstm.setInt(1,cod);
			//5. ejecutar "pstm"
			//si la sentencia INSERT se ejecuta correctamente el método 
			//executeUpdate retorna "1"
			salida=pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public Docente findById(int cod) {
		Docente bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="select *from tb_docente where cod_doc=?";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql); 
			//4. parámetros
			pstm.setInt(1,cod);
			//5. ejecutar pstm
			rs=pstm.executeQuery();
			//6. bucle
			if(rs.next()){
				//7. crear objeto de la clase Docente
				bean=new Docente();
				//8 setear atributos del objeto "d" con los valores de la fila actual "rs"
				bean.setCodigo(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setPaterno(rs.getString(3));
				bean.setMaterno(rs.getString(4));
				bean.setSexo(rs.getString(5));
				bean.setHijos(rs.getInt(6));
				bean.setSueldo(rs.getDouble(7));
				bean.setCodigoColegio(rs.getInt(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null) rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean;
	}

	@Override
	public List<Docente> findAll() {
		List<Docente> lista=new ArrayList<Docente>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="select *from tb_docente";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql); 
			//4. parámetros
			//5. ejecutar pstm
			rs=pstm.executeQuery();
			//6. bucle
			while(rs.next()){
				//7. crear objeto de la clase Docente
				Docente d=new Docente();
				//8 setear atributos del objeto "d" con los valores de la fila actual "rs"
				d.setCodigo(rs.getInt(1));
				d.setNombre(rs.getString(2));
				d.setPaterno(rs.getString(3));
				d.setMaterno(rs.getString(4));
				d.setSexo(rs.getString(5));
				d.setHijos(rs.getInt(6));
				d.setSueldo(rs.getDouble(7));
				//9 adicionar objeto "d" dentro del arreglo lista
				lista.add(d);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null) rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}
	

}



