unit lancamento_convenio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DbCtrls;

type

  { Tt_lancamento_convenio }

  Tt_lancamento_convenio = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ck_all: TCheckBox;
    ck_todos: TCheckBox;
    ck_enviados: TCheckBox;
    ck_todas_empresas: TCheckBox;
    ck_valor: TCheckBox;
    ck_pacote: TCheckBox;
    ck_tipo_guia: TCheckBox;
    ck_lote: TCheckBox;
    ck_plano: TCheckBox;
    ck_outro: TCheckBox;
    ck_retorno: TCheckBox;
    ck_vacina: TCheckBox;
    ck_teste: TCheckBox;
    ck_exame: TCheckBox;
    ck_cirurgia: TCheckBox;
    ck_procedimento: TCheckBox;
    ck_consulta: TCheckBox;
    data_inicio: TDateTimePicker;
    data_fim: TDateTimePicker;
    cb_convenio: TDBLookupComboBox;
    cb_medico: TDBLookupComboBox;
    cb_plano: TDBLookupComboBox;
    cb_empresa: TDBLookupComboBox;
    GroupBox10: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    tipo_guia: TGroupBox;
    rb_data_guia: TRadioButton;
    rb_data_nome: TRadioButton;
    rb_emergencia1: TRadioButton;
    rb_especial1: TRadioButton;
    rb_etc: TRadioButton;
    rb_ficha: TRadioButton;
    rb_guias: TRadioButton;
    rb_guia_consulta: TRadioButton;
    rb_guia_nome: TRadioButton;
    rb_honorario: TRadioButton;
    rb_horario_todos1: TRadioButton;
    rb_internacao: TRadioButton;
    rb_matricula: TRadioButton;
    rb_nome_guia: TRadioButton;
    rb_normal1: TRadioButton;
    rb_online: TRadioButton;
    rb_planilha: TRadioButton;
    rb_sp: TRadioButton;
    rb_tipo: TRadioButton;
    rb_todos: TRadioButton;
    rb_todos_comprovantes: TRadioButton;
    txt_plano: TEdit;
    txt_prof: TEdit;
    txt_conv_id: TEdit;
    GroupBox11: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    rb_c_materiais: TRadioButton;
    rb_t_materiais: TRadioButton;
    rb_s_materiais: TRadioButton;
    rb_entrega: TRadioButton;
    rb_atendimento: TRadioButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cb_convenioChange(Sender: TObject);
    procedure cb_medicoChange(Sender: TObject);
    procedure cb_planoChange(Sender: TObject);
    procedure ck_allChange(Sender: TObject);
    procedure ck_enviadosChange(Sender: TObject);
    procedure ck_tipo_guiaChange(Sender: TObject);
    procedure ck_todosChange(Sender: TObject);
    procedure ck_todos_lancamentosChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupBox5Click(Sender: TObject);
    procedure GroupBox9Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_lancamento_convenio: Tt_lancamento_convenio;
  cod:integer;

implementation

{$R *.lfm}

{ Tt_lancamento_convenio }
uses relatorio_convenio_2pdf, dm, dmo, relatorio_convenio, relatorio_convenio_pdf, relatorio_convenio_pdf2, relatorio_convenio_pdf3, relatorio_convenio_pdf4, relatorio_convenio_pdf5, relatorio_convenio_pdf6;

procedure CarregaPlano(pid:integer);
begin

  DMOS.query_plano.Close;
  DMOS.query_plano.ParamByName('v1').AsInteger:=pid;
  DMOS.query_plano.Open;

end;

procedure Tt_lancamento_convenio.FormCreate(Sender: TObject);
begin

  tipo_guia.Enabled:=false;

end;

procedure Tt_lancamento_convenio.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMOS.query_medicos.Active:=false;
  DMOS.query_convenio.Active:=false;
  DMOS.query_plano.Active:=false;
  DMOS.qr_empresa.Active:=false;

end;

