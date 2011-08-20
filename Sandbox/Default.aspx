<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>JavaScript Samples</title>
    <link rel="Stylesheet" type="text/css" href="CSS/Global.css" />
    <script language="javascript" type="text/javascript">
        String.prototype.reverse = function() { return this.split("").reverse().join(""); }
        
        function checkText()
        {
            var results = document.getElementById("resultText");
            var regExText = document.getElementById("RegEx");
            var textToCheck = document.getElementById("textToCheck");
            var regEx = RegExp(regExText.value);
            alert(regExText.value);
            regEx.global = true;
            if (textToCheck.value.match(regEx) != null)
            {
                results.innerHTML = "Matches";
            }
            else
            {
                results.innerHTML = "No Match";
            }

        }

        function ReverseString(textToReverse)
        {
            document.getElementById('localResults').innerHTML = textToReverse.reverse();
        }

        var xmlhttp;
        function ajaxFunction(textToCheck)
        {
            if (window.XMLHttpRequest)
            {
                // code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else if (window.ActiveXObject)
            {
                // code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            else
            {
                alert("Your browser does not support XMLHTTP!");
            }
            var url = "Results.aspx";
            url = url + "?q=" + textToCheck;
            url = url + "&sid=" + Math.random();
            xmlhttp.onreadystatechange = stateChanged;
            xmlhttp.open("GET", url, true);
            xmlhttp.send(null);

        }
        function stateChanged()
        {
            if (xmlhttp.readyState == 4)
            {
                document.getElementById("result").innerHTML = xmlhttp.responseText;
            }
        }

    </script>

</head>
<body>
    <div class="header"><a href="/Default.aspx">Welcome to My Sandbox</a></div>
    <div class="subheader">Examples: <a href="/dojo.html">Dojo</a><a href="/JQ/jq.htm">jQuery</a> <a href="/extjs/demo.html">ExtJS 4</a></div>
    <div class="MainContent">
    <h2>RegEx Tester</h2>
    <div>
        <label>RegEx:</label>
        <input type="text" style="height: 20px; font-size: 16px; font-weight: bold;
            width: 600px;" id="RegEx" value="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" /></div>
    <div>
        <label>Text to check:</label>
        <textarea rows="4" cols="20" id="textToCheck">212-223-1231</textarea></div>
    <div>
        <input type="button" onclick="checkText()" value="Check It" /></div>
    <label>Result:</label> <div class="results" id="resultText"></div>
    <hr />
    <h2>Ajax call</h2>
    <label>Name:</label>
    <input type="text" name="username" onkeyup="ajaxFunction(this.value)" />
    <label>Time:</label>
    <div class="results" id="result"></div>
    <hr />
    <form id="Form1" runat="server">
    <h2>DB Dropdown Populate</h2>
    <div>
        <asp:DropDownList runat="server" ID="ddlContacts" />
        <asp:Button runat="server" ID="btnPopDDL" Text="Populate DDL" OnClick="PopulateDDL" />
    </div>
    <hr />
    <h2>Server-Side Reverse call</h2>
    <label>String to reverse</label>
    <input type="text" id="strReverse" runat="server" />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Reverse It" />
    <label>Results:</label><div class="results" id="reverseResult" runat="server"></div>
    </form>
    <hr />
    <h2>Client-Side Reverse call</h2>
    <label>String to reverse</label>
    <input type="text" id="localStrReverse" />
    <input type="button" onclick="ReverseString(document.getElementById('localStrReverse').value)" value="Reverse It" />
    <label>Results:</label><div class="results" id="localResults"></div>
    </div>
</body>
</html>
