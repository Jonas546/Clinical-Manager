unit registrar_paciente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls, MaskEdit, DbCtrls, DBGrids, DateUtils;

type

  { Tt_registrar_paciente }

  Tt_registrar_paciente = class(TForm)
    btn_cadastrar: TButton;
    btn_limpar: TButton;
    cb_uf: TComboBox;
    cb_civil: TComboBox;
    cb_sexo: TComboBox;
    date_validade: TDateTimePicker;
    date_nascimento: TDateTimePicker;
    date_emissao: TDateTimePicker;
    cb_empresa: TDBLookupComboBox;
    cb_convenio: TDBLookupComboBox;
    cb_plano: TDBLookupComboBox;
    Label24: TLabel;
    Label25: TLabel;
    txt_cpf_r: TMaskEdit;
    txt_responsavel: TEdit;
    Label23: TLabel;
    txt_titular: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    txt_carteira: TEdit;
    Label20: TLabel;
    Label19: TLabel;
    txt_profissao: TEdit;
    Label18: TLabel;
    txt_local_nasc: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    lb_sexo: TLabel;
    txt_cel: TMaskEdit;
    txt_emissor: TEdit;
    Label13: TLabel;
    txt_cep: TMaskEdit;
    txt_tel: TMaskEdit;
    txt_cpf: TMaskEdit;
    txt_rg: TMaskEdit;
    txt_email: TEdit;
    txt_cidade: TEdit;
    txt_bairro: TEdit;
    txt_nome: TEdit;
    txt_endereco: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure btn_cadastrarClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure cb_anoChange(Sender: TObject);
    procedure cb_convenioChange(Sender: TObject);
    procedure cb_diaChange(Sender: TObject);
    procedure cb_mesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_registrar_paciente: Tt_registrar_paciente;

implementation

{$R *.lfm}

{ Tt_registrar_paciente }
uses dm;

procedure CarregaPlano(cod:integer);
begin

  DMC.qr_conv_plano.Close;
  DMC.qr_conv_plano.ParamByName('v1').AsInteger:=cod;
  DMC.qr_conv_plano.Open;

end;

procedure Tt_registrar_paciente.btn_limparClick(Sender: TObject);
begin

  txt_nome.Clear;
  txt_rg.Clear;
  txt_cpf.Clear;
  txt_tel.Clear;
  txt_email.Clear;
  txt_endereco.Clear;
  txt_cep.Clear;
  txt_bairro.Clear;
  txt_cidade.Clear;
  //txt_data.Clear;
  txt_emissor.Clear;
  txt_cel.Clear;
  txt_local_nasc.Clear;
  txt_profissao.Clear;
  txt_carteira.Clear;
  txt_titular.Clear;
  txt_responsavel.Clear;
  txt_cpf_r.Clear;

end;

procedure Tt_registrar_paciente.cb_anoChange(Sender: TObject);
begin
  //txt_data.Text := cb_dia.Text+'/'+cb_mes.Text+'/'+cb_ano.Text;
end;

procedure Tt_registrar_paciente.cb_convenioChange(Sender: TObject);
var
  aux:integer;
begin
  aux:=Integer(cb_convenio.KeyValue);
  CarregaPlano(aux);
end;

procedure Tt_registrar_paciente.cb_diaChange(Sender: TObject);
begin
  //txt_data.Text := cb_dia.Text+'/'+cb_mes.Text+'/'+cb_ano.Text;
end;

procedure Tt_registrar_paciente.cb_mesChange(Sender: TObject);
var
  mes:String;
begin

end;

procedure Tt_registrar_paciente.btn_cadastrarClick(Sender: TObject);
var
  registro: String;
