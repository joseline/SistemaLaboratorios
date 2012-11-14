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

public partial class Paginas_Prestamos_PrestamoNuevo : System.Web.UI.UserControl
{
    dsLaboratoriosBDTableAdapters.PRESTAMOSTableAdapter prestamos = new dsLaboratoriosBDTableAdapters.PRESTAMOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter alumnos = new dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter();
    dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter usuarios = new dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articulos = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        var storeTipo = this.sltTipoPrestamo.GetStore();
        storeTipo.DataSource = new object[]
        {
            new object[] {0,"INTERNO"},
            new object[] {1,"EXTERNO"}
        };
        storeTipo.DataBind();


        this.stPrestamoAlumnoNuevo.DataSource = alumnos.GetData();
        this.stPrestamoAlumnoNuevo.DataBind();

        this.stPrestamoArticuloNuevo.DataSource = articulos.GetData();
        this.stPrestamoArticuloNuevo.DataBind();

        this.stPrestamoUsuarioNuevo.DataSource = usuarios.GetData();
        this.stPrestamoUsuarioNuevo.DataBind();

    }
    public Store GridStore { get; set; }
    public void Show()
    {
        Limpiar();
        this.VentanaPrestamoNuevo.Show();
    }
    public void Limpiar() 
    {
        this.formaPrestamo.Reset();
    }
    protected void clickNuevo(object sender, DirectEventArgs e) 
    {
        this.formaPrestamo.Reset();
    }
    
    public static decimal TotalValorMulta { get; set; }
    public static bool HayMulta { get; set; }
    
    protected void ActivarTipoPrestamo(object sender, DirectEventArgs e)
    {
        int type = int.Parse(this.sltTipoPrestamo.SelectedItem.Value);
        if (type == 1)
        {
            this.fsExterno.Disabled = false;
            this.dtefechaEntregar.Disabled = false;

            this.fsInterno.Disabled = true;
            this.tfHoraInicio.Disabled = true;
            this.tfHoraFin.Disabled = true;
        }
        if (type == 0)
        {
            this.fsInterno.Disabled = false;
            this.tfHoraInicio.Disabled = false;
            this.tfHoraFin.Disabled = false;

            this.fsExterno.Disabled = true;
            this.dtefechaEntregar.Disabled = true;
        }

    }
    
    protected void ValidarMostrarMulta(object sender, DirectEventArgs e) 
    {
        HayMulta = false;
        try
        {
            TotalValorMulta = 0;
            int tipoPrestamo = int.Parse(this.sltTipoPrestamo.SelectedItem.Value);
            if (tipoPrestamo == 1)
            {
                DateTime csFechaEntrada = this.dteFechaEntrada.SelectedDate;
                DateTime csFecha_a_Entregar = this.dtefechaEntregar.SelectedDate;
                if (csFechaEntrada > csFecha_a_Entregar)
                {
                    HayMulta = true;
                    int csarticuloID = int.Parse(this.cmbSerie.SelectedItem.Value);
                    decimal csarticuloMulta = (decimal)articulos.ObtenerMulta_Articulo(csarticuloID);
                    decimal TotalMulta = calcularMulta(csarticuloMulta);
                    TotalValorMulta = TotalMulta;
                    this.ValorMulta.Text = TotalMulta.ToString();
                    this.chckMulta.Show();
                    this.ValorMulta.Show();
                }
            }
            if( tipoPrestamo == 0)
            {
                DateTime csFechaEntrada = this.dteFechaEntrada.SelectedDate;
                DateTime csFechaSalida = this.dteFechaSalida.SelectedDate;
                if (csFechaEntrada > csFechaSalida)
                {
                    HayMulta = true;
                    int csarticuloID = int.Parse(this.cmbSerie.SelectedItem.Value);
                    decimal csarticuloMulta = (decimal)articulos.ObtenerMulta_Articulo(csarticuloID);
                    decimal TotalMulta = calcularMultaInterno(csarticuloMulta);
                    TotalValorMulta = TotalMulta;
                    this.ValorMulta.Text = TotalMulta.ToString();
                    this.chckMulta.Show();
                    this.ValorMulta.Show();
                }
            }
        } 
        catch(Exception)
        {
            Ext.Net.Notification.Show(new NotificationConfig
            {
                Title = "Error",
                Icon = Icon.Error,
                Width = 400,
                Height = 100,
                Html = "Compruebe el ingreso de datos",
                Shadow = true,

            });
        }
    }

    public int ValidarPrestamoPermitido(int alumnnoId)
    {
        var esPermitido = prestamos.ValidarPrestamo(alumnnoId);
        return (int)esPermitido;
    }

    public decimal calcularMulta(decimal MultaXDia)
    {
        if (this.dteFechaEntrada.SelectedValue != null && this.dtefechaEntregar.SelectedValue != null)
        {
            Decimal TotalMulta = 0;
            DateTime fechaEntrada = this.dteFechaEntrada.SelectedDate;
            DateTime fechaEntregar = this.dtefechaEntregar.SelectedDate;
            int DiasOmitidos = 0;
            if (fechaEntrada > fechaEntregar)
            {
            
                TimeSpan resultado = fechaEntrada.Subtract(fechaEntregar);
                for (int i = 0; i < resultado.Days + 1; i++ )
                {
                    if (fechaEntregar.DayOfWeek ==  DayOfWeek.Sunday)
                    {
                        DiasOmitidos++;
                    }
                }
                TotalMulta = MultaXDia * (resultado.Days - DiasOmitidos);
            }
            return TotalMulta;
        }
        return 0;
    }

    public decimal calcularMultaInterno(decimal MultaXDia) 
    {
        try { 
            DateTime FechaEntrada;
            DateTime FechaSalida;
            FechaEntrada = this.dteFechaEntrada.SelectedDate;
            FechaSalida = this.dteFechaSalida.SelectedDate;
            int DiasOmitidos = 0;
            Decimal TotalMulta = 0;
            if (dteFechaEntrada.SelectedValue!= null && this.dteFechaSalida.SelectedValue != null)
            {
                if(FechaEntrada  > FechaSalida)
                {
                    TimeSpan resultado = FechaEntrada.Subtract(FechaSalida);
                    for (int i = 0; i < resultado.Days + 1; i++)
                    {
                        if (FechaSalida.DayOfWeek == DayOfWeek.Sunday)
                        {
                            DiasOmitidos++;
                        }
                    }
                    TotalMulta = MultaXDia * (resultado.Days - DiasOmitidos);
                    return TotalMulta;
                }
            }
        } catch(Exception)
        {
            Ext.Net.Notification.Show(new NotificationConfig
            {
                Title = "Error",
                Icon = Icon.Error,
                Width = 400,
                Height = 100,
                Html = "Al calcular multa",
                Shadow = true,

            });
        }
        return 0;
    }
    
    //protected void btnGuardarNuevoPrestamo(object sender, DirectEventArgs e) 
    //{
        
    //    int csalumnoID = int.Parse(this.sltCuenta.SelectedItem.Value);
    //    int csarticuloID = int.Parse(this.cmbSerie.SelectedItem.Value);
    //    decimal csarticuloMulta = (decimal)articulos.ObtenerMulta_Articulo(csarticuloID);
    //    int csNumeroMultas = -1;
    //    csNumeroMultas = ValidarPrestamoPermitido(csalumnoID);
        
    //    if (csNumeroMultas == 0)
    //    {
    //        try
    //        {
    //            int cstipoPrestamo = int.Parse(this.sltTipoPrestamo.SelectedItem.Value);
    //            Nullable<DateTime> csfechaEntrada = null;
    //            Nullable<DateTime> csfecha_a_Entregar = null;
    //            int csrecibidoPor;
    //            int csprestadoPor;
    //            DateTime csfechaSalida;
    //            string csobservaciones;
                    
    //            csfechaSalida = this.dteFechaSalida.SelectedDate;
    //            csfechaEntrada = this.dteFechaEntrada.SelectedDate;
    //            csprestadoPor = int.Parse(this.sltPrestadoPor.SelectedItem.Value);
                    
    //            csfecha_a_Entregar = this.dtefechaEntregar.SelectedDate;
    //            csobservaciones = this.txtObs.Text;
                    

    //            if(cstipoPrestamo==1)
    //            {
    //                if (this.sltRecibidoPor.Text == "" && this.dteFechaEntrada.Text == "01/01/0001 12:00:00 a.m.")
    //                {
    //                  prestamos.Insert_Prestamo(csalumnoID, csarticuloID, csfechaSalida, null, csfecha_a_Entregar, csprestadoPor, null, cstipoPrestamo, null, null, csobservaciones, 0,1);
    //                }
    //                else
    //                {
    //                  csrecibidoPor = int.Parse(this.sltRecibidoPor.SelectedItem.Value);
    //                  int pago = Convert.ToInt32(this.chckMulta.Checked);
    //                  decimal TotalMulta = calcularMulta(csarticuloMulta);
    //                  prestamos.Insert_Prestamo(csalumnoID,csarticuloID,csfechaSalida,csfechaEntrada,csfecha_a_Entregar,csprestadoPor,csrecibidoPor,cstipoPrestamo,null,null,csobservaciones,TotalMulta,pago);
    //                }
    //            }
    //            if(cstipoPrestamo == 0)
    //            {
    //                TimeSpan csHoraInicio = this.tfHoraInicio.SelectedTime;
    //                TimeSpan csHoraFin = this.tfHoraFin.SelectedTime;
    //                DateTime csHI = Convert.ToDateTime(csHoraInicio);
    //                DateTime csHF = Convert.ToDateTime(csHoraFin);
    //                if (this.sltRecibidoPor.Text == "" && this.dteFechaEntrada.Text == "01/01/0001 12:00:00 a.m.")
    //                {
    //                     prestamos.Insert_Prestamo(csalumnoID, csarticuloID, csfechaSalida, null, csfecha_a_Entregar, csprestadoPor, null, cstipoPrestamo,csHI, csHF, csobservaciones, 0, 1);
    //                }
    //                else
    //                {
    //                    csrecibidoPor = int.Parse(this.sltRecibidoPor.SelectedItem.Value);
    //                    int pago = Convert.ToInt32(this.chckMulta.Checked);
    //                    decimal TotalMulta = calcularMulta(csarticuloMulta);
    //                    prestamos.Insert_Prestamo(csalumnoID, csarticuloID, csfechaSalida, csfechaEntrada, csfecha_a_Entregar, csprestadoPor, csrecibidoPor, cstipoPrestamo, csHI, csHF, csobservaciones, TotalMulta, pago);
    //                }
    //            }

    //            this.GridStore.Reload();
    //            this.VentanaPrestamoNuevo.Hide();
    //        }
    //        catch (Exception)
    //        {
    //            Ext.Net.Notification.Show(new NotificationConfig
    //            {
    //                Title = "Error al guardar",
    //                Icon = Icon.Error,
    //                Width = 400,
    //                Height = 100,
    //                Html = "Ingreso de datos incorretos",
    //                Shadow = true,

    //            });
    //        }
    //    }
    //    else 
    //    {
    //        Ext.Net.Notification.Show(new NotificationConfig
    //        {
    //            Title = "Prestamo No Permitido",
    //            Icon = Icon.Error,
    //            Width = 400,
    //            Height = 100,
    //            Html = "Este Alumno tiene " + csNumeroMultas+ " multas pendientes", 
    //            HideDelay = 5000,
    //            Shadow = true,

    //        });
    //    }
    //}

    protected void btnGuardarNuevoPrestamo(object sender, DirectEventArgs e) {
        try 
        {
            int csalumnoID = int.Parse(this.sltCuenta.SelectedItem.Value);
            int csarticuloID = int.Parse(this.cmbSerie.SelectedItem.Value);
            int csNumeroMultas = -1;
            csNumeroMultas = ValidarPrestamoPermitido(csalumnoID);
            if (csNumeroMultas == 0)
            {
                int cstipoPrestamo = int.Parse(this.sltTipoPrestamo.SelectedItem.Value);
                Nullable<DateTime> csfechaEntrada = null;
                Nullable<DateTime> csfecha_a_Entregar = null;
                int csrecibidoPor;
                int csprestadoPor;
                DateTime csfechaSalida;
                string csobservaciones;

                csfechaSalida = this.dteFechaSalida.SelectedDate;
                csfechaEntrada = this.dteFechaEntrada.SelectedDate;
                csprestadoPor = int.Parse(this.sltPrestadoPor.SelectedItem.Value);
                csfecha_a_Entregar = this.dtefechaEntregar.SelectedDate;
                csobservaciones = this.txtObs.Text;

                if (cstipoPrestamo == 1) // externo
                {
                    if (this.sltRecibidoPor.SelectedItem == null && this.dteFechaEntrada.SelectedValue == null)
                    {
                        prestamos.Insert_Prestamo(csalumnoID, csarticuloID, csfechaSalida, null, csfecha_a_Entregar, csprestadoPor, null, cstipoPrestamo, null, null, csobservaciones, 0, 1);
                    }
                    else
                    {
                        csrecibidoPor = int.Parse(this.sltRecibidoPor.SelectedItem.Value);
                        if (HayMulta == true)
                        {
                            int realizoPago = Convert.ToInt32(this.chckMulta.Checked);
                            prestamos.Insert_Prestamo(csalumnoID, csarticuloID, csfechaSalida, csfechaEntrada, csfecha_a_Entregar, csprestadoPor, csrecibidoPor, cstipoPrestamo, null, null, csobservaciones, TotalValorMulta, realizoPago);
                        }
                        else {
                            prestamos.Insert_Prestamo(csalumnoID, csarticuloID, csfechaSalida, csfechaEntrada, csfecha_a_Entregar, csprestadoPor, csrecibidoPor, cstipoPrestamo, null, null, csobservaciones, 0, 1);
                        }
                       
                    }
                }
                if (cstipoPrestamo == 0) // interno
                {
                    TimeSpan csHoraInicio = this.tfHoraInicio.SelectedTime;
                    DateTime csHI = Convert.ToDateTime(csHoraInicio.ToString());

                    Nullable<TimeSpan> csHoraFin;
                    csHoraFin = this.tfHoraFin.SelectedTime;
                    Nullable<DateTime> csHF = null;
                    if (this.tfHoraFin.SelectedValue != null)
                    {
                    csHF = Convert.ToDateTime(csHoraFin.ToString());
                    }

                    if (this.sltRecibidoPor.SelectedItem == null && csHF == null && this.dteFechaEntrada.SelectedValue == null)
                    {
                        prestamos.Insert_Prestamo(csalumnoID, csarticuloID, csfechaSalida, null, null, csprestadoPor, null, cstipoPrestamo, csHI, null, csobservaciones, 0, 1);
                    }
                    else
                    {
                        csrecibidoPor = int.Parse(this.sltRecibidoPor.SelectedItem.Value);

                        if (HayMulta)
                        {
                            int realizoPago = Convert.ToInt32(this.chckMulta.Checked);
                            prestamos.Insert_Prestamo(csalumnoID, csarticuloID, csfechaSalida, csfechaEntrada, null, csprestadoPor, csrecibidoPor, cstipoPrestamo, csHI, csHF, csobservaciones, TotalValorMulta, realizoPago);
                        }
                        else {
                            prestamos.Insert_Prestamo(csalumnoID, csarticuloID, csfechaSalida, csfechaEntrada, null, csprestadoPor, csrecibidoPor, cstipoPrestamo, csHI, csHF, csobservaciones,0, 1);
                        }    
                    }
                }
                this.GridStore.Reload();
            }
            else {
                
                Ext.Net.Notification.Show(new NotificationConfig
                {
                    Title = "Prestamo No Permitido",
                    Icon = Icon.Error,
                    Width = 400,
                    Height = 100,
                    Html = "Este Alumno tiene " + csNumeroMultas + " multa pendiente",
                    AlignCfg = new NotificationAlignConfig
                    {
                        OffsetX = -10,
                        OffsetY = -10,
                        El = VentanaPrestamoNuevo.ConfigID
                    },
                    HideDelay = 4000,
                    Shadow = true,
                    Closable = true
                });
            }
        }
        catch(Exception)
        {
            Ext.Net.Notification.Show(new NotificationConfig
            {
                Title = "Error al guardar",
                Icon = Icon.Error,
                Width = 400,
                Height = 100,
                Html = "Ingreso de datos incorretos \n Verifique de nuevo los datos ingresados",
                Shadow = true,

            });
        }
    }


}