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
<title>Attacker</title>
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
.style3 {
	font-size: 24px;
	color: #FF0000;
	font-weight: bold;
}
.style14 {font-size: 24; color: #FFFF00; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="C_Main.jsp">CLOUD SERVER</a></li>
          <li><a href="C_Login.jsp">LOGOUT</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3">Secure Cloud Data Deduplication with Efficient Re-encryption</h1>
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
          <h2>External Attacker</h2>
          <p class="infopost">&nbsp;</p>
          <div class="style2"></div>
          <div class="post_content">
           <%
  String prcst="",attcksttus="",prc="";
  String fn, ct, on, mac = "";
  	try {
  		String file = request.getParameter("t1");
  		String oname = request.getParameter("ot");
  		String attack = request.getParameter("attack");
  		
  		application.setAttribute("aname",attack);
  			%><h1>Add Malicious Content to File</h1>
<%
  			
  		
  		String sk = "";
  		String strQuery = "select * from cloudserver where fname='"+ file + "' ";
  		ResultSet rs = connection.createStatement().executeQuery(strQuery);
  	
  			if (rs.next() == true) {
  				fn = rs.getString(2);
  				ct = rs.getString(3);

  				mac = rs.getString(5);
  				sk = rs.getString(6);

  				SimpleDateFormat sdfDate = new SimpleDateFormat(
  						"dd/MM/yyyy");
  				SimpleDateFormat sdfTime = new SimpleDateFormat(
  						"HH:mm:ss");

  				Date now = new Date();

  				String strDate = sdfDate.format(now);
  				String strTime = sdfTime.format(now);
  				String dt = strDate + "   " + strTime;
  				String task = "Download";
  %>

<form action="Attacker2.jsp" method="get" name="form1" id="form1">
<table width="478" border="0" align="center">
	<tr>
		<td width="223" bgcolor="#FF0000"><span class="style14">Enter File Name :-</span></td>
		<td width="245"><label> <input required name="t1"
			type="text" value="<%=file%>" size="40" /> </label></td>
	</tr>

	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style14">Ur Name :-</span></td>
		<td><input name="t12" type="text" value="<%=oname%>" size="40" /></td>
	</tr>
	
	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style14">Owner Name :-</span></td>
		<td><input name="t12" type="text" value="<%=oname%>" size="40" /></td>
	</tr>

	<tr>
		<td bgcolor="#FF0000"><span class="style14">File Content :-</span></td>
		<td><textarea name="text" id="textarea" cols="45" rows="17"><%=ct%></textarea></td>
	</tr>


	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<div align="right"></div>		</td>
		<td><label> <input type="submit" name="Submit2"
			value="Attack" /> </label></td>
	</tr>
</table>
</form>

<%
									} 
  		
  							else {

								out.println("File Doesn't Exist !!!");
								%> <%
								}
									

									connection.close();
								
						  			
						  			
  							}					
							catch (Exception e) {
									out.println(e.getMessage());
								}
							%>
          </div>
          <div class="style2"></div>
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
          <h2 class="star"> Cloud Menu</h2>
          <div class="style2"></div>
          <ul class="sb_menu">
            <li><strong><a href="C_Main.jsp">Home</a></strong></li>
			<li><strong><a href="C_Login.jsp">Logout</a></strong></li>
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
