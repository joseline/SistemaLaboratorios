<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticuloNuevo.ascx.cs" Inherits="Paginas_Articulos_ArticuloNuevo" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

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
    runat="server" 
    ID="VentanaArticuloNuevo" 
    Icon="ApplicationAdd"
    Title="Equipo" 
    Width="450" 
    Height="550" 
    AutoShow="false" 
    Modal="true" 
    Hidden="true"
    Layout="Fit">
    <Items>
    <ext:TabPanel runat="server" Border="false">
        <Items>
        <ext:FormPanel
            runat="server" 
            ID="formaArticulo" 
            Title="Info. Articulo" 
            Icon="NoteEdit"
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
                                Text = "Equipo Nuevo" Height="30"
                                StyleSpec="font-family: Verdana; color: #666666; font-size: large; font-weight: bolder;"/>
                        </Items>
                 </ext:FieldContainer>
                <ext:FieldContainer 
                    runat="server"
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout" 
                    Margin="20">
                    <Items>
                        <ext:TextField 
                            ID = "txtSerie" 
                            Icon="Key" 
                            runat="server" 
                            MsgTarget="Side" 
                            AllowBlank="false" 
                            FieldLabel="Serie" 
                            Width="300" 
                            Margins="0 40 0 0" 
                            Cls="LabelEstilo">
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer  
                runat="server"
                AnchorHorizontal="100%"
                Layout="HBoxLayout" 
                Margin="20">
                    <Items>
                        <ext:TextField 
                            ID = "txtEquipo" 
                            icon="Vcard" 
                            runat="server" 
                            MsgTarget="Side" 
                            AllowBlank="false" 
                            FieldLabel="Equipo" 
                            Width="300" 
                            Margins="0 40 0 0" 
                            Cls="LabelEstilo">
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer 
                runat="server"
                AnchorHorizontal="100%"
                Layout="HBoxLayout" 
                Margin="20">
                <Items>
                    <ext:TextArea 
                        ID = "txtDescripcion" 
                        Icon="CommentAdd" 
                        runat="server" 
                        MsgTarget="Side" 
                        AllowBlank="false" 
                        FieldLabel="Descripcion" 
                        Width="700" 
                        Margins="0 40 0 0" 
                        Cls="LabelEstilo" 
                        Flex="1">
                    </ext:TextArea>
                    
                </Items>
                </ext:FieldContainer>
                <ext:FieldContainer  
                runat="server"
                AnchorHorizontal="100%"
                Layout="HBoxLayout" 
                Margin="20">
                <Items>
                    <ext:SelectBox 
                        ID = "sltMarca" 
                        runat="server"  
                        FieldLabel="Marca" 
                        AnchorHorizontal="100%" 
                        DisplayField="MARCA_NOMBRE" 
                        ValueField="MARCA_ID" 
                        Width="300" 
                        MsgTarget="Side" 
                        AllowBlank="false" 
                        Cls="LabelEstilo">
                    <Store>
                        <ext:Store runat="server">
                            <Model>
                                <ext:Model   runat="server">
                                    <Fields>
                                        <ext:ModelField Name="MARCA_ID">
                                        </ext:ModelField>
                                        <ext:ModelField Name="MARCA_NOMBRE">
                                        </ext:ModelField>
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>
                </ext:SelectBox>
                </Items>
                </ext:FieldContainer>
                <ext:FieldContainer 
                runat="server"
                AnchorHorizontal="100%"
                Layout="HBoxLayout" 
                Margin="20">
                <Items>
                    <ext:TextField 
                        ID = "txtModelo" 
                        runat="server" 
                        MsgTarget="Side" 
                        AllowBlank="false" 
                        FieldLabel="Modelo" 
                        Width="300" 
                        Margins="0 40 0 0" 
                        Cls="LabelEstilo">
                    </ext:TextField>
                </Items>
            </ext:FieldContainer>
                <ext:FieldContainer  
                runat="server"
                AnchorHorizontal="100%"
                Layout="HBoxLayout" 
                Margin="20">
                <Items>
                    <ext:TextField 
                        ID = "txtColor" 
                        runat="server" 
                        MsgTarget="Side" 
                        AllowBlank="false" 
                        FieldLabel="Color" 
                        Width="300" 
                        Margins="0 40 0 0" 
                        Cls="LabelEstilo">
                    </ext:TextField>
                </Items>
            </ext:FieldContainer>
                <ext:FieldContainer    
                runat="server"
                AnchorHorizontal="100%"
                Layout="HBoxLayout" 
                Margin="20">
                <Items>
                    <ext:TextField 
                        ID = "txtMulta" 
                        runat="server" 
                        MsgTarget="Side" 
                        AllowBlank="false" 
                        FieldLabel="Valor de Multa" 
                        Icon="Money" 
                        Width="300" 
                        Margins="0 40 0 0" 
                        Cls="LabelEstilo">
                    </ext:TextField>
                </Items>
                </ext:FieldContainer>
                <ext:FieldContainer  
                runat="server"
                AnchorHorizontal="100%"
                Layout="HBoxLayout" 
                Margin="20">
                <Items>
                    <ext:SelectBox 
                        ID="sltLaboratorio" 
                        runat="server" 
                        FieldLabel = "Laboratorio" 
                        AnchorHorizontal="100%" 
                        DisplayField="LABORATORIO_NOMBRE" 
                        ValueField="LABORATORIO_ID" 
                        MsgTarget="Side" 
                        AllowBlank="false" 
                        Width="300" 
                        Cls="LabelEstilo" Flex="1">
                     <store>
                        <ext:Store  runat="server">
                            <Model>
                                <ext:Model  runat="server">
                                    <Fields>
                                        <ext:ModelField Name="LABORATORIO_ID">
                                        </ext:ModelField>
                                        <ext:ModelField Name="LABORATORIO_NOMBRE">
                                        </ext:ModelField>
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </store>
                    </ext:SelectBox>
                </Items>
                </ext:FieldContainer>
            </Items>
            <Buttons>
                <ext:Button runat="server" ID="btnNuevo" Text="Nuevo" Icon="Add">
                </ext:Button>
                <ext:Button runat="server" ID="btnGuardarArticuloNuevo" Text="Guardar" Icon="DiskBlack">
                    <DirectEvents>
                        <Click 
                            OnEvent="btnGuardarNuevoArticulo" 
                            Failure="Ext.MessageBox.alert('Error al guardar', 'Error al guardar');">
                        </Click>
                    </DirectEvents>
                </ext:Button>
                <ext:Button ID="btnCancelArticuloNuevo" runat="server" Text="Cancelar" Icon="Cancel">
                    <Listeners>
                        <Click Handler="this.up('window').hide();" />
                    </Listeners>
                </ext:Button>
            </Buttons>
        </ext:FormPanel>
        </Items>
        </ext:TabPanel>
    </Items>
 </ext:Window>