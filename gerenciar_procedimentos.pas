unit gerenciar_procedimentos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  DbCtrls, StdCtrls;

type

  { Tt_gerenciar_procedimentos }

  Tt_gerenciar_procedimentos = class(TForm)
    db_txt_desc: TDBEdit;
    db_txt_valor: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_gerenciar_procedimentos: Tt_gerenciar_procedimentos;
  esp:String;

implementation

{$R *.lfm}
uses dm;

{ Tt_gerenciar_procedimentos }

procedure Tt_gerenciar_procedimentos.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMC.query_list_proc.Active:=false;

end;

procedure Tt_gerenciar_procedimentos.FormShow(Sender: TObject);
begin

  esp:='Dentista';

  DMC.query_list_proc.Active:=true;

  DMC.query_list_proc.Close;
  DMC.query_list_proc.ParamByName('v1').AsString:=esp;
  DMC.query_list_proc.Open;

  if DMC.query_list_proc.RecordCount < 1 then
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

end.

