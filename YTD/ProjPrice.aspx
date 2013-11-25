<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjPrice.aspx.cs" Inherits="YTD.ProjPrice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>[ Project Price on Web ]</title>
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

    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                       <telerik:AjaxUpdatedControl ControlID="rgCost" />
                       <telerik:AjaxUpdatedControl ControlID="rgCom" />
                   </UpdatedControls>
               </telerik:AjaxSetting>
           </AjaxSettings>
       </telerik:RadAjaxManager>
	<table border="0" cellpadding="0" cellspacing="0" width="1500px">
    <tr>
    <td align="left"> 
         <asp:Label ID="Label1" runat="server" Text="[ Project Price ]" 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#003399"></asp:Label>
      
        <br />&nbsp;
        </td>
        
    </tr>
    <tr>
    <td align="left">  
    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" Height="100%" Width="100%" 
            HorizontalAlign="NotSet">  
    <asp:Label ID="Label2" runat="server" Text="Condition : " 
            Font-Bold="True" Font-Names="Tahoma" Font-Size="Small" ForeColor="#000008"></asp:Label>
        <telerik:RadComboBox ID="cbCondition" Runat="server" Skin="Office2010Black" 
            Width="400px" AutoPostBack="True" 
            onselectedindexchanged="cbCondition_SelectedIndexChanged" 
            Filter="Contains">
        </telerik:RadComboBox>
       
        &nbsp;
        <telerik:RadTextBox ID="txtCondition" Runat="server" Skin="Forest" 
            Width="250px">
        </telerik:RadTextBox>
        &nbsp;<telerik:RadButton ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
            Skin="Sitefinity" Text="Submit" Width="150px">
        </telerik:RadButton>
        </telerik:RadAjaxPanel><br />
        </td>&nbsp;
    </tr>
    <tr>
    <td align="left">   
                <asp:Panel ID="Panel1" runat="server">
     
            <telerik:RadGrid ID="rgCost" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None" Skin="Office2007" 
                    AllowSorting="True" 
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
                        <telerik:GridBoundColumn DataField="PROJECT" 
                            FilterControlAltText="Filter clnSite column" HeaderText="SITE" 
                            UniqueName="clnSite">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITEM" 
            FilterControlAltText="Filter clnItem column" 
            HeaderText="Item"
            UniqueName="clnItem">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITEMDESC" 
            FilterControlAltText="Filter clnDesc column" HeaderText="Item Desc" 
            UniqueName="clnDesc">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CATE" 
            FilterControlAltText="Filter clnCate column" HeaderText="Category"
            UniqueName="clnCate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CATEDESC" 
            FilterControlAltText="Filter clnCateDesc column" 
            HeaderText="Categoty Desc"
            UniqueName="clnCateDesc">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="QTY" 
            FilterControlAltText="Filter clnQty column" HeaderText="Quantity" DataFormatString="{0:#0.00}"
            UniqueName="clnQty" DataType="System.Decimal" FooterText="Total :">
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign ="Right" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UNITPRICE" 
                            FilterControlAltText="Filter clnUnitPrice column" HeaderText="Unit Price" DataFormatString="{0:#,#00.000}"
                            UniqueName="clnUnitPrice" DataType="System.Decimal">
                              <FooterStyle Font-Bold="True" ForeColor="#C04000" HorizontalAlign="Right" />
                                  <ItemStyle HorizontalAlign ="Right" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TOTALPRICE" 
                            FilterControlAltText="Filter clnTotalPrice column" 
                            HeaderText="Total Price" DataFormatString="{0:#,#00.000}"
                            UniqueName="clnTotalPrice" Aggregate="Sum" DataType="System.Decimal">
                            <FooterStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Right" 
                                Font-Size="Medium" />
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
            <br />
   </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">

            <telerik:RadGrid ID="rgCom" runat="server" AutoGenerateColumns="False" 
            CellSpacing="0" GridLines="None" Skin="Hay" 
                    AllowSorting="True" onneeddatasource="rgCom_NeedDataSource" >
                <ClientSettings EnableRowHoverStyle="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView>
                    <CommandItemSettings ExportToPdfText="Export to PDF">
                    </CommandItemSettings>
                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                    </ExpandCollapseColumn>
                    <Columns>
                     
                        <telerik:GridBoundColumn DataField="ORDNUMBER" 
            FilterControlAltText="Filter clnSO column" HeaderText="SO#"
            UniqueName="clnSO">
                            <HeaderStyle Font-Size="Medium" />
                            <ItemStyle Font-Bold="True" Font-Size="Medium" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PROJDESC" 
            FilterControlAltText="Filter clnSO column" HeaderText="Description"
            UniqueName="clnProjDesc">
                            <HeaderStyle Font-Size="Medium" />
                            <ItemStyle Font-Bold="True" Font-Size="Medium" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="AMT_OE" 
                            FilterControlAltText="Filter clnUnitPrice column" 
                            HeaderText="Total Price on OE" DataFormatString="{0:#,#00.000}"
                            UniqueName="clnAMT_OE" DataType="System.Decimal">
                              <FooterStyle Font-Bold="True" ForeColor="#C04000" HorizontalAlign="Right" />
                               <HeaderStyle Font-Size="Medium" />
                               <ItemStyle Font-Bold="True" Font-Size="Medium" HorizontalAlign="Right" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="AMT_PJC" 
                            FilterControlAltText="Filter clnTotalPrice column" 
                            HeaderText="Total Price on PJC" DataFormatString="{0:#,#00.000}"
                            UniqueName="clnAMT_PJC"  DataType="System.Decimal">
                            <FooterStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Right" />
                             <HeaderStyle Font-Size="Medium" />
                             <ItemStyle Font-Bold="True" Font-Size="Medium" HorizontalAlign="Right" 
                                ForeColor="Blue" />
                        </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DIFF" 
                            FilterControlAltText="Filter clnTotalPrice column" 
                            HeaderText="Diff" DataFormatString="{0:#,#00.000}"
                            UniqueName="clnDiff"  DataType="System.Decimal">
                            <FooterStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Right" />
                             <HeaderStyle Font-Size="Medium" />
                            <ItemStyle Font-Bold="True" Font-Size="Medium" HorizontalAlign="Right" 
                                    ForeColor="#C04000" />
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
            
                    </asp:Panel>

        </td>
    </tr>
    <tr>
    <td>
        
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
