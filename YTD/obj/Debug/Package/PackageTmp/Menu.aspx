<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="YTD.Menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> [ PlanetComm Report on WEB ]</title>
    <script src="MD5.js" type="text/javascript"></script>   
    <link href="img/PN/PanelBar.PN.css" rel="stylesheet" type="text/css" />
    </head>
<body>
    <form id="frm1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
    <div align="center">
    <table border="0" cellpadding="0" cellspacing="0" width="800px" 
            style="height:427px;">
    <tr align="center">
    <td align="center">
        <asp:Label ID="Label1" runat="server" Text="[ Sales Order YTD Report ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#003399"></asp:Label>
        <br />&nbsp;&nbsp;
        </td>
    </tr>
    <tr align="center">
    <td valign="top" align="left">
   <div style="display:none;">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr>
    <td><br /><br /><br /></td>
    </tr>
    <tr>
    <td>
    <a href="YTD_Market.aspx" target="_blank">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/img/SO_YTD_Market.png" /></a>
    </td>
    </tr>
       <tr>
    <td><br /></td>
    </tr>
       <tr>
    <td><a href="Default.aspx" target="_blank">
   <asp:Image ID="Image2" runat="server" ImageUrl="~/img/SO_YTD_Cate.png" /></a></td>
    </tr>
       <tr>
    <td><br /></td>
    </tr>
        <tr>
    <td><a href="SOOutStanding_Market.aspx" target="_blank">
    <asp:Image ID="Image3" runat="server" ImageUrl="~/img/SO_OUT_Market.png" /></a></td>
    </tr>
        <tr>
    <td><br /></td>
    </tr>
        <tr>
    <td>
    <div>
    <a href="ProjCost.aspx" target="_blank">
    <asp:Image ID="Image4" runat="server" ImageUrl="~/img/ProjectCost.png" />
    </a></div>
    </td>
    </tr>
    </table>
       </div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="SmALL" 
            NavigateUrl="http://192.168.73.39/MainMenu.asp" Font-Names="Tahoma">&lt;&lt; Back to Menu</asp:HyperLink>
    
</td>
    </tr>
    <tr>
        <td valign="top">
        <div style="margin:10px 0 10px 0;">
                 <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="center">
                        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="100%" Width="100%">
                        
                        <!-- Order Process-->
                        <div align="left" style="font-family:Tahoma;">
                        <fieldset><legend><font size="3" >Order Processing</font></legend>   <br />
                            <div align="center">
                        <telerik:RadPanelBar ID="RadMenu" Runat="server" Font-Bold="False" Width="95%" 
                                    BackColor="White" EnableEmbeddedSkins="False" SkinID="PN">
                            <Items>
                                
                                <telerik:RadPanelItem runat="server" Owner="RadMenu" 
                                    Font-Bold="True" Font-Size="Large" Expanded="true">
                                 
                                    <Items>
                                        <telerik:RadPanelItem runat="server" Text="• Sales Order" Font-Size="15px" 
                                            Font-Bold="True" ForeColor="#404040" BackColor="#CCE9FD" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                    style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"  >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">                                             
                                                  <select id="drpStatus" style="width:140px;">
			<option value="I" >Incomplete</option>
			<option value="A">ALL</option>
		</select>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <select name="txtYear" style="width:100px;">
			<option value="0" >ALL</option>
			<option value="<%=DateTime.Now.Year.ToString()%>"><%=DateTime.Now.Year.ToString()%></option>
		    <option value="<%=(DateTime.Now.Year-1).ToString()%>"><%=(DateTime.Now.Year - 1).ToString()%></option>
            <option value="<%=(DateTime.Now.Year-2).ToString()%>"><%=(DateTime.Now.Year - 2).ToString()%></option>
            <option value="<%=(DateTime.Now.Year-3).ToString()%>"><%=(DateTime.Now.Year - 3).ToString()%></option>
            <option value="<%=(DateTime.Now.Year-4).ToString()%>"><%=(DateTime.Now.Year - 4).ToString()%></option>
		</select>
                                                </td> <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel" Width="120px" OnClientClick="rptexcel(1);" />
                                                    <asp:Button ID="btnSOWeb" runat="server" Text="Web" Width="120px" OnClientClick="rptexcel(2);" />
                                                    </td>
                                          
                                            </tr>
                                                
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                        <telerik:RadPanelItem runat="server" 
                                            Text="• Sales Order OutStanding (New)" Font-Size="15px" Font-Bold="True" 
                                            ForeColor="#404040" BackColor="#CCE9FD">
                                            <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                           style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;" >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td> <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="sooutnewrpt();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                        <telerik:RadPanelItem runat="server" Text="• Inventory Control" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#CCE9FD" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> Incomplete</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>ALL</b>
                                                </td> <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel" Width="120px" 
                                                        OnClientClick="icrptexcel(1);" />
                                                    <asp:Button ID="btnSOWeb" runat="server" OnClientClick="icrptexcel(0);" 
                                                        Text="Web" Width="120px" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                        <telerik:RadPanelItem runat="server" Text="• PJC" Font-Size="15px" 
                                            Font-Bold="True" ForeColor="#404040" BackColor="#CCE9FD">
                                            <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px"  style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"  >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> Incomplete</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>ALL</b>
                                                </td> <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px"  
                                                        OnClientClick="pjcrptexcel(2);" />
                                            
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                        <telerik:RadPanelItem runat="server" Text="• Invoice" Font-Size="15px" 
                                            Font-Bold="True" ForeColor="#404040" BackColor="#CCE9FD">
                                            <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px"  style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"  >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td> <td style="width:300px;" align="center" colspan="2"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel & Web" Width="240px"  
                                                        OnClientClick="invALLrpt();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                        <telerik:RadPanelItem runat="server" Text="• Project Price" Font-Size="15px" 
                                            Font-Bold="True" ForeColor="#404040" BackColor="#CCE9FD">
                                            <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px"  style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"  >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>ALL</b>
                                                </td> <td style="width:300px;" align="center" colspan="2"> 
                                           <asp:Button ID="btnSOEx" runat="server" Text="Excel & Web" Width="240px"  
                                                        OnClientClick="projpricerpt();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                        <telerik:RadPanelItem runat="server" Text="• Order Summary List" 
                                            Font-Size="14px" Font-Bold="True" ForeColor="#404040" BackColor="#CCE9FD">
                                            <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px"  style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"  >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>ALL</b>
                                                </td> <td style="width:300px;" align="center" colspan="2"> 
                                           <asp:Button ID="btnSOEx" runat="server" Text="Excel & Web" Width="240px"  OnClientClick="oesummaryrpt();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                    </Items>
                                 
                                </telerik:RadPanelItem>
                            
                                                      
                                        

                            </Items>
                          
                        </telerik:RadPanelBar>
                        </div>
                             <br />
                       </fieldset>
                       </div>

                       <br />

                       <!-- Sales -->
                       <div align="left" style="font-family:Tahoma;">
                        <fieldset><legend><font size="3" >Sales</font></legend>   <br />
                            <div align="center">
                        
                        <%--<telerik:RadPanelBar ID="RadPanelBar1" Runat="server" BackColor="White" 
                        Font-Bold="True" Font-Size="Large" Skin="Office2007" Width="95%">
                        <Items>
                            <telerik:RadPanelItem runat="server" Expanded="true" Font-Bold="True" 
                                Font-Size="Large" Owner="RadPurchase">
                                <Items>
                                        
                                        <telerik:RadPanelItem runat="server" Text="Sales Order YTD by Market" Font-Size="Medium">
                                          <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                    style="background-color:#B2B232;">
                                            <tr>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="center">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="center" >
                                            <b>YTD</b>
                                                </td> <td style="width:300px;" align="center" colspan="2"> 
                                           <asp:Button ID="btnSOEx" runat="server" Text="Excel & Web" Width="240px"  OnClientClick="soytdrpt();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

