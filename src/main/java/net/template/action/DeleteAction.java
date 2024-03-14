package net.template.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.common.action.Action;
import net.common.action.ActionForward;
import net.template.db.DAO;

public class DeleteAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		DAO dao = new DAO();
		int result = dao.delete(id);
		
		String message = "삭제 실패 입니다.";
		if(result == 1) {
			message = "삭제 성공 입니다.";
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("list.net");
		request.getSession().setAttribute("message", message);
		return forward;
	}

}
