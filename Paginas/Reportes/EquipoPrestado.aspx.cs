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

public partial class Default2 : System.Web.UI.Page
{
    dsLaboratoriosBDTableAdapters.EquipoPrestadoReporteTableAdapter reporteEquipoPrestado = new dsLaboratoriosBDTableAdapters.EquipoPrestadoReporteTableAdapter();
    dsLaboratoriosBDTableAdapters.EquipoPrestadoDetalleReporteTableAdapter reporteEquipoPrestadoDetalle = new dsLaboratoriosBDTableAdapters.EquipoPrestadoDetalleReporteTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.stEquipoPrestadoReporte.DataSource = reporteEquipoPrestado.GetDataEquipoPrestado();
        this.stEquipoPrestadoReporte.DataBind();
    }

    protected void FilaSeleccionada(object sender, DirectEventArgs e) 
    {
        int PrestamoId = int.Parse(e.ExtraParams["PrestamoId"]);
        reporteEquipoPrestadoDetalle.GetDataByPrestamoId(PrestamoId);
    }
}