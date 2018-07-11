unit inicial;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls;

type

  { Tt_inicial }

  Tt_inicial = class(TForm)
    lb_percent: TLabel;
    bar_progress: TProgressBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_inicial: Tt_inicial;

implementation

{$R *.lfm}

{ Tt_inicial }
uses login;

procedure Tt_inicial.Timer1Timer(Sender: TObject);
begin
  bar_progress.Position := bar_progress.Position + 1;
  lb_percent.Caption:= inttostr(bar_progress.Position) + '%';

  if bar_progress.Position = 100 then
     begin
       t_inicial.Destroy;
       t_login.Show;
     end;

end;

end.

