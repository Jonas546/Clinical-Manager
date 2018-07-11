unit consultas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DbCtrls;

type

  { Tt_consultas }

  Tt_consultas = class(TForm)
    btn_confirmar: TButton;
    btn_desmarcar: TButton;
    btn_comparecer: TButton;
    cb_confirmar: TComboBox;
    cb_comparecer: TComboBox;
    cb_parcelas: TComboBox;
    cb_meio: TComboBox;
    db_txt_plano: TDBEdit;
    db_txt_email: TDBEdit;
    db_txt_cel: TDBEdit;
    db_txt_tel: TDBEdit;
    db_status: TDBEdit;
    DBNavigator1: TDBNavigator;
    db_txt_atendente: TDBEdit;
    db_txt_crm: TDBEdit;
    db_txt_especialidade: TDBEdit;
    db_txt_medico: TDBEdit;
    db_txt_hora: TDBEdit;
    db_txt_data: TDBEdit;
    db_txt_guia: TDBEdit;
    db_txt_validade: TDBEdit;
    db_txt_convenio: TDBEdit;
    db_txt_cpf: TDBEdit;
    db_txt_rg: TDBEdit;
    db_txt_paciente: TDBEdit;
    db_txt_id_paciente: TDBEdit;
    DBGrid1: TDBGrid;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    GroupBox5: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    txt_valor: TEdit;
    Label15: TLabel;
    txt_cartao: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure btn_comparecerClick(Sender: TObject);
    procedure btn_confirmarClick(Sender: TObject);
    procedure btn_desmarcarClick(Sender: TObject);
    procedure cb_meioChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_consultas: Tt_consultas;

implementation

{$R *.lfm}

{ Tt_consultas }
uses dm;

procedure Tt_consultas.Label5Click(Sender: TObject);
begin

end;

procedure Tt_consultas.FormCreate(Sender: TObject);
begin

  DMC.qry_consulta.Active:=true;

  cb_comparecer.Items.Clear;

  cb_comparecer.Items.Add('S');
  cb_comparecer.Items.Add('N');

  cb_confirmar.Items.Clear;

  cb_confirmar.Items.Add('S');
  cb_confirmar.Items.Add('N');

  cb_parcelas.Items.Clear;

  cb_parcelas.Items.Add('1');
  cb_parcelas.Items.Add('2');
  cb_parcelas.Items.Add('3');
  cb_parcelas.Items.Add('4');
  cb_parcelas.Items.Add('5');
  cb_parcelas.Items.Add('6');
  cb_parcelas.Items.Add('7');
  cb_parcelas.Items.Add('8');
  cb_parcelas.Items.Add('9');
  cb_parcelas.Items.Add('10');
  cb_parcelas.Items.Add('11');
  cb_parcelas.Items.Add('12');

  cb_meio.Items.Clear;

  cb_meio.Items.Add('Dinheiro');
  cb_meio.Items.Add('Convênio');
  cb_meio.Items.Add('Débito');
  cb_meio.Items.Add('Crédito');

  txt_cartao.Enabled:=false;
  cb_parcelas.Enabled:=false;

end;

procedure Tt_consultas.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin

  DMC.query_consultas.Active:=false;
  DMC.qry_consulta.Active:=false;

end;

procedure Tt_consultas.btn_confirmarClick(Sender: TObject);
var
  a_guia:integer;
  aux:String;
begin

  a_guia := strtoint(db_txt_guia.Text);

  if cb_confirmar.Text = '' then
     begin
          showmessage('Selecione S para Sim ou N para Não em Confirmar.');
     end
  else
      begin

           if cb_confirmar.Text = 'S' then
              begin

                   DMC.qry_consulta.Close;
                   DMC.qry_consulta.SQL.Clear;
                   DMC.qry_consulta.SQL.Add('update consulta set confirmar = :v1 where guia = :v2');
                   DMC.qry_consulta.ParamByName('v1').AsString:=cb_confirmar.Text;
                   DMC.qry_consulta.ParamByName('v2').AsInteger:=a_guia;
                   DMC.qry_consulta.ExecSQL;
                   DMC.SQLTransaction1.Commit;
                   DMC.query_consultas.Active:=false;
                   DMC.query_consultas.Active:=true;

                   showmessage('Paciente Confirmou Consulta');

              end;

           if cb_confirmar.Text = 'N' then
              begin

                   aux := 'Fechado';

                   DMC.qry_consulta.Close;
                   DMC.qry_consulta.SQL.Clear;
                   DMC.qry_consulta.SQL.Add('update consulta set confirmar = :v1, status = :v3 where guia = :v2');
                   DMC.qry_consulta.ParamByName('v1').AsString:=cb_confirmar.Text;
                   DMC.qry_consulta.ParamByName('v2').AsInteger:=a_guia;
                   DMC.qry_consulta.ParamByName('v3').AsString:=aux;
                   DMC.qry_consulta.ExecSQL;
                   DMC.SQLTransaction1.Commit;
                   DMC.query_consultas.Active:=false;
                   DMC.query_consultas.Active:=true;

                   showmessage('Paciente não Confirmou Consulta');

              end;

      end;