<telerik:RadPanelItem runat="server" Text="Sales Order History" Font-Size="Medium">
                                          <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                    style="background-color:#B2B232;;">
                                            <tr>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="center">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="center" >
                                            <b>YTD</b>
                                                </td> <td style="width:300px;" align="center" colspan="2"> 
                                                    <asp:Button ID="btnSOHis" runat="server" Text="Excel & Web" Width="240px"  OnClientClick="sohisrpt();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                    </Items>
                            </telerik:RadPanelItem>

                            

                        </Items>
                    </telerik:RadPanelBar>--%>


                    <!-- AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA -->
                    <telerik:RadPanelBar ID="RadPanelBar5" Runat="server" Font-Bold="False" Width="95%" 
                                    BackColor="White" EnableEmbeddedSkins="False" SkinID="PN">
                            <Items>
                                
                                <telerik:RadPanelItem runat="server" Owner="RadMenu" 
                                    Font-Bold="True" Font-Size="Large" Expanded="true">
                                 
                                    <Items>
                                        
                                        <telerik:RadPanelItem runat="server" 
                                            Text="• Sales Order YTD by Market" Font-Size="15px" Font-Bold="True" 
                                            ForeColor="#404040" BackColor="#B2B232">
                                            <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                           style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;" >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td> <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="soytdrpt();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                        <telerik:RadPanelItem runat="server" 
                                            Text="• Sales Order YTD History" Font-Size="15px" Font-Bold="True" 
                                            ForeColor="#404040" BackColor="#B2B232">
                                            <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                           style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;" >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td> <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="sohisrpt();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                        
                                     
                                    </Items>
                                 
                                </telerik:RadPanelItem>
                            
                                                      
                                        

                            </Items>
                          
                        </telerik:RadPanelBar>
                    <!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->

                                  </div>
                             <br />
                       </fieldset>
                       </div>

                        <br />

                         <!-- Marketing -->
                          <div align="left" style="font-family:Tahoma;">
                        <fieldset><legend><font size="3" >Marketing</font></legend>   <br />
                            <div align="center">

                        <%--<telerik:RadPanelBar ID="RadSalesYTD" Runat="server" BackColor="White" 
                        Font-Bold="True" Font-Size="Large" Skin="Office2007" Width="95%">
                        <Items>

                            <telerik:RadPanelItem runat="server" Owner="RadMenu" Font-Bold="True" 
                                Font-Size="Large" Expanded="true">
                                    <Items>

                                        <telerik:RadPanelItem runat="server" Text="Product Category Incentive" Font-Size="Medium">
                                          <ItemTemplate>
                                                   <div align="right">
                                                        <table border="0" cellpadding="0" cellspacing="0" 
                                                            style="background-color:#FFA74F;" width="750px">
                                                            <tr>
                                                                <td align="right" style="width:50px;">
                                                                    Status :
                                                                </td>
                                                                <td align="center" style="width:150px;">
                                                                    <b>ALL</b>
                                                                </td>
                                                                <td align="right" style="width:50px;">
                                                                    Year :
                                                                </td>
                                                                <td align="center" style="width:110px;">
                                                                    <b>ALL</b>
                                                                </td>
                                                                <td align="center" colspan="2" style="width:300px;">
                                                                    <asp:Button ID="btnSOEx11" runat="server" OnClientClick="prodcaterpt();" 
                                                                        Text="Excel &amp; Web" Width="240px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                        

                                         <telerik:RadPanelItem runat="server" Text="Sales Order YTD by Category" Font-Size="Medium">
                                          <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                    style="background-color:#FFA74F;">
                                            <tr>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="center">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="center" >
                                            <b>YTD</b>
                                                </td> <td style="width:300px;" align="center" colspan="2"> 
                                           <asp:Button ID="btnSOEx" runat="server" Text="Excel & Web" Width="240px"  OnClientClick="soytdcaterpt();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                        
                                        <telerik:RadPanelItem runat="server" Text="BOM Generator" Font-Size="Medium">
                                          <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                    style="background-color:#FFA74F;">
                                            <tr>
                                            <td style="width:50px;" align="right"> </td>
                                              <td style="width:150px;" align="center">
                                            <b></b>
                                                </td>
                                                 <td style="width:50px;" align="right"> </td>
                                              <td style="width:110px;" align="center" >
                                            <b></b>
                                                </td> <td style="width:300px;" align="center" colspan="2"> 
                                           <asp:Button ID="btnSOEx" runat="server" Text="Link to page" Width="240px"  OnClientClick="bom();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                                 
                                        
                                        

                                    </Items>
                                </telerik:RadPanelItem>
                        </Items>
                    </telerik:RadPanelBar>--%> 
                    <!-- END SALES ORDER -->

                    <telerik:RadPanelBar ID="RadPanelBar1" Runat="server" Font-Bold="False" Width="95%" 
                                    BackColor="White" EnableEmbeddedSkins="False" SkinID="PN">
                            <Items>
                                
                                <telerik:RadPanelItem runat="server" Owner="RadMenu" 
                                    Font-Bold="True" Font-Size="Large" Expanded="true">
                                 
                                    <Items>
                                        
                                        <telerik:RadPanelItem runat="server" 
                                            Text="• Product Category Incentive" Font-Size="15px" Font-Bold="True" 
                                            ForeColor="#404040" BackColor="#FFA74F">
                                            <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                           style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;" >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>ALL</b>
                                                </td> <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="prodcaterpt();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                        <telerik:RadPanelItem runat="server" 
                                            Text="• Sales Order YTD by Category" Font-Size="15px" Font-Bold="True" 
                                            ForeColor="#404040" BackColor="#FFA74F">
                                            <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                           style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;" >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td> <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="soytdcaterpt();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                        <telerik:RadPanelItem runat="server" 
                                            Text="• BOM Generator" Font-Size="15px" Font-Bold="True" 
                                            ForeColor="#404040" BackColor="#FFA74F">
                                            <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                           style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;" >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right"> </td>
                                              <td style="width:150px;" align="left">
                                          
                                                </td>
                                                 <td style="width:50px;" align="right"> </td>
                                              <td style="width:110px;" align="left" >
                                          
                                                </td> <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Link to Page" Width="240px" 
                                                        OnClientClick="bom();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                        
                                     
                                    </Items>
                                 
                                </telerik:RadPanelItem>
                            
                                                      
                                        

                            </Items>
                          
                        </telerik:RadPanelBar>

                    <!--------------------------------- -->

                               </div>
                             <br />
                       </fieldset>
                       </div>

                      <br />

                        <!-- Pur -->
                        <asp:Panel ID="PanelPur" runat="server">
                         
                          <div align="left" style="font-family:Tahoma;">
                        <fieldset><legend><font size="3" >Purchasing</font></legend>   <br />
                            <div align="center">

                        <%--<telerik:RadPanelBar ID="RadPurchase" Runat="server" BackColor="White" 
                        Font-Bold="True" Font-Size="Large" Skin="Office2007" Width="95%">
                        <Items>
                            <telerik:RadPanelItem runat="server" Expanded="true" Font-Bold="True" 
                                Font-Size="Large" Owner="RadPurchase">
                                <Items>
                                        <telerik:RadPanelItem runat="server" Text="Purchase Order" Font-Size="Medium">
                                          <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                    style="background-color:#CC99FF;">
                                            <tr>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="center">
                                            <b> Incomplete</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="center" >
                                          <select name="txtYearPO" style="width:100px;">
			<option value="0" selected>ALL</option>
			<option value="<%=DateTime.Now.Year.ToString()%>"><%=DateTime.Now.Year.ToString()%></option>
		    <option value="<%=(DateTime.Now.Year-1).ToString()%>"><%=(DateTime.Now.Year - 1).ToString()%></option>
            <option value="<%=(DateTime.Now.Year-2).ToString()%>"><%=(DateTime.Now.Year - 2).ToString()%></option>
            <option value="<%=(DateTime.Now.Year-3).ToString()%>"><%=(DateTime.Now.Year - 3).ToString()%></option>
            <option value="<%=(DateTime.Now.Year-4).ToString()%>"><%=(DateTime.Now.Year - 4).ToString()%></option>
		</select>
                                                </td> <td style="width:300px;" align="center"> 
                                                <asp:Button ID="btnSOEx" runat="server" Text="Excel" Width="120px" OnClientClick="porpt(1);" />
                                                    <asp:Button ID="btnSOWeb" runat="server" Text="Web" Width="120px" OnClientClick="porpt(2);" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                      
                                        <telerik:RadPanelItem runat="server" Text="Pre-Requisition Report" Font-Size="Medium">
                                          <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                    style="background-color:#CC99FF;">
                                            <tr>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="center">
                                            <b> Incomplete</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="center" >
                                        2013
                                                </td> <td style="width:300px;" align="center"> 
                                           <asp:Button ID="btnPRPO" runat="server" Text="Excel & Web" Width="240px"  OnClientClick="prpo();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                        
                                        <telerik:RadPanelItem runat="server" Text="Purchase Order Goods In Transit" Font-Size="Medium">
                                          <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                    style="background-color:#CC99FF;">
                                            <tr>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="center">
                                            <b> Incomplete</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="center" >
                                   2013
                                                </td><td style="width:300px;" align="center" colspan="2"> 
                                           <asp:Button ID="btnPOGDS" runat="server" Text="Excel & Web" Width="240px"  OnClientClick="pogds();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>


                                        <telerik:RadPanelItem runat="server" Text="Purchase Order Running" Font-Size="Medium">
                                          <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                    style="background-color:#CC99FF;">
                                            <tr>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="center">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="center" >YTD
                                                </td><td style="width:300px;" align="center" colspan="2"> 
                                           <asp:Button ID="btnPOGDS" runat="server" Text="Excel & Web" Width="240px"  OnClientClick="porun();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                        
                                    </Items>
                            </telerik:RadPanelItem>
                        </Items>
                    </telerik:RadPanelBar>--%>

                    <!-- END PO -->

                    <telerik:RadPanelBar ID="RadPanelBar6" Runat="server" Font-Bold="False" Width="95%" 
                                    BackColor="White" EnableEmbeddedSkins="False" SkinID="PN">
                            <Items>
                                
                                <telerik:RadPanelItem runat="server" Owner="RadMenu" 
                                    Font-Bold="True" Font-Size="Large" Expanded="true">
                                 
                                    <Items>
                                        <telerik:RadPanelItem runat="server" Text="• Purchase Order" Font-Size="15px" 
                                            Font-Bold="True" ForeColor="#404040" BackColor="#CC99FF" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                    style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"  >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">                                             
                                                  <b>Incomplete</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <select name="txtYearPO" style="width:100px;">
			<option value="0" >ALL</option>
			<option value="<%=DateTime.Now.Year.ToString()%>"><%=DateTime.Now.Year.ToString()%></option>
		    <option value="<%=(DateTime.Now.Year-1).ToString()%>"><%=(DateTime.Now.Year - 1).ToString()%></option>
            <option value="<%=(DateTime.Now.Year-2).ToString()%>"><%=(DateTime.Now.Year - 2).ToString()%></option>
            <option value="<%=(DateTime.Now.Year-3).ToString()%>"><%=(DateTime.Now.Year - 3).ToString()%></option>
            <option value="<%=(DateTime.Now.Year-4).ToString()%>"><%=(DateTime.Now.Year - 4).ToString()%></option>
		</select>

                                                </td> <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel" Width="120px" OnClientClick="porpt(1);" />
                                                    <asp:Button ID="btnSOWeb" runat="server" Text="Web" Width="120px" OnClientClick="porpt(2);" />
                                                    </td>
                                          
                                            </tr>
                                                
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                        <telerik:RadPanelItem runat="server" 
                                            Text="• Pre-Requisition Report" Font-Size="15px" Font-Bold="True" 
                                            ForeColor="#404040" BackColor="#CC99FF">
                                            <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                           style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;" >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b><%=DateTime.Now.Year.ToString() %></b>
                                                </td> <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="prpo();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                        <telerik:RadPanelItem runat="server" Text="• Purchase Order Goods In Transit" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#CC99FF" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> Incomplete</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b><%=DateTime.Now.Year.ToString() %></b>
                                                </td>
                                                <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="pogds();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                        <telerik:RadPanelItem runat="server" Text="• Purchase Order Running" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#CC99FF" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>ALL</b>
                                                </td>
                                                <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="porun();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                     
                                        <telerik:RadPanelItem runat="server" Text="• Order Scheduling Plan" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#CC99FF" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b><%=DateTime.Now.Year.ToString() %></b>
                                                </td>
                                                <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="odersch();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                    </Items>
                                 
                                </telerik:RadPanelItem>
                            
                                                      
                                        

                            </Items>
                          
                        </telerik:RadPanelBar>

                    <!-- ----------------------- END NEW PO -->

                          </div>
                             <br />
                       </fieldset>
                       </div>
               
                       </asp:Panel>
                    <br />

                    <!-- Vendor -->
                    <asp:Panel ID="PanelVendor" runat="server">
                      <div align="left" style="font-family:Tahoma;">
                        <fieldset><legend><font size="3" >Review</font></legend>   <br />
                            <div align="center">

                        <%--<telerik:RadPanelBar ID="RadPanelBar3" Runat="server" BackColor="White" 
                        Font-Bold="True" Font-Size="Large" Skin="Office2007" Width="95%">
                        <Items>
                            <telerik:RadPanelItem runat="server" Expanded="true" Font-Bold="True" 
                                Font-Size="Large" Owner="RadPurchase">
                                <Items>
                                 
                                 
