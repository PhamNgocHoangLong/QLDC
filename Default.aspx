<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="QLDC._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        quan ly dan cu
    </title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>danh sach dan cu</h2>
        </div>
        <div class="row" style="margin-top: 20px;">
            <div class="col-sm-8">
                <asp:GridView ID="gvDanCu" runat="server" AutoGenerateColumns="False" AllowSorting="True" 
                    DataKeyNames="ID"
                    CssClass="table table-striped table-bordered table-condensed" BorderColor="Silver"
                    OnRowDeleting="gvDanCu_RowDeleting1"
                    OnRowCommand="gvDanCu_RowCommand"
                    EmptyDataText="Không có dữ liệu trong nhóm">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="25px" />
                            <ItemStyle HorizontalAlign="Left" Font-Bold="true" />
                        </asp:TemplateField>                        
                        <asp:BoundField DataField="HoTen" HeaderText="Họ và Tên">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="soCCCD" HeaderText="số căn cước công dân">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DiaChi" HeaderText="địa chỉ">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <%-- Update Company --%>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbChitietSanpham" runat="server" CommandArgument='<%# Eval("ID") %>'
                                    CommandName="updateDanCu" Text="upd" CausesValidation="false"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:TemplateField>
                        <%-- Delete Sanpham --%>
                        <asp:TemplateField>
                            <ItemTemplate>
                                 <asp:LinkButton ID="lbXoaSanpham" Text="Xóa" runat="server"
                                          OnClientClick="return confirm('Bạn chắc chắn muốn xóa sản phẩm này?');" CommandName="Delete" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                         </asp:TemplateField> 
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </form>
</body>
</html>
