
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Main</title>
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
.style28 {padding: 0; margin: 0; width: 100%; line-height: 0; clear: both; color: #FFFF00; font-weight: bold; }
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
            <h2>Download File !!! </h2>
            <p>&nbsp;</p>
             <%
		  
		    	try 
				{
		  		String file = request.getParameter("t1");

		  		
		        
		  		String a=(String)application.getAttribute("a");
		  		String fn=(String)application.getAttribute("file");
		  		String un=(String)application.getAttribute("uename");
		  		String oname = request.getParameter("oname");
		  		
		  							String mac="";
				String sk="";
				String reqstatus="Permitted";
				
				
				
				String strQuery = "select * from cloudserver where fname='"+file+"' and ownername='"+oname+"'";
				ResultSet rs = connection.createStatement().executeQuery(strQuery);
			
					if(rs.next()==true)
					{
						mac=rs.getString(5);
						sk=rs.getString(6);
						
					SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

					Date now = new Date();

					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;	
					String task="Download";
					String user=(String) application.getAttribute("uname");
					String strQuery2 = "insert into transaction(user,fname,sk,task,dt) values('"+user+"','"+file+"','"+sk+"','"+task+"','"+dt+"')";
					connection.createStatement().executeUpdate(strQuery2);
					
					String Query1 = "select * from request where secretkey='"+reqstatus+"' and mlekey='"+reqstatus+"' and user='"+user+"' and owner='"+oname+"'";
				ResultSet rs1 = connection.createStatement().executeQuery(Query1);
					if(rs1.next()==true)
					{
					
			%>
			
			
			
			
			
			<form action="U_Download2.jsp" method="get" name="form1" id="form1">
            <table width="478" border="0" align="center">
              <tr>
                <td width="223" height="34" bgcolor="#FF0000"><span class="style28">Enter File Name :-</span></td>
                <td width="245"><label>
                  <input required name="t1" type="text" value="<%=file%>" size="40" />
                </label></td>
              </tr>
			   <tr>
            <td width="223" height="38" bgcolor="#FF0000"><span class="style28">Owner Name:-</span></td>
             <td>   <select id="s1" name="oname" style="width:150px;" class="text">
                  <option><%= oname%></option>
            	  
                </select></td>
			  </tr>
			  
              <tr>
                <td height="42" bgcolor="#FF0000"><span class="style28">Trapdoor :-</span></td>
                <td><input name="t12" type="text" value="<%=mac%>" size="40" /></td>
              </tr>
              <tr>
                <td height="32" bgcolor="#FF0000"><span class="style28">Secret Key :-</span></td>
                <td><input name="t13" type="text" value="<%=sk%>" size="40" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td><div align="right"></div></td>
                <td><label>
                  <input type="submit" name="Submit2" value="Verify Trapdoor and Download" />
                </label></td>
              </tr>
            </table>
          </form>		
			
			<%	
					}
					else
					{
					
						
			%>
						<p><a href="U_Main.jsp">Back</a></p>
						
						<h1>File Keys are not Requested or Permitted !!!</h1>
	<%
					}
					
					}
					
					else
					{
		
						out.println("File Doesn't Exist !!!");
			%>
						<p><a href="U_Main.jsp">Back</a></p>
	<%
					}
				
	 
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%> 		

            <div class="style2"></div>
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
