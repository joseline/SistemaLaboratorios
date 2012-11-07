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
    dsLaboratoriosBDTableAdapters.MANTENIMIENTOSTableAdapter mantenimientos = new dsLaboratoriosBDTableAdapters.MANTENIMIENTOSTableAdapter();
    dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter usuarios = new dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articulos = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.stMantenimientos.DataSource = mantenimientos.GetData();
        this.stMantenimientos.DataBind();

        this.stMantUsuarios.DataSource = usuarios.GetData();
        this.stMantUsuarios.DataBind();

        this.stMantArticulos.DataSource = articulos.GetData();
        this.stMantArticulos.DataBind();

        this.MantenimientoNuevo1.GridStore = this.stMantenimientos;
        this.MantenimientoDetalle1.GridStore = this.stMantenimientos;
    }
    protected void mostrarVentanaMantenimientoDetalle(object sender, DirectEventArgs e)
    {
        int id = int.Parse(e.ExtraParams["id"]);
        this.MantenimientoDetalle1.SetMantenimiento(id);
        this.MantenimientoDetalle1.Show();
       
    }
    protected void mostrarVentanaMantenimientoNuevo(object sender, DirectEventArgs e)
    {
        this.MantenimientoNuevo1.Show();
    }
}