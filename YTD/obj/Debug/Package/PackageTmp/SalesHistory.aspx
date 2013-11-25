<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesHistory.aspx.cs" Inherits="YTD.SalesHistory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>++ Sales History (Market and Product) ++</title>
  
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
                             <telerik:AjaxUpdatedControl ControlID="NotifyWarn" />
                             <telerik:AjaxUpdatedControl ControlID="Panel2" 
                                 LoadingPanelID="RadAjaxLoadingPanel1" />
                         </UpdatedControls>
                     </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadGrid1">
                         <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="RadGrid1" 
                                 LoadingPanelID="RadAjaxLoadingPanel1" />
                         </UpdatedControls>
                     </telerik:AjaxSetting>
                 </AjaxSettings>
             </telerik:RadAjaxManager>

             <div align="center">
   <table border="0" cellpadding="0" cellspacing="0" width="1350px" style="background-color:#2672EC;font-size:10px;" id="myTable">
    <tr>
    <td align="center" style="width:auto;height:50px;" colspan="2">
   
    <asp:Label ID="Label1" runat="server" Text="Sales History (Market and Product)" Font-Bold="True" Font-Names="Tahoma" Font-Size="25px" ForeColor="#FFFFFF"></asp:Label>
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
     <td class="style1">
           <asp:Label ID="Label3" runat="server" Font-Size="12px" Text="For Period :"></asp:Label>&nbsp;<telerik:RadDatePicker
               ID="dtpFrom" runat="server" Skin="Hay" Width="200px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" 
                 ViewSelectorText="x" Skin="Hay"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" DisplayText="" LabelWidth="40%" type="text" value=""></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
           </telerik:RadDatePicker> 
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
               ErrorMessage="**" ControlToValidate="dtpFrom" Display="Dynamic" Font-Size="8px"></asp:RequiredFieldValidator>&nbsp;  <asp:Label ID="Label2" runat="server" Font-Size="12px" Text="To"></asp:Label> &nbsp; 
           <telerik:RadDatePicker ID="dtpTo" runat="server" Skin="Hay" Width="200px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" 
                   ViewSelectorText="x" Skin="Hay"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" DisplayText="" LabelWidth="40%" type="text" value=""></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
         </telerik:RadDatePicker><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
               ErrorMessage="**" ControlToValidate="dtpTo" Display="Dynamic" 
               Font-Size="8px"></asp:RequiredFieldValidator>&nbsp;&nbsp;  
         <asp:RadioButton ID="rdMarket" runat="server" BackColor="#FFFFCC" 
               Font-Bold="True" Font-Size="13px" ForeColor="#3333CC" GroupName="S" 
               Text="Market" />&nbsp; 
               <asp:RadioButton ID="rdProduct" runat="server" BackColor="#FFFFCC" 
               Font-Bold="True" Font-Size="13px" ForeColor="#3333CC" GroupName="S" 
               Text="Product" />&nbsp;&nbsp;  
               <telerik:RadButton ID="btnSubmit" runat="server" 
                 BackColor="White" BorderColor="#2672EC" BorderStyle="Solid" BorderWidth="2px" 
                 ButtonType="LinkButton" Font-Size="11px" 
                 Skin="Office2010Silver" Text="Submit" Visible="true" Width="120px" 
                 onclick="btnSubmit_Click">
             </telerik:RadButton>&nbsp;<telerik:RadButton ID="btnExport" runat="server" 
                 BackColor="White" BorderColor="#2672EC" BorderStyle="Solid" BorderWidth="2px" 
                 ButtonType="LinkButton" Font-Size="11px" 
                 Skin="Office2010Silver" Text="Export" Visible="true" Width="120px" 
             onclick="btnExport_Click"  >          </telerik:RadButton> 
     </td>
     <td style="width:auto;">
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
                 <MasterTableView ShowFooter="True" AllowFilteringByColumn="True" 
                     AllowMultiColumnSorting="True" AllowSorting="True">
                     <CommandItemSettings ExportToPdfText="Export to PDF" />
                     <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                         Visible="True">
                     </RowIndicatorColumn>
                     <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                         Visible="True">
                     </ExpandCollapseColumn>
                     <Columns>

                           <telerik:GridBoundColumn DataField="ORDNUMBER" 
                             FilterControlAltText="Filter clnSO column" HeaderText="SO#" Display="true"
                             UniqueName="clnOE">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="TRANDATE" 
                             FilterControlAltText="Filter clnSO column" HeaderText="InvDate" Display="False"
                             UniqueName="clnInvDate">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="TRANDATE_" 
                             FilterControlAltText="Filter clnSO column" HeaderText="InvDate"
                             UniqueName="clnInvDate_" Aggregate="Count" FooterText="Count :" 
                             FooterAggregateFormatString="Count :{0:#,#}" AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="TRANNUM" 
                             FilterControlAltText="Filter clnSO column" HeaderText="InvNo." 
                             UniqueName="clnInvNo" AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="CUSTOMER" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Cus No." 
                             UniqueName="clnCusNo" AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="80px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="NAMECUST" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Customer Name" 
                             UniqueName="clnCusName" AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="SALPER" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Sale Person" 
                             UniqueName="clnSP" AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                  
                         <telerik:GridBoundColumn DataField="SG" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Group" 
                             UniqueName="clnSG" AutoPostBackOnFilter="True" 
                             CurrentFilterFunction="Contains">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="FMTITEMNO" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Item No." 
                             UniqueName="clnItemNo" AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="DESC" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Description"
                             UniqueName="clnDesc" AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CATEGORY" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Category"
                             UniqueName="clnCate" AutoPostBackOnFilter="True" 
                             CurrentFilterFunction="Contains">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="QTYSOLD" DataFormatString="{0:#,0.00}"
                             FilterControlAltText="Filter clnSO column" HeaderText="Qty" DataType="System.Int16"
                             UniqueName="clnQty" AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
    
                        <telerik:GridBoundColumn DataField="UnitPrice" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Unit Price"
                             UniqueName="clnUnitPrice" DataType="System.String"  DataFormatString="{0:#,0.00}" FooterText = "Total :"
                              AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>                        
    
                        <telerik:GridBoundColumn DataField="FAMTSALES" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Value Amount"
                             UniqueName="clnAmt" DataFormatString="{0:#,0.00}" Aggregate="Sum" 
                            AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="FCSTSALES" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Costs Amount"
                             UniqueName="clnCost" DataFormatString="{0:#,0.00}" Aggregate="Sum" 
                              AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="Margin" DataFormatString="{0:#,0.00}"
                             FilterControlAltText="Filter clnSO column" HeaderText="% Profit Margin"
                             UniqueName="clnMargin" 
                             AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>

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
