unit medico_relatorio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls;

type

  { Tt_medico_relatorio }

  Tt_medico_relatorio = class(TForm)
    Button1: TButton;
    date_inicio: TDateTimePicker;
    date_fim: TDateTimePicker;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    rb_sem: TRadioButton;
    rb_com: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_medico_relatorio: Tt_medico_relatorio;
  medico, a_nome: String;
  key:integer;

implementation

{$R *.lfm}
uses dm, home, relatorio_atendimento;

{ Tt_medico_relatorio }

procedure Tt_medico_relatorio.FormShow(Sender: TObject);
begin

  date_inicio.Date:=now;
  date_fim.Date:=now+1;

  DMC.qr_verifica_medico.Active:=true;

  medico := t_home.Label1.Caption;

  DMC.qr_verifica_medico.Close;
  DMC.qr_verifica_medico.SQL.Clear;
  DMC.qr_verifica_medico.SQL.Add('select m.nome, m.id from medico as m, login as l where l.cod_medico = m.id and l.login = :v1');
  DMC.qr_verifica_medico.ParamByName('v1').AsString:=medico;
  DMC.qr_verifica_medico.Open;

  if DMC.qr_verifica_medico.RecordCount > 0 then
    begin
         a_nome:= DMC.qr_verifica_medico.Fields[0].AsString;
         key:=DMC.qr_verifica_medico.Fields[1].AsInteger;
         Label2.Caption:=a_nome;
         Label3.Caption:=inttostr(key);
         DMC.qr_verifica_medico.Next;
    end;

end;

procedure Tt_medico_relatorio.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMC.qr_verifica_medico.Active:=false;

end;

procedure Tt_medico_relatorio.Button1Click(Sender: TObject);
begin
  t_relatorio_atendimento.ShowModal;
end;

end.

