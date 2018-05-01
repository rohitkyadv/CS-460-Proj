<%@page import="java.util.Collections"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
 String receiverid="";
        
               receiverid=session.getAttribute("userRegId").toString();
        
                String unameId = session.getAttribute("userRegId").toString();
                String group="";
                
                 List<String> groupValues =new LinkedList<String>(Arrays.asList(request.getParameterValues("school")));
                if(groupValues.contains("Party Hub") || groupValues.contains("Fitness Club"))
                {
                    if(!groupValues.contains("college"))
                        groupValues.add("college");
                }
                    if(groupValues.contains("Class 12") || groupValues.contains("Sports"))
                {
                    if(!groupValues.contains("school"))
                        groupValues.add("school");
                }
                Collections.sort(groupValues);
                System.out.println(groupValues);
                 for(String g:groupValues){
                if(!group.equals(""))
                    group=group+","+g;
                else
                    group=g;
                }
        try{
            Connection con=com.db.Connect.dbConnect();
            PreparedStatement pstmt=con.prepareStatement("update registration set customgroup=? where registration_id=? ");
            
            pstmt.setString(1, group);
            pstmt.setInt(2, Integer.parseInt(receiverid));
           
            int i1=pstmt.executeUpdate();
            if(i1>0){%>
            <script>
                
                window.location="Home.jsp";
            </script>
            <%}
        }catch(Exception e){
            System.out.println(e);
        }%>

%>