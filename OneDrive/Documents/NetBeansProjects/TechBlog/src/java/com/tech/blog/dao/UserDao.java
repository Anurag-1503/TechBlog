package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert user to database
    public boolean saveUser(User user) {
        boolean f = false;

        try {

            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        /*  iss method mai User class ka ek object banayenge or user ki info nikalenge 
                 user ka email or password use krke database se user nikalenge
                or User clas k object mai vo info daal denge or uska reference return kar denge :)
                null return kardenge agar koi user entity(user ki entry nahi hai ) present nahi hai DataBase
                mai with specified user email and password */
        try {
            String query = "select* from user where email=? and password=?";
            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, email);
            psmt.setString(2, password);
            ResultSet set = psmt.executeQuery();
            if (set.next()) {
                user = new User();

                //             data from db
                String name = set.getString("name");
                //             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTimestamp(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }

        } catch (SQLException e) {
        }
        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;

        try {
            String query = "update user set name=? , email=? , password=? , gender=?, about=? , profile=? where id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByUserId(int userId) {

        User user = null;
        try {
            String q = "select * from user where Id = ?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();

            if (set.next()) {
                user = new User();

                //             data from db
                String name = set.getString("name");
                //             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTimestamp(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
