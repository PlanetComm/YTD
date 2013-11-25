<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SO_Compare.aspx.cs" Inherits="YTD.SO_Compare" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
   
    <asp:Label ID="Label1" runat="server" Text="Sales Order Comparision" Font-Bold="True" Font-Names="Tahoma" Font-Size="25px" ForeColor="#FFFFFF"></asp:Label> 
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
         <asp:Panel ID="Panel1" runat="server">
        
             &nbsp;<asp:Label ID="lblC" runat="server" Font-Size="12px" 
         Font-Bold="False" ForeColor="Maroon" Text="Take a while for generate data ..." 
                 Font-Italic="True"></asp:Label>            </asp:Panel></td>
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
                         <telerik:GridBoundColumn DataField="SALES_SO" 
                             FilterControlAltText="Filter clnSO column" HeaderText="SALES_SO" 
                             UniqueName="clnSALESSO">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="SALES_AMT" DataFormatString="{0:#,#.00}"
                             FilterControlAltText="Filter clnSO column" HeaderText="SALES_AMT" 
                             UniqueName="clnSALESAMT">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="MKT_SO" 
                             FilterControlAltText="Filter clnSO column" HeaderText="MKT_SO" 
                             UniqueName="clnMKTSO">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="MKT_CATE" 
                             FilterControlAltText="Filter clnSO column" HeaderText="MKT_CATE" 
                             UniqueName="clnMKTCATE">
                             <HeaderStyle HorizontalAlign="Left" />
                             <ItemStyle HorizontalAlign="Left" Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="MKT_AMT" DataFormatString="{0:#,#.00}"
                             FilterControlAltText="Filter clnSO column" HeaderText="MKT_AMT" 
                             UniqueName="clnMKTAMT">
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
