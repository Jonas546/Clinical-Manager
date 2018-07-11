unit podologo_materiais;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  DbCtrls, StdCtrls;

type

  { Tt_podologo_materiais }

  Tt_podologo_materiais = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
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
  t_podologo_materiais: Tt_podologo_materiais;
  a_guia: integer;

implementation

{$R *.lfm}

{ Tt_podologo_materiais }
uses dm, consulta_podologo;

procedure Tt_podologo_materiais.FormShow(Sender: TObject);
begin

  a_guia := strtoint(t_consulta_podologo.db_txt_guia.Text);

  DMC.query_material.Active:=true;

  DMC.query_material.Close;
  DMC.query_material.ParamByName('v1').AsInteger:=a_guia;
  DMC.query_material.Open;

  if DMC.query_material.RecordCount < 1 then
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

procedure Tt_podologo_materiais.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMC.query_material.Active:=false;
end;

end.

