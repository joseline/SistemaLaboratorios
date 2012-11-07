using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext;
using Ext.Net;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public partial class Paginas_Mantenimientos_MantenimientoNuevo : System.Web.UI.UserControl
{
    dsLaboratoriosBDTableAdapters.MANTENIMIENTOSTableAdapter mantenimientos = new dsLaboratoriosBDTableAdapters.MANTENIMIENTOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter alumnos = new dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articulos = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    dsLaboratoriosBDTableAdapters.MARCASTableAdapter marcas = new dsLaboratoriosBDTableAdapters.MARCASTableAdapter();
    dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter usuarios = new dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        // tipo
        var storeTipo = this.sltTipoMantenimiento.GetStore();
        storeTipo.DataSource = new object[]
        {
            new object[] {0,"CORRECTIVO"},
            new object[] {1, "PREVENTIVO"}
        };
        storeTipo.DataBind();
        //Articulos
        this.stMantenimientoArticuloNuevo.DataSource = articulos.GetData();
        this.stMantenimientoArticuloNuevo.DataBind();
        //Marcas
        this.stMantenimientoMarcaNuevo.DataSource = marcas.GetData();
        this.stMantenimientoMarcaNuevo.DataBind();
        //usuarios
        this.stMantenimientoUsuarioNuevo.DataSource = usuarios.GetData();
        this.stMantenimientoUsuarioNuevo.DataBind();
    }
    public Store GridStore { get; set; }
    public void Show()
    {
        Limpiar();
        this.VentanaMantenimientoNuevo.Show();
    }
    public void Limpiar() 
    {
        this.formaMantenimiento.Reset();
    }
    protected void btnGuardarNuevoMantenimiento(object sender, DirectEventArgs e)
    {
        try 
        {
            int ar_marca = int.Parse(this.sltMarca.SelectedItem.Value);
            int ar_id = int.Parse(this.cmbSerie.SelectedItem.Value);
            DateTime fecha = this.dteFecha.SelectedDate;
            int tipoMantenimiento = int.Parse(this.sltTipoMantenimiento.SelectedItem.Value);
            int responsable = int.Parse(this.sltResponsable.SelectedItem.Value);
            string falla = this.txtFalla.Text;
            string accion = this.txtAccion.Text;
            string repuestos = this.txtRepuestos.Text;
            mantenimientos.Insert_Mantenimiento(ar_id, ar_marca, fecha, responsable, falla, accion, repuestos, tipoMantenimiento);
           
            this.GridStore.Reload();
            this.VentanaMantenimientoNuevo.Hide();
        }
        catch(Exception)
        {
            Ext.Net.Notification.Show(new NotificationConfig
            {
                Title = "Error Al guardar",
                Icon = Icon.Error,
                Width = 400,
                Height = 100,
                Html = "Ingreso de datos incorretos",
                Shadow = true,

            });
        }
        
    }
    
}