unit prodedimento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { Tt_procedimento }

  Tt_procedimento = class(TForm)
    Button1: TButton;
    txt_valor: TEdit;
    txt_descricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_procedimento: Tt_procedimento;
  esp:String;

implementation

{$R *.lfm}

{ Tt_procedimento }
uses dm, dentista_gerenciar_proc;

procedure Tt_procedimento.FormShow(Sender: TObject);
begin

   //DMC.qr_dentista_proc.Active:=true;

end;

procedure Tt_procedimento.MenuItem1Click(Sender: TObject);
begin
  t_dentista_proc.ShowModal;
end;

procedure Tt_procedimento.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

   DMC.qr_list_proc.Active:=false;

end;

procedure Tt_procedimento.FormCreate(Sender: TObject);
begin
  DMC.qr_list_proc.Active:=true;
end;

procedure Tt_procedimento.Button1Click(Sender: TObject);
begin

   esp := 'Dentista';

   if txt_descricao.Text = '' then
      begin
           showmessage('Campo Descrição Obrigatório.');
      end;

   if txt_valor.Text = '' then
      begin
           showmessage('Campo Valor Obrigatório.');
      end;

   if (txt_descricao.Text <> '') and (txt_valor.Text <> '') then
      begin

           DMC.qr_list_proc.Open;
           DMC.qr_list_proc.SQL.Clear;
           DMC.qr_list_proc.SQL.Add('insert into lista_procedimento (proc, especialidade, valor)');
           DMC.qr_list_proc.SQL.Add('values');
           DMC.qr_list_proc.SQL.Add('(:v1,:v2,:v3)');
           DMC.qr_list_proc.ParamByName('v1').AsString:=txt_descricao.Text;
           DMC.qr_list_proc.ParamByName('v2').AsString:=esp;
           DMC.qr_list_proc.ParamByName('v3').Value:=txt_valor.Text;
           DMC.qr_list_proc.ExecSQL;
           DMC.SQLTransaction1.Commit;

           txt_descricao.Clear;
           txt_valor.Clear;

           showmessage('Procedimento Registrado com Sucesso');

      end;

end;

end.

