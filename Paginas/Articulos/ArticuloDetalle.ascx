<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticuloDetalle.ascx.cs" Inherits="Paginas_Articulos_ArticuloDetalle" %>

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

<ext:Store 
    ID="stArticuloDetalle" 
    runat="server" 
    PageSize="1">
    <Model>
        <ext:Model ID="Model1" runat="server">
            <Fields>
                <ext:ModelField Name="ARTICULO_ID"></ext:ModelField>
                <ext:ModelField Name="ARTICULO_SERIE"></ext:ModelField>
                <ext:ModelField Name="ARTICULO_NOMBRE"></ext:ModelField>
                <ext:ModelField Name="ARTICULO_DESCRIPCION"></ext:ModelField>
                <ext:ModelField Name="ARTICULO_MARCA_ID"></ext:ModelField>
                <ext:ModelField Name="ARTICULO_MODELO"></ext:ModelField>
                <ext:ModelField Name="ARTICULO_COLOR"></ext:ModelField>
                <ext:ModelField Name="ARTICULO_LABORATORIO_ID"></ext:ModelField>
                <ext:ModelField Name="ARTICULO_MULTA"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
    <Listeners>
        <DataChanged Handler="var record = this.getAt(0) || {};#{formaArticulo}.getForm().loadRecord(record);#{formaArticulo}.clearInvalid();">
        </DataChanged>
    </Listeners>
 </ext:Store>
<ext:Store 
    ID="stArticuloMarcaDetalle" 
    runat="server">
    <Model>
        <ext:Model  runat="server">
            <Fields>
                <ext:ModelField Name="MARCA_ID"></ext:ModelField>
                <ext:ModelField Name="MARCA_NOMBRE"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
 </ext:Store>
<ext:Store 
    ID="stArticuloLaboratorioDetalle" 
    runat="server">
    <Model>
        <ext:Model runat="server">
            <Fields>
                <ext:ModelField Name="LABORTATORIO_ID"></ext:ModelField>
                <ext:ModelField Name="LABORATORIO_NOMBRE"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
 </ext:Store>
 
<ext:Window
    runat="server" 
    ID="ArticuloVentana" 
    Icon="Box" 
    Title="Informacion" 
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
            Title="Equipo" 
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
                            <ext:Label ID="Label1" 
                                runat="server" 
                                Text = "Editar Equipo" Height="30"
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
                            runat="server" 
                            Name="ARTICULO_SERIE" 
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
                            runat="server" 
                            Name="ARTICULO_NOMBRE" 
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
                        runat="server" 
                        Name="ARTICULO_DESCRIPCION" 
                        MsgTarget="Side" 
                        AllowBlank="false" 
                        FieldLabel="Descripcion" 
                        Width="700" 
                        Margins="0 40 0 0" 
                        Cls="LabelEstilo" Flex="1">
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
                        Name="ARTICULO_MARCA_ID" 
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
                                <ext:Model  runat="server">
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
                        Name="ARTICULO_MODELO" 
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
                        Name="ARTICULO_COLOR" 
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
                        Name="ARTICULO_MULTA" 
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
                        Name="ARTICULO_LABORATORIO_ID" 
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
                                <ext:Model runat="server">
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
                <ext:Button runat="server" ID="btnGuardar" Text="Guardar" Icon="DiskBlack">
                 <DirectEvents>
                    <Click 
                        OnEvent="btnGuardarDetalleArticulo" 
                        Failure="Ext.MessageBox.alert('Error al guardar', 'Error al guardar');">
                    </Click>
                </DirectEvents>
               </ext:Button>
            
            <ext:Button ID="btnCancel" runat="server" Text="Cancelar" Icon="Cancel">
            <Listeners>
                <Click Handler="this.up('window').hide();" />
            </Listeners>
            </ext:Button>
             </Buttons>
           <BottomBar>
            <ext:PagingToolbar ID="pgDetalle" StoreID="stArticuloDetalle" runat="server" DisplayInfo="false" Visible="false">
            </ext:PagingToolbar>
           </BottomBar>
        </ext:FormPanel>
        <ext:FormPanel 
            ID="formaPrestamosRealizados" 
            runat="server" 
            Title="Prestamos Realizados" 
            Icon="NoteEdit"
            DefaultAnchor="100%"
            BodyPadding="5" 
            BodyStyle="background-color: #CCCCCC; background-image: url('../../img/grey.png'); background-repeat: repeat;">
            <Items>
                <ext:GridPanel 
                    ID="gpPrestamosRealizados" 
                    runat="server">
                </ext:GridPanel>
            </Items>
        </ext:FormPanel>
        <ext:FormPanel 
            ID="formaMantenimientosRealizados" 
            runat="server" 
            Title="Mantenimientos Realizados">
            <Items>
                <ext:GridPanel 
                    ID="gpMantenimientosRealizados" 
                    runat="server">
                    <ColumnModel>
                        <Columns>
                            <ext:DateColumn runat="server" Text="Fecha">
                            </ext:DateColumn>
                            <ext:Column runat="server" Text="Responsable">
                            </ext:Column>
                            <ext:Column runat="server" Text="Danio">
                            </ext:Column>
                            <ext:Column runat="server" Text="Tipo">
                            </ext:Column>
                            <ext:Column runat="server" Text="Accion Realizada">
                            </ext:Column>
                            <ext:Column runat="server" Text="Repuestos">
                            </ext:Column>
                        </Columns>
                    </ColumnModel>
                </ext:GridPanel>
            </Items>
        </ext:FormPanel>
        </Items>
        </ext:TabPanel>
    </Items>
 </ext:Window>