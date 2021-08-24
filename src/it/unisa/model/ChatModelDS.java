package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class ChatModelDS implements Model<ChatBean> {

	public ChatModelDS(DataSource ds) {
		this.ds=ds;
	}
	
	@Override
	public ChatBean doRetrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<ChatBean> doRetrieveAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM Chat;";
		Collection<ChatBean> chats=new LinkedList<ChatBean>();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			Utility.print("doRetrieveAll:"+ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ChatBean bean=new ChatBean();
				bean.setChatID(rs.getInt("ChatID"));
				bean.setTitolo(rs.getString("Titolo"));
				chats.add(bean);
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
		return chats;
	
	}

	@Override
	public void doSave(ChatBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(ChatBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(ChatBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	private DataSource ds;
}
