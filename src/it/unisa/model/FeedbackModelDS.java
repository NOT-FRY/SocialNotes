package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class FeedbackModelDS implements Model<FeedbackBean> {

	public FeedbackModelDS(DataSource ds) {
		this.ds=ds;
	}
	
	
	@Override
	public FeedbackBean doRetrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<FeedbackBean> doRetrieveAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM Feedback;";
		Collection<FeedbackBean> feeds=new LinkedList<FeedbackBean>();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			Utility.print("doRetrieveAll:"+ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FeedbackBean bean=new FeedbackBean();
				bean.setCodiceMateriale(rs.getInt("CodiceMateriale"));
				bean.setUsername(rs.getString("Username"));
				bean.setDataFeed(rs.getDate("DataFeed"));
				bean.setCommento(rs.getString("Commento"));
				bean.setValutazione(rs.getInt("Valutazione"));
				feeds.add(bean);
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
		return feeds;

	}

	@Override
	public void doSave(FeedbackBean item) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doUpdate(FeedbackBean item) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doDelete(FeedbackBean item) throws SQLException {
		// TODO Auto-generated method stub

	}

	private DataSource ds;
}
