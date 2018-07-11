unit registrar_logotipo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { Tt_logotipo }

  Tt_logotipo = class(TForm)
    Button1: TButton;
    Image1: TImage;
    txt_img: TEdit;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_logotipo: Tt_logotipo;

implementation

{$R *.lfm}

{ Tt_logotipo }
uses dmo, home;

procedure Tt_logotipo.FormCreate(Sender: TObject);
begin

  DMOS.qr_config.Active:=true;

end;

procedure Tt_logotipo.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

  DMOS.qr_config.Active:=false;

end;

procedure Tt_logotipo.Button1Click(Sender: TObject);
var
   OpenDialog:TOpenDialog;
   Caminho, Ext: String;
   largura, altura, keys:integer;
begin

  OpenDialog := TOpenDialog.Create(nil);
    if OpenDialog.Execute then
          begin
              txt_img.Clear;
              Caminho := OpenDialog.FileName;
              Ext:=ExtractFileExt(Caminho);

      if (Ext = '.jpg') or (Ext = '.jpeg') or (Ext = '.gif') or (Ext = '.png') or (Ext = '.bmp') then
       begin

       txt_img.Text:=Caminho;
       Image1.Picture.LoadFromFile(Caminho);
       FreeAndNil(OpenDialog);
       largura:=Image1.Picture.Width;
       altura:=Image1.Picture.Height;
       keys:=1;

          if (largura <= 226) and (altura <= 184) then
          begin

          DMOS.qr_config.Close;
          DMOS.qr_config.SQL.Clear;
          DMOS.qr_config.SQL.Add('update config set logo = :v1 where id = :v2');
          DMOS.qr_config.ParamByName('v1').AsString:=txt_img.Text;
          DMOS.qr_config.ParamByName('v2').AsInteger:=keys;
          DMOS.qr_config.ExecSQL;
          DMOS.SQLTransaction1.Commit;
          DMOS.query_config.Active:=false;
          DMOS.query_config.Active:=true;
          showmessage('Logo Registrado com Sucesso!');
          t_home.DBImage1.Picture.LoadFromFile(txt_img.Text);
          txt_img.Clear;
          Image1.Picture.Clear;
          end
       else
           begin
           Showmessage('Imagem deve ter as dimensões 226x184!');
           txt_img.Clear;
           Image1.Picture.Clear;
           end;
          end
          else
          begin
                  Showmessage('Formato Inválido de Imagem!');
                  txt_img.Clear;
                  Image1.Picture.Clear;
          end;
       end;

end;

end.

