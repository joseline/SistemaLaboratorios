<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.master" AutoEventWireup="true" CodeFile="Prestamos.aspx.cs" Inherits="Default2" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<%@ Register src="PrestamoDetalle.ascx" tagname="PrestamoDetalle" tagprefix="uc1" %>
<%@ Register src="PrestamoNuevo.ascx" tagname="PrestamoNuevo" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">

<script type="text/javascript">

    var alumnoRenderer = function (value) {

        var r = App.ContentPlaceHolderBody_stPrestamoAlumno.getById(value);

        if (Ext.isEmpty(r)) {
            return "e";
        }

        return r.data.ALUMNO_CUENTA;
    };

    var usuarioRenderer = function (value) {
        var r = App.ContentPlaceHolderBody_stPrestamoUsuario.getById(value);

        if (Ext.isEmpty(r)) {
            return "";
        }

        return r.data.USUARIO_NOMBRE;
    };

    var articuloRenderer = function (value) {
        var r = App.ContentPlaceHolderBody_stPrestamoArticulo.getById(value);

        if (Ext.isEmpty(r)) {
            return "";
        }

        return r.data.ARTICULO_SERIE;
    };

    var equipoRenderer = function (value) {
        var r = App.ContentPlaceHolderBody_stPrestamoArticulo.getById(value);

        if (Ext.isEmpty(r)) {
            return "";
        }

        return r.data.ARTICULO_NOMBRE;
    };

    var tipoPrestamoRenderer = function (value) {
        if (value == 1) {
            return "EXTERNO";
        }
        if(value == 0)
        {
            return "INTERNO";
        }
        return "e";
    };
    


    var cellClick = function (view, cell, columnIndex, record, row, rowIndex, e) {
        var t = e.getTarget(),
                columnId = this.columns[columnIndex].id;


        if (columnId == "ContentPlaceHolderBody_editPrestamo") {
            return true;
        }
        return false;
    };
        
    </script>

<ext:Store 
    ID="stPrestamos" 
    runat="server" 
    PageSize="10">
    <Model>
        <ext:Model runat="server">
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
            </Fields>
        </ext:Model>
    </Model>
</ext:Store>
<ext:Store 
    ID="stPrestamoAlumno" 
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
<ext:Store ID="stPrestamoArticulo" runat="server">
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
    ID="stPrestamoUsuario" 
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



<div class= "Titulo">
        
        <h2>
            <span class= "TituloText">
                Lista Prestamos
            </span>
        </h2>
    </div>
<ext:FormPanel 
    ID = "fpPrestamos" 
    runat="server"
    Height = "350" 
    Width = "900" 
    Margin ="50"
    BodyPadding="0" 
    MonitorResize="true"  
    Shadow="true" 
    ShadowMode="Sides">
    <Items>
        <ext:GridPanel 
            ID = "gpPrestamos" 
            runat="server" 
            Title="Articulos" 
            StoreID =  "stPrestamos"
            EnableViewState="true" 
            Width="900" 
            Height="350">
            <TopBar>
               <ext:Toolbar runat="server">
                        <Items>
                            <ext:Button ID="btnNuevoArticulo" runat ="server" Text="Agregar Prestamo" Icon="UserAdd">
                                <DirectEvents>
                                    <Click OnEvent="mostrarVentanaPrestamoNuevo"></Click>
                                </DirectEvents>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
             </TopBar>
            <ColumnModel>
                <Columns>
                    <ext:Column runat = "server" DataIndex= "PRESTAMO_ALUMNO_ID" Text = "Cuenta">
                        <Renderer Fn="alumnoRenderer" />
                    </ext:Column>
                    <ext:Column runat = "server" DataIndex = "PRESTAMO_ARTICULO_ID" Text = "Serie">
                        <Renderer Fn ="articuloRenderer"/>
                    </ext:Column  >
                    <ext:Column runat ="server" DataIndex = "PRESTAMO_ARTICULO_ID" Text = "Equipo" Flex="1">
                        <Renderer Fn="equipoRenderer"/>
                    </ext:Column>
                    <ext:DateColumn runat="server" DataIndex = "PRESTAMO_FECHASALIDA" Text = "Fecha Salida" Format="dd-MM-yyyy">
                    </ext:DateColumn>
                    <ext:DateColumn runat="server" DataIndex = "PRESTAMO_FECHADEENTREGA" Text="Fecha de Entrega" Format="dd-MM-yyyy">
                    </ext:DateColumn>
                    <ext:Column runat="server" DataIndex = "PRESTAMO_TIPO" Text = "Tipo">
                        <Renderer Fn="tipoPrestamoRenderer"/>
                    </ext:Column>
                    <ext:ImageCommandColumn ID="editPrestamo" runat="server" Text="Detalles/Editar">
                            <Commands>
                                <ext:ImageCommand Icon="NoteEdit">
                                    <ToolTip Text="Editar" />
                                </ext:ImageCommand>
                            </Commands>
                        </ext:ImageCommandColumn>
                </Columns>
            </ColumnModel>
            <Listeners>
                    <Render Handler="this.on('cellclick', cellClick);"></Render>
            </Listeners>
            <DirectEvents>
               <CellClick OnEvent="mostrarVentanaPrestamoDetalle">
                   <ExtraParams>
                     <ext:Parameter Name="id" Value="record.data.PRESTAMO_ID" Mode="Raw" />
                     <ext:Parameter Name="alumnoid" Value="record.data.PRESTAMO_ALUMNO_ID" Mode="Raw"/>
                   </ExtraParams>
               </CellClick>
            </DirectEvents>
            <BottomBar>
                    <ext:PagingToolbar 
                        ID="pgPrestamosGrid" 
                        runat="server" 
                        DisplayInfo="true" 
                        EmptyMsg="No hay mas datos que mostrar">
                    </ext:PagingToolbar>
                </BottomBar>
            <View>
               <ext:GridView runat="server"></ext:GridView>
            </View>
            <SelectionModel>
               <ext:RowSelectionModel runat="server" Mode="Multi" />
            </SelectionModel>
            <Plugins>
                <ext:CellEditing runat="server" />
            </Plugins>
        </ext:GridPanel>
    </Items>
</ext:FormPanel>

<uc1:PrestamoDetalle ID="PrestamoDetalle1" runat="server"/>
<uc2:PrestamoNuevo ID="PrestamoNuevo1" runat="server" />
</asp:Content>

