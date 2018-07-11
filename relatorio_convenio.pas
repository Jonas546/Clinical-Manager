unit relatorio_convenio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DbCtrls, Grids, DateUtils;

type

  { Tt_relatorio_convenio }

  Tt_relatorio_convenio = class(TForm)
    Button1: TButton;
    DBEdit1: TDBEdit;
    db_txt_status: TDBEdit;
    DBGrid2: TDBGrid;
    grid_material: TDBGrid;
    db_txt_valor: TDBEdit;
    DBNavigator1: TDBNavigator;
    db_txt_empresa: TDBEdit;
    db_txt_responsavel: TDBEdit;
    db_txt_titular: TDBEdit;
    db_txt_validade: TDBEdit;
    db_txt_plano: TDBEdit;
    db_txt_convenio: TDBEdit;
    db_txt_cpf: TDBEdit;
    db_sexo: TDBEdit;
    db_txt_rg: TDBEdit;
    db_txt_matricula: TDBEdit;
    db_txt_paciente: TDBEdit;
    db_txt_especialidade: TDBEdit;
    db_txt_medico: TDBEdit;
    db_txt_doc: TDBEdit;
    db_txt_hora: TDBEdit;
    db_txt_data_consulta: TDBEdit;
    db_txt_tipo_guia: TDBEdit;
    DBGroupBox1: TDBGroupBox;
    DBGrid1: TDBGrid;
    db_txt_guia: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure db_txt_guiaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_relatorio_convenio: Tt_relatorio_convenio;
  a_guia:integer;
  t_guia,pref:String;

implementation

{$R *.lfm}

{ Tt_relatorio_convenio }
uses dm, dmo, lancamento_convenio;

procedure CarregaProcedimento(x_guia:integer);
var
  x1,x2,x3,x4,x5,x6,x7,x8:String;
begin

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

  DMOS.query_proc.SQL.Add('select cast(descricao as varchar(50)) as "DESCRIÇÃO", tipo,');
  DMOS.query_proc.SQL.Add('cast(valor_unitario as varchar(10)) as "VALOR UNITÁRIO" from consulta_item where');
  DMOS.query_proc.SQL.Add('cod_guia = :v1 and tipo in (:y1,:y2,:y3,:y4,:y5,:y6,:y7,:y8)');
  DMOS.query_proc.ParamByName('v1').AsInteger:=x_guia;
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

procedure CarregaMaterial(x_guia:integer);
begin

  DMOS.query_material.Close;
  DMOS.query_material.ParamByName('v1').AsInteger:=x_guia;
  DMOS.query_material.Open;

end;

procedure Tt_relatorio_convenio.FormCreate(Sender: TObject);
begin

  DMOS.qr_guia_conv.Active:=true;
  DMOS.qr_conv_lanc.Active:=true;

end;

procedure Tt_relatorio_convenio.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMOS.query_convenios.Active:=false;
  DMOS.query_proc.Active:=false;
  DMOS.qr_guia_conv.Active:=false;
  DMOS.qr_conv_lanc.Active:=false;

  if (t_lancamento_convenio.rb_c_materiais.Checked=true) or (t_lancamento_convenio.rb_t_materiais.Checked=true) then
     begin

       DMOS.query_material.Active:=false;

     end;

end;

procedure Tt_relatorio_convenio.db_txt_guiaChange(Sender: TObject);
begin

  if db_txt_guia.Text <> '' then
     begin

          a_guia:=strtoint(db_txt_guia.Text);
          CarregaProcedimento(a_guia);

     end;

  with T_lancamento_convenio do
   begin

  if (rb_c_materiais.Checked=true) or (rb_t_materiais.Checked=true) then
     begin

       CarregaMaterial(a_guia);

     end;

   end;

end;

procedure Tt_relatorio_convenio.Button1Click(Sender: TObject);
var
  b_guia:integer;
  st:String;
begin

    st := 'Enviado';

          b_guia := strtoint(db_txt_guia.Text);

          DMOS.qr_guia_conv.Close;
          DMOS.qr_guia_conv.SQL.Clear;
          DMOS.qr_guia_conv.SQL.Add('update consulta set data_envio = :b1 where guia = :b2');
          DMOS.qr_guia_conv.ParamByName('b1').Value:=now;
          DMOS.qr_guia_conv.ParamByName('b2').AsInteger:=b_guia;
          DMOS.qr_guia_conv.ExecSQL;

          DMOS.qr_conv_lanc.Close;
          DMOS.qr_conv_lanc.SQL.Clear;
          DMOS.qr_conv_lanc.SQL.Add('update convenio_lancamento set data_envio = :b1, status = :b3 where cod_guia = :b2');
          DMOS.qr_conv_lanc.ParamByName('b1').Value:=now;
          DMOS.qr_conv_lanc.ParamByName('b3').AsString:=st;
          DMOS.qr_conv_lanc.ParamByName('b2').AsInteger:=b_guia;
          DMOS.qr_conv_lanc.ExecSQL;

          DMOS.SQLTransaction1.Commit;

          DMOS.query_convenios.Active:=false;
          DMOS.query_convenios.Active:=true;
          DMOS.query_proc.Active:=false;
          DMOS.query_proc.Active:=true;

          if (t_lancamento_convenio.rb_c_materiais.Checked=true) or (t_lancamento_convenio.rb_t_materiais.Checked=true) then
          begin

          DMOS.query_material.Active:=false;
          DMOS.query_material.Active:=true;

          end;

    showmessage('Entregas Feitas com Sucesso.');

end;

procedure Tt_relatorio_convenio.FormShow(Sender: TObject);
begin

  DMOS.query_convenios.Active:=true;
  DMOS.query_proc.Active:=true;

  with t_lancamento_convenio do
   begin

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
      DMOS.query_convenios.SQL.Add('select distinct c.guia, c.tipo_consulta as "TIPO CONSULTA", c.data_consulta as "DATA CONSULTA", c.hora,');
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

      DMOS.query_convenios.SQL.Add('where c.cod_paciente = p.id and p.convenio = :v2 and c.forma_pagamento = ''Convênio'' and lc.cod_guia = c.guia  and p.plano = l.plano  and p.convenio = v.convenio and c.cod_medico = m.id');

      if ck_lote.Checked=false then
         begin
           //DMOS.query_convenios.SQL.Add('and p.convenio = :v2');
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
           DMOS.query_convenios.SQL.Add('and lc.status = ''N.Enviado''');
         end;

      //DMOS.query_convenios.SQL.Add('group by c.guia');

      DMOS.query_convenios.ParamByName('v2').AsString:=cb_convenio.Text;

      if ck_lote.Checked=false then
         begin
           //DMOS.query_convenios.ParamByName('v2').AsString:=cb_convenio.Text;
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

  if db_txt_guia.Text <> '' then
     begin
          a_guia := strtoint(db_txt_guia.Text);
     end
  else
      begin
        showmessage('Nenhum Registro Encontrado.');
      end;

  CarregaProcedimento(a_guia);

  if (rb_c_materiais.Checked=false) and (rb_t_materiais.Checked=false) then
     begin

       grid_material.Enabled:=false;

     end;

  if (rb_c_materiais.Checked=true) or (rb_t_materiais.Checked=true) then
     begin

       if grid_material.Enabled=false then
          begin
            grid_material.Enabled:=true;
          end;

       DMOS.query_material.Active:=true;
       CarregaMaterial(a_guia);

     end;

   end;

end;

end.

