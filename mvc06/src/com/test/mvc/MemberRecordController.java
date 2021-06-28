/*===================================
    MemberRecordController.java
    - 사용자 정의 컨트롤러 클래스
===================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// ※ Spring의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구현한다.

@Controller
public class MemberRecordController
{
	// ※ 액션 처리를 위한 메소드는 사용자 지정
	/*
	@RequestMapping("URL 매핑 주소")
	public String 메소드 이름(매개변수)
	{
		// ※ 비즈니스 로직 처리 (모델 활용)
		// ...
		
		return "뷰 이름.jsp";
	}
	*/
	
	// 데이터베이스의 데이터를 읽어오는 과정
	@RequestMapping("/memberlist.action")
	public String memberList(Model model)
	{
		String result = "";
		
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		MemberDAO dao = new MemberDAO();
		
		try
		{
			dao.connection();
			list = dao.lists();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();
				
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}
		
		model.addAttribute("list",list);
		
		result = "/WEB-INF/views/MemberList.jsp";
		
		return result;
	}
	
	@RequestMapping("/memberinsertform.action")
	// 데이터 입력(회원 등록)폼 요청 관련 액션 메소드 정의
	public String memberInsertForm()
	{
		String result = "/WEB-INF/views/MemberInsertForm.jsp";
		
		return result;
	}
	
	@RequestMapping("/memberinsert.action")
	// 데이터 입력(회원 등록 액션 메소드 정의
	public String memberInsert(MemberDTO dto)	//--memberinsertform.jsp에서 넘겨받음
	{
		String result = "";
		
		MemberDAO dao = new MemberDAO();
		
		try
		{
			dao.connection();
			dao.insertQuery(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			
		} finally
		{
			try
			{
				dao.close();
				
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}
		
		result = "redirect:memberlist.action";
		
		return result;
	}

}
