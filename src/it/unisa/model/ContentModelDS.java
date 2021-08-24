package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class ContentModelDS implements Model<ContentBean>{
	
	public ContentModelDS(DataSource ds) {
		this.ds=ds;
	}

	@Override
	public ContentBean doRetrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<ContentBean> doRetrieveAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM Contenuto;";
		Collection<ContentBean> content=new LinkedList<ContentBean>();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			Utility.print("doRetrieveAll:"+ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ContentBean bean=new ContentBean();
				bean.setCodiceNews(rs.getInt("CodiceNews"));
				bean.setFileName(rs.getString("FileName"));
				content.add(bean);
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
		return content;
	}

	@Override
	public void doSave(ContentBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(ContentBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(ContentBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	private DataSource ds;
}
