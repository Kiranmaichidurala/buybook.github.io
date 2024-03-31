<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
         <%
             String username=request.getParameter("username");
             String password=request.getParameter("password");
             try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/logindata");
                String query="INSERT INTO logindata1(username,password) VALUES (?,?)";
                PreparedStatement stmt=conn.prepareStatement(query);
                stmt.setString(1,username);
                stmt.setString(2,password);
                stmt.addBatch();
                int i[]=stmt.executeBatch();
                if(i.length>0)
                {%>
                <%=i.length %>your logged in<%}
                conn.close();
             }
            catch(Exception e)
            {
              out.println(e);
            }
			finally{
			}
			
%>