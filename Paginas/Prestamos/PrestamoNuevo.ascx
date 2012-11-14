<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PrestamoNuevo.ascx.cs" Inherits="Paginas_Prestamos_PrestamoNuevo" %>
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
    var ValidarMostrarCheckValorMulta = function () {
        if (App.ContentPlaceHolderBody_PrestamoNuevo1_dteFechaEntrada.SelectedDate > App.ContentPlaceHolderBody_PrestamoNuevo1_dtefechaEntregar.SelectedDate) {
            App.ContentPlaceHolderBody_PrestamoNuevo1_chckMulta.Hidden = "false";
        }
    };
</script>


<ext:Store 
    ID="stPrestamoAlumnoNuevo" 
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
<ext:Store ID="stPrestamoArticuloNuevo" runat="server">
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
    ID="stPrestamoUsuarioNuevo" 
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
<ext:Window 
    ID = "VentanaPrestamoNuevo" 
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
                    <ext:FieldContainer  
                        runat="server"
                        AnchorHorizontal="100%"
                        Layout="HBoxLayout" 
                        Margin="20">
                        <Items>
                            <ext:Label 
                                runat="server" 
                                Text = "Prestamo Nuevo" Height="30"
                                StyleSpec="font-family: Verdana; color: #666666; font-size: large; font-weight: bolder;"/>
                        </Items>
                    </ext:FieldContainer>
                    <ext:Container 
                        runat="server"
                        Layout="HBoxLayout" 
                        Margin="20">
                        <Items>
                            <ext:ComboBox 
                                ID ="sltCuenta" 
                                runat="server" 
                                StoreID="stPrestamoAlumnoNuevo" 
                                TypeAhead="true"
                                QueryMode="Local"
                                ForceSelection="true"
                                TriggerAction="All" 
                                ValueNotFoundText="..." 
                                MsgTarget="Side" 
                                AllowBlank="false" 
                                FieldLabel="Cuenta"
                                LabelAlign="Left" 
                                Width="350"  
                                LabelWidth="50"
                                Margins="0 10 0 0" 
                                Cls="LabelEstilo"
                                
                                DisplayField="ALUMNO_CUENTA" 
                                ValueField="ALUMNO_ID">
                                
                                <ListConfig Width="100" Height="400" ItemSelector=".x-boundlist-item">
                                <Tpl runat="server">
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
                            StoreID= "stPrestamoArticuloNuevo" 
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
                            ValueField="ARTICULO_ID" 
                            DisplayField="ARTICULO_SERIE"
                            ValueNotFoundText="..." 
                            LabelAlign="Left">
                            <ListConfig Width="400" Height="300"  ItemSelector=".x-boundlist-item">
                                <Tpl runat="server">
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
                    <ext:FieldContainer 
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
                                ValueField="PRESTAMO_TIPO_ID" 
                                DisplayField="PRESTAMO_TIPO_NOMBRE" 
                                LabelAlign="Left" 
                                OnDirectSelect ="ActivarTipoPrestamo">
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
                        </Items>
                     </ext:FieldContainer>
                    <ext:FieldContainer  
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
                                        Disabled="true">
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
                                                Increment="60">
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
                                                Increment="60">
                                            </ext:TimeField>
                                        </Items>
                                    </ext:Container>
                                </Items>
                            </ext:FieldSet>
                        </Items>
                    </ext:FieldContainer>                
                    <ext:Container ID="fechas" 
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
                            Cls="LabelEstilo">
                            <MessageBusDirectEvents>
                                <ext:MessageBusDirectEvent>
                                    <EventMask Msg="Espere..." ShowMask="true">
                                    </EventMask>
                                </ext:MessageBusDirectEvent>
                            </MessageBusDirectEvents>
                            <DirectEvents>
                                <Select OnEvent="ValidarMostrarMulta">
                                </Select>
                            </DirectEvents>
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
                                StoreID="stPrestamoUsuarioNuevo"  
                                DisplayField="USUARIO_NOMBRE" 
                                ValueField="USUARIO_ID" 
                                MsgTarget="Side" 
                                AllowBlank="false"   
                                FieldLabel="Prestado por" 
                                Width="300" 
                                Icon="User" 
                                Cls="LabelEstilo" 
                                Margins="0 60 0 0" >
                            </ext:SelectBox>
                            
                            <ext:SelectBox  
                                ID = "sltRecibidoPor" 
                                runat="server" 
                                StoreID="stPrestamoUsuarioNuevo"  
                                DisplayField="USUARIO_NOMBRE" 
                                ValueField="USUARIO_ID" 
                                MsgTarget="Side" 
                                AllowBlank="false"   
                                FieldLabel="Recibido por" 
                                Width="300" 
                                Icon="User" 
                                Cls="LabelEstilo">
                            </ext:SelectBox>
                        </Items>
                    </ext:Container>
                    <ext:Container 
                        runat="server" 
                        Layout="HBoxLayout" 
                        Margin="20">
                        <Items>
                            <ext:Checkbox 
                            ID="chckMulta" 
                            runat="server" 
                            FieldLabel="Multa Pagada"  
                            Checked="false"  
                            Cls="LabelEstilo" 
                            Margins="0 60 0 0" 
                            Hidden="true">
                        </ext:Checkbox>
                            <ext:TextField 
                                ID="ValorMulta"  
                                runat="server" 
                                FieldLabel="Valor Multa" 
                                Cls="LabelEstilo" 
                                Hidden="true">
                                
                        </ext:TextField>
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
                                Cls="LabelEstilo">
                            </ext:TextArea>
                        </Items>
                    </ext:FieldContainer>
                    
                 </Items>
                 <BottomBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:ToolbarFill runat="server" />
                            
                            <ext:Button runat="server" ID="btnPrestamoNuevo" Text="Nuevo" Icon="Add">
                                 <Listeners>
                                <Click Handler="this.up('form').getForm().reset();"/>
                                </Listeners>
                            </ext:Button>
                    
                            <ext:Button runat="server" ID="btnGuardarPrestamoNuevo" Text="Guardar" Icon="DiskBlack">
                                <DirectEvents>
                                <Click 
                                    OnEvent="btnGuardarNuevoPrestamo" 
                                    Failure="Ext.MessageBox.alert('Error al guardar', 'Error al guardar');">
                                </Click>
                                </DirectEvents>
                            </ext:Button>
                            <ext:Button ID="btnCancelPrestamoNuevo" runat="server" Text="Cancelar" Icon="Cancel">
                            <Listeners>
                                <Click Handler="this.up('window').hide();" />
                            </Listeners>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                   
                 </BottomBar>
                </ext:FormPanel>
            </Items>
        </ext:TabPanel>
    </Items>
</ext:Window>