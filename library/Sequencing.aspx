<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sequencing.aspx.cs" Inherits="library_Sequencing" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" Runat="Server">
    <div class="minheight">
     <div class="schbox">
        <asp:textbox ID="TbSesch" runat="server" Text=""  CssClass="schtxtbox">
        </asp:textbox><asp:Button ID="BtnSeSearch" runat="server" Text="搜索" OnClick="BtnSeSearch_Click" CssClass="schbutton"    />
            <asp:Button ID="SeAdd" runat="server" Text="新增" CssClass="schbutton" OnClick="SeAdd_Click"/>
     </div>
     <asp:MultiView ID="MVsequencing" runat="server" ActiveViewIndex="0">
         <asp:View ID="View1" runat="server">
            <asp:gridview runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcesequencing" AllowPaging="True" PageSize="30" DataKeyNames="S_id">
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="S_id" HeaderText="S_id" SortExpression="S_id" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="S_date" HeaderText="日期" SortExpression="S_date" />
                    <asp:BoundField DataField="S_orderer" HeaderText="订购人" SortExpression="S_orderer" />
                    <asp:BoundField DataField="S_vector" HeaderText="载体" SortExpression="S_vector" />
                    <asp:BoundField DataField="S_tag" HeaderText="标签" SortExpression="S_tag" />
                    <asp:BoundField DataField="S_slice" HeaderText="片段" SortExpression="S_slice" />
                    <asp:BoundField DataField="S_length" HeaderText="长度" SortExpression="S_length" />
                    <asp:BoundField DataField="S_primer" HeaderText="引物" SortExpression="S_primer" />
                    <asp:BoundField DataField="S_type" HeaderText="类别" SortExpression="S_type" />
                    <asp:CheckBoxField DataField="S_full" HeaderText="是否测通" SortExpression="S_full" />
                </Columns>
                <EmptyDataTemplate>
                    <span> 无记录！</span>
                </EmptyDataTemplate>
                <AlternatingRowStyle CssClass="alrow" />
            </asp:gridview>
            <asp:SqlDataSource ID="SqlDataSourcesequencing" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringsequencing %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringsequencing.ProviderName %>" SelectCommand="SELECT * FROM [T_sequencing]" 
                DeleteCommand="DELETE FROM [T_sequencing] WHERE [S_id] = ?" 
                UpdateCommand="UPDATE [T_sequencing] SET [S_date] = ?, [S_orderer] = ?, [S_vector] = ?, [S_tag] = ?, [S_slice] = ?, [S_length] = ?, [S_primer] = ?, [S_type] = ?, [S_full] = ? WHERE [S_id] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="S_id" Type="Int32" />
                </DeleteParameters>
               
                <UpdateParameters>
                    <asp:Parameter Name="S_date" Type="String" />
                    <asp:Parameter Name="S_orderer" Type="String" />
                    <asp:Parameter Name="S_vector" Type="String" />
                    <asp:Parameter Name="S_tag" Type="String" />
                    <asp:Parameter Name="S_slice" Type="String" />
                    <asp:Parameter Name="S_length" Type="String" />
                    <asp:Parameter Name="S_primer" Type="String" />
                    <asp:Parameter Name="S_type" Type="String" />
                    <asp:Parameter Name="S_full" Type="Boolean" />
                    <asp:Parameter Name="S_id" Type="Int32" />
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
                            
                            <h4>载体:<asp:TextBox ID="tbvector" runat="server" TextMode="MultiLine" ></asp:TextBox></h4>
                            <h4>标签:<asp:TextBox ID="tbtag" runat="server" TextMode="MultiLine" ></asp:TextBox></h4>
                            <p>引物:<asp:TextBox ID="tbprimer" runat="server" TextMode="MultiLine" ></asp:TextBox></p>
                        </div>
                        <div class="person">
                            <p>片段:<asp:TextBox ID="tbslice" runat="server" TextMode="MultiLine" ></asp:TextBox></p>
                            <p>长度:<asp:TextBox ID="tblength" runat="server" TextMode="MultiLine" ></asp:TextBox></p>
                            
                        </div>
                        <div class="note">
                            <p>类型:<asp:TextBox ID="tbtype" runat="server" TextMode="MultiLine" ></asp:TextBox></p>
                            <p>是否测通:<asp:CheckBox ID="cbfull" runat="server" /></p>
                        </div>
                        <div class="clr"></div>
             </div>
         </asp:View>

      </asp:MultiView>
   </div>
</asp:Content>

