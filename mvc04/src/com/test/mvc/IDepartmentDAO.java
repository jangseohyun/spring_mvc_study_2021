/*==============================
    #06. IDepartmentDAO.java
    - 인터페이스
==============================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDepartmentDAO
{
	public ArrayList<Department> List() throws SQLException;
	
	public int add(Department department) throws SQLException;
	public Department searchId(String departmentId) throws SQLException;
	public int remove(String departmentId) throws SQLException;
	public int modify(Department department) throws SQLException;
	public int count(String departmentName) throws SQLException;
}
