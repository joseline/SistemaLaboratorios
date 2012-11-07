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

public partial class Paginas_Articulos_ArticuloDetalle : System.Web.UI.UserControl
{
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articuloX = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    dsLaboratoriosBDTableAdapters.MARCASTableAdapter marcas = new dsLaboratoriosBDTableAdapters.MARCASTableAdapter();
    dsLaboratoriosBDTableAdapters.LABORATORIOSTableAdapter laboratorios = new dsLaboratoriosBDTableAdapters.LABORATORIOSTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public Store GridStore { get; set; }
    public void Show()
    {
        this.ArticuloVentana.Show();
    }
    public void SetArticulo(string serie) 
    {
        var storeMarcas = this.sltMarca.GetStore();
        storeMarcas.DataSource = marcas.GetData();
        storeMarcas.DataBind();

        var storeLaboratorios = this.sltLaboratorio.GetStore();
        storeLaboratorios.DataSource = laboratorios.GetData();
        storeLaboratorios.DataBind();

        this.stArticuloDetalle.DataSource = articuloX.GetDataBySerie(serie);
        this.stArticuloDetalle.DataBind();

    }
    protected void btnGuardarDetalleArticulo(object sender, DirectEventArgs e)
    {
        try
        {
            string ar_serie = this.txtSerie.Text;
            string ar_nombre = this.txtEquipo.Text;
            string ar_descripcion = this.txtDescripcion.Text;
            int ar_marca = int.Parse(this.sltMarca.SelectedItem.Value);
            string ar_modelo = this.txtModelo.Text;
            string ar_color = this.txtColor.Text;
            int ar_laboratorio = int.Parse(this.sltLaboratorio.SelectedItem.Value);
            decimal ar_multa = decimal.Parse(this.txtMulta.Text);

            articuloX.Update_Articulo(ar_serie, ar_nombre, ar_descripcion, ar_marca, ar_modelo, ar_color, ar_laboratorio, ar_multa,ar_serie);
            this.GridStore.Reload();
            
            this.ArticuloVentana.Hide();
        }
        catch (Exception)
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