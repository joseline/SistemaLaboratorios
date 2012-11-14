<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.master" AutoEventWireup="true" CodeFile="RevisionPorArticulo.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">

<style type="text/css">
    .combo-list {
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
    
<div class= "Titulo">
        
        <h2>
            <span class= "TituloText">
                Revision
            </span>
        </h2>
    </div>

<ext:Store 
    ID="stRevisionArticulo" 
    runat="server">
    <Model>
        <ext:Model runat="server" IDProperty="REVISION_ID">
            <Fields>
                <ext:ModelField Name="REVISION_ID"></ext:ModelField>
                <ext:ModelField Name="REVISION_ARTICULO_ID"></ext:ModelField>
                <ext:ModelField Name="REVISION_ESTADOARTICULO_ID"></ext:ModelField>
                <ext:ModelField Name="REVISION_FECHA"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
</ext:Store>

<ext:Window 
        runat="server" 
        Closable="false" 
        Width="350" 
        Height="200" 
        Icon="Wrench" 
        Title="Revision de Articulo">
    <Items>
    <ext:FormPanel 
        ID="fpRevision" 
        runat="server" 
        BodyPadding="7"  
        Width="350" 
        Height="200"
        BodyStyle="background-color: #CCCCCC; background-image: url('../../img/grey.png'); background-repeat: repeat;">
        <FieldDefaults LabelAlign="Left" LabelWidth="90" MsgTarget="Qtip"/>
        <Items>
            
            <ext:ComboBox 
                ID="cmbSerie" 
                runat="server" 
                FieldLabel="Serie" 
                Cls="LabelEstilo" 
                TypeAhead="true"
                QueryMode="Local"
                TriggerAction="All" 
                ValueNotFoundText="..." 
                ValueField="ARTICULO_ID" 
                DisplayField="ARTICULO_NOMBRE" 
                Width="300">
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
                <ListConfig Width="100" Height="400" ItemSelector=".x-boundlist-item">
                    <Tpl ID="Tpl1" runat="server">
                    <Html>
					<tpl for=".">
					<tpl if="[xindex] == 1">
						<table>
						<tr>
							<th class="Alumnocuenta">Serie</th>
					        <th class="Alumnonombre">Articulo</th>
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
            
            <ext:ComboBox 
                ID="cmbEstado" 
                runat="server" 
                FieldLabel="Estado" 
                Cls="LabelEstilo" 
                Width="300">
                <Store>
                 <ext:Store runat="server">
                        <Model>
                            <ext:Model runat="server">
                                <Fields>
                                    <ext:ModelField Name="REVISIONESTADO_ID">
                                    </ext:ModelField>
                                    <ext:ModelField Name="REVISIONESTADOID_DESCRIPCION">
                                    </ext:ModelField>
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
            </ext:ComboBox>
            <ext:DateField  
                runat="server" 
                FieldLabel="Fecha Revision" 
                Cls="LabelEstilo">
            </ext:DateField>
        </Items>
    </ext:FormPanel>
    </Items>
    <BottomBar>
        <ext:Toolbar runat="server">
            <Items>
                <ext:ToolbarFill runat="server" />
                <ext:Button runat="server" Text="Nuevo" Icon="Add">
                </ext:Button>
                <ext:Button runat="server" Text="Guardar" Icon="DiskBlack">
                </ext:Button>
                <ext:Button runat="server" Text="Cancelar" Icon="Cancel">
                </ext:Button>
            </Items>
        </ext:Toolbar>
    </BottomBar>
    </ext:Window>
</asp:Content>

