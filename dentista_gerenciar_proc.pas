unit dentista_gerenciar_proc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  DbCtrls, StdCtrls;

type

  { Tt_dentista_proc }

  Tt_dentista_proc = class(TForm)
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    db_txt_desc: TDBEdit;
    db_txt_preco: TDBEdit;
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
  t_dentista_proc: Tt_dentista_proc;
  esp:String;

implementation

{$R *.lfm}
uses dm;

{ Tt_dentista_proc }

procedure Tt_dentista_proc.FormShow(Sender: TObject);
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

procedure Tt_dentista_proc.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMC.query_list_proc.Active:=false;

end;

end.

