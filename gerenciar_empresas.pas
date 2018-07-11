unit gerenciar_empresas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  DbCtrls, StdCtrls;

type

  { Tt_gerenciar_empresa }

  Tt_gerenciar_empresa = class(TForm)
    db_txt_emp: TDBEdit;
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
  t_gerenciar_empresa: Tt_gerenciar_empresa;

implementation

{$R *.lfm}
uses dm;

{ Tt_gerenciar_empresa }

procedure Tt_gerenciar_empresa.FormShow(Sender: TObject);
begin

  DMC.query_empresa.Active:=true;

  if DMC.query_empresa.RecordCount < 1 then
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

procedure Tt_gerenciar_empresa.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMC.query_empresa.Active:=false;

end;

end.

