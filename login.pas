unit login;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Windows;

type

  { Tt_login }

  Tt_login = class(TForm)
    btn_entrar: TButton;
    btn_sair: TButton;
    Label1: TLabel;
    Label2: TLabel;
    txt_login: TEdit;
    txt_senha: TEdit;
    procedure btn_entrarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_login: Tt_login;

implementation

{$R *.lfm}

{ Tt_login }
uses dm, home, dmo;

function GetComputerNameFunc : string;
var ipbuffer : string;
      nsize : dword;
begin
   nsize := 255;
   SetLength(ipbuffer,nsize);
   if GetComputerName(pchar(ipbuffer),nsize) then
      result := ipbuffer;
end;

procedure Tt_login.btn_sairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tt_login.FormShow(Sender: TObject);
begin

  DMC.ibSistema.HostName:=GetComputerNameFunc;
  DMC.ibSistema.Connected:=true;
  DMC.SQLTransaction1.Active:=true;

end;

procedure Tt_login.btn_entrarClick(Sender: TObject);
var
  lg,sn:String;
begin

      lg := txt_login.Text;
      sn := txt_senha.Text;

      DMC.qr_login.Close;
      DMC.qr_login.SQL.Clear;
      DMC.qr_login.SQL.Add('select * from login where login = :lg and senha = :sn');
      DMC.qr_login.ParamByName('lg').AsString:=lg;
      DMC.qr_login.ParamByName('sn').AsString:=sn;
      DMC.qr_login.Open;

      if DMC.qr_login.RecordCount > 0 then
         begin
           t_login.Close;
           t_home.Show;
         end
      else
          begin
            txt_login.Clear;
            txt_senha.Clear;
            showmessage('Login ou Senha Inválidos');
          end;
end;

end.

