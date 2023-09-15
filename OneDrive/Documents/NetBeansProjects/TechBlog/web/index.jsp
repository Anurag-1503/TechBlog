
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

            .banner-background {

                clip-path: polygon(0% 0%, 81% 5%, 95% 54%, 80% 96%, 0% 100%);

            }
        </style>

    </head>
    <body>
        <!-- navbar -->
        <%@include file="normal_navbar.jsp" %>

        <!--banner-->

        <div class="container-fluid p-0 m-0">

            <div class="jumbotron primary-background text-white banner-background">

                <div class="container">
                    <h1 class="display-3">Online Blogging Platform</h1>
                    
                    <p>A blog is an informational website published on the World Wide 
                        Web consisting of discrete, often informal 
                        diary-style text entries (posts). 
                        Posts are typically displayed 
                        in reverse chronological order
                        so that the most recent post 
                        appears first, at the top of 
                        the web page. </p>

                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-toggle-right"></span>Start ! its free</button>
                    <a href="login-page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-sign-in fa-spin"></span>Login</a>
                </div>
            </div>

        </div>

        <br>

        <div class='container'>

            <div class='row' style=" background-image:url(image/orange_bg.jpg) ">
                <%

                    PostDao d = new PostDao(ConnectionProvider.getConnection());

                    List<Posts> posts = null;

                    posts = d.getLatestPosts();

                    for (Posts p : posts) {
                %>
                <div class='col-md-4 mt-2'>
                    <div class="card mt-2"style="border:2px black;" >
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getpTitle()%> </h5>

                            <p class="card-text"><%= p.getpContent()%> </p>
                            <a href="#!" class="btn btn-outline-dark" onclick="showLoginPrompt()">Read More</a>

                        </div>
                    </div>
                </div>
                <%
                    }
                %>



            </div>


            <!-- javaScript -->
            <script>
                src = "https://code.jquery.com/jquery-3.6.3.min.js"
                integrity = "sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
                crossorigin = "anonymous" ></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="js/myJS.js" type="text/javascript"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            
            <script>
                function showLoginPrompt() {
                    Swal.fire({
                        title: "Login Required",
                        text: "You must be logged in or signed up before accessing the full content.",
                        icon: "info",
                        showCancelButton: false,

                    });
                }
            </script>
    </body>
</html>
