<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">


    <%
        
        User user =(User) session.getAttribute("currentUser");
        // to intentionally delay the response
        Thread.sleep(500);
        
        
        PostDao d = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Posts> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }
        
        if(posts.size() == 0){
        out.println("<h3 class='display-3 text-center'>no posts in this category...</h3>");
        }

        for (Posts p : posts) {

    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%= p.getpTitle()%> </b>
                <p><%= p.getpContent()%></p>
            </div>
            <div class="card-footer primary-background text-center">
                <a href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read more...</a>
                <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                    
                    %>
            <a  href="#!" onclick="doLike(<%= p.getPid() %>,<%= user.getId() %> )" id="like"  class="btn btn-sm btn-outline-light"> <i class="fa fa-thumbs-o-up" ></i> <span id="like-counter-<%= p.getPid() %>"> <%= ld.countLikeOnPost(p.getPid()) %> </span></a>                
            
            <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i> <span></span></a>
            </div>
        </div>

    </div>  


    <%
        }

    %>
</div>