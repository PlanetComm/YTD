<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderSchedulingPlan.aspx.cs" Inherits="YTD.OrderSchedulingPlan" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 215px;
        }
        .style2
        {
            width: 135px;
        }
    </style>
</head>
<body style="font-family:Tahoma;">
    <form id="form1" runat="server" defaultbutton="btnSubmit">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
                 Skin="Default">
             </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                 <AjaxSettings>
                     <telerik:AjaxSetting AjaxControlID="btnSubmit">
                         <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="Panel2" 
                                 LoadingPanelID="RadAjaxLoadingPanel1" />
                             <telerik:AjaxUpdatedControl ControlID="NotifyWarn" />
                             <telerik:AjaxUpdatedControl ControlID="Panel1" />
                         </UpdatedControls>
                     </telerik:AjaxSetting>
                 </AjaxSettings>
             </telerik:RadAjaxManager>

             <div align="center">
   <table border="0" cellpadding="0" cellspacing="0" width="1300px" style="background-color:#AC193D;font-size:10px;" id="myTable">
    <tr>
    <td align="center" style="width:auto;height:50px;" colspan="2">
   
    <asp:Label ID="Label1" runat="server" Text="Order Scheduling Plan" Font-Bold="True" Font-Names="Tahoma" Font-Size="25px" ForeColor="#FFFFFF"></asp:Label> 
        </td>
    </tr>
    <tr>
    <td align="left" style="width:auto;" colspan="2">
     <!-- Start New -->
     <div style="padding:10px 10px 5px 10px;">
     <table border="0" cellpadding="1" cellspacing="4" width="100%">
     
     <tr>
         <td style="background-color:#FFFFFF;">
 <div style="padding:5px 5px 5px 5px;">
     
     <table border="0" cellpadding="0" cellspacing="0" width="100%">
     <tr>
     <td style="width:550px;"> 
     <asp:Label ID="Label2" runat="server" Font-Size="12px" Text="Sales Order No. :"></asp:Label>
             &nbsp;&nbsp;<telerik:RadTextBox ID="txtSO" Runat="server" Skin="Sunset" 
             Width="150px">
             </telerik:RadTextBox>
             &nbsp;<telerik:RadButton ID="btnSubmit" runat="server" 
                 BackColor="White" BorderColor="#AC193D" BorderStyle="Solid" BorderWidth="2px" 
                 ButtonType="LinkButton" Font-Size="11px" 
                 Skin="Office2010Silver" Text="Submit" Visible="true" Width="120px" 
                 onclick="btnSubmit_Click">
             </telerik:RadButton>&nbsp;<telerik:RadButton ID="btnExport" runat="server" 
                 BackColor="White" BorderColor="#AC193D" BorderStyle="Solid" BorderWidth="2px" 
                 ButtonType="LinkButton" Font-Size="11px" 
                 Skin="Office2010Silver" Text="Export" Visible="true" Width="120px" 
             onclick="btnExport_Click"  >          </telerik:RadButton></td>
     <td align="left" valign="middle">
     <table border="0" cellpadding="0" cellspacing="0" width="700px">
                         <tr>
                         <td class="style1">
                             <img src="img/flag_yellow.png" />EXP ship date (Exp. Delivery date on SO)</td>
                         <td class="style2">
                             <img src="img/flag_green.png" />PO ETA (PO Line Item)</td>
                         <td>
                             <img src="img/flag_red.png" />Contract Date (Request Date on Sales Order)</td>
                         </tr>
                         </table>
       </td>
     </tr>
     <tr>
     <td style="width:550px;"> 
         <asp:Panel ID="Panel1" runat="server">
        
         &nbsp; <asp:Label ID="Label3" runat="server" Font-Size="11px" Text="Count :" 
         Font-Bold="True"></asp:Label>            &nbsp;&nbsp;<asp:Label ID="lblC" runat="server" Font-Size="12px" 
         Font-Bold="True" ForeColor="Maroon"></asp:Label> </asp:Panel></td>
     <td align="left" valign="middle">
         &nbsp;</td>
     </tr>
     </table>       
                  
    
                       
                        
                       
            
               
                        
                    </div>
         </td>
     </tr>
     
     <tr>
     <td style="background-color:#FFFFFF;" >
     <div style="padding:5px 5px 5px 5px;">
         <asp:Panel ID="Panel2" runat="server">
         
             <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" 
                 CellSpacing="0" GridLines="None" Skin="Sitefinity" 
                 onneeddatasource="RadGrid1_NeedDataSource" 
                 onitemdatabound="RadGrid1_ItemDataBound">
                 <ClientSettings EnableRowHoverStyle="True">
                     <Selecting AllowRowSelect="True" />
                 </ClientSettings>
                 <MasterTableView>
                     <CommandItemSettings ExportToPdfText="Export to PDF" />
                     <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                         Visible="True">
                     </RowIndicatorColumn>
                     <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                         Visible="True">
                     </ExpandCollapseColumn>
                     <Columns>
                         <telerik:GridBoundColumn DataField="ORDNUMBER" 
                             FilterControlAltText="Filter clnSO column" HeaderText="SO/PR No." 
                             UniqueName="clnSO">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="CUST" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Proj / Cust" 
                             UniqueName="clnCust">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="VDNAME" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Vendor" 
                             UniqueName="clnVendor">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="PONUMBER" 
                             FilterControlAltText="Filter clnSO column" HeaderText="PO No." 
                             UniqueName="clnPO">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AllowFiltering="False" DataField="SOUID" 
                             FilterControlAltText="Filter clnUID column" HeaderText="UID" 
                             UniqueName="clnUID">
                             <ItemStyle Width="80px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="ITEMNO" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Item No." 
                             UniqueName="clnItemNo">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                  
                         <telerik:GridBoundColumn DataField="ITEMDESC" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Description" 
                             UniqueName="clnDesc">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="EXPDATE" HeaderTooltip="Exp. Delivery date on Sales Order"
                             FilterControlAltText="Filter clnSO column" HeaderText="EXP ship Date" 
                             UniqueName="clnEXPDATE">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="EXPARRIVAL" 
                             FilterControlAltText="Filter clnSO column" HeaderText="PO ETA" HeaderTooltip="PO Line Item"
                             UniqueName="clnPOETA">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="REQDATE" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Contract Date" HeaderTooltip="Request Date on Sales Order"
                             UniqueName="clnREQDATE">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                            
                            <telerik:GridTemplateColumn DataField="JAN" 
                             FilterControlAltText="Filter clnSO column" HeaderText="JAN" 
                             HeaderTooltip="Request Date on Sales Order" UniqueName="clnJan">
                                <ItemTemplate>

                                <asp:Label ID="lblJan" runat="server" Text='<%#Eval("JAN") %>' Visible="false"></asp:Label>
                                    <table border="0" cellpadding="0" cellspacing="0" width="40px" style="font-size:9px;">                                    
                                           <tr>
                                        <td>W1</td>                                    
                                        <td>W2</td>                                    
                                        <td>W3</td>                                    
                                        <td>W4</td>
                                    </tr>
                                    <tr>
                                        <td id="tdJan1" runat="server">&nbsp;</td>                                    
                                        <td id="tdJan2" runat="server">&nbsp;</td>                                    
                                        <td id="tdJan3" runat="server">&nbsp;</td>                                    
                                        <td id="tdJan4" runat="server">&nbsp;</td>
                                    </tr>
                               
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                         </telerik:GridTemplateColumn>
                            
                            <telerik:GridTemplateColumn DataField="FEB" 
                             FilterControlAltText="Filter clnSO column" HeaderText="FEB" 
                             HeaderTooltip="Request Date on Sales Order" UniqueName="clnFeb">
                                <ItemTemplate>

                                <asp:Label ID="lblFeb" runat="server" Text='<%#Eval("FEB") %>' Visible="false"></asp:Label>
                                    <table border="0" cellpadding="0" cellspacing="0" width="40px" style="font-size:9px;">                                    
                                                <tr>
                                        <td>W5</td>                                    
                                        <td>W6</td>                                    
                                        <td>W7</td>                                    
                                        <td>W8</td>
                                    </tr>
                                    <tr>
                                        <td id="tdFeb1" runat="server">&nbsp;</td>                                    
                                        <td id="tdFeb2" runat="server">&nbsp;</td>                                    
                                        <td id="tdFeb3" runat="server">&nbsp;</td>                                    
                                        <td id="tdFeb4" runat="server">&nbsp;</td>
                                    </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                         </telerik:GridTemplateColumn>                         
                            
                            <telerik:GridTemplateColumn DataField="MAR" 
                             FilterControlAltText="Filter clnSO column" HeaderText="MAR" 
                             HeaderTooltip="Request Date on Sales Order" UniqueName="clnMar">
                                <ItemTemplate>

                                <asp:Label ID="lblMar" runat="server" Text='<%#Eval("MAR") %>' Visible="false"></asp:Label>
                                    <table border="0" cellpadding="0" cellspacing="0" width="40px" style="font-size:9px;">                                    
                                                <tr>
                                        <td>W9</td>                                    
                                        <td>W10</td>                                    
                                        <td>W11</td>                                    
                                        <td>W12</td>
                                    </tr>
                                    <tr>
                                       <td id="tdMar1" runat="server">&nbsp;</td>                                    
                                        <td id="tdMar2" runat="server">&nbsp;</td>                                    
                                        <td id="tdMar3" runat="server">&nbsp;</td>                                    
                                        <td id="tdMar4" runat="server">&nbsp;</td>
                                    </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                         </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn DataField="APR" 
                             FilterControlAltText="Filter clnSO column" HeaderText="APR" 
                             HeaderTooltip="Request Date on Sales Order" UniqueName="clnApr">
                                <ItemTemplate>

                                <asp:Label ID="lblApr" runat="server" Text='<%#Eval("APR") %>' Visible="false"></asp:Label>
                                    <table border="0" cellpadding="0" cellspacing="0" width="40px" style="font-size:9px;">                                    
                                                <tr>
                                        <td>W13</td>                                    
                                        <td>W14</td>                                    
                                        <td>W15</td>                                    
                                        <td>W16</td>
                                    </tr>
                                    <tr>
                                      <td id="tdApr1" runat="server">&nbsp;</td>                                    
                                        <td id="tdApr2" runat="server">&nbsp;</td>                                    
                                        <td id="tdApr3" runat="server">&nbsp;</td>                                    
                                        <td id="tdApr4" runat="server">&nbsp;</td>
                                    </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                         </telerik:GridTemplateColumn>

                         <telerik:GridTemplateColumn DataField="MAY" 
                             FilterControlAltText="Filter clnSO column" HeaderText="MAY" 
                             HeaderTooltip="Request Date on Sales Order" UniqueName="clnMay">
                                <ItemTemplate>

                                <asp:Label ID="lblMay" runat="server" Text='<%#Eval("MAY") %>' Visible="false"></asp:Label>
                                    <table border="0" cellpadding="0" cellspacing="0" width="40px" style="font-size:9px;">                                    
                                     <tr>
                                        <td>W17</td>                                    
                                        <td>W18</td>                                    
                                        <td>W19</td>                                    
                                        <td>W20</td>
                                    </tr>
                                    <tr>
                                        <td id="tdMay1" runat="server">&nbsp;</td>                                    
                                        <td id="tdMay2" runat="server">&nbsp;</td>                                    
                                        <td id="tdMay3" runat="server">&nbsp;</td>                                    
                                        <td id="tdMay4" runat="server">&nbsp;</td>
                                    </tr>
                                    
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                         </telerik:GridTemplateColumn>

                         <telerik:GridTemplateColumn DataField="JUN" 
                             FilterControlAltText="Filter clnSO column" HeaderText="JUN" 
                             HeaderTooltip="Request Date on Sales Order" UniqueName="clnJun">
                                <ItemTemplate>

                                <asp:Label ID="lblJun" runat="server" Text='<%#Eval("JUN") %>' Visible="false"></asp:Label>
                                    <table border="0" cellpadding="0" cellspacing="0" width="40px" style="font-size:9px;">                                    
                                                <tr>
                                        <td>W21</td>                                    
                                        <td>W22</td>                                    
                                        <td>W23</td>                                    
                                        <td>W24</td>
                                    </tr>
                                    <tr>
                                        <td id="tdJun1" runat="server">&nbsp;</td>                                    
                                        <td id="tdJun2" runat="server">&nbsp;</td>                                    
                                        <td id="tdJun3" runat="server">&nbsp;</td>                                    
                                        <td id="tdJun4" runat="server">&nbsp;</td>
                                    </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                         </telerik:GridTemplateColumn>

                         <telerik:GridTemplateColumn DataField="JUL" 
                             FilterControlAltText="Filter clnSO column" HeaderText="JUL" 
                             HeaderTooltip="Request Date on Sales Order" UniqueName="clnJul">
                                <ItemTemplate>

                                <asp:Label ID="lblJul" runat="server" Text='<%#Eval("JUL") %>' Visible="false"></asp:Label>
                                    <table border="0" cellpadding="0" cellspacing="0" width="40px" style="font-size:9px;">                                    
                                                <tr>
                                        <td>W25</td>                                    
                                        <td>W26</td>                                    
                                        <td>W27</td>                                    
                                        <td>W28</td>
                                    </tr>
                                    <tr>
                                       <td id="tdJul1" runat="server">&nbsp;</td>                                    
                                        <td id="tdJul2" runat="server">&nbsp;</td>                                    
                                        <td id="tdJul3" runat="server">&nbsp;</td>                                    
                                        <td id="tdJul4" runat="server">&nbsp;</td>
                                    </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                         </telerik:GridTemplateColumn>

                         <telerik:GridTemplateColumn DataField="AUG" 
                             FilterControlAltText="Filter clnSO column" HeaderText="AUG" 
                             HeaderTooltip="Request Date on Sales Order" UniqueName="clnAug">
                                <ItemTemplate>

                                <asp:Label ID="lblAug" runat="server" Text='<%#Eval("AUG") %>' Visible="false"></asp:Label>
                                    <table border="0" cellpadding="0" cellspacing="0" width="40px" style="font-size:9px;">                                    
                                                <tr>
                                        <td>W29</td>                                    
                                        <td>W30</td>                                    
                                        <td>W31</td>                                    
                                        <td>W32</td>
                                    </tr>
                                    <tr>
                                      <td id="tdAug1" runat="server">&nbsp;</td>                                    
                                        <td id="tdAug2" runat="server">&nbsp;</td>                                    
                                        <td id="tdAug3" runat="server">&nbsp;</td>                                    
                                        <td id="tdAug4" runat="server">&nbsp;</td>
                                    </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                         </telerik:GridTemplateColumn>

                         <telerik:GridTemplateColumn DataField="SEP" 
                             FilterControlAltText="Filter clnSO column" HeaderText="SEP" 
                             HeaderTooltip="Request Date on Sales Order" UniqueName="clnSep">
                                <ItemTemplate>
                                    
                                    <asp:Label ID="lblSep" runat="server" Text='<%#Eval("SEP") %>' Visible="false"></asp:Label>
                                    <table border="0" cellpadding="0" cellspacing="0" width="40px" style="font-size:9px;" >                                    
                                                <tr>
                                        <td>W33</td>                                    
                                        <td>W34</td>                                    
                                        <td>W35</td>                                    
                                        <td>W36</td>
                                    </tr>
                                    <tr>
                                        <td id="tdSep1" runat="server">&nbsp;</td>                                    
                                        <td id="tdSep2" runat="server">&nbsp;</td>                                    
                                        <td id="tdSep3" runat="server">&nbsp;</td>                                    
                                        <td id="tdSep4" runat="server">&nbsp;</td>
                                    </tr>
                                    </table>

                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                         </telerik:GridTemplateColumn>

                         <telerik:GridTemplateColumn DataField="OCT" 
                             FilterControlAltText="Filter clnSO column" HeaderText="OCT" 
                             HeaderTooltip="Request Date on Sales Order" UniqueName="clnOct">
                                <ItemTemplate>

                                <asp:Label ID="lblOct" runat="server" Text='<%#Eval("OCT") %>' Visible="false"></asp:Label>
                                    <table border="0" cellpadding="0" cellspacing="0" width="40px" style="font-size:9px;">                                    
                                                <tr>
                                        <td>W37</td>                                    
                                        <td>W38</td>                                    
                                        <td>W39</td>                                    
                                        <td>W40</td>
                                    </tr>
                                    <tr>
                                       <td id="tdOct1" runat="server">&nbsp;</td>                                    
                                        <td id="tdOct2" runat="server">&nbsp;</td>                                    
                                        <td id="tdOct3" runat="server">&nbsp;</td>                                    
                                        <td id="tdOct4" runat="server">&nbsp;</td>
                                    </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                         </telerik:GridTemplateColumn>

                         <telerik:GridTemplateColumn DataField="NOV" 
                             FilterControlAltText="Filter clnSO column" HeaderText="NOV" 
                             HeaderTooltip="Request Date on Sales Order" UniqueName="clnNov">
                                <ItemTemplate>

                                <asp:Label ID="lblNov" runat="server" Text='<%#Eval("NOV") %>' Visible="false"></asp:Label>
                                    <table border="0" cellpadding="0" cellspacing="0" width="40px" style="font-size:9px;">                                    
                                                <tr>
                                        <td>W41</td>                                    
                                        <td>W42</td>                                    
                                        <td>W43</td>                                    
                                        <td>W44</td>
                                    </tr>
                                    <tr>
                                       <td id="tdNov1" runat="server">&nbsp;</td>                                    
                                        <td id="tdNov2" runat="server">&nbsp;</td>                                    
                                        <td id="tdNov3" runat="server">&nbsp;</td>                                    
                                        <td id="tdNov4" runat="server">&nbsp;</td>
                                    </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                         </telerik:GridTemplateColumn>

                         <telerik:GridTemplateColumn DataField="DEC" 
                             FilterControlAltText="Filter clnSO column" HeaderText="DEC" 
                             HeaderTooltip="Request Date on Sales Order" UniqueName="clnDec">
                                <ItemTemplate>

                                <asp:Label ID="lblDec" runat="server" Text='<%#Eval("DEC") %>' Visible="false"></asp:Label>
                                    <table border="0" cellpadding="0" cellspacing="0" width="40px" style="font-size:9px;">                                    
                                                <tr>
                                        <td>W45</td>                                    
                                        <td>W46</td>                                    
                                        <td>W47</td>                                    
                                        <td>W48</td>
                                    </tr>
                                    <tr>
                                      <td id="tdDec1" runat="server">&nbsp;</td>                                    
                                        <td id="tdDec2" runat="server">&nbsp;</td>                                    
                                        <td id="tdDec3" runat="server">&nbsp;</td>                                    
                                        <td id="tdDec4" runat="server">&nbsp;</td>
                                    </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                         </telerik:GridTemplateColumn>

                     </Columns>
                     <EditFormSettings>
                         <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                         </EditColumn>
                     </EditFormSettings>
                 </MasterTableView>
                 <FilterMenu EnableImageSprites="False">
                 </FilterMenu>
             </telerik:RadGrid>
                   <br />
          </asp:Panel>
     </div>
             <telerik:RadNotification ID="NotifyWarn" runat="server" 
        Skin="Sunset"
        Width="200px" Height="80px" Animation="Fade" EnableRoundedCorners="true" 
        TitleIcon="img/Del.png" LoadContentOn="EveryShow" AutoCloseDelay="5000" 
        ContentIcon="" EnableShadow="True" OffsetX="-30" OffsetY="20" 
        BackColor="#FF3300" Position="Center" >
    </telerik:RadNotification>
     </td>
     </tr>
     </table>
     </div>
     <!-- End New -->
     </td>
    </tr>
    <tr align="center">
    <td  style="width:475px;font-family: Tahoma; font-size: small; font-weight: bold;" valign="top" >
        &nbsp;</td>
         <td style="width:475px;" valign="top">

        </td>
    </tr>
    </table>
    </div> 
    </form>
</body>
</html>
