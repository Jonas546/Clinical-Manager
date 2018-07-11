unit registrar_medico;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, Menus, StdCtrls, MaskEdit;

type

  { Tt_registrar_medico }

  Tt_registrar_medico = class(TForm)
    btn_registrar: TButton;
    btn_limpar: TButton;
    cb_especial: TComboBox;
    cb_uf: TComboBox;
    cb_entrada: TComboBox;
    cb_saida: TComboBox;
    date_medico: TDateTimePicker;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    txt_cidade: TEdit;
    label_c: TLabel;
    txt_bairro: TEdit;
    Label10: TLabel;
    Label9: TLabel;
    txt_cep: TMaskEdit;
    txt_endereco: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txt_crm: TMaskEdit;
    txt_email: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txt_tel: TMaskEdit;
    txt_cpf: TMaskEdit;
    txt_rg: TMaskEdit;
    txt_nome: TEdit;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    procedure btn_limparClick(Sender: TObject);
    procedure btn_registrarClick(Sender: TObject);
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
  t_registrar_medico: Tt_registrar_medico;

implementation

{$R *.lfm}

{ Tt_registrar_medico }
uses dm, criar_login_medico;

procedure Tt_registrar_medico.FormCreate(Sender: TObject);
begin

  DMC.qr_medico.Active:=true;

  cb_especial.Items.Clear;

  cb_especial.Items.Add('Oftalmologista');
  cb_especial.Items.Add('Dentista');
  cb_especial.Items.Add('Cardiologista');
  cb_especial.Items.Add('Podólogo');
  cb_especial.Items.Add('Infectologista');

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

    cb_entrada.Items.Clear;

    cb_entrada.Items.Add('08:00');
    cb_entrada.Items.Add('08:20');
    cb_entrada.Items.Add('08:40');
    cb_entrada.Items.Add('09:00');
    cb_entrada.Items.Add('09:20');
    cb_entrada.Items.Add('09:40');
    cb_entrada.Items.Add('10:00');
    cb_entrada.Items.Add('10:20');
    cb_entrada.Items.Add('10:40');
    cb_entrada.Items.Add('11:00');
    cb_entrada.Items.Add('11:20');
    cb_entrada.Items.Add('11:40');
    cb_entrada.Items.Add('12:00');
    cb_entrada.Items.Add('12:20');
    cb_entrada.Items.Add('12:40');
    cb_entrada.Items.Add('13:00');
    cb_entrada.Items.Add('13:20');
    cb_entrada.Items.Add('13:40');
    cb_entrada.Items.Add('14:00');
    cb_entrada.Items.Add('14:20');
    cb_entrada.Items.Add('14:40');
    cb_entrada.Items.Add('15:00');
    cb_entrada.Items.Add('15:20');
    cb_entrada.Items.Add('15:40');
    cb_entrada.Items.Add('16:00');
    cb_entrada.Items.Add('16:20');
    cb_entrada.Items.Add('16:40');
    cb_entrada.Items.Add('17:00');
    cb_entrada.Items.Add('17:20');
    cb_entrada.Items.Add('17:40');

    cb_saida.Items.Clear;

    cb_saida.Items.Add('08:00');
    cb_saida.Items.Add('08:20');
    cb_saida.Items.Add('08:40');
    cb_saida.Items.Add('09:00');
    cb_saida.Items.Add('09:20');
    cb_saida.Items.Add('09:40');
    cb_saida.Items.Add('10:00');
    cb_saida.Items.Add('10:20');
    cb_saida.Items.Add('10:40');
    cb_saida.Items.Add('11:00');
    cb_saida.Items.Add('11:20');
    cb_saida.Items.Add('11:40');
    cb_saida.Items.Add('12:00');
    cb_saida.Items.Add('12:20');
    cb_saida.Items.Add('12:40');
    cb_saida.Items.Add('13:00');
    cb_saida.Items.Add('13:20');
    cb_saida.Items.Add('13:40');
    cb_saida.Items.Add('14:00');
    cb_saida.Items.Add('14:20');
    cb_saida.Items.Add('14:40');
    cb_saida.Items.Add('15:00');
    cb_saida.Items.Add('15:20');
    cb_saida.Items.Add('15:40');
    cb_saida.Items.Add('16:00');
    cb_saida.Items.Add('16:20');
    cb_saida.Items.Add('16:40');
    cb_saida.Items.Add('17:00');
    cb_saida.Items.Add('17:20');
    cb_saida.Items.Add('17:40');
    cb_saida.Items.Add('18:00');

end;

procedure Tt_registrar_medico.FormShow(Sender: TObject);
begin

  date_medico.Date:=now;

  txt_rg.EditMask := '99.999.999-9;1;_';
  txt_cpf.EditMask := '999.999.999-99;1;_';
  txt_tel.EditMask := '99-999999999;1;_';
  txt_cep.EditMask := '99999-999;1;_';
  txt_crm.EditMask := '9999999/cc;1;_';

end;

procedure Tt_registrar_medico.MenuItem1Click(Sender: TObject);
begin
  t_criar_login_medico.ShowModal;
