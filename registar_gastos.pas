unit registar_gastos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls;

type

  { Tt_registrar_gastos }

  Tt_registrar_gastos = class(TForm)
    Button1: TButton;
    data: TDateTimePicker;
    Label4: TLabel;
    txt_valor: TEdit;
    Label3: TLabel;
    txt_qtde: TEdit;
    Label2: TLabel;
    txt_desc: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure dataChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_registrar_gastos: Tt_registrar_gastos;
  data1:String;

implementation

{$R *.lfm}

{ Tt_registrar_gastos }
uses dmo;

procedure Tt_registrar_gastos.FormCreate(Sender: TObject);
begin

  DMOS.qr_despesa.Active:=true;

end;

procedure Tt_registrar_gastos.FormShow(Sender: TObject);
begin
  data.Date:=now;
end;

procedure Tt_registrar_gastos.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMOS.qr_despesa.Active:=false;

  txt_desc.Clear;
  txt_valor.Clear;
  txt_qtde.Clear;

end;

procedure Tt_registrar_gastos.Button1Click(Sender: TObject);
var
  qtde:integer;
begin

  data1:=Datetostr(data.Date);

 if txt_desc.Text = '' then
    begin
      showmessage('Campo Descrição Obrigatório.');
    end;

  if txt_qtde.Text = '' then
    begin
      showmessage('Campo Quantidade Obrigatório.');
    end;

  if txt_valor.Text = '' then
     begin
       showmessage('Campo Valor Obrigatório.');
     end;

  if data.Date = null then
     begin
       showmessage('Selecione uma Data.');
     end;

  if (txt_valor.Text <> '') and (txt_desc.Text <> '') and (txt_qtde.Text <> '') and (data.Date <> null) then
     begin

       qtde := strtoint(txt_qtde.Text);

       DMOS.qr_despesa.Close;
       DMOS.qr_despesa.SQL.Clear;
       DMOS.qr_despesa.SQL.Add('insert into despesa (desc, valor, qtde, data)');
       DMOS.qr_despesa.SQL.Add('values (:v1, :v2, :v3, :v4)');
       DMOS.qr_despesa.ParamByName('v1').AsString:=txt_desc.Text;
       DMOS.qr_despesa.ParamByName('v2').Value:=txt_valor.Text;
       DMOS.qr_despesa.ParamByName('v3').AsInteger:=qtde;
       DMOS.qr_despesa.ParamByName('v4').Value:=data.Date;
       DMOS.qr_despesa.ExecSQL;
       DMOS.SQLTransaction1.Commit;

       txt_desc.Clear;
       txt_valor.Clear;
       txt_qtde.Clear;

       showmessage('Registro feito com Sucesso.');

     end;

end;

procedure Tt_registrar_gastos.dataChange(Sender: TObject);
begin
  data.Date:=data.Date;
end;

end.

