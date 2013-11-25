<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="YTD._404._404" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="ro-RO">
<head profile="http://gmpg.org/xfn/11">
<title>Robotik Custom Error Pages</title>
<meta charset="utf-8"/>
<meta http-equiv="Content-Language" content="ro"/>
<meta name="robots" content="all,index,follow"/>
<meta name="keywords" content="mogoolab, templates, 404 error page"/>
<meta name="description" content="Robotik HTML Error Pages v 1.0 . Developed by MogooLab - www.mogoolab.com"/>
<meta name="publisher" content="mogoolab.com" />
<meta name="author" content="mogoolab.com" />
<meta http-equiv="X-UA-Compatible" content="IE=8">
<link href='http://fonts.googleapis.com/css?family=Istok+Web|Chivo' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" media="all" href="style.css" />
<link rel="stylesheet" type="text/css" media="all" href="backgrounds.css" />
<link rel="stylesheet" type="text/css" media="all" href="themes/blue/css/style.css" />
<link rel="stylesheet" type="text/css" media="all" href="themes/green/css/style.css" />
<link rel="stylesheet" type="text/css" media="all" href="themes/gray/css/style.css" />


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-global.js"></script>

<!--[if IE]>
<script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->


</head>

<body>


<div class="wrapper">

	<div class="mainWrapper">
        <div class="leftHolder">
        	<a href="http://www.planetcomm.com" title="Logo" class="logo">PlanetComm </a>
            <div class="errorNumber">404</div>                
        </div>
        <div class="rightHolder">
            <div class="message"><p>The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.</div>
            <div class="robotik"><img src="images/robotik.png" alt="Oooops....we can’t find that page." title="Oooops....we can’t find that page." id="robot">
              
            

          

            </div>
      
      <div style="float:right;padding-left:100px;"> 
             <div style="background-color: #FFFFCC" align="center">
             <form id="Form1" runat="server"> 
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                    </telerik:RadScriptManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
            </telerik:RadAjaxLoadingPanel>
                <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1">
                        
                    <asp:Label ID="Label1" runat="server" Text="ตรวจพบความผิดพลาด กรุณาป้อนชื่อของคุณและ Send Email เพื่อติดต่อกลับภายหลัง" 
                        Font-Names="Tahoma" Font-Size="11pt"></asp:Label>
                         <br />
                         <asp:TextBox ID="txtSent" runat="server" Width="120px"></asp:TextBox>
                         &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Entry your name .." ControlToValidate="txtSent" Display="Dynamic" 
                    Font-Size="11px" BackColor="#FFFFCC"></asp:RequiredFieldValidator>
                <asp:Button ID="btnSend" runat="server" Text="Send Email" 
                    onclick="btnSend_Click" /><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblSent" runat="server" Text="Email was sent !!" 
                    BackColor="#FFFFCC" Font-Bold="True" Font-Names="Tahoma" Font-Size="12px" 
                    ForeColor="#00CC66" Visible="False"></asp:Label>
   
                             </telerik:RadAjaxPanel> 
                                          </form>
                                          </div>
        </div>

          </div>
          	</div>
               </div>
        
<!-- end .wrapper -->

   

<script type="text/javascript" >
    function GetValueQueryString(key, default_) {
        if (default_ == null) default_ = "";
        key = key.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        var regex = new RegExp("[\\?&]" + key + "=([^&#]*)");
        var qs = regex.exec(window.location.href);
        if (qs == null)
            return default_;
        else
            return qs[1];
    }

    var N = GetValueQueryString('aspxerrorpath');
    document.getElementById("tt").innerText = N;

           
 </script>
</body>
</html>
