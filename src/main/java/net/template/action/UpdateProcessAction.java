package net.template.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.common.action.Action;
import net.common.action.ActionForward;
import net.template.db.DAO;
import net.template.db.Template_join;

public class UpdateProcessAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) request.getParameter("id");
		String pass = (String) request.getParameter("pass");
		String jumin1 = (String) request.getParameter("jumin1");
		String jumin2 = (String) request.getParameter("jumin2");
		String email = (String) request.getParameter("email");
		String domain = (String) request.getParameter("domain");
		String gender = (String) request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		String post1 = (String) request.getParameter("post1");
		String address = (String) request.getParameter("address");
		String intro = (String) request.getParameter("intro");
		
		String hobby = hobbys[0];
		for(int i = 1; i < hobbys.length; i++) {
			 hobby += "," + hobbys[i];
		}
		
		Template_join join = new Template_join();
		join.setId(id);
		join.setPassword(pass);
		join.setJumin(jumin1 + "-" + jumin2);
		join.setEmail(email + "@" + domain);
		join.setGender(gender);
		join.setHobby(hobby);
		join.setPost(post1);
		join.setAddress(address);
		join.setIntro(intro);
		
		DAO dao = new DAO();
		int result = dao.update(join);
		String message = "회원정보 수정 실패입니다.";
		if (result == 1) {
			message = "회원정보 수정 성공입니다.";
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		session.setAttribute("message", message);
		forward.setPath("templatetest.net");
		return forward;
	}

}
