package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MySqlTipoBienDAO implements TipoBienDAO{

	public List<TipoBien> findAllTipoBien(){
		List<TipoBien> lista=new ArrayList<TipoBien>();
		TipoBien bean;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=new MysqlDBConexion.getConexion();
			String sql="SELECT *FROM tb_tipo_bien";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				bean=new TipoBien();
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
