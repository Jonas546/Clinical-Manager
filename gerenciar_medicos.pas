unit gerenciar_medicos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, DBGrids, DbCtrls, StdCtrls, DB;

type

  { Tt_gerenciar_medico }

  Tt_gerenciar_medico = class(TForm)
    cb_especial: TComboBox;
    cb_uf: TComboBox;
    cb_entrada: TComboBox;
    cb_saida: TComboBox;
    date_demissao: TDateTimePicker;
    date_admissao: TDateTimePicker;
    db_hora_saida: TDBEdit;
    db_hora_entrada: TDBEdit;
    db_txt_saida: TDBEdit;
    db_txt_entrada: TDBEdit;
    db_txt_uf: TDBEdit;
    db_txt_cidade: TDBEdit;
    db_txt_bairo: TDBEdit;
    db_txt_cep: TDBEdit;
    db_txt_endereco: TDBEdit;
    db_txt_email: TDBEdit;
    db_txt_crm: TDBEdit;
    db_txt_especial: TDBEdit;
    db_txt_tel: TDBEdit;
    db_txt_cpf: TDBEdit;
    db_txt_rg: TDBEdit;
    db_txt_nome: TDBEdit;
    db_txt_id: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label19: TLabel;
    Label20: TLabel;
    txt_busca: TEdit;
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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure cb_entradaChange(Sender: TObject);
    procedure cb_especialChange(Sender: TObject);
    procedure cb_saidaChange(Sender: TObject);
    procedure cb_ufChange(Sender: TObject);
    procedure date_admissaoChange(Sender: TObject);
    procedure date_demissaoChange(Sender: TObject);
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
  t_gerenciar_medico: Tt_gerenciar_medico;

implementation

{$R *.lfm}

{ Tt_gerenciar_medico }
uses dm;

procedure Tt_gerenciar_medico.FormCreate(Sender: TObject);
begin
  //DMC.query_medico.Active:=true;

  cb_especial.Items.Clear;

  cb_especial.Items.Add('Oftalmologista');
  cb_especial.Items.Add('Dentista');
  cb_especial.Items.Add('Cardiologista');
  cb_especial.Items.Add('Podólogo');
  cb_especial.Items.Add('Infectologista');

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

      cb_entrada.Items.Clear;

      cb_entrada.Items.Add('08:00');
      cb_entrada.Items.Add('08:20');
      cb_entrada.Items.Add('08:40');
      cb_entrada.Items.Add('09:00');
      cb_entrada.Items.Add('09:20');
      cb_entrada.Items.Add('09:40');
      cb_entrada.Items.Add('10:00');
      cb_entrada.Items.Add('10:20');
      cb_entrada.Items.Add('10:40');
      cb_entrada.Items.Add('11:00');
      cb_entrada.Items.Add('11:20');
      cb_entrada.Items.Add('11:40');
      cb_entrada.Items.Add('12:00');
      cb_entrada.Items.Add('12:20');
      cb_entrada.Items.Add('12:40');
      cb_entrada.Items.Add('13:00');
      cb_entrada.Items.Add('13:20');
      cb_entrada.Items.Add('13:40');
      cb_entrada.Items.Add('14:00');
      cb_entrada.Items.Add('14:20');
      cb_entrada.Items.Add('14:40');
      cb_entrada.Items.Add('15:00');
      cb_entrada.Items.Add('15:20');
      cb_entrada.Items.Add('15:40');
      cb_entrada.Items.Add('16:00');
      cb_entrada.Items.Add('16:20');
      cb_entrada.Items.Add('16:40');
      cb_entrada.Items.Add('17:00');
      cb_entrada.Items.Add('17:20');
      cb_entrada.Items.Add('17:40');

      cb_saida.Items.Clear;

      cb_saida.Items.Add('08:00');
      cb_saida.Items.Add('08:20');
      cb_saida.Items.Add('08:40');
      cb_saida.Items.Add('09:00');
      cb_saida.Items.Add('09:20');
      cb_saida.Items.Add('09:40');
      cb_saida.Items.Add('10:00');
      cb_saida.Items.Add('10:20');
      cb_saida.Items.Add('10:40');
      cb_saida.Items.Add('11:00');
      cb_saida.Items.Add('11:20');
      cb_saida.Items.Add('11:40');
      cb_saida.Items.Add('12:00');
      cb_saida.Items.Add('12:20');
      cb_saida.Items.Add('12:40');
      cb_saida.Items.Add('13:00');
      cb_saida.Items.Add('13:20');
      cb_saida.Items.Add('13:40');
      cb_saida.Items.Add('14:00');
      cb_saida.Items.Add('14:20');
      cb_saida.Items.Add('14:40');
      cb_saida.Items.Add('15:00');
      cb_saida.Items.Add('15:20');
      cb_saida.Items.Add('15:40');
      cb_saida.Items.Add('16:00');
      cb_saida.Items.Add('16:20');
      cb_saida.Items.Add('16:40');
      cb_saida.Items.Add('17:00');
      cb_saida.Items.Add('17:20');
      cb_saida.Items.Add('17:40');
      cb_saida.Items.Add('18:00');

end;

procedure Tt_gerenciar_medico.FormShow(Sender: TObject);
begin

  date_admissao.Date:=now;
  date_demissao.Date:=now;

  DMC.query_medico.Active:=true;

  if DMC.query_medico.RecordCount < 1 then
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

end;

procedure Tt_gerenciar_medico.txt_buscaChange(Sender: TObject);
begin
  DMC.query_medico.Locate('nome', txt_busca.Text, [loPartialKey,loCaseInsensitive]);
end;

procedure Tt_gerenciar_medico.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMC.query_medico.Active:=false;
end;

procedure Tt_gerenciar_medico.cb_especialChange(Sender: TObject);
begin
  db_txt_especial.Text:=cb_especial.Text;
end;

procedure Tt_gerenciar_medico.cb_saidaChange(Sender: TObject);
begin
  db_hora_saida.Text:=cb_saida.Text;
end;

procedure Tt_gerenciar_medico.cb_entradaChange(Sender: TObject);
begin
  db_hora_entrada.Text:=cb_entrada.Text;
end;

procedure Tt_gerenciar_medico.cb_ufChange(Sender: TObject);
begin
  db_txt_uf.Text:=cb_uf.Text;
end;

procedure Tt_gerenciar_medico.date_admissaoChange(Sender: TObject);
begin
  db_txt_entrada.Text:=Datetostr(date_admissao.Date);
end;

procedure Tt_gerenciar_medico.date_demissaoChange(Sender: TObject);
begin
  db_txt_saida.Text:=Datetostr(date_demissao.Date);
end;

end.

