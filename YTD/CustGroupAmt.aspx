<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustGroupAmt.aspx.cs" Inherits="YTD.CustGroupAmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>++ Sales Report By Customer Group ++</title>
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
                             <telerik:AjaxUpdatedControl ControlID="PanelSum" 
                                 LoadingPanelID="RadAjaxLoadingPanel1" />
                             <telerik:AjaxUpdatedControl ControlID="NotifyWarn" />
                         </UpdatedControls>
                     </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadGrid1">
                         <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="RadGrid1" 
                                 LoadingPanelID="RadAjaxLoadingPanel1" />
                             <telerik:AjaxUpdatedControl ControlID="NotifyWarn" />
                         </UpdatedControls>
                     </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="RadGridSum">
                         <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="RadGridSum" 
                                 LoadingPanelID="RadAjaxLoadingPanel1" />
                             <telerik:AjaxUpdatedControl ControlID="NotifyWarn" />
                         </UpdatedControls>
                     </telerik:AjaxSetting>
                 </AjaxSettings>
             </telerik:RadAjaxManager>
             <div align="center">
   <table border="0" cellpadding="0" cellspacing="0" width="1350px" style="background-color:#008299;font-size:10px;" id="myTable">
    <tr>
    <td align="center" style="width:auto;height:50px;" colspan="2">
   
    <asp:Label ID="Label1" runat="server" Text="Sales Report By Customer Group" Font-Bold="True" Font-Names="Tahoma" Font-Size="25px" ForeColor="#FFFFFF"></asp:Label>
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
     <td >
           <asp:Label ID="Label3" runat="server" Font-Size="12px" Text="For Period :"></asp:Label>&nbsp;<telerik:RadDatePicker
               ID="dtpFrom" runat="server" Skin="Metro" Width="200px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" 
                 ViewSelectorText="x" Skin="Metro"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" DisplayText="" LabelWidth="40%" type="text" value=""></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
           </telerik:RadDatePicker> 
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
               ErrorMessage="**" ControlToValidate="dtpFrom" Display="Dynamic" Font-Size="8px"></asp:RequiredFieldValidator>&nbsp;  <asp:Label ID="Label2" runat="server" Font-Size="12px" Text="To"></asp:Label> &nbsp; 
           <telerik:RadDatePicker ID="dtpTo" runat="server" Skin="Metro" Width="200px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" 
                   ViewSelectorText="x" Skin="Metro"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" DisplayText="" LabelWidth="40%" type="text" value=""></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
         </telerik:RadDatePicker><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
               ErrorMessage="**" ControlToValidate="dtpTo" Display="Dynamic" 
               Font-Size="8px"></asp:RequiredFieldValidator>&nbsp;&nbsp;  
                      <telerik:RadButton ID="btnSubmit" runat="server" 
                 BackColor="White" BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                 ButtonType="LinkButton" Font-Size="11px" 
                 Skin="Office2010Silver" Text="Submit" Visible="true" Width="120px" 
                 onclick="btnSubmit_Click">
             </telerik:RadButton>&nbsp;<telerik:RadButton ID="btnExport" runat="server" 
                 BackColor="White" BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                 ButtonType="LinkButton" Font-Size="11px" 
                 Skin="Office2010Silver" Text="Export" Visible="true" Width="120px" 
             onclick="btnExport_Click"  >          </telerik:RadButton> &nbsp;<telerik:RadButton 
               ID="btnExportSum" runat="server" 
                 BackColor="White" BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                 ButtonType="LinkButton" Font-Size="11px" 
                 Skin="Office2010Silver" Text="Export Summary" Visible="true" Width="120px" 
             onclick="btnExportSum_Click"  >          </telerik:RadButton>
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
                 CellSpacing="0" GridLines="None" Skin="Metro" 
                 onneeddatasource="RadGrid1_NeedDataSource">
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

                           <telerik:GridBoundColumn DataField="CustGroupCode" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Group Code" Display="true"
                             UniqueName="clnCustGroupCode" AutoPostBackOnFilter="True" 
                               CurrentFilterFunction="Contains">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="CustGroupDesc" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Description" Display="true"
                             UniqueName="clnCustGroupDesc" FilterControlWidth="150px" AutoPostBackOnFilter="True" 
                               CurrentFilterFunction="Contains">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="200px" Font-Size="10px" />
                         </telerik:GridBoundColumn>

                          <telerik:GridBoundColumn DataField="CustCode" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Customer Code" Display="true" AutoPostBackOnFilter="True" 
                               CurrentFilterFunction="Contains"
                             UniqueName="clnCustCode">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>

                          <telerik:GridBoundColumn DataField="CustName" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Customer Name" Display="true" AutoPostBackOnFilter="True" 
                               CurrentFilterFunction="Contains"
                             UniqueName="clnCustName" FilterControlWidth="150px">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="200px" Font-Size="10px" />
                         </telerik:GridBoundColumn>

                          <telerik:GridBoundColumn DataField="Amount" AutoPostBackOnFilter="True" 
                               CurrentFilterFunction="Contains"
                             FilterControlAltText="Filter clnSO column" HeaderText="Sales" 
                               DataType="System.Double" DataFormatString="{0:#,#0.00}"
                             UniqueName="clnAmt">
                             <HeaderStyle HorizontalAlign="Right" />
                             <ItemStyle HorizontalAlign="Right" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>

                               <telerik:GridBoundColumn DataField="CostAmount" AutoPostBackOnFilter="True" 
                               CurrentFilterFunction="Contains"
                             FilterControlAltText="Filter clnSO column" HeaderText="Costs" 
                               DataType="System.Double" DataFormatString="{0:#,#0.00}"
                             UniqueName="clnCostAmt">
                             <HeaderStyle HorizontalAlign="Right" />
                             <ItemStyle HorizontalAlign="Right" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="Margin" DataFormatString="{0:#,0.00}"
                             FilterControlAltText="Filter clnSO column" HeaderText="% Profit Margin"
                             UniqueName="clnMargin" 
                             AllowFiltering="False">
                             <HeaderStyle HorizontalAlign="right" />
                             <ItemStyle HorizontalAlign="right" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="Cond" 
                             FilterControlAltText="Filter clnSO column" HeaderText="Cond" Display="False"
                             UniqueName="clnCond">
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
             
     </td>
     </tr>

     <tr>
    <td align="center" style="width:auto;height:50px;" colspan="2">
   
    <asp:Label ID="Label4" runat="server" Text="Summary" Font-Bold="True" Font-Names="Tahoma" Font-Size="25px" ForeColor="#FFFFFF"></asp:Label>
        </td>
    </tr>

     <!-- Sum -->
     <tr>
         <td style="background-color:#FFFFFF;">
 <div style="padding:5px 5px 5px 5px;">
            <asp:Panel ID="PanelSum" runat="server">
         
                <telerik:RadGrid ID="RadGridSum" runat="server" AutoGenerateColumns="False" 
                    CellSpacing="0" GridLines="None"    Skin="Hay" 
                    onitemdatabound="RadGridSum_ItemDataBound" 
                    onneeddatasource="RadGridSum_NeedDataSource">
                    <ClientSettings EnableRowHoverStyle="True">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <MasterTableView AllowFilteringByColumn="True" AllowMultiColumnSorting="True" 
                        AllowSorting="True" ShowFooter="True">
                        <CommandItemSettings ExportToPdfText="Export to PDF" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                            Visible="True">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Visible="True">
                        </ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridBoundColumn DataField="CustGroupCode" Display="true" AutoPostBackOnFilter="True" 
                               CurrentFilterFunction="Contains"
                                FilterControlAltText="Filter clnSO column" HeaderText="Group Code" 
                                UniqueName="clnCustGroupCode">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Font-Size="11px" HorizontalAlign="Left" Width="100px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CustGroupDesc" 
                                FilterControlAltText="Filter clnSO column" FilterControlWidth="150px" AutoPostBackOnFilter="True" 
                               CurrentFilterFunction="Contains"
                                HeaderText="Description" UniqueName="clnCustGroupDesc" FooterText="Total ">
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Font-Size="11px" HorizontalAlign="Left" Width="200px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Amount" DataFormatString="{0:#,#0.00}" 
                                DataType="System.Decimal" 
                                FilterControlAltText="Filter clnSO column" HeaderText="Sales" 
                                UniqueName="clnAmt" Aggregate="Sum" AllowFiltering="False">
                                <HeaderStyle HorizontalAlign="Right" /><FooterStyle HorizontalAlign="right" />
                                <ItemStyle Font-Size="11px" HorizontalAlign="Right" Width="100px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CostAmount" DataFormatString="{0:#,#0.00}" 
                                DataType="System.Decimal" FilterControlAltText="Filter clnSO column" 
                                HeaderText="Costs" UniqueName="clnCostAmt" Aggregate="Sum" 
                                AllowFiltering="False">
                                <HeaderStyle HorizontalAlign="Right" /><FooterStyle HorizontalAlign="right" />
                                <ItemStyle Font-Size="11px" HorizontalAlign="Right" Width="100px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn AllowFiltering="False" DataField="Margin" 
                                DataFormatString="{0:#,0.00}" FilterControlAltText="Filter clnSO column" 
                                HeaderText="% Profit Margin" UniqueName="clnMargin">
                                <HeaderStyle HorizontalAlign="right" />
                                <FooterStyle HorizontalAlign="right" />
                                <ItemStyle Font-Size="11px" HorizontalAlign="right" Width="100px" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Cond" Display="False" 
                                FilterControlAltText="Filter clnSO column" HeaderText="Cond" 
                                UniqueName="clnCond">
                                <ItemStyle Font-Size="11px" HorizontalAlign="Left" Width="100px" />
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
          </asp:Panel>
   </div>
         </td>
     </tr>
     <!-- End Sum -->

     </table>
     </div>
     <!-- End New -->
     </td>
    </tr>

    <telerik:RadNotification ID="NotifyWarn" runat="server" 
        Skin="Sunset"
        Width="200px" Height="80px" Animation="Fade" EnableRoundedCorners="true" 
        TitleIcon="img/Del.png" LoadContentOn="EveryShow" AutoCloseDelay="5000" 
        ContentIcon="" EnableShadow="True" OffsetX="-30" OffsetY="20" 
        BackColor="#FF3300" Position="Center" >
    </telerik:RadNotification>

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
