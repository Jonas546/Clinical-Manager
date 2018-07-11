unit registrar_convenio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { Tt_convenio }

  Tt_convenio = class(TForm)
    Button1: TButton;
    txt_convenio: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_convenio: Tt_convenio;

implementation

{$R *.lfm}
uses dm;

{ Tt_convenio }

procedure Tt_convenio.FormShow(Sender: TObject);
begin

end;

procedure Tt_convenio.FormCreate(Sender: TObject);
begin

  DMC.qr_convenio.Active:=true;

end;

procedure Tt_convenio.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

  DMC.qr_convenio.Active:=false;

end;

procedure Tt_convenio.Button1Click(Sender: TObject);
begin

  if txt_convenio.Text = '' then
     begin
       showmessage('Campo Convênio Obrigatório.');
     end
  else
      begin

        DMC.qr_convenio.Close;
        DMC.qr_convenio.SQL.Clear;
        DMC.qr_convenio.SQL.Add('insert into convenio (convenio) values (:v1)');
        DMC.qr_convenio.ParamByName('v1').AsString:=txt_convenio.Text;
        DMC.qr_convenio.ExecSQL;
        DMC.SQLTransaction1.Commit;

        txt_convenio.Clear;

        showmessage('Convênio Registrado com Sucesso.');

      end;

end;

end.

