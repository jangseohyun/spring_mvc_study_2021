/*======================================
   LogoutController.java
   - 사용자 정의 컨트롤러 클래스
======================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class LogoutController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드 
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("name");
		session.removeAttribute("admin");
		
		// 로그아웃 뷰 페이지 없이
		// 바로 로그인 페이지를 다시 요청할 수 있도록 안내
		mav.setViewName("redirect:loginform.action");
		
		return mav;
	}
}