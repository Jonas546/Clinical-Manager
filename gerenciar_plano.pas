unit gerenciar_plano;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DbCtrls;

type

  { Tt_gerenciar_plano }

  Tt_gerenciar_plano = class(TForm)
    Button1: TButton;
    db_txt_id: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    db_txt_plano: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_gerenciar_plano: Tt_gerenciar_plano;
  key:integer;

implementation

{$R *.lfm}

{ Tt_gerenciar_plano }
uses dm;

procedure Tt_gerenciar_plano.FormShow(Sender: TObject);
begin

  DMC.query_plano.Active:=true;
  DMC.qry_plano.Active:=true;

end;

procedure Tt_gerenciar_plano.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMC.query_plano.Active:=false;
  DMC.qry_plano.Active:=false;

end;

procedure Tt_gerenciar_plano.Button1Click(Sender: TObject);
begin

  if db_txt_plano.Text = '' then
     begin
       showmessage('Digite um Plano de Saúde.');
     end
  else
     begin

       key:=strtoint(db_txt_id.Text);

       DMC.qry_plano.Close;
       DMC.qry_plano.SQL.Clear;
       DMC.qry_plano.SQL.Add('update plano set plano = :v1 where id = :v2');
       DMC.qry_plano.ParamByName('v1').AsString:=db_txt_plano.Text;
       DMC.qry_plano.ParamByName('v2').AsInteger:=key;
       DMC.qry_plano.ExecSQL;
       DMC.SQLTransaction1.Commit;
       DMC.query_plano.Active:=false;
       DMC.query_plano.Active:=true;
       showmessage('Plano Editado com Sucesso.');

     end;

end;

end.

