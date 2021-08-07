package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class UserModelDS implements Model<UserBean> {
	
	public UserModelDS(DataSource ds) {
		this.ds=ds;
	}

	@Override
	public UserBean doRetrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<UserBean> doRetrieveAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM Utente;";
		Collection<UserBean> users=new LinkedList<UserBean>();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			Utility.print("doRetrieveAll:"+ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				UserBean bean=new UserBean();
				bean.setUsername(rs.getString("Username"));
				bean.setNome(rs.getString("Nome"));
				bean.setCognome(rs.getString("Cognome"));
				bean.setImg(rs.getBlob("Img"));
				bean.setEmail(rs.getString("Email"));
				bean.setPass(rs.getString("Pass"));
				bean.setDataNascita(rs.getDate("DataNascita"));
				bean.setMatricola(rs.getString("Matricola"));
				bean.setUltimoAccesso(rs.getDate("UltimoAccesso"));//Simone , ho provato con la classe Date , su Internet dice che va bene per gestire queste problematiche (ALFONSO)
				bean.setCoin(rs.getInt("Coin"));
				bean.setBan(rs.getDate("Ban"));
				bean.setDenominazione(rs.getString("Denominazione"));
				bean.setDipName(rs.getString("DipName"));
				users.add(bean);
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
		return users;
	}

	@Override
	public void doSave(UserBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement ps = null;

		String insertSQL = "INSERT INTO Utente" + " (Username, Nome, Cognome, Email, Pass) VALUES (?, ?, ?, ?, ?)";
		
	}

	@Override
	public void doUpdate(UserBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(UserBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	private DataSource ds;
}
