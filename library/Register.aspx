<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="library_Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="atk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" Runat="Server">
    <atk:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></atk:ToolkitScriptManager>
    <div class="divregister"> 
            <H3>用户注册</H3>
                <p>
                    用户名：<asp:TextBox ID="TbName" runat="server"></asp:TextBox>
                </p>

                <atk:FilteredTextBoxExtender ID="TbName_FilteredTextBoxExtender" runat="server" Enabled="True" FilterMode="InvalidChars" TargetControlID="TbName" InvalidChars="/[&quot;'<>%;)(&+]/" >
                </atk:FilteredTextBoxExtender>

                <atk:TextBoxWatermarkExtender ID="TbName_TextBoxWatermarkExtender" runat="server" Enabled="True" TargetControlID="TbName" WatermarkText="请输入用户名" WatermarkCssClass="wm">
                </atk:TextBoxWatermarkExtender>

                <p>
                 密码：<asp:TextBox ID="TbPassword1" runat="server" TextMode="Password"></asp:TextBox>
                </p>
              
                <atk:FilteredTextBoxExtender ID="TbPassword1_FilteredTextBoxExtender" runat="server" Enabled="True" TargetControlID="TbPassword1" FilterType="Custom" FilterMode="InvalidChars" InvalidChars="/[&quot;'<>%;)(&+]/" >
                </atk:FilteredTextBoxExtender>

                <atk:TextBoxWatermarkExtender ID="TbPassword1_TextBoxWatermarkExtender" runat="server" Enabled="True" TargetControlID="TbPassword1" WatermarkText="请输入密码" WatermarkCssClass="wm">
                </atk:TextBoxWatermarkExtender>
            
                <p>
                 再次输入密码：<asp:TextBox ID="TbPassword2" runat="server" TextMode="Password"></asp:TextBox>
                </p>
              
                <atk:FilteredTextBoxExtender ID="TbPassword2_FilteredTextBoxExtender1" runat="server" Enabled="True" TargetControlID="TbPassword2" FilterType="Custom" FilterMode="InvalidChars" InvalidChars="/[&quot;'<>%;)(&+]/" >
                </atk:FilteredTextBoxExtender>

                <atk:TextBoxWatermarkExtender ID="TbPassword2_TextBoxWatermarkExtender1" runat="server" Enabled="True" TargetControlID="TbPassword2" WatermarkText="请输入密码" WatermarkCssClass="wm">
                </atk:TextBoxWatermarkExtender>

            <p>真实姓名：<asp:TextBox ID="TbTrueName" runat="server"></asp:TextBox></p>
            <div class="divregisterbtn">
              <asp:Button ID="BtnRegister" runat="server" Text="注册" CssClass="btnlogin" OnClick="BtnRegister_Click" />              
            </div>
            <asp:Label ID="LabelState" runat="server" Text="注册成功,请等待审核" Visible="false"></asp:Label>
            
            
        </div>
</asp:Content>

