unit resgistrar_atendente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DbCtrls, MaskEdit, Menus;

type

  { Tt_registrar_atendente }

  Tt_registrar_atendente = class(TForm)
    btn_salvar: TButton;
    btn_limpar: TButton;
    cb_uf: TComboBox;
    data_entrada: TDateTimePicker;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    txt_cep: TMaskEdit;
    txt_tel: TMaskEdit;
    txt_cpf: TMaskEdit;
    txt_rg: TMaskEdit;
    txt_email: TEdit;
    Label13: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    txt_cidade: TEdit;
    Label7: TLabel;
    txt_bairro: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    txt_endereco: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    txt_nome: TEdit;
    procedure btn_limparClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    //function Mascara(edt: String;str:String):string;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_registrar_atendente: Tt_registrar_atendente;

implementation

{$R *.lfm}

{ Tt_registrar_atendente }
uses dm, criar_login_atendente;

procedure Tt_registrar_atendente.FormCreate(Sender: TObject);
begin

  DMC.qr_atendente.Active:=true;

  cb_uf.Items.Clear;

  cb_uf.Items.Add('AC');
  cb_uf.Items.Add('AL');
  cb_uf.Items.Add('AM');
  cb_uf.Items.Add('AP');
  cb_uf.Items.Add('BA');
  cb_uf.Items.Add('CE');
  cb_uf.Items.Add('DF');
  cb_uf.Items.Add('ES');
  cb_uf.Items.Add('GO');
  cb_uf.Items.Add('MA');
  cb_uf.Items.Add('MG');
  cb_uf.Items.Add('MS');
  cb_uf.Items.Add('MT');
  cb_uf.Items.Add('PA');
  cb_uf.Items.Add('PB');
  cb_uf.Items.Add('PE');
  cb_uf.Items.Add('PI');
  cb_uf.Items.Add('PR');
  cb_uf.Items.Add('RJ');
  cb_uf.Items.Add('RN');
  cb_uf.Items.Add('RO');
  cb_uf.Items.Add('RR');
  cb_uf.Items.Add('RS');
  cb_uf.Items.Add('SC');
  cb_uf.Items.Add('SE');
  cb_uf.Items.Add('SP');
  cb_uf.Items.Add('TO');

end;

procedure Tt_registrar_atendente.FormShow(Sender: TObject);
begin

  data_entrada.Date:=now;
  //DMC.qr_atendente.Active:=true;

  txt_rg.EditMask := '99.999.999-9;1;_';
  txt_cpf.EditMask := '999.999.999-99;1;_';
  txt_tel.EditMask := '99-999999999;1;_';
  txt_cep.EditMask := '99999-999;1;_';

end;

procedure Tt_registrar_atendente.MenuItem1Click(Sender: TObject);
begin
  t_login_atendente.ShowModal;
end;

procedure Tt_registrar_atendente.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMC.qr_atendente.Active:=false;
end;

procedure Tt_registrar_atendente.btn_limparClick(Sender: TObject);
begin
  txt_nome.Clear;
  txt_rg.Clear;
  txt_cpf.Clear;
  txt_tel.Clear;
  txt_endereco.Clear;
  txt_email.Clear;
  txt_bairro.Clear;
  txt_cep.Clear;
  txt_cidade.Clear;

end;

procedure Tt_registrar_atendente.btn_salvarClick(Sender: TObject);
var
  cargo:String;
begin

  cargo := 'Atendente';

  if txt_nome.Text = '' then
     begin
          showmessage('Campo Nome Obrigatório.');
     end;

  if txt_rg.Text = '' then
     begin
          showmessage('Campo RG Obrigatório.');
     end;

  if txt_cpf.Text = '' then
     begin
          showmessage('Campo CPF Obrigatório.');
     end;

  if txt_cep.Text = '' then
     begin
          showmessage('Campo CEP Obrigatório.');
     end;

  if txt_tel.Text = '' then
     begin
          showmessage('Campo Telefone Obrigatório.');
     end;

  if txt_email.Text = '' then
     begin
          showmessage('Campo E-mail Obrigatório.');
     end;

  if txt_endereco.Text = '' then
     begin
          showmessage('Campo Endereço Obrigatório.');
     end;

  if txt_bairro.Text = '' then
     begin
          showmessage('Campo Bairro Obrigatório.');
     end;

  if txt_cidade.Text = '' then
     begin
          showmessage('Campo Cidade Obrigatório.');
     end;

  if cb_uf.Text = '' then
     begin
          showmessage('Selecione uma UF');
     end;

  if (txt_nome.Text <> '') and (txt_rg.Text <> '') and (txt_cpf.Text <> '') and (txt_tel.Text <> '') and (txt_email.Text <> '') and (txt_endereco.Text <> '') and (txt_bairro.Text <> '') and (txt_cidade.Text <> '') and (cb_uf.Text <> '') then
  begin

  DMC.qr_atendente.Close;
  DMC.qr_atendente.SQL.Clear;
  DMC.qr_atendente.SQL.Add('insert into atendente (nome, rg, cpf, tel, email, endereco, bairro, cidade, uf, data_entrada, cargo, cep) values (:v1, :v2, :v3, :v4, :v5, :v6, :v7, :v8, :v9, :v10, :v11, :v12)');
  DMC.qr_atendente.ParamByName('v1').AsString:=txt_nome.Text;
  DMC.qr_atendente.ParamByName('v2').AsString:=txt_rg.Text;
  DMC.qr_atendente.ParamByName('v3').AsString:=txt_cpf.Text;
  DMC.qr_atendente.ParamByName('v4').AsString:=txt_tel.Text;
  DMC.qr_atendente.ParamByName('v5').AsString:=txt_email.Text;
  DMC.qr_atendente.ParamByName('v6').AsString:=txt_endereco.Text;
  DMC.qr_atendente.ParamByName('v7').AsString:=txt_bairro.Text;
  DMC.qr_atendente.ParamByName('v8').AsString:=txt_cidade.Text;
  DMC.qr_atendente.ParamByName('v9').AsString:=cb_uf.Text;
  DMC.qr_atendente.ParamByName('v10').Value:=data_entrada.Date;
  DMC.qr_atendente.ParamByName('v11').AsString:=cargo;
  DMC.qr_atendente.ParamByName('v12').AsString:=txt_cep.Text;
  DMC.qr_atendente.ExecSQL;
  //DMC.qr_atendente.Refresh;
  DMC.SQLTransaction1.Commit;
  //DMC.qr_atendente.Active:=true;

  showmessage('Atendente Registrado com Sucesso.');

  txt_nome.Clear;
  txt_rg.Clear;
  txt_cpf.Clear;
  txt_tel.Clear;
  txt_endereco.Clear;
  txt_email.Clear;
  txt_bairro.Clear;
  txt_cep.Clear;
  txt_cidade.Clear;

  end;

end;

end.

