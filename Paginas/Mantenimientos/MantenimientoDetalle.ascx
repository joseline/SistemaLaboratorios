<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MantenimientoDetalle.ascx.cs" Inherits="Paginas_Mantenimientos_MantenimientoDetalle" %>
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
    ID="stMantenimientosDetalle" 
    runat="server" 
    PageSize="1">
    <Model>
        <ext:Model runat="server" IDProperty="MANTENIMIENTO_ID">
            <Fields>
                <ext:ModelField Name="MANTENIMIENTO_ID"></ext:ModelField>
                <ext:ModelField Name="MANTENIMIENTO_ARTICULO_ID"></ext:ModelField>
                <ext:ModelField Name="MANTENIMIENTO_MARCA_ID"></ext:ModelField>
                <ext:ModelField Name="MANTENIMIENTO_FECHA" Type="Date"></ext:ModelField>
                <ext:ModelField Name="MANTENIMIENTO_USUARIO_ID_RESPONSABLE"></ext:ModelField>
                <ext:ModelField Name="MANTENIMIENTO_FALLA"></ext:ModelField>
                <ext:ModelField Name="MANTENIMIENTO_ACCION"></ext:ModelField>
                <ext:ModelField Name="MANTENIMIENTO_REPUESTOS"></ext:ModelField>
                <ext:ModelField Name="MANTENIMIENTO_TIPO"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
    <Listeners>
        <DataChanged
            Handler="var record = this.getAt(0) || {};#{formaMantenimiento}.getForm().loadRecord(record);#{formaMantenimiento}.clearInvalid();">
        </DataChanged>
    </Listeners>
</ext:Store>

<ext:Store 
    ID="stMantenimientoUsuarioDetalle" 
    runat="server">
    <Model>
        <ext:Model runat="server" IDProperty= "USUARIO_ID">
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
<ext:Store ID="stMantenimientoArticuloDetalle" runat="server">
    <Model>
        <ext:Model   runat="server" IDProperty = "ARTICULO_ID">
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
    ID="stMantenimientoMarcaDetalle" 
    runat="server">
    <Model>
        <ext:Model  runat ="server" IDProperty="MARCA_ID">
            <Fields>
            <ext:ModelField Name="MARCA_ID"></ext:ModelField>
            <ext:ModelField Name="MARCA_NOMBRE"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
</ext:Store>
<ext:Window 
    ID="VentanaMantenimientoDetalle" 
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
                    ID = "formaMantenimiento" 
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
                                Text = "Editar Mantenimiento" Height="30"
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
                                StoreID="stMantenimientoMarcaDetalle" 
                                Name="MANTENIMIENTO_MARCA_ID"   
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
                                StoreID="stMantenimientoArticuloDetalle"   
                                Name="MANTENIMIENTO_ARTICULO_ID" 
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
                                    Name="MANTENIMIENTO_FECHA"   
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
                                    Name="MANTENIMIENTO_TIPO"    
                                    MsgTarget="Side" 
                                    AllowBlank="false" 
                                    FieldLabel= "Tipo Mantenimiento" 
                                    Width="300" 
                                    DisplayField="MANT_NOMBRE" 
                                    ValueField="MANT_ID" 
                                    Cls="LabelEstilo">
                                <Store>
                                    <ext:Store ID="Store1"  runat="server">
                                    <Model>
                                        <ext:Model ID="Model1"  runat="server">
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
                                    StoreID="stMantenimientoUsuarioDetalle"  
                                    Name="MANTENIMIENTO_USUARIO_ID_RESPONSABLE"   
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
                                Name="MANTENIMIENTO_FALLA"  
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
                                    Name="MANTENIMIENTO_ACCION"   
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
                                    Name="MANTENIMIENTO_REPUESTOS"  
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
                        <ext:Button runat="server" ID="btnGuardarMantenimientoDetalle" Text="Guardar" Icon="Disk">
                            <DirectEvents>
                            <Click 
                                OnEvent="btnGuardarDetalleMantenimiento" 
                                Failure="Ext.MessageBox.alert('Error al guardar', 'Error al guardar');">
                                <ExtraParams>
                                    <ext:Parameter Name="id" Value= "record.data.MANTENIMIENTO_ID" Mode="Raw">
                                    </ext:Parameter>
                                </ExtraParams>
                            </Click>
                            </DirectEvents>
                        </ext:Button>
                        <ext:Button ID="btnCancelArticuloNuevo" runat="server" Text="Cancelar" Icon="Cancel">
                            <Listeners>
                                <Click Handler="this.up('window').hide();" />
                            </Listeners>
                        </ext:Button>
                </Buttons>
                <BottomBar>
                  <ext:PagingToolbar ID="pgMant" runat="server" StoreID="stMantenimientosDetalle"  DisplayInfo="false" Visible="false">
                  </ext:PagingToolbar>
                </BottomBar>
                </ext:FormPanel>
            </Items>
        </ext:TabPanel>
    </Items>
</ext:Window>