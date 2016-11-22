<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*"       
    %>

<%
	//Set up DataBase
	request.setCharacterEncoding("UTF-8");
// ドライバクラスをロード	
	String msg = null ;

	try {
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/WD_PR_DB");

		if(ds != null)
			out.println("データベースに接続できました。");
	 
		Connection db = ds.getConnection() ;

		//Set SQL Database
		PreparedStatement ps = db.prepareStatement("INSERT INTO schedules(title, schedule_date, schedule_time, memo) VALUES(? ,? ,? ,?)");
		ps.setString(1, request.getParameter("title"));
		ps.setString(2, request.getParameter("date_year") + "-" +request.getParameter("date_month") + "-" +request.getParameter("date_day"));
		ps.setString(3, request.getParameter("time_hour") + ":" +request.getParameter("time_minute"));
		ps.setString(4, request.getParameter("memo"));
		
		ps.executeUpdate();
		ps.close();
		db.close();
		response.sendRedirect("setdat.jsp");
	
		

	} catch (SQLException e) {
    	out.println("データベース接続エラー"+ e);
	}
%>
