

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            #cardd{
                font-family:  monospace;
                background:black;

            }
                #cbody,#cfoot,#chead
                {
                    font-size: 35px;
                    background: orange;
                    border-color: black;
                }
        </style>
        
    </head>
    
    <body class="primary-background">
        <%@include file="normal_navbar.jsp" %> 
        
        <div class="container " style="margin-top:20px;">
            
            <div class="card mt-4" id="cardd">
                
                <div class="card-header" id="chead"> 
                
                   Online Blogging platform
                    
                </div> 
                
                <div class="card-body" id="cbody">
                   
                Developed By - Anurag Gaur 
                <br>
                Mini Project, 6th Semester
                <br> BTech. CST  , Section SPL2 , RollNo - 12
                <br>
                Developed using - 
                <br>
                <ul >
                    <li> Front End : 
                    
                        <ul>
                            <li> Java EE : JSP (JAVA SERVER PAGES)</li>
                            <li> Styling using BootStrap And CSS</li>
                            <li> JavaScript and AJAX for Asynchronous Calling </li>
                        </ul>
                        
                    </li>
                    
                    <li>
                        BackEnd And DataBase
                        <ul>
                            <li> BackEnd : Java EE using Servlets and JSP  </li>
                            <li> DataBase : JDBC with MySQL </li>
                            <li> DataBase Software used : MySQL WorkBench</li>
                            </ul>
                    </li>
                    
                </ul>
                </div>
                            <div class="card-footer" id="cfoot">
                Thank You  Email : 03.anurag.15@gmail.com<br>Phn : xxx-xxx-xxxx
            </div>  
            </div>

          
        </div>
        
    </body>
</html>