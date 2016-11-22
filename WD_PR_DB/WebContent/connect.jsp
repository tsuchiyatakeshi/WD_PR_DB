<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, javax.naming.*, javax.sql.*,java.io.*"
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>データベースに接続</title>
</head>
<body>
<%
	Context context = new InitialContext();
	DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/WD_PR_DB");

	if(ds != null)
		out.println("データベースに接続できました。");
	else{
		out.println("DB Not");		
	}
	
	Connection db = ds.getConnection() ;
	PreparedStatement ps = db.prepareStatement("select * from schedules") ; //SQL 
	
	ResultSet rs = ps.executeQuery() ;
	
	while(rs.next())
	{
        int id = rs.getInt(1);
		String title = rs.getString(2);
        String date = rs.getString(3);
        String time = rs.getString(4);
        String memo = rs.getString(5);
        
        
        System.out.println
             ("ID："+id+" title:"+title+" date:"+date+" time:"+time+"memo:"+memo);
      } 
        rs.close();
        ps.close() ;
		db.close() ;
		%>　
</body>
</html>