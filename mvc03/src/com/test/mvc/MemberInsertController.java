/*======================================
   MemberInsertController.java
   - 사용자 정의 컨트롤러 클래스
   - 회원 데이터 추가 액션 처리 클래스
   - DAO 객체에 대한 의존성 주입 준비
     → 인터페이스 형태의 속성 구성
     → setter 메소드 추가
======================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자의 정의 컨트롤러 클래스를 구현한다.

public class MemberInsertController implements Controller		// get방식이든 post방식이든 Controller가 다 받음
{

	// 인터페이스 자료형을 취하는 속성 구성
	private IMemberDAO dao;
		
	// setter 메소드 구성
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드 		
		ModelAndView mav = new ModelAndView();
		
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지로부터 넘어온 데이터 수신
		String name = request.getParameter("name");
		String tel = request.getParameter("telephone");
		
		try
		{
			MemberDTO member = new MemberDTO();
			
			member.setName(name);
			member.setTelephone(tel);
			
			dao.add(member);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 이 controller를 위한 view가 따로 있는 게 아님
		// 특정 view를 지정하는 게 아니라 memberlist.action 페이지를 redirect
		mav.setViewName("redirect:memberlist.action");
		//--MemberListController는 "/WEB-INF/views/MemberList.jsp" 였지만 여기서는 X
		//  MemberList.jsp에서는 count, list 값을 얻어내려고 함
		//  하지만 여기서는 그 값들을 넘겨주지 않기 때문에 제대로 수신할 수 없음
		//  때문에 list에 대한 로직을 이용할 수 있도록 MemberListController를 다시 부르는 것
		
		return mav;

	}
	
}
