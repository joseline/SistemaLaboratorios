<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AlumnoNuevo.ascx.cs" Inherits="Paginas_AlumnoNuevo" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<%--<ext:Store 
    ID="stAlumnoNuevo" 
    runat="server">
        <Model>
            <ext:Model runat="server">
                <Fields>
                    <ext:ModelField Name="ALUMNO_ID"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_CUENTA"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_NOMBRE"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_TELEFONO"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_CORREO"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_CARRERA_ID"></ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
</ext:Store>--%>

<style type="text/css">
    .LabelEstilo
        {
            font-family: Verdana;
            color: Gray;
            font-weight: bold;
            font-size: medium;
        }
</style>
<ext:Window 
    ID="AlumnoVentanaNuevo" 
    runat="server" 
    Icon="User" 
    Title="Alumno" 
    Width="400" 
    Height="400" 
    AutoShow="false" 
    Modal="true" 
    Hidden="true"
    Layout="Fit">
    <Items>
        <ext:FormPanel 
            runat="server" 
            ID="fpAlumnoNuevo" 
            Title="Informacion" 
            Icon="UserEdit"
            DefaultAnchor="100%"
            BodyPadding="5" 
            BodyStyle="background-color: #CCCCCC; background-image: url('../../img/grey.png'); background-repeat: repeat;">
            <Items>
                <ext:FieldContainer   
                        runat="server"
                        AnchorHorizontal="100%"
                        Layout="HBoxLayout" 
                        Margin="20">
                        <Items>
                            <ext:Label  
                                runat="server" 
                                Text = "Alumno Nuevo" Height="30"
                                StyleSpec="font-family: Verdana; color: #666666; font-size: large; font-weight: bolder;"/>
                        </Items>
                </ext:FieldContainer>
                <ext:TextField 
                    ID = "txtCuenta" 
                    runat="server" 
                    Icon="Key" 
                    MsgTarget="Side" 
                    AllowBlank="false" 
                    FieldLabel="Cuenta" Width="300" 
                    Margins="0 40 0 0" 
                    Cls="LabelEstilo">
                </ext:TextField>
                <ext:TextField 
                    ID = "txtNombre" 
                    runat="server" 
                    Icon="Vcard" 
                    MsgTarget="Side" 
                    AllowBlank="false" 
                    FieldLabel="Nombre" 
                    Width="300" 
                    Margins="0 40 0 0" 
                    Cls="LabelEstilo" 
                    Flex="1">
                </ext:TextField>
                <ext:SelectBox 
                    ID="sltCarrera" 
                    runat="server" 
                    DisplayField="CARRERA_NOMBRE" 
                    ValueField="CARRERA_ID" 
                    FieldLabel="Carrera" 
                    Icon="Book" 
                    MsgTarget="Side" 
                    AllowBlank="false" 
                    Width="300" 
                    Margins="0 40 0 0" 
                    Cls="LabelEstilo">
                    <Store>
                        <ext:Store runat="server">
                            <Model>
                                <ext:Model runat="server">
                                    <Fields>
                                        <ext:ModelField Name="CARRERA_ID"></ext:ModelField>
                                        <ext:ModelField Name="CARRERA_NOMBRE"></ext:ModelField>
                                    </Fields>
                                </ext:Model>  
                            </Model>
                        </ext:Store>
                    </Store>
                    </ext:SelectBox>
                <ext:TextField 
                    ID = "txtTelefono" 
                    runat="server"  
                    Icon="Phone" 
                    MsgTarget="Side" 
                    AllowBlank="false" 
                    FieldLabel="Telefono" 
                    Width="300" 
                    Margins="0 40 0 0" 
                    Cls="LabelEstilo">
                </ext:TextField>
                <ext:TextField 
                    ID = "txtCorreo" 
                    runat="server"  
                    Icon="Mail" 
                    MsgTarget="Side" 
                    AllowBlank="false" 
                    FieldLabel="Correo" 
                    Width="300" Margins="0 40 0 0" 
                    Cls="LabelEstilo">
                </ext:TextField>
            </Items>
            <BottomBar>
                <ext:Toolbar runat="server">
                    <Items>
                        <ext:ToolbarFill runat="server"/>
                        
                        <ext:Button runat="server" ID="btnNuevoAlumno" Text="Nuevo" Icon="Add">
                            <Listeners>
                                <Click Handler="this.up('form').getForm().reset();"/>
                            </Listeners>
                        </ext:Button>
                        <ext:Button runat="server" ID="btnGuardarAlumnoNuevo" Text="Guardar" Icon="DiskBlack">
                        <DirectEvents>
                            <Click 
                            OnEvent="btnGuardarNuevoAlumno" 
                            Failure="Ext.MessageBox.alert('Error al guardar', 'Error al guardar');">
                            </Click>
                        </DirectEvents>
                        </ext:Button>
                        <ext:Button ID="btnCancelAlumnoNuevo" runat="server" Text="Cancelar" Icon="Cancel">
                        <Listeners>
                            <Click Handler="this.up('window').hide();" />
                        </Listeners>
                        </ext:Button>
                    </Items>
                </ext:Toolbar>
            </BottomBar>
        </ext:FormPanel>
    </Items>
