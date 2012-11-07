<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AlumnoDetalle.ascx.cs" Inherits="AlumnoDetalle" %>

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

<script type="text/javascript">
    
    var articuloNombre = function (value) {
        var r = App.ContentPlaceHolderBody_AlumnoDetalle1_stArticulos.getById(value);
        if (Ext.isEmpty(r)) {
            return "e";
        }
        return r.data.ARTICULO_NOMBRE;
    };

    var articuloModelo = function (value) {
        var r = App.ContentPlaceHolderBody_AlumnoDetalle1_stArticulos.getById(value);
        if (Ext.isEmpty(r)) {
            return "e";
        }
        return r.data.ARTICULO_MODELO;
    };

    var articuloSerie = function (value) {
        var r = App.ContentPlaceHolderBody_AlumnoDetalle1_stArticulos.getById(value);
        if (Ext.isEmpty(r)) {
            return "e";
        }
        return r.data.ARTICULO_SERIE;
    };
</script>

<ext:Store 
    ID="stAlumnoDetalle" 
    runat="server" 
    PageSize="1">
        <Model>
            <ext:Model  runat="server">
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
        <Listeners>
        <DataChanged
            Handler="var record = this.getAt(0) || {};#{formaAlumno}.getForm().loadRecord(record);#{formaAlumno}.clearInvalid();">
        </DataChanged>
    </Listeners>
</ext:Store>
<ext:Store 
    runat="server" 
    ID="stPrestamosRealizados" 
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
                <ext:ModelField Name="PRESTAMO_OBSERVACIONES"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_MULTA"></ext:ModelField>
                <ext:ModelField Name="PRESTAMO_MULTAPAGADA"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
    <Listeners>
        <DataChanged
            Handler="var record = this.getAt(0) || {};#{fpPrestamosRealizados}.getForm().loadRecord(record);#{fpPrestamosRealizados}.clearInvalid();">
        </DataChanged>
    </Listeners>
</ext:Store>
<ext:Store 
    ID="stArticulos" 
    runat="server">
    <Model>
        <ext:Model  runat="server" IDProperty="ARTICULO_ID">
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
        <Load Handler="#{gpPrestamosRealizados}.getView().refresh();" />
    </Listeners>
 </ext:Store>

<ext:Window 
    runat="server" 
    ID="AlumnoVentana" 
    Icon="User" 
    Title="Informacion" 
    Width="550" 
    Height="350" 
    AutoShow="false" 
    Modal="true" 
    Hidden="true"
    Layout="Fit">
    <Items>
        <ext:TabPanel 
            runat="server"  
            Border="false">
        <Items>
        <ext:FormPanel 
            runat="server" 
            ID="formaAlumno" 
            Title="Alumno" 
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
                            <ext:Label ID="Label1" 
                                runat="server" 
                                Text = "Editar Alumno" Height="30"
                                StyleSpec="font-family: Verdana; color: #666666; font-size: large; font-weight: bolder;"/>
                        </Items>
                    </ext:FieldContainer>
                <ext:TextField ID="txtId" runat="server" Name="ALUMNO_ID" Width="10" Hidden="true">
                </ext:TextField>
                <ext:TextField 
                    ID = "txtCuenta" 
                    runat="server"  
                    Name="ALUMNO_CUENTA" 
                    Icon="Key" 
                    MsgTarget="Side" 
                    AllowBlank="false" 
                    FieldLabel="Cuenta" 
                    Width="300" 
                    Margins="0 40 0 0" 
                    Cls="LabelEstilo">
                </ext:TextField>
                <ext:TextField 
                    ID = "txtNombre" 
                    runat="server" 
                    Name="ALUMNO_NOMBRE" 
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
                    Name="ALUMNO_CARRERA_ID" 
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
                <ext:TextField 
                    ID = "txtTelefono" 
                    runat="server" 
                    Name="ALUMNO_TELEFONO" 
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
                    Name="ALUMNO_CORREO" 
                    Icon="Mail" 
                    MsgTarget="Side" 
                    AllowBlank="false" 
                    FieldLabel="Correo" 
                    Width="300" 
                    Margins="0 40 0 0" 
                    Cls="LabelEstilo">
                </ext:TextField>
            </Items>
            <Buttons>
                <ext:Button runat="server" ID="btnGuardar" Text="Guardar" Icon="DiskBlack">
                  <DirectEvents>
                    <Click 
                      OnEvent="btnGuardarDetalleAlumno" 
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
                <ext:PagingToolbar ID="pgDetalle" StoreID="stAlumnoDetalle" runat="server" DisplayInfo="false" Visible="false">
                </ext:PagingToolbar>
           </BottomBar>
        </ext:FormPanel>
        <ext:FormPanel 
                    ID="fpPrestamosRealizados" 
                    runat="server" 
                    Title="Prestamos Realizados" 
                    Icon="UserEdit"
                    DefaultAnchor="100%"
                    BodyPadding="10" 
                    
                    BodyStyle="background-color: #CCCCCC; background-image: url('../../img/grey.png'); background-repeat: repeat;">
                    <Items>
                        <ext:GridPanel 
                                ID="gpPrestamosRealizados" 
                                runat="server" 
                                StripeRows="true" 
                                TrackMouseOver="true" 
                                AutoExpandColumn="articuloEquipo" 
                                ColumnLines="true"
                                Width="460" 
                                Height="250" 
                                Margins="0 0 0 0" 
                                StoreID="stPrestamosRealizados">
                                <ColumnModel>
                                    <Columns>
                                        <ext:Column ColumnID="articuloEquipo" runat="server" DataIndex="PRESTAMO_ARTICULO_ID" Text="Equipo">
                                            <Renderer Fn="articuloNombre"/>
                                        </ext:Column>
                                        <ext:Column runat="server" DataIndex="PRESTAMO_ARTICULO_ID" Text="Modelo">
                                            <Renderer Fn="articuloModelo"/>
                                        </ext:Column>
                                        <ext:Column runat="server" DataIndex="PRESTAMO_ARTICULO_ID" Text="Serie">
                                            <Renderer Fn="articuloSerie"/>
                                        </ext:Column>
                                        <ext:Column runat="server" Text="Fecha">
                                            <Columns>
                                                <ext:DateColumn  runat="server" DataIndex="PRESTAMO_FECHASALIDA" Text="Salida" Format="dd-MM-yyyy" Width="70">
                                                </ext:DateColumn>
                                                <ext:DateColumn  runat="server" DataIndex="PRESTAMO_FECHAENTRADA" Text="Entrada" Format="dd-MM-yyyy" Width="70">
                                                </ext:DateColumn>
                                                <ext:DateColumn  runat="server" DataIndex="PRESTAMO_FECHADEENTREGA" Text="A Entregar" Format="dd-MM-yyyy" Width="74">
                                                </ext:DateColumn>
                                            </Columns>
                                        </ext:Column>
                                    </Columns>
                                </ColumnModel>
                                <View>
                                    <ext:GridView runat="server"/>
                                </View>
                        </ext:GridPanel>
                    </Items>
        </ext:FormPanel>
        </Items>
        </ext:TabPanel>
    </Items>
</ext:Window>
