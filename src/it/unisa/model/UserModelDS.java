package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.sql.Date;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class UserModelDS implements Model<UserBean> {
	
	public UserModelDS(DataSource ds) {
		this.ds=ds;
	}

	@Override
	public UserBean doRettrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public UserBean doRetrieveByUsername(String name)throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM Utente WHERE Username = ?";
		UserBean bean = new UserBean();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			ps.setString(1, name);	
			ResultSet rs=ps.executeQuery();
			if(!rs.first()) {
				//Setta il cursore sulla prima riga, vedendo se esiste (poiché ResultSet non può mai essere null)
				//System.out.println("L'utente non è stato trovato");
				//Se l'utente con quell'username non esiste
				return null;
			}
				while(rs.next()) {
					bean.setUsername(rs.getString("Username"));
					bean.setNome(rs.getString("Nome"));
					bean.setCognome(rs.getString("Cognome"));
					bean.setImg(rs.getBlob("Img"));
					bean.setEmail(rs.getString("Email"));
					bean.setPass(rs.getString("Pass"));
					bean.setDataNascita(rs.getDate("DataNascita"));
					bean.setMatricola(rs.getString("Matricola"));
					bean.setUltimoAccesso(rs.getTimestamp("Denominazione"));
					bean.setCoin(rs.getInt("Coin"));
					bean.setBan(rs.getDate("Ban"));
					bean.setDenominazione(rs.getString("Denominazione"));
					bean.setDipName(rs.getString("DipName"));
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
		
		return bean;
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
				bean.setUltimoAccesso(rs.getTimestamp("Denominazione"));
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

		String insertSQL = "INSERT INTO Utente" + " (Username, Nome, Cognome, Email, Pass, DataNascita, UltimoAccesso, Coin, Denominazione, DipName) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			connection = ds.getConnection();
			ps = connection.prepareStatement(insertSQL);
			ps.setString(1, item.getUsername());
			ps.setString(2, item.getNome());
			ps.setString(3, item.getCognome());
			ps.setString(4, item.getEmail());
			ps.setString(5, item.getPass());
			
		//	Date dataNascita = item.getDataNascita();
			
			ps.setDate(6, item.getDataNascita());
			ps.setTimestamp(7, item.getUltimoAccesso());
			ps.setInt(8, 50);
			ps.setString(9, item.getDenominazione());
			ps.setString(10, item.getDipName());
			

			ps.executeUpdate();
			System.out.println("Ciao2");
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
	public void doUpdate(UserBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(UserBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	private DataSource ds;
}