end;

procedure Tt_registrar_medico.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMC.qr_medico.Active:=false;
end;

procedure Tt_registrar_medico.btn_limparClick(Sender: TObject);
begin

  txt_nome.Clear;
  txt_rg.Clear;
  txt_cpf.Clear;
  txt_tel.Clear;
  txt_crm.Clear;
  txt_email.Clear;
  txt_endereco.Clear;
  txt_cep.Clear;
  txt_bairro.Clear;
  txt_cidade.Clear;
  //txt_data.Clear;

end;

procedure Tt_registrar_medico.btn_registrarClick(Sender: TObject);
begin

  if txt_nome.Text = '' then
     begin
          showmessage('Campo Nome Obrigatório.');
     end;

  if txt_rg.Text = '' then
     begin
          showmessage('Campo Rg Obrigatório.');
     end;

  if txt_cpf.Text = '' then
     begin
          showmessage('Campo CPF Obrigatório.');
     end;

  if txt_tel.Text = '' then
     begin
          showmessage('Campo Telefone Obrigatório.');
     end;

  if cb_especial.Text = '' then
     begin
          showmessage('Selecione uma Especialidade.');
     end;

  if txt_crm.Text = '' then
     begin
          showmessage('Campo CRM Obrigatório.');
     end;

  if txt_email.Text = '' then
     begin
          showmessage('Campo E-mail Obrigatório.');
     end;

  if txt_endereco.Text = '' then
     begin
          showmessage('Campo Endereço Obrigatório.');
     end;

  if txt_cep.Text = '' then
     begin
          showmessage('Campo CEP Obrigatório.');
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
          showmessage('Selecione uma UF.');
     end;

  if cb_entrada.Text = '' then
     begin
          showmessage('Selecione um Horário de Entrada.');
     end;

  if cb_saida.Text = '' then
     begin
          showmessage('Selecione um Horário de Saída.');
     end;

  if (txt_nome.Text <> '') and (txt_rg.Text <> '') and (txt_cpf.Text <> '') and (txt_tel.Text <> '') and (txt_email.Text <> '') and (txt_endereco.Text <> '') and (txt_bairro.Text <> '') and (txt_cidade.Text <> '') and (cb_uf.Text <> '') and (txt_crm.Text <> '') and (cb_entrada.Text <> '') and (cb_saida.Text <> '') then
    begin

    DMC.qr_medico.Close;
    DMC.qr_medico.SQL.Clear;
    DMC.qr_medico.SQL.Add('insert into medico (nome, rg, cpf, tel, email, endereco, bairro, cidade, uf, data_entrada, crm, cep, especialidade, hora_entrada, hora_saida) values (:v1, :v2, :v3, :v4, :v5, :v6, :v7, :v8, :v9, :v10, :v11, :v12, :v13, :v14, :v15)');
    DMC.qr_medico.ParamByName('v1').AsString:=txt_nome.Text;
    DMC.qr_medico.ParamByName('v2').AsString:=txt_rg.Text;
    DMC.qr_medico.ParamByName('v3').AsString:=txt_cpf.Text;
    DMC.qr_medico.ParamByName('v4').AsString:=txt_tel.Text;
    DMC.qr_medico.ParamByName('v5').AsString:=txt_email.Text;
    DMC.qr_medico.ParamByName('v6').AsString:=txt_endereco.Text;
    DMC.qr_medico.ParamByName('v7').AsString:=txt_bairro.Text;
    DMC.qr_medico.ParamByName('v8').AsString:=txt_cidade.Text;
    DMC.qr_medico.ParamByName('v9').AsString:=cb_uf.Text;
    DMC.qr_medico.ParamByName('v10').Value:=date_medico.Date;
    DMC.qr_medico.ParamByName('v11').AsString:=txt_crm.Text;
    DMC.qr_medico.ParamByName('v12').AsString:=txt_cep.Text;
    DMC.qr_medico.ParamByName('v13').AsString:=cb_especial.Text;
    DMC.qr_medico.ParamByName('v14').AsString:=cb_entrada.Text;
    DMC.qr_medico.ParamByName('v15').AsString:=cb_saida.Text;
    DMC.qr_medico.ExecSQL;
    //DMC.qr_atendente.Refresh;
    DMC.SQLTransaction1.Commit;
    DMC.qr_medico_ativo.Active:=true;
    DMC.qr_medico_ativo.Active:=false;
    DMC.qr_medico_ativo.Active:=true;
    DMC.qr_medico_ativo.Active:=false;
    //DMC.qr_atendente.Active:=true;

    showmessage('Médico Registrado com Sucesso.');

    txt_nome.Clear;
    txt_rg.Clear;
    txt_cpf.Clear;
    txt_tel.Clear;
    txt_crm.Clear;
    txt_email.Clear;
    txt_endereco.Clear;
    txt_cep.Clear;
    txt_bairro.Clear;
    txt_cidade.Clear;
    //txt_data.Clear;

    end;

end;

end.

