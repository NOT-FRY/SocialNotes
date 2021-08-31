package it.unisa.model;

import java.io.InputStream;
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
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM Materiale WHERE CodiceMateriale=?;";
		MaterialBean bean=new MaterialBean();
		ResultSet rs=null;
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			int codice=Integer.parseInt(code);
			ps.setInt(1, codice);
			rs=ps.executeQuery();
			System.out.println("ciao");
			if(rs.next()) {
				bean.setDataCaricamento(rs.getDate("DataCaricamento"));
				bean.setKeywords(rs.getString("Keywords"));
				bean.setCosto(rs.getInt("Costo"));
				bean.setDescrizione(rs.getString("Descrizione"));
				bean.setHidden(rs.getBoolean("Hidden"));
				bean.setCodiceCorso(rs.getInt("CodiceCorso"));
				bean.setUsername(rs.getString("Username"));
				bean.setFileName(rs.getString("FileName"));
				bean.setAnteprima(rs.getBlob("Anteprima").getBinaryStream());
			}
		}
		finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			}
			finally {
				if(con!=null)
					con.close();
			}
		}
		return bean;
		
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
				bean.setAnteprima((InputStream)rs.getBlob("Anteprima"));
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
	
	public Collection<MaterialBean>  doRetrieveByString(String str) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		
		String selectSQL="SELECT * FROM Materiale WHERE Descrizione LIKE ? OR CodiceCorso IN (SELECT CodiceCorso From Corso WHERE Nome LIKE ?);";
		Collection<MaterialBean> material=new LinkedList<MaterialBean>();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			ps.setString(1, '%'+str+'%');
			ps.setString(2, '%'+str+'%');
			
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
				bean.setAnteprima(rs.getBlob("Anteprima").getBinaryStream());
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
		Connection connection = null;
		PreparedStatement ps = null;

		String sql = "INSERT INTO Materiale" + " (DataCaricamento,Keywords,Costo,Descrizione,Hidden,CodiceCorso,Username,FileName,Anteprima) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			connection = ds.getConnection();
			ps = connection.prepareStatement(sql);
			ps.setDate(1, item.getDataCaricamento());
			ps.setString(2, item.getKeywords());
			ps.setInt(3, item.getCosto());
			ps.setString(4, item.getDescrizione());
			ps.setBoolean(5, item.isHidden());
			ps.setInt(6, item.getCodiceCorso());
			ps.setString(7, item.getUsername());
			ps.setString(8, item.getFileName());
			ps.setBlob(9, item.getAnteprima());
			
		

			ps.executeUpdate();
			System.out.println("Materiale inserito");
		} finally {
			try {
				if(ps!=null)
					ps.close();
			}
			finally {
				if(connection!=null)
					connection.close();
			}
		}
	}

	@Override
	public void doUpdate(MaterialBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(MaterialBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	public int getQuantitaMaterialeCondiviso(String username)throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="SELECT count(*) as QuantitaMateriale FROM Materiale WHERE Username=?";
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, username);
			rs=ps.executeQuery();
			if(rs.next())
				return rs.getInt("QuantitaMateriale");
			return -1;
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			}
			finally {
				if(con!=null)
					con.close();
			}
		}
	}

	private DataSource ds;
}
