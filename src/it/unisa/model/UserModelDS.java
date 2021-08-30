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

public class UserModelDS implements Model<UserBean> {

	public UserModelDS(DataSource ds) {
		this.ds=ds;
	}

	@Override
	public UserBean doRetrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


	public UserBean checkLogin(String name,String password)throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String sql="SELECT * FROM Utente WHERE Email = ? OR Username=?";
		//System.out.println("name in usermodel "+name);
		//System.out.println("pass in usermodel "+password);
		UserBean bean=new UserBean();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, name);
			ResultSet rs=ps.executeQuery();

			if(rs.next()&&(rs.getString("Pass").compareTo(password))==0) {
				System.out.println("Utente loggato");
				bean.setUsername(rs.getString("Username"));
				bean.setNome(rs.getString("Nome"));
				bean.setCognome(rs.getString("Cognome"));
				bean.setImg(rs.getBlob("Img"));
				bean.setEmail(rs.getString("Email"));
				bean.setPass(rs.getString("Pass"));
				bean.setDataNascita(rs.getDate("DataNascita"));
				bean.setMatricola(rs.getString("Matricola"));
				bean.setUltimoAccesso(rs.getTimestamp("UltimoAccesso"));
				bean.setCoin(rs.getInt("Coin"));
				bean.setBan(rs.getDate("Ban"));
				bean.setDenominazione(rs.getString("Denominazione"));
				bean.setDipName(rs.getString("DipName"));
			}
			else {
				System.out.println("Utente non loggato");
				return null;
			}
			if(rs!=null)
				rs.close();
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
		//System.out.println(bean.toString());
		return bean;
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
			if(rs.next()) {
				bean.setUsername(rs.getString("Username"));
				bean.setNome(rs.getString("Nome"));
				bean.setCognome(rs.getString("Cognome"));
				bean.setImg(rs.getBlob("Img"));
				bean.setEmail(rs.getString("Email"));
				bean.setPass(rs.getString("Pass"));
				bean.setDataNascita(rs.getDate("DataNascita"));
				bean.setMatricola(rs.getString("Matricola"));
				bean.setUltimoAccesso(rs.getTimestamp("UltimoAccesso"));
				bean.setCoin(rs.getInt("Coin"));
				bean.setBan(rs.getDate("Ban"));
				bean.setDenominazione(rs.getString("Denominazione"));
				bean.setDipName(rs.getString("DipName"));
			}
			else
				return null;
			if(rs!=null)
				rs.close();
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

	public UserBean doRetrieveByEmail(String Email)throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM Utente WHERE Email = ?";
		UserBean bean = new UserBean();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			ps.setString(1, Email);	
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				bean.setUsername(rs.getString("Username"));
				bean.setNome(rs.getString("Nome"));
				bean.setCognome(rs.getString("Cognome"));
				bean.setImg(rs.getBlob("Img"));
				bean.setEmail(rs.getString("Email"));
				bean.setPass(rs.getString("Pass"));
				bean.setDataNascita(rs.getDate("DataNascita"));
				bean.setMatricola(rs.getString("Matricola"));
				bean.setUltimoAccesso(rs.getTimestamp("UltimoAccesso"));
				bean.setCoin(rs.getInt("Coin"));
				bean.setBan(rs.getDate("Ban"));
				bean.setDenominazione(rs.getString("Denominazione"));
				bean.setDipName(rs.getString("DipName"));
			}
			else
				return null;
			if(rs!=null)
				rs.close();

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
				bean.setUltimoAccesso(rs.getTimestamp("UltimoAccesso"));
				bean.setCoin(rs.getInt("Coin"));
				bean.setBan(rs.getDate("Ban"));
				bean.setDenominazione(rs.getString("Denominazione"));
				bean.setDipName(rs.getString("DipName"));
				users.add(bean);
			}
			if(rs!=null)
				rs.close();
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

		String insertSQL = "INSERT INTO Utente (Username, Nome, Cognome, Email, Pass, DataNascita, UltimoAccesso, Coin, Denominazione, DipName) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
			System.out.println("Salvato nel Database");
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
	
	public void doUpdatePassword(String username,String newPassword)throws SQLException {
		Connection connection = null;
		PreparedStatement ps = null;

		String sql = "UPDATE Utente SET Pass = ? WHERE Username = ?";
		
		try {
			connection = ds.getConnection();
			ps = connection.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setString(2, username);
			ps.executeUpdate();
			System.out.println("Password aggiornata");
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
	
	
	public void doUpdateEmail(String username,String newMail)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;

		String sql = "UPDATE Utente SET  Email= ? WHERE Username = ?";
		
		try {
			connection = ds.getConnection();
			ps = connection.prepareStatement(sql);
			ps.setString(1, newMail);
			ps.setString(2, username);
			ps.executeUpdate();
			System.out.println("Email aggiornata");
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
	
	
	public void doUpdateDepartment(String username,String newDipName,String newUniversity) throws SQLException {
		Connection connection = null;
		PreparedStatement ps = null;

		String sql = "UPDATE Utente SET  dipName= ?,Denominazione=? WHERE Username = ?";
		
		try {
			connection = ds.getConnection();
			ps = connection.prepareStatement(sql);
			ps.setString(1, newDipName);
			ps.setString(2, newUniversity);
			ps.setString(3, username);
			ps.executeUpdate();
			System.out.println("Dipartimento aggiornato");
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
	
	
	public void doUpdateImage(String username,InputStream image) throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;

		String sql = "UPDATE Utente SET  Img=? WHERE Username = ?";
		
		try {
			connection = ds.getConnection();
			ps = connection.prepareStatement(sql);
			ps.setBlob(1, image);
			ps.setString(2, username);
			ps.executeUpdate();
			System.out.println("Immagine di profilo aggiornata");
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
	public void doDelete(UserBean item) throws SQLException {
		// TODO Auto-generated method stub

	}

	private DataSource ds;
}
