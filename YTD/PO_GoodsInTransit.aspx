<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PO_GoodsInTransit.aspx.cs" Inherits="YTD.PO_GoodsInTransit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>[ Goods In Transit Report ]</title>
    <style type="text/css">


.RadGrid .rgMasterTable
{
    border-collapse:separate;
}

.RadGrid .rgMasterTable
{
    border-collapse:separate;
}

.RadGrid .rgMasterTable
{
    border-collapse:separate;
}


.RadGrid .rgMasterTable
{
    border-collapse:separate;
}

.RadGrid .rgHeader
{
	padding-top:5px;
	padding-bottom:4px;
	text-align:left;
	font-weight:normal;
}

.RadGrid .rgHeader
{
	padding-left:7px;
	padding-right:7px;
}

.RadGrid .rgHeader
{
	cursor:default;
}

.RadGrid .rgHeader
{
	cursor:default;
}

    .RadGrid .rgHeader
{
	padding-left:7px;
	padding-right:7px;
}

.RadGrid .rgHeader
{
	padding-top:5px;
	padding-bottom:4px;
	text-align:left;
	font-weight:normal;
}

.RadGrid .rgHeader
{
	cursor:default;
}

.RadGrid .rgHeader
{
	padding-left:7px;
	padding-right:7px;
}

.RadGrid .rgHeader
{
	padding-top:5px; 
	padding-bottom:4px;
	text-align:left;
	font-weight:normal;
}

.RadGrid .rgHeader
{
	cursor:default;
}

.RadGrid .rgHeader
{
	padding-left:7px;
	padding-right:7px;
}

.RadGrid .rgHeader
{
	padding-top:5px;
	padding-bottom:4px;
	text-align:left;
	font-weight:normal;
}

.RadGrid .rgHeader a
{
    text-decoration:none;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
  <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
	<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
        Skin="Telerik">
    </telerik:RadAjaxLoadingPanel> 
    
    <table border="0" cellpadding="0" cellspacing="0" width="1500px">
    <tr>
    <td align="left" style="width:50%;"><asp:Label ID="Label1" runat="server" Text="[ Goods In Transit Report ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#00A000"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <telerik:RadButton ID="btnExportExcel" runat="server" 
            onclick="btnExportExcel_Click" Skin="Office2010Silver" Text="Export to Excel" 
            Width="200px">
        </telerik:RadButton>
    
        </td>
    </tr>
    <tr>
    <td align="left" style="width:50%;">&nbsp;<br /></td>
    </tr>
    <tr>
    <td align="left" style="width:50%;">
     <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="100%" Width="100%" 
            HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1">
         <telerik:RadGrid ID="rgPOGDS" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None" Skin="Sunset" 
                    AllowSorting="True" 
                onneeddatasource="rgPOGDS_NeedDataSource" style="margin-right: 0px" 
             onitemdatabound="rgPOGDS_ItemDataBound" >
             <ExportSettings FileName="PO_InTransit">
             </ExportSettings>
             <ClientSettings EnableRowHoverStyle="True">
                 <Selecting AllowRowSelect="True" />
             </ClientSettings>
             <MasterTableView ShowFooter="True">
                 <CommandItemSettings ExportToPdfText="Export to PDF" />
                 <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                 </RowIndicatorColumn>
                 <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                 </ExpandCollapseColumn>
                 <Columns>
                     <telerik:GridBoundColumn DataField="PORHSEQ" 
                         FilterControlAltText="Filter clnSEQ column" HeaderText="PORHSEQ" 
                         UniqueName="clnSEQ" Visible="False" Display="False">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="No" 
                         FilterControlAltText="Filter clnItemNo column" HeaderText="No." 
                         UniqueName="clnItemNo">
                         <ItemStyle Width="15px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn FilterControlAltText="Filter clnPO column" 
                         HeaderText="PO #" UniqueName="clnPO" DataField="PONUMBER">
                         <ItemStyle Width="75px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="DATE" 
                         FilterControlAltText="Filter clnDate column" HeaderText="PO DATE" 
                         UniqueName="clnDate">
                         <ItemStyle Width="75px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn FilterControlAltText="Filter clnVDCode column" 
                         HeaderText="Vendor Code" UniqueName="clnVDCode" DataField="VDCODE">
                         <ItemStyle Width="75px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="VDNAME" 
                         FilterControlAltText="Filter clnVDName column" HeaderText="Vendor Name" 
                         UniqueName="clnVDName">
                         <ItemStyle Width="200px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="HAMT" Display="False" 
                         FilterControlAltText="Filter clnHAMT column" HeaderText="HAMT" 
                         UniqueName="clnHAMT">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn FilterControlAltText="Filter clnItemCode column" 
                         HeaderText="Item Code" UniqueName="clnItemCode" DataField="ITEMNO">
                         <ItemStyle Width="150px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn FilterControlAltText="Filter clnItemDesc column" 
                         HeaderText="Description" UniqueName="clnItemDesc" DataField="ITEMDESC">
                         <ItemStyle Width="270px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="ORDERQTY" DataFormatString="{0:#,###}" 
                         DataType="System.Decimal" FilterControlAltText="Filter clnOrderQty column" 
                         HeaderText="Order<br>(Qty)" UniqueName="clnOrderQty">
                         <FooterStyle HorizontalAlign="Right" />
                         <HeaderStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Right" Width="50px" />
                     
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn FilterControlAltText="Filter clnQty column" 
                         HeaderText="In Transit<br>(Qty)" UniqueName="clnQty" DataField="INTRANSIT" 
                         DataFormatString="{0:#,###}" DataType="System.Decimal">
                         <FooterStyle HorizontalAlign="Right" />
                         <HeaderStyle HorizontalAlign="Center" />
                         <ItemStyle Width="50px" HorizontalAlign="Right" />
                     </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn FilterControlAltText="Filter clnUnitPrice column" 
                         HeaderText="Unit Cost <br>(on PO)" UniqueName="clnPOUnitCost" DataField="PO_UNITCOST" 
                         DataFormatString="{0:#,###.00}" DataType="System.Decimal">
                         <HeaderStyle HorizontalAlign="center" />
                         <ItemStyle Width="80px" HorizontalAlign="Right" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="POAMT" DataFormatString="{0:#,###.00}" 
                         FilterControlAltText="Filter clnAmount column" HeaderText="Amount<br>(In Transit)" 
                         UniqueName="clnAmount" DataType="System.Decimal">
                         <FooterStyle HorizontalAlign="Right" />
                         <HeaderStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Right" Width="90px" />
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn FilterControlAltText="Filter clnUnitPrice column" 
                         HeaderText="Unit Cost <br>(In Transit/Baht)" UniqueName="clnUnitCost" DataField="UNITCOST" 
                         DataFormatString="{0:#,###.00}" DataType="System.Decimal" 
                         FooterText="Total Amount :">
                         <FooterStyle HorizontalAlign="Right" />
                         <HeaderStyle HorizontalAlign="center" />
                         <ItemStyle Width="90px" HorizontalAlign="Right" />
                     </telerik:GridBoundColumn>
       
                     <telerik:GridBoundColumn DataField="LAMT" DataFormatString="{0:#,###.00}" 
                         FilterControlAltText="Filter clnAmount column" HeaderText="Amount<br>(In Transit/Baht)" 
                         UniqueName="clnAmount" DataType="System.Decimal" Aggregate="Sum">
                         <FooterStyle HorizontalAlign="Right" />
                         <HeaderStyle HorizontalAlign="center" />
                         <ItemStyle HorizontalAlign="Right" Width="90px" />
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
    </table>

    </form>

</body>
</html>
