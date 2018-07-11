unit consulta_dentista;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  DBGrids, StdCtrls, DbCtrls, Menus, ExtCtrls;

type

  { Tt_consulta_dentista }

  Tt_consulta_dentista = class(TForm)
    btn_finalizar: TButton;
    btn_salvar: TButton;
    Button1: TButton;
    cb_tipo: TComboBox;
    cb_proc: TDBLookupComboBox;
    db_txt_plano: TDBEdit;
    db_txt_convenio: TDBEdit;
    db_txt_data: TDBEdit;
    db_txt_guia: TDBEdit;
    db_txt_hora: TDBEdit;
    db_txt_id_paciente: TDBEdit;
    db_txt_nome: TDBEdit;
    db_txt_validade: TDBEdit;
    GroupBox6: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    MenuItem2: TMenuItem;
    txt_material: TMemo;
    txt_qtde: TEdit;
    txt_valor: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Image1: TImage;
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
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    sp_dn_molar_inferior_fundo: TSpeedButton;
    sp_dn_molar_esquerdo_meio: TSpeedButton;
    sp_dn_molar_esquerdo_frente: TSpeedButton;
    sp_dn_molar_direito_fundo: TSpeedButton;
    sp_dn_molar_direito_meio: TSpeedButton;
    sp_dn_molar_direito_frente: TSpeedButton;
    sp_up_molar_esquerdo_fundo: TSpeedButton;
    sp_up_molar_esquerdo_meio: TSpeedButton;
    sp_up_molar_esquerdo_frente: TSpeedButton;
    sp_up_molar_direito_fundo: TSpeedButton;
    sp_up_molar_direito_meio: TSpeedButton;
    sp_up_molar_direito_frente: TSpeedButton;
    sp_dn_premolar_direito_fundo: TSpeedButton;
    sp_dn_premolar_direito_frente: TSpeedButton;
    sp_dn_premolar_fundo: TSpeedButton;
    sp_up_premolar_direito_fundo: TSpeedButton;
    sp_dn_premolar_esquerdo_frente: TSpeedButton;
    sp_up_premolar_direito_frente: TSpeedButton;
    sp_up_premolar_esquerdo_fundo: TSpeedButton;
    sp_up_premolar_esquerdo_frente: TSpeedButton;
    sp_up_canino_direito: TSpeedButton;
    sp_up_canino_esquerdo: TSpeedButton;
    sp_dn_canino_direito: TSpeedButton;
    sp_dn_canino_esquerdo: TSpeedButton;
    sp_dn_lateral_incisivo_direito: TSpeedButton;
    sp_dn_lateral_incisivo_esquerdo: TSpeedButton;
    sp_dn_central_incisivo_direito: TSpeedButton;
    sp_up_lateral_incisivo_direito: TSpeedButton;
    sp_up_lateral_incisivo_esquerdo: TSpeedButton;
    sp_up_centro_incisivo_direito: TSpeedButton;
    sp_dn_central_incisivo_esquerdo: TSpeedButton;
    sp_up_centro_incisivo_esquerdo: TSpeedButton;
    txt_procedimento: TMemo;
    procedure btn_finalizarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cb_procChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure sp_dn_molar_direito_frenteClick(Sender: TObject);
    procedure sp_dn_molar_direito_fundoClick(Sender: TObject);
    procedure sp_dn_molar_direito_meioClick(Sender: TObject);
    procedure sp_dn_molar_esquerdo_frenteClick(Sender: TObject);
    procedure sp_dn_molar_esquerdo_meioClick(Sender: TObject);
    procedure sp_dn_molar_inferior_fundoClick(Sender: TObject);
    procedure sp_dn_premolar_direito_frenteClick(Sender: TObject);
    procedure sp_dn_premolar_direito_fundoClick(Sender: TObject);
    procedure sp_dn_premolar_fundoClick(Sender: TObject);
    procedure sp_up_molar_direito_frenteClick(Sender: TObject);
    procedure sp_up_molar_direito_fundoClick(Sender: TObject);
    procedure sp_up_molar_direito_meioClick(Sender: TObject);
    procedure sp_up_molar_esquerdo_frenteClick(Sender: TObject);
    procedure sp_up_molar_esquerdo_fundoClick(Sender: TObject);
    procedure sp_up_molar_esquerdo_meioClick(Sender: TObject);
    procedure sp_up_premolar_direito_fundoClick(Sender: TObject);
    procedure sp_dn_premolar_esquerdo_frenteClick(Sender: TObject);
    procedure sp_up_premolar_direito_frenteClick(Sender: TObject);
    procedure sp_dn_canino_direitoClick(Sender: TObject);
    procedure sp_dn_canino_esquerdoClick(Sender: TObject);
    procedure sp_dn_central_incisivo_direitoClick(Sender: TObject);
    procedure sp_dn_central_incisivo_esquerdoClick(Sender: TObject);
    procedure sp_dn_lateral_incisivo_direitoClick(Sender: TObject);
    procedure sp_dn_lateral_incisivo_esquerdoClick(Sender: TObject);
    procedure sp_up_canino_direitoClick(Sender: TObject);
    procedure sp_up_canino_esquerdoClick(Sender: TObject);
    procedure sp_up_centro_incisivo_direitoClick(Sender: TObject);
    procedure sp_up_centro_incisivo_esquerdoClick(Sender: TObject);
    procedure sp_up_lateral_incisivo_direitoClick(Sender: TObject);
    procedure sp_up_lateral_incisivo_esquerdoClick(Sender: TObject);
    procedure sp_up_premolar_esquerdo_frenteClick(Sender: TObject);
    procedure sp_up_premolar_esquerdo_fundoClick(Sender: TObject);
    procedure txt_valorChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_consulta_dentista: Tt_consulta_dentista;
  medico, a_nome: String;
  key,a_guia,guia,qtde:integer;

