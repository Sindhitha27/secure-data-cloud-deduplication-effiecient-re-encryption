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
<title>O_Verify_File</title>
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
.style4 {
	color: #FF0000;
	font-weight: bold;
}
.style5 {
	color: #FF0000;
	font-size: 24px;
	font-weight: bold;
}
.style7 {color: #FFFF00}
.style8 {color: #FF0000; font-size: 12px; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="O_Main.jsp">Hi <%=application.getAttribute("doname")%> !!</a></li>
          <li><a href="O_Login.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3 style5">Secure Cloud Data Deduplication with Efficient Re-encryption</h1>
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
        <div class="article">
          <h2>Verify_File</h2>
          <p class="infopost">&nbsp;</p>
          <p>&nbsp;</p>
         <table width="835" border="1" align="center">
  <tr>
   <td width="140" height="32" bgcolor="#FF0000"><div align="center" class="style7 style9"><strong>File Name </strong></div></td>
    <td width="178" bgcolor="#FF0000"><div align="center" class="style7 style9"><strong>Owner Name </strong></div></td>
      <td width="293" bgcolor="#FF0000"><div align="center" class="style7 style9"><strong>Trapdoor </strong></div></td>
    <td width="178" bgcolor="#FF0000"><div align="center" class="style7 style9"><strong>Secret Key </strong></div></td>
    <td width="115" bgcolor="#FF0000"><div align="center" class="style7 style9"><strong>Rank </strong></div></td>
    <td width="205" bgcolor="#FF0000"><div align="center" class="style7 style9"><strong>Date & Time</strong></div></td>
	    <td width="205" bgcolor="#FF0000"><div align="center" class="style7 style9"><strong>Verify</strong></div></td>
  </tr>

<%

	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
          
      		String oname=(String)application.getAttribute("doname");
      		 
      		
      		String query="select * from bkupcloud where ownername='" + oname + "'"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(4);
		s4=rs.getString(5);
		s5=rs.getString(6);
		s6=rs.getString(7);
		s7=rs.getString(8);
	
		%>

  <tr>
    <td height="29"><div align="center" class="style8"><%=s2%></div></td>
    <td><div align="center" class="style8"><%=s3%></div></td>
    <td><div align="center" class="style8"><%=s4%></div></td>
	  <td><div align="center" class="style8"><%=s5%></div></td>
	  <td><div align="center" class="style8"><%=s6%></div></td>
    	  <td><div align="center" class="style8"><%=s7%></div></td>
		    <td><div align="center" class="style8"><a href="O_Verify_File1.jsp?fname=<%=s2%>&oname=<%=s3%>">Verify</a></div></td>
  </tr>

<%
	   }
	  
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
</table>
          <p>&nbsp;</p>
          <p><a href="O_Main.jsp">Back</a></p>
          <div class="style2"></div>
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