procedure Tt_lancamento_convenio.cb_convenioChange(Sender: TObject);
begin

  cb_plano.Items.Clear;
  txt_plano.Clear;
  txt_conv_id.Text:= inttostr(integer(cb_convenio.KeyValue));
  cod := strtoint(txt_conv_id.Text);

  CarregaPlano(cod);

end;

procedure Tt_lancamento_convenio.Button1Click(Sender: TObject);
begin

  if (cb_medico.Text = '') then
     begin
       showmessage('Selecione um Profissional.');
     end;

  if (cb_plano.Text = '') then
     begin
       showmessage('Selecione um Plano.');
     end;

  if (cb_convenio.Text = '') then
     begin
       showmessage('Selecione um Convênio.');
     end;

  if (cb_empresa.Text = '') then
     begin
       showmessage('Selecione uma Empresa.');
     end;

  if (cb_empresa.Text <> '') and (cb_plano.Text <> '') and (cb_convenio.Text <> '') and (cb_medico.Text <> '') then
     begin
          t_relatorio_convenio.ShowModal;
     end;

end;

procedure Tt_lancamento_convenio.Button2Click(Sender: TObject);
begin

  if rb_nome_guia.Checked=true then
     begin

       if (ck_enviados.Checked=false) and (ck_todos.Checked=false) then
          begin
            showmessage('Selecione "Enviados" ou "Não Enviados".')
          end;

       if (cb_medico.Text = '') then
          begin
            showmessage('Selecione um Profissional.');
          end;

       if (cb_plano.Text = '') then
          begin
            showmessage('Selecione um Plano.');
          end;

       if (cb_convenio.Text = '') then
          begin
            showmessage('Selecione um Convênio.');
          end;

       if (cb_empresa.Text = '') then
          begin
            showmessage('Selecione uma Empresa.');
          end;

       if (cb_empresa.Text <> '') and (cb_plano.Text <> '') and (cb_convenio.Text <> '') and (cb_medico.Text <> '') and ((ck_enviados.Checked=true) or (ck_todos.Checked=true))then
          begin
          t_relatorio_convenio_pdf.RLConvenios.Preview();
          end;

     end;

  if rb_guia_nome.Checked=true then
     begin

   if (cb_medico.Text = '') then
     begin
       showmessage('Selecione um Profissional.');
     end;

  if (cb_plano.Text = '') then
     begin
       showmessage('Selecione um Plano.');
     end;

  if (cb_convenio.Text = '') then
     begin
       showmessage('Selecione um Convênio.');
     end;

  if (cb_empresa.Text = '') then
     begin
       showmessage('Selecione uma Empresa.');
     end;

  if (cb_empresa.Text <> '') and (cb_plano.Text <> '') and (cb_convenio.Text <> '') and (cb_medico.Text <> '') then
     begin
      t_relatorio_entrega2.RLConvenios.Preview();
     end;

  end;

  if rb_data_guia.Checked=true then
     begin

       if (cb_medico.Text = '') then
          begin
            showmessage('Selecione um Profissional.');
          end;

       if (cb_plano.Text = '') then
          begin
            showmessage('Selecione um Plano.');
          end;

       if (cb_convenio.Text = '') then
          begin
            showmessage('Selecione um Convênio.');
          end;

       if (cb_empresa.Text = '') then
          begin
            showmessage('Selecione uma Empresa.');
          end;

     if (cb_empresa.Text <> '') and (cb_plano.Text <> '') and (cb_convenio.Text <> '') and (cb_medico.Text <> '') then
        begin
         t_relatorio_convenio_pdf3.RLConvenios.Preview();
        end;

     end;

  if rb_data_nome.Checked=true then
     begin

       if (cb_medico.Text = '') then
          begin
            showmessage('Selecione um Profissional.');
          end;

       if (cb_plano.Text = '') then
          begin
            showmessage('Selecione um Plano.');
          end;

       if (cb_convenio.Text = '') then
          begin
            showmessage('Selecione um Convênio.');
          end;

       if (cb_empresa.Text = '') then
          begin
            showmessage('Selecione uma Empresa.');
          end;

       if (cb_empresa.Text <> '') and (cb_plano.Text <> '') and (cb_convenio.Text <> '') and (cb_medico.Text <> '') then
          begin
               t_relatorio_convenio_pdf4.RLConvenios.Preview();
          end;

     end;

  if rb_matricula.Checked=true then
     begin

       if (cb_medico.Text = '') then
          begin
            showmessage('Selecione um Profissional.');
          end;

       if (cb_plano.Text = '') then
          begin
            showmessage('Selecione um Plano.');
          end;

       if (cb_convenio.Text = '') then
          begin
            showmessage('Selecione um Convênio.');
          end;

       if (cb_empresa.Text = '') then
          begin
            showmessage('Selecione uma Empresa.');
          end;

       if (cb_empresa.Text <> '') and (cb_plano.Text <> '') and (cb_convenio.Text <> '') and (cb_medico.Text <> '') then
          begin
            t_relatorio_convenio_pdf5.RLConvenios.Preview();
          end;

     end;

  if rb_tipo.Checked=true then
     begin

   if (cb_medico.Text = '') then
     begin
       showmessage('Selecione um Profissional.');
     end;

  if (cb_plano.Text = '') then
     begin
       showmessage('Selecione um Plano.');
     end;

  if (cb_convenio.Text = '') then
     begin
       showmessage('Selecione um Convênio.');
     end;

  if (cb_empresa.Text = '') then
     begin
       showmessage('Selecione uma Empresa.');
     end;

  if (cb_empresa.Text <> '') and (cb_plano.Text <> '') and (cb_convenio.Text <> '') and (cb_medico.Text <> '') then
     begin
       t_relatorio_convenio_pdf6.RLConvenios.Preview();
     end;
  end;

