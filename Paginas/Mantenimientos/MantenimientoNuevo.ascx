<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MantenimientoNuevo.ascx.cs" Inherits="Paginas_Mantenimientos_MantenimientoNuevo" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<style type="text/css">
        .cbStates-list {
            width : 320px;
            font  : 11px tahoma,arial,helvetica,sans-serif;
        }
        .LabelEstilo
        {
            font-family: Verdana;
            color: Gray;
            font-weight: bold;
            font-size: medium;
        }
    </style>

 <ext:Store 
    ID="stMantenimientoUsuarioNuevo" 
    runat="server">
    <Model>
        <ext:Model  runat="server" IDProperty= "USUARIO_ID">
            <Fields>
                <ext:ModelField Name = "USUARIO_ID"></ext:ModelField>
                <ext:ModelField Name = "USUARIO_NICK"></ext:ModelField>
                <ext:ModelField Name = "USUARIO_CONTRASENA"></ext:ModelField>
                <ext:ModelField Name = "USUARIO_ACTIVO"></ext:ModelField>
                <ext:ModelField Name = "USUARIO_NOMBRE"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
    </ext:Store>
 <ext:Store ID="stMantenimientoArticuloNuevo" runat="server">
    <Model>
        <ext:Model  runat="server" IDProperty = "ARTICULO_ID">
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
</ext:Store>
<ext:Store 
    ID="stMantenimientoMarcaNuevo" 
    runat="server">
    <Model>
        <ext:Model runat ="server">
            <Fields>
            <ext:ModelField Name="MARCA_ID"></ext:ModelField>
            <ext:ModelField Name="MARCA_NOMBRE"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
