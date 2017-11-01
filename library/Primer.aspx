<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Primer.aspx.cs" Inherits="library_Primer" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" Runat="Server">
    <div class="minheight">
     <div class="schbox">
        <asp:textbox ID="TbPrsch" runat="server" Text=""  CssClass="schtxtbox">
        </asp:textbox><asp:Button ID="BtnPrSearch" runat="server" Text="搜索" OnClick="BtnPrSearch_Click" CssClass="schbutton"    />
            <asp:Button ID="PrAdd" runat="server" Text="新增" CssClass="schbutton" OnClick="PrAdd_Click"/>
     </div>
     <asp:MultiView ID="MVprimer" runat="server" ActiveViewIndex="0">
         <asp:View ID="View1" runat="server">
            <asp:gridview runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceprimer" AllowPaging="True" PageSize="30" DataKeyNames="Pr_id">
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Pr_id" HeaderText="Pr_id" SortExpression="Pr_id" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="Pr_date" HeaderText="日期" SortExpression="Pr_date" />
                    <asp:BoundField DataField="Pr_orderer" HeaderText="订购人" SortExpression="Pr_orderer" />
                    <asp:BoundField DataField="Pr_name" HeaderText="名称" SortExpression="Pr_name" />
                    <asp:BoundField DataField="Pr_use" HeaderText="用途" SortExpression="Pr_use" />
                    <asp:BoundField DataField="Pr_sequence" HeaderText="序列" SortExpression="Pr_sequence" />
                </Columns>
                <EmptyDataTemplate>
                    <span> 无记录！</span>
                </EmptyDataTemplate>
                <AlternatingRowStyle CssClass="alrow" />
            </asp:gridview>
             <asp:SqlDataSource ID="SqlDataSourceprimer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringprimer %>" 
                 DeleteCommand="DELETE FROM [T_primer] WHERE [Pr_id] = ?" ProviderName="<%$ ConnectionStrings:ConnectionStringprimer.ProviderName %>" 
                 SelectCommand="SELECT * FROM [T_primer]" 
                 UpdateCommand="UPDATE [T_primer] SET [Pr_date] = ?, [Pr_orderer] = ?, [Pr_name] = ?, [Pr_use] = ?, [Pr_sequence] = ? WHERE [Pr_id] = ?">
                 <DeleteParameters>
                     <asp:Parameter Name="Pr_id" Type="Int32" />
                 </DeleteParameters>

                 <UpdateParameters>
                     <asp:Parameter Name="Pr_date" Type="String" />
                     <asp:Parameter Name="Pr_orderer" Type="String" />
                     <asp:Parameter Name="Pr_name" Type="String" />
                     <asp:Parameter Name="Pr_use" Type="String" />
                     <asp:Parameter Name="Pr_sequence" Type="String" />
                     <asp:Parameter Name="Pr_id" Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
          </asp:View>
         <asp:View ID="View2" runat="server">
              <div id="insertantibody" class="edititemtem">
            <div class="btn">
                            <asp:Button ID="btnconfirm" runat="server" Text="确定" OnClick="BtnConfirm_Click" OnClientClick="return confirm('是否确定新增？')" />
                            <asp:Button ID="btncancel" runat="server" Text="取消" OnClick="BtnCancel_Click"  />
                        </div>
                        <div class="product">
                            
                            <p>名称:</p>
                            <p><asp:TextBox ID="tbname" runat="server" TextMode="MultiLine" ></asp:TextBox></p>
             
                        </div>
                        <div class="person">
                            <p>用途（克隆请注明载体和标签）:</p>
                            <p><asp:TextBox ID="tbuse" runat="server" TextMode="MultiLine" Height="80px" ></asp:TextBox></p>
                        </div>
                        <div class="note">
                            <p>序列:</p>
                            <p><asp:TextBox ID="tbsequence" runat="server" TextMode="MultiLine" Height="80px" ></asp:TextBox></p>

                        </div>
                        <div class="clr"></div>
             </div>
         </asp:View>

      </asp:MultiView>
   </div>
</asp:Content>

