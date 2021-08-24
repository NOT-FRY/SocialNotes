package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class NewsModelDS implements Model<NewsBean>{

	public NewsModelDS(DataSource ds) {
		this.ds=ds;
	}
	
	
	@Override
	public NewsBean doRetrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<NewsBean> doRetrieveAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM News;";
		Collection<NewsBean> news=new LinkedList<NewsBean>();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			Utility.print("doRetrieveAll:"+ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				NewsBean bean=new NewsBean();
				bean.setCodiceNews(rs.getInt("CodiceNews"));
				bean.setTitolo(rs.getString("Titolo"));
				bean.setArgomento(rs.getString("Argomento"));
				bean.setContenuto(rs.getString("Contenuto"));
				bean.setUsername(rs.getString("Username"));
				news.add(bean);
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
		return news;
	}

	@Override
	public void doSave(NewsBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(NewsBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(NewsBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	private DataSource ds;
}
