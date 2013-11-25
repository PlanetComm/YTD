<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BOMGenerate.aspx.cs" Inherits="YTD.BOMGenerate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

  
</head>
<body style="margin:0px" onkeydown="javascript:if(window.event.keyCode == 13) window.event.keyCode = 9;">
    <form id="form1" runat="server">           
  <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
	<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
        Skin="Telerik">
    </telerik:RadAjaxLoadingPanel> 
      <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
          <AjaxSettings>
              <telerik:AjaxSetting AjaxControlID="cbVendorCode">
                  <UpdatedControls>
                      <telerik:AjaxUpdatedControl ControlID="PanelItem" 
                          LoadingPanelID="RadAjaxLoadingPanel1" />
                  </UpdatedControls>
              </telerik:AjaxSetting>
              <telerik:AjaxSetting AjaxControlID="cbProductCode">
                  <UpdatedControls>
                      <telerik:AjaxUpdatedControl ControlID="btnAdd" 
                          LoadingPanelID="RadAjaxLoadingPanel1" />
                  </UpdatedControls>
              </telerik:AjaxSetting>
              <telerik:AjaxSetting AjaxControlID="btnAdd">
                  <UpdatedControls>
                      <telerik:AjaxUpdatedControl ControlID="NotifyWarn" />
                      <telerik:AjaxUpdatedControl ControlID="PanelBOM" />
                      <telerik:AjaxUpdatedControl ControlID="Panel1" />
                      <telerik:AjaxUpdatedControl ControlID="Panel2" 
                          LoadingPanelID="RadAjaxLoadingPanel1" />
                  </UpdatedControls>
              </telerik:AjaxSetting>
              <telerik:AjaxSetting AjaxControlID="btnBOM">
                  <UpdatedControls>
                      <telerik:AjaxUpdatedControl ControlID="NotifyWarn" />
                      <telerik:AjaxUpdatedControl ControlID="NotifySave" />
                      <telerik:AjaxUpdatedControl ControlID="PanelBOM" 
                          LoadingPanelID="RadAjaxLoadingPanel1" />
                      <telerik:AjaxUpdatedControl ControlID="Panel1" />
                      <telerik:AjaxUpdatedControl ControlID="Panel2" 
                          LoadingPanelID="RadAjaxLoadingPanel1" />
                  </UpdatedControls>
              </telerik:AjaxSetting>
              <telerik:AjaxSetting AjaxControlID="RadGrid1">
                  <UpdatedControls>
                      <telerik:AjaxUpdatedControl ControlID="PanelBOM" 
                          LoadingPanelID="RadAjaxLoadingPanel1" />
                      <telerik:AjaxUpdatedControl ControlID="Panel2" 
                          LoadingPanelID="RadAjaxLoadingPanel1" />
                  </UpdatedControls>
              </telerik:AjaxSetting>
              <telerik:AjaxSetting AjaxControlID="btnClear">
                  <UpdatedControls>
                      <telerik:AjaxUpdatedControl ControlID="NotifyWarn" />
                      <telerik:AjaxUpdatedControl ControlID="NotifySave" />
                      <telerik:AjaxUpdatedControl ControlID="PanelItem" 
                          LoadingPanelID="RadAjaxLoadingPanel1" />
                      <telerik:AjaxUpdatedControl ControlID="PanelBOM" />
                      <telerik:AjaxUpdatedControl ControlID="Panel1" 
                          LoadingPanelID="RadAjaxLoadingPanel1" />
                      <telerik:AjaxUpdatedControl ControlID="Panel2" 
                          LoadingPanelID="RadAjaxLoadingPanel1" />
                  </UpdatedControls>
              </telerik:AjaxSetting>
              <telerik:AjaxSetting AjaxControlID="btnSave">
                  <UpdatedControls>
                      <telerik:AjaxUpdatedControl ControlID="NotifyWarn" />
                      <telerik:AjaxUpdatedControl ControlID="NotifySave" />
                      <telerik:AjaxUpdatedControl ControlID="PanelBOM" 
                          LoadingPanelID="RadAjaxLoadingPanel1" />
                      <telerik:AjaxUpdatedControl ControlID="Panel1" />
                      <telerik:AjaxUpdatedControl ControlID="Panel2" />
                  </UpdatedControls>
              </telerik:AjaxSetting>
          </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadNotification ID="NotifyWarn" runat="server" Animation="Resize" 
        AutoCloseDelay="4000" BackColor="#FF3300" ContentIcon="" 
        EnableRoundedCorners="true" EnableShadow="True" Height="80px" 
        LoadContentOn="EveryShow" OffsetX="40" OffsetY="-60" Position="BottomLeft" 
        Skin="Sunset" TitleIcon="img/Del.png" Width="380">
    </telerik:RadNotification>
    <telerik:RadNotification ID="NotifySave" runat="server" Animation="Resize" 
        ContentIcon="" EnableRoundedCorners="true" 
        EnableShadow="True" EnableTheming="False" Height="80px" 
        LoadContentOn="EveryShow" OffsetX="-40" OffsetY="-60" Skin="Hay" 
        Width="380">
    </telerik:RadNotification>
    <div align="center">
      <table border="0" cellpadding="0" cellspacing="0" width="1200px" style="background-color:#008299;">
    <tr>
    <td align="center" style="width:auto;height:50px;" colspan="2">
    <asp:Label ID="Label1" runat="server" Text="BOM Generator " Font-Bold="True" Font-Names="Tahoma" Font-Size="25px" ForeColor="#FFFFFF"></asp:Label> 
        </td>
    </tr>
    <tr>
    <td align="left" style="width:auto;" colspan="2">
     <!-- Start New -->
     <table border="0" cellpadding="1" cellspacing="4" width="100%" >
     <tr style="background-color: #FFFFFF;font-family:Tahoma;font-size:12px;">
     <td style="width:500px;" valign="top">
  <asp:Panel ID="PanelItem" runat="server" style="padding:5px 5px 5px 5px;">
        <table border="0" cellpadding="1" cellspacing="1" width="100%">
        <tr>
        <td colspan="2" style="color:#008299;font-size:15px;font-weight:bold;" align="center">
            Check BOM
            </td>
        </tr>
            
            <tr>
                <td align="center" colspan="2" 
                    style="color:#008299;font-size:15px;font-weight:bold;">
                   <hr class="style-one" />
                   </td>
            </tr>
            
            <tr>
                <td style="width:110px;">
                    Vendor Code :</td>
                <td style="width:auto;">
                    <telerik:RadComboBox ID="cbVendorCode" Runat="server" AutoPostBack="True" 
                        DataTextField="DSC" DataValueField="CODE" DropDownWidth="500px" 
                        EnableLoadOnDemand="True" Filter="Contains" MaxHeight="500px" 
                        onselectedindexchanged="cbVendorCode_SelectedIndexChanged" Skin="Sunset" 
                        Width="350px">
                    </telerik:RadComboBox>
                </td>
            </tr>
            
            <tr>
                <td style="width:110px;">
                    Product Code :
                </td>
                <td style="width:auto;">
                    <telerik:RadComboBox ID="cbProductCode" Runat="server" AutoPostBack="True" 
                        DataTextField="DSC" DataValueField="CODE" DropDownWidth="500px" 
                        EnableLoadOnDemand="True" Filter="Contains" MaxHeight="500px" 
                        onselectedindexchanged="cbProductCode_SelectedIndexChanged" Skin="Sunset" 
                        Width="350px">
                    </telerik:RadComboBox>
                </td>
            </tr>
            
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    &nbsp;&nbsp;</td>
            </tr>
            
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <telerik:RadButton ID="btnAdd" runat="server" BackColor="White" 
                        BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                        ButtonType="LinkButton" onclick="btnAdd_Click" Skin="Office2010Silver" 
                        Text="Check BOM Code" Visible="False" Width="120px">
                    </telerik:RadButton>
                </td>
            </tr>
            
 </table>
        </asp:Panel>       
     </td>
     <td style="width:700px;" align="left">
         
     <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding:5px 5px 5px 5px;">
         <tr>
         <td style="font-family: Tahoma; font-size: small; font-weight: bold;" 
                 valign="middle">     
                 <asp:Panel ID="Panel2" runat="server">
                 <table border="0" cellpadding="1" cellspacing="1" width="100%">
                 <tr>
                
                    <td colspan="2" style="color:#008299;font-size:15px;font-weight:bold;" align="center">
                        BOM Manage</td>
                   
                 </tr>
                     <tr>
                         <td align="center" style="color: #008299; font-size: 15px; font-weight: bold;" 
                             colspan="2">
                             <hr class="style-one" />
                         </td>
                         <tr>
                             <td align="left" style="width:110px;">
                                 BOM Code :
                             </td>
                             <td align="left">
                                 <telerik:RadTextBox ID="txtBOMCode" runat="server" SelectionOnFocus="SelectAll" 
                                     Skin="Sunset" Width="280px">
                                     <PasswordStrengthSettings CalculationWeightings="50;15;15;20" 
                                         IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID="" 
                                         MinimumLowerCaseCharacters="2" MinimumNumericCharacters="2" 
                                         MinimumSymbolCharacters="2" MinimumUpperCaseCharacters="2" 
                                         OnClientPasswordStrengthCalculating="" PreferredPasswordLength="10" 
                                         RequiresUpperAndLowerCaseCharacters="True" ShowIndicator="False" 
                                         TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" 
                                         TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" />
                                     <EnabledStyle BackColor="#FFFFCC" BorderColor="#FF6666" BorderStyle="Solid" />
                                 </telerik:RadTextBox>
                             </td>
                         </tr>
                         <tr>
                             <td align="left" style="width:110px;">
                                 BOM Name :</td>
                             <td align="left">
                                 <telerik:RadTextBox ID="txtBOMName" runat="server" Rows="3" 
                                     SelectionOnFocus="SelectAll" Skin="Sunset" TextMode="MultiLine" 
                                     Width="280px">
                                     <PasswordStrengthSettings CalculationWeightings="50;15;15;20" 
                                         IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID="" 
                                         MinimumLowerCaseCharacters="2" MinimumNumericCharacters="2" 
                                         MinimumSymbolCharacters="2" MinimumUpperCaseCharacters="2" 
                                         OnClientPasswordStrengthCalculating="" PreferredPasswordLength="10" 
                                         RequiresUpperAndLowerCaseCharacters="True" ShowIndicator="False" 
                                         TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" 
                                         TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" />
                                     <EnabledStyle BackColor="#FFFFCC" BorderColor="#FF6666" BorderStyle="Solid" />
                                 </telerik:RadTextBox>
                                 <asp:Label ID="lblC" runat="server" Visible="False"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td align="left" style="width:110px;">
                                 Vendor Code :</td>
                             <td align="left">
                                 <telerik:RadTextBox ID="txtVenCode" runat="server" ReadOnly="True" 
                                     SelectionOnFocus="SelectAll" Skin="Sunset" Width="280px">
                                     <PasswordStrengthSettings CalculationWeightings="50;15;15;20" 
                                         IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID="" 
                                         MinimumLowerCaseCharacters="2" MinimumNumericCharacters="2" 
                                         MinimumSymbolCharacters="2" MinimumUpperCaseCharacters="2" 
                                         OnClientPasswordStrengthCalculating="" PreferredPasswordLength="10" 
                                         RequiresUpperAndLowerCaseCharacters="True" ShowIndicator="False" 
                                         TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" 
                                         TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" />
                                     <EnabledStyle BackColor="#FFFFCC" BorderColor="#FF6666" BorderStyle="Solid" />
                                 </telerik:RadTextBox>
                             </td>
                         </tr>
               
                     </tr>
                     <tr>
                         <td align="left" colspan="2" valign="top">
                             Item Code :<br />
                             <telerik:RadGrid ID="rgChoose" runat="server" AllowMultiRowSelection="False" 
                                 AutoGenerateColumns="False" CellSpacing="0" GridLines="None" Skin="Metro">
                                 <ClientSettings EnableRowHoverStyle="True">
                                     <Selecting AllowRowSelect="True" />
                                     <Scrolling AllowScroll="True" ScrollHeight="500px" UseStaticHeaders="True" />
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
                                         <telerik:GridBoundColumn DataField="Code" 
                                             FilterControlAltText="Filter clnCode column" HeaderText="Code" 
                                             UniqueName="clnCode">
                                             <HeaderStyle Font-Size="11px" />
                                             <ItemStyle Width="80px" Font-Size="10px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="DSC" 
                                             FilterControlAltText="Filter clnDesc column" HeaderText="Desc" 
                                             UniqueName="clnDesc">
                                             <HeaderStyle Font-Size="11px" />
                                             <ItemStyle Width="250px" Font-Size="10px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridTemplateColumn FilterControlAltText="Filter clnQty column" 
                                             HeaderText="Qty" UniqueName="clnQty">
                                             <ItemTemplate>
                                                 <telerik:RadNumericTextBox ID="numQty" Runat="server" MinValue="1" Skin="Metro" 
                                                     Width="50px">
                                                     <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                                 </telerik:RadNumericTextBox>
                                             </ItemTemplate>
                                             <HeaderStyle Font-Size="11px" />
                                             <ItemStyle Font-Size="10px" Width="65px" />
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
                         </td>
                     </tr>
                 </table>
                 </asp:Panel>
    </td>
         </tr>
             <tr>
         <td style="padding:5px 5px 5px 5px;" align="center" >
              <telerik:RadButton ID="btnNew" runat="server" BackColor="White" 
                                 BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                                 ButtonType="LinkButton" Skin="Office2010Silver" 
                                 Text="New" Width="110px" 
                 onclick="btnBOM_Click" Enabled="False">
                             </telerik:radbutton>
                              &nbsp;
             <telerik:RadButton ID="btnBOM" runat="server" BackColor="White" 
                                 BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                                 ButtonType="LinkButton" Skin="Office2010Silver" 
                                 Text="Add" Width="110px" 
                 onclick="btnBOM_Click" Enabled="False">
                             </telerik:radbutton>
                             &nbsp;       
                               &nbsp;
                                   <telerik:RadButton ID="btnEdit" runat="server" BackColor="White" 
                                 BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                                 ButtonType="LinkButton" Skin="Office2010Silver" 
                                 Text="Edit" Width="110px" Enabled="False" >
                             </telerik:radbutton>
                              &nbsp;      
                                   <telerik:RadButton ID="btnDelete" runat="server" BackColor="White" 
                                 BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                                 ButtonType="LinkButton" Skin="Office2010Silver" 
                                 Text="Delete" Width="110px" Enabled="False" >
                             </telerik:radbutton>
                              &nbsp;
             <telerik:RadButton ID="btnItemAdd" runat="server" BackColor="#CCFFCC" 
                                 BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                                 ButtonType="LinkButton" Skin="Office2010Silver" 
                                 Text="Add Item" Visible="false" Width="110px">
                             </telerik:radbutton>
         </td>
         </tr>
         <tr>
         <td style="padding:5px 5px 5px 5px;" >

         <table border="0" cellpadding="1" cellspacing="1" width="100%">
         <tr>
         <td align="left">
         <asp:Panel ID="PanelBOM" runat="server" style="padding:5px 5px 5px 5px;font-size:11px;">

             <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" 
                 CellSpacing="0" GridLines="None" 
                 Skin="Transparent" ondeletecommand="RadGrid1_DeleteCommand" >
                 <MasterTableView>
                     <CommandItemSettings ExportToPdfText="Export to PDF" />
                     <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                     </RowIndicatorColumn>
                     <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                     </ExpandCollapseColumn>
                     <Columns>
                         <telerik:GridBoundColumn AllowFiltering="False" DataField="ITEMNO" 
                             FilterControlAltText="Filter clnNo column" HeaderText="No." UniqueName="clnNo">
                             <HeaderStyle Font-Size="11px" />
                             <ItemStyle Width="35px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="FMITEMNO" 
                             FilterControlAltText="Filter clnItemCode column" HeaderText="Code" 
                             UniqueName="clnItemCode">
                             <HeaderStyle Font-Size="11px" />
                             <ItemStyle Width="80px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="FMITEMDESC" 
                             FilterControlAltText="Filter clnItemDesc column" HeaderText="Desc" 
                             UniqueName="clnItemDesc">
                             <HeaderStyle Font-Size="11px" />
                             <ItemStyle Width="100px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn AllowFiltering="False" DataField="QTY" 
                             FilterControlAltText="Filter clnQty column" HeaderText="Qty" DataFormatString="{0:#,##0}"
                             UniqueName="clnQty" >
                             <HeaderStyle Font-Size="11px" />
                             <ItemStyle Width="50px" Font-Size="10px" />
                         </telerik:GridBoundColumn>
                             <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                ConfirmText="Do you want to Delete ?" 
                                FilterControlAltText="Filter clnEdit column" UniqueName="clnDel">
                                <ItemStyle HorizontalAlign="Center" Width="25px" />
                            </telerik:GridButtonColumn>
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

        </asp:Panel></td>
         </tr>
         </table>

         
        </td>
         </tr>
         <tr>
         <td style="padding:5px 5px 5px 5px;">
             <asp:Panel ID="Panel1" runat="server">
             <table border="0" cellpadding="0" cellspacing="0" width="100%">
             <tr>
           
                 <td align="right" style="width:auto;">
                     <asp:Panel ID="Panel3" runat="server">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                    <td align="left"><telerik:RadButton ID="btnDel" runat="server" BackColor="#FF9999" 
                             BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                             ButtonType="LinkButton" Skin="Office2010Silver" 
                             Text="Delete BOM Code" Visible="false" Width="110px" 
                             onclick="btnDel_Click" 
                             onclientclicking="return confirm('Do you want to delete ?')">
                         </telerik:RadButton></td>
                    <td align="right">    <telerik:RadButton ID="btnSave" 
                         runat="server" onclick="btnSave_Click" 
                     Skin="Office2010Silver" Text="Save BOM Code" Width="110px" BackColor="White" 
                         BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                         ButtonType="LinkButton" Visible="False">
                 </telerik:RadButton>  &nbsp;
                 <telerik:RadButton ID="btnClear" 
                         runat="server" 
                     Skin="Office2010Silver" Text="Clear" Width="110px" BackColor="White" 
                         BorderColor="#008299" BorderStyle="Solid" BorderWidth="2px" 
                         ButtonType="LinkButton" Visible="true" onclick="btnClear_Click">
                     </telerik:radbutton></td>
                    </tr>
                    </table>
                 
      
                     </asp:Panel></td>
             </tr>
             </table>
                 
                 
                
                 </asp:Panel>
&nbsp;
        </td>
         </tr>
         </table>
         
     </td>
     </tr>
     </table>
     <!-- End New -->
     </td>
    </tr>
    <tr align="center">
    <td  style="width:475px;font-family: Tahoma; font-size: small; font-weight: bold;" valign="top" >
   
        
   
        </td>
         <td style="width:475px;" valign="top">
    
     
        </td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
