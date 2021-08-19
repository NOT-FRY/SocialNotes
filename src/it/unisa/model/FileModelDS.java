package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class FileModelDS implements Model<FileBean> {
   
	
	public FileModelDS(DataSource ds) {
		this.ds=ds;
	}

	@Override
	public FileBean doRettrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<FileBean> doRetrieveAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM Files;";
		Collection<FileBean> files=new LinkedList<FileBean>();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			Utility.print("doRetrieveAll:"+ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FileBean bean=new FileBean();
				bean.setFilename(rs.getString("FileName"));
				bean.setFormato(rs.getString("Formato"));
				bean.setContenuto(rs.getBlob("Contenuto"));
				bean.setDimensione(rs.getInt("Dimensione"));
				files.add(bean);
				
		
				
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
		return files;
	}
	
	@Override
	public void doSave(FileBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(FileBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(FileBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}


	private DataSource ds;



	
}


