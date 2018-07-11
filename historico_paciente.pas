unit historico_paciente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, DateTimePicker, Forms,
  Controls, Graphics, Dialogs, DBGrids, StdCtrls, DbCtrls;

type

  { Tt_historico }

  Tt_historico = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    date_inicio: TDateTimePicker;
    date_fim: TDateTimePicker;
    db_txt_empresa: TDBEdit;
    db_txt_atendente: TDBEdit;
    db_txt_parcelas: TDBEdit;
    db_txt_tipo: TDBEdit;
    db_txt_plano: TDBEdit;
    DBNavigator1: TDBNavigator;
    db_txt_valor: TDBEdit;
    db_txt_pagamento: TDBEdit;
    DBGroupBox1: TDBGroupBox;
    db_txt_hora: TDBEdit;
    db_txt_nasc: TDBEdit;
    db_txt_data: TDBEdit;
    db_txt_medico: TDBEdit;
    db_txt_especialiade: TDBEdit;
    db_txt_guia: TDBEdit;
    db_txt_validade: TDBEdit;
    db_txt_convenio: TDBEdit;
    db_txt_sexo: TDBEdit;
    db_txt_cpf: TDBEdit;
    db_txt_rg: TDBEdit;
    db_txt_matricula: TDBEdit;
    db_txt_paciente: TDBEdit;
    DBGrid1: TDBGrid;
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
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    rb_cproc: TRadioButton;
    rb_sproc: TRadioButton;
    rb_periodo: TRadioButton;
    rb_completo: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure rb_completoChange(Sender: TObject);
    procedure rb_periodoChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_historico: Tt_historico;
  n_paciente: String;

implementation

{$R *.lfm}

{ Tt_historico }
uses dm, gerenciar_paciente, historico_paciente_pdf, lista_procedimentos;

procedure Tt_historico.FormShow(Sender: TObject);
begin

  n_paciente := t_gerenciar_pacientes.db_txt_nome.Text;

  DMC.qr_historico_paciente.Active:=true;

  DMC.qr_historico_paciente.Close;
  DMC.qr_historico_paciente.ParamByName('v1').AsString:=n_paciente;
  DMC.qr_historico_paciente.Open;

end;

procedure Tt_historico.rb_completoChange(Sender: TObject);
begin

  if rb_completo.Checked=true then
     begin

      date_inicio.Enabled:=false;
      date_fim.Enabled:=false;

     end;

end;

procedure Tt_historico.rb_periodoChange(Sender: TObject);
begin

  if rb_periodo.Checked=true then
     begin
       date_inicio.Enabled:=true;
       date_fim.Enabled:=true;
     end;

end;

procedure Tt_historico.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin

  DMC.qr_historico_paciente.Active:=false;

  date_inicio.Enabled:=false;
  date_fim.Enabled:=false;

end;

procedure Tt_historico.Button1Click(Sender: TObject);
begin

  if (rb_periodo.Checked=false) and (rb_completo.Checked=false) then
     begin
       showmessage('Selecione "Por Período" ou "Completo".');
     end;

  if (rb_cproc.Checked=false) and (rb_sproc.Checked=false) then
     begin
       showmessage('Selecione "C/Procedimentos" ou "S/Procedimentos".');
     end;

  if ((rb_periodo.Checked=true) or (rb_completo.Checked=true)) and ((rb_cproc.Checked=true) or (rb_sproc.Checked=true)) then
     begin
       t_historico_pdf.RLHistorico.Preview();
     end;

end;

procedure Tt_historico.Button2Click(Sender: TObject);
begin
  t_procedimentos.ShowModal;
end;

procedure Tt_historico.Button3Click(Sender: TObject);
var
  aux:String;
begin

  if (rb_periodo.Checked=false) and (rb_completo.Checked=false) then
  begin
       showmessage('Selecione "Por Período" ou "Completo".');
  end
  else
  begin

  if db_txt_paciente.Text <> '' then
    begin
      aux:=db_txt_paciente.Text
    end
  else
    begin
     aux:=t_gerenciar_pacientes.db_txt_nome.Text;
    end;

  if rb_periodo.Checked=true then
     begin

       DMC.qr_historico_paciente.Close;
       DMC.qr_historico_paciente.SQL.Clear;
       DMC.qr_historico_paciente.SQL.Add('select p.*, c.guia, c.data_consulta, c.hora, c.valor, cast(c.valor_total as varchar(10)) as "VALOR_TOTAL",');
       DMC.qr_historico_paciente.SQL.Add('c.forma_pagamento, c.atendente, c.tipo_consulta, c.parcelas,');
       DMC.qr_historico_paciente.SQL.Add('m.nome, m.especialidade');
       DMC.qr_historico_paciente.SQL.Add('from paciente as p, consulta as c, medico as m');
       DMC.qr_historico_paciente.SQL.Add('where p.id = c.cod_paciente and m.id = c.cod_medico and p.nome = :v1');
       DMC.qr_historico_paciente.SQL.Add('and c.data_consulta between (cast(:d1 as Date)) and (cast(:d2 as date))');
       DMC.qr_historico_paciente.ParamByName('v1').AsString:=aux;
       DMC.qr_historico_paciente.ParamByName('d1').Value:=date_inicio.Date;
       DMC.qr_historico_paciente.ParamByName('d2').Value:=date_fim.Date;
       DMC.qr_historico_paciente.Open;

     end;

    if rb_completo.Checked=true then
     begin

       DMC.qr_historico_paciente.Close;
       DMC.qr_historico_paciente.SQL.Clear;
       DMC.qr_historico_paciente.SQL.Add('select p.*, c.guia, c.data_consulta, c.hora, c.valor, cast(c.valor_total as varchar(10)) as "VALOR_TOTAL",');
       DMC.qr_historico_paciente.SQL.Add('c.forma_pagamento, c.atendente, c.tipo_consulta, c.parcelas,');
       DMC.qr_historico_paciente.SQL.Add('m.nome, m.especialidade');
       DMC.qr_historico_paciente.SQL.Add('from paciente as p, consulta as c, medico as m');
       DMC.qr_historico_paciente.SQL.Add('where p.id = c.cod_paciente and m.id = c.cod_medico and p.nome = :v1');
       DMC.qr_historico_paciente.ParamByName('v1').AsString:=aux;
       DMC.qr_historico_paciente.Open;

     end;

  end;

end;

end.

