unit relatorio_financeiro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DbCtrls;

type

  { Tt_relatorio_financeiro }

  Tt_relatorio_financeiro = class(TForm)
    Button1: TButton;
    Button2: TButton;
    cb_convenio: TDBLookupComboBox;
    cb_empresa: TDBLookupComboBox;
    cb_medico: TDBLookupComboBox;
    cb_plano: TDBLookupComboBox;
    ck_empresa: TCheckBox;
    ck_plano: TCheckBox;
    ck_prof: TCheckBox;
    ck_s_convenio: TCheckBox;
    ck_c_convenio: TCheckBox;
    data_fim: TDateTimePicker;
    data_inicio: TDateTimePicker;
    GroupBox1: TGroupBox;
    g_plano: TGroupBox;
    GroupBox2: TGroupBox;
    g_conv: TGroupBox;
    g_prof: TGroupBox;
    GroupBox5: TGroupBox;
    g_criterio: TGroupBox;
    g_empresa: TGroupBox;
    rb_criterio: TRadioButton;
    rb_geral: TRadioButton;
    txt_conv_id: TEdit;
    txt_plano: TEdit;
    txt_prof: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cb_convenioChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure rb_criterioChange(Sender: TObject);
    procedure rb_geralChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_relatorio_financeiro: Tt_relatorio_financeiro;
  cod:integer;

implementation

{$R *.lfm}

{ Tt_relatorio_financeiro }
uses dmo, visualiza_financeiro, relatorio_financeiro_pdf;

procedure CarregaPlano(pid:integer);
begin

  DMOS.query_plano.Close;
  DMOS.query_plano.ParamByName('v1').AsInteger:=pid;
  DMOS.query_plano.Open;

end;

procedure Tt_relatorio_financeiro.FormShow(Sender: TObject);
begin

  data_inicio.Date:=now;
  data_fim.Date:=now+1;

  DMOS.query_medicos.Active:=true;
  DMOS.query_convenio.Active:=true;
  DMOS.query_plano.Active:=true;
  DMOS.qr_empresa.Active:=true;

end;

procedure Tt_relatorio_financeiro.rb_criterioChange(Sender: TObject);
begin

  if rb_criterio.Checked=true then
     begin
       cb_plano.Enabled:=true;
       cb_convenio.Enabled:=true;
       cb_empresa.Enabled:=true;
       cb_medico.Enabled:=true;
     end;

  g_criterio.Enabled:=true;

end;

procedure Tt_relatorio_financeiro.rb_geralChange(Sender: TObject);
begin

  if rb_geral.Checked=true then
     begin
       cb_plano.Enabled:=false;
       cb_convenio.Enabled:=false;
       cb_empresa.Enabled:=false;
       cb_medico.Enabled:=false;
       ck_c_convenio.Checked:=false;
       ck_s_convenio.Checked:=false;
       ck_plano.Checked:=false;
       ck_empresa.Checked:=false;
       ck_prof.Checked:=false;
     end;

  g_criterio.Enabled:=false;

end;

procedure Tt_relatorio_financeiro.cb_convenioChange(Sender: TObject);
begin

  cb_plano.Items.Clear;
  txt_plano.Clear;
  txt_conv_id.Text:= inttostr(integer(cb_convenio.KeyValue));
  cod := strtoint(txt_conv_id.Text);

  CarregaPlano(cod);

end;

procedure Tt_relatorio_financeiro.Button1Click(Sender: TObject);
begin

  if (rb_geral.Checked=false) and (rb_criterio.Checked=false) then
     begin
          showmessage('Escolha os critérios "Geral" ou "Por Critérios"');
     end
  else
      begin

        if rb_criterio.Checked=true then
           begin

           if (cb_convenio.Text = '') then
              begin
                   showmessage('Selecione um Convênio');
              end;

           if (cb_medico.Text = '') then
              begin
                   showmessage('Selecione um Profissional');
              end;

           if (cb_plano.Text = '') then
              begin
                   showmessage('Selecione um Plano');
              end;

           if (cb_empresa.Text = '') then
              begin
                   showmessage('Selecione uma Empresa');
              end;

           if (cb_convenio.Text <> '') and (cb_medico.Text <> '') and (cb_empresa.Text <> '') and (cb_empresa.Text <> '') then
              begin
                   t_visualiza_financeiro.ShowModal;
              end;

           end;

        if rb_geral.Checked=true then
           begin
                t_visualiza_financeiro.ShowModal;
           end;

      end;

end;

procedure Tt_relatorio_financeiro.Button2Click(Sender: TObject);
begin

  if (rb_geral.Checked=false) and (rb_criterio.Checked=false) then
     begin
          showmessage('Escolha os critérios "Geral" ou "Por Critérios"');
     end
  else
      begin

        if rb_criterio.Checked=true then
           begin

           if (cb_convenio.Text = '') and (rb_criterio.Checked=true) then
              begin
                   showmessage('Selecione um Convênio');
              end;

           if (cb_medico.Text = '') and (ck_prof.Checked=true) then
              begin
                   showmessage('Selecione um Profissional');
              end;

           if (cb_plano.Text = '') and (ck_plano.Checked=true) then
              begin
                   showmessage('Selecione um Plano');
              end;

           if (cb_empresa.Text = '') and (ck_empresa.Checked=true) then
              begin
                   showmessage('Selecione uma Empresa');
              end;

           if (cb_convenio.Text <> '') and (cb_medico.Text <> '') and (cb_empresa.Text <> '') and (cb_empresa.Text <> '') then
              begin
                   t_relatorio_financeiro_pdf.RLReport1.Preview();
              end;

           end;

        if rb_geral.Checked=true then
           begin
                t_relatorio_financeiro_pdf.RLReport1.Preview();
           end;

      end;

end;

procedure Tt_relatorio_financeiro.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMOS.query_medicos.Active:=false;
  DMOS.query_convenio.Active:=false;
  DMOS.query_plano.Active:=false;
  DMOS.qr_empresa.Active:=false;

  cb_plano.Enabled:=false;
  cb_convenio.Enabled:=false;
  cb_empresa.Enabled:=false;
  cb_medico.Enabled:=false;
  ck_c_convenio.Checked:=false;
  ck_s_convenio.Checked:=false;
  ck_plano.Checked:=false;
  ck_empresa.Checked:=false;
  ck_prof.Checked:=false;

  g_criterio.Enabled:=false;

end;

end.

