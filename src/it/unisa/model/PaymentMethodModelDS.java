package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;


import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class PaymentMethodModelDS implements Model<PaymentMethodBean> {

	public PaymentMethodModelDS(DataSource ds) {
		this.ds=ds;
	}
	
	@Override
	public PaymentMethodBean doRetrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<PaymentMethodBean> doRetrieveAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM MetodoPagamento;";
		Collection<PaymentMethodBean> cards=new LinkedList<PaymentMethodBean>();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			Utility.print("doRetrieveAll:"+ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				PaymentMethodBean bean=new PaymentMethodBean();
				bean.setNumeroCarta(rs.getString("NumeroCarta"));
				bean.setDataScadenza(rs.getDate("DataScadenza"));
				bean.setNomeIntestatario(rs.getString("NomeIntestatario"));
				bean.setCognomeIntestatario(rs.getString("CognomeIntestatario"));
				bean.setUsername(rs.getString("Username"));
				cards.add(bean);
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
		return cards;
	}

	@Override
	public void doSave(PaymentMethodBean item) throws SQLException {
		Connection connection = null;
		PreparedStatement ps = null;

		String insertSQL = "INSERT INTO MetodoPagamento (NumeroCarta, DataScadenza,NomeIntestatario,CognomeIntestatario,Username) VALUES (?,?,?,?,?)";

		try {
			connection = ds.getConnection();
			ps = connection.prepareStatement(insertSQL);

			ps.setString(1,item.getNumeroCarta());
			ps.setDate(2, item.getDataScadenza());
			ps.setString(3, item.getNomeIntestatario());
			ps.setString(4, item.getCognomeIntestatario());
			ps.setString(5,item.getUsername());
			ps.executeUpdate();
			System.out.println("Metodo di pagamento inserito");

		} finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				if (connection != null) {
					connection.close();
				}
			}
		}
		
	}

	@Override
	public void doUpdate(PaymentMethodBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(PaymentMethodBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	private DataSource ds;
}
