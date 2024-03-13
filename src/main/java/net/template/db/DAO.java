package net.template.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void connectionDB() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int isId(String id) {
		return isId(id, null);
	}

	public int isId(String id, String password) {

		int result = 0; // 아이디가 존재하지 않는 경우

		try {
			connectionDB();

			String select_sql = "select id, password from template_join where id = ?";

			// PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(select_sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("password").equals(password)) {
					result = 1; // 아이디와 비밀번호가 일치하는 경우
				} else {
					result = -1; // 아이디는 일치하고 비밀번호가 일치하지 않는
				}
			} // if (rs.next())

		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			rsClose(rs);
			pstmtClose(pstmt);
			connClose(conn);
		}

		return result;
	}

	public int insert(Template_join join) {
		int result = 0;

		try {
			connectionDB();

			String sql = "insert into template_join "
					+ " (id, password, jumin, email, gender, hobby, post, address, intro) "
					+ " values(?,?,?,?,?,?,?,?,?)";

			// PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, join.getId());
			pstmt.setString(2, join.getPassword());
			pstmt.setString(3, join.getJumin());
			pstmt.setString(4, join.getEmail());
			pstmt.setString(5, join.getGender());
			pstmt.setString(6, join.getHobby());
			pstmt.setString(7, join.getPost());
			pstmt.setString(8, join.getAddress());
			pstmt.setString(9, join.getIntro());
			result = pstmt.executeUpdate();

		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			pstmtClose(pstmt);
			connClose(conn);
		}

		return result;
	}

	public Template_join selectInfo(String id) {
		try {
			connectionDB();

			String select_sql = "select * from template_join where id = ?";

			// PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(select_sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Template_join temp = new Template_join();
				temp.setId(rs.getString("id"));
				temp.setPassword(rs.getString("password"));
				temp.setJumin(rs.getString("jumin"));
				temp.setEmail(rs.getString("email"));
				temp.setGender(rs.getString("gender"));
				temp.setHobby(rs.getString("hobby"));
				temp.setPost(rs.getString("post"));
				temp.setAddress(rs.getString("address"));
				temp.setIntro(rs.getString("intro"));
				temp.setRegister_date(rs.getString("register_date"));
				return temp;
			}

		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			rsClose(rs);
			pstmtClose(pstmt);
			connClose(conn);
		}

		return null;
	}

	public int update(Template_join join) {
		int result = 0;
		
		try {
			connectionDB();

			String select_sql = " update template_join "
							  + " set password=?, jumin=?, email=?, gender=?,  "
							  + " 	  hobby=?, post=?, address=?, intro=? "
							  + " where id = ?";

			// PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(select_sql);
			pstmt.setString(1, join.getPassword());
			pstmt.setString(2, join.getJumin());
			pstmt.setString(3, join.getEmail());
			pstmt.setString(4, join.getGender());
			pstmt.setString(5, join.getHobby());
			pstmt.setString(6, join.getPost());
			pstmt.setString(7, join.getAddress());
			pstmt.setString(8, join.getIntro());
			pstmt.setString(9, join.getId());
			result = pstmt.executeUpdate();
			
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			pstmtClose(pstmt);
			connClose(conn);
		}
		return result;
	}
	
	public ArrayList<Template_join> selectAll() {
		ArrayList<Template_join> list = new ArrayList<Template_join>();
		
		try {
			connectionDB();

			String select_sql = " select * from template_join "
							  + " where id != 'admin' "
							  + " order by register_date desc ";

			// PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(select_sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Template_join temp = new Template_join();
				temp.setId(rs.getString("id"));
				// temp.setPassword(rs.getString("password"));
				// temp.setJumin(rs.getString("jumin"));
				// temp.setEmail(rs.getString("email"));
				temp.setGender(rs.getString("gender"));
				temp.setHobby(rs.getString("hobby"));
				// temp.setPost(rs.getString("post"));
				// temp.setAddress(rs.getString("address"));
				temp.setIntro(rs.getString("intro"));
				temp.setRegister_date(rs.getString("register_date"));
				list.add(temp);
			}
			
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			rsClose(rs);
			pstmtClose(pstmt);
			connClose(conn);
		}
		
		return list;
	}

	public void rsClose(ResultSet rs) {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
	}

	public void pstmtClose(PreparedStatement pstmt) {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
	}

	public void connClose(Connection conn) {
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
	}
}
