unit relatorio_convenio_pdf6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { Tt_relatorio_convenio_pdf6 }

  Tt_relatorio_convenio_pdf6 = class(TForm)
    grid_mat: TRLSubDetail;
    lb_comprovante: TRLLabel;
    lb_conv: TRLLabel;
    lb_emp: TRLLabel;
    lb_medico: TRLLabel;
    lb_plano: TRLLabel;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLCabecario: TRLBand;
    RLConvenios: TRLReport;
    RLDBText1: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLDBText9: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel42: TRLLabel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLNome_Guia: TRLGroup;
    RLSubDetail1: TRLSubDetail;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    procedure RLConveniosBeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure RLConveniosPageEnding(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_relatorio_convenio_pdf6: Tt_relatorio_convenio_pdf6;
  a_guia:integer;
  t_guia,pref:String;
  x1,x2,x3,x4,x5,x6,x7,x8:String;

implementation

{$R *.lfm}
uses dmo, lancamento_convenio;

{ Tt_relatorio_convenio_pdf6 }

procedure Tt_relatorio_convenio_pdf6.RLConveniosBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin

  DMOS.query_convenios.Active:=true;
       DMOS.query_proc.Active:=true;

       with t_lancamento_convenio do
          begin

            lb_conv.Caption:=cb_convenio.Text;

            if rb_guias.Checked=true then
               begin
                 lb_comprovante.Caption:=rb_guias.Caption;
               end;

            if rb_online.Checked=true then
               begin
                 lb_comprovante.Caption:=rb_online.Caption;
               end;

            if rb_planilha.Checked=true then
               begin
                 lb_comprovante.Caption:=rb_planilha.Caption;
               end;

            if rb_etc.Checked=true then
               begin
                 lb_comprovante.Caption:=rb_etc.Caption;
               end;

            if rb_todos_comprovantes.Checked=true then
               begin
                 lb_comprovante.Caption:=rb_todos_comprovantes.Caption;
               end;

         if ck_lote.Checked=false then
            begin
                 lb_medico.Caption:=cb_medico.Text;
            end
         else
             begin
                 lb_medico.Caption:='Lote';
             end;

         if ck_plano.Checked=false then
            begin
                 lb_plano.Caption:=cb_plano.Text;
            end
         else
             begin
                 lb_plano.Caption:='Lote';
             end;

         if ck_todas_empresas.Checked=false then
               begin
                    lb_emp.Caption:=cb_empresa.Text;
               end
            else
                begin
                    lb_emp.Caption:='Lote';
                end;

         //lb_medico.Caption:=cb_medico.Text;

         if rb_guia_consulta.Checked=true then
            begin
              t_guia:='Consulta';
            end;

         if rb_sp.Checked=true then
            begin
              t_guia:='SP/SADT';
            end;

         if rb_internacao.Checked=true then
            begin
              t_guia:='Resumo de Internação';
            end;

         if rb_honorario.Checked=true then
            begin
              t_guia:='Honorário Individual';
            end;

         if rb_todos.Checked=true then
            begin
              t_guia:='Todos';
            end;

         if rb_emergencia1.Checked=true then
            begin
              pref:='Emergência';
            end;

         if rb_normal1.Checked=true then
            begin
              pref:='Horário Normal';
            end;

         if rb_especial1.Checked=true then
            begin
              pref:='Horário Especial';
            end;

             DMOS.query_convenios.Close;
             DMOS.query_convenios.SQL.Clear;
             DMOS.query_convenios.SQL.Add('select c.guia, c.tipo_consulta as "TIPO CONSULTA", c.data_consulta as "DATA CONSULTA", c.hora,');
             DMOS.query_convenios.SQL.Add('c.preferencia, cast(c.valor_total as varchar(10)) as "VALOR TOTAL",');
             DMOS.query_convenios.SQL.Add('p.id as "MATRICULA", p.nome as "PACIENTE", p.rg,');
             DMOS.query_convenios.SQL.Add('p.cpf, p.sexo, p.convenio, p.plano,p.trabalho as "EMPRESA",');
             DMOS.query_convenios.SQL.Add('p.validade, p.titular,p.responsavel,p.cpf_responsavel as "CPF RESPONSÁVEL",');
             DMOS.query_convenios.SQL.Add('m.nome, m.crm, m.especialidade, lc.status');
             DMOS.query_convenios.SQL.Add('from');
             DMOS.query_convenios.SQL.Add('consulta as c, medico as m, paciente as p, convenio as v, plano as l, convenio_lancamento as lc');

             if ck_todas_empresas.Checked=false then
                begin
                  DMOS.query_convenios.SQL.Add(', empresa as e');
                end;

             DMOS.query_convenios.SQL.Add('where c.cod_paciente = p.id and p.convenio = :v2 and c.forma_pagamento = ''Convênio'' and lc.cod_guia = c.guia  and p.plano = l.plano and p.convenio = v.convenio and c.cod_medico = m.id');

             if ck_lote.Checked=false then
                begin
                  DMOS.query_convenios.SQL.Add('and m.nome = :v1');
                end;

             if ck_plano.Checked=false then
                begin
                  DMOS.query_convenios.SQL.Add('and l.plano = :v3');
                end;

             if rb_todos.Checked=false then
                begin
                     DMOS.query_convenios.SQL.Add('and c.tipo_consulta = :v4');
                end;

             if rb_horario_todos1.Checked=false then
                begin
                     DMOS.query_convenios.SQL.Add('and c.preferencia = :v5');
                end;

             if rb_atendimento.Checked=true then
                begin
                  DMOS.query_convenios.SQL.Add('and c.data_consulta between (cast(:d1 as Date)) and (cast(:d2 as date))');
                end;

             if rb_entrega.Checked=true then
                begin
                  DMOS.query_convenios.SQL.Add('and lc.data_entrega between (cast(:d1 as Date)) and (cast(:d2 as date))');
                end;

             if ck_todas_empresas.Checked=false then
                begin
                  DMOS.query_convenios.SQL.Add('and e.emp = p.trabalho and e.emp = :v6 ');
                end;

             if ck_enviados.Checked=true then
                begin
                  DMOS.query_convenios.SQL.Add('and lc.status = ''Enviado''');
                end;

             if ck_todos.Checked=true then
                begin
                  DMOS.query_convenios.SQL.Add('and lc.status = ''Não Enviado''');
                end;

             DMOS.query_convenios.ParamByName('v2').AsString:=cb_convenio.Text;

             if ck_lote.Checked=false then
                begin
                  DMOS.query_convenios.ParamByName('v1').AsString:=cb_medico.Text;
                end;

             if ck_plano.Checked=false then
                begin
                     DMOS.query_convenios.ParamByName('v3').AsString:=cb_plano.Text;
                end;

             if rb_todos.Checked=false then
                begin
                     DMOS.query_convenios.ParamByName('v4').AsString:=t_guia;
                end;

             if rb_horario_todos1.Checked=false then
                begin
                     DMOS.query_convenios.ParamByName('v5').AsString:=pref;
                end;

             if ck_todas_empresas.Checked=false then
                begin
                  DMOS.query_convenios.ParamByName('v6').AsString:=cb_empresa.Text;
                end;

             if (rb_atendimento.Checked=true) or (rb_entrega.Checked=true) then
                begin
                     DMOS.query_convenios.ParamByName('d1').Value:=data_inicio.Date;
                     DMOS.query_convenios.ParamByName('d2').Value:=data_fim.Date;
                end;

             DMOS.query_convenios.Open;

             a_guia:=DMOS.query_convenios.Fields[0].AsInteger;

             DMOS.query_proc.Close;
             DMOS.query_proc.SQL.Clear;

             with t_lancamento_convenio do
              begin

                if ck_consulta.Checked=true then
                   begin
                     x1 := 'Consulta';
                   end
                else
                    begin
                     x1 := '';
                    end;

                if ck_procedimento.Checked=true then
                   begin
                     x2 := 'Procedimentos';
                   end
                else
                    begin
                     x2 := '';
                    end;

                if ck_cirurgia.Checked=true then
                   begin
                     x3 := 'Cirurgia';
                   end
                else
                    begin
                     x3 := '';
                    end;

                if ck_exame.Checked=true then
                   begin
                     x4 := 'Exame';
                   end
                else
                    begin
                     x4 := '';
                    end;

                if ck_teste.Checked=true then
                   begin
                     x5 := 'Teste';
                   end
                else
                    begin
                     x5 := '';
                    end;

                if ck_vacina.Checked=true then
                   begin
                     x6 := 'Vacina';
                   end
                else
                    begin
                     x6 := '';
                    end;

                if ck_retorno.Checked=true then
                   begin
                     x7 := 'Retorno';
                   end
                else
                    begin
                     x7 := '';
                    end;

                if ck_outro.Checked=true then
                   begin
                     x8 := 'Outros';
                   end
                else
                    begin
                     x8 := '';
                    end;

              end;

             DMOS.query_proc.Close;
             DMOS.query_proc.SQL.Clear;
             DMOS.query_proc.SQL.Add('select cast(descricao as varchar(30)) as "DESCRIÇÃO", tipo,');
             DMOS.query_proc.SQL.Add('cast(valor_unitario as varchar(10)) as "VALOR UNITÁRIO" from consulta_item where');
             DMOS.query_proc.SQL.Add('cod_guia = :v1 and tipo in (:y1,:y2,:y3,:y4,:y5,:y6,:y7,:y8)');
             DMOS.query_proc.ParamByName('v1').AsInteger:=a_guia;
             DMOS.query_proc.ParamByName('y1').AsString:=x1;
             DMOS.query_proc.ParamByName('y2').AsString:=x2;
             DMOS.query_proc.ParamByName('y3').AsString:=x3;
             DMOS.query_proc.ParamByName('y4').AsString:=x4;
             DMOS.query_proc.ParamByName('y5').AsString:=x5;
             DMOS.query_proc.ParamByName('y6').AsString:=x6;
             DMOS.query_proc.ParamByName('y7').AsString:=x7;
             DMOS.query_proc.ParamByName('y8').AsString:=x8;
             DMOS.query_proc.Open;

          end;

       with t_lancamento_convenio do
        begin

          if (rb_c_materiais.Checked=true) or (rb_t_materiais.Checked=true) then
             begin
               DMOS.query_material.Active:=true;
               grid_mat.Visible:=true;
             end;

        end;

end;

procedure Tt_relatorio_convenio_pdf6.RLConveniosPageEnding(Sender: TObject);
begin

       DMOS.query_convenios.Active:=false;
       DMOS.query_proc.Active:=false;

       with t_lancamento_convenio do
         begin

           if (rb_c_materiais.Checked=true) or (rb_t_materiais.Checked=true) then
               begin
                DMOS.query_material.Active:=false;
               end;

           end;

       grid_mat.Visible:=false;

end;

end.

