unit oftalmo_agenda;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DBGrids, DbCtrls;

type

  { Tt_oftalmo_agenda }

  Tt_oftalmo_agenda = class(TForm)
    Button1: TButton;
    data_busca: TDateTimePicker;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    db_txt_convenio: TDBEdit;
    db_txt_cpf: TDBEdit;
    db_txt_data: TDBEdit;
    db_txt_guia: TDBEdit;
    db_txt_hora: TDBEdit;
    db_txt_medico: TDBEdit;
    db_txt_paciente: TDBEdit;
    db_txt_plano: TDBEdit;
    db_txt_rg: TDBEdit;
    db_txt_sexo: TDBEdit;
    db_txt_tipo: TDBEdit;
    db_txt_validade: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    xxx: TLabel;
    xxx1: TLabel;
    yyy: TLabel;
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
  t_oftalmo_agenda: Tt_oftalmo_agenda;
  medico, a_nome: String;
  key:integer;

implementation

{$R *.lfm}
uses dm, home, consulta_oftalmo;

procedure CarregaDados(key:integer);
begin

  DMC.qr_agenda_medico.Close;
  DMC.qr_agenda_medico.ParamByName('v1').AsInteger:=key;
  DMC.qr_agenda_medico.ParamByName('v2').Value:=now;
  DMC.qr_agenda_medico.Open;

end;

{ Tt_oftalmo_agenda }

procedure Tt_oftalmo_agenda.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMC.qr_agenda_medico.Active:=false;
  DMC.qr_verifica_medico.Active:=false

end;

procedure Tt_oftalmo_agenda.Button1Click(Sender: TObject);
begin

    if db_txt_guia.Text <> '' then
       begin
            t_consulta_oftalmo.ShowModal;
       end
    else
        begin
          showmessage('Nenhum Paciente Selecionado.');
        end;

end;

procedure Tt_oftalmo_agenda.data_buscaChange(Sender: TObject);
begin

    medico := t_home.Label1.Caption;

      DMC.qr_verifica_medico.Close;
      DMC.qr_verifica_medico.SQL.Clear;
      DMC.qr_verifica_medico.SQL.Add('select m.nome, m.id from medico as m, login as l where l.cod_medico = m.id and l.login = :v1');
      DMC.qr_verifica_medico.ParamByName('v1').AsString:=medico;
      DMC.qr_verifica_medico.Open;

      if DMC.qr_verifica_medico.RecordCount > 0 then
         begin
           a_nome:= DMC.qr_verifica_medico.Fields[0].AsString;
           key:=DMC.qr_verifica_medico.Fields[1].AsInteger;
           DMC.qr_agenda_medico.Close;
           DMC.qr_agenda_medico.ParamByName('v1').AsInteger:=key;
           DMC.qr_agenda_medico.ParamByName('v2').Value:=data_busca.Date;
           DMC.qr_agenda_medico.Open;
           DMC.qr_verifica_medico.Next;
         end;

end;

procedure Tt_oftalmo_agenda.FormShow(Sender: TObject);
begin

    data_busca.Date:=now;

    DMC.qr_agenda_medico.Active:=true;
    DMC.qr_verifica_medico.Active:=true;

    medico := t_home.Label1.Caption;

    DMC.qr_verifica_medico.Close;
    DMC.qr_verifica_medico.SQL.Clear;
    DMC.qr_verifica_medico.SQL.Add('select m.nome, m.id from medico as m, login as l where l.cod_medico = m.id and l.login = :v1');
    DMC.qr_verifica_medico.ParamByName('v1').AsString:=medico;
    DMC.qr_verifica_medico.Open;

    if DMC.qr_verifica_medico.RecordCount > 0 then
       begin
         a_nome:= DMC.qr_verifica_medico.Fields[0].AsString;
         key:=DMC.qr_verifica_medico.Fields[1].AsInteger;
         CarregaDados(key);
         DMC.qr_verifica_medico.Next;
       end;

end;

end.

