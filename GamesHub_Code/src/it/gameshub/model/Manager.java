package it.gameshub.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class Manager {
 
    /**
     * Get database connection
     *
     * @return a Connection object
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        Connection conn = null;
 
        DataSource ds=null;

    	
   		try {
    			Context initCtx = new InitialContext();
    			System.out.println(initCtx.toString());
    			Context envCtx = (Context) initCtx.lookup("java:comp/env");
    			System.out.println(envCtx);
    			ds = (DataSource) envCtx.lookup("jdbc/gameshub");
    			System.out.println(ds);
    			conn = ds.getConnection();
    			System.out.println(ds);
    		} catch (NamingException e) {
   			System.out.println("Error:" + e.getMessage());
   		}
    	
        
   		
        return conn;
    }
 
}


