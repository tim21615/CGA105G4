package com.mem.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mem.model.MemService;
import com.mem.model.MemVO;

@MultipartConfig
public class MemServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
			String str = req.getParameter("memberId");
			if (str == null || (str.trim().length() == 0)) {
				errorMsgs.add("�п�J�|��ID");
			}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/mem/select_page.jsp");
				failureView.forward(req, res);
				return;
			}

			Integer memberId = null;
			try {
				memberId = Integer.valueOf(str);
			} catch (Exception e) {
				errorMsgs.add("���u�s���榡�����T");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/mem/select_page.jsp");
				failureView.forward(req, res);
				return;// �{�����_
			}

			/*************************** 2.�}�l�d�߸�� *****************************************/
			MemService memberSvc = new MemService();
			MemVO memVO = memberSvc.getOneMem(memberId);
			if (memVO == null) {
				errorMsgs.add("�d�L���");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/mem/select_page.jsp");
				failureView.forward(req, res);
				return;// �{�����_
			}
			/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
			req.setAttribute("memVO", memVO); // ��Ʈw���X��empVO����,�s�Jreq
			String url = "/mem/ListOneMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
			successView.forward(req, res);

		}

		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.�����ШD�Ѽ� ****************************************/
			Integer memberId = Integer.valueOf(req.getParameter("memberId"));

			/*************************** 2.�}�l�d�߸�� ****************************************/
			MemService memSvc = new MemService();
			MemVO memVO = memSvc.getOneMem(memberId);

			/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
			req.setAttribute("memVO", memVO); // ��Ʈw���X��empVO����,�s�Jreq
			String url = "/mem/update_mem_input.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
			successView.forward(req, res);
		}

		if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			MemService memberSvc = new MemService();
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
			Integer memberId = Integer.valueOf(req.getParameter("memberId").trim());

			String memberAccount = req.getParameter("memberAccount");
			if (memberAccount == null || memberAccount.trim().length() == 0) {
				errorMsgs.add("�|���b��: �ФŪť�");
			}

			String memberPassword = req.getParameter("memberPassword");
			if (memberAccount == null || memberAccount.trim().length() == 0) {
				errorMsgs.add("�|���K�X: �ФŪť�");
			}

				
			String memberNickName = req.getParameter("memberNickName");
			if (memberNickName == null || memberNickName.trim().length() == 0) {
				errorMsgs.add("�|���ʺ�: �ФŪť�");
			}

			String idNumber = req.getParameter("idNumber");
			if (idNumber == null || memberNickName.trim().length() == 0) {
				errorMsgs.add("�����Ҧr��: �ФŪť�");
			}

			Integer memberStatus = null;
			try {
				memberStatus = Integer.valueOf(req.getParameter("memberStatus").trim());
			} catch (NumberFormatException e) {
				memberStatus = 0;
				errorMsgs.add("�ж�1��2");
			}

			String memberName = req.getParameter("memberName");
			if (memberName == null || memberName.trim().length() == 0) {
				errorMsgs.add("�|���m�W: �ФŪť�");
			}


			String memberGender = req.getParameter("memberGender");

			java.sql.Date dateOfBirth = null;
			try {
				dateOfBirth = java.sql.Date.valueOf(req.getParameter("dateOfBirth"));
			} catch (IllegalArgumentException e) {
				dateOfBirth = new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("�п�J���!");
			}

			String memberEmail = req.getParameter("memberEmail");
			if (memberEmail == null || memberEmail.trim().length() == 0) {
				errorMsgs.add("�H�c�a�}: �ФŪť�");
			}

			String memberPhone = req.getParameter("memberPhone");

			if (memberPhone == null || memberPhone.trim().length() == 0) {
				errorMsgs.add("������X: �ФŪť�");
			}

			String memberAddress = req.getParameter("memberAddress");
			if (memberAddress == null || memberAddress.trim().length() == 0) {
				errorMsgs.add("�a�}: �ФŪť�");
			}

			byte[] buf = req.getPart("upfile1").getInputStream().readAllBytes();
			if (buf.length == 0) { 
				MemVO memVO = memberSvc.getOneMem(memberId);
				buf=memVO.getProfilePhoto();
				
			}
		

			String bankAccount = req.getParameter("bankAccount");


			MemVO memVO = new MemVO();
			memVO.setMemberId(memberId);
			memVO.setMemberAccount(memberAccount);
			memVO.setMemberPassword(memberPassword);
			memVO.setMemberNickname(memberNickName);
			memVO.setMemberStatus(memberStatus);
			memVO.setIdNumber(idNumber);
			memVO.setMemberName(memberName);
			memVO.setMemberGender(memberGender);
			memVO.setDateOfBirth(dateOfBirth);
			memVO.setMemberEmail(memberEmail);
			memVO.setMemberPhone(memberPhone);
			memVO.setMemberAddress(memberAddress);
			memVO.setBankAccount(bankAccount);
