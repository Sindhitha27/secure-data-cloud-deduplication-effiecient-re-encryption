<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random"%>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@ include file="connect.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Search_File</title>
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
.style22 {
	font-size: 14px;
	color: #FFFF00;
}
.style25 {padding: 0; margin: 0; width: 100%; line-height: 0; clear: both; font-size: 14px; font-weight: bold; color: #FFFF00; }
.style27 {color: #FF0000; font-weight: bold; }
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
            <h2>File Searched Result by k-nearest neighbor (kNN) scheme</h2>
              <table width="634" border="1" align="center">
  <tr>
   <td width="217" height="34" bgcolor="#FF0000" ><div align="center" class="style2 style22"><strong>FileName</strong></div></td>
      <td width="228" bgcolor="#FF0000" ><div align="center" class="style25">OwnerName </div></td>
	  <td width="228" bgcolor="#FF0000" ><div align="center" class="style25">File Score</div></td>
    <td width="322" bgcolor="#FF0000" ><div align="center" class="style25">Uploaded Date</div></td>
	    <td width="322" bgcolor="#FF0000" ><div align="center" class="style25">Downlaod</div></td>
  </tr>
        
     <%

	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
	String keyword=request.getParameter("fn");
      	try 
	{
       
      	   String query="select * from cloudserver order by rank desc"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);// fname
		s3=rs.getString(3);// Content
		s4=rs.getString(4); // oname
		s5=rs.getString(7);
		s6=rs.getString(8);
		
		
						String keys = "ef50a0ef2c3e3a5f";
						byte[] keyValue1 = keys.getBytes();
						Key key1 = new SecretKeySpec(keyValue1, "AES");
						Cipher c1 = Cipher.getInstance("AES");
						c1.init(Cipher.DECRYPT_MODE, key1);
						String decryptedValue = new String(Base64.decode(s3.getBytes()));
						
						
						if((decryptedValue.toLowerCase().contains(keyword.toLowerCase()))||(s2.toLowerCase().contains(keyword.toLowerCase())))
						{
		
	
		%>
		

  <tr>
    <td height="29"><div align="center" class="style27"><%=s2%></div></td>
    <td><div align="center" class="style27"><%=s4%></div></td>
	<td bgcolor="#00FFFF"><div align="center" class="style27"><%=s5%></div></td>
    	  <td><div align="center" class="style27"><%=s6%></div></td>
		   <td><div align="center" class="style27"><a href="U_Download_Search.jsp?fname=<%=s2%>&oname=<%=s4%>">Download</a></div></td>
  </tr>

<%
}



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
