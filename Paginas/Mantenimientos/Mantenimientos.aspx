<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.master" AutoEventWireup="true" CodeFile="Mantenimientos.aspx.cs" Inherits="Default2" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<%@ Register src="MantenimientoDetalle.ascx" tagname="MantenimientoDetalle" tagprefix="uc1" %>
<%@ Register src="MantenimientoNuevo.ascx" tagname="MantenimientoNuevo" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">

<script type="text/javascript">

//    var serieRenderer = function (value) {

//        var r = App.ContentPlaceHolderBody_stMantenimientosArticulos.getById(value);

//        if (Ext.isEmpty(r)) {
//            return "fuck";
//        }

//        return r.data.ARTICULO_SERIE;
    //    };
    var tipoRenderer = function (value) {
        if (value == 0) {
            return "CORRECTIVO";
        }
        if (value == 1) {
            return "PREVENTIVO";
        }
        return " ";
    };

    var usuarioRenderer = function (value) {
        var r = App.ContentPlaceHolderBody_stMantUsuarios.getById(value);

        if (Ext.isEmpty(r)) {
           return "fuck";
        }

       return r.data.USUARIO_NOMBRE;
   };

   var serieRenderer = function (value) {
       var r = App.ContentPlaceHolderBody_stMantArticulos.getById(value);

       if (Ext.isEmpty(r)) {
           return "fuck";
       }

       return r.data.ARTICULO_SERIE;
   };

   var articuloRenderer = function (value) {
       var r = App.ContentPlaceHolderBody_stMantArticulos.getById(value);

       if (Ext.isEmpty(r)) {
           return "fuck";
       }

       return r.data.ARTICULO_NOMBRE;
   };

    var cellClick = function (view, cell, columnIndex, record, row, rowIndex, e) {
        var t = e.getTarget(),
                columnId = this.columns[columnIndex].id;


        if (columnId == "ContentPlaceHolderBody_editMantenimiento") {
            return true;
        }
        return false;
    };
        
</script>

<ext:Store 
    ID="stMantenimientos" 
    runat="server" 
    PageSize="10">
    <Model>
        <ext:Model runat ="server">
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
    <AutoLoadParams>
            <ext:Parameter Name="start" Value="0" Mode="Raw" />
            <ext:Parameter Name="limit" Value="10" Mode="Raw" />
    </AutoLoadParams>
    <Sorters>
      <ext:DataSorter Property="MANTENIMIENTO_ID" Direction="DESC" />
    </Sorters> 
</ext:Store>

<ext:Store 
    ID="stMantUsuarios" 
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
    <Listeners>
      <Load Handler="#{gpMantenimientos}.getView().refresh();" />
    </Listeners>
</ext:Store>

<ext:Store 
    ID="stMantArticulos" 
    runat="server">
    <Model>
        <ext:Model runat="server" IDProperty="ARTICULO_ID">
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
      <Load Handler="#{gpMantenimientos}.getView().refresh();" />
    </Listeners>
</ext:Store>

<div class= "Titulo">
        <h2>
            <span class= "TituloText">
                Lista Mantenimientos
            </span>
        </h2>
    </div>
<ext:FormPanel 
    ID="fpMantenimientos" 
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
            ID="gpMantenimientos" 
            runat="server" 
            Title="Mantenimientos" 
            StoreID =  "stMantenimientos"
            EnableViewState="true" 
            Width="900" 
            Height="350">
            <TopBar>
                <ext:Toolbar runat="server">
                        <Items>
                            <ext:Button ID="btnNuevoMantenimiento" runat ="server" Text="Agregar Mantenimiento" Icon="UserAdd">
                                <DirectEvents>
                                    <Click OnEvent="mostrarVentanaMantenimientoNuevo"></Click>
                                </DirectEvents>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
            </TopBar>
            <ColumnModel>
                <Columns>
                    <ext:Column runat="server" DataIndex="MANTENIMIENTO_ARTICULO_ID" Text="Serie">
                        <Renderer Fn="serieRenderer" />
                    </ext:Column>
                    <ext:Column runat="server" DataIndex="MANTENIMIENTO_ARTICULO_ID" Text="Articulo" Flex="1">
                        <Renderer Fn="articuloRenderer"/>
                    </ext:Column>
                    <ext:DateColumn runat="server" DataIndex="MANTENIMIENTO_FECHA" Text="Fecha" Format="dd-MM-yyyy">
                    </ext:DateColumn>
                    <ext:Column runat="server" DataIndex="MANTENIMIENTO_USUARIO_ID_RESPONSABLE" Text="Responsable" Width="200">
                        <Renderer Fn="usuarioRenderer"/>
                    </ext:Column>
                    <ext:Column runat="server" DataIndex="MANTENIMIENTO_TIPO" Text="Tipo">
                        <Renderer Fn="tipoRenderer"></Renderer>
                    </ext:Column>
                    <ext:ImageCommandColumn ID="editMantenimiento" runat="server" Text="Detalles/Editar">
                        <Commands>
                                <ext:ImageCommand Icon="NoteEdit" CommandName="Edit">
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
               <CellClick OnEvent="mostrarVentanaMantenimientoDetalle">
                 <EventMask ShowMask="true" CustomTarget="={#{gpMantenimientos}.body}" />
                   <ExtraParams>
                     <ext:Parameter Name="id" Value="record.data.MANTENIMIENTO_ID" Mode="Raw" />
                   </ExtraParams>
               </CellClick>
            </DirectEvents>
            <BottomBar>
                    <ext:PagingToolbar 
                        ID="pgMantenimientosGrid" 
                        runat="server" 
                        DisplayInfo="true" 
                        EmptyMsg="No hay mas datos que mostrar">
                    </ext:PagingToolbar>
                </BottomBar>
            <View>
               <ext:GridView  runat="server"></ext:GridView>
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
<uc1:MantenimientoDetalle ID="MantenimientoDetalle1" runat="server"/>
<uc2:MantenimientoNuevo ID="MantenimientoNuevo1" runat="server"/>
</asp:Content>

