/*=====================
	MemberMain.java
	- 컨트롤러
=====================*/

package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberMain
{
	// setter 구성 대신 Autowired → 스프링 컨테이너가 자동으로 조립해줌
	// mybatis 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/memberlist.action", method=RequestMethod.GET)
	public String memberList(ModelMap model)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		return "WEB-INF/views/MemberList.jsp";
	}
}