begin

  registro := DateTimetoStr(Now);

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

  if cb_convenio.Text = '' then
     begin
       showmessage('Selecione um Convênio.');
     end;

  if txt_emissor.Text = '' then
     begin
       showmessage('Campo Emissor Obrigatório.');
     end;

  if cb_sexo.Text = '' then
     begin
       showmessage('Selecione um Gênero Sexual.');
     end;

  if txt_local_nasc.Text = '' then
     begin
       showmessage('Campo Local de Nascimento Obrigatório.');
     end;

  if txt_profissao.Text = '' then
     begin
       showmessage('Campo Profissão Obrigatório.');
     end;

  if cb_empresa.Text = '' then
     begin
       showmessage('Selecione uma Empresa.');
     end;

  if txt_carteira.Text = '' then
     begin
       showmessage('Campo Tipo Carteira Obrigatório.');
     end;

  if txt_titular.Text = '' then
     begin
       showmessage('Campo Titular Obrigatório.');
     end;

  if txt_responsavel.Text = '' then
     begin
       showmessage('Campo Responsável Obrigatório.');
     end;

  if cb_civil.Text = '' then
     begin
       showmessage('Selecione um Estado Civil.');
     end;

  if cb_plano.Text = '' then
     begin
       showmessage('Selecione um Plano.');
     end;

  if (txt_nome.Text <> '') and (txt_rg.Text <> '') and (txt_cpf.Text <> '') and (txt_tel.Text <> '') and (txt_endereco.Text <> '') and (txt_cep.Text <> '') and (txt_bairro.Text <> '') and (txt_cidade.Text <> '') and (cb_uf.Text <> '') and (cb_convenio.Text <> '') and (txt_emissor.Text <> '') and (cb_sexo.Text <> '') and (txt_local_nasc.Text <> '') and (txt_profissao.Text <> '') and (cb_empresa.Text <> '') and (txt_carteira.Text <> '') and (txt_titular.Text <> '') and (txt_responsavel.Text <> '') and (cb_civil.Text <> '') and (cb_plano.Text <> '') then
     begin

          DMC.qr_paciente.Close;
          DMC.qr_paciente.SQL.Clear;
          DMC.qr_paciente.SQL.Add('insert into paciente (nome, rg, cpf, tel, email, endereco, cep, bairro, cidade, uf, data_nascimento, convenio, data_registro, emissor, data_emissao, sexo, cel, local_nascimento, profissao, trabalho, tipo_carteira, validade, titular, responsavel, cpf_responsavel, estado_civil, plano) values (:v1, :v2, :v3, :v4, :v5, :v6, :v7, :v8, :v9, :v10, :v11, :v12, :v13, :v14, :v15, :v16, :v17, :v18, :v19, :v20, :v21, :v22, :v23, :v24, :v25, :v26, :v27)');
          DMC.qr_paciente.ParamByName('v1').AsString:=txt_nome.Text;
          DMC.qr_paciente.ParamByName('v2').AsString:=txt_rg.Text;
          DMC.qr_paciente.ParamByName('v3').AsString:=txt_cpf.Text;
          DMC.qr_paciente.ParamByName('v4').AsString:=txt_tel.Text;
          DMC.qr_paciente.ParamByName('v5').AsString:=txt_email.Text;
          DMC.qr_paciente.ParamByName('v6').AsString:=txt_endereco.Text;
          DMC.qr_paciente.ParamByName('v7').AsString:=txt_cep.Text;
          DMC.qr_paciente.ParamByName('v8').AsString:=txt_bairro.Text;
          DMC.qr_paciente.ParamByName('v9').AsString:=txt_cidade.Text;
          DMC.qr_paciente.ParamByName('v10').AsString:=cb_uf.Text;
          DMC.qr_paciente.ParamByName('v11').Value:=date_nascimento.Date;
          DMC.qr_paciente.ParamByName('v12').AsString:=cb_convenio.Text;
          DMC.qr_paciente.ParamByName('v13').Value:=registro;
          DMC.qr_paciente.ParamByName('v14').AsString:=txt_emissor.Text;
          DMC.qr_paciente.ParamByName('v15').Value:=date_emissao.Date;
          DMC.qr_paciente.ParamByName('v16').AsString:=cb_sexo.Text;
          DMC.qr_paciente.ParamByName('v17').AsString:=txt_cel.Text;
          DMC.qr_paciente.ParamByName('v18').AsString:=txt_local_nasc.Text;
          DMC.qr_paciente.ParamByName('v19').AsString:=txt_profissao.Text;
          DMC.qr_paciente.ParamByName('v20').AsString:=cb_empresa.Text;
          DMC.qr_paciente.ParamByName('v21').AsString:=txt_carteira.Text;
          DMC.qr_paciente.ParamByName('v22').Value:=date_validade.Date;
          DMC.qr_paciente.ParamByName('v23').AsString:=txt_titular.Text;
          DMC.qr_paciente.ParamByName('v24').AsString:=txt_responsavel.Text;
          DMC.qr_paciente.ParamByName('v25').AsString:=txt_cpf_r.Text;
          DMC.qr_paciente.ParamByName('v26').AsString:=cb_civil.Text;
          DMC.qr_paciente.ParamByName('v27').AsString:=cb_plano.Text;

          DMC.qr_paciente.ExecSQL;
          DMC.SQLTransaction1.Commit;

          showmessage('Paciente Cadastrado com Sucesso.');

          txt_nome.Clear;
          txt_rg.Clear;
          txt_cpf.Clear;
          txt_tel.Clear;
          txt_email.Clear;
          txt_endereco.Clear;
          txt_cep.Clear;
          txt_bairro.Clear;
          txt_cidade.Clear;
          //txt_data.Clear;
          txt_emissor.Clear;
          txt_cel.Clear;
          txt_local_nasc.Clear;
          txt_profissao.Clear;
          txt_carteira.Clear;
          txt_titular.Clear;
          txt_responsavel.Clear;
          txt_cpf_r.Clear;

     end;

end;

procedure Tt_registrar_paciente.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMC.qr_paciente.Active:=false;
  DMC.qry_empresa.Active:=false;
  DMC.qry_convenio.Active:=false;
  DMC.qr_conv_plano.Active:=false;
end;

procedure Tt_registrar_paciente.FormCreate(Sender: TObject);
begin
  DMC.qr_paciente.Active:=true;

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

      cb_civil.Items.Clear;

      cb_civil.Items.Add('Solteiro(a)');
      cb_civil.Items.Add('Casado(a)');
      cb_civil.Items.Add('Divorciado(a)');
      cb_civil.Items.Add('Viuvo(a)');

      cb_sexo.Items.Clear;

      cb_sexo.Items.Add('M');
      cb_sexo.Items.Add('F');

end;

procedure Tt_registrar_paciente.FormShow(Sender: TObject);
begin

  DMC.qry_empresa.Active:=true;
  DMC.qry_convenio.Active:=true;
  DMC.qr_conv_plano.Active:=true;

  cb_empresa.Items.Add('Nenhum');
  cb_convenio.Items.Add('Nenhum');

  txt_rg.EditMask := '99.999.999-9;1;_';
  txt_cpf.EditMask := '999.999.999-99;1;_';
  txt_tel.EditMask := '99-99999999;1;_';
  txt_cel.EditMask := '99-999999999;1;_';
  txt_cep.EditMask := '99999-999;1;_';
  txt_cpf_r.EditMask := '999.999.999-99;1;_';

end;

end.

