<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.master" AutoEventWireup="true" CodeFile="Alumnos.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<%@ Register src="AlumnoDetalle.ascx" tagname="AlumnoDetalle" tagprefix="uc1" %>
<%@ Register src="AlumnoNuevo.ascx" tagname="AlumnoNuevo" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">
   
    <script type="text/javascript">

        var carreraRenderer = function (value) {
            var r = App.ContentPlaceHolderBody_stCarreras.getById(value);

            if (Ext.isEmpty(r)) {
                return "";
            }

            return r.data.CARRERA_NOMBRE;
        };
            
        var onCommand = function (column, command, record, recordIndex, cellIndex) {
            Ext.Msg.alert('holA', record.data.ALUMNO_CUENTA);
            //Ext.Msg.alert('Command', 'Command = ' + command + '<br/>' + 'Column = ' + column.grid.columns[cellIndex].dataIndex);
        };

        var cellClick = function (view, cell, columnIndex, record, row, rowIndex, e) {
            var t = e.getTarget(),
                columnId = this.columns[columnIndex].id; // Get column id
                
                //Ext.Msg.alert('holA', columnId);
                if (columnId == "ContentPlaceHolderBody_Detalles") {
       
                //the ajax call is allowed
                return true;
            }

            //forbidden
            return false;
        };
        
    </script>
    <script type="text/javascript">

        var AplicarFiltro = function (field, tipo) {
            debugger;
            var store = App.ContentPlaceHolderBody_gpAlumnos.getStore();
            store.filterBy(ObtenerRecordFiltro(tipo));

        };

        var LimpiarFiltro = function () {
            debugger;
            App.ContentPlaceHolderBody_cmbtipoCampo.reset();
            App.ContentPlaceHolderBody_txtValorFiltro.reset();
            App.ContentPlaceHolderBody_stAlumnos.clearFilter();
        };

        var filtroCadena = function (value, dataIndex, record) {
            debugger;
            var val = record.get(dataIndex);

            if (typeof val != "string") {
                return value.length == 0;
            }

            return val.toLowerCase().indexOf(value.toLowerCase()) > -1;
        };

        var filtroNumero = function (value, dataIndex, record) {
            debugger;
            var val = record.get(dataIndex);

            if (!Ext.isEmpty(value, false) && val != value) {
                return false;
            }

            return true;
        };
        var ObtenerRecordFiltro = function (tipo) {
            debugger;
            var f = [];
            if (tipo == 1) {
                f.push({
                    filter: function (record) {
                        return filtroNumero(App.ContentPlaceHolderBody_txtValorFiltro.getValue(), "ALUMNO_CUENTA", record);
                    }
                });
            }
            if (tipo == 2) {
                f.push({
                    filter: function (record) {
                        return filtroCadena(App.ContentPlaceHolderBody_txtValorFiltro.getValue() || "", "ALUMNO_NOMBRE", record);
                    }
                });
            }
            if (tipo == 3) {
                f.push({
                    filter: function (record) {
                        return filtroNumero(App.ContentPlaceHolderBody_txtValorFiltro.getValue(), "ALUMNO_CARRERA_ID", record);
                    }
                });
            }


            var len = f.length;

            return function (record) {
                for (var i = 0; i < len; i++) {
                    if (!f[i].filter(record)) {
                        return false;
                    }
                }
                return true;
            };
        };
    </script>
    
   
    <ext:Store 
    ID="stAlumnos" 
    runat="server" 
    PageSize="10">
        <Model>
            <ext:Model runat="server" IDProperty="ALUMNO_ID">
                <Fields>
                    <ext:ModelField Name="ALUMNO_ID"            Type="Int"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_CUENTA"        Type="Float"></ext:ModelField>
                    <ext:ModelField Name="ALUMNO_NOMBRE">                   </ext:ModelField>
                    <ext:ModelField Name="ALUMNO_TELEFONO">                 </ext:ModelField>
                    <ext:ModelField Name="ALUMNO_CORREO">                   </ext:ModelField>
                    <ext:ModelField Name="ALUMNO_CARRERA_ID">               </ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
        <AutoLoadParams>
            <ext:Parameter Name="start" Value="0" Mode="Raw" />
            <ext:Parameter Name="limit" Value="10" Mode="Raw" />
       </AutoLoadParams>
       <Sorters>
          <ext:DataSorter Property="ALUMNO_NOMBRE" Direction="ASC" />
       </Sorters> 
    </ext:Store>
    
    <ext:Store 
        ID="stCarreras" 
        runat="server">
        <Model>
            <ext:Model runat="server" IDProperty="CARRERA_ID">
                <Fields>
                    <ext:ModelField Name="CARRERA_ID"></ext:ModelField>
                    <ext:ModelField Name="CARRERA_NOMBRE"></ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
        <Listeners>
            <Load Handler="#{gpAlumnos}.getView().refresh();" />
        </Listeners>
    </ext:Store>
    <div class= "Titulo">
        <h2>
            <span class= "TituloText">
                Lista Alumnos
            </span>
        </h2>
    </div>
    
    <ext:FormPanel 
        ID = "fpAlumnos" 
        runat = "server" 
        Height = "350" 
        Width = "900" 
        Margin ="50"  
        BodyPadding="0" 
        MonitorResize="true"  
        Shadow="true" 
        ShadowMode="Sides">
        <Items>
            <ext:GridPanel 
                ID="gpAlumnos" 
                runat="server" 
                Title="Alumnos" 
                StoreID="stAlumnos"
                StripeRows="true"
                TrackMouseOver="true" 
                EnableViewState="true" 
                Width="900" 
                Height="350">
                
                <TopBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:Button ID="btnNuevoAlumno" runat ="server" Text="Agregar Alumno" Icon="UserAdd">
                                <DirectEvents>
                                    <Click OnEvent="mostrarVentanaAlumnoNuevo"></Click>
                                </DirectEvents>
                            </ext:Button>
                            <ext:ToolbarSpacer runat="server"></ext:ToolbarSpacer>
                            <ext:ComboBox ID = "cmbtipoCampo" runat="server" FieldLabel=" Filtrar por" DisplayField= "CAMPO_NOMBRE" ValueField ="CAMPO_ID">
                                <Store>
                                    <ext:Store runat="server">
                                        <Model>
                                            <ext:Model  runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="CAMPO_ID"></ext:ModelField>
                                                    <ext:ModelField Name="CAMPO_NOMBRE"></ext:ModelField>
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store>
                            </ext:ComboBox>
                            <ext:TriggerField 
                                ID="txtValorFiltro" 
                                runat="server" 
                                FieldLabel="Valor filtro" 
                                EnableKeyEvents="true">
                                <Triggers>
                                    <ext:FieldTrigger Icon="Clear" />
                                </Triggers>
                                <Listeners>
                                    <KeyUp Handler="AplicarFiltro(this,#{cmbtipoCampo}.getValue());" Buffer="250">
                                    </KeyUp>
                                    <TriggerClick Handler="LimpiarFiltro();"/>
                                </Listeners>
                            </ext:TriggerField>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <ColumnModel>
                    <Columns>
                        
                        <ext:Column runat="server" DataIndex="ALUMNO_CUENTA" Text="Cuenta">
                        </ext:Column>
                        <ext:Column runat="server" DataIndex="ALUMNO_NOMBRE" Text="Nombre" Width = "300">
                        </ext:Column>
                        <ext:Column runat="server" DataIndex="ALUMNO_TELEFONO" Text="Telefono">
                           
                        </ext:Column>
                        <ext:Column runat="server" DataIndex="ALUMNO_CARRERA_ID" Text="Carrera" Width="200">
                            <Renderer Fn="carreraRenderer" />
                        </ext:Column>
                        <ext:Column runat="server" DataIndex="ALUMNO_CORREO" Text="Correo">
                        </ext:Column>
                        <ext:ImageCommandColumn ID="Detalles" runat="server" Width="95" Text="Detalles/Editar">
                            <Commands>
                                <ext:ImageCommand Icon="NoteEdit">
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
                    <CellClick OnEvent="mostrarVentanaAlumnoDetalle">
                        <ExtraParams>
                            <ext:Parameter Name="id" Value="record.data.ALUMNO_ID" Mode="Raw" />
                        </ExtraParams>
                    </CellClick>
                </DirectEvents>
                <BottomBar>
                    <ext:PagingToolbar 
                        ID="pgAlumnosGrid" 
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
        <Loader>
            <LoadMask ShowMask="false"/>
        </Loader>
    </ext:FormPanel>
    <uc1:AlumnoDetalle ID = "AlumnoDetalle1" runat="server" />
    <uc2:AlumnoNuevo ID="AlumnoNuevo1" runat="server" />
    
</asp:Content>

