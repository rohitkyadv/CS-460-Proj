/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.db.Connect;
import static com.db.Connect.dbConnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Sai-Infocorp004
 */
public class UserDAO extends Connect {

    public static PostFB getAllUserDetails(int registartionId) throws Exception {
        Connection connection = (com.mysql.jdbc.Connection) dbConnect();;
        Statement stmt = null;
        ResultSet rs = null;
        PostFB fb = new PostFB();
        try {
            stmt = (Statement) connection.createStatement();
            String query = "Select contact_no,address,profile_display,image_path from profile where registration_id="+registartionId;

            System.out.println("" + query);
            rs = stmt.executeQuery(query);
            if (rs.next()) {
                
                fb.setImage_path(rs.getString("image_path"));
                fb.setAddress(rs.getString("address"));
                
                fb.setContactno(rs.getString("contact_no"));
                fb.setProfiledisplay(rs.getString("profile_display"));

                


            }
        } catch (Exception e) {
            fb = null;
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

        return fb;
    }
}
