unit consulta_infectologista;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DbCtrls, Menus;

type

  { Tt_consulta_infectologista }

  Tt_consulta_infectologista = class(TForm)
    btn_finalizar: TButton;
    btn_salvar: TButton;
    Button1: TButton;
    cb_lista_procedimento: TDBLookupComboBox;
    cb_tipo: TComboBox;
    db_txt_convenio: TDBEdit;
    db_txt_data: TDBEdit;
    db_txt_guia: TDBEdit;
    db_txt_hora: TDBEdit;
    db_txt_id_paciente: TDBEdit;
    db_txt_nome: TDBEdit;
    db_txt_tipo: TDBEdit;
    db_txt_validade: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    txt_material: TMemo;
    txt_procedimento: TMemo;
    txt_qtde: TEdit;
    txt_valor: TEdit;
    procedure btn_finalizarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cb_lista_procedimentoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_consulta_infectologista: Tt_consulta_infectologista;
  medico, a_nome: String;
  key,guia, qtde:integer;

implementation

{$R *.lfm}

{ Tt_consulta_infectologista }
uses dm, home, infectologista_agenda, infectologista_orcamento, infectologista_materiais;

procedure CarregaDados(key:integer;x_guia:integer);
begin

  DMC.query_infectologista.Close;
  DMC.query_infectologista.ParamByName('v1').AsInteger:=key;
  DMC.query_infectologista.ParamByName('v2').AsInteger:=x_guia;
  DMC.query_infectologista.Open;

end;

procedure Tt_consulta_infectologista.btn_salvarClick(Sender: TObject);
var
  especialidades: String;
  a_medico, a_paciente, a_guia:integer;
begin

    if txt_procedimento.Text = '' then
       begin
         showmessage('Digite os Procedimentos Feitos.')
       end;

      if cb_tipo.Text = '' then
       begin
         showmessage('Selecione um Tipo de Procedimento.')
       end;

      if (txt_procedimento.Text <> '') and (cb_tipo.Text <> '') then
       begin

         especialidades:='Podólogo';
         a_medico:=key;
         a_paciente:=strtoint(db_txt_id_paciente.Text);
         a_guia:=strtoint(t_infectologista_agenda.db_txt_guia.Text);

         DMC.qr_item.Close;
         DMC.qr_item.SQL.Clear;
         DMC.qr_item.SQL.Add('insert into consulta_item (cod_medico, cod_guia, cod_paciente, descricao, valor_unitario, tipo)');
         DMC.qr_item.SQL.Add('values (:v1, :v2, :v3, :v4, :v5, :v6)');
         DMC.qr_item.ParamByName('v1').AsInteger:=a_medico;
         DMC.qr_item.ParamByName('v2').AsInteger:=a_guia;
         DMC.qr_item.ParamByName('v3').AsInteger:=a_paciente;
         DMC.qr_item.ParamByName('v4').AsString:=txt_procedimento.Text;
         DMC.qr_item.ParamByName('v5').Value:=txt_valor.Text;
         DMC.qr_item.ParamByName('v6').AsString:=cb_tipo.Text;
         DMC.qr_item.ExecSQL;
         DMC.SQLTransaction1.Commit;
         DMC.qr_verifica_medico.Active:=true;
         DMC.query_infectologista.Active:=false;
         DMC.query_infectologista.Active:=true;
         DMC.query_list_inf.Active:=false;
         DMC.query_list_inf.Active:=true;
         DMC.qr_agenda_medico.Active:=false;
         DMC.qr_verifica_medico.Active:=false;
         DMC.qr_agenda_medico.Active:=true;
         DMC.qr_verifica_medico.Active:=true;

         CarregaDados(key,a_guia);
         txt_procedimento.Clear;

         showmessage('Dados Salvos com Sucesso.');

       end;

end;

procedure Tt_consulta_infectologista.Button1Click(Sender: TObject);
var
  especialidades: String;
  a_medico, a_paciente, a_guia:integer;
begin

  if txt_material.Text = '' then
       begin
         showmessage('Digite os Materiais Utilizados.')
       end;

    if txt_qtde.Text = '' then
       begin
         showmessage('Digite a Quantidade Utilizada.')
       end;

    if (txt_material.Text <> '') and (txt_qtde.Text <> '') then
       begin

         guia := strtoint(db_txt_guia.Text);
         a_medico:=key;
         qtde := strtoint(txt_qtde.Text);

         DMC.qr_material.Close;
         DMC.qr_material.SQL.Clear;
         DMC.qr_material.SQL.Add('insert into materiais (descricao, cod_guia, qtde) values (:v1, :v2, :v3)');
         DMC.qr_material.ParamByName('v1').AsString:=txt_material.Text;
         DMC.qr_material.ParamByName('v2').AsInteger:=guia;
         DMC.qr_material.ParamByName('v3').AsInteger:=qtde;
         DMC.qr_material.ExecSQL;
         DMC.SQLTransaction1.Commit;

         DMC.qr_verifica_medico.Active:=true;
         DMC.query_infectologista.Active:=false;
         DMC.query_infectologista.Active:=true;
         DMC.query_list_inf.Active:=false;
         DMC.query_list_inf.Active:=true;
         DMC.qr_agenda_medico.Active:=false;
         DMC.qr_verifica_medico.Active:=false;
         DMC.qr_agenda_medico.Active:=true;
         DMC.qr_verifica_medico.Active:=true;

         CarregaDados(key,guia);
         txt_material.Clear;
         txt_qtde.Clear;

         showmessage('Material Registrado com Sucesso.');

       end;