//
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memVO", memVO); // �t����J�榡���~��empVO����,�]�s�Jreq
				RequestDispatcher failureView = req.getRequestDispatcher("/mem/update_mem_input.jsp");
				failureView.forward(req, res);
				return; // �{�����_
			}

			/*************************** 2.�}�l�ק��� ***************************************/
		
//			memVO = memberSvc.updateMem(memberId, memberAccount, memberPassword, memberNickName, memberStatus, idNumber,
//					memberName, memberGender, dateOfBirth, memberEmail, memberPhone, memberAddress, buf, bankAccount);

			/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
			req.setAttribute("memVO", memVO);
			String url = "/mem/ListOneMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
			successView.forward(req, res);

		}
		if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD
			
			MemService memberSvc = new MemService();

//			Integer memberId = Integer.valueOf(req.getParameter("memberId"));

			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String memberAccount = req.getParameter("memberAccount");
			if (memberAccount == null || memberAccount.trim().length() == 0) {
				errorMsgs.add("�|���b��: �ФŪť�");
			}

			String memberPassword = req.getParameter("memberPassword");
			if (memberPassword == null || memberPassword.trim().length() == 0) {
				errorMsgs.add("�|���K�X: �ФŪť�");
			}

				
			String memberNickName = req.getParameter("memberNickName");
			if (memberNickName == null || memberNickName.trim().length() == 0) {
				errorMsgs.add("�|���ʺ�: �ФŪť�");
			}

			String idNumber = req.getParameter("idNumber");
			if (idNumber == null || idNumber.trim().length() == 0) {
				errorMsgs.add("�����Ҧr��: �ФŪť�");
			}

			Integer memberStatus = null;
			try {
				memberStatus = Integer.valueOf(req.getParameter("memberStatus").trim());
			} catch (NumberFormatException e) {
				memberStatus = 0;
				errorMsgs.add("�ж�1��2");
			}

			String memberName = req.getParameter("memberName");
			if (memberName == null || memberName.trim().length() == 0) {
				errorMsgs.add("�|���m�W: �ФŪť�");
			}


			String memberGender = req.getParameter("memberGender");

			java.sql.Date dateOfBirth = null;
			try {
				dateOfBirth = java.sql.Date.valueOf(req.getParameter("dateOfBirth"));
			} catch (IllegalArgumentException e) {
				dateOfBirth = new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("�п�J���!");
			}

			String memberEmail = req.getParameter("memberEmail");
			if (memberEmail == null || memberEmail.trim().length() == 0) {
				errorMsgs.add("�H�c�a�}: �ФŪť�");
			}

			String memberPhone = req.getParameter("memberPhone");

			if (memberPhone == null || memberPhone.trim().length() == 0) {
				errorMsgs.add("������X: �ФŪť�");
			}

			String memberAddress = req.getParameter("memberAddress");
			if (memberAddress == null || memberAddress.trim().length() == 0) {
				errorMsgs.add("�a�}: �ФŪť�");
			}


			byte[] buf = req.getPart("upfile1").getInputStream().readAllBytes();
			if (buf.length == 0) { 
				buf = null;
				
			}
			

			String bankAccount = req.getParameter("bankAccount");

			MemVO memVO = new MemVO();
			memVO.setMemberAccount(memberAccount);
			memVO.setMemberPassword(memberPassword);
			memVO.setMemberNickname(memberNickName);
			memVO.setMemberStatus(memberStatus);
			memVO.setIdNumber(idNumber);
			memVO.setMemberName(memberName);
			memVO.setMemberGender(memberGender);
			memVO.setDateOfBirth(dateOfBirth);
			memVO.setMemberEmail(memberEmail);
			memVO.setMemberPhone(memberPhone);
			memVO.setMemberAddress(memberAddress);
			memVO.setProfilePhoto(buf);
			memVO.setBankAccount(bankAccount);
			

		

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memVO", memVO); // �t����J�榡���~��empVO����,�]�s�Jreq
				RequestDispatcher failureView = req.getRequestDispatcher("/mem/addMem.jsp");
				failureView.forward(req, res);
				return;
			}
			
			

		
			memVO = memberSvc.addMem(memberAccount, memberPassword, memberNickName, memberStatus, idNumber, memberName,
					memberGender, dateOfBirth, memberEmail, memberPhone, memberAddress, buf, bankAccount);
		

		

			String url = "/mem/listAllMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);


			successView.forward(req, res);
		}

		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			Integer memberId = Integer.valueOf(req.getParameter("memberId"));

			/*************************** 2.�}�l�ק��� *****************************************/
			MemService memberSvc = new MemService();
		
			memberSvc.deleteMem(memberId);

			/*************************** 3.�ק粒��,�ǳ����(Send the Success view) *************/
			// ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
			String url = "/mem/listAllMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
			successView.forward(req, res);
		}

	}
}
