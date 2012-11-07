<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CalibracionDetalle.ascx.cs" Inherits="Paginas_Calibraciones_CalibracionesDetalle" %>
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
    ID="stCaliDetalle" 
    runat="server" 
    PageSize="1">
    <Model>
        <ext:Model runat="server" IDProperty="CALIBRACION_ID">
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
    <Listeners>
        <DataChanged
            Handler="var record = this.getAt(0) || {};#{formaCalibracion}.getForm().loadRecord(record);#{formaCalibracion}.clearInvalid();">
        </DataChanged>
    </Listeners>
</ext:Store>
<ext:Store 
    ID = "stArticulos" 
    runat="server" 
    PageSize="1">
    <Model>
        <ext:Model runat="server">
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
        <DataChanged 
            Handler="var record = this.getAt(0) || {};#{formaEquipoCalibrado}.getForm().loadRecord(record);#{formaEquipoCalibrado}.clearInvalid();">
        </DataChanged>
    </Listeners>
</ext:Store>
<ext:Window 
    ID="VentanaCaliDetalle" 
    runat="server" 
    Icon="ApplicationAdd"
    Title="Informacion" 
    Width="750" 
    Height="450" 
    AutoShow="false" 
    Modal="true" 
    Hidden="true"
    Layout="Fit">
    <Items>
        <ext:TabPanel runat="server">
        <Items>
            <ext:FormPanel 
                    ID = "formaCalibracion" 
                    runat="server" 
                    Title="Calibracion"
                    Icon="NoteEdit"
                    DefaultAnchor="100%"
                    BodyPadding="5" 
                    BodyStyle="background-color: #CCCCCC; background-image: url('../../img/grey.png'); background-repeat: repeat;">
              <Items>
                    <ext:TextField ID="txtCaliId" runat="server" Name = "CALIBRACION_ID" Width="10" Disabled="false" Hidden="true">
                    </ext:TextField>
                    <ext:TextField ID="sltMarca" runat ="server" Name="CALIBRACION_MARCA_ID" Hidden="true"></ext:TextField>
                    
                    <ext:Container 
                        runat="server" 
                        AnchorHorizontal="100%" 
                        Layout="HBoxLayout" 
                        Margin="20">
                    <Items>
                    <ext:ComboBox 
                                    ID="cmbSerie" 
                                    runat="server" 
                                    Name="CALIBRACION_ARTICULO_ID"
                                    TypeAhead="true"
                                    QueryMode="Local"
                                    ForceSelection="true"
                                    TriggerAction="All" 
                                    ValueNotFoundText="..." 
                                    MsgTarget="Side" 
                                    AllowBlank="false" 
                                    FieldLabel="Serie" 
                                    Width="300" 
                                    Cls="LabelEstilo" 
                                    ValueField="ARTICULO_ID" 
                                    DisplayField="ARTICULO_SERIE">
                                <Store>
                                <ext:Store runat="server">
                                <Model>
                                <ext:Model runat="server">
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
                    </ext:Container>
                    <ext:Container 
                        runat="server"
                        AnchorHorizontal="100%"
                        Layout="HBoxLayout" 
                        Margin="20">
                        <Items>
                        <ext:ComboBox  
                            ID = "sltResponsable" 
                            runat="server" 
                            Name="CALIBRACION_USUARIO_ID_RESPONSABLE" 
                            DisplayField="USUARIO_NOMBRE" 
                            ValueField="USUARIO_ID" 
                            MsgTarget="Side" 
                            AllowBlank="false"   
                            FieldLabel="Responsable"
                            TypeAhead="true"
                            QueryMode="Local"
                            ForceSelection="true"
                            TriggerAction="All" 
                            ValueNotFoundText="..." 
                            Width="300" 
                            Icon="User" 
                            Cls="LabelEstilo" 
                            Margins="0 40 0 0" >
                        <Store>
                            <ext:Store ID="Store1" runat="server">
                                <Model>
                                    <ext:Model ID="Model1" runat="server">
                                        <Fields>
                                            <ext:ModelField Name="USUARIO_ID"></ext:ModelField>
                                            <ext:ModelField Name="USUARIO_NOMBRE"></ext:ModelField>
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                        </ext:ComboBox>
                        <ext:DateField 
                            ID="dteFecha" 
                            runat ="server" 
                            Name="CALIBRACION_FECHA" 
                            MsgTarget="Side" 
                            AllowBlank="false" 
                            AutoDataBind="true" 
                            Width="300" 
                            FieldLabel = "Fecha" 
                            Cls="LabelEstilo" 
                            Icon="Date">
                        </ext:DateField> 
                        </Items>
                        </ext:Container>
                    <ext:Container  
                        runat="server"
                        AnchorHorizontal="100%"
                        Layout="HBoxLayout" 
                        Margin="20">
                        <Items>
                            <ext:SelectBox 
                            ID="sltEstado" 
                            runat="server"  
                            Name="CALIBRACION_ESTADO"  
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
                            <ext:Store ID="Store2"  runat="server">
                            <Model>
                                <ext:Model ID="Model2"  runat="server">
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
                            <ext:TextField 
                                ID="txtUnidades"  
                                runat="server" 
                                Name="CALIBRACION_UNIDADESMEDICION" 
                                MsgTarget="Side" 
                                AllowBlank="false" 
                                FieldLabel = "Unidades que mide " 
                                AnchorHorizontal="100%" 
                                Cls="LabelEstilo" 
                                Width="300">
                            </ext:TextField> 
                        </Items>
                    </ext:Container>
                    <ext:Container 
                        runat="server"
                        AnchorHorizontal="100%"
                        Layout="HBoxLayout" 
                        Margin="20">
                        <Items>
                        <ext:FieldSet 
                            runat="server" 
                            Title="Valor" 
                            Margins="0 20 0 0" 
                            Cls="LabelEstilo" Height="100">
                            <Items>
                                 <ext:TextField 
                                    ID="txtValorPatron"  
                                    runat="server" 
                                    Name="CALIBRACION_VALORPATRON"  
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
                                    Name="CALIBRACION_VALORMEDIDO" 
                                    FieldLabel = "Valor Medido Promedio" 
                                    MsgTarget="Side" 
                                    AllowBlank="false" 
                                    Width="300" 
                                    AnchorHorizontal="100%" 
                                    Cls="LabelEstilo" 
                                    Margins="0 40 0 0" >
                                </ext:TextField>
                            </Items>
                        </ext:FieldSet>
                        <ext:FieldSet 
                            runat="server" 
                            Title="Error" 
                            Cls="LabelEstilo" Height="100">
                        <Items>
                             <ext:TextField 
                                ID="txtErrorIns"  
                                runat="server" 
                                Name="CALIBRACION_EINSTRUMENTAL" 
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
                                Name="CALIBRACION_EESTADISTICO"  
                                FieldLabel = "Error Estadistico" 
                                MsgTarget="Side" 
                                AllowBlank="false" 
                                Width="300" 
                                AnchorHorizontal="100%" 
                                Cls="LabelEstilo" 
                                Margins="0 40 0 0" >
                            </ext:TextField>
                        </Items>
                        </ext:FieldSet>
                        </Items>
                    </ext:Container>
                    <ext:Container  
                        runat="server"
                        AnchorHorizontal="100%"
                        Layout="HBoxLayout" 
                        Margin="20">
                        <Items>
                        <ext:TextArea 
                            ID = "txtObs" 
                            runat="server" 
                            Name="CALIBRACION_OBSERVACIONES" 
                            MsgTarget="Side" 
                            AllowBlank="false"  
                            FieldLabel="Observaciones" 
                            Width="600" 
                            Cls="LabelEstilo">
                        </ext:TextArea>
                </Items>
              </ext:Container> 
                   </Items>
              <Buttons>
                <ext:Button runat="server" ID="btnGuardar" Text="Guardar" Icon="Disk">
                    <DirectEvents>
                        <Click 
                        OnEvent="btnGuardarDetalleCali" 
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
                <ext:PagingToolbar ID="pgDetalleCali" StoreID="stCaliDetalle" runat="server" DisplayInfo="false" Visible="false">
                </ext:PagingToolbar>
              </BottomBar>
            </ext:FormPanel>
            <ext:FormPanel 
                ID="formaEquipoCalibrado" 
                runat="server" 
                Title="Equipo Calibrado" 
                Icon="NoteEdit" 
                DefaultAnchor="100%" 
                BodyPadding="20" 
                 
                BodyStyle="background-color: #CCCCCC; background-image: url('../../img/grey.png'); background-repeat: repeat;">
                <Items>
                    <ext:FieldSet 
                        runat="server" 
                        Title="Descripcion Equipo">
                        <Items>
                            <ext:Container 
                                runat="server" 
                                Margin="20">
                                <Items>
                                    <ext:TextField 
                                        ID ="txtEquipo" 
                                        runat="server" 
                                        FieldLabel="Equipo" 
                                        Cls="LabelEstilo" 
                                        Width="400" 
                                        Name="ARTICULO_NOMBRE">
                                    </ext:TextField>
                                </Items>
                            </ext:Container>
                            <ext:Container 
                                runat="server" 
                                Margin="20" 
                                Layout="HBoxLayout">
                                <Items>
                                    <ext:TextField 
                                        ID="txtMarca" 
                                        runat="server" 
                                        FieldLabel="Marca" 
                                        Width="350" 
                                        Cls="LabelEstilo" 
                                        Margins="0 20 0 0" 
                                        Name="ARTICULO_MARCA_ID">
                                    </ext:TextField>
                                </Items>
                            </ext:Container>
                            <ext:Container 
                            runat="server" 
                            Margin="20" 
                            Layout="HBoxLayout">
                                <Items>
                                    <ext:TextField 
                                        ID="txtModelo" 
                                        runat="server" 
                                        FieldLabel="Modelo" 
                                        Width="350" 
                                        Cls="LabelEstilo" 
                                        Name="ARTICULO_MODELO">
                                    </ext:TextField>
                                </Items>
                            </ext:Container>
                            <ext:Container 
                                runat="server" 
                                Margin="20" 
                                Layout="HBoxLayout">
                                <Items>
                                    <ext:TextField 
                                        ID="txtColor" 
                                        runat="server" 
                                        FieldLabel="Color" 
                                        Width="300" 
                                        Cls="LabelEstilo" 
                                        Name="ARTICULO_COLOR">
                                    </ext:TextField>
                                </Items>
                            </ext:Container>
                            <ext:Container 
                                runat="server" 
                                Margin="20" 
                                Layout="HBoxLayout">
                                <Items>
                                    <ext:TextField 
                                        ID="txtLaboratorio" 
                                        runat="server" 
                                        FieldLabel="Laboratorio" 
                                        Width="350" 
                                        Cls="LabelEstilo" 
                                        Margins="0 20 0 0" 
                                        Name="ARTICULO_LABORATORIO_ID">
                                    </ext:TextField>
                                </Items>
                            </ext:Container>
                            <ext:Container 
                                runat="server" 
                                Margin="20" 
                                Layout="HBoxLayout">
                                <Items>
                                    <ext:TextArea 
                                        ID="txtDescripcion" 
                                        runat="server" 
                                        FieldLabel="Descripcion" 
                                        Cls="LabelEstilo" 
                                        Width="600" 
                                        Name="ARTICULO_DESCRIPCION">
                                    </ext:TextArea>
                                </Items>
                            </ext:Container>
                        </Items>
                    </ext:FieldSet>
                </Items>
                <BottomBar>
                    <ext:PagingToolbar runat="server" StoreID="stArticulos" DisplayInfo="false" Visible="false">
                    </ext:PagingToolbar>
                </BottomBar>
            </ext:FormPanel>
        </Items>
        </ext:TabPanel>
    </Items>
</ext:Window>
