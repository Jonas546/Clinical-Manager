unit gerenciar_convenio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, DBGrids;

type

  { Tt_gerenciar_convenio }

  Tt_gerenciar_convenio = class(TForm)
    db_txt_convenio: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_gerenciar_convenio: Tt_gerenciar_convenio;

implementation

{$R *.lfm}
uses dm;

{ Tt_gerenciar_convenio }

procedure Tt_gerenciar_convenio.FormShow(Sender: TObject);
begin

  DMC.query_convenio.Active:=true;

  if DMC.query_convenio.RecordCount < 1 then
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

procedure Tt_gerenciar_convenio.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMC.query_convenio.Active:=false;

end;

end.

