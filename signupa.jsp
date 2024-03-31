<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
         <%
             String username=request.getParameter("username");
             String password=request.getParameter("password");
             String confirmpassword=request.getParameter("confirmpassword");
             try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/signupdata");
                String query="INSERT INTO signupdata1(username,password,confirmpassword) VALUES (?,?,?)";
                PreparedStatement stmt=conn.prepareStatement(query);
                stmt.setString(1,username);
                stmt.setString(2,password);
                stmt.setString(3,confirmpassword);
                stmt.addBatch();
                int i[]=stmt.executeBatch();
                if(i.length>0)
                {%>
                <%=i.length %>your are signed in<%}
                conn.close();
             }
            catch(Exception e)
            {
              out.println(e);
            }
			finally{
			}
%>