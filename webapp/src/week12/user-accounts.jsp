<%@page import="week12.app.User"%>
<%@page import="week12.app.Account"%>
<%@page import="week12.data.DataAccess"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>ATM Project - Accounts</title>
	<%
	User curUser = null;
	//request available inside .jsp
	//check if this session set 'user' attribute already (from LoginServlet)
	Object obj = request.getSession().getAttribute("user");
	if( obj instanceof User)
	{
		//with this set we can connect to db later and get this users info
		//so we can display it in html
		curUser = (User)obj;
	}
	else 
	{
		curUser = new User(-1, -1, "", "");
	}
	
	DataAccess da = new DataAccess();
	da.connect();
	List<Account> accountList = da.getUserAccounts(curUser);
	da.disconnect();
	%>
</head>
<body style="height: 500px; background-image: url(./images/background.jpg); ">
    <!-- Header -->
    <div class="atmcenter header">
    <table style="width: 100%">
    <tr>
    <td style="width: 35px;"><img src="./images/logo.png" style="width: 32px;" /></td>
    <td style="text-align: center; font-size: larger; font-weight: bolder; font-family: Verdana;">
    ATM Project - Accounts
    <% 
    	out.print(curUser.getFirstName() + " " + curUser.getLastName());
    %>
    </td>
    </tr>
    </table>
    </div>
    <!-- Content -->
    <hr />
    <div style="height: 500px;">
        <table style="width: 100%;">
            <tr>
                <td style="vertical-align: top;text-align: left; background-color: silver; width: 150px; height: 500px; border-right: 1px solid black;">
                    <a href="index.html">Home</a><br />
                    <a href="new-account.jsp">Add Account</a><br />
                    <a href="LogoutServlet">Logout</a><br />
                </td>
                <td style="text-align: center; width: 80%; vertical-align: top;">
                &nbsp;
                    Welcome to Nicks ATM Project&nbsp;
                    <% 
    					out.print(curUser.getFirstName());
    				%>!               
                    <br />
                    <table style="width: 100%;">
                    <tr>
                    <td>
                    <ul>
                    <%
                    	out.print("Number of accounts: ");
                    	out.println(accountList.size());
                    	for(Account a : accountList)
                    	{
                    		out.print("<li>");
                    		out.print(a.getName());
                    		out.println("</li>");
                    	
                    	}
                    %>
                    </ul>
                    </td>
                    </tr>
                    </table>
                   
                </td>
                <td style="vertical-align: top; border-left: 1px solid black; text-align: center;">
                   
                    <img src="./images/card-image.jpg" style="width: 125px;" /><br />
                    <span style="font-family: Verdana;font-size: 8pt;text-aligh: center;">Apply!</span>
                </td>
            </tr>
        </table>
    </div>
    <!-- Footer -->
    <div style="font-family: Times New Roman; font-size: small; text-align: center;">
        <hr />
        <span style="font-family: Times New Roman; font-size: small; text-align: center;">Copyright &copy; nsweeney</span>
    </div>
</body>
</html>
