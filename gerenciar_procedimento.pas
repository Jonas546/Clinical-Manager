unit gerenciar_procedimento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  DbCtrls, StdCtrls;

type

  { Tt_gerenciar_proc }

  Tt_gerenciar_proc = class(TForm)
    DBEdit1: TDBEdit;
    db_txt_preco: TDBEdit;
    db_txt_desc: TDBEdit;
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
  t_gerenciar_proc: Tt_gerenciar_proc;

implementation

{$R *.lfm}

{ Tt_gerenciar_proc }
uses dm;

procedure Tt_gerenciar_proc.FormShow(Sender: TObject);
begin

     DMC.query_dentista_proc.Active:=true;

     if DMC.query_dentista_proc.RecordCount < 1 then
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

procedure Tt_gerenciar_proc.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMC.query_dentista_proc.Active:=false;
end;

end.

