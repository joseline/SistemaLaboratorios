<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CalibracionNuevo.ascx.cs" Inherits="Paginas_Calibraciones_CalibracionNuevo" %>
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

<ext:Store ID ="stCalibracionNueva" 
runat="server">
<Model>
    <ext:Model runat="server">
        <Fields>
                <ext:ModelField Name="CALIBRACION_ID"></ext:ModelField>
                <ext:ModelField Name="CALIBRACION_ARTICULO_ID"></ext:ModelField>
                <ext:ModelField Name="CALIBRACION_MARCA_ID"></ext:ModelField>
                <ext:ModelField Name="CALIBRACION_FECHA" Type="Date"></ext:ModelField>
                <ext:ModelField Name="CALIBRACION_USUARIO_ID_RESPONSABLE"></ext:ModelField>
                <ext:ModelField Name="CALIBRACION_UNIDADESMEDICION"></ext:ModelField>
                <ext:ModelField Name="CALIBRACION_EINSTRUMENTAL"></ext:ModelField>
                <ext:ModelField Name="CALIBRACION_EESTADISTICO"></ext:ModelField>
                <ext:ModelField Name="CALIBRACION_VALORPATRON"></ext:ModelField>
                <ext:ModelField Name="CALIBRACION_VALORMEDIDO"></ext:ModelField>
                <ext:ModelField Name="CALIBRACION_ESTADO"></ext:ModelField>
                <ext:ModelField Name="CALIBRACION_OBSERVACIONES"></ext:ModelField>
        </Fields>
    </ext:Model>
