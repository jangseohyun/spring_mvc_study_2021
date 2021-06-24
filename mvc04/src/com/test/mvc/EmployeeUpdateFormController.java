/*==================================================
   #23. EmployeeUpdateFormController.java
   - 사용자 정의 컨트롤러 클래스
   - 직원 데이터 수정 폼 요청에 대한 액션 처리
   - DAO 객체에 대한 의존성 주입(DI)을 위한 준비
     → 인터페이스 형태의 자료형을 속성으로 구성
     → setter 메소드 구성
==================================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class EmployeeUpdateFormController implements Controller
{
	// check
	// EmployeeInsertFormController 구성과는 다른 방식으로 처리
	
	/*
	// EmployeeInsertFormController 방식
	// DAO 인터페이스 자료형 멤버 구성
	private IEmployeeDAO dao;
	
	// setter 구성
	public void setDao(IEmployeeDAO dao)
	{
		this.dao = dao;
	}
	*/
	
	// 이렇게 하면 Spring 컨테이너 안에서 DAO 각각의 객체를 만들어서
	// 속성값에 주입하는 처리를 하게 됨
	private IEmployeeDAO employeeDAO;
	private IRegionDAO regionDAO;
	private IDepartmentDAO departmentDAO;
	private IPositionDAO positionDAO;
	
	public void setEmployeeDAO(IEmployeeDAO employeeDAO)
	{
		this.employeeDAO = employeeDAO;
	}
	public void setRegionDAO(IRegionDAO regionDAO)
	{
		this.regionDAO = regionDAO;
	}
	public void setDepartmentDAO(IDepartmentDAO departmentDAO)
	{
		this.departmentDAO = departmentDAO;
	}
	public void setPositionDAO(IPositionDAO positionDAO)
	{
		this.positionDAO = positionDAO;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드 
		ModelAndView mav = new ModelAndView();
        
        // 세션 처리과정 추가 --------------------------------------------
        
        HttpSession session = request.getSession();
        
        if (session.getAttribute("name") == null)		//--로그인이 되어있지 않은 상황
        {
        	mav.setViewName("redirect:loginform.action");
        	return mav;
        }
        else if (session.getAttribute("admin") == null)	//--관리자 아님. 일반사원으로 로그인된 상황
        {
        	// 관리자로 재로그인할 수 있도록 강제 로그아웃
        	mav.setViewName("redirect:logout.action");
        	return mav;
        }
        
        // if문에 걸리지 않았을 경우 관리자로 로그인된 상황
        
        // ---------------------------------------------------------------

		ArrayList<Region> regionList = new ArrayList<Region>();
		ArrayList<Department> departmentList = new ArrayList<Department>();
		ArrayList<Position> positionList = new ArrayList<Position>();
		
		try
		{
			// 데이터 수신 (→ EmployeeList.jsp로부터 employeeId 수신)
			String employeeId = request.getParameter("employeeId");
			
			Employee employee = new Employee();
			
			employee = employeeDAO.searchId(employeeId);
			
			regionList = regionDAO.List();
			departmentList = departmentDAO.List();
			positionList = positionDAO.List();
			
			mav.addObject("employee",employee);
			mav.addObject("regionList",regionList);
			mav.addObject("departmentList",departmentList);
			mav.addObject("positionList",positionList);
			
			mav.setViewName("/WEB-INF/views/EmployeeUpdateForm.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;

	}
	
}
