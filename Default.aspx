<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="atk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" Runat="Server">
    <div class="minheight">
        <div class="lvmessage">
            <h2>留言板</h2>
            <asp:ListView ID="LVmsg" runat="server" ItemPlaceholderID="itemholder" DataSourceID="SDSmessage" >
                <LayoutTemplate>
                    <div id="itemholder" runat="server"></div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="msg">
                        <h4 runat="server" visible='<%#Eval("M_visible")%>'><%#Eval("M_name")%></h4>
                        <h5><%#Eval("M_time")%></h5>
                        <p><%#Eval("M_message")%></p>                  
                    </div>                    
                </ItemTemplate>
                <ItemSeparatorTemplate>
                    <hr class="linehr" />
                </ItemSeparatorTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SDSmessage" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringmessage %>" 
             
                ProviderName="<%$ ConnectionStrings:ConnectionStringmessage.ProviderName %>" 
                SelectCommand="SELECT * FROM [T_message] ORDER BY [M_id] DESC">

            </asp:SqlDataSource>
            <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="LVmsg">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" />
                </Fields>
            </asp:DataPager>
              <div id="divinsertmsg" class="msg" runat="server" visible="false">
                <h4><asp:Label ID="LabelNameMsg" runat="server" Text=""></asp:Label>
                    <asp:CheckBox ID="CBvisible" runat="server" Text="匿名" /></h4>
                <p><asp:TextBox ID="TBTextMsg" runat="server"></asp:TextBox><asp:Button ID="BtnInsertMsg" runat="server" Text="确定" OnClick="BtnInsertMsg_Click" /></p>    
                  
              </div> 
        </div>
        <atk:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></atk:ToolkitScriptManager>
        <div class="divlogin"> 
            <p>用户登录</p>
            <div class="divlogintb">
                
              <asp:TextBox ID="TbName" runat="server"></asp:TextBox>

                <atk:FilteredTextBoxExtender ID="TbName_FilteredTextBoxExtender" runat="server" Enabled="True" FilterMode="InvalidChars" TargetControlID="TbName" InvalidChars="/[&quot;'<>%;)(&+]/" >
                </atk:FilteredTextBoxExtender>

                <atk:TextBoxWatermarkExtender ID="TbName_TextBoxWatermarkExtender" runat="server" Enabled="True" TargetControlID="TbName" WatermarkText="请输入用户名" WatermarkCssClass="wm">
                </atk:TextBoxWatermarkExtender>

            </div>
            <div class="divlogintb">
              <asp:TextBox ID="TbPassword" runat="server" TextMode="Password"></asp:TextBox>

                <atk:FilteredTextBoxExtender ID="TbPassword_FilteredTextBoxExtender" runat="server" Enabled="True" TargetControlID="TbPassword" FilterType="Custom" FilterMode="InvalidChars" InvalidChars="/[&quot;'<>%;)(&+]/" >
                </atk:FilteredTextBoxExtender>

                <atk:TextBoxWatermarkExtender ID="TbPassword_TextBoxWatermarkExtender" runat="server" Enabled="True" TargetControlID="TbPassword" WatermarkText="请输入密码" WatermarkCssClass="wm">
                </atk:TextBoxWatermarkExtender>

            </div>
            <div class="divloginbtn">
              <asp:Button ID="BtnLogin" runat="server" Text="登录" CssClass="btnlogin" OnClick="BtnLogin_Click" />
              <asp:Button ID="BtnRegister" runat="server" Text="注册" CssClass="btnregister" OnClick="BtnRegister_Click" />
            </div>
            <asp:Label ID="LabelState" runat="server" Text="登录成功" Visible="false"></asp:Label>
            
            
        </div>
    </div>
</asp:Content>