<telerik:RadPanelItem runat="server" Text="AP Vendor Review" Font-Size="Medium">
                                          <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                    style="background-color:#F6CEEC;">
                                            <tr>
                                            <td style="width:50px;" align="right"> </td>
                                              <td style="width:150px;" align="center">
                                            <b> </b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="center" >YTD
                                                </td><td style="width:300px;" align="center" colspan="2"> 
                                           <asp:Button ID="btnPOGDS" runat="server" Text="Excel & Web" Width="240px"  OnClientClick="apven();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                        
                                    </Items>
                            </telerik:RadPanelItem>
                        </Items>
                    </telerik:RadPanelBar>--%>
                    <!-- END Vendor -->

                    <telerik:RadPanelBar ID="RadPanelBar7" Runat="server" Font-Bold="False" Width="95%" 
                                    BackColor="White" EnableEmbeddedSkins="False" SkinID="PN">
                            <Items>
                                
                                <telerik:RadPanelItem runat="server" Owner="RadMenu" 
                                    Font-Bold="True" Font-Size="Large" Expanded="true">
                                 
                                    <Items>
                                     
                                        <telerik:RadPanelItem runat="server" Text="• AP Vendor Review" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#F6CEEC" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right"></td>
                                              <td style="width:150px;" align="left">
                                            <b> </b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td>
                                                <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="apven();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                     
                                    </Items>
                                 
                                </telerik:RadPanelItem>
                            
                            <telerik:RadPanelItem runat="server" Owner="RadMenu" 
                                    Font-Bold="True" Font-Size="Large" Expanded="true">
                                 
                                    <Items>
                                     
                                        <telerik:RadPanelItem runat="server" Text="• AR Customer Review" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#F6CEEC" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right"></td>
                                              <td style="width:150px;" align="left">
                                            <b> </b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td>
                                                <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="arcust();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                     
                                     <telerik:RadPanelItem runat="server" Text="• AP Payment" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#F6CEEC" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right"></td>
                                              <td style="width:150px;" align="left">
                                            <b> </b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td>
                                                <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="arpay();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                    </Items>
                                 
                                </telerik:RadPanelItem>

                            </Items>
                          
                        </telerik:RadPanelBar>
                    <!-- END NEW -->

                          </div>
                             <br />
                       </fieldset>
                       </div>
                    </asp:Panel>
                    <br />

                     <!-- Invoice Cost Report -->
                     <asp:Panel ID="PanelINVCost" runat="server">                
                          <div align="left" style="font-family:Tahoma;">
                        <fieldset><legend><font size="3" >Sales Report</font></legend>   <br />
                            <div align="center">
                        <%--<telerik:RadPanelBar ID="RadPanelBar4" Runat="server" BackColor="White" 
                        Font-Bold="True" Font-Size="Large" Skin="Office2007" Width="95%">
                        <Items>
                            <telerik:RadPanelItem runat="server" Expanded="true" Font-Bold="True" 
                                Font-Size="Large" Owner="RadPurchase">
                                <Items>
                                 
                                 
