<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="tecnico.aspx.cs" Inherits="EXAMEN2PROGRA3.tecnico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
       <h1>&nbsp;</h1>
        <h1>Página de Tecnicos </h1>
       <p>&nbsp;</p>
   </div>
   <div>
       <br />
       <br />
       <asp:GridView runat="server" ID="datagrid" HorizontalAlign="Center"
           CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
           RowStyle-CssClass="rows" AllowPaging="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" >

           <FooterStyle BackColor="White" ForeColor="#333333" />
<HeaderStyle CssClass="header" BackColor="#336666" Font-Bold="True" ForeColor="White"></HeaderStyle>

<PagerStyle CssClass="pager" BackColor="#336666" ForeColor="White" HorizontalAlign="Center"></PagerStyle>

<RowStyle CssClass="rows" BackColor="White" ForeColor="#333333"></RowStyle>
           <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
           <SortedAscendingCellStyle BackColor="#F7F7F7" />
           <SortedAscendingHeaderStyle BackColor="#487575" />
           <SortedDescendingCellStyle BackColor="#E5E5E5" />
           <SortedDescendingHeaderStyle BackColor="#275353" />
       </asp:GridView>

       <br />
       <br />
       <br />

   </div>
   <div class="container text-center">
       Técnico ID: <asp:TextBox ID="tid" class="form-control" runat="server"></asp:TextBox>
       <br />
       Nombre: <asp:TextBox ID="tnombre" class="form-control" runat="server"></asp:TextBox>
       <br />
       Especialidad: <asp:TextBox ID="tespecialidad" class="form-control" runat="server"></asp:TextBox>
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
