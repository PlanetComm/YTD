<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OECost.aspx.cs" Inherits="YTD.OECost" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnSubmit">
       <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
	<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
        Skin="Telerik">
    </telerik:RadAjaxLoadingPanel>
	   <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" 
           DefaultLoadingPanelID="RadAjaxLoadingPanel1">
           <AjaxSettings>
               <telerik:AjaxSetting AjaxControlID="btnSubmit">
                   <UpdatedControls>
                       <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel1" 
                           LoadingPanelID="RadAjaxLoadingPanel1" />
                   </UpdatedControls>
               </telerik:AjaxSetting>
           </AjaxSettings>
       </telerik:RadAjaxManager>
	<table border="0" cellpadding="0" cellspacing="0" width="1500px">
    <tr>
    <td align="left"> 
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
    <td style="width:250px;">    <asp:Label ID="Label1" runat="server" Text="[ Order Entry Cost ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#003399"></asp:Label></td>
    <td>    <telerik:RadButton ID="btnExportExcel" runat="server" 
            onclick="btnExportExcel_Click" Skin="Office2010Silver" Text="Export to Excel" 
            Width="250px">
        </telerik:RadButton></td>
    </tr>
    </table>
     
      
  
         <br />
        </td>
        
    </tr>
    <tr>
    <td align="left">  
    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" Height="100%" Width="100%" 
            HorizontalAlign="NotSet">  
    <asp:Label ID="Label2" runat="server" Text="Condition : " 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="Small" ForeColor="#000008"></asp:Label>
       
        &nbsp;<telerik:RadTextBox ID="txtCondition" Runat="server" Skin="Forest" 
            Width="250px">
        </telerik:RadTextBox>
        &nbsp;<telerik:RadButton ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
            Skin="Sitefinity" Text="Submit" Width="150px">
        </telerik:RadButton>&nbsp;&nbsp;
        </telerik:RadAjaxPanel><br />
        </td>&nbsp;
    </tr>
    <tr>
    <td align="left">   
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" height="100%" 
            width="100%" HorizontalAlign="NotSet" 
            LoadingPanelID="RadAjaxLoadingPanel1">
            <telerik:RadGrid ID="rgCost" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None" Skin="Telerik" 
                    AllowSorting="True" onitemdatabound="rgCost_ItemDataBound" 
                onneeddatasource="rgCost_NeedDataSource" >
                <ClientSettings EnableRowHoverStyle="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView ShowFooter="True">
                    <CommandItemSettings ExportToPdfText="Export to PDF">
                    </CommandItemSettings>
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="ItemNo" 
            FilterControlAltText="Filter clnItemNo column" HeaderText="No." 
            UniqueName="clnItemNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SO" 
            FilterControlAltText="Filter clnSO column" HeaderText="SO#"
            UniqueName="clnSO">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITEM" 
                            FilterControlAltText="Filter clnItem column" HeaderText="Item" 
                            UniqueName="clnItem">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITEMDESC" 
            FilterControlAltText="Filter clnDesc column" 
            HeaderText="Item Desc"
            UniqueName="clnDesc">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CATE" 
            FilterControlAltText="Filter clnCate column" HeaderText="Category" 
            UniqueName="clnCate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CATEDESC" 
            FilterControlAltText="Filter clnCateDesc column" HeaderText="Categoty Desc"
            UniqueName="clnCateDesc">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="QTY" 
            FilterControlAltText="Filter clnQty column" 
            HeaderText="Quantity"
            UniqueName="clnQty"  DataFormatString="{0:#,##0.000}" DataType="System.Decimal" 
                            FooterText="Total :">
                            <FooterStyle HorizontalAlign="Right" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Right" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UNITCOST" 
            FilterControlAltText="Filter clnUnitCost column" HeaderText="Unit Cost" DataFormatString="{0:#,#00.000}"
            UniqueName="clnUnitCost" DataType="System.Decimal">
                            <FooterStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#C04000" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign ="Right" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TOTALCOST" 
                            FilterControlAltText="Filter clnTotalCost column" HeaderText="Total Cost" DataFormatString="{0:#,#00.000}"
                            UniqueName="clnTotalCost" DataType="System.Decimal" Aggregate="Sum">
                              <FooterStyle Font-Bold="True" ForeColor="#C04000" HorizontalAlign="Right" />
                                  <HeaderStyle HorizontalAlign="Center" />
                                  <ItemStyle HorizontalAlign ="Right" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UNITPRICE" 
                            FilterControlAltText="Filter clnUnitPrice column" HeaderText="Unit Price" DataFormatString="{0:#,#00.000}"
                            UniqueName="clnUnitPrice" DataType="System.Decimal">
                            <FooterStyle Font-Bold="True" ForeColor="#C04000" HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign ="Right" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TOTALPRICE" 
                            FilterControlAltText="Filter clnTotalPrice column" 
                            HeaderText="Total Price" DataFormatString="{0:#,#00.000}"
                            UniqueName="clnTotalPrice" DataType="System.Decimal" Aggregate="Sum">
                              <FooterStyle Font-Bold="True" ForeColor="#C04000" HorizontalAlign="Right" />
                                  <HeaderStyle HorizontalAlign="Center" />
                                  <ItemStyle HorizontalAlign ="Right" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MARGIN" 
                            FilterControlAltText="Filter clnTotalPrice column" 
                            HeaderText="Margin %" DataFormatString="{0:#00.000}%"
                            UniqueName="clnMargin" DataType="System.Decimal">
                              <FooterStyle Font-Bold="True" ForeColor="#C04000" HorizontalAlign="Right" />
                                  <HeaderStyle HorizontalAlign="Center" />
                                  <ItemStyle HorizontalAlign ="Right" />
                        </telerik:GridBoundColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
                <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                </HeaderContextMenu>
            </telerik:RadGrid>
        </telerik:RadAjaxPanel>
        </td>
    </tr>
    <tr>
    <td>
        <asp:Panel ID="Panel1" runat="server" Width="100%" Visible="False">

       <table border="0" cellpadding="1" cellspacing="1" width="100%" style="font-family:Tahoma;">
       <tr>
       <td style="font-size:smaller;" align="right"><asp:Label ID="Label3" runat="server" 
               Text="Total :" Width="100px" Font-Bold="True" Font-Size="Medium"></asp:Label>
           <asp:Label ID="lblUnitCost" runat="server" Text="UnitCost" Width="115px" 
               BackColor="#99FFCC" Font-Bold="True" ForeColor="#006600"></asp:Label>&nbsp;
           <asp:Label ID="lblTotalCost" runat="server" Text="TotalCost" 
               BackColor="#99FFCC" Font-Bold="True" ForeColor="#006600" Width="130px"></asp:Label>&nbsp;
           <asp:Label ID="lblUnitPrice" runat="server" Text="UnitPrice" 
               BackColor="#99FFCC" Font-Bold="True" ForeColor="#006600" Width="130px"></asp:Label>&nbsp;
           <asp:Label ID="lblTotalPrice" runat="server" Text="TotalPrice" 
               BackColor="#99FFCC" Font-Bold="True" ForeColor="#006600" Width="130px"></asp:Label>&nbsp;
               <asp:Label ID="lblMargin" runat="server" Text="Margin%" 
               BackColor="#99FFCC" Font-Bold="True" ForeColor="#006600" Width="130px"></asp:Label>
       </td>
       </tr>
       </table>
               </asp:Panel>
    </td>
    </tr>
    <tr>
    <td>
    <telerik:RadNotification ID="NotifyWarn" runat="server" 
        Skin="Sunset"
        Width="200px" Height="80px" Animation="Fade" EnableRoundedCorners="true" 
        TitleIcon="img/Del.png" LoadContentOn="EveryShow" AutoCloseDelay="5000" 
        ContentIcon="" EnableShadow="True" OffsetX="-30" OffsetY="20" 
        BackColor="#FF3300" Position="TopRight" >
    </telerik:RadNotification>
    </td>
    </tr>
    </table>
    </form>
</body>
</html>
