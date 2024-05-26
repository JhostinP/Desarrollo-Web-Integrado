package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MySqlBienDAO implements BienDAO{

	public List<Bien> findAllBienByTipo(int codTipo){
		List<Bien> lista=new ArrayList<Bien>();
		Bien bean;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=new MysqlDBConexion.getConexion();
			String sql="SELECT *FROM tb_bien where cod_tipo_bien=?";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				bean=new Bien();
				bean.setCodigo(rs.getInt(1));
				bean.setDescripcion(rs.getString(2));
				lista.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return lista;
	}
}