</Model>
</ext:Store>
<ext:Window 
    ID="VentanaCaliNueva" 
    runat="server" 
    Icon="ApplicationAdd"
    Title="Equipo" 
    Width="800" 
    Height="570" 
    AutoShow="false" 
    Modal="true" 
    Hidden="true"
    Layout="Fit">
    <Items>
        <ext:TabPanel 
        runat="server">
        <Items>
            <ext:FormPanel 
                    ID = "formaCalibracion" 
                    runat="server" 
                    Title="Info. Calibracion"
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
                          <ext:SelectBox 
                            ID="sltMarca" 
                            runat ="server"  
                            FieldLabel = "Marca" 
                            AnchorHorizontal = "100%" 
                            DisplayField="MARCA_NOMBRE" 
                            ValueField="MARCA_ID" 
                            Cls="LabelEstilo" 
                            Width="300">
                            <Store>
                                <ext:Store   runat="server">
                                <Model>
                                    <ext:Model runat ="server">
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
                                <ext:ComboBox 
                                    ID="cmbSerie" 
                                    runat="server"  
                                    MsgTarget="Side" 
                                    AllowBlank="false" 
                                    FieldLabel="     Serie" 
                                    Width="300" Flex="1" 
                                    Cls="LabelEstilo" 
                                    ValueField="ARTICULO_ID" 
                                    DisplayField="ARTICULO_SERIE" 
                                    EmptyText="Seleciona una marca">
                                <Store>
                                <ext:Store runat="server">
                                <Model>
                                <ext:Model  runat="server">
                                    <Fields>
                                        <ext:ModelField Name="ARTICULO_ID"></ext:ModelField>
                                        <ext:ModelField Name="ARTICULO_SERIE"></ext:ModelField>
                                        <ext:ModelField Name="ARTICULO_NOMBRE"></ext:ModelField>
                                    </Fields>
                                </ext:Model>
                                </Model>
                                </ext:Store>
                                </Store>
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
                            AutoDataBind="true" 
                            Width="300" 
                            FieldLabel = "Fecha" 
                            Cls="LabelEstilo" 
                            Icon="Date">
                        </ext:DateField> 
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
                            DisplayField="USUARIO_NOMBRE" 
                            ValueField="USUARIO_ID" 
                            MsgTarget="Side" 
                            AllowBlank="false"   
                            FieldLabel="Responsable" 
                            Width="300" 
                            Icon="User" 
                            Cls="LabelEstilo" 
                            Margins="0 40 0 0" >
                        <Store>
                            <ext:Store  runat="server">
                                <Model>
                                    <ext:Model  runat="server">
                                        <Fields>
                                            <ext:ModelField Name="USUARIO_ID"></ext:ModelField>
                                            <ext:ModelField Name="USUARIO_NOMBRE"></ext:ModelField>
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
                                ID="txtUnidades"  
                                runat="server"  
                                MsgTarget="Side" 
                                AllowBlank="false" 
                                FieldLabel = "Unidades que mide " 
                                AnchorHorizontal="100%" 
                                Cls="LabelEstilo" 
                                Width="300">
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
                            ID="txtValorPatron"  
                            runat="server"   
                            FieldLabel = "Valor Patron" 
                            MsgTarget="Side" 
                            AllowBlank="false" 
                            Width="300" 
                            AnchorHorizontal="100%" 
                            Cls="LabelEstilo" 
                            Margins="0 40 0 0" >
                        </ext:TextField>
                    
                        <ext:TextField 
                            ID="txtValorPromedio"  
                            runat="server"  
                            FieldLabel = "Valor Medido Promedio" 
                            MsgTarget="Side" 
                            AllowBlank="false" 
                            Width="300" 
                            AnchorHorizontal="100%" 
                            Cls="LabelEstilo" 
                            Margins="0 40 0 0" >
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
                                ID="txtErrorIns"  
                                runat="server"  
                                FieldLabel = "Error Instrumental" 
                                MsgTarget="Side" 
                                AllowBlank="false" 
                                Width="300" 
                                AnchorHorizontal="100%" 
                                Cls="LabelEstilo" 
                                Margins="0 40 0 0" >
                            </ext:TextField>
                    
                            <ext:TextField 
                                ID="txtErrorEst"  
                                runat="server"   
                                FieldLabel = "Error Estadistico" 
                                MsgTarget="Side" 
                                AllowBlank="false" 
                                Width="300" 
                                AnchorHorizontal="100%" 
                                Cls="LabelEstilo" 
                                Margins="0 40 0 0" >
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
                            ID="sltEstado" 
                            runat="server"   
                            DisplayField="ESTADO_NOMBRE" 
                            ValueField="ESTADO_ID" 
                            FieldLabel="Estado" 
                            MsgTarget="Side" 
                            AllowBlank="false" 
                            Width="300" 
                            AnchorHorizontal="100%" 
                            Cls="LabelEstilo" 
                            Margins="0 40 0 0" >
                            <Store>
                            <ext:Store ID="Store4"  runat="server">
                            <Model>
                                <ext:Model ID="Model4"  runat="server">
                                    <Fields>
                                        <ext:ModelField Name="ESTADO_ID">
                                        </ext:ModelField>
                                        <ext:ModelField Name="ESTADO_NOMBRE">
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
                        <ext:TextArea 
                            ID = "txtObs" 
                            runat="server"  
                            MsgTarget="Side" 
                            AllowBlank="false"  
                            FieldLabel="Observaciones" 
                            Width="700" 
                            Cls="LabelEstilo">
                        </ext:TextArea>
                </Items>
              </ext:FieldContainer> 
              </Items>
                    <Buttons>
                        <ext:Button runat="server" ID="btnNueno" Text="Nuevo" Icon="Add">
                        </ext:Button>
                        <ext:Button runat="server" ID="btnGuardar" Text="Guardar" Icon="DiskBlack">
                        <DirectEvents>
                        <Click 
                        OnEvent="btnGuardarNuevoCali" 
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
                    <ext:PagingToolbar ID="pgDetalleCali" runat="server" DisplayInfo="false" Visible="false">
                    </ext:PagingToolbar>
                </BottomBar>
            </ext:FormPanel>
        </Items>
        </ext:TabPanel>
    </Items>
</ext:Window>