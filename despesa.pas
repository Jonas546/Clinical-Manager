unit despesa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls;

type

  { Tt_despesas }

  Tt_despesas = class(TForm)
    Button1: TButton;
    date_fim: TDateTimePicker;
    date_inicio: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_despesas: Tt_despesas;

implementation

{$R *.lfm}
uses relatorio_despesa;

{ Tt_despesas }

procedure Tt_despesas.Button1Click(Sender: TObject);
begin
  t_relatorio_despesa.ShowModal;
end;

procedure Tt_despesas.FormShow(Sender: TObject);
begin

  date_inicio.Date:=now;
  date_fim.Date:=date_inicio.Date+1;

end;

end.

