unit registrar_empresa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  StdCtrls;

type

  { Tt_registrar_empresa }

  Tt_registrar_empresa = class(TForm)
    Button1: TButton;
    txt_empresa: TEdit;
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
  t_registrar_empresa: Tt_registrar_empresa;

implementation

{$R *.lfm}

{ Tt_registrar_empresa }
uses dm, gerenciar_empresas;

procedure Tt_registrar_empresa.FormCreate(Sender: TObject);
begin
  DMC.qr_empresa.Active:=true;
end;

procedure Tt_registrar_empresa.FormShow(Sender: TObject);
begin

end;

procedure Tt_registrar_empresa.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMC.qr_empresa.Active:=false;
end;

procedure Tt_registrar_empresa.Button1Click(Sender: TObject);
begin

   if txt_empresa.Text = '' then
      begin
           showmessage('Campo Empresa Obrigatório.')
      end
   else
       begin
            DMC.qr_empresa.Close;
            DMC.qr_empresa.SQL.Clear;
            DMC.qr_empresa.SQL.Add('insert into empresa(emp) values (:v1)');
            DMC.qr_empresa.ParamByName('v1').AsString:=txt_empresa.Text;
            DMC.qr_empresa.ExecSQL;
            DMC.SQLTransaction1.Commit;
            txt_empresa.Clear;
            showmessage('Empresa Registrada com Sucesso.')
       end;

end;

end.

