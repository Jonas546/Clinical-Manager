unit registrar_plano;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls;

type

  { Tt_registrar_plano }

  Tt_registrar_plano = class(TForm)
    Button1: TButton;
    cb_convenio: TDBLookupComboBox;
    txt_plano: TEdit;
    txt_id: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure cb_convenioChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_registrar_plano: Tt_registrar_plano;

implementation

{$R *.lfm}

{ Tt_registrar_plano }
uses dm;

procedure Tt_registrar_plano.Button1Click(Sender: TObject);
var
  pid: integer;
begin

  if txt_plano.Text = '' then
     begin
       showmessage('Digite o Campo Plano.')
     end;

  if cb_convenio.Text = '' then
     begin
       showmessage('Selecione um Convênio.');
     end;

  if (txt_plano.Text <> '') and (cb_convenio.Text <> '') then
     begin

       pid := strtoint(txt_id.Text);

       DMC.qr_plano.Close;
       DMC.qr_plano.SQL.Clear;
       DMC.qr_plano.SQL.Add('insert into plano (plano, cod_conv)');
       DMC.qr_plano.SQL.Add('values');
       DMC.qr_plano.SQL.Add('(:v1,:v2)');
       DMC.qr_plano.ParamByName('v1').AsString:=txt_plano.Text;
       DMC.qr_plano.ParamByName('v2').AsInteger:=pid;
       DMC.qr_plano.ExecSQL;
       DMC.SQLTransaction1.Commit;

       DMC.qry_convenio.Active:=false;
       DMC.qry_convenio.Active:=true;

       showmessage('Plano Registrado com Sucesso.');

       txt_plano.Clear;

     end;

end;

procedure Tt_registrar_plano.cb_convenioChange(Sender: TObject);
begin
  txt_id.Text:=inttostr(Integer(cb_convenio.KeyValue));
end;

procedure Tt_registrar_plano.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMC.qr_plano.Active:=false;
  DMC.qry_convenio.Active:=false;

end;

procedure Tt_registrar_plano.FormCreate(Sender: TObject);
begin

  DMC.qr_plano.Active:=true;

end;

procedure Tt_registrar_plano.FormShow(Sender: TObject);
begin

  DMC.qry_convenio.Active:=true;

end;

end.

