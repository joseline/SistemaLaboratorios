<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.master" AutoEventWireup="true" CodeFile="Articulos.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<%@ Register src="ArticuloDetalle.ascx" tagname="ArticuloDetalle" tagprefix="uc1" %>
<%@ Register src="ArticuloNuevo.ascx" tagname="ArticuloNuevo" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">
 
 <script type="text/javascript">

     var laboratorioRenderer = function (value) {

         var r = App.ContentPlaceHolderBody_stArticuloLab.getById(value);

          if (Ext.isEmpty(r)) {
             return "e";
           }

        return r.data.LABORATORIO_NOMBRE;
     };

     var marcaRenderer = function (value) {
         var r = App.ContentPlaceHolderBody_stArticuloMarca.getById(value);

         if (Ext.isEmpty(r)) {
             return "";
         }

         return r.data.MARCA_NOMBRE;
     };

     
     var cellClick = function (view, cell, columnIndex, record, row, rowIndex, e) {
         var t = e.getTarget(),
                columnId = this.columns[columnIndex].id;


         if (columnId == "ContentPlaceHolderBody_editArticulo") {
             return true;
         }
         return false;
     };
        
    </script>

 <ext:Store 
    ID="stArticulos" 
    runat="server" 
    PageSize="10">
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
    <AutoLoadParams>
            <ext:Parameter Name="start" Value="0" Mode="Raw" />
            <ext:Parameter Name="limit" Value="10" Mode="Raw" />
       </AutoLoadParams>
    <Sorters>
      <ext:DataSorter Property="ARTICULO_SERIE" Direction="ASC" />
    </Sorters> 
 </ext:Store>
 <ext:Store 
    ID="stArticuloMarca" 
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
            <Load Handler="#{gpArticulos}.getView().refresh();" />
        </Listeners>
 </ext:Store>
 
 <ext:Store 
    ID="stArticuloLab" 
    runat="server">
    <Model>
        <ext:Model runat="server" IDProperty = "LABORATORIO_ID" >
            <Fields>
                <ext:ModelField Name = "LABORATORIO_ID"></ext:ModelField>
                <ext:ModelField Name = "LABORATORIO_NOMBRE"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
    <Listeners>
      <Load Handler="#{gpArticulos}.getView().refresh();" />
    </Listeners>
 </ext:Store>
 <div class= "Titulo">
        <h2>
            <span class= "TituloText">
                Lista Equipo
            </span>
        </h2>
    </div>
 
 <ext:FormPanel 
    ID="fpArticulos" 
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
            ID="gpArticulos" 
            runat="server" 
            Title="Articulos" 
            StoreID =  "stArticulos"
            EnableViewState="true" 
            Width="900" 
            Height="350">
            <TopBar>
               <ext:Toolbar runat="server">
                        <Items>
                            <ext:Button ID="btnNuevoArticulo" runat ="server" Text="Agregar Equipo" Icon="UserAdd">
                                <DirectEvents>
                                    <Click OnEvent="mostrarVentanaArticuloNuevo"></Click>
                                </DirectEvents>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
             </TopBar>
            <ColumnModel>
                    <Columns>
                        <ext:Column runat="server" DataIndex="ARTICULO_SERIE" Text="Serie">
                        </ext:Column>
                        <ext:Column runat="server" DataIndex="ARTICULO_NOMBRE" Text = "Equipo" Flex="1">
                        </ext:Column>
                        <ext:Column runat="server" DataIndex="ARTICULO_MARCA_ID" Text="Marca" Width="170">
                           <Renderer Fn= "marcaRenderer" />
                        </ext:Column>
                        <ext:Column runat="server" DataIndex="ARTICULO_MODELO" Text="Modelo" Width="100">
                        </ext:Column>
                        <ext:Column runat="server" DataIndex="ARTICULO_COLOR" Text="Color">
                        </ext:Column>
                        <ext:Column runat="server" DataIndex="ARTICULO_LABORATORIO_ID" Text="Laboratorio" Width="220">
                            <Renderer Fn="laboratorioRenderer"></Renderer>
                        </ext:Column>
                        <ext:ImageCommandColumn ID="editArticulo" runat="server" Text="Detalles/Editar">
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
               <CellClick OnEvent="mostrarVentanaArticuloDetalle">
                 <EventMask ShowMask="true" CustomTarget="={#{gpArticulos}.body}" />
                   <ExtraParams>
                     <ext:Parameter Name="id" Value="record.data.ARTICULO_SERIE" Mode="Raw" />
                   </ExtraParams>
               </CellClick>
            </DirectEvents>
            <BottomBar>
                    <ext:PagingToolbar 
                        ID="pgArticulosGrid" 
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
 <uc1:ArticuloDetalle ID="ArticuloDetalle1" runat="server"/>
 <uc2:ArticuloNuevo ID="ArticuloNuevo1" runat="server"/>
 
</asp:Content>

