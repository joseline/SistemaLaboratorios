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

public partial class Paginas_Articulos_ArticuloNuevo : System.Web.UI.UserControl
{
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articuloX = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    dsLaboratoriosBDTableAdapters.MARCASTableAdapter marcas = new dsLaboratoriosBDTableAdapters.MARCASTableAdapter();
    dsLaboratoriosBDTableAdapters.LABORATORIOSTableAdapter labs = new dsLaboratoriosBDTableAdapters.LABORATORIOSTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        var storeMarcas = this.sltMarca.GetStore();
        storeMarcas.DataSource = marcas.GetData();
        storeMarcas.DataBind();

        var storeLabs = this.sltLaboratorio.GetStore();
        storeLabs.DataSource = labs.GetData();
        storeLabs.DataBind();
        
    }
    public Store GridStore { get; set; }
    public void Show()
    {
        limpiar();
        this.VentanaArticuloNuevo.Show();
    }
    public void limpiar() 
    {
        this.formaArticulo.Reset();
    }
    protected void btnGuardarNuevoArticulo(object sender, DirectEventArgs e)
    {
        try {
            
            string ar_serie = this.txtSerie.Text;
            string ar_nombre = this.txtEquipo.Text;
            string ar_descripcion = this.txtDescripcion.Text;
            int ar_marca = int.Parse(this.sltMarca.SelectedItem.Value);
            string ar_modelo = this.txtModelo.Text;
            string ar_color = this.txtColor.Text;
            int ar_laboratorio = int.Parse(this.sltLaboratorio.SelectedItem.Value);
            decimal ar_multa = decimal.Parse(this.txtMulta.Text);

            articuloX.Insert_Articulo(ar_serie, ar_nombre, ar_descripcion, ar_marca, ar_modelo, ar_color, ar_laboratorio, ar_multa);
            this.GridStore.Reload();
           
            this.VentanaArticuloNuevo.Hide();
        } 
        catch(Exception)
        {
            Ext.Net.Notification.Show(new NotificationConfig
            {
                Title = "Error al guardar",
                Icon = Icon.Error,
                Width = 400,
                Height = 100,
                Html = "Ingreso de datos incorretos",
                Shadow = true,

            });
        }
    }
}