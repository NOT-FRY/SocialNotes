package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class FriendsModelDS implements Model<FriendsBean> {

	public FriendsModelDS(DataSource ds) {
		this.ds=ds;
	}
	
	
	@Override
	public FriendsBean doRetrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<FriendsBean> doRetrieveAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM Amicizia;";
		Collection<FriendsBean> friends=new LinkedList<FriendsBean>();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			Utility.print("doRetrieveAll:"+ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FriendsBean bean=new FriendsBean();
				bean.setUsername1(rs.getString("Username1"));
				bean.setUsername2(rs.getString("Username2"));
				bean.setDataInizio(rs.getDate("DataInizio"));
				friends.add(bean);
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
		return friends;
	}

	@Override
	public void doSave(FriendsBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(FriendsBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(FriendsBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	private DataSource ds;
}
