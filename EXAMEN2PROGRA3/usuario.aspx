<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="usuario.aspx.cs" Inherits="EXAMEN2PROGRA3.usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <h1>&nbsp;</h1>
        <h1>Página de Usuarios </h1>
        <p>&nbsp;</p>
    </div>
    <div>
        <br />
        <br />
        <asp:GridView runat="server" ID="datagrid" HorizontalAlign="Center"
            CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
            RowStyle-CssClass="rows" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" >

            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
<HeaderStyle CssClass="header" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

<PagerStyle CssClass="pager" BackColor="#284775" ForeColor="White" HorizontalAlign="Center"></PagerStyle>

<RowStyle CssClass="rows" BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <br />
        <br />
        <br />

    </div>
    <div class="container text-center">
        Usuario ID: <asp:TextBox ID="tid" class="form-control" runat="server"></asp:TextBox>
        <br />
        Nombre: <asp:TextBox ID="tnombre" class="form-control" runat="server"></asp:TextBox>
        <br />
        Correo Eléctronico: <asp:TextBox ID="tcorreo" class="form-control" runat="server"></asp:TextBox>
        <br />
        Teléfono: <asp:TextBox ID="ttelefono" class="form-control" runat="server"></asp:TextBox>
    </div>
    <div class="container text-center">

        <br />
        <br />

        <asp:Button ID="Button1" class="btn btn-outline-info" runat="server" Text="Agregar" OnClick="Button1_Click" />
        <asp:Button ID="Button2" class="btn btn-outline-danger" runat="server" Text="Borrar" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" class="btn btn-outline-primary" Text="Modificar" OnClick="Button3_Click" />
        <asp:Button ID="Bconsulta" runat="server" class="btn btn-outline-warning" Text="Consultar" />
        

        <br />
        <br />
        <br />
        

    </div>
</asp:Content>
