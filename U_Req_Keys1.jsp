<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>U_Req_Sk_Key</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-georgia.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 24}
.style2 {padding:0; margin:0; width:100%; line-height:0; clear: both;}
.style3 {font-size: 36px; }
.style20 {
	color: #FF0000;
	font-size: 24px;
}
.style22 {color: #FFFF00}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="U_Main.jsp">Hi <%=application.getAttribute("uname")%> !!</a></li>
          <li><a href="U_Login.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3 style20">Secure Cloud Data Deduplication with Efficient Re-encryption</h1>
      </div>
      <div class="clr style1"></div>
      <div class="slider style1">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /> </a> </div>
        <div class="style2"></div>
      </div>
      <div class="clr style1"></div>
    </div>
  </div>
  <div class="content style1">
    <div class="content_resize">
      <div class="mainbar">
        <div class="mainbar">
          <div class="article">
            <h2>Requested File Key Status !!! </h2>
            
			<p>&nbsp;</p>
			<p>
			
			<%
try
{
	
	String owner = request.getParameter("t142");
	String fname = request.getParameter("t14");
	String uname=(String)application.getAttribute("uname");
	String generate ="Requested",sk="";
	
	SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
	
	
		String query1="select * from cloudserver  where fname='"+fname+"' and ownername='"+owner+"' "; 
		Statement st1=connection.createStatement();
		ResultSet rs1=st1.executeQuery(query1);
		if ( rs1.next())
		{
		
			String duplcheck="Shared";
			if (duplcheck.equalsIgnoreCase("Shared"))
			{
			String query="select * from request  where user='"+uname+"' and fname='"+fname+"' and owner='"+owner+"' "; 
			Statement st=connection.createStatement();
			ResultSet rs=st.executeQuery(query);
			if ( rs.next()==true)
			{
			
				sk=rs.getString(5);
				if(sk.equalsIgnoreCase("Requested"))
				{
					%>
</p>
          <h2 class="style31">Request Already Sent To Data Owner!</h2>
          <p class="style28"><a href="U_Main.jsp" class="style3">Back</a></p>
          <%
				}
				else if(sk.equalsIgnoreCase("No"))
				{
					String query3="update request set secretkey='Requested' where user='"+uname+"' and owner='"+owner+"' and fname='"+fname+"'";
					connection.createStatement().executeUpdate(query3);
					
					%>
          <h2 class="style31">Request Sent To The Key Server!</h2>
          <p><a href="U_Main.jsp" class="style3">Back</a></p>
          <%
				}
				else
				{
					%>
          <h2 class="style31">Request Already Sent To Key Server!</h2>
          <p class="style28"><a href="U_Main.jsp" class="style3">Back</a></p>
          <%
				}		
			}
			else
			{
			
			
			
String query4="insert into request(user,owner,fname,secretkey,mlekey) values('"+uname+"','"+owner+"','"+fname+"','Requested','Requested')";
				connection.createStatement().executeUpdate(query4); 
				%>
          <h2 class="style31">Request Sent To Key Server!</h2>
          <p class="style28"><a href="U_Main.jsp" class="style3">Back</a></p>
          <p class="style28">
            <%
					
			}
		}
		else
		{
			%>
          </p>
          <h2 class="style31">Please Wait For Cloud To Verify File ! </h2>
          <p><a href="U_Main.jsp" class="style3">Back</a></p>
          <p>
            <%
		}	
			
		}
		else
		{
			%>
          </p>
          <h2 class="style31">File Doesn't Exist / File Is Not Verified By Cloud ! </h2>
          <p><a href="U_Main.jsp" class="style3">Back</a></p>
          <p>
            <%
		}
		
	connection.close();
} 
catch(Exception e)
{
out.println(e.getMessage());
}
	%>
			
			  
			  
		    </p>
			<p>&nbsp;</p>
            <p><a href="U_Main.jsp">Back</a></p>
            <div class="post_content"></div>
            <div class="style2"></div>
          </div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
    </div>
        <div class="gadget">
          <h2 class="star"> Menu</h2>
          <div class="style2"></div>
          <ul class="sb_menu">
            <li><a href="U_Main.jsp">Home</a></li>
           
            <li><a href="U_Login.jsp">Logout</a></li>
          </ul>
        </div>
  </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="fbg style1">
    <div class="fbg_resize">
      <div class="style2"></div>
    </div>
  </div>
  <div class="footer style1">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style1"></div>
</body>
</html>