<telerik:RadPanelItem runat="server" Text="Invoice Cost Report" Font-Size="Medium">
                                          <ItemTemplate>
                                                   <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" 
                                                    style="background-color:#DA81F5;">
                                            <tr>
                                            <td style="width:50px;" align="right"> </td>
                                              <td style="width:150px;" align="center">
                                            <b> </b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="center" >YTD
                                                </td><td style="width:300px;" align="center" colspan="2"> 
                                           <asp:Button ID="btnPOGDS" runat="server" Text="Excel & Web" Width="240px"  OnClientClick="invcost();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                        
                                    </Items>
                            </telerik:RadPanelItem>
                        </Items>
                    </telerik:RadPanelBar>--%>
                       <!-- END InvCostReport -->

                       <telerik:RadPanelBar ID="RadPanelBar3" Runat="server" Font-Bold="False" Width="95%" 
                                    BackColor="White" EnableEmbeddedSkins="False" SkinID="PN">
                            <Items>
                                
                                <telerik:RadPanelItem runat="server" Owner="RadMenu" 
                                    Font-Bold="True" Font-Size="Large" Expanded="true">
                                 
                                    <Items>
                                     
                                        <telerik:RadPanelItem runat="server" Text="• Invoice Cost Report" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#DA81F5" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right"> </td>
                                              <td style="width:150px;" align="left">
                                            <b> </b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td>
                                                <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="invcost();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                        <telerik:RadPanelItem runat="server" Text="• Sales History Report" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#DA81F5" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right"> </td>
                                              <td style="width:150px;" align="left">
                                            <b> </b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td>
                                                <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="saleshis();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>

                                        <telerik:RadPanelItem runat="server" Text="• Sales Report By Customer Group" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#DA81F5" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right"> </td>
                                              <td style="width:150px;" align="left">
                                            <b> </b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td>
                                                <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnGC" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="gc();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                     
                                    </Items>
                                 
                                </telerik:RadPanelItem>
                            
                                                      
                                        

                            </Items>
                          
                        </telerik:RadPanelBar>
                       <!-- END New -->
                          </div>
                             <br />
                       </fieldset>
                       </div>
                       </asp:Panel>
                    <br />
                    
                         </telerik:RadAjaxPanel>
                    </td>
                </tr>

                <tr>
                    <td>
                        <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" Height="100%" Width="100%">
                <asp:Panel ID="PanelExp" runat="server">
                           
                         <div align="left" style="font-family:Tahoma;">
                        <fieldset><legend><font size="3" >Expire</font></legend>   <br />
                            <div align="center">
                    <%--<telerik:RadPanelBar ID="RadCost" Runat="server" BackColor="White" 
                        Font-Bold="True" Font-Size="Large" Skin="Office2007" Width="95%">
                        <Items>
                            <telerik:RadPanelItem runat="server" Expanded="true" Font-Bold="True" 
                                Font-Size="Large" Owner="RadMenu">
                                <Items>
                                    <telerik:RadPanelItem runat="server" Font-Size="Medium" Text="Project Cost">
                                        <ItemTemplate>
                                            <div align="right">
                                                <table border="0" cellpadding="0" cellspacing="0" 
                                                    style="background-color:#CCFF99;" width="750px">
                                                    <tr>
                                                        <td align="right" style="width:50px;">
                                                            Status :
                                                        </td>
                                                        <td align="center" style="width:150px;">
                                                            <b>ALL</b>
                                                        </td>
                                                        <td align="right" style="width:50px;">
                                                            Year :
                                                        </td>
                                                        <td align="center" style="width:110px;">
                                                            <b>ALL</b>
                                                        </td>
                                                        <td align="center" style="width:300px;">
                                                            <asp:Button ID="btnSOEx10" runat="server" OnClientClick="costpt();" 
                                                                Text="Excel &amp; Web" Width="240px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelItem>
                        </Items>
                    </telerik:RadPanelBar>--%>
                    <!-- END ProjCost -->

                    <telerik:RadPanelBar ID="RadPanelBar2" Runat="server" Font-Bold="False" Width="95%" 
                                    BackColor="White" EnableEmbeddedSkins="False" SkinID="PN">
                            <Items>
                                
                                <telerik:RadPanelItem runat="server" Owner="RadMenu" 
                                    Font-Bold="True" Font-Size="Large" Expanded="true">
                                 
                                    <Items>
                                     
                                        <telerik:RadPanelItem runat="server" Text="• Quote Expire" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#ADD8E6" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td>
                                                <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="qtex();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                     
                                    </Items>
                                 
                                </telerik:RadPanelItem>
                            
                                                      
                                        

                            </Items>
                          
                        </telerik:RadPanelBar>
                    <!-- END New -->

                    </div>
                             <br />
                       </fieldset>
                       </div>
                                       
                </asp:Panel>
                </telerik:RadAjaxPanel>
                    </td>
                </tr>

                <tr>                    
                <td>
                <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" Height="100%" Width="100%">
                <asp:Panel ID="PanelCost" runat="server">
                           
                         <div align="left" style="font-family:Tahoma;">
                        <fieldset><legend><font size="3" >Project Cost</font></legend>   <br />
                            <div align="center">
                    <%--<telerik:RadPanelBar ID="RadCost" Runat="server" BackColor="White" 
                        Font-Bold="True" Font-Size="Large" Skin="Office2007" Width="95%">
                        <Items>
                            <telerik:RadPanelItem runat="server" Expanded="true" Font-Bold="True" 
                                Font-Size="Large" Owner="RadMenu">
                                <Items>
                                    <telerik:RadPanelItem runat="server" Font-Size="Medium" Text="Project Cost">
                                        <ItemTemplate>
                                            <div align="right">
                                                <table border="0" cellpadding="0" cellspacing="0" 
                                                    style="background-color:#CCFF99;" width="750px">
                                                    <tr>
                                                        <td align="right" style="width:50px;">
                                                            Status :
                                                        </td>
                                                        <td align="center" style="width:150px;">
                                                            <b>ALL</b>
                                                        </td>
                                                        <td align="right" style="width:50px;">
                                                            Year :
                                                        </td>
                                                        <td align="center" style="width:110px;">
                                                            <b>ALL</b>
                                                        </td>
                                                        <td align="center" style="width:300px;">
                                                            <asp:Button ID="btnSOEx10" runat="server" OnClientClick="costpt();" 
                                                                Text="Excel &amp; Web" Width="240px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelItem>
                        </Items>
                    </telerik:RadPanelBar>--%>
                    <!-- END ProjCost -->

                    <telerik:RadPanelBar ID="RadPanelBar4" Runat="server" Font-Bold="False" Width="95%" 
                                    BackColor="White" EnableEmbeddedSkins="False" SkinID="PN">
                            <Items>
                                
                                <telerik:RadPanelItem runat="server" Owner="RadMenu" 
                                    Font-Bold="True" Font-Size="Large" Expanded="true">
                                 
                                    <Items>
                                     
                                        <telerik:RadPanelItem runat="server" Text="• Project Cost" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#CCFF99" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td style="width:50px;" align="right">Status : </td>
                                              <td style="width:150px;" align="left">
                                            <b> ALL</b>
                                                </td>
                                                 <td style="width:50px;" align="right">Year : </td>
                                              <td style="width:110px;" align="left" >
                                            <b>YTD</b>
                                                </td>
                                                <td style="width:300px;" align="center"> 
                                                    <asp:Button ID="btnSOEx" runat="server" Text="Excel &amp; Web" Width="240px" 
                                                        OnClientClick="costpt();" />
                                                    </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                     
                                    </Items>
                                 
                                </telerik:RadPanelItem>
                            
                                                      
                                        

                            </Items>
                          
                        </telerik:RadPanelBar>
                    <!-- END New -->

                    </div>
                             <br />
                       </fieldset>
                       </div>
                                       
                </asp:Panel>
                </telerik:RadAjaxPanel>
                </td>
                </tr>
                <tr>                    
                <td>
                <br />

                    <asp:Panel ID="PanelLog" runat="server">
                   
                        <div align="left" style="font-family:Tahoma;">
                        <fieldset><legend><font size="3" >User Acess Log</font></legend>   <br />
                            <div align="center">
                    <%--<telerik:RadPanelBar ID="RadPanelBar2" Runat="server" BackColor="White" 
                        Font-Bold="True" Font-Size="Large" Skin="Office2007" Width="95%">
                        <Items>
                            <telerik:RadPanelItem runat="server" Expanded="true" Font-Bold="True" 
                                Font-Size="Large" Owner="RadMenu">
                                <Items>
                                    <telerik:RadPanelItem runat="server" Font-Size="Medium" Text= "User Acess Log">
                                        <ItemTemplate>
                                            <div align="right">
                                                <table border="0" cellpadding="0" cellspacing="0" 
                                                    style="background-color:#64E4E4;" width="750px">
                                                    <tr>
                                                 
                                                        <td align="center" colspan="4">
                                                            <asp:Button ID="btnSOEx10" runat="server" OnClientClick="userlog();" 
                                                                Text="Excel &amp; Web" Width="240px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelItem>
                        </Items>
                    </telerik:RadPanelBar>--%>
                    <!-- END Log -->

                    <telerik:RadPanelBar ID="RadPanelBar8" Runat="server" Font-Bold="False" Width="95%" 
                                    BackColor="White" EnableEmbeddedSkins="False" SkinID="PN">
                            <Items>
                                
                                <telerik:RadPanelItem runat="server" Owner="RadMenu" 
                                    Font-Bold="True" Font-Size="Large" Expanded="true">
                                 
                                    <Items>
                                     
                                        <telerik:RadPanelItem runat="server" Text="• User Acess Log" 
                                            Font-Size="15px" Font-Bold="True" ForeColor="#404040" BackColor="#64E4E4" >
                                            <ItemTemplate>
                                            <div align="right">
                                            <table border="0" cellpadding="0" cellspacing="0" width="750px" style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #666666;"                                                >
                                            <tr><td align="center"><asp:Button ID="btnSOEx" 
                                                    runat="server" OnClientClick="userlog();" Text="Excel &amp; Web" 
                                                    Width="240px" />
                                                </td>
                                          
                                            </tr>
                                            </table>
                                            </div>
                                            </ItemTemplate>
                                        </telerik:RadPanelItem>
                                     
                                    </Items>
                                 
                                </telerik:RadPanelItem>
                            

                            </Items>
                          
                        </telerik:RadPanelBar>
                    <!-- END New -->
                    </div>
                             <br />
                            </font>
                       </fieldset>
                       </div>
                        </asp:Panel>

                </td>
                </tr>
                </table>
                </div>
        </td>
    </tr>
    </table>

    </div>
    </form>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script language="javascript">

            function linkopen(link) {
                window.open(link, '');
            }

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

            document.getElementById('divCost').style.display = 'none';
            document.getElementById('divPur').style.display = 'none';
            document.getElementById('divLog').style.display = 'none';
            document.getElementById('divVendor').style.display = 'none';
            document.getElementById('divINVCost').style.display = 'none';

            var N = GetValueQueryString('N');
            var S = GetValueQueryString('S');

            var ID_Aneak = MD5('016');
            var ID_Worawanna = MD5('066');
            var ID_Supaporn = MD5('213');
            var ID_Ratana = MD5('039');
            var ID_Kulthida = MD5('075');
            var ID_Thannapan = MD5('203');
            var ID_Trevor = MD5('002');
            var ID_Prapat = MD5('001');
            var ID_Thanattha = MD5('248');
            var ID_Watinee = MD5('046');

            var ID_Somboonluk = MD5('003');
            
            var ID_Patchara = MD5('008');
            var ID_Ratchaneewan = MD5('077');
            var ID_Raynuka = MD5('175');
            var ID_Anongrat = MD5('200');
            var ID_Bongkot = MD5('237');

            var ID_TukTa = MD5('271');
            var ID_Ratiwan = MD5('278');

            var ID_Liw = MD5('063');
            
            //alert(N);

