package ssm.common.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		try { //logininfo ���ǰ��� ���ϰ�� 
			System.out.println("LoginInterceptor handle try>>>>");
			System.out.println(">>>>>>>>>>>>>>>>>>����" + request.getSession().getAttribute("isLogOn"));
			
			
			if(request.getSession().getAttribute("isLogOn") == null ){ //�α����������� redirect 
				response.setContentType("text/html; charset=EUC-KR");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('�α��� ������ Ȯ�����ּ���.'); history.go(-1);</script>");
				out.flush();
//				response.sendRedirect(request.getContextPath()+"/"); 
				return false; 
			}//if 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return true; //���� �ƴϸ� ���������� ��Ʈ�ѷ� ȣ�� 
	}//preHandle

}//class
