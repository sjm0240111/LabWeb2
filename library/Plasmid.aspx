<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Plasmid.aspx.cs" Inherits="library_Plasmid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" Runat="Server">
    <div class="minheight">
        <div id="divrbs" class ="schrbs" runat="server">
            <asp:RadioButton ID="P_gene"  runat="server" Text="基因名" GroupName="group1" />
            <asp:RadioButton ID="P_person" runat="server" Text="入库人" GroupName="group1"/>
        </div>
       <div class="schbox">
        <asp:textbox ID="TbPlsch" runat="server" Text=""  CssClass="schtxtbox">
        </asp:textbox><asp:Button ID="BtnPlSearch" runat="server" Text="搜索" OnClick="BtnPlSearch_Click" CssClass="schbutton"    />
         
       </div>
        <asp:GridView ID="GVplasmid" runat="server" AutoGenerateColumns="False" DataKeyNames="P_id" DataSourceID="SDSplasmid" AllowPaging="True" PageSize="30" >
            <AlternatingRowStyle CssClass="alrow" />
            <Columns>
                <asp:BoundField DataField="P_no" HeaderText="编号" SortExpression="P_no" />
                <asp:BoundField DataField="P_vector" HeaderText="载体" SortExpression="P_vector" />
                <asp:BoundField DataField="P_gene" HeaderText="基因" SortExpression="P_gene" />
                <asp:BoundField DataField="P_enzyme" HeaderText="酶切位点" SortExpression="P_enzyme" />
                <asp:BoundField DataField="P_fulllength" HeaderText="是否全长" SortExpression="P_fulllength" />
                <asp:BoundField DataField="P_position" HeaderText="位置" SortExpression="P_position" />
                <asp:BoundField DataField="P_sequence" HeaderText="序列" SortExpression="P_sequence" />
                <asp:BoundField DataField="P_person" HeaderText="入库人" SortExpression="P_person" />
                <asp:BoundField DataField="P_note" HeaderText="备注" SortExpression="P_note" />
            </Columns>
            <EmptyDataTemplate>
                <span>无记录！ </span>
            </EmptyDataTemplate>
            <RowStyle CssClass="row" />
        </asp:GridView>

        <asp:SqlDataSource ID="SDSplasmid" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringplasmid %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringplasmid.ProviderName %>" SelectCommand="SELECT * FROM [T_plasmid] ORDER BY [P_id] DESC"></asp:SqlDataSource>

    </div>
</asp:Content>

