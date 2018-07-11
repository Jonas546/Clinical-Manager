unit criar_login_medico;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls;

type

  { Tcriar_login_medico }

  Tcriar_login_medico = class(TForm)
    btn_registrar: TButton;
    btn_atualizar: TButton;
    cb_medico: TDBLookupComboBox;
    db_txt_id: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    txt_login: TEdit;
    txt_senha: TEdit;
    Label1: TLabel;
    procedure btn_atualizarClick(Sender: TObject);
    procedure btn_registrarClick(Sender: TObject);
    procedure cb_medicoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_criar_login_medico: Tcriar_login_medico;
  esp:String;

implementation

{$R *.lfm}

{ Tcriar_login_medico }
uses dm;

procedure Tcriar_login_medico.FormCreate(Sender: TObject);
begin
     DMC.qr_medico_ativo.Active:=true;
     DMC.qr_r_login.Active:=true;
     DMC.qr_v_login.Active:=true;
end;

procedure Tcriar_login_medico.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMC.qr_medico_ativo.Active:=false;
  DMC.qr_r_login.Active:=false;
  DMC.qr_v_login.Active:=false;
end;

procedure Tcriar_login_medico.cb_medicoChange(Sender: TObject);
begin
  db_txt_id.Text:=inttostr(Integer(cb_medico.KeyValue));
end;

procedure Tcriar_login_medico.btn_registrarClick(Sender: TObject);
var
  pe, key:integer;
begin

  if db_txt_id.Text <> '' then
     begin
          key := strtoint(db_txt_id.Text);
     end;

  if txt_login.Text = '' then
     begin
          showmessage('Campo Login Obrigatório.');
     end;

  if txt_senha.Text = '' then
     begin
          showmessage('Campo Senha Obrigatório.');
     end;

  if cb_medico.Text = '' then
     begin
          showmessage('Selecione um Médico.');
     end;

  DMC.qr_verifica_medico.Close;
  DMC.qr_verifica_medico.SQL.Clear;
  DMC.qr_verifica_medico.SQL.Add('select especialidade from medico where nome = :v1');
  DMC.qr_verifica_medico.ParamByName('v1').AsString:=cb_medico.Text;
  DMC.qr_verifica_medico.Open;

  if DMC.qr_verifica_medico.RecordCount > 0 then
     begin
          esp:=DMC.qr_verifica_medico.FieldByName('especialidade').AsString;
     end;

  case esp of

  'Podólogo' : pe := 7;
  'Dentista' : pe := 2;
  'Oftalmologista' : pe := 3;
  'Infectologista' : pe := 5;
  'Cardiologista'  : pe := 6;

  end;


  if (txt_login.Text <> '') and (txt_senha.Text <> '') and (cb_medico.Text <> '') then
  begin

  DMC.qr_v_login.Close;
  DMC.qr_v_login.SQL.Clear;
  DMC.qr_v_login.SQL.Add('select * from login where cod_medico = :k1');
  DMC.qr_v_login.ParamByName('k1').AsInteger:=key;
  DMC.qr_v_login.Open;

  if DMC.qr_v_login.RecordCount < 1 then
  begin

  DMC.qr_r_login.Close;
  DMC.qr_r_login.SQL.Clear;
  DMC.qr_r_login.SQL.Add('insert into login (cod_medico, login, senha, permissao) values (:v1, :v2, :v3, :v4)');
  DMC.qr_r_login.ParamByName('v1').AsInteger:=strtoint(db_txt_id.Text);
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

procedure Tcriar_login_medico.btn_atualizarClick(Sender: TObject);
var
  pe, key:integer;
begin

  pe := 2;

  if db_txt_id.Text <> '' then
   begin
        key := strtoint(db_txt_id.Text);
   end;

  if txt_login.Text = '' then
     begin
          showmessage('Campo Login Obrigatório.');
     end;

  if txt_senha.Text = '' then
     begin
          showmessage('Campo Senha Obrigatório.');
     end;

  if cb_medico.Text = '' then
     begin
          showmessage('Selecione um Médico.');
     end;

  if (txt_login.Text <> '') and (txt_senha.Text <> '') and (cb_medico.Text <> '') then
  begin

  DMC.qr_v_login.Close;
  DMC.qr_v_login.SQL.Clear;
  DMC.qr_v_login.SQL.Add('select * from login where cod_medico = :k1');
  DMC.qr_v_login.ParamByName('k1').AsInteger:=key;
  DMC.qr_v_login.Open;

  if DMC.qr_v_login.RecordCount > 0 then
  begin

  DMC.qr_r_login.Close;
  DMC.qr_r_login.SQL.Clear;
  DMC.qr_r_login.SQL.Add('update login set login = :v2, senha = :v3 where cod_medico = :v1');
  DMC.qr_r_login.ParamByName('v1').AsInteger:=strtoint(db_txt_id.Text);
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

end.

