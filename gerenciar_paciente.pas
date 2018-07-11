unit gerenciar_paciente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, DBGrids, DbCtrls, StdCtrls, DateUtils, DB;

type

  { Tt_gerenciar_pacientes }

  Tt_gerenciar_pacientes = class(TForm)
    btn_historico: TButton;
    cb_uf: TComboBox;
    cb_civil: TComboBox;
    cb_sexo: TComboBox;
    date_validad: TDateTimePicker;
    date_emissao: TDateTimePicker;
    date_nascimento: TDateTimePicker;
    db_txt_plano: TDBEdit;
    db_txt_sexo: TDBEdit;
    db_txt_civil: TDBEdit;
    db_txt_cpf_r: TDBEdit;
    db_txt_responsavel: TDBEdit;
    db_txt_titular: TDBEdit;
    db_txt_validade: TDBEdit;
    db_txt_convenio: TDBEdit;
    db_txt_carteira: TDBEdit;
    db_txt_empresa: TDBEdit;
    db_txt_profissao: TDBEdit;
    db_txt_cidade: TDBEdit;
    db_txt_bairro: TDBEdit;
    db_txt_endereco: TDBEdit;
    db_txt_cep: TDBEdit;
    db_txt_email: TDBEdit;
    db_txt_cel: TDBEdit;
    db_txt_tel: TDBEdit;
    db_txt_local_nasc: TDBEdit;
    db_txt_data_nasc: TDBEdit;
    db_txt_data_emissao: TDBEdit;
    db_txt_emissor: TDBEdit;
    db_txt_uf: TDBEdit;
    db_txt_cpf: TDBEdit;
    db_txt_rg: TDBEdit;
    db_txt_nome: TDBEdit;
    db_txt_id: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label31: TLabel;
    txt_busca: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure btn_historicoClick(Sender: TObject);
    procedure cb_anoChange(Sender: TObject);
    procedure cb_civilChange(Sender: TObject);
    procedure cb_diaChange(Sender: TObject);
    procedure cb_mesChange(Sender: TObject);
    procedure cb_sexoChange(Sender: TObject);
    procedure cb_ufChange(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure date_emissaoChange(Sender: TObject);
    procedure date_nascimentoChange(Sender: TObject);
    procedure date_validadChange(Sender: TObject);
    procedure date_validadeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txt_buscaChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_gerenciar_pacientes: Tt_gerenciar_pacientes;

implementation

{$R *.lfm}

{ Tt_gerenciar_pacientes }
uses dm, historico_paciente;

procedure Tt_gerenciar_pacientes.FormCreate(Sender: TObject);
begin

  cb_uf.Items.Clear;

      cb_uf.Items.Add('AC');
      cb_uf.Items.Add('AL');
      cb_uf.Items.Add('AM');
      cb_uf.Items.Add('AP');
      cb_uf.Items.Add('BA');
      cb_uf.Items.Add('CE');
      cb_uf.Items.Add('DF');
      cb_uf.Items.Add('ES');
      cb_uf.Items.Add('GO');
      cb_uf.Items.Add('MA');
      cb_uf.Items.Add('MG');
      cb_uf.Items.Add('MS');
      cb_uf.Items.Add('MT');
      cb_uf.Items.Add('PA');
      cb_uf.Items.Add('PB');
      cb_uf.Items.Add('PE');
      cb_uf.Items.Add('PI');
      cb_uf.Items.Add('PR');
      cb_uf.Items.Add('RJ');
      cb_uf.Items.Add('RN');
      cb_uf.Items.Add('RO');
      cb_uf.Items.Add('RR');
      cb_uf.Items.Add('RS');
      cb_uf.Items.Add('SC');
      cb_uf.Items.Add('SE');
      cb_uf.Items.Add('SP');
      cb_uf.Items.Add('TO');

end;

procedure Tt_gerenciar_pacientes.FormShow(Sender: TObject);
begin

  DMC.query_paciente.Active:=true;

  if DMC.query_paciente.RecordCount < 1 then
     begin
       DBNavigator1.Controls[0].Enabled:=false;
       DBNavigator1.Controls[1].Enabled:=false;
       DBNavigator1.Controls[2].Enabled:=false;
       DBNavigator1.Controls[3].Enabled:=false;
       DBNavigator1.Controls[4].Enabled:=false;
       DBNavigator1.Controls[5].Enabled:=false;
       DBNavigator1.Controls[6].Enabled:=false;
       DBNavigator1.Controls[7].Enabled:=false;
       DBNavigator1.Controls[8].Enabled:=false;
     end;

  db_txt_rg.Field.EditMask := '99.999.999-9;1;_';
  db_txt_cpf.Field.EditMask := '999.999.999-99;1;_';
  db_txt_cpf_r.Field.EditMask := '999.999.999-99;1;_';
  db_txt_tel.Field.EditMask := '99-99999999;1;_';
  db_txt_cel.Field.EditMask := '99-999999999;1;_';
  db_txt_cep.Field.EditMask := '99999-999;1;_';

  cb_civil.Items.Clear;

  cb_civil.Items.Add('Solteiro(a)');
  cb_civil.Items.Add('Casado(a)');
  cb_civil.Items.Add('Divorciado(a)');
  cb_civil.Items.Add('Viúvo(a)');

  cb_sexo.Items.Clear;

  cb_sexo.Items.Add('M');
  cb_sexo.Items.Add('F');

end;

procedure Tt_gerenciar_pacientes.txt_buscaChange(Sender: TObject);
begin
  DMC.query_paciente.Locate('nome', txt_busca.Text, [loPartialKey,loCaseInsensitive]);
end;

procedure Tt_gerenciar_pacientes.cb_ufChange(Sender: TObject);
begin
  db_txt_uf.Text:=cb_uf.Text;
end;

procedure Tt_gerenciar_pacientes.DateTimePicker1Change(Sender: TObject);
begin

end;

procedure Tt_gerenciar_pacientes.date_emissaoChange(Sender: TObject);
begin
  db_txt_data_emissao.Text:= DatetoStr(date_emissao.Date);
end;

procedure Tt_gerenciar_pacientes.date_nascimentoChange(Sender: TObject);
begin
  db_txt_data_nasc.Text:= DatetoStr(date_nascimento.Date);
end;

procedure Tt_gerenciar_pacientes.date_validadChange(Sender: TObject);
begin
   db_txt_validade.Text:= DatetoStr(date_validad.Date)
end;

procedure Tt_gerenciar_pacientes.date_validadeChange(Sender: TObject);
begin
  //db_txt_validade.Text:= DatetoStr(date_validade.Date);
end;

procedure Tt_gerenciar_pacientes.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   DMC.query_paciente.Active:=false;
end;

procedure Tt_gerenciar_pacientes.cb_mesChange(Sender: TObject);
var
  mes:String;
begin

end;

procedure Tt_gerenciar_pacientes.cb_sexoChange(Sender: TObject);
begin
  db_txt_sexo.Text:=cb_sexo.Text;
end;

procedure Tt_gerenciar_pacientes.cb_diaChange(Sender: TObject);
begin
  //db_txt_data.Text:=cb_dia.Text+'/'+cb_mes.Text+'/'+cb_ano.Text;
end;

procedure Tt_gerenciar_pacientes.cb_anoChange(Sender: TObject);
begin
  //db_txt_data.Text:=cb_dia.Text+'/'+cb_mes.Text+'/'+cb_ano.Text;
end;

procedure Tt_gerenciar_pacientes.btn_historicoClick(Sender: TObject);
begin

  t_historico.ShowModal;

end;

procedure Tt_gerenciar_pacientes.cb_civilChange(Sender: TObject);
begin
  db_txt_civil.Text:=cb_civil.Text;
end;

end.

