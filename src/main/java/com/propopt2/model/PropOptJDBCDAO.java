package com.propopt2.model;

import com.propprodreview.model.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;

public class PropOptJDBCDAO implements PropOptDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mumu_new");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO proposal_option (PROPOSAL_ID,PROPOSAL_OPTION_NAME,PROPOSAL_OPTION_PRICE,PROPOSAL_OPTION_PICTURE)"
			+ "VALUES (?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM proposal_option order by PROPOSAL_OPTION_ID";
	private static final String GET_ONE_STMT = "SELECT * FROM proposal_option where PROPOSAL_OPTION_ID = ?";
	private static final String GET_STMT_FROM_PROPOSAL_ID = "SELECT * FROM proposal_option where PROPOSAL_ID = ?";

	private static final String DELETE = "DELETE FROM proposal_option where PROPOSAL_OPTION_ID = ?";
	private static final String UPDATE = "UPDATE proposal_option set PROPOSAL_OPTION_NAME=?, PROPOSAL_OPTION_PRICE=? WHERE PROPOSAL_OPTION_ID=?";
	private static final String GET_PROPOPT_BY_PROPOSAL_ID = "SELECT * FROM proposal_option WHERE PROPOSAL_ID = ? order by PROPOSAL_OPTION_ID";

	@Override
	public void insert(PropOptVO propOptVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, propOptVO.getProposalId());
			pstmt.setString(2, propOptVO.getProposalOptionName());
			pstmt.setInt(3, propOptVO.getProposalOptionPrice());
			pstmt.setBytes(4, propOptVO.getProposalOptionPicture());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(PropOptVO propOptVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, propOptVO.getProposalOptionName());
			pstmt.setInt(2, propOptVO.getProposalOptionPrice());
			pstmt.setInt(3, propOptVO.getProposalOptionId());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer proposalOptionId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, proposalOptionId);

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public PropOptVO findByPrimaryKey(Integer proposalOptionId) {

		PropOptVO propOptVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, proposalOptionId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// sponRecordVO �]�٬� Domain objects
				propOptVO = new PropOptVO();
				propOptVO.setProposalOptionId(rs.getInt("PROPOSAL_OPTION_ID"));
				propOptVO.setProposalId(rs.getInt("PROPOSAL_ID"));
				propOptVO.setProposalOptionName(rs.getString("PROPOSAL_OPTION_NAME"));
				propOptVO.setProposalOptionPrice(rs.getInt("PROPOSAL_OPTION_PRICE"));
				propOptVO.setProposalOptionPicture(rs.getBytes("PROPOSAL_OPTION_PICTURE"));
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return propOptVO;
	}

	public List<PropOptVO> findByProposalId(Integer proposalId) {
		List<PropOptVO> list = new ArrayList<PropOptVO>();

		PropOptVO propOptVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_STMT_FROM_PROPOSAL_ID);

			pstmt.setInt(1, proposalId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// sponRecordVO �]�٬� Domain objects
				propOptVO = new PropOptVO();
				propOptVO.setProposalOptionId(rs.getInt("PROPOSAL_OPTION_ID"));
				propOptVO.setProposalId(rs.getInt("PROPOSAL_ID"));
				propOptVO.setProposalOptionName(rs.getString("PROPOSAL_OPTION_NAME"));
				propOptVO.setProposalOptionPrice(rs.getInt("PROPOSAL_OPTION_PRICE"));
				list.add(propOptVO);
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<PropOptVO> getAll() {
		List<PropOptVO> list = new ArrayList<PropOptVO>();
		PropOptVO propOptVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// sponRecordVO �]�٬� Domain objects
				propOptVO = new PropOptVO();
				propOptVO.setProposalOptionId(rs.getInt("PROPOSAL_OPTION_ID"));
				propOptVO.setProposalId(rs.getInt("PROPOSAL_ID"));
				propOptVO.setProposalOptionName(rs.getString("PROPOSAL_OPTION_NAME"));
				propOptVO.setProposalOptionPrice(rs.getInt("PROPOSAL_OPTION_PRICE"));
				propOptVO.setProposalOptionPicture(rs.getBytes("PROPOSAL_OPTION_PICTURE"));
				propOptVO.setReviewProductId(rs.getInt("REVIEW_PRODUCT_ID"));

				list.add(propOptVO); // Store the row in the list
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	
	@Override
	public List<PropOptVO> getPropOptByProposalId(Integer proposalId) {
		List<PropOptVO> list = new ArrayList<PropOptVO>();
		PropOptVO propOptVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_PROPOPT_BY_PROPOSAL_ID);
			pstmt.setInt(1, proposalId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// sponRecordVO �]�٬� Domain objects
				propOptVO = new PropOptVO();
				propOptVO.setProposalOptionId(rs.getInt("PROPOSAL_OPTION_ID"));
				propOptVO.setProposalId(rs.getInt("PROPOSAL_ID"));
				propOptVO.setProposalOptionName(rs.getString("PROPOSAL_OPTION_NAME"));
				propOptVO.setProposalOptionPrice(rs.getInt("PROPOSAL_OPTION_PRICE"));
				propOptVO.setProposalOptionPicture(rs.getBytes("PROPOSAL_OPTION_PICTURE"));
				propOptVO.setReviewProductId(rs.getInt("REVIEW_PRODUCT_ID"));
				

				list.add(propOptVO); // Store the row in the list
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}


	@Override
	public void insert2(PropOptVO propOptionVO, Connection con) {
		PreparedStatement pstmt = null;

		try {

			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, propOptionVO.getProposalId());
			pstmt.setString(2, propOptionVO.getProposalOptionName());
			pstmt.setInt(3, propOptionVO.getProposalOptionPrice());
			pstmt.setBytes(4, propOptionVO.getProposalOptionPicture());
			pstmt.setInt(5, propOptionVO.getReviewProductId());

			Statement stmt = con.createStatement();
			// stmt.executeUpdate("set auto_increment_offset=7001;"); //�ۼW�D��-��l��
			stmt.executeUpdate("set auto_increment_increment=1;"); // �ۼW�D��-���W
			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3���]�w���exception�o�ͮɤ�catch�϶���
					System.err.print("Transaction is being ");
					System.err.println("rolled back-��-emp");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. " + excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void insert3(PropProdReviewVO propRrodReviewVO, Connection con) {
		PreparedStatement pstmt = null;

		try {

			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, propRrodReviewVO.getProposalId());
			pstmt.setInt(2, propRrodReviewVO.getAdminId());
			pstmt.setInt(3, propRrodReviewVO.getReviewProductStatus());
			pstmt.setTimestamp(4, propRrodReviewVO.getApplyTime());
			pstmt.setString(6, propRrodReviewVO.getReviewResult());

			Statement stmt = con.createStatement();
			// stmt.executeUpdate("set auto_increment_offset=7001;"); //�ۼW�D��-��l��
			stmt.executeUpdate("set auto_increment_increment=1;"); // �ۼW�D��-���W
			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					System.err.print("Transaction is being ");
					System.err.println("rolled back-��-emp");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. " + excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
	}

	public static void main(String[] args) {
	
		PropOptJDBCDAO dao = new PropOptJDBCDAO();

		PropOptVO propOptVO1 = new PropOptVO();
		propOptVO1.setProposalId(1);
		propOptVO1.setProposalOptionName("11111");
		propOptVO1.setProposalOptionPrice(200);

		dao.insert(propOptVO1);
//
		PropOptVO propOptVO2 = new PropOptVO();
		propOptVO2.setProposalOptionName("TEST");
		propOptVO2.setProposalOptionPrice(356);
		propOptVO2.setProposalOptionId(2);

		dao.update(propOptVO2);
//
//		dao.delete(3);
//
//		PropOptVO propOptVO3 = dao.findByPrimaryKey(5);
//		System.out.print(propOptVO3.getProposalOptionId() + ",");
//		System.out.print(propOptVO3.getProposalId() + ",");
//		System.out.print(propOptVO3.getProposalOptionName() + ",");
//		System.out.print(propOptVO3.getProposalOptionPrice() + ",");
//		System.out.print(propOptVO3.getProposalOptionPicture());
//
//		System.out.println("---------------------");
//
//		List<PropOptVO> list = dao.getAll();
//		for (PropOptVO aPropOpt : list) {
//			System.out.print(aPropOpt.getProposalOptionId() + ",");
//			System.out.print(aPropOpt.getProposalId() + ",");
//			System.out.print(aPropOpt.getProposalOptionName() + ",");
//			System.out.print(aPropOpt.getProposalOptionPrice() + ",");
//			System.out.print(aPropOpt.getProposalOptionPicture() + ",");
//
//			System.out.println();
//		}
	}
}