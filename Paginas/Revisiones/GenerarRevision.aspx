<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.master" AutoEventWireup="true" CodeFile="GenerarRevision.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" Runat="Server">

<style type="text/css">
    .LabelEstilo
        {
            font-family: Verdana;
            color: Gray;
            font-weight: bold;
            font-size: medium;
        }
</style>

<ext:Window 
     runat="server" 
     Height="180" 
     Width="250" 
     Resizable="false" 
     Icon="Wrench" 
     Title="Generar Revision">
    <Items>
        <ext:FormPanel 
            runat="server" 
            Height="180" 
            Width="250" 
            BodyPadding="3" 
            BodyStyle="background-color: #CCCCCC; background-image: url('../../img/grey.png'); background-repeat: repeat;">
            <FieldDefaults LabelAlign="Left" LabelWidth="90" MsgTarget="Qtip"/>
            <Items>

                <ext:Container runat="server" Layout="HBoxLayout" Margin="20">
                    <Items>
                        <ext:NumberField 
                        ID="year" 
                        runat="server"  
                        Width="200"
                        Number="<%# DateTime.Now.Year %>"
                        MinValue="<%# DateTime.Now.Year %>"
                        AutoDataBind="true"
                        AllowBlank="false" 
                        FieldLabel = "Año" 
                        Cls="LabelEstilo">
                        </ext:NumberField>
                    </Items>
                </ext:Container>
                <ext:Container runat="server" Layout="HBoxLayout" Margin="20">
                    <Items>
                        <ext:NumberField 
                        ID="trimestre" 
                        runat ="server" 
                        FieldLabel = "Trimestre" 
                        MinValue= "1" 
                        MaxValue="4" 
                        Cls="LabelEstilo" 
                        Width="200">  
                        </ext:NumberField>
                    </Items>
                </ext:Container>
                
            </Items>
        </ext:FormPanel>
    </Items>
    <BottomBar>
                <ext:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                        <ext:Button runat="server" ID="btnGuardar" Icon="DiskBlack" Text="Guardar">
                        </ext:Button>
                        <ext:Button runat="server" ID="btnCancelar" Icon= "Cancel" Text="Cancelar">
                        </ext:Button>
                    </Items>
                </ext:Toolbar>
            </BottomBar>
</ext:Window>

</asp:Content>