//            switch (N) {
//                case ID_Aneak:        
//                case ID_Ratana:
//                case ID_Thannapan:
//                case ID_Prapat:
//                case ID_Trevor:
//                    document.getElementById('divCost').style.display = 'block';
//                    document.getElementById('divPur').style.display = 'block';
//                    document.getElementById('divVendor').style.display = 'block';
//                    document.getElementById('divLog').style.display = 'block';
//                    document.getElementById('divINVCost').style.display = 'block';
//                    break;
//                case ID_Anongrat:
//                case ID_Bongkot:
//                case ID_Somboonluk:
//                case ID_Patchara:
//                case ID_Ratchaneewan:
//                case ID_Raynuka:
//                case ID_Watinee:
//                case ID_Ratiwan:
//                    document.getElementById('divPur').style.display = 'block';
//                    document.getElementById('divVendor').style.display = 'block';
//                    document.getElementById('divLog').style.display = 'none';
//                    document.getElementById('divCost').style.display = 'none';
//                    document.getElementById('divINVCost').style.display = 'none';
//                    break;
//                                 
//                case ID_Worawanna:
//                    document.getElementById('divLog').style.display = 'block';
//                    document.getElementById('divPur').style.display = 'block';
//                    document.getElementById('divVendor').style.display = 'block';
//                    document.getElementById('divCost').style.display = 'none';
//                    document.getElementById('divINVCost').style.display = 'block';
//                    break;

