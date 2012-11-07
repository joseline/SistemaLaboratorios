<%@ Page Title="" Language="C#" MasterPageFile="~/LoginPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/styles.css" rel="Stylesheet" type="text/css" media="all"/>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    
    <ext:FormPanel 
        ID="fpLogin" 
        runat="server" 
        Height="150" 
        Width="280" 
        Title="Iniciar Sesion" 
        Icon="User" 
        LabelSeparator="-" 
        LabelWidth="55"
        Layout="AnchorLayout" 
        BodyPadding="5" 
        MonitorResize="true" 
        Margin="15" 
        Shadow="true" 
        ShadowMode="Sides" Cls="formColor">  
        <Items>
            <ext:TextField ID="txtUsuario" runat="server" FieldLabel="Usuario" Cls="Text" LabelStyle="Text">
            </ext:TextField>
            <ext:TextField ID="txtContrasenia" runat="server" FieldLabel="Contrasena" Cls="Text" LabelStyle="Text">
            </ext:TextField>
        </Items>
        
        <Buttons>
          <ext:Button ID = "btnAceptar" CommandName="Login" runat="server" Text="Aceptar" Icon="LockOpen" OnDirectClick="btnAceptarClick">
          </ext:Button>
          <ext:Button ID = "btnCancelar" runat="server" Text="Cancelar" Icon="Cancel" OnDirectClick="btnCancelarClick">
          </ext:Button>
        </Buttons>         
    </ext:FormPanel>
    
    <%--<ext:FieldSet ID="FieldLogin" runat="server">
        <Items>
            <ext:TextField ID="Usuario" runat="server" FieldLabel="Usuario">
            </ext:TextField>
        </Items>
    </ext:FieldSet>--%>
</asp:Content>

