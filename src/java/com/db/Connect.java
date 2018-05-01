

package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author user
 */
public class Connect {
    public static Connection dbConnect()throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/twitter", "root","root");
    }
}
