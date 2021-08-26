package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class CourseModelDS implements Model<CourseBean> {
	
	public CourseModelDS(DataSource ds) {
		this.ds=ds;
	}

	
	@Override
	public CourseBean doRetrieveByKey(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<CourseBean> doRetrieveAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String selectSQL="SELECT * FROM Corso;";
		Collection<CourseBean> courses=new LinkedList<CourseBean>();
		try {
			con=ds.getConnection();
			ps=con.prepareStatement(selectSQL);
			Utility.print("doRetrieveAll:"+ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				CourseBean bean=new CourseBean();
				bean.setCodiceCorso(rs.getInt("CodiceCorso"));
				bean.setNome(rs.getString("Nome"));
				courses.add(bean);
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
		return courses;
	}

	@Override
	public void doSave(CourseBean item) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doUpdate(CourseBean item) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doDelete(CourseBean item) throws SQLException {
		// TODO Auto-generated method stub

	}

	private DataSource ds;
}
