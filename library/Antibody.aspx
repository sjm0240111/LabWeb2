<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Antibody.aspx.cs" Inherits="library_Antibody" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" Runat="Server">
    <div class="minheight">
     <div class="schbox">
        <asp:textbox ID="TbAbsch" runat="server" Text=""  CssClass="schtxtbox">
        </asp:textbox><asp:Button ID="BtnAbSearch" runat="server" Text="搜索" OnClick="BtnAbSearch_Click" CssClass="schbutton"    />

     </div>

            <asp:gridview runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceantibody" AllowPaging="True" PageSize="30">
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:BoundField DataField="A_no" HeaderText="编号" SortExpression="A_no" />
                    <asp:BoundField DataField="A_name" HeaderText="名称" SortExpression="A_name" />
                    <asp:BoundField DataField="A_background" HeaderText="背景" SortExpression="A_background" />
                </Columns>
                <EmptyDataTemplate>
                    <span> 无记录！</span>
                </EmptyDataTemplate>
                <AlternatingRowStyle CssClass="alrow" />
            </asp:gridview>
            <asp:SqlDataSource ID="SqlDataSourceantibody" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringantibody %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringantibody.ProviderName %>" SelectCommand="SELECT * FROM [T_antibody] ORDER BY [A_id] DESC"></asp:SqlDataSource>
        
   </div>
</asp:Content>

