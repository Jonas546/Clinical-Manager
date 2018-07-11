unit visualiza_financeiro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, DBGrids;

type

  { Tt_visualiza_financeiro }

  Tt_visualiza_financeiro = class(TForm)
    db_txt_total: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    db_txt_esp: TDBEdit;
    db_txt_doc: TDBEdit;
    db_txt_medico: TDBEdit;
    db_txt_matricula: TDBEdit;
    db_txt_valor: TDBEdit;
    db_txt_paciente: TDBEdit;
    db_txt_parcelas: TDBEdit;
    db_txt_hora: TDBEdit;
    db_txt_pagamento: TDBEdit;
    db_txt_pref: TDBEdit;
    db_txt_data: TDBEdit;
    db_txt_tipo: TDBEdit;
    db_txt_guia: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_visualiza_financeiro: Tt_visualiza_financeiro;

implementation

{$R *.lfm}
uses dmo, relatorio_financeiro;

{ Tt_visualiza_financeiro }

procedure Tt_visualiza_financeiro.FormShow(Sender: TObject);
begin

  DMOS.qr_fechamento.Active:=true;
  DMOS.qr_total.Active:=true;

  with t_relatorio_financeiro do
   begin

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

procedure Tt_visualiza_financeiro.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMOS.qr_fechamento.Active:=false;
  DMOS.qr_total.Active:=false;

end;

end.

