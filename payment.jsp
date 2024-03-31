<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
         <%
             String fullname=request.getParameter("fullname");
             String email=request.getParameter("email");
             String address=request.getParameter("address");
             String city=request.getParameter("city");
             String state=request.getParameter("state");
             String ipcode=request.getParameter("ipcode");
             String nameoncard=request.getParameter("nameoncard");
             String creditcardnumber=request.getParameter("creditcardnumber");
             String expmonth=request.getParameter("expmonth");
             String expyear=request.getParameter("expyear");
             String cvv=request.getParameter("cvv");
             try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/paymentdata");
                String query="INSERT INTO paymentdata1(fullname,email,address,city,state,ipcode,nameoncard,creditcardnumber,expmonth,expyear,cvv) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement stmt=conn.prepareStatement(query);
                stmt.setString(1,fullname);
                stmt.setString(2,email);
                stmt.setString(3,address);
                stmt.setString(4,city);
                stmt.setString(5,state);
                stmt.setString(6,ipcode);
                stmt.setString(7,nameoncard);
                stmt.setString(8,creditcardnumber);
                stmt.setString(9,expmonth);
                stmt.setString(10,expyear);
                stmt.setString(11,cvv);
                stmt.addBatch();
                int i[]=stmt.executeBatch();
                if(i.length>0)
                {%>
                <%=i.length %>your payment details have been saved<%}
                conn.close();
             }
            catch(Exception e)
            {
              out.println(e);
            }
			finally{
			}
%>