/*===========================================
   #19. EmployeeInsertFormController.java
   - 사용자 정의 컨트롤러 클래스
===========================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class EmployeeInsertFormController implements Controller
{
	private IEmployeeDAO dao;
	
	public void setDao(IEmployeeDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드 
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Region> regionList = new ArrayList<Region>();
		ArrayList<Department> departmentList = new ArrayList<Department>();
		ArrayList<Position> positionList = new ArrayList<Position>();
		
		try
		{
			regionList = dao.regionList();
			departmentList = dao.departmentList();
			positionList = dao.positionList();
			
			mav.addObject("regionList",regionList);
			mav.addObject("departmentList",departmentList);
			mav.addObject("positionList",positionList);
			
			mav.setViewName("WEB-INF/views/EmployeeInsertForm.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}
