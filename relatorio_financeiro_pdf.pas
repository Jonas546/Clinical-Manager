unit relatorio_financeiro_pdf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { Tt_relatorio_financeiro_pdf }

  Tt_relatorio_financeiro_pdf = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel3: TRLLabel;
    lb_inicio: TRLLabel;
    RLLabel4: TRLLabel;
    lb_fim: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLReport1: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure RLReport1PageEnding(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_relatorio_financeiro_pdf: Tt_relatorio_financeiro_pdf;

implementation

{$R *.lfm}

{ Tt_relatorio_financeiro_pdf }
uses dmo, relatorio_financeiro;

procedure Tt_relatorio_financeiro_pdf.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin

  DMOS.qr_fechamento.Active:=true;
  DMOS.qr_total.Active:=true;

    with t_relatorio_financeiro do
     begin

       lb_inicio.Caption:=Datetostr(data_inicio.Date);
       lb_fim.Caption:=Datetostr(data_fim.Date);

       if rb_geral.Checked=true then
          begin

            DMOS.qr_fechamento.Close;
            DMOS.qr_fechamento.SQL.Clear;
            DMOS.qr_fechamento.SQL.Add('select c.guia, cast(c.tipo_consulta as varchar(25)) as "TIPO GUIA",');
            DMOS.qr_fechamento.SQL.Add('c.data_consulta as "DATA CONSULTA",c.hora, c.preferencia,');
            DMOS.qr_fechamento.SQL.Add('c.forma_pagamento as "PAGAMENTO",coalesce(c.parcelas,0) as "PARCELAS",');
            DMOS.qr_fechamento.SQL.Add('cast(c.valor_total as varchar(8)) as "VALOR TOTAL",');
            DMOS.qr_fechamento.SQL.Add('p.nome as "PACIENTE", p.id as "MATRICULA",');
            DMOS.qr_fechamento.SQL.Add('m.nome as "MEDICO", m.crm as "CRM/CRO",m.especialidade');
            DMOS.qr_fechamento.SQL.Add('from consulta as c, paciente as p, medico as m where');
            DMOS.qr_fechamento.SQL.Add('p.id = c.cod_paciente and m.id = c.cod_medico and');
            DMOS.qr_fechamento.SQL.Add('c.data_consulta between (cast(:d1 as Date)) and (cast(:d2 as date))');
            DMOS.qr_fechamento.ParamByName('d1').Value:=data_inicio.Date;
            DMOS.qr_fechamento.ParamByName('d2').Value:=data_fim.Date;
            DMOS.qr_fechamento.Open;

            DMOS.qr_total.Close;
            DMOS.qr_total.SQL.Clear;
            DMOS.qr_total.SQL.Add('select cast(sum(c.valor_total) as varchar(8)) as "VALOR TOTAL"');
            DMOS.qr_total.SQL.Add('from consulta as c, paciente as p, medico as m where');
            DMOS.qr_total.SQL.Add('p.id = c.cod_paciente and m.id = c.cod_medico');
            DMOS.qr_total.SQL.Add('and c.data_consulta between (cast(:d1 as Date)) and (cast(:d2 as date))');
            DMOS.qr_total.ParamByName('d1').Value:=data_inicio.Date;
            DMOS.qr_total.ParamByName('d2').Value:=data_fim.Date;
            DMOS.qr_total.Open;

          end;

       if rb_criterio.Checked=true then
          begin

           DMOS.qr_fechamento.Close;
           DMOS.qr_fechamento.SQL.Clear;
           DMOS.qr_fechamento.SQL.Add('select c.guia, cast(c.tipo_consulta as varchar(25)) as "TIPO GUIA",');
           DMOS.qr_fechamento.SQL.Add('c.data_consulta as "DATA CONSULTA",c.hora, c.preferencia,');
           DMOS.qr_fechamento.SQL.Add('c.forma_pagamento as "PAGAMENTO",coalesce(c.parcelas,0) as "PARCELAS",');
           DMOS.qr_fechamento.SQL.Add('cast(c.valor_total as varchar(8)) as "VALOR TOTAL",');
           DMOS.qr_fechamento.SQL.Add('p.nome as "PACIENTE", p.id as "MATRICULA",');
           DMOS.qr_fechamento.SQL.Add('m.nome as "MEDICO", m.crm as "CRM/CRO",m.especialidade');
           DMOS.qr_fechamento.SQL.Add('from consulta as c, paciente as p, medico as m where');
           DMOS.qr_fechamento.SQL.Add('p.id = c.cod_paciente and m.id = c.cod_medico and');
           DMOS.qr_fechamento.SQL.Add('c.data_consulta between (cast(:d1 as Date)) and (cast(:d2 as date))');

           if (ck_c_convenio.Checked=true) and (ck_s_convenio.Checked=false) then
              begin

               DMOS.qr_fechamento.SQL.Add('and p.convenio = :v1');

              end;

           if (ck_c_convenio.Checked=false) and (ck_s_convenio.Checked=true) then
              begin

               DMOS.qr_fechamento.SQL.Add('and c.forma_pagamento <> ''Convênio''');

              end;

           if ck_prof.Checked=true then
              begin

               DMOS.qr_fechamento.SQL.Add('and m.nome = :v2');

              end;

           if ck_plano.Checked=true then
              begin

               DMOS.qr_fechamento.SQL.Add('and p.plano = :v3');

              end;

           if ck_empresa.Checked=true then
              begin

               DMOS.qr_fechamento.SQL.Add('and p.trabalho = :v4');

              end;

           if (ck_c_convenio.Checked=true) and (ck_s_convenio.Checked=false) then
              begin

               DMOS.qr_fechamento.ParamByName('v1').AsString:=cb_convenio.Text;

              end;

           if ck_prof.Checked=true then
              begin

               DMOS.qr_fechamento.ParamByName('v2').AsString:=cb_medico.Text;

              end;

           if ck_plano.Checked=true then
              begin

               DMOS.qr_fechamento.ParamByName('v3').AsString:=cb_plano.Text;

              end;

           if ck_empresa.Checked=true then
              begin

               DMOS.qr_fechamento.ParamByName('v4').AsString:=cb_empresa.Text;

              end;

           DMOS.qr_fechamento.ParamByName('d1').Value:=data_inicio.Date;
           DMOS.qr_fechamento.ParamByName('d2').Value:=data_fim.Date;
           DMOS.qr_fechamento.Open;

           DMOS.qr_total.Close;
           DMOS.qr_total.SQL.Clear;
           DMOS.qr_total.SQL.Add('select cast(sum(c.valor_total) as varchar(8)) as "VALOR TOTAL"');
           DMOS.qr_total.SQL.Add('from consulta as c, paciente as p, medico as m where');
           DMOS.qr_total.SQL.Add('p.id = c.cod_paciente and m.id = c.cod_medico');
           DMOS.qr_total.SQL.Add('and c.data_consulta between (cast(:d1 as Date)) and (cast(:d2 as date))');

           if (ck_c_convenio.Checked=true) and (ck_s_convenio.Checked=false) then
              begin

               DMOS.qr_total.SQL.Add('and p.convenio = :v1');

              end;

           if (ck_c_convenio.Checked=false) and (ck_s_convenio.Checked=true) then
              begin

               DMOS.qr_total.SQL.Add('and c.forma_pagamento <> ''Convênio''');

              end;

           if ck_prof.Checked=true then
              begin

               DMOS.qr_total.SQL.Add('and m.nome = :v2');

              end;

           if ck_plano.Checked=true then
              begin

               DMOS.qr_total.SQL.Add('and p.plano = :v3');

              end;

           if ck_empresa.Checked=true then
              begin

               DMOS.qr_total.SQL.Add('and p.trabalho = :v4');

              end;

           if (ck_c_convenio.Checked=true) and (ck_s_convenio.Checked=false) then
              begin

               DMOS.qr_total.ParamByName('v1').AsString:=cb_convenio.Text;

              end;

           if ck_prof.Checked=true then
              begin

               DMOS.qr_total.ParamByName('v2').AsString:=cb_medico.Text;

              end;

           if ck_plano.Checked=true then
              begin

               DMOS.qr_total.ParamByName('v3').AsString:=cb_plano.Text;

              end;

           if ck_empresa.Checked=true then
              begin

               DMOS.qr_total.ParamByName('v4').AsString:=cb_empresa.Text;

              end;

           DMOS.qr_total.ParamByName('d1').Value:=data_inicio.Date;
           DMOS.qr_total.ParamByName('d2').Value:=data_fim.Date;
           DMOS.qr_total.Open;

          end;

     end;

end;

procedure Tt_relatorio_financeiro_pdf.RLReport1PageEnding(Sender: TObject);
begin

  DMOS.qr_fechamento.Active:=false;
  DMOS.qr_total.Active:=false;

end;

end.

