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
public partial class Paginas_Calibraciones_CalibracionesDetalle : System.Web.UI.UserControl
{
    dsLaboratoriosBDTableAdapters.CALIBRACIONESTableAdapter cali = new dsLaboratoriosBDTableAdapters.CALIBRACIONESTableAdapter();
    dsLaboratoriosBDTableAdapters.MARCASTableAdapter marca = new dsLaboratoriosBDTableAdapters.MARCASTableAdapter();
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter art = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter usuarios = new dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {

        var storeEstado = this.sltEstado.GetStore();
        storeEstado.DataSource = new object[]{
            new object [] {0,"OK"},
            new object [] {1,"INADECUADO"}
        };
        storeEstado.DataBind();
    }

    public Store GridStore { get; set; }
    public void Show()
    {
        this.VentanaCaliDetalle.Show();
    }
    public void SetCalibracion(int id, int articuloID)
    {


        var stArti = this.cmbSerie.GetStore();
        stArti.DataSource = art.GetData();
        stArti.DataBind();

        var stUsuario = this.sltResponsable.GetStore();
        stUsuario.DataSource = usuarios.GetData();
        stUsuario.DataBind();

        this.stCaliDetalle.DataSource = cali.GetDataByID(id);
        this.stCaliDetalle.DataBind();

        this.stArticulos.DataSource = art.GetDataByArticuloId(articuloID);
        this.stArticulos.DataBind();

    }
    protected void btnGuardarDetalleCali(object sender, DirectEventArgs e)
    {
        try
        {
            decimal vpatron = 0;
            decimal vpromedio = 0;
            decimal error_instr = 0;
            decimal error_estd = 0;
            int id = int.Parse(this.txtCaliId.Text);
            int marca = int.Parse(this.sltMarca.Text);//int.Parse(this.sltMarca.SelectedItem.Value);
            int art_id = int.Parse(this.cmbSerie.SelectedItem.Value);
            DateTime fecha = this.dteFecha.SelectedDate;
            int responsable = int.Parse(this.sltResponsable.SelectedItem.Value);
            string unid = this.txtUnidades.Text;
            if (txtValorPatron.Text != "")
            {
              vpatron = decimal.Parse(this.txtValorPatron.Text);
            }
            if (this.txtValorPromedio.Text != "")
            {
                vpromedio = decimal.Parse(this.txtValorPromedio.Text);
            }

            if (this.txtErrorIns.Text != "")
            {
                error_instr = decimal.Parse(this.txtErrorIns.Text);
            }
            if (this.txtErrorEst.Text != "")
            {
                 error_estd = decimal.Parse(this.txtErrorEst.Text);
            }
            int estado = int.Parse(this.sltEstado.SelectedItem.Value);
            string obs = this.txtObs.Text;
    
            cali.Update_Calibracion(art_id,marca,fecha,responsable,unid,error_instr,error_estd,vpatron ,vpromedio, estado, obs,id );
            this.GridStore.Reload();
            this.VentanaCaliDetalle.Hide();
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