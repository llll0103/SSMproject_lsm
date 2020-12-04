package ssm.common.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TLoginInterceptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		try { //logininfo ���ǰ�TLoin
			System.out.println("TLoginInterceptor handle try>>>>");
			System.out.println(request.getSession().getAttribute("ttLoginOn"));
			

			if(request.getSession().getAttribute("ttLoginOn")==null){ //�α����������� redirect 
				response.setContentType("text/html; charset=EUC-KR");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('���ٺҰ� : ���縸 ����!'); history.go(-1);</script>");
				out.flush();
//				response.sendRedirect(request.getContextPath()+"/"); 
				return false; 
			}//if 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return true; //���� �ƴϸ� ���������� ��Ʈ�ѷ� ȣ�� 
	}//preHandle
}
