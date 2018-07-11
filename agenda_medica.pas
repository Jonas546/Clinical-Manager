unit agenda_medica;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DbCtrls;

type

  { Tt_agenda_medica }

  Tt_agenda_medica = class(TForm)
    db_txt_convenio: TDBEdit;
    DBNavigator1: TDBNavigator;
    db_txt_paciente: TDBEdit;
    db_txt_horario: TDBEdit;
    db_txt_data: TDBEdit;
    db_txt_guia: TDBEdit;
    db_txt_especialidade: TDBEdit;
    db_txt_crm: TDBEdit;
    db_txt_medico: TDBEdit;
    DBGrid1: TDBGrid;
    txt_busca_medico: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_agenda_medica: Tt_agenda_medica;

implementation

{$R *.lfm}

{ Tt_agenda_medica }
uses dm;

procedure Tt_agenda_medica.FormShow(Sender: TObject);
begin
   DMC.qry_agenda_medica.Active:=true;
end;

procedure Tt_agenda_medica.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMC.qry_agenda_medica.Active:=false;
end;

procedure Tt_agenda_medica.FormCreate(Sender: TObject);
begin

end;

end.