</ext:Window>
<%--<ext:Window 
    runat="server" 
    ID="AlumnoVentanaNuevo" 
    Title="Agregar" 
    Width="400" 
    Height="400" 
    AutoShow="false" 
    Modal="true" 
    Hidden="true"
    Layout="Fit">
    <Items>
        <ext:FormPanel 
            runat="server" 
            ID="formaAlumnoNuevo" 
            Title="Alumno" 
            Icon="UserAdd"
            DefaultAnchor="100%"
            BodyPadding="5">
            <Items>
                <ext:TextField ID = "txtCuenta" runat="server"  Name="ALUMNO_CUENTA" Icon="Key" MsgTarget="Side" AllowBlank="false" FieldLabel="Cuenta" Width="300" Margins="0 40 0 0" LabelStyle="font-family:Candara;color:black;font-weight:bold;font-size:medium;">
                </ext:TextField>
                <ext:TextField ID = "txtNombre" runat="server" Name="ALUMNO_NOMBRE" Icon="Vcard" MsgTarget="Side" AllowBlank="false" FieldLabel="Nombre" Width="300" Margins="0 40 0 0" LabelStyle="font-family:Candara;color:black;font-weight:bold;font-size:medium;" Flex="1">
                </ext:TextField>
                <ext:SelectBox ID="sltCarrera" runat="server" Name="ALUMNO_CARRERA_ID" DisplayField="CARRERA_NOMBRE" ValueField="CARRERA_ID" FieldLabel="Carrera" Icon="Book" MsgTarget="Side" AllowBlank="false" Width="300" Margins="0 40 0 0" LabelStyle="font-family:Candara;color:black;font-weight:bold;font-size:medium;">
                    <Store>
                        <ext:Store runat="server">
                            <Model>
                                <ext:Model  runat="server">
                                    <Fields>
                                        <ext:ModelField Name="CARRERA_ID"></ext:ModelField>
                                        <ext:ModelField Name="CARRERA_NOMBRE"></ext:ModelField>
                                    </Fields>
                                </ext:Model>  
                            </Model>
                        </ext:Store>
                    </Store>
                    </ext:SelectBox>
                <ext:TextField ID = "txtTelefono" runat="server" Name="ALUMNO_TELEFONO" Icon="Phone" MsgTarget="Side" AllowBlank="false" FieldLabel="Telefono" Width="300" Margins="0 40 0 0" LabelStyle="font-family:Candara;color:black;font-weight:bold;font-size:medium;">
                </ext:TextField>
                <ext:TextField ID = "txtCorreo" runat="server" Name="ALUMNO_CORREO" Icon="Mail" MsgTarget="Side" AllowBlank="false" FieldLabel="Correo" Width="300" Margins="0 40 0 0" LabelStyle="font-family:Candara;color:black;font-weight:bold;font-size:medium;">
                </ext:TextField>
            </Items>
            
           <Buttons>
            <ext:Button runat="server" ID="btnGuardarAlumnoNuevo" Text="Guardar" Icon="Disk">
                <DirectEvents>
                    <Click 
                        OnEvent="btnGuardarNuevoAlumno" 
                        Failure="Ext.MessageBox.alert('Error al guardar', 'Error al guardar');">
                    </Click>
                </DirectEvents>
            </ext:Button>
            
            <ext:Button ID="btnCancelAlumnoNuevo" runat="server" Text="Cancelar" Icon="Cancel">
            <Listeners>
                <Click Handler="this.up('window').hide();" />
            </Listeners>
            </ext:Button>
             </Buttons>
        </ext:FormPanel>
    </Items>
</ext:Window>--%>