unit agenda_diaria;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, DBGrids, StdCtrls, DbCtrls, DateUtils;

type

  { Tt_agenda_diaria }

  Tt_agenda_diaria = class(TForm)
    Button1: TButton;
    data_busca: TDateTimePicker;
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    db_txt_email: TDBEdit;
    db_txt_cel: TDBEdit;
    db_txt_tel: TDBEdit;
    db_txt_valor: TDBEdit;
    db_txt_pagamento: TDBEdit;
    db_txt_atendente: TDBEdit;
    db_txt_medico: TDBEdit;
    db_txt_especialidade: TDBEdit;
    db_txt_data: TDBEdit;
    db_txt_guia: TDBEdit;
    db_txt_validade: TDBEdit;
    db_txt_convenio: TDBEdit;
    db_txt_nascimento: TDBEdit;
    db_txt_sexo: TDBEdit;
    db_txt_cpf: TDBEdit;
    db_txt_rg: TDBEdit;
    db_txt_nome: TDBEdit;
    db_txt_matricula: TDBEdit;
    DBGrid1: TDBGrid;
    txt_data: TEdit;
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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure data_buscaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_agenda_diaria: Tt_agenda_diaria;

implementation

{$R *.lfm}

{ Tt_agenda_diaria }
uses dm, agenda_diaria_pdf;

procedure Tt_agenda_diaria.FormShow(Sender: TObject);
begin

  data_busca.Date:=now;

  DMC.qr_agenda_diaria.Active:=true;

  DMC.qr_agenda_diaria.Close;
  DMC.qr_agenda_diaria.ParamByName('v1').Value:=now;
  DMC.qr_agenda_diaria.Open;

end;

procedure Tt_agenda_diaria.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

   DMC.qr_agenda_diaria.Active:=false;

end;

procedure Tt_agenda_diaria.data_buscaChange(Sender: TObject);
begin

  DMC.qr_agenda_diaria.Close;
  DMC.qr_agenda_diaria.ParamByName('v1').Value:=data_busca.Date;
  DMC.qr_agenda_diaria.Open;

  txt_data.Text:=datetostr(data_busca.Date);

end;

procedure Tt_agenda_diaria.Button1Click(Sender: TObject);
begin
  t_agenda_pdf.RLAgenda.Preview();
end;

end.

