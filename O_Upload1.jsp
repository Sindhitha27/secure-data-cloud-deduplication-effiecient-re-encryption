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
<title>Upload</title>
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
-->
</style>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}

</script>
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
          <h2>Uploading File Details!!! </h2>
          <p class="infopost">&nbsp;</p>
          <% try 
	{
      		String file=request.getParameter("tt");
      		String cont=request.getParameter("text");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
      		String filename="filename.txt";
      		
      		String cname=(String)application.getAttribute("ownercloud");
			
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String encryptedValue = new String(Base64.encode(cont.getBytes()));

      		PrintStream p = new PrintStream(new FileOutputStream(filename));
			p.print(new String(cont));
			
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(filename);
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
 
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
 
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			
			
			Statement st=connection.createStatement();
      		String sql="select * from cloudserver where mac='"+h1+"'";
      		ResultSet rs=st.executeQuery(sql);
			if(!(rs.next())){
			
      		
	
%>

<form action="O_Upload2.jsp" method="post">
<table width="598" border="1" align="center">

	<tr>
		<td width="286" bgcolor="#FF0000"><span class="style4 style2 style7">File Name :- </span></td>
		<td width="356"><input name="t42" type="text" id="t42" size="50"
			value="<%= file %>" readonly="readonly" /></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000">&nbsp;</td>
		<td><textarea name="text2" cols="50" rows="15" readonly><%= encryptedValue %></textarea></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000"><span class="style4 style2 style7">Trapdoor: </span></td>
		<td><input name="t4" type="text" id="t4" size="50"
			value="<%= h1 %>" readonly="readonly" /></td>
	</tr>
	
	
	<tr>
		<td bgcolor="#FF0000">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td bgcolor="#FF0000">
		<div align="right"><span class="style2"></span></div>		</td>
		<td><input type="submit" name="Submit2" value="Upload" /></td>
	</tr>
</table>
</form>


<%
}else
			{
				%>
				<h2>DATA  DUPLICATION FOUND BY HASH CODE!!! CONTENTES ALREADY AVAILABLE IN THE CLOUD SERVER !!! </h2>
				<p>
				  <%
				  
				  Date now = new Date();
				  
		    SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
				  
				  String oname=(String)application.getAttribute("doname");
				 
			      connection.createStatement().executeUpdate("insert into dduplicate(oname,fname,mac,dt) values ('"+ oname+ "','" + file + "','"+ h1+ "','"+ dt+ "')");
				  
				  
				  
			}
	   

         connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
        </div>
        <div class="gadget">
          <h2 class="star"><a href="O_Main.jsp">Back</a></h2>
        </div>
      </div>
      <div class="style2">f</div>
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
