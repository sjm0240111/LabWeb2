<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Antibodyadmin.aspx.cs" Inherits="library_Antibodyadmin" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" Runat="Server">
    <div class="minheight">
     <div class="schbox">
        <asp:textbox ID="TbAbsch" runat="server" Text=""  CssClass="schtxtbox">
        </asp:textbox><asp:Button ID="BtnAbSearch" runat="server" Text="搜索" OnClick="BtnAbSearch_Click" CssClass="schbutton"    />
            <asp:Button ID="AbAdd" runat="server" Text="新增" CssClass="schbutton" OnClick="AbAdd_Click"/>
     </div>
     <asp:MultiView ID="MVantibody" runat="server" ActiveViewIndex="0">
         <asp:View ID="View1" runat="server">
            <asp:gridview runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceantibody" AllowPaging="True" PageSize="30" DataKeyNames="A_id">
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="A_id" HeaderText="A_id" SortExpression="A_id" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="A_no" HeaderText="货号" SortExpression="A_no" />
                    <asp:BoundField DataField="A_name" HeaderText="名称" SortExpression="A_name" />
                    <asp:BoundField DataField="A_background" HeaderText="背景" SortExpression="A_background" />
                </Columns>
                <EmptyDataTemplate>
                    <span> 无记录！</span>
                </EmptyDataTemplate>
                <AlternatingRowStyle CssClass="alrow" />
            </asp:gridview>
            <asp:SqlDataSource ID="SqlDataSourceantibody" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringantibody %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringantibody.ProviderName %>" SelectCommand="SELECT * FROM [T_antibody] ORDER BY [A_id] DESC" 
                DeleteCommand="DELETE FROM [T_antibody] WHERE [A_id] = ?" 
                UpdateCommand="UPDATE [T_antibody] SET [A_no] = ?, [A_name] = ?, [A_background] = ? WHERE [A_id] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="A_id" Type="Int32" />
                </DeleteParameters>
               
                <UpdateParameters>
                    <asp:Parameter Name="A_no" Type="String" />
                    <asp:Parameter Name="A_name" Type="String" />
                    <asp:Parameter Name="A_background" Type="String" />
                    <asp:Parameter Name="A_id" Type="Int32" />
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
                            
                            <h4>编号:<asp:TextBox ID="tbitem" runat="server" TextMode="MultiLine" Height="80px" ></asp:TextBox></h4>
             
                        </div>
                        <div class="person">
                            <p>名称:<asp:TextBox ID="tbname" runat="server" TextMode="MultiLine" Height="80px" ></asp:TextBox></p>
                        </div>
                        <div class="note">
                            <p>背景:<asp:TextBox ID="tbbackground" runat="server" TextMode="MultiLine" Height="80px" ></asp:TextBox></p>

                        </div>
                        <div class="clr"></div>
             </div>
         </asp:View>

      </asp:MultiView>
   </div>
</asp:Content>

