<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderManagement.aspx.cs" Inherits="YTD.OrderManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
       hr.Hone  
   {
       border: 0; height: 1px; 
       background: #333; 
       background-image: -webkit-linear-gradient(left, #ccc, #333, #ccc); 
       background-image: -moz-linear-gradient(left, #ccc, #333, #ccc); 
       background-image: -ms-linear-gradient(left, #ccc, #333, #ccc); 
       background-image: -o-linear-gradient(left, #ccc, #333, #ccc); 
       }
    .R{
		background-color:#D0FFA1;
		color:#000;
	}
	 .T{
		background-color:#D3FFFF;
		color:#000;
		
	}
    .P{
		background-color:#FFFFA0;
		color:#000;
		
	}
	.N{
		background-color:#FFFFFF;
		color:#000;
	}
	 .N:hover,
	 .P:hover,
	 .R:hover,
	 .T:hover
	 {
		background-color:#04B486;
		color:#FFF;		
	}
	
     .SelectedStyle 
     { 
        /*background-color: #FFC8FF !important;*/
        opacity: 1.9;
     }

    </style>
    
</head>
<body style="margin-top:0px;font-family:Tahoma;">

    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
                 Skin="Default">
             </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" 
         onajaxrequest="RadAjaxManager1_AjaxRequest">
                 <AjaxSettings>
                     <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                         <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="Panel2" 
                                 LoadingPanelID="RadAjaxLoadingPanel1" />
                             <telerik:AjaxUpdatedControl ControlID="RadWindowManager1" />
                         </UpdatedControls>
                     </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="btnSubmit">
                         <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="Panel2" 
                                 LoadingPanelID="RadAjaxLoadingPanel1" />
                             <telerik:AjaxUpdatedControl ControlID="NotifyWarn" />
                         </UpdatedControls>
                     </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="btnGen">
                         <UpdatedControls>
                             <telerik:AjaxUpdatedControl ControlID="Panel1" />
                             <telerik:AjaxUpdatedControl ControlID="Panel2" 
                                 LoadingPanelID="RadAjaxLoadingPanel1" />
                             <telerik:AjaxUpdatedControl ControlID="NotifyWarn" />
                         </UpdatedControls>
                     </telerik:AjaxSetting>
                     <telerik:AjaxSetting AjaxControlID="NotifyWarn">
                     </telerik:AjaxSetting>
                 </AjaxSettings>
             </telerik:RadAjaxManager>
    <div align="center">
   <table border="0" cellpadding="0" cellspacing="0" width="1300px" style="background-color:#008299;" id="myTable">
    <tr>
    <td align="center" style="width:auto;height:50px;" colspan="2">
   
    <asp:Label ID="Label1" runat="server" Text="Order Management for Project" Font-Bold="True" Font-Names="Tahoma" Font-Size="25px" ForeColor="#FFFFFF"></asp:Label> 
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
     <asp:Panel ID="Panel1" runat="server">
             <asp:Label ID="Label2" runat="server" Font-Size="12px" Text="PJC Contract :"></asp:Label>
             &nbsp;&nbsp;&nbsp;<telerik:RadComboBox ID="cbContract" Runat="server" 
                 DropDownWidth="600px" Filter="Contains" MaxHeight="700px" Skin="Hay" 
                 Width="450px">
             </telerik:RadComboBox>
             &nbsp;<telerik:RadButton ID="btnSubmit" runat="server" 
                 BackColor="White" BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                 ButtonType="LinkButton" Font-Size="11px" 
                 Skin="Office2010Silver" Text="Submit" Visible="true" Width="120px" 
                 onclick="btnSubmit_Click">
             </telerik:RadButton>
                         &nbsp;<telerik:RadButton ID="btnGen" runat="server" 
                 BackColor="White" BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                 ButtonType="LinkButton" Font-Size="11px" onclick="btnGen_Click" 
                 Skin="Office2010Silver" Text="Re-index" Visible="False" Width="120px">
             </telerik:RadButton>
             &nbsp;<asp:HyperLink ID="btnDetail" runat="server" Font-Size="11px" Text="More Detail .."
                 ForeColor="#0000CC" Visible="False" Font-Underline="True"></asp:HyperLink>      
             <br />
            
               <table border= "0" cellpadding="0" cellspacing="1" width="100%"><tr align="center">
               <td width="auto;" align=left> 
               <asp:Label ID="Label4" runat="server" Font-Size="12px" Text="End of Contract :"></asp:Label>
             <asp:Label ID="lblEndOfContr" runat="server" Font-Bold="True" Font-Size="12px" 
                 Text="-"></asp:Label></td>
                 <td style="width:420px;" valign="bottom" align="right">
                 <table border="1" cellpadding="0" cellspacing="1" width="100%" ><tr>
<td width="105px"  bgcolor="#8CFF8C" align="center"><font size="2">PO Receipt</font></td>
<td  width="105px" bgcolor="#FFFFA0" align="center"><font size="2">PO Issued</font></td>
<td  width="105px"  bgcolor="#95C9FF" align="center"><font size="2">Tranfer Stock</font></td>
<td  width="105px"  bgcolor="#FFFFFF" align="center"><font size="2">No action</font></td>
</tr></table>
</td>
</tr></table>
                         </asp:Panel>
                    </div>
         </td>
     </tr>
     
     <tr>
     <td style="background-color:#FFFFFF;" >
     <div style="padding:5px 5px 5px 5px;">
         <asp:Panel ID="Panel2" runat="server">
         <telerik:RadGrid ID="RadGrid2" runat="server" AutoGenerateColumns="False" SelectedItemStyle-CssClass="SelectedStyle"
             CellSpacing="0" GridLines="None" Skin="Windows7" 
                 onneeddatasource="RadGrid1_NeedDataSource" AllowFilteringByColumn="True" 
                 onitemdatabound="RadGrid1_ItemDataBound" ShowHeader="False">
                 <GroupingSettings CaseSensitive="False" />
                 <ClientSettings>
                     <Selecting AllowRowSelect="True" />
                 </ClientSettings>
<MasterTableView PageSize="20" DataKeyNames="ItemComment">
    
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
</RowIndicatorColumn>


    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
    </ExpandCollapseColumn>
    <Columns>
        <telerik:GridTemplateColumn AllowFiltering="False" 
            FilterControlAltText="Filter clnEdit column" ShowFilterIcon="False" 
            UniqueName="clnEdit">
            <ItemTemplate>
                <div style="display:list-item;height:150px;width:100px; overflow-y:scroll;">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="9px" Font-Underline="True">Edit</asp:HyperLink>
                <hr class="Hone" />
                <asp:Label ID="lblSite" runat="server" Font-Size="10px" ForeColor="#003366"></asp:Label>
                </div>
            </ItemTemplate>
            <HeaderStyle Width="30px" />
            <ItemStyle Font-Bold="True" ForeColor="Black" />
        </telerik:GridTemplateColumn>
        <telerik:GridTemplateColumn AllowFiltering="False" 
            FilterControlAltText="Filter clnTemp column" UniqueName="clnTemp">
            <ItemTemplate>
                <table border="1" cellpadding="1" cellspacing="0" style="font-family;Tahoma;font-size:11px;color:#000000;" width="1150px">
                    
                    <tr style="color:#000000;">
                        <td colspan="14" style="width:auto;">
                            <div style="padding:5px 5px 5px 5px;">
                                <%# Eval("ITEMComment") %>&nbsp;
                            </div>
                        </td>
                        </tr>
                    <tr style="background-color:#E1E1E1;">
                        <td style="width:20px;">
                            Item</td>
                        <td style="width:30px;">
                            PG</td>
                        <td style="width:150px;">
                            Product Code</td>
                        <td style="width:200px;">
                            Description</td>
                        <td style="width:80px;">
                            Org/Cur/Act</td>
                        <td style="width:70px;">
                            Unit Price</td>
                        <td style="width:50px;">
                            Total</td>
                        <td style="width:80px;">
                            Vendor</td>
                        <td style="width:90px;">
                            PR No.</td>
                        <td style="width:90px;">
                            PO No.</td>
                        <td style="width:90px;">
                            PO ETA</td>
                        <td style="width:90px;">
                            Req.Date</td>
                        <td style="width:auto;">
                            Note</td>
                            <td style="width:auto;">
                            UID</td>
                    </tr>
                    
                         <tr style="color:#000000;">
                            <td style="width:20px;">
                            <asp:Label ID="lblItem" runat="server" Text='<%#Eval("ItemNo")%>'></asp:Label>
                        </td>
                        <td style="width:30px;">
                            <asp:Label ID="lblPG" runat="server" Text='<%#Eval("PG")%>'></asp:Label>
                        </td>
                        <td style="width:150px;">
                            <asp:Label ID="lblMain_Item" runat="server" Text='<%#Eval("Main_Item")%>'></asp:Label>
                            &nbsp;</td>
                        <td style="width:200px;">
                            <asp:Label ID="lblItem_Number_Desc" runat="server" 
                                Text='<%#Eval("Item_Number_Desc")%>'></asp:Label>
                        </td>
                             <td style="width:80px;">
                             <asp:Label ID="lblQty" runat="server" 
                                     Text='<%# decimal.Parse(Eval("Orig_Qty").ToString()).ToString("#,##0") + "/" + decimal.Parse(Eval("Cur_Qty").ToString()).ToString("#,##0") + "/" + decimal.Parse(Eval("Act_Qty").ToString()).ToString("#,##0") %>'></asp:Label>
                                 &nbsp;</td>
                             <td style="width:70px;">
                                 <asp:Label ID="lblUNITPRC" runat="server" 
                                     Text='<%#decimal.Parse(Eval("UNITPRC").ToString()).ToString("#,##0.00")%>'></asp:Label>
                                </td>
                             <td style="width:50px;" ><asp:Label ID="lblTOTALPRC" runat="server" 
                                     Text='<%#decimal.Parse(Eval("TOTALPRC").ToString()).ToString("#,##0.00")%>'></asp:Label>
                                 </td>
                             <td style="width:80px;">
                                 <asp:Label ID="lblVENDOR" runat="server" Text='<%#Eval("VENDOR")%>'></asp:Label>
                                 &nbsp;</td>
                             <td style="width:90px;">
                                 <asp:Label ID="lblPRNO" runat="server" Text='<%#Eval("PR_NO")%>'></asp:Label>
                                 &nbsp;</td>
                             <td style="width:90px;">
                                 <asp:Label ID="lblPONO" runat="server" Text='<%#Eval("PO_Issue_No").ToString() + "(" + decimal.Parse(Eval("PO_Receipt_Qty").ToString()).ToString("#,##0") + "/" + decimal.Parse(Eval("PO_Issue_Qty").ToString()).ToString("#,##0") + ")" %>'></asp:Label>
                                 &nbsp;</td>
                             <td style="width:90px;">
                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("PO_Issue_ETA_Date")%>'></asp:Label>&nbsp; </td>
                             <td style="width:90px;">
                                 <asp:Label ID="lblReqDate" runat="server" Text='<%#Eval("PO_Issue_Req_Date")%>'></asp:Label>
                                 &nbsp;
                             </td>
                             <td style="width:auto;">
                                 <asp:Label ID="lblSorting" runat="server" Text='<%#Eval("Sorting")%>' Visible="false">&nbsp;</asp:Label>
                                 <asp:Label ID="lblPJC" runat="server" Text='<%#Eval("PJC")%>' Visible="false"></asp:Label>
                                 <asp:Label ID="lblPJCDESC" runat="server" Text='<%#Eval("PJC_DESC")%>' 
                                     Visible="false"></asp:Label>
                                 <asp:Label ID="lblLN" runat="server" Text='<%#Eval("LN")%>' Visible="false"></asp:Label>
                                 <asp:Label ID="lblTT" runat="server" Text='<%#Eval("TT")%>' Visible="false"></asp:Label>
                                
                                 </td>
                                 <td>  <asp:Label ID="lblUID" runat="server" Text='<%#Eval("UID")%>' Visible="true"></asp:Label></td>
                           
                    </tr>
         
                </table>
            </ItemTemplate>
        </telerik:GridTemplateColumn>
        <telerik:GridBoundColumn AllowFiltering="False" DataField="ItemNo" 
            Display="False" FilterControlAltText="Filter clnItem column" HeaderText="Item" 
            UniqueName="clnItem">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" HorizontalAlign="Center" VerticalAlign="Bottom" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
            CurrentFilterFunction="Contains" DataField="PG" Display="False" 
            FilterControlAltText="Filter clnPG column" FilterControlWidth="30px" 
            HeaderText="PG" ShowFilterIcon="False" UniqueName="clnPG">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" VerticalAlign="Bottom" Width="60px" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
            CurrentFilterFunction="Contains" DataField="Main_Item" Display="False" 
            FilterControlAltText="Filter clnProductCode column" FilterControlWidth="100px" 
            HeaderText="Product Code" ShowFilterIcon="False" UniqueName="clnProductCode">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" VerticalAlign="Bottom" Width="60px" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
            CurrentFilterFunction="Contains" DataField="Item_Number_Desc" Display="False" 
            FilterControlAltText="Filter clnProductDesc column" FilterControlWidth="200px" 
            HeaderText="Product Description" ShowFilterIcon="False" 
            UniqueName="clnProductDesc">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" VerticalAlign="Bottom" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
            CurrentFilterFunction="Contains" DataField="Qty" 
            DataFormatString="{0:#,###}" Display="False" 
            FilterControlAltText="Filter clnQty column" FilterControlWidth="30px" 
            HeaderText="Qty" ShowFilterIcon="False" UniqueName="clnQty">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" HorizontalAlign="right" VerticalAlign="Bottom" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
            CurrentFilterFunction="Contains" DataField="UNITPRC" 
            DataFormatString="{0:#,###.00}" DataType="System.Decimal" Display="False" 
            FilterControlAltText="Filter clnUnitPrice column" FilterControlWidth="60px" 
            HeaderText="Unit Price" ShowFilterIcon="False" UniqueName="clnUnitPrice">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" HorizontalAlign="right" VerticalAlign="Bottom" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
            CurrentFilterFunction="Contains" DataField="TOTALPRC" 
            DataFormatString="{0:#,###.00}" DataType="System.Decimal" Display="False" 
            FilterControlAltText="Filter clnTotalPrice column" FilterControlWidth="60px" 
            HeaderText="Total Price" ShowFilterIcon="False" UniqueName="clnTotalPrice">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" HorizontalAlign="right" VerticalAlign="Bottom" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
            CurrentFilterFunction="Contains" DataField="VENDOR" Display="false" 
            FilterControlAltText="Filter clnVendor column" FilterControlWidth="80px" 
            HeaderText="Vendor" ShowFilterIcon="False" UniqueName="clnVendor">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" Width="80px" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
            CurrentFilterFunction="Contains" DataField="PR_No" Display="False" 
            FilterControlAltText="Filter clnPRNo column" FilterControlWidth="60px" 
            HeaderText="PR No." ShowFilterIcon="False" UniqueName="clnPRNo">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" VerticalAlign="Bottom" Width="80px" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
            CurrentFilterFunction="Contains" DataField="PO_Issue_No" Display="False" 
            FilterControlAltText="Filter clnPONo column" FilterControlWidth="60px" 
            HeaderText="PO No." ShowFilterIcon="False" UniqueName="clnPONo">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" VerticalAlign="Bottom" Width="60px" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AllowFiltering="False" DataField="PO_ETA_DATE" 
            Display="False" FilterControlAltText="Filter clnEnd column" 
            HeaderText="End of Contract" UniqueName="clnEnd">
            <HeaderStyle Font-Size="8px" HorizontalAlign="Center" />
            <ItemStyle Font-Size="9px" Width="20px" Font-Bold="True" ForeColor="#C00000" 
                HorizontalAlign="Center" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
            CurrentFilterFunction="Contains" DataField="PO_Issue_Req_Date" Display="False" 
            FilterControlAltText="Filter clnRequestDate column" FilterControlWidth="80px" 
            HeaderText="Request Date" ShowFilterIcon="False" UniqueName="clnRequestDate">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AutoPostBackOnFilter="True" 
            CurrentFilterFunction="Contains" DataField="null" Display="False" 
            FilterControlAltText="Filter clnNote column" FilterControlWidth="60px" 
            HeaderText="Note" ShowFilterIcon="False" UniqueName="clnNote">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" VerticalAlign="Bottom" Width="60px" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="PJC" Display="False" 
            FilterControlAltText="Filter clnPJC column" HeaderText="PJC" 
            UniqueName="clnPJC">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" VerticalAlign="Bottom" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="PJC_DESC" Display="False" 
            FilterControlAltText="Filter clnPJCDESC column" HeaderText="PJC DESC" 
            UniqueName="clnPJCDESC">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" VerticalAlign="Bottom" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AllowFiltering="False" DataField="LN" Display="False" 
            FilterControlAltText="Filter clnDNum column" HeaderText="DNum" 
            UniqueName="clnDNum">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn AllowFiltering="false" DataField="Sorting" 
            Display="False" FilterControlAltText="Filter clnIndex column" 
            HeaderText="Sorting&lt;br&gt;Index" UniqueName="clnIndex">
            <HeaderStyle Font-Size="9px" />
            <ItemStyle Font-Size="9px" Width="65px" VerticalAlign="Bottom" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="TT" Display="False" 
            FilterControlAltText="Filter clnTT column" HeaderText="TT" UniqueName="clnTT">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="PO_Receipt_Qty" Display="False" 
            FilterControlAltText="Filter clnQtyReceipt column" HeaderText="PO_Rec" 
            UniqueName="clnQtyReceipt">
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" VerticalAlign="Bottom" />
            <HeaderStyle Font-Size="10px" />
            <ItemStyle Font-Size="10px" VerticalAlign="Bottom" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="PO_Issue_Qty" Display="False" 
            FilterControlAltText="Filter clnPOQty column" HeaderText="POQty" 
            UniqueName="clnPOQty">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Site_Comment" Display="False" 
            FilterControlAltText="Filter clnSiteComment column" HeaderText="SiteComment" 
            UniqueName="clnSiteComment">
        </telerik:GridBoundColumn>
    </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
</MasterTableView>

                 <SelectedItemStyle CssClass="SelectedStyle" />

<FilterMenu EnableImageSprites="False"></FilterMenu>

<HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default"></HeaderContextMenu>
         </telerik:RadGrid>
         <br />
             
                 </asp:Panel>
     </div>
         
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
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">

                function confirmdelete() {
                    if (confirm("Do you want to Delete ?") == true)
                        return true;
                    else
                        return false;
                }

                function ShowEditForm(arg, argCode) {
                    //alert(CID);
                    window.radopen("EditSorting.aspx?id=" + arg + "&code=" + argCode, "UserListDialog");
                    return false;
                }

                function refreshGrid(arg) {
                    if (!arg) {
                        $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("Rebind");
                    }
                    else {
                        $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindAndNavigate");
                    }
                }

                function OnClientLoad(sender, args) {
                    var wndMng = sender.get_windowManager();

                    wndMng.set_width(800); //set desired width  
                    wndMng.set_height(800); //set desired height  
                    wndMng.autoSize(true);
                }

                function more(ty) {
                    window.open('http://192.168.73.39/ACCPAC/PJC-OPReportExcel.asp?typ=2txtID=' + ty);
                }

                //<![CDATA[
                function StandardConfirm(sender, args) {
                    args.set_cancel(!window.confirm("Do you want to delete ?"));
                }

                //]]>
                
            </script>
   </telerik:RadCodeBlock>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" 
        EnableShadow="True" EnableViewState="false"
        VisibleTitlebar="false" >
            <Windows>
                <telerik:RadWindow ID="UserListDialog" runat="server" Title="[ แก้ไข ]" Height="500px"
                    Width="720px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false" 
                    Modal="true" MinWidth="800px" />
            </Windows>
        </telerik:RadWindowManager>
    <telerik:RadNotification ID="NotifyWarn" runat="server" AutoCloseDelay="5000" 
        ContentIcon="" Height="100px" OffsetX="10" OffsetY="-50" 
        Position="BottomLeft" Skin="Sunset"  Width="350px">
    </telerik:RadNotification>
    </form>
    
</body>
    </html>
 


