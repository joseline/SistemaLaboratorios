using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articulos = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    dsLaboratoriosBDTableAdapters.REVISIONXARTICULOTableAdapter revisionArticulo = new dsLaboratoriosBDTableAdapters.REVISIONXARTICULOTableAdapter();
    dsLaboratoriosBDTableAdapters.REVISIONESTADOTableAdapter revisionEstado = new dsLaboratoriosBDTableAdapters.REVISIONESTADOTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        var stCmbSerie = this.cmbSerie.GetStore();
        stCmbSerie.DataSource = articulos.GetData();
        stCmbSerie.DataBind();
        
    }
}
