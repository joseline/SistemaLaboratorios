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

public partial class Paginas_Mantenimientos_MantenimientoDetalle : System.Web.UI.UserControl
{
    dsLaboratoriosBDTableAdapters.MANTENIMIENTOSTableAdapter mantenimientos = new dsLaboratoriosBDTableAdapters.MANTENIMIENTOSTableAdapter();
    //dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter alumnos = new dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articulos = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    dsLaboratoriosBDTableAdapters.MARCASTableAdapter marcas = new dsLaboratoriosBDTableAdapters.MARCASTableAdapter();
    dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter usuarios = new dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        var storeTipo = this.sltTipoMantenimiento.GetStore();
        storeTipo.DataSource = new object[] 
        {
            new object [] {0, "CORRECTIVO"},
            new object [] {1, "PREVENTIVO"}
        };
        storeTipo.DataBind();

    }
    public Store GridStore { get; set; }
    public void Show()
    {
        this.VentanaMantenimientoDetalle.Show();
    }
    public void SetMantenimiento(int id) 
     {

         this.stMantenimientoMarcaDetalle.DataSource = marcas.GetData();
         this.stMantenimientoMarcaDetalle.DataBind();

        this.stMantenimientoArticuloDetalle.DataSource = articulos.GetData();
        this.stMantenimientoArticuloDetalle.DataBind();

        this.stMantenimientoUsuarioDetalle.DataSource = usuarios.GetData();
        this.stMantenimientoUsuarioDetalle.DataBind();

        this.stMantenimientosDetalle.DataSource = mantenimientos.GetDataByID(id);
        this.stMantenimientosDetalle.DataBind();
    }
    protected void btnGuardarDetalleMantenimiento(object sender, DirectEventArgs e) 
    {
        try
        {
            int id = int.Parse(e.ExtraParams["id"]);
            int id_marca = int.Parse(this.sltMarca.SelectedItem.Value);
            int id_articulo = int.Parse(this.cmbSerie.SelectedItem.Value);
            DateTime fecha = this.dteFecha.SelectedDate;
            int tipoMantenimiento = int.Parse(this.sltTipoMantenimiento.SelectedItem.Value);
            int responsable = int.Parse(this.sltResponsable.SelectedItem.Value);
            string falla = this.txtFalla.Text;
            string accion = this.txtAccion.Text;
            string repuestos = this.txtRepuestos.Text;
            mantenimientos.Update_Mantenimiento(id_articulo,id_marca,fecha,responsable,falla,accion,repuestos,tipoMantenimiento,id);
            this.GridStore.Reload();
        }
        catch (Exception) 
        {
            Ext.Net.Notification.Show(new NotificationConfig
            {
                Title = "Error al actualizar",
                Icon = Icon.Error,
                Width = 400,
                Height = 100,
                Html = "Ingreso de datos incorretos",
                Shadow = true,

            });
        }
    }
}