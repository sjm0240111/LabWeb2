<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testlistview.aspx.cs" Inherits="test_testlistview" MaintainScrollPositionOnPostBack="True"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="/App_style/CssDefault.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">

    <div>
     <asp:ListView ID="lvorder" runat="server" ItemPlaceholderID="itemholder" DataSourceID="SDSorder">
                <LayoutTemplate>
                    <div id="itemholder" runat="server"></div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="itemtem">
                   
                        <div class="btn">
                            <asp:Button ID="btnlvupdate" runat="server" Text="修改" CommandName="Edit"/>
                            <asp:Button ID="btnlvdelete" runat="server" Text="删除" OnCommand="MarkDelete" CommandArgument='<%#Eval("O_id")%>' CommandName="markonly" OnClientClick="return confirm('确认删除？')"/>
                        </div>
                        <div class="product">
                            <h4>名称:<%#Eval("O_name")%></h4>
                            <h4>公司:<%#Eval("O_brand")%></h4>
                            <h4>货号:<%#Eval("O_item")%></h4>
                            <h4>数量:<%#Eval("O_number")%></h4>
                        </div>
                        <div class="person">
                            <p>申请时间:<%#Eval("O_ordertime")%></p>
                            <p>订购人:<%#Eval("O_orderer")%></p>
                            <p>订购时间:<%#Eval("O_buytime")%></p>
                            <p>到货时间:<%#Eval("O_arrival")%></p>
                            <p>收货人:<%#Eval("O_receiver")%></p>
                        </div>
                        <div class="note">
                            <p>备注:<%#Eval("O_note")%></p>

                        </div>
                        <div class="clr"></div>
                    </div>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <div class="altitemtem">
                        <div class="btn">
                            <asp:Button ID="btnlvupdate" runat="server" Text="修改" CommandName="Edit"/>
                            <asp:Button ID="btnlvdelete" runat="server" Text="删除" OnCommand="MarkDelete" CommandArgument='<%#Eval("O_delete")%>' CommandName="markonly"/>
                        </div>
                        <div class="product">
                            <h4>名称:<%#Eval("O_name")%></h4>
                            <h4>公司:<%#Eval("O_brand")%></h4>
                            <h4>货号:<%#Eval("O_item")%></h4>
                            <h4>数量:<%#Eval("O_number")%></h4>
                        </div>
                        <div class="person">
                            <p>申请时间:<%#Eval("O_ordertime")%></p>
                            <p>订购人:<%#Eval("O_orderer")%></p>
                            <p>订购时间:<%#Eval("O_buytime")%></p>
                            <p>到货时间:<%#Eval("O_arrival")%></p>
                            <p>收货人:<%#Eval("O_receiver")%></p>
                        </div>
                        <div class="note">
                            <p>备注:<%#Eval("O_note")%></p>

                        </div>
                        <div class="clr"></div>
                    </div>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <div class="edititemtem">
                   
                        <div class="btn">
                            <asp:Button ID="btnlvconfirm" runat="server" Text="确定" />
                            <asp:Button ID="btnlvcancel" runat="server" Text="取消" CommandName="Cancel" />
                        </div>
                        <div class="product">
                            <h4>名称:<asp:TextBox ID="TextBox1" runat="server" Text='<%#Eval("O_name")%>' TextMode="MultiLine"></asp:TextBox></h4>
                            <h4>公司:<asp:TextBox ID="TextBox2" runat="server" Text='<%#Eval("O_brand")%>'></asp:TextBox></h4>
                            <h4>货号:<asp:TextBox ID="TextBox3" runat="server" Text='<%#Eval("O_item")%>'></asp:TextBox></h4>
                            <h4>数量:<asp:TextBox ID="TextBox4" runat="server" Text='<%#Eval("O_number")%>'></asp:TextBox></h4>
                        </div>
                        <div class="person">
                            <p>订购人:<asp:TextBox ID="TextBox5" runat="server" Text='<%#Eval("O_orderer")%>'></asp:TextBox></p>
                        </div>
                        <div class="note">
                            <p>备注:<asp:TextBox ID="TextBox6" runat="server" Text='<%#Eval("O_note")%>'></asp:TextBox></p>

                        </div>
                        <div class="clr"></div>
                    </div>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <p>无记录！</p>
                </EmptyDataTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SDSorder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringorder %>" 
                DeleteCommand="DELETE FROM [T_order] WHERE [O_id] = ?" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringorder.ProviderName %>" 
                SelectCommand="SELECT * FROM [T_order] WHERE ([O_delete] = ?) ORDER BY [O_id] DESC" 
                UpdateCommand="UPDATE [T_order] SET [O_ordertime] = ?, [O_orderer] = ?, [O_name] = ?, [O_brand] = ?, [O_item] = ?, [O_number] = ?, [O_price] = ?, [O_company] = ?, [O_buytime] = ?, [O_arrival] = ?, [O_receiver] = ?, [O_note] = ?, [O_delete] = ? WHERE [O_id] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="O_id" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="False" Name="O_delete" Type="Boolean" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="O_ordertime" Type="String" />
                    <asp:Parameter Name="O_orderer" Type="String" />
                    <asp:Parameter Name="O_name" Type="String" />
                    <asp:Parameter Name="O_brand" Type="String" />
                    <asp:Parameter Name="O_item" Type="String" />
                    <asp:Parameter Name="O_number" Type="String" />
                    <asp:Parameter Name="O_price" Type="String" />
                    <asp:Parameter Name="O_company" Type="String" />
                    <asp:Parameter Name="O_buytime" Type="String" />
                    <asp:Parameter Name="O_arrival" Type="String" />
                    <asp:Parameter Name="O_receiver" Type="String" />
                    <asp:Parameter Name="O_note" Type="String" />
                    <asp:Parameter Name="O_delete" Type="Boolean" />
                    <asp:Parameter Name="O_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvorder"></asp:DataPager>
    </div>
    </form>
</body>
</html>