</ext:Store>

 <ext:Window 
    ID="VentanaMantenimientoNuevo"  
    runat="server"
    Icon="ApplicationAdd"
    Title="Equipo" 
    Width="800" 
    Height="550" 
    AutoShow="false" 
    Modal="true" 
    Hidden="true"
    Layout="Fit">
    <Items>
        <ext:TabPanel runat="server">
            <Items>
                <ext:FormPanel 
                    ID="formaMantenimiento" 
                    runat="server"
                    Title="Info. Mantenimiento" 
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
                                Text = "Mantenimiento Nuevo" Height="30"
                                StyleSpec="font-family: Verdana; color: #666666; font-size: large; font-weight: bolder;"/>
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
                                StoreID="stMantenimientoMarcaNuevo" 
                                MsgTarget="Side" 
                                AllowBlank="false" 
                                FieldLabel="Marca" 
                                Width="300" 
                                Margins="0 40 0 0" 
                                Cls="LabelEstilo" 
                                DisplayField="MARCA_NOMBRE" 
                                ValueField="MARCA_ID">
                            </ext:SelectBox>

                            <ext:ComboBox 
                                ID="cmbSerie" 
                                runat="server" 
                                StoreID="stMantenimientoArticuloNuevo" 
                                MsgTarget="Side" 
                                AllowBlank="false" 
                                FieldLabel="     Serie" 
                                Width="300" 
                                Flex="1" 
                                Cls="LabelEstilo" 
                                ValueField="ARTICULO_ID" 
                                DisplayField="ARTICULO_SERIE" 
                                EmptyText="Selecione una marca">
                                <ListConfig Width="320" Height="300" Flex="1" ItemSelector=".x-boundlist-item">
                                    <Tpl ID="Tpl1" runat="server">
                                    <Html>
					                    <tpl for=".">
						                <tpl if="[xindex] == 1">
							            <table class="cbStates-list">
								        <tr>
									    <th>Serie</th>
									    <th>Equipo</th>
								        </tr>
						                </tpl>
						                <tr class="x-boundlist-item">
							            <td>{ARTICULO_SERIE}</td>
							            <td>{ARTICULO_NOMBRE}</td>
						                </tr>
						                <tpl if="[xcount-xindex]==0">
							            </table>
						                </tpl>
					                    </tpl>
				                        </Html>
                                        </Tpl>
                                        </ListConfig>
                                </ext:ComboBox>
                            </Items>
                         </ext:FieldContainer>
                        <ext:FieldContainer 
                            runat="server"
                            AnchorHorizontal="100%"
                            Layout="HBoxLayout" 
                            Margin="20">
                            <Items>
                                <ext:DateField 
                                    ID="dteFecha" 
                                    runat ="server" 
                                    MsgTarget="Side" 
                                    AllowBlank="false" 
                                    FieldLabel="Fecha" 
                                    Icon="Date" 
                                    Width="300" 
                                    Cls="LabelEstilo" 
                                    Margins="0 40 0 0">
                                 </ext:DateField>
                                 <ext:SelectBox 
                                    ID="sltTipoMantenimiento" 
                                    runat="server"  
                                    MsgTarget="Side" 
                                    AllowBlank="false" 
                                    FieldLabel= "Tipo Mantenimiento" 
                                    Width="300" 
                                    DisplayField="MANT_NOMBRE" 
                                    ValueField="MANT_ID" 
                                    Cls="LabelEstilo">
                                    <Store>
                                    <ext:Store ID="Store1" runat="server">
                                    <Model>
                                        <ext:Model ID="Model1" runat="server">
                                            <Fields>
                                            <ext:ModelField Name="MANT_ID"></ext:ModelField>
                                            <ext:ModelField Name="MANT_NOMBRE"></ext:ModelField>
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
                                <ext:SelectBox  
                                    ID = "sltResponsable" 
                                    runat="server" 
                                    StoreID="stMantenimientoUsuarioNuevo"  
                                    DisplayField="USUARIO_NOMBRE" 
                                    ValueField="USUARIO_ID" 
                                    MsgTarget="Side" 
                                    AllowBlank="false"   
                                    FieldLabel="Responsable" 
                                    Width="300" 
                                    Icon="User" 
                                    Cls="LabelEstilo">
                                </ext:SelectBox>
                            </Items>
                        </ext:FieldContainer>
                        <ext:FieldContainer 
                            runat="server"
                            AnchorHorizontal="100%"
                            Layout="HBoxLayout" 
                            Margin="20">
                            <Items>
                            <ext:TextArea 
                                ID = "txtFalla" 
                                runat="server"  
                                MsgTarget="Side" 
                                AllowBlank="false"  
                                FieldLabel="Daño/Falla" 
                                Width="700" 
                                Cls="LabelEstilo">
                            </ext:TextArea>
                            </Items>
                        </ext:FieldContainer>
                        <ext:FieldContainer
                            runat="server"
                            AnchorHorizontal="100%"
                            Layout="HBoxLayout" 
                            Margin="20">
                            <Items>
                                <ext:TextArea 
                                    ID = "txtAccion" 
                                    runat="server" 
                                    MsgTarget="Side" 
                                    AllowBlank="false"  
                                    FieldLabel="Accion Realizada" 
                                    Width="700" 
                                    Cls="LabelEstilo">
                                </ext:TextArea>
                            </Items>
                        </ext:FieldContainer>
                        <ext:FieldContainer 
                            runat="server"
                            AnchorHorizontal="100%"
                            Layout="HBoxLayout" 
                            Margin="20">
                            <Items>
                                <ext:TextArea 
                                    ID = "txtRepuestos" 
                                    runat="server" 
                                    MsgTarget="Side" 
                                    AllowBlank="false"  
                                    FieldLabel="Repuestos" 
                                    Width="700" 
                                    Cls="LabelEstilo">
                                </ext:TextArea>
                            </Items>
                        </ext:FieldContainer>
                  </Items>
                  <Buttons>
                            <ext:Button runat="server" ID="btnNuevo" Text="Nuevo" Icon="Add">
                            </ext:Button>
                            <ext:Button runat="server" ID="btnGuardarMantenimientoNuevo" Text="Guardar" Icon="DiskBlack">
                            <DirectEvents>
                            <Click 
                                OnEvent="btnGuardarNuevoMantenimiento" 
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