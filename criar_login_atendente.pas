unit criar_login_atendente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls;

type

  { Tlogin_atendente }

  Tlogin_atendente = class(TForm)
    btn_registrar: TButton;
    btn_atualizar: TButton;
    db_cb_nome: TDBLookupComboBox;
    Label3: TLabel;
    txt_senha: TEdit;
    Label2: TLabel;
    txt_login: TEdit;
    txt_id: TEdit;
    Label1: TLabel;
    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_registrarClick(Sender: TObject);
    procedure db_cb_nomeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_login_atendente: Tlogin_atendente;

implementation

{$R *.lfm}

{ Tlogin_atendente }
uses dm;

procedure Tlogin_atendente.db_cb_nomeChange(Sender: TObject);
begin
  txt_id.Text:=inttostr(Integer(db_cb_nome.KeyValue));
end;

procedure Tlogin_atendente.btn_registrarClick(Sender: TObject);
var
  pe, key:integer;
begin

  pe := 1;

  if txt_id.Text <> '' then
  begin
       key := strtoint(txt_id.Text);
  end;

  if txt_id.Text = '' then
     begin
          showmessage('Selecione um Atendende.')
     end;

  if txt_login.Text = '' then
     begin
          showmessage('Campo Login Obrigatório.');
     end;

  if txt_senha.Text = '' then
     begin
          showmessage('Campo Senha Obrigatório.');
     end;

  if db_cb_nome.Text = '' then
     begin
          showmessage('Selecione um Atendente.');
     end;

  if (txt_login.Text <> '') and (txt_senha.Text <> '') and (db_cb_nome.Text <> '') and (txt_id.Text <> '') then
  begin

  DMC.qr_v_login.Close;
  DMC.qr_v_login.SQL.Clear;
  DMC.qr_v_login.SQL.Add('select * from login where cod_func = :k1');
  DMC.qr_v_login.ParamByName('k1').AsInteger:=key;
  DMC.qr_v_login.Open;

  if DMC.qr_v_login.RecordCount < 1 then
  begin

  DMC.qr_r_login.Close;
  DMC.qr_r_login.SQL.Clear;
  DMC.qr_r_login.SQL.Add('insert into login (cod_func, login, senha, permissao) values (:v1, :v2, :v3, :v4)');
  DMC.qr_r_login.ParamByName('v1').AsInteger:=strtoint(txt_id.Text);
  DMC.qr_r_login.ParamByName('v2').AsString:=txt_login.Text;
  DMC.qr_r_login.ParamByName('v3').AsString:=txt_senha.Text;
  DMC.qr_r_login.ParamByName('v4').AsInteger:=pe;
  DMC.qr_r_login.ExecSQL;
  DMC.SQLTransaction1.Commit;
  DMC.qr_v_login.Active:=false;
  DMC.qr_v_login.Active:=true;

  txt_login.Clear;
  txt_senha.Clear;

  showmessage('Login Registrado com Sucesso!');

  end
  else
  begin
       showmessage('Usuário já possui Login e Senha');
  end;

end;

end;

procedure Tlogin_atendente.btn_atualizarClick(Sender: TObject);
var
  pe, key:integer;
begin

  pe := 1;

  if txt_id.Text <> '' then
     begin
          key := strtoint(txt_id.Text);
     end;

  if txt_login.Text = '' then
     begin
          showmessage('Campo Login Obrigatório.');
     end;

  if txt_senha.Text = '' then
     begin
          showmessage('Campo Senha Obrigatório.');
     end;

  if db_cb_nome.Text = '' then
     begin
          showmessage('Selecione um atendente.');
     end;

  if (txt_login.Text <> '') and (txt_senha.Text <> '') and (db_cb_nome.Text <> '') and (txt_id.Text <> '') then
  begin

  DMC.qr_v_login.Close;
  DMC.qr_v_login.SQL.Clear;
  DMC.qr_v_login.SQL.Add('select * from login where cod_func = :k1');
  DMC.qr_v_login.ParamByName('k1').AsInteger:=key;
  DMC.qr_v_login.Open;

  if DMC.qr_v_login.RecordCount > 0 then
  begin

  DMC.qr_r_login.Close;
  DMC.qr_r_login.SQL.Clear;
  DMC.qr_r_login.SQL.Add('update login set login = :v2, senha = :v3 where cod_func = :v1');
  DMC.qr_r_login.ParamByName('v1').AsInteger:=strtoint(txt_id.Text);
  DMC.qr_r_login.ParamByName('v2').AsString:=txt_login.Text;
  DMC.qr_r_login.ParamByName('v3').AsString:=txt_senha.Text;
  DMC.qr_r_login.ExecSQL;
  DMC.SQLTransaction1.Commit;
  DMC.qr_v_login.Active:=false;
  DMC.qr_v_login.Active:=true;

  txt_login.Clear;
  txt_senha.Clear;

  showmessage('Login Atualizado com Sucesso!');

  end
  else
  begin
       showmessage('Usuário sem Login e Senha. Crie um Login e uma Senha para o Usuário.');
  end;

  end;

end;

procedure Tlogin_atendente.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMC.qr_v_login.Active:=false;
  DMC.qr_r_login.Active:=false;
  DMC.query_atendente.Active:=false;
end;

procedure Tlogin_atendente.FormCreate(Sender: TObject);
begin
  DMC.qr_v_login.Active:=true;
  DMC.qr_r_login.Active:=true;
  DMC.query_atendente.Active:=true;
end;

procedure Tlogin_atendente.FormShow(Sender: TObject);
begin
end;

end.

