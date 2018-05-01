/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import static com.db.Connect.dbConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Sai-Infocorp004
 */
public class PostDAO {
     public static boolean saveSharePosts(PostFB fb){
        Connection connection = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        int i =0;
        try {

            connection = (com.mysql.jdbc.Connection) dbConnect();
            pstmt = connection.prepareStatement("Insert into shared (post_id,registartion_id,description) values(?,?,?)");
            pstmt.setInt(1, fb.getPost_id());
            pstmt.setInt(2, fb.getReciver_id());
            pstmt.setString(3, fb.getDescription());
            System.out.println("");

            i = pstmt.executeUpdate();

           
        } catch (Exception e) {
            System.out.println(""+e);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (java.sql.SQLException e) {
                    rs = null;
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (java.sql.SQLException e) {
                    pstmt = null;
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
         if (i > 0) {
                return true;
            } else {
                return false;
            }
    }
     
    
    
}