//                case ID_Kulthida:
//                    document.getElementById('divCost').style.display = 'block';
//                    document.getElementById('divLog').style.display = 'none';
//                    document.getElementById('divPur').style.display = 'none';
//                    document.getElementById('divVendor').style.display = 'none';
//                    document.getElementById('divINVCost').style.display = 'none';
//                    break;

//                case ID_Thanattha:
//                    document.getElementById('divCost').style.display = 'block';
//                    document.getElementById('divLog').style.display = 'none';
//                    document.getElementById('divPur').style.display = 'none';
//                    document.getElementById('divVendor').style.display = 'none';
//                    document.getElementById('divINVCost').style.display = 'none';
//                    break;

//                case ID_Liw:
//                    document.getElementById('divLog').style.display = 'none';
//                    document.getElementById('divPur').style.display = 'none';
//                    document.getElementById('divCost').style.display = 'none';
//                    document.getElementById('divVendor').style.display = 'block';
//                    document.getElementById('divINVCost').style.display = 'none';
//                    break;

//                case ID_Supaporn:
//                case ID_TukTa:
//                    document.getElementById('divPur').style.display = 'block';
//                    document.getElementById('divVendor').style.display = 'block';
//                    document.getElementById('divLog').style.display = 'none';
//                    document.getElementById('divCost').style.display = 'none';
//                    document.getElementById('divINVCost').style.display = 'block';
//                    break;