end;

procedure Tt_consultas.btn_desmarcarClick(Sender: TObject);
var
  a_guia:integer;
begin

  a_guia := strtoint(db_txt_guia.Text);

  DMC.qry_consulta.Close;
  DMC.qry_consulta.SQL.Clear;
  DMC.qry_consulta.SQL.Add('delete from consulta where guia = :v1');
  DMC.qry_consulta.ParamByName('v1').AsInteger:=a_guia;
  DMC.qry_consulta.ExecSQL;
  DMC.SQLTransaction1.Commit;
  DMC.query_consultas.Active:=false;
  DMC.query_consultas.Active:=true;

  showmessage('Consulta Desmarcada com Sucesso');

end;

procedure Tt_consultas.cb_meioChange(Sender: TObject);
begin

  if cb_meio.Text = 'Crédito' then
     begin
         txt_cartao.Enabled:=true;
         cb_parcelas.Enabled:=true;
     end
  else
      begin
          txt_cartao.Enabled:=false;
          cb_parcelas.Enabled:=false;
          txt_cartao.Text:='';
      end;

end;

procedure Tt_consultas.btn_comparecerClick(Sender: TObject);
var
  a_guia,par:integer;
  aux:String;
begin

  a_guia := strtoint(db_txt_guia.Text);

  if (cb_parcelas.Text = '') or (cb_parcelas.Enabled = false) then
     begin
         par:=0;
     end
  else
      begin
         par := strtoint(cb_parcelas.Text);
      end;

  if cb_comparecer.Text = '' then
     begin
          showmessage('Selecione S para Sim ou N para Não em Comparecer.');
     end;

  if cb_meio.Text = '' then
     begin
          showmessage('Selecione um Meio de Pagamento.');
     end;

  if txt_valor.Text = '' then
     begin
          showmessage('Digite o Valor da Consulta.');
     end;

  if (cb_comparecer.Text <> '') and (cb_meio.Text <> '') and (txt_valor.Text <> '') then
      begin

                   aux := 'Fechado';

                   if cb_comparecer.Text = 'S' then
                      begin
                           DMC.qry_consulta.Close;
                           DMC.qry_consulta.SQL.Clear;
                           DMC.qry_consulta.SQL.Add('update consulta set compareceu = :v1, valor_total = :v3, forma_pagamento = :v4, cartao_credito = :v5, parcelas = :v6 where guia = :v2');
                           DMC.qry_consulta.ParamByName('v1').AsString:=cb_comparecer.Text;
                           DMC.qry_consulta.ParamByName('v3').Value:=txt_valor.Text;
                           DMC.qry_consulta.ParamByName('v4').AsString:=cb_meio.Text;
                           DMC.qry_consulta.ParamByName('v5').AsString:=txt_cartao.Text;
                           DMC.qry_consulta.ParamByName('v2').AsInteger:=a_guia;
                           DMC.qry_consulta.ParamByName('v6').AsInteger:=par;
                           DMC.qry_consulta.ExecSQL;
                           DMC.SQLTransaction1.Commit;
                           DMC.query_consultas.Active:=false;
                           DMC.query_consultas.Active:=true;
                           showmessage('Paciente Compareceu à Consulta');
                      end;

                   if cb_comparecer.Text = 'N' then
                      begin
                           DMC.qry_consulta.Close;
                           DMC.qry_consulta.SQL.Clear;
                           DMC.qry_consulta.SQL.Add('update consulta set compareceu = :v1, status = :v3 where guia = :v2');
                           DMC.qry_consulta.ParamByName('v1').AsString:=cb_comparecer.Text;
                           DMC.qry_consulta.ParamByName('v2').AsInteger:=a_guia;
                           DMC.qry_consulta.ParamByName('v3').AsString:=aux;
                           DMC.qry_consulta.ExecSQL;
                           DMC.SQLTransaction1.Commit;
                           DMC.query_consultas.Active:=false;
                           DMC.query_consultas.Active:=true;
                           showmessage('Paciente não Compareceu à Consulta');
                      end;

      end;

end;

procedure Tt_consultas.FormShow(Sender: TObject);
begin

  DMC.query_consultas.Active:=true;
  //DMC.qry_consulta.Active:=true;

end;

end.

