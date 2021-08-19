package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class UserRoleModelDS implements Model<UserRoleBean> {

	public UserRoleModelDS(DataSource ds) {
		this.ds=ds;
	}
	
	@Override
	public UserRoleBean doRettrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<UserRoleBean> doRetrieveAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM Copre;";
		Collection<UserRoleBean> usersRole=new LinkedList<UserRoleBean>();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			Utility.print("doRetrieveAll:"+ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				UserRoleBean bean=new UserRoleBean();
				bean.setUsername(rs.getString("Username"));
				bean.setIdRuolo(rs.getInt("IDRuolo"));
				usersRole.add(bean);
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
		return usersRole;
	}

	@Override
	public void doSave(UserRoleBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(UserRoleBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(UserRoleBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	private DataSource ds;
}