implementation

{$R *.lfm}
uses dm, home, dentista_agenda, orcamento, dentista_materiais;

{ Tt_consulta_dentista }

procedure CarregaDados(key,guia:integer);
begin

  DMC.query_dentista.Close;
  DMC.query_dentista.ParamByName('v1').AsInteger:=key;
  DMC.query_dentista.ParamByName('v2').AsInteger:=guia;
  DMC.query_dentista.Open;

end;

procedure Tt_consulta_dentista.sp_up_premolar_direito_frenteClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Primeiro Pré-Molar Superior Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_up_premolar_direito_fundoClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Segundo Pré-Molar Superior Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_premolar_fundoClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Segundo Pré-Molar Inferior Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_up_molar_direito_frenteClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Primeiro Molar Superior Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_up_molar_direito_fundoClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Terceiro Molar Superior Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_up_molar_direito_meioClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Segundo Molar Superior Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_up_molar_esquerdo_frenteClick(Sender: TObject
  );
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Primeiro Molar Superior Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_up_molar_esquerdo_fundoClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Terceiro Molar Superior Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_up_molar_esquerdo_meioClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Segundo Molar Superior Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_premolar_direito_frenteClick(
  Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Primeiro Pré-Molar Inferior Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_molar_direito_frenteClick(Sender: TObject);
begin
   txt_procedimento.Text:= txt_procedimento.Text + 'Dente Primeiro Molar Inferior Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.FormCreate(Sender: TObject);
begin

  txt_procedimento.Text:='';
  //DMC.qr_procedimentos.Active:=true;
  DMC.qry1_consulta.Active:=true;
  DMC.qr_item.Active:=true;

  cb_tipo.Items.Clear;

  cb_tipo.Items.Add('Consulta');
  cb_tipo.Items.Add('Cirurgia');
  cb_tipo.Items.Add('Exame');
  cb_tipo.Items.Add('Teste');
  cb_tipo.Items.Add('Vacina');
  cb_tipo.Items.Add('Retorno');
  cb_tipo.Items.Add('Outros');

end;

procedure Tt_consulta_dentista.FormShow(Sender: TObject);
begin

  DMC.query_dentista.Active:=true;
  DMC.qr_verifica_medico.Active:=true;
  DMC.qry_list_dentista.Active:=true;

  txt_material.Clear;

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
       a_guia:=strtoint(t_dentista_atendimento.db_txt_guia.Text);
       CarregaDados(key,a_guia);
       DMC.qr_verifica_medico.Next;
     end;

end;

procedure Tt_consulta_dentista.MenuItem1Click(Sender: TObject);
begin
  t_orcamento.ShowModal;
end;

procedure Tt_consulta_dentista.MenuItem2Click(Sender: TObject);
begin
  t_dentista_materiais.ShowModal;
end;

procedure Tt_consulta_dentista.btn_salvarClick(Sender: TObject);
var
  especialidades: String;
  a_medico, a_paciente, a_guia:integer;
begin

  if txt_procedimento.Text = '' then
     begin
       showmessage('Digite os Procedimentos Feitos.');
     end;

  if cb_tipo.Text = '' then
     begin
       showmessage('Selecione um Tipo de Procedimento.');
     end;

  if (txt_procedimento.Text <> '') and (cb_tipo.Text <> '') then
     begin

       especialidades:='Dentista';
       a_medico:=key;
       a_paciente:=strtoint(db_txt_id_paciente.Text);
       a_guia:=strtoint(db_txt_guia.Text);

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
       DMC.query_dentista.Active:=false;
       DMC.query_dentista.Active:=true;
       DMC.query_dentista_proc.Active:=false;
       DMC.query_dentista_proc.Active:=true;
       DMC.qr_agenda_medico.Active:=false;
       DMC.qr_verifica_medico.Active:=false;
       DMC.qr_agenda_medico.Active:=true;
       DMC.qr_verifica_medico.Active:=true;

       CarregaDados(key,a_guia);

       showmessage('Dados Salvos com Sucesso.');

       txt_procedimento.Clear;

     end;

end;

procedure Tt_consulta_dentista.Button1Click(Sender: TObject);
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
         DMC.query_podologo.Active:=false;
         DMC.query_podologo.Active:=true;
         DMC.query_list_podologo.Active:=false;
         DMC.query_list_podologo.Active:=true;
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

procedure Tt_consulta_dentista.cb_procChange(Sender: TObject);
begin
  txt_valor.Text:=floattostr(Double(cb_proc.KeyValue));
  txt_procedimento.Text:= txt_procedimento.Text + cb_proc.Text+#13;
end;



procedure Tt_consulta_dentista.btn_finalizarClick(Sender: TObject);
var
  st:String;
  a_guia:integer;
begin

  if MessageDlg('Deseja Encerrar o Atendmento?',mtConfirmation,mbYesNo,0) = mrYes then
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
       DMC.query_dentista.Active:=false;
       DMC.query_dentista.Active:=true;
       DMC.query_dentista_proc.Active:=false;
       DMC.query_dentista_proc.Active:=true;
       DMC.qr_agenda_medico.Active:=false;
       DMC.qr_verifica_medico.Active:=false;
       DMC.qr_agenda_medico.Active:=true;
       DMC.qr_verifica_medico.Active:=true;

       showmessage('Atendimento Concluído.');

       txt_procedimento.Clear;

     end
  else
      begin
        //Action:=caNone;
      end;

end;

procedure Tt_consulta_dentista.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  txt_procedimento.Text:='';
  txt_qtde.Clear;
  txt_material.Clear;

  DMC.query_dentista.Active:=false;
  DMC.qr_verifica_medico.Active:=false;
  //DMC.qr_procedimentos.Active:=false;
  DMC.qry1_consulta.Active:=false;
  DMC.qry_list_dentista.Active:=false;
  DMC.qr_item.Active:=false;

end;

procedure Tt_consulta_dentista.sp_dn_molar_direito_fundoClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Terceiro Molar Inferior Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_molar_direito_meioClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Segundo Molar Inferior Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_molar_esquerdo_frenteClick(Sender: TObject
  );
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Primeiro Molar Inferior Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_molar_esquerdo_meioClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Segundo Molar Inferior Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_molar_inferior_fundoClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Terceiro Molar Inferior Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_premolar_direito_fundoClick(Sender: TObject
  );
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Segundo Pré-Molar Inferior Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_premolar_esquerdo_frenteClick(
  Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Primeiro Pré-Molar Inferior Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_canino_direitoClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Canino Inferior Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_canino_esquerdoClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Canino Inferior Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_central_incisivo_direitoClick(
  Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Incisivo Inferior Central Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_central_incisivo_esquerdoClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Incisivo Inferior Central Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_lateral_incisivo_direitoClick(
  Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Incisivo Inferior Lateral Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_dn_lateral_incisivo_esquerdoClick(
  Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Incisivo Inferior Lateral Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_up_canino_direitoClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Canino Superior Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_up_canino_esquerdoClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Canino Superior Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_up_centro_incisivo_direitoClick(
  Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Incisivo Superior Central Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_up_centro_incisivo_esquerdoClick(Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Incisivo Superior Central Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_up_lateral_incisivo_direitoClick(
  Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Incisivo Superior Lateral Direito:'#13;
end;

procedure Tt_consulta_dentista.sp_up_lateral_incisivo_esquerdoClick(
  Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Incisivo Superior Lateral Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_up_premolar_esquerdo_frenteClick(
  Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Primeiro Pré-Molar Superior Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.sp_up_premolar_esquerdo_fundoClick(
  Sender: TObject);
begin
  txt_procedimento.Text:= txt_procedimento.Text + 'Dente Segundo Pré-Molar Superior Esquerdo:'#13;
end;

procedure Tt_consulta_dentista.txt_valorChange(Sender: TObject);
begin

end;

end.