end;

procedure Tt_consulta_infectologista.cb_lista_procedimentoChange(Sender: TObject
  );
begin
  txt_valor.Text:=floattostr(Double(cb_lista_procedimento.KeyValue));
  txt_procedimento.Text:= txt_procedimento.Text + cb_lista_procedimento.Text+#13;
end;

procedure Tt_consulta_infectologista.btn_finalizarClick(Sender: TObject);
var
  st:String;
  a_guia:integer;
begin

  st:='Fechado';
  a_guia:=strtoint(db_txt_guia.Text);

  DMC.qry1_consulta.Close;
  DMC.qry1_consulta.SQL.Clear;
  DMC.qry1_consulta.SQL.Add('update consulta set status = :v1 where guia = :v2');
  DMC.qry1_consulta.ParamByName('v1').AsString:=st;
  DMC.qry1_consulta.ParamByName('v2').AsInteger:=a_guia;
  DMC.qry1_consulta.ExecSQL;
  DMC.SQLTransaction1.Commit;
  DMC.qr_verifica_medico.Active:=true;
  DMC.query_infectologista.Active:=false;
  DMC.query_infectologista.Active:=true;
  DMC.qr_agenda_medico.Active:=false;
  DMC.qr_agenda_medico.Active:=true;

  showmessage('Atendimento Concluído.');

end;

procedure Tt_consulta_infectologista.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMC.query_infectologista.Active:=false;
  DMC.qr_verifica_medico.Active:=false;
  DMC.qr_procedimentos.Active:=false;
  DMC.qry1_consulta.Active:=false;
  DMC.query_list_inf.Active:=false;

end;

procedure Tt_consulta_infectologista.FormCreate(Sender: TObject);
begin

  txt_procedimento.Text := '';
    txt_material.Text := '';

    DMC.qr_procedimentos.Active:=true;
    DMC.qry1_consulta.Active:=true;
    DMC.qr_material.Active:=true;

    cb_tipo.Items.Clear;

    cb_tipo.Items.Add('Consulta');
    cb_tipo.Items.Add('Procedimentos');
    cb_tipo.Items.Add('Cirurgia');
    cb_tipo.Items.Add('Exame');
    cb_tipo.Items.Add('Teste');
    cb_tipo.Items.Add('Vacina');
    cb_tipo.Items.Add('Retorno');
    cb_tipo.Items.Add('Outros');

end;

procedure Tt_consulta_infectologista.FormShow(Sender: TObject);
begin

    DMC.query_infectologista.Active:=true;
    DMC.qr_verifica_medico.Active:=true;
    DMC.query_list_inf.Active:=true;
    //DMC.qr_procedimentos.Active:=true;
    //DMC.qry1_consulta.Active:=true;


    medico := t_home.Label1.Caption;

    DMC.qr_verifica_medico.Close;
    DMC.qr_verifica_medico.SQL.Clear;
    DMC.qr_verifica_medico.SQL.Add('select m.nome, m.id from medico as m, login as l where l.cod_medico = m.id and l.login = :v1');
    DMC.qr_verifica_medico.ParamByName('v1').AsString:=medico;
    DMC.qr_verifica_medico.Open;

    if DMC.qr_verifica_medico.RecordCount > 0 then
     begin
       a_nome:= DMC.qr_verifica_medico.Fields[0].AsString;
       key:=DMC.qr_verifica_medico.Fields[1].AsInteger;
       Label9.Caption := a_nome;
       Label10.Caption:=inttostr(key);
       guia:=strtoint(t_infectologista_agenda.db_txt_guia.Text);
       CarregaDados(key,guia);
       DMC.qr_verifica_medico.Next;
     end;

end;

procedure Tt_consulta_infectologista.MenuItem1Click(Sender: TObject);
begin
  t_infectologista_orcamento.ShowModal;
end;

procedure Tt_consulta_infectologista.MenuItem2Click(Sender: TObject);
begin
  t_inf_materiais.ShowModal;
end;

end.

