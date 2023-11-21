<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="equipo.aspx.cs" Inherits="EXAMEN2PROGRA3.equipo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
       <h1>&nbsp;</h1>
       <h1>Página de Equipos </h1>
       <p>&nbsp;</p>
   </div>
   <div>
       <br />
       <br />
       <asp:GridView runat="server" ID="datagrid" HorizontalAlign="Center"
           CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
           RowStyle-CssClass="rows" AllowPaging="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" >

           <AlternatingRowStyle BackColor="#F7F7F7" />
           <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
<HeaderStyle CssClass="header" BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7"></HeaderStyle>

<PagerStyle CssClass="pager" BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right"></PagerStyle>

<RowStyle CssClass="rows" BackColor="#E7E7FF" ForeColor="#4A3C8C"></RowStyle>
           <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
           <SortedAscendingCellStyle BackColor="#F4F4FD" />
           <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
           <SortedDescendingCellStyle BackColor="#D8D8F0" />
           <SortedDescendingHeaderStyle BackColor="#3E3277" />
       </asp:GridView>

       <br />
       <br />
       <br />

   </div>
   <div class="container text-center">
       Equipo ID: <asp:TextBox ID="tid" class="form-control" runat="server"></asp:TextBox>
       <br />
       Tipo Equipo: <asp:TextBox ID="ttipo" class="form-control" runat="server"></asp:TextBox>
       <br />
       Modelo: <asp:TextBox ID="tmodelo" class="form-control" runat="server"></asp:TextBox>
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
