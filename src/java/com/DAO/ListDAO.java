/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.db.Connect;
import static com.db.Connect.dbConnect;
import java.util.HashSet;

public class ListDAO extends Connect {

    
    public static List getListForPrivatewallStatus(int registeredId) throws Exception {
        com.mysql.jdbc.Connection connection = (com.mysql.jdbc.Connection) dbConnect();
        Statement stmt = null;
        ResultSet rs = null;
        List cmbList = new ArrayList();
        try {
            stmt = (Statement) connection.createStatement();
            String query = "SELECT description,first_name,post_id,sender_id,image_path \n"
                    + "FROM  post,registration where post_display!='public'\n"
                    + " and sender_id=registration.registration_id\n"
                    + "and reciver_id="
                    + " " + registeredId
                    + "   ORDER BY post_id desc LIMIT 400";
        //    System.out.println("" + query);
            rs = stmt.executeQuery(query);
            while (rs.next()) {
               PostFB status=new PostFB();
                status.setUsername(rs.getString("first_name"));
                status.setDescription(rs.getString("description"));
                status.setPost_id(rs.getInt("post_id"));
                status.setSender_id(rs.getInt("sender_id"));
                status.setImage_path(rs.getString("image_path"));
                cmbList.add(status);

            }
        } catch (Exception e) {
            cmbList = null;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (java.sql.SQLException e) {
                    rs = null;
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (java.sql.SQLException e) {
                    stmt = null;
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (java.sql.SQLException e) {
                    connection = null;
                }
            }
        }
        return cmbList;
    }
    
    
     public static List getListForStatus(int registeredId, String useremaiid) throws Exception {
        com.mysql.jdbc.Connection connection = (com.mysql.jdbc.Connection) dbConnect();
        Statement stmt = null;
        Statement stmt1=null; 
        ResultSet rs = null;
        ResultSet rs1=null;
        List cmbList = new ArrayList();
        List cmbList1=new ArrayList();
        try {
            stmt = (Statement) connection.createStatement();
            stmt1 = (Statement) connection.createStatement();
            String query =   "SELECT blockfriend,description,first_name,post_id,sender_id,image_path,post_display,customgroup"
                 + " FROM  post,registration where post.sender_id = registration.registration_id ORDER BY post_id desc LIMIT 400";
          //  System.out.println("" + query);
             String query1="select customgroup from registration where registration_id="+registeredId;
            rs = stmt.executeQuery(query);
            rs1=stmt1.executeQuery(query1);
            String userList="";
               int k=0;
                String customGroup=null;
                while(rs1.next())
                        {
                            customGroup=rs1.getString("customgroup");
                        }
            while (rs.next()) {
              PostFB status=new PostFB();
              int i=0;
              String blockFrnd=rs.getString("blockfriend");
               if(blockFrnd==null)
               {
                   blockFrnd="";
               }
               
//               for(int j=0;j<s.length;j++)
//               {
               if(rs.getString("post_display").equals("custom")){
                   if(blockFrnd.equals(customGroup))
                   {
                      if(!blockFrnd.contains(useremaiid)){
                status.setUsername(rs.getString("first_name"));
                status.setDescription(rs.getString("description"));
                status.setPost_id(rs.getInt("post_id"));
                status.setSender_id(rs.getInt("sender_id"));
                status.setImage_path(rs.getString("image_path"));
                status.setPost_display(rs.getString("post_display"));
                cmbList.add(status);
               } 
                   }
                   else{
                       if(registeredId==rs.getInt("sender_id")&&k==0)
                               {
                                   status.setUsername(rs.getString("first_name"));
                status.setDescription(rs.getString("description"));
                status.setPost_id(rs.getInt("post_id"));
                status.setSender_id(rs.getInt("sender_id"));
                status.setImage_path(rs.getString("image_path"));
                status.setPost_display(rs.getString("post_display"));
                cmbList.add(status);
                k++;
                               }
                   }
               } else{
                   if(rs.getString("post_display").equals("public"))
                   {
                       status.setUsername(rs.getString("first_name"));
                status.setDescription(rs.getString("description"));
                status.setPost_id(rs.getInt("post_id"));
                status.setSender_id(rs.getInt("sender_id"));
                status.setImage_path(rs.getString("image_path"));
                status.setPost_display(rs.getString("post_display"));
                cmbList.add(status);
                   }
                   else{
                       if(rs.getString("post_display").equals("private") && registeredId==rs.getInt("sender_id"))
                   {
                       status.setUsername(rs.getString("first_name"));
                status.setDescription(rs.getString("description"));
                status.setPost_id(rs.getInt("post_id"));
                status.setSender_id(rs.getInt("sender_id"));
                status.setImage_path(rs.getString("image_path"));
                status.setPost_display(rs.getString("post_display"));
                cmbList.add(status);
                   }
                   }
               }
               }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (java.sql.SQLException e) {
                    rs = null;

                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (java.sql.SQLException e) {
                    stmt = null;

                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (java.sql.SQLException e) {
                    connection = null;
                }

            }
        }

        return cmbList;
    }
    public static List getListForGroup(int registeredId, String useremaiid) throws Exception {
        com.mysql.jdbc.Connection connection = (com.mysql.jdbc.Connection) dbConnect();
        Statement stmt = null;
        ResultSet rs = null;
        List cmbList = new ArrayList();
        try {
            stmt = (Statement) connection.createStatement();
            String query =   "SELECT customgroup from registration where email_id='"+useremaiid+"'";
          //  System.out.println("" + query);
            rs = stmt.executeQuery(query);
            while (rs.next()) {
               PostFB status=new PostFB();
               
                status.setGroupList(rs.getString("customgroup"));
                cmbList.add(status);
               }
            
        } catch (Exception e) {
            //cmbList = null;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (java.sql.SQLException e) {
                    rs = null;

                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (java.sql.SQLException e) {
                    stmt = null;

                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (java.sql.SQLException e) {
                    connection = null;
                }

            }
        }

        return cmbList;
    }
    
     
    public static List getListForShared(int registeredId) throws Exception {
        com.mysql.jdbc.Connection connection = (com.mysql.jdbc.Connection) dbConnect();
        Statement stmt = null;
        ResultSet rs = null;
        List cmbList = new ArrayList();
        try {
            stmt = (Statement) connection.createStatement();
            String query = "select first_name,shared.description,post.post_id,image_path,post.description from shared,registration,post\n"
                    + "where shared.post_id=post.post_id\n"
                    + "and registration.registration_id = shared.registartion_id\n"
                    
                    + "   ORDER BY post.post_id desc LIMIT 400";
          //  System.out.println("shared" + query);
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                PostFB status = new PostFB();
                status.setUsername(rs.getString("first_name"));
                status.setDescription(rs.getString("shared.description"));
                status.setAddress(rs.getString("post.description"));
                status.setPost_id(rs.getInt("post.post_id"));
                status.setImage_path(rs.getString("image_path"));
                cmbList.add(status);

            }
        } catch (Exception e) {
            cmbList = null;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (java.sql.SQLException e) {
                    rs = null;

                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (java.sql.SQLException e) {
                    stmt = null;

                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (java.sql.SQLException e) {
                    connection = null;
                }

            }
        }

        return cmbList;
    }
    public static HashSet getListForSharedCustom(int registeredId, String useremailid) throws Exception {
        com.mysql.jdbc.Connection connection = (com.mysql.jdbc.Connection) dbConnect();
        Statement stmt = null;
        ResultSet rs = null;
        HashSet cmbList = new HashSet();
        try {
            stmt = (Statement) connection.createStatement();
            String query = "select first_name,email_id,customgroup from registration";
          //  System.out.println("shared" + query);
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                PostFB status = new PostFB();
                status.setUsername(rs.getString("first_name"));
                status.setEmailID(rs.getString("email_id"));
                status.setGroupList(rs.getString("customgroup"));
                cmbList.add(status);

            }
        } catch (Exception e) {
            cmbList = null;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (java.sql.SQLException e) {
                    rs = null;

                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (java.sql.SQLException e) {
                    stmt = null;

                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (java.sql.SQLException e) {
                    connection = null;
                }

            }
        }

        return cmbList;
    }

    public static HashSet getListForSharedSchoolCustom(int registeredId, String useremailid) throws Exception {
        com.mysql.jdbc.Connection connection = (com.mysql.jdbc.Connection) dbConnect();
        Statement stmt = null;
        ResultSet rs = null;
        HashSet cmbList = new HashSet();
        try {
            stmt = (Statement) connection.createStatement();
            String query = "select first_name,email_id,customgroup from registration";
                  //  + "where registration.registration_id = shared.registartion_id\n"
                  //  +"and email_id NOT IN(select email_id from post where email_id='"+useremailid+"')\n"
                    //+ "   ORDER BY post.post_id desc LIMIT 400";
          //  System.out.println("shared" + query);
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                PostFB status = new PostFB();
                status.setUsername(rs.getString("first_name"));
                status.setEmailID(rs.getString("email_id"));
                status.setGroupList(rs.getString("customgroup"));
                cmbList.add(status);

            }
        } catch (Exception e) {
            cmbList = null;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (java.sql.SQLException e) {
                    rs = null;

                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (java.sql.SQLException e) {
                    stmt = null;

                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (java.sql.SQLException e) {
                    connection = null;
                }

            }
        }

        return cmbList;
    }

}