//                default:
//                    document.getElementById('divCost').style.display = 'none';
//                    document.getElementById('divPur').style.display = 'none';
//                    document.getElementById('divLog').style.display = 'none';
//                    document.getElementById('divVendor').style.display = 'none';
//                    document.getElementById('divINVCost').style.display = 'none';
//                    break;
//            }

            // hide 
            function hidepanel() {
                var panel = $find("<%= RadMenu.ClientID %>");
                panel.get_element().style.display = "none";
            }
            // show the panel
            function showpanel() {
                var panel = $find("<%= RadMenu.ClientID %>");
                panel.get_element().style.display = "";
            }

            
            // Menu

            function arpay() {
                window.open('http://192.168.73.39/YTD/Payment.aspx');
            }


            function qtex() {
                window.open('http://192.168.73.39/YTD/QTExpire.aspx');
            }


            function gc() {
                window.open('http://192.168.73.39/YTD/CustGroupAmt.aspx');
            }


            function pogds() {
                window.open('http://192.168.73.39/YTD/PO_GoodsInTransit.aspx');
            }

            function porun() {
                window.open('http://192.168.73.39/YTD/PORunning.aspx');
            }


            function oesummaryrpt(n) {

                window.open('http://192.168.73.39/YTD/SO_ReCheck.aspx');
            }

            function apven() {

                window.open('http://192.168.73.39/YTD/APVendorReview.aspx');
            }

            function arcust() {

                window.open('http://192.168.73.39/YTD/APVendor.aspx');
            }

            function rptexcel(n) {

                window.open('http://192.168.73.39/ACCPAC/SO-OPReportExcel.asp?typ=' + n + '&drpStatus=' + document.frm1.drpStatus.value + '&txtYear=' + document.frm1.txtYear.value);
            }
            function icrptexcel(ty) {
                window.open('http://192.168.73.39/ACCPAC/IC-OPReportExcel.asp?typ=' + ty);
            }
            function pjcrptexcel(ty) {
                //window.open('http://192.168.73.39/ACCPAC/PJC-OPReportExcel.asp?typ=' + ty);
                window.open('http://192.168.73.39/YTD/OrderManagement.aspx');
            }

            function sooutrpt(ty) {
                window.open('http://192.168.73.39/ACCPAC/SO-OutStanding.asp?typ=' + ty);
            }
            function sooutcaterpt(ty) {
                window.open('http://192.168.73.39/ACCPAC/SO-OutStanding_Cate.asp?typ=' + ty);
            }

            function porpt(ty) {
                window.open('http://192.168.73.39/ACCPAC/PO-OPReportExcel.asp?typ=' + ty + '&txtYear=' + document.frm1.txtYearPO.value);
            }

            function invrpt(ty) {
                window.open('http://192.168.73.39/ACCPAC/INV-YTD.asp?typ=' + ty);
            }

            function soytdrpt() {
                //window.open('http://192.168.73.39/YTD/underCon.html');  
                window.open('http://192.168.73.39/YTD/YTD_Market.aspx');
            }

            function prpo() {

                window.open('http://192.168.73.39/YTD/PRPO.aspx');
            }

            function soytdcaterpt() {

                window.open('http://192.168.73.39/YTD/Default.aspx');
            }


            function sooutnewrpt() {

                window.open('http://192.168.73.39/YTD/SOOutStanding_Market.aspx');
            }

            function bom() {
                window.open('http://192.168.73.39/YTD/BOMGenerate.aspx?N=' + N + '&S=' + S);
            }

            function costpt() {
                window.open('http://192.168.73.39/YTD/ProjCost.aspx?N=' + N);
            }

            function  projpricerpt() {
                window.open('http://192.168.73.39/YTD/ProjPrice.aspx');
            }

            function prodcaterpt() {
                window.open('http://192.168.73.39/YTD/ProdCateIntensive.aspx');
            }

            function sohisrpt() {
                window.open('http://192.168.73.39/YTD/YTD_SOHistory.aspx');
            }

            function invALLrpt(ty) {
                window.open('http://192.168.73.39/YTD/TotalINV.aspx');
            }

            function userlog() {
                window.open('http://192.168.73.39/YTD/UserLog.aspx');
            }

            function invcost() {
                window.open('http://192.168.73.39/YTD/TotalINVCost.aspx');
            }

            function odersch() {
                window.open('http://192.168.73.39/YTD/OrderSchedulingPlan.aspx');
            }

            function saleshis() {
                window.open('http://192.168.73.39/YTD/SalesHistory.aspx');
            }  
            // End Menu 


      
 </script>
    </telerik:RadCodeBlock>
    
</body>
</html>
