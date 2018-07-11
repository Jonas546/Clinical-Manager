unit gerenciar_atendentes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, DateTimePicker, Forms,
  Controls, Graphics, Dialogs, DBGrids, DbCtrls, StdCtrls, DB;

type

  { Tgerenciar_atendentes }

  Tgerenciar_atendentes = class(TForm)
    cb_uf: TComboBox;
    date_demissao: TDateTimePicker;
    date_admissao: TDateTimePicker;
    db_txt_saida: TDBEdit;
    db_txt_entrada: TDBEdit;
    db_txt_endereco: TDBEdit;
    db_txt_cidade: TDBEdit;
    db_txt_bairro: TDBEdit;
    db_txt_uf: TDBEdit;
    db_txt_cep: TDBEdit;
    db_txt_cpf: TDBEdit;
    db_txt_id: TDBEdit;
    db_txt_nome: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    db_txt_rg: TDBEdit;
    db_txt_tel: TDBEdit;
    txt_busca: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure cb_ano_aChange(Sender: TObject);
    procedure cb_ano_dChange(Sender: TObject);
    procedure cb_dia_aChange(Sender: TObject);
    procedure cb_dia_dChange(Sender: TObject);
    procedure cb_mes_aChange(Sender: TObject);
    procedure cb_mes_dChange(Sender: TObject);
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
  t_gerenciar_atendentes: Tgerenciar_atendentes;

implementation

{$R *.lfm}

{ Tgerenciar_atendentes }
uses dm;

procedure Tgerenciar_atendentes.FormCreate(Sender: TObject);
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

procedure Tgerenciar_atendentes.FormShow(Sender: TObject);
begin

  date_admissao.Date:=now;
  date_demissao.Date:=now;

  DMC.query_atendente.Active:=true;

  if DMC.query_atendente.RecordCount < 1 then
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
  db_txt_tel.Field.EditMask := '99-999999999;1;_';
  db_txt_cep.Field.EditMask := '99999-999;1;_';

end;

procedure Tgerenciar_atendentes.txt_buscaChange(Sender: TObject);
begin
  DMC.query_atendente.Locate('nome', txt_busca.Text, [loPartialKey,loCaseInsensitive]);
end;

procedure Tgerenciar_atendentes.cb_ano_aChange(Sender: TObject);
begin

end;

procedure Tgerenciar_atendentes.cb_ano_dChange(Sender: TObject);
begin

end;

procedure Tgerenciar_atendentes.cb_dia_aChange(Sender: TObject);
begin

end;

procedure Tgerenciar_atendentes.cb_dia_dChange(Sender: TObject);
begin

end;

procedure Tgerenciar_atendentes.cb_mes_aChange(Sender: TObject);
begin

end;

procedure Tgerenciar_atendentes.cb_mes_dChange(Sender: TObject);
begin

end;

procedure Tgerenciar_atendentes.cb_ufChange(Sender: TObject);
begin
  db_txt_uf.Text:=cb_uf.Text;
end;

procedure Tgerenciar_atendentes.date_admissaoChange(Sender: TObject);
begin
  db_txt_entrada.Text:=Datetostr(date_admissao.Date);
end;

procedure Tgerenciar_atendentes.date_demissaoChange(Sender: TObject);
begin
  db_txt_saida.Text:=Datetostr(date_demissao.Date);
end;

procedure Tgerenciar_atendentes.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMC.query_atendente.Active:=false;
end;

end.

