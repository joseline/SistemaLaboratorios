<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.master" AutoEventWireup="true" CodeFile="EquipoPrestado.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">
  
  <ext:Store 
    runat="server" 
    ID="stEquipoPrestadoReporte" 
    PageSize="10">
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
                <ext:ModelField Name="PRESTAMO_ID"></ext:ModelField>
            </Fields>
        </ext:Model>
    </Model>
  </ext:Store>
  <ext:Panel 
    runat="server" 
    Width="900" 
    Height="370" 
    Layout="BorderLayout" 
    Margin="50">
    <Items>
       <ext:GridPanel 
                    ID="gpEquipoPrestado" 
                    runat="server"  
                    Region="West" 
                    Width="550" 
                    Title="Equipos" 
                    MarginsSummary="5 5 5 5" 
                    StoreID="stEquipoPrestadoReporte">
                    <ColumnModel>
                        <Columns>
                            <ext:Column  runat="server" Text="Serie"  Name="ARTICULO_SERIE">
                            </ext:Column>
                            <ext:Column  runat="server" Text="Equipo" Name="ARTICULO_NOMBRE">
                            </ext:Column>
                            <ext:Column  runat="server" Text="Marca"  Name="ARTICULO_MARCA_ID">
                            </ext:Column>
                            <ext:Column  runat="server" Text="Modelo" Name="ARTICULO_MODELO">
                            </ext:Column>
                        </Columns>
                    </ColumnModel>
                    <SelectionModel>
                        <ext:RowSelectionModel runat="server" Mode="Single">
                            <DirectEvents>
                                <Select OnEvent="FilaSeleccionada" Buffer="250">
                                    <EventMask ShowMask="true" Target="CustomTarget" CustomTarget="#{fpEquipoPrestado}">
                                    </EventMask>
                                    <ExtraParams>
                                        <ext:Parameter Name="PrestamoId" Value="record.PRESTAMO_ID" Mode="Raw">
                                        </ext:Parameter>
                                    </ExtraParams>
                                </Select>
                            </DirectEvents>
                        </ext:RowSelectionModel>
                    </SelectionModel>
                    <BottomBar>
                        <ext:PagingToolbar 
                        runat="server" 
                        DisplayInfo="true" 
                        EmptyMsg="No hay mas datos que mostrar">
                        </ext:PagingToolbar>
                    </BottomBar>
                </ext:GridPanel>
       <ext:FormPanel 
                    ID="fpEquipoPrestado" 
                    runat="server" 
                    Region="Center" 
                    Title="Prestamo" 
                    BodyPadding="3" 
                    Frame="true">
                    <FieldDefaults LabelAlign="Left" LabelWidth="70" MsgTarget="Qtip" />
                    <Items>
                        <ext:FieldSet 
                            runat="server" 
                            Title="Informacion de Alumno"
                            Layout="AnchorLayout"
                            DefaultAnchor="100%" 
                            Margins="1 1 1 1">
                            <Items>
                                <ext:Container  
                                    runat="server" 
                                    Layout="HBoxLayout" 
                                    Margin="5">
                                    <Items>
                                        <ext:TextField ID="txtCuenta" runat="server" FieldLabel="Cuenta">
                                        </ext:TextField>
                                    </Items>
                                </ext:Container>
                                <ext:Container  
                                    runat="server" 
                                    Layout="HBoxLayout" 
                                    Margin="5">
                                    <Items>
                                        <ext:TextField  runat="server" FieldLabel="Nombre" Width="300">
                                        </ext:TextField>
                                    </Items>
                                </ext:Container>
                                <ext:Container  
                                    runat="server" 
                                    Layout="HBoxLayout" 
                                    Margin="5">
                                    <Items>
                                        <ext:TextField runat="server" FieldLabel="Telefono">
                                        </ext:TextField>
                                    </Items>
                                </ext:Container>
                                <ext:Container 
                                    runat="server" 
                                    Layout="HBoxLayout" 
                                    Margin="5">
                                    <Items>
                                         <ext:TextField runat="server" FieldLabel="Correo" Width="300">
                                        </ext:TextField>
                                    </Items>
                                </ext:Container>
                            </Items>
                        </ext:FieldSet>
                        <ext:FieldSet 
                            runat="server" 
                            Title="Informacion de Prestamo"
                            Layout="AnchorLayout"
                            DefaultAnchor="100%" 
                            Margins="1 1 1 1">
                            <Items>
                                <ext:Container  
                                    runat="server" 
                                    Layout="HBoxLayout" 
                                    Margin="5">
                                    <Items>
                                        <ext:TextField  runat="server" FieldLabel="Responsable">
                                        </ext:TextField>
                                    </Items>
                                </ext:Container>
                                <ext:Container  
                                    runat="server" 
                                    Layout="HBoxLayout" 
                                    Margin="5">
                                <Items>
                                    <ext:DateField  runat="server" FieldLabel="Fecha Salida">
                                    </ext:DateField>
                                    
                                </Items>
                                </ext:Container>
                                <ext:Container 
                                    runat="server" 
                                    Layout="HBoxLayout" 
                                    Margin="5">
                                    <Items>
                                        <ext:DateField runat="server" FieldLabel="Fecha a Entregar">
                                    </ext:DateField>
                                    </Items>
                                </ext:Container>
                                <ext:Container  
                                    runat="server" 
                                    Layout="HBoxLayout" 
                                    Margin="5">
                                    <Items>
                                        <ext:Checkbox runat="server" FieldLabel="Interno">
                                        </ext:Checkbox>
                                        
                                    </Items>
                                </ext:Container>
                                <ext:Container 
                                    runat="server" 
                                    Layout="HBoxLayout" 
                                    Margin="5">
                                    <Items>
                                        <ext:TimeField runat="server" FieldLabel="Hora Inicio">
                                        </ext:TimeField>
                                    </Items>
                                </ext:Container>
                            </Items>
                        </ext:FieldSet>
                    </Items>
                </ext:FormPanel>
    </Items>
  </ext:Panel>
            
        
</asp:Content>

