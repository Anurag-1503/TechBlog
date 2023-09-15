package com.tech.blog.dao;

import com.sun.org.apache.xpath.internal.operations.Quo;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Posts;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String q = "select * from categories";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {

                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Posts p) {
        boolean f = false;
        try {

            String q = "insert into posts(pTitle,pContent,pCOde,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

//    get all the post
    public List<Posts> getAllPosts() {

        List<Posts> list = new ArrayList<>();

//        fetch all the post
        try {
            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = p.executeQuery();
            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pdate = set.getTimestamp("pdate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");

                Posts post = new Posts(pid, pTitle, pContent, pCode, pPic, pdate, catId, catId);
                list.add(post);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Posts> getPostByCatId(int catId) {

        List<Posts> list = new ArrayList<>();

        try {
            PreparedStatement p = con.prepareStatement("select * from posts where catId = ?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();
            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pdate = set.getTimestamp("pdate");
                int userId = set.getInt("userId");

                Posts post = new Posts(pid, pTitle, pContent, pCode, pPic, pdate, catId, catId);
                list.add(post);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

//        fetch all the post by category id
        return list;

    }

    public Posts getPostByPostId(int postId) {

        Posts post = null;

        String q = "select * from posts where pid = ?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);
            ResultSet set = p.executeQuery();
            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pdate = set.getTimestamp("pdate");
                int cid = set.getInt("catID");
                int userId = set.getInt("userId");

                post = new Posts(pid, pTitle, pContent, pCode, pPic, pdate, cid, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return post;
    }

    public List<Posts> getLatestPosts() {
        List<Posts> list = new ArrayList<>();

        //Fetch all the posts from database belonging to a specific Category 
        try {

            PreparedStatement p = con.prepareStatement("select* from posts order by pDate desc limit 6 ");
            
            ResultSet set = p.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");

                int userId = set.getInt("userId");
                int catId = set.getInt("catId");
                Posts post = new Posts(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
