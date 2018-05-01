<%@page import="com.sun.java_cup.internal.runtime.Symbol"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>

<%
    try {
        String s[] = null;

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/facebook", "root", "root");

        com.mysql.jdbc.Statement st = (com.mysql.jdbc.Statement) con.createStatement();
        String likep = (String) request.getParameter("q");
        String query = "select registration.registration_id,contact_no,address,image_path,first_name"
                + " ,last_name,email_id"
                + " from profile,registration where "
                + " profile.registration_id=registration.registration_id"
                + " and  first_name or last_name or address or email_id like '%" + likep + "%' "
                + " and registration.status='Active'"
                + " group by registration.registration_id";
System.out.println(query);
        
        ResultSet rs = (ResultSet) st.executeQuery(query);

        

        while (rs.next()) {
            
            out.print(rs.getString("first_name") + " " + rs.getString("last_name") + "\n");
        }


        //jQuery related start



        //jQuery related end

        rs.close();
        st.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }


%>