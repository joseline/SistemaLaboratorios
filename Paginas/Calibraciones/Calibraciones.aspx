<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.master" AutoEventWireup="true" CodeFile="Calibraciones.aspx.cs" Inherits="Default2" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<%@ Register src="CalibracionDetalle.ascx" tagname="CalibracionDetalle" tagprefix="uc1" %>
<%@ Register src="CalibracionNuevo.ascx" tagname="CalibracionNuevo" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">

<script type="text/javascript">
    var estadoRenderer = function (value) {
        if (value == 0) {
            return "OK";
        }
        if (value == 1) {
            return "INADECUADO";
        }
        return " ";
    };

    var serieRenderer = function (value) {
        var r = App.ContentPlaceHolderBody_stCaliArticulos.getById(value);

        if (Ext.isEmpty(r)) {
            return "e";
        }

        return r.data.ARTICULO_SERIE;
    };

    var articuloRenderer = function (value) {
        var r = App.ContentPlaceHolderBody_stCaliArticulos.getById(value);

        if (Ext.isEmpty(r)) {
            return "e";
        }

        return r.data.ARTICULO_NOMBRE;
    };

    var usuarioRenderer = function (value) {
        var r = App.ContentPlaceHolderBody_stCaliUsuarios.getById(value);

        if (Ext.isEmpty(r)) {
            return "e";
        }

        return r.data.USUARIO_NOMBRE;
    };
       

    var cellClick = function (view, cell, columnIndex, record, row, rowIndex, e) {
        var t = e.getTarget(),
                columnId = this.columns[columnIndex].id; // Get column id

        //Ext.Msg.alert('holA', columnId);
        if (columnId == "ContentPlaceHolderBody_editCali") {

            //the ajax call is allowed
            return true;
        }

        //forbidden
        return false;
    };
        
    </script>


<ext:Store 
    ID="stCalibraciones" 
    runat ="server" 
    PageSize="10">
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
    <AutoLoadParams>
            <ext:Parameter Name="start" Value="0" Mode="Raw" />
            <ext:Parameter Name="limit" Value="10" Mode="Raw" />
    </AutoLoadParams>
    <Sorters>
      <ext:DataSorter Property="CALIBRACION_ID" Direction="DESC" />
    </Sorters> 
</ext:Store>

<ext:Store 
    ID="stCaliArticulos" 
    runat="server">
    <Model>
        <ext:Model ID="Model1" runat="server" IDProperty="ARTICULO_ID">
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
      <Load Handler="#{gpCalibraciones}.getView().refresh();" />
    </Listeners>
</ext:Store>

<ext:Store 
    ID="stCaliUsuarios" 
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
      <Load Handler="#{gpCalibraciones}.getView().refresh();" />
    </Listeners>
</ext:Store>
<div class= "Titulo">
        <h2>
            <span class= "TituloText">
                Lista Calibraciones
            </span>
        </h2>
    </div>

<ext:FormPanel 
    ID="fpCalibraciones" 
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
        ID="gpCalibraciones" 
        runat="server" 
        Title="Calibraciones" 
        StoreID =  "stCalibraciones" 
        EnableViewState="true" 
        Width="900" 
        Height="350">
        <TopBar>
            <ext:Toolbar runat="server">
               <Items>
                 <ext:Button ID="btnNuevoCalibracion" runat ="server" Text="Agregar Mantenimiento" Icon="UserAdd">
                    <DirectEvents>
                     <Click OnEvent="mostrarVentanaCalibracionNuevo"></Click>
                    </DirectEvents>
                  </ext:Button>
                </Items>
            </ext:Toolbar>
        </TopBar>
        <ColumnModel>
         <Columns>
            <ext:Column runat="server" DataIndex="CALIBRACION_ARTICULO_ID" Text="Serie">
                <Renderer Fn="serieRenderer"/>
            </ext:Column>
            <ext:Column runat="server" DataIndex="CALIBRACION_ARTICULO_ID" Text="Articulo" Flex="1">
                <Renderer Fn="articuloRenderer"/>
            </ext:Column>    
            <ext:DateColumn runat="server" DataIndex="CALIBRACION_FECHA" Text="Fecha" Format="dd-MM-yyyy">
            </ext:DateColumn>
            <ext:Column runat="server" DataIndex="CALIBRACION_USUARIO_ID_RESPONSABLE" Text="Responsable" Width="200">
                <Renderer Fn="usuarioRenderer"/>
            </ext:Column>
            <ext:Column runat="server" DataIndex="CALIBRACION_ESTADO" Text="Estado">
                <Renderer Fn="estadoRenderer"/>
            </ext:Column>
            <ext:ImageCommandColumn runat="server" ID="editCali" Text="Detalles/Editar">
                <Commands>
                  <ext:ImageCommand Icon="NoteEdit" CommandName="Edit">
                      <ToolTip Text="Edit" />
                   </ext:ImageCommand>
                 </Commands>
            </ext:ImageCommandColumn>
         </Columns>
        </ColumnModel>
        <Listeners>
             <Render Handler="this.on('cellclick', cellClick);"></Render>
        </Listeners>
        <DirectEvents>
             <CellClick OnEvent="mostrarVentanaCaliDetalle">
               <EventMask ShowMask="true" CustomTarget="={#{gpCalibraciones}.body}" />
               <ExtraParams>
               <ext:Parameter Name="id" Value="record.data.CALIBRACION_ID" Mode="Raw" />
               <ext:Parameter Name="articulo" Value="record.data.CALIBRACION_ARTICULO_ID" Mode="Raw"/>
               </ExtraParams>
               </CellClick>
               </DirectEvents>
        <BottomBar>
        <ext:PagingToolbar 
         ID="pgCalibracionesGrid" 
          runat="server" 
          DisplayInfo="true" 
          EmptyMsg="No hay mas datos que mostrar">
        </ext:PagingToolbar>
        </BottomBar>
                <View>
                    <ext:GridView  runat="server"></ext:GridView>
                </View>
                <SelectionModel>
                    <ext:RowSelectionModel  runat="server" Mode="Multi" />
                </SelectionModel>
                <Plugins>
                    <ext:CellEditing  runat="server" />
                </Plugins>
    </ext:GridPanel>
    </Items>
</ext:FormPanel>
<uc1:CalibracionDetalle ID="CalibracionDetalle1" runat="server"/>
<uc2:CalibracionNuevo ID="CalibracionNuevo1" runat="server" />
</asp:Content>