end;

procedure Tt_lancamento_convenio.cb_medicoChange(Sender: TObject);
begin

  txt_prof.Text:=inttostr(integer(cb_medico.KeyValue));

end;

procedure Tt_lancamento_convenio.cb_planoChange(Sender: TObject);
begin

  txt_plano.Text:=inttostr(integer(cb_plano.KeyValue));

end;

procedure Tt_lancamento_convenio.ck_allChange(Sender: TObject);
begin

  if ck_all.Checked=true then
     begin

       ck_consulta.Checked:=true;
       ck_procedimento.Checked:=true;
       ck_cirurgia.Checked:=true;
       ck_exame.Checked:=true;
       ck_teste.Checked:=true;
       ck_vacina.Checked:=true;
       ck_retorno.Checked:=true;
       ck_outro.Checked:=true;

     end;

end;

procedure Tt_lancamento_convenio.ck_enviadosChange(Sender: TObject);
begin

  if ck_enviados.Checked=true then
     begin
       ck_todos.Checked:=false;
     end;

end;

procedure Tt_lancamento_convenio.ck_tipo_guiaChange(Sender: TObject);
begin

  if ck_tipo_guia.Checked=true then
     begin
       tipo_guia.Enabled:=true;
     end
  else
      begin
       tipo_guia.Enabled:=false;
      end;

end;

procedure Tt_lancamento_convenio.ck_todosChange(Sender: TObject);
begin

    if ck_todos.Checked=true then
     begin
       ck_enviados.Checked:=false;
     end;

end;

procedure Tt_lancamento_convenio.ck_todos_lancamentosChange(Sender: TObject);
begin

end;

procedure Tt_lancamento_convenio.FormShow(Sender: TObject);
begin

  data_inicio.Date:=now;
  data_fim.Date:=data_inicio.Date+1;

  DMOS.query_medicos.Active:=true;
  DMOS.query_convenio.Active:=true;
  DMOS.query_plano.Active:=true;
  DMOS.qr_empresa.Active:=true;

end;

procedure Tt_lancamento_convenio.GroupBox5Click(Sender: TObject);
begin

end;

procedure Tt_lancamento_convenio.GroupBox9Click(Sender: TObject);
begin

end;

end.

