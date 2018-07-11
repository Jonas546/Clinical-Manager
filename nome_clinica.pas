unit nome_clinica;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { Tt_nome_clinica }

  Tt_nome_clinica = class(TForm)
    Button1: TButton;
    txt_nome: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_nome_clinica: Tt_nome_clinica;
  key:integer;

implementation

{$R *.lfm}

{ Tt_nome_clinica }
uses dmo, home;

procedure Tt_nome_clinica.FormCreate(Sender: TObject);
begin

     DMOS.qr_config.Active:=true;

end;

procedure Tt_nome_clinica.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

     DMOS.qr_config.Active:=false;

end;

procedure Tt_nome_clinica.Button1Click(Sender: TObject);
begin

   key:=1;

   if txt_nome.Text = '' then
      begin
         showmessage('Digite um Nome para Sua Clínica.');
      end
   else
       begin

         DMOS.qr_config.Close;
         DMOS.qr_config.SQL.Clear;
         DMOS.qr_config.SQL.Add('update config set nome = :v1 where id = :v2');
         DMOS.qr_config.ParamByName('v1').AsString:=txt_nome.Text;
         DMOS.qr_config.ParamByName('v2').AsInteger:=key;
         DMOS.qr_config.ExecSQL;

         DMOS.SQLTransaction1.Commit;

         DMOS.query_config.Active:=false;
         DMOS.query_config.Active:=true;

         showmessage('Nome Registrado com Sucesso.');

         with t_home do
          begin
            lb_name.Caption:=txt_nome.Text;
          end;

         txt_nome.Clear;

       end;

end;

end.

