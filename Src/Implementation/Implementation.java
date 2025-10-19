/* 
 * To change this license header, choose License Headers in Project Properties. 
 * To change this template file, choose Tools | Templates 
 * and open the template in the editor. 
 */

package implementation;

import Database.*;
import Bean.RegisterUser;
import java.sql.*;

/**
 * Handles all authentication and registration operations for users and authorities.
 * 
 * @author 91979
 */
public class Implementation {

    // ===================== AUTH REGISTER =====================
    public int AuthRegister(RegisterUser reg) {
        Connection con = null;
        int result = 0;

        try {
            con = Database.createConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO authregister VALUES(?, ?)");
            ps.setString(1, reg.getUsername());
            ps.setString(2, reg.getPassword());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // ===================== AUTH LOGIN =====================
    public int AuthLogin(String user, String password) {
        Connection con = null;
        int result = 0;

        try {
            con = Database.createConnection();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM authregister WHERE username = ? AND password = ?");
            ps.setString(1, user);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = 1; // Login successful
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // ===================== USER REGISTER =====================
    public int UserRegister(RegisterUser reg) {
        Connection con = null;
        int result = 0;

        try {
            con = Database.createConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO usertable VALUES(?, ?)");
            ps.setString(1, reg.getUsername());
            ps.setString(2, reg.getPassword());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // ===================== USER LOGIN =====================
    public int UserLogin(String user, String password) {
        Connection con = null;
        int result = 0;

        try {
            con = Database.createConnection();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM usertable WHERE username = ? AND password = ?");
            ps.setString(1, user);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = 1; // Login successful
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
