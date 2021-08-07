package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class MaterialModelDS implements Model<MaterialBean> {
	
	public MaterialModelDS(DataSource ds) {
		this.ds=ds;
	}

	@Override
	public MaterialBean doRetrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<MaterialBean> doRetrieveAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM Materiale;";
		Collection<MaterialBean> material=new LinkedList<MaterialBean>();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			Utility.print("doRetrieveAll:"+ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				MaterialBean bean=new MaterialBean();
				bean.setCodiceMateriale(rs.getInt("CodiceMateriale"));
				bean.setDataCaricamento(rs.getDate("DataCaricamento"));
				bean.setKeywords(rs.getString("Keywords"));
				bean.setCosto(rs.getInt("Costo"));
				bean.setDescrizione(rs.getString("Descrizione"));
				bean.setHidden(rs.getBoolean("Hidden"));
				bean.setCodiceCorso(rs.getInt("CodiceCorso"));
				bean.setUsername(rs.getString("Username"));
				bean.setFileName(rs.getString("FileName"));
				material.add(bean);
			}
		}
		finally {
			try {
				if(ps!=null)
					ps.close();
			}
			finally {
				if(con!=null)
					con.close();
			}
		}
		return material;
	}

	@Override
	public void doSave(MaterialBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(MaterialBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(MaterialBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	private DataSource ds;
}
