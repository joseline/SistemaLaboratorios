<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PrestamoDetalle.ascx.cs" Inherits="Paginas_Prestamos_PrestamoDetalle" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<style type="text/css">
        .combo-list {
            width : 250px;
            font  : 11px tahoma,arial,helvetica,sans-serif;
        }
        .Alumnocuenta
        {
            width : 70px;
            font  : 11px tahoma,arial,helvetica,sans-serif;
        }
        .Alumnonombre
        {
            width : 250px;
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
<script type="text/javascript">
    var rendererLaboratorio = function (value) {
        var r = App.ContentPlaceHolderBody_PrestamoDetalle1_stLaboratorio.getById(value);
        if (Ext.isEmpty(r)) {
            return "e";
        }
        return r.data.LABORATORIO_NOMBRE;
    };
    var rendererMarca = function (value) {
        var r = App.ContentPlaceHolderBody_PrestamoDetalle1_stMarca.getById(value);
        if (Ext.isEmpty(r)) {
            return "e";
        }
        return r.data.MARCA_NOMBRE;
    };
    
</script>


<ext:Store 
    runat="server" 
    ID="stPrestamoDetalle" 
    PageSize="1">
    <Model>
        <ext:Model runat="server" IDProperty="PRESTAMO_ID">
            <Fields>
                <ext:ModelField Name="PRESTAMO_ID"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_ALUMNO_ID"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_ARTICULO_ID"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_FECHASALIDA" Type="Date"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_FECHAENTRADA" Type="Date"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_FECHADEENTREGA" Type="Date"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_USUARIO_ID_PRESTADOPOR"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_USUARIO_ID_RECIBIDOPOR"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_TIPO"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_HORAINICIO"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_HORAFIN"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_HORAENTREGA"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_OBSERVACIONES"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_MULTA"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_MULTAPAGADA"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
    <Listeners>
        <DataChanged
            Handler="var record = this.getAt(0) || {};#{formaPrestamo}.getForm().loadRecord(record);#{formaPrestamo}.clearInvalid();">
        </DataChanged>
    </Listeners>
</ext:Store>
<ext:Store 
    ID="stPrestamoAlumnoDetalle" 
    runat="server">
    <Model>
        <ext:Model runat="server" IDProperty = "ALUMNO_ID">
            <Fields>
                    <ext:ModelField Name="ALUMNO_ID" Type="Int"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_CUENTA" Type="Int"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_NOMBRE"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_TELEFONO"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_CORREO"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_CARRERA_ID"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
</ext:Store>
<ext:Store ID="stPrestamoArticuloDetalle" runat="server">
    <Model>
        <ext:Model runat="server" IDProperty = "ARTICULO_ID">
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
    ID="stPrestamoUsuarioDetalle" 
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


<ext:Store 
    ID="stAlumno" 
    runat="server" 
    PageSize="1">
    <Model>
        <ext:Model runat="server" IDProperty = "ALUMNO_ID">
            <Fields>
                    <ext:ModelField Name="ALUMNO_ID" Type="Int"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_CUENTA" Type="Int"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_NOMBRE"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_TELEFONO"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_CORREO"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_CARRERA_ID"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
    <Listeners>
        <DataChanged Handler="var record = this.getAt(0) || {};#{formaAlumno}.getForm().loadRecord(record);#{formaAlumno}.clearInvalid();">
        </DataChanged>
    </Listeners>
</ext:Store>
<ext:Store ID="stArticulo" 
    runat="server">
    <Model>
        <ext:Model runat="server" IDProperty = "ARTICULO_ID">
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
<ext:Store ID="stLaboratorio" runat="server">
    <Model>
        <ext:Model runat="server" IDProperty="LABORATORIO_ID">
            <Fields>
                <ext:ModelField Name="LABORATORIO_ID"></ext:ModelField>
                <ext:ModelField Name="LABORATORIO_NOMBRE"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
    <Listeners>
            <Load Handler="#{gpEquipoPrestado}.getView().refresh();" />
    </Listeners>
</ext:Store>
<ext:Store 
    ID="stMarca" 
    runat="server">
    <Model>
        <ext:Model runat="server" IDProperty="MARCA_ID">
            <Fields>
                <ext:ModelField Name="MARCA_ID"></ext:ModelField>
                <ext:ModelField Name="MARCA_NOMBRE"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
    <Listeners>
            <Load Handler="#{gpEquipoPrestado}.getView().refresh();" />
    </Listeners>
</ext:Store>
<ext:Window 
    ID = "VentanaPrestamoDetalle" 
    runat="server" 
    Icon="ApplicationAdd"
    Title="Prestamo" 
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
                ID="formaPrestamo"
                runat = "server" 
                Title="Informacion" 
                Icon="NoteEdit"
                DefaultAnchor="100%"
                BodyPadding="5" 
                BodyStyle="background-color: #CCCCCC; background-image: url('../../img/grey.png'); background-repeat: repeat;">
                 
                 <Items>
                    <ext:Container  
                        runat="server"
                        AnchorHorizontal="100%"
                        Layout="HBoxLayout" 
                        Margin="20">
                        <Items>
                            <ext:Label  
                                runat="server" 
                                Text = "Editar Prestamo" Height="30"
                                StyleSpec="font-family: Verdana; color: #666666; font-size: large; font-weight: bolder;"/>
                        </Items>
                    </ext:Container>
                    <ext:Container  
                        runat="server"
                        Layout="HBoxLayout" 
                        Margin="20">
                        <Items>
                            <ext:ComboBox 
                                ID ="sltCuenta" 
                                runat="server" 
                                StoreID="stPrestamoAlumnoDetalle" 
                                TypeAhead="true"
                                QueryMode="Local"
                                ForceSelection="true"
                                TriggerAction="All" 
                                
                                MsgTarget="Side" 
                                AllowBlank="false" 
                                FieldLabel="Cuenta"
                                LabelAlign="Left" 
                                Width="350"  
                                LabelWidth="50"
                                Margins="0 10 0 0" 
                                Cls="LabelEstilo"
                                Name ="PRESTAMO_ALUMNO_ID"
                                DisplayField="ALUMNO_CUENTA" 
                                ValueField="ALUMNO_ID">
                                
                                <ListConfig Width="100" Height="400" ItemSelector=".x-boundlist-item">
                                <Tpl ID="Tpl1" runat="server">
                                <Html>
					            <tpl for=".">
						        <tpl if="[xindex] == 1">
						            <table>
						            <tr>
							            <th class="Alumnocuenta">Cuenta</th>
					                    <th class="Alumnonombre">Alumno</th>
						            </tr>
						        </tpl>
						            <tr class="x-boundlist-item">
							        <td>{ALUMNO_CUENTA}</td>
							        <td>{ALUMNO_NOMBRE}</td>
						            </tr>
						        <tpl if="[xcount-xindex]==0">
							    </table>
						        </tpl>
					            </tpl>
				                </Html>
                                </Tpl>
                                </ListConfig>
                         </ext:ComboBox>
                            <ext:ComboBox 
                            ID="cmbSerie" 
                            runat="server" 
                            StoreID= "stPrestamoArticuloDetalle" 
                            TypeAhead="true"
                            QueryMode="Local"
                            ForceSelection="true"
                            TriggerAction="All" 
                            MsgTarget="Side" 
                            AllowBlank="false" 
                            FieldLabel="Serie" 
                            Width="350" 
                            LabelWidth="50"
                            Cls="LabelEstilo" 
                            Name="PRESTAMO_ARTICULO_ID"
                            ValueField="ARTICULO_ID" 
                            DisplayField="ARTICULO_SERIE"
                            ValueNotFoundText="..." 
                            LabelAlign="Left">
                            <ListConfig Width="400" Height="300"  ItemSelector=".x-boundlist-item">
                                <Tpl ID="Tpl2" runat="server">
                                    <Html>
					                <tpl for=".">
						            <tpl if="[xindex] == 1">
							        <table class="combo-list">
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
                        <ext:SelectBox 
                                ID="sltTipoPrestamo" 
                                runat="server" 
                                MsgTarget="Side" 
                                AllowBlank="false" 
                                FieldLabel="Tipo Prestamo" 
                                Width="300" 
                                Cls="LabelEstilo" 
                                Margins = "0 60 0 0" 
                                Name="PRESTAMO_TIPO"
                                ValueField="PRESTAMO_TIPO_ID" 
                                DisplayField="PRESTAMO_TIPO_NOMBRE" 
                                LabelAlign="Left">
                                <Store>
                                <ext:Store runat="server">
                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="PRESTAMO_TIPO_ID"></ext:ModelField>
                                                <ext:ModelField Name="PRESTAMO_TIPO_NOMBRE"></ext:ModelField>
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                                </Store>
                           
                        </ext:SelectBox>                  
                        
                        <ext:Checkbox 
                            ID="chckMulta" 
                            runat="server" 
                            FieldLabel="Multa Pagada"  
                            Checked="false"  
                            Cls="LabelEstilo" 
                            Name="PRESTAMO_MULTAPAGADA">
                        </ext:Checkbox>
                        </Items>
                     </ext:Container>
                    <ext:Container  
                        runat="server"
                        AnchorHorizontal="100%"
                        Layout="HBoxLayout" 
                        Margin="20">
                        <Items>
                            <ext:FieldSet 
                                ID = "fsExterno"
                                runat="server"
                                ColumnWidth="0.4" 
                                Title="Prestamo Externo" 
                                Margins="0 60 0 0" 
                                Disabled="true" 
                                Width="300" 
                                Height="80">
                                <Items>
                                    <ext:DateField 
                                        ID = "dtefechaEntregar" 
                                        runat ="server" 
                                        MsgTarget="Side" 
                                        AllowBlank="false" 
                                        FieldLabel="Fecha a Entregar" 
                                        Icon="Date" 
                                        Width="250" 
                                        Cls="LabelEstilo" 
                                        Disabled="true" 
                                        Name="PRESTAMO_FECHADEENTREGA">
                                    </ext:DateField>
                                </Items>
                            </ext:FieldSet >
                            <ext:FieldSet 
                                ID= "fsInterno"
                                runat="server"
                                ColumnWidth="0.4" 
                                Title="Prestamo Interno" 
                                Disabled="true" 
                                Width="300" 
                                Height="80">
                                <Items>
                                    <ext:Container
                                        runat="server" 
                                        Layout="HBoxLayout" Margins="4 4 4 4">
                                        <Items>
                                            <ext:TimeField 
                                                runat="server" 
                                                ID="tfHoraInicio" 
                                                FieldLabel="Hora Inicio"
                                                icon= "ClockAdd" 
                                                Cls="LabelEstilo" 
                                                Margins="0 0 4 0" 
                                                MinTime="6:00" 
                                                MaxTime="20:00" 
                                                Format="hh:mm tt" 
                                                Increment="60" 
                                                Name="PRESTAMO_HORAINICIO">
                                            </ext:TimeField>
                                        </Items>
                                    </ext:Container>
                                    <ext:Container 
                                        runat="server" 
                                        Layout="HBoxLayout">
                                        <Items>
                                            <ext:TimeField 
                                                runat="server" 
                                                ID="tfHoraFin" 
                                                FieldLabel = "Hora Fin "
                                                icon = "ClockAdd" 
                                                Cls="LabelEstilo" 
                                                MinTime="6:00" 
                                                MaxTime="20:00" 
                                                Format="hh:mm tt" 
                                                Increment="60" 
                                                Name="PRESTAMO_HORAFIN">
                                            </ext:TimeField>
                                        </Items>
                                    </ext:Container>
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
                        <ext:DateField 
                            ID="dteFechaSalida" 
                            runat ="server"  
                            MsgTarget="Side" 
                            AllowBlank="false" 
                            FieldLabel="Fecha de Salida"
                            LabelAlign="Left" 
                            Icon="Date" 
                            Width="300" 
                            Cls="LabelEstilo" 
                            Name="PRESTAMO_FECHASALIDA"
                            Margins="0 60 0 0" 
                            ShowToday="true">
                        </ext:DateField>
                        <ext:DateField 
                            ID="dteFechaEntrada" 
                            runat ="server"  
                            MsgTarget="Side" 
                            AllowBlank="false" 
                            FieldLabel="Fecha de Entrada"
                            LabelAlign="Left"
                            Icon="Date" 
                            Width="300" 
                            Cls="LabelEstilo" 
                            Name="PRESTAMO_FECHAENTRADA">
                            
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
                                ID = "sltPrestadoPor" 
                                runat="server" 
                                StoreID="stPrestamoUsuarioDetalle"  
                                DisplayField="USUARIO_NOMBRE" 
                                ValueField="USUARIO_ID" 
                                MsgTarget="Side" 
                                AllowBlank="false"   
                                FieldLabel="Prestado por" 
                                Width="300" 
                                Icon="User" 
                                Cls="LabelEstilo" 
                                Margins="0 60 0 0" 
                                Name="PRESTAMO_USUARIO_ID_PRESTADOPOR" >
                            </ext:SelectBox>
                            
                            <ext:SelectBox  
                                ID = "sltRecibidoPor" 
                                runat="server" 
                                StoreID="stPrestamoUsuarioDetalle"  
                                DisplayField="USUARIO_NOMBRE" 
                                ValueField="USUARIO_ID" 
                                MsgTarget="Side" 
                                AllowBlank="false"   
                                FieldLabel="Recibido por" 
                                Width="300" 
                                Icon="User" 
                                Cls="LabelEstilo" 
                                Name="PRESTAMO_USUARIO_ID_RECIBIDOPOR">
                            </ext:SelectBox>
                        </Items>
                    </ext:Container>
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
                                LabelAlign="Left" 
                                Width="700" 
                                Cls="LabelEstilo" 
                                Name="PRESTAMO_OBSERVACIONES">
                            </ext:TextArea>
                        </Items>
                    </ext:FieldContainer>
                   
                 </Items>
                 <BottomBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:ToolbarFill runat="server"/>
                            <ext:Button runat="server" ID="btnGuardarPrestamoDetalle" Text="Guardar" Icon="DiskBlack">
                                <DirectEvents>
                                <Click 
                                    OnEvent="btnGuardarDetallePrestamo" 
                                    Failure="Ext.MessageBox.alert('Error al guardar', 'Error al guardar');">
                                </Click>
                                </DirectEvents>
                            </ext:Button>
                            <ext:Button ID="btnCancelPrestamoDetalle" runat="server" Text="Cancelar" Icon="Cancel">
                            <Listeners>
                                <Click Handler="this.up('window').hide();" />
                            </Listeners>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                 </BottomBar>
                </ext:FormPanel>
                <ext:FormPanel 
                    ID="formaAlumno" 
                    runat="server" 
                    Title="Alumno - Equipo Prestado" 
                    Icon="NoteEdit"
                    DefaultAnchor="100%"
                    BodyPadding="5" 
                    BodyStyle="background-color: #CCCCCC; background-image: url('../../img/grey.png'); background-repeat: repeat;">
                    <Items>
                        <ext:Container 
                            runat="server" 
                            Margin="10">
                            <Items>
                                <ext:TextField 
                                    ID="txtAlumno" 
                                    runat="server" 
                                    FieldLabel="Alumno" 
                                    Cls="LabelEstilo" 
                                    Width="400" 
                                    Name="ALUMNO_NOMBRE">
                                </ext:TextField>
                            </Items>
                        </ext:Container>
                        <ext:Container runat="server" Margin="10">
                            <Items>
                                <ext:ComboBox
                                    ID="txtCarrera" 
                                    runat="server" 
                                    FieldLabel="Carrera" 
                                    Cls="LabelEstilo" 
                                    Width="400" 
                                    Name="ALUMNO_CARRERA_ID" 
                                    ValueField="CARRERA_ID" 
                                    DisplayField="CARRERA_NOMBRE" 
                                    HideBaseTrigger="true">
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
                                    
                                </ext:ComboBox>
                            </Items>
                        </ext:Container>
                        <ext:Container 
                            runat="server" 
                            Margin="10" 
                            Layout="HBoxLayout">
                            <Items>
                                <ext:TextField 
                                    ID="txtTelefono" 
                                    runat="server" 
                                    FieldLabel="Telefono" 
                                    Cls="LabelEstilo" 
                                    Width="200"  
                                    Name="ALUMNO_TELEFONO" 
                                    Margins="0 50 0 0">
                                </ext:TextField>
                                <ext:TextField 
                                    ID="txtCorreo" 
                                    runat="server" 
                                    FieldLabel="Correo" 
                                    Cls="LabelEstilo" 
                                    Width="350" 
                                    Name="ALUMNO_CORREO">
                                </ext:TextField>
                            </Items>
                        </ext:Container>
                        <ext:Container runat="server">
                            <Items>
                                <ext:GridPanel 
                                    runat="server" 
                                    ID="gpEquipoPrestado" 
                                    StoreID="stArticulo">
                                    <ColumnModel>
                                        <Columns>
                                            <ext:Column ID="colEquipo" DataIndex="ARTICULO_NOMBRE" runat="server" Text="Equipo" Width="300">
                                            </ext:Column>
                                            <ext:Column ID="colMarca" DataIndex="ARTICULO_MARCA_ID" runat="server" Text="Marca" Width="300">
                                                <Renderer Fn="rendererMarca"/>
                                            </ext:Column>
                                            <ext:Column ID="colModelo" DataIndex="ARTICULO_MODELO" runat="server" Text="Modelo">
                                            </ext:Column>
                                            <ext:Column ID="colLaboratorio" DataIndex="ARTICULO_LABORATORIO_ID" runat="server" Text="Laboratorio">
                                                <Renderer Fn="rendererLaboratorio"/>
                                            </ext:Column>
                                        </Columns>
                                    </ColumnModel>
                                    <View>
                                      <ext:GridView runat="server"></ext:GridView>
                                    </View>
                                </ext:GridPanel>
                            </Items>
                        </ext:Container>
                    </Items>
                    <BottomBar>
                        <ext:PagingToolbar runat="server" StoreID="stAlumno" Visible="false">
                        </ext:PagingToolbar>
                    </BottomBar>
                </ext:FormPanel>
            </Items>
        </ext:TabPanel>
    </Items>
</ext:Window>