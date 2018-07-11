unit agendamento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, DBGrids, StdCtrls, DbCtrls, Grids, DateUtils, DB;

type

  { Tt_agendamento }

  Tt_agendamento = class(TForm)
    btn_confirmar: TButton;
    cb_hora: TComboBox;
    cb_especialidade: TComboBox;
    cb_medico: TComboBox;
    cb_tipo: TComboBox;
    cb_preferencia: TComboBox;
    date_consulta: TDateTimePicker;
    db_txt_emp: TDBEdit;
    db_txt_plano: TDBEdit;
    db_txt_convenio: TDBEdit;
    db_txt_rg: TDBEdit;
    db_txt_cpf: TDBEdit;
    db_txt_validade: TDBEdit;
    db_txt_id: TDBEdit;
    db_txt_nome: TDBEdit;
    DBGroupBox1: TDBGroupBox;
    DBGrid1: TDBGrid;
    Label15: TLabel;
    Label16: TLabel;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    txt_medico_id: TEdit;
    txt_busca: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure btn_confirmarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cb_especialidadeChange(Sender: TObject);
    procedure cb_medicoChange(Sender: TObject);
    procedure date_consultaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure txt_buscaChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_agendamento: Tt_agendamento;
  atendente, a_nome: String;

implementation

{$R *.lfm}

{ Tt_agendamento }

uses dm, home, agenda_medica;

procedure Tt_agendamento.FormCreate(Sender: TObject);
begin

  atendente:= t_home.Label1.Caption;
  DMC.qr_consulta.Active:=true;

  cb_hora.Items.Clear;

  cb_hora.Items.Add('08:00');
  cb_hora.Items.Add('08:20');
  cb_hora.Items.Add('08:40');
  cb_hora.Items.Add('09:00');
  cb_hora.Items.Add('09:20');
  cb_hora.Items.Add('09:40');
  cb_hora.Items.Add('10:00');
  cb_hora.Items.Add('10:20');
  cb_hora.Items.Add('10:40');
  cb_hora.Items.Add('11:00');
  cb_hora.Items.Add('11:20');
  cb_hora.Items.Add('11:40');
  cb_hora.Items.Add('12:00');
  cb_hora.Items.Add('12:20');
  cb_hora.Items.Add('12:40');
  cb_hora.Items.Add('13:00');
  cb_hora.Items.Add('13:20');
  cb_hora.Items.Add('13:40');
  cb_hora.Items.Add('14:00');
  cb_hora.Items.Add('14:20');
  cb_hora.Items.Add('14:40');
  cb_hora.Items.Add('15:00');
  cb_hora.Items.Add('15:20');
  cb_hora.Items.Add('15:40');
  cb_hora.Items.Add('16:00');
  cb_hora.Items.Add('16:20');
  cb_hora.Items.Add('16:40');

  cb_especialidade.Items.Clear;

  cb_especialidade.Items.Add('Oftalmologista');
  cb_especialidade.Items.Add('Dentista');
  cb_especialidade.Items.Add('Cardiologista');
  cb_especialidade.Items.Add('Infectologista');
  cb_especialidade.Items.Add('Podólogo');

  StringGrid1.Cells[0,0] := 'Horários';
  StringGrid1.Cells[1,0] := 'Disponibilidade';

  StringGrid1.Cells[0,1] := '08:01';
  StringGrid1.Cells[0,2] := '08:20';
  StringGrid1.Cells[0,3] := '08:40';
  StringGrid1.Cells[0,4] := '09:00';
  StringGrid1.Cells[0,5] := '09:20';
  StringGrid1.Cells[0,6] := '09:40';
  StringGrid1.Cells[0,7] := '10:00';
  StringGrid1.Cells[0,8] := '10:20';
  StringGrid1.Cells[0,9] := '10:40';
  StringGrid1.Cells[0,10] := '11:00';
  StringGrid1.Cells[0,11] := '11:20';
  StringGrid1.Cells[0,12] := '11:40';
  StringGrid1.Cells[0,13] := '12:00';
  StringGrid1.Cells[0,14] := '12:20';
  StringGrid1.Cells[0,15] := '12:40';
  StringGrid1.Cells[0,16] := '13:00';
  StringGrid1.Cells[0,17] := '13:20';
  StringGrid1.Cells[0,18] := '13:40';
  StringGrid1.Cells[0,19] := '14:00';
  StringGrid1.Cells[0,20] := '14:20';
  StringGrid1.Cells[0,21] := '14:40';
  StringGrid1.Cells[0,22] := '15:00';
  StringGrid1.Cells[0,23] := '15:20';
  StringGrid1.Cells[0,24] := '15:40';
  StringGrid1.Cells[0,25] := '16:00';
  StringGrid1.Cells[0,26] := '16:20';
  StringGrid1.Cells[0,27] := '16:40';
  StringGrid1.Cells[0,28] := '17:00';
  StringGrid1.Cells[0,29] := '17:20';
  StringGrid1.Cells[0,30] := '17:40';

  cb_tipo.Items.Clear;

  cb_tipo.Items.Add('Consulta');
  cb_tipo.Items.Add('SP/SADT');
  cb_tipo.Items.Add('Resumo de Internação');
  cb_tipo.Items.Add('Honorário Individual');

  cb_preferencia.Items.Clear;

  cb_preferencia.Items.Add('Horário Normal');
  cb_preferencia.Items.Add('Horário Especial');
  cb_preferencia.Items.Add('Emergência');

  date_consulta.Enabled:=false;

end;

procedure Tt_agendamento.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMC.query_paciente.Active:=false;
  DMC.q_medico.Active:=false;
  DMC.qry_agenda_medica.Active:=false;
  DMC.qr_consulta.Active:=false;
  //DMC.qr_verifica_consulta.Active:=false;
  DMC.qr_verifica_atendente.Active:=false;
  DMC.qr_hora.Active:=false;

end;

procedure Tt_agendamento.cb_especialidadeChange(Sender: TObject);
var
  especial: String;
begin

  especial:=cb_especialidade.Text;

  cb_medico.Items.Clear;

  DMC.q_medico.Close;
  DMC.q_medico.SQL.Clear;
  DMC.q_medico.SQL.Add('select * from medico where especialidade = :v1');
  DMC.q_medico.ParamByName('v1').AsString:=especial;
  DMC.q_medico.Open;

  while not DMC.q_medico.EOF do
   begin

     cb_medico.Items.AddObject(DMC.q_medico.Fields[1].AsString,TObject(DMC.q_medico.Fields[0].AsInteger));
     DMC.q_medico.Next;

   end;

end;

procedure Tt_agendamento.btn_confirmarClick(Sender: TObject);
var
  key_medico, key_paciente,cd_medico: integer;
  status, aux, entrada, saida: String;
  aux1:boolean;
begin

  if txt_medico_id.Text<>'' then
  begin

  cd_medico := strtoint(txt_medico_id.Text);

  DMC.qr_hora.Close;
  DMC.qr_hora.ParamByName('v1').AsInteger:=cd_medico;
  DMC.qr_hora.Open;

  if DMC.qr_hora.RecordCount > 0 then
   begin

     entrada:=DMC.qr_hora.Fields[0].AsString;
     saida:=DMC.qr_hora.Fields[1].AsString;

   end;

  if (strtotime(cb_hora.Text) <= strtotime(entrada)) or (strtotime(cb_hora.Text) >= strtotime(saida)) then
   begin
     aux1:=false;
     showmessage('Horário fora da Grade Horária do Médico.');
   end;

  if (strtotime(cb_hora.Text) > strtotime(entrada)) and (strtotime(cb_hora.Text) < strtotime(saida)) then
   begin
     aux1:=true;
   end;

  end;

  if cb_especialidade.Text = '' then
   begin
     showmessage('Selecione uma especialidade.')
   end;

  if cb_medico.Text = '' then
   begin
     showmessage('Selecione um Médico')
   end;

  if cb_hora.Text = '' then
   begin
     showmessage('Selecione um horário para consulta.')
   end;

  if cb_tipo.Text = '' then
   begin
     showmessage('Selecione um Tipo de Consulta.')
   end;

  if cb_preferencia.Text = '' then
   begin
     showmessage('Selecione uma Preferência.');
   end;

  if (cb_especialidade.Text <> '') and (cb_medico.Text <> '') and (cb_hora.Text <> '') and (cb_tipo.Text <> '') and (cb_preferencia.Text <> '') and (aux1=true) then
   begin

     key_medico := strtoint(txt_medico_id.Text);
     key_paciente := strtoint(db_txt_id.Text);
     status := 'Aberto';
     aux := a_nome;

     DMC.qry_agenda_medica.Close;
     DMC.qry_agenda_medica.ParamByName('v1').AsInteger:=key_medico;
     DMC.qry_agenda_medica.ParamByName('v2').Value:=date_consulta.Date;
     DMC.qry_agenda_medica.ParamByName('v3').AsString:=cb_hora.Text;
     DMC.qry_agenda_medica.Open;

     if DMC.qry_agenda_medica.RecordCount < 1 then
      begin

        DMC.qr_consulta.Close;
        DMC.qr_consulta.SQL.Clear;
        DMC.qr_consulta.SQL.Add('insert into consulta (cod_paciente, especialidade, cod_medico, data_consulta, hora, atendente, status, tipo_consulta, preferencia)');
        DMC.qr_consulta.SQL.Add('values (:v1, :v2, :v3, :v4, :v5, :v6, :v7, :v8, :v9)');
        DMC.qr_consulta.ParamByName('v1').AsInteger:=key_paciente;
        DMC.qr_consulta.ParamByName('v2').AsString:=cb_especialidade.Text;
        DMC.qr_consulta.ParamByName('v3').AsInteger:=key_medico;
        DMC.qr_consulta.ParamByName('v4').Value:=date_consulta.Date;
        DMC.qr_consulta.ParamByName('v5').AsString:=cb_hora.Text;
        DMC.qr_consulta.ParamByName('v6').AsString:=a_nome;
        DMC.qr_consulta.ParamByName('v7').AsString:=status;
        DMC.qr_consulta.ParamByName('v8').AsString:=cb_tipo.Text;
        DMC.qr_consulta.ParamByName('v9').AsString:=cb_preferencia.Text;
        DMC.qr_consulta.ExecSQL;
        DMC.SQLTransaction1.Commit;
        DMC.query_paciente.Active:=true;
        DMC.q_medico.Active:=true;
        DMC.qry_agenda_medica.Active:=false;
        DMC.qry_agenda_medica.Active:=true;
        DMC.qr_verifica_atendente.Active:=true;

        DMC.qr_verifica_atendente.Close;
        DMC.qr_verifica_atendente.SQL.Clear;
        DMC.qr_verifica_atendente.SQL.Add('select a.nome from atendente as a, login as l where l.cod_func = a.id and l.login = :v1');
        DMC.qr_verifica_atendente.ParamByName('v1').AsString:=aux;
        DMC.qr_verifica_atendente.Open;

          if DMC.qr_verifica_atendente.RecordCount > 0 then
           begin
             a_nome:= DMC.qr_verifica_atendente.Fields[0].AsString;
             Label2.Caption := a_nome;
             DMC.qr_verifica_atendente.Next;
           end;

        showmessage('Consulta Agendada com Sucesso.');

      end
     else
     begin
       showmessage('Dia e horário indisponíveis para essa consulta.');
     end;

   end;

end;

procedure Tt_agendamento.Button1Click(Sender: TObject);
begin
  t_agenda_medica.ShowModal;
end;

procedure Tt_agendamento.cb_medicoChange(Sender: TObject);
var
  hora, dia, entrada, saida: String;
  cd_medico,i: integer;
begin

     i := 1;
     txt_medico_id.Text:=inttostr(integer(cb_medico.Items.Objects[cb_medico.ItemIndex]));
     dia := datetostr(now);
     cd_medico := strtoint(txt_medico_id.Text);
     date_consulta.Enabled:=true;

     DMC.qr_hora.Close;
     DMC.qr_hora.ParamByName('v1').AsInteger:=cd_medico;
     DMC.qr_hora.Open;

     if DMC.qr_hora.RecordCount > 0 then
      begin

        entrada:=DMC.qr_hora.Fields[0].AsString;
        saida:=DMC.qr_hora.Fields[1].AsString;

      end;

     while i < 30 do
      begin

           hora := StringGrid1.Cells[0,i];

           DMC.qry_agenda_medica.Close;
           DMC.qry_agenda_medica.ParamByName('v1').AsInteger:=cd_medico;
           //DMC.qr_agenda_medica.ParamByName('v2').Value:=FormatDateTime('mm/dd/yyyy',now);
           DMC.qry_agenda_medica.ParamByName('v2').Value:=now;
           DMC.qry_agenda_medica.ParamByName('v3').AsString:=hora;
           DMC.qry_agenda_medica.Open;

           if DMC.qry_agenda_medica.RecordCount = 0 then
            begin

              StringGrid1.Cells[1,i] := 'Livre';

              if (strtotime(StringGrid1.Cells[0,i]) <= strtotime(entrada)) or (strtotime(StringGrid1.Cells[0,i]) >= strtotime(saida)) then
               begin
                    StringGrid1.Cells[1,i] := 'Fora do Horário';
               end;

            end
           else
            begin

                 StringGrid1.Cells[1,i] := 'Indisponível';

                 if (strtotime(StringGrid1.Cells[0,i]) <= strtotime(entrada)) or (strtotime(StringGrid1.Cells[0,i]) >= strtotime(saida)) then
                  begin
                       StringGrid1.Cells[1,i] := 'Fora do Horário';
                  end;

            end;

           i := i + 1;

      end;

end;

procedure Tt_agendamento.date_consultaChange(Sender: TObject);
var
  hora, dia, entrada, saida: String;
  cd_medico,i: integer;
begin

  i := 1;
  dia := datetostr(date_consulta.Date);
  cd_medico := strtoint(txt_medico_id.Text);

  DMC.qr_hora.Close;
  DMC.qr_hora.ParamByName('v1').AsInteger:=cd_medico;
  DMC.qr_hora.Open;

  if DMC.qr_hora.RecordCount > 0 then
   begin

     entrada:=DMC.qr_hora.Fields[0].AsString;
     saida:=DMC.qr_hora.Fields[1].AsString;

   end;

  while i < 30 do
    begin

         hora := StringGrid1.Cells[0,i];

         DMC.qry_agenda_medica.Close;
         DMC.qry_agenda_medica.ParamByName('v1').AsInteger:=cd_medico;
         DMC.qry_agenda_medica.ParamByName('v2').Value:=date_consulta.Date;
         DMC.qry_agenda_medica.ParamByName('v3').AsString:=hora;
         DMC.qry_agenda_medica.Open;

         if DMC.qry_agenda_medica.RecordCount = 0 then
              begin

                   StringGrid1.Cells[1,i] := 'Livre';

                if (strtotime(StringGrid1.Cells[0,i]) < strtotime(entrada)) or (strtotime(StringGrid1.Cells[0,i]) > strtotime(saida)) then
                 begin
                      StringGrid1.Cells[1,i] := 'Fora do Horário';
                 end;

              end
         else
              begin

                   StringGrid1.Cells[1,i] := 'Indisponível';

                   if (strtotime(StringGrid1.Cells[0,i]) < strtotime(entrada)) or (strtotime(StringGrid1.Cells[0,i]) > strtotime(saida)) then
                    begin
                         StringGrid1.Cells[1,i] := 'Fora do Horário';
                    end;

              end;

         i := i + 1;

    end;

end;

procedure Tt_agendamento.FormShow(Sender: TObject);
begin

  date_consulta.Date:=now;

  DMC.query_paciente.Active:=true;
  DMC.q_medico.Active:=true;
  DMC.qry_agenda_medica.Active:=true;
  //DMC.qr_consulta.Active:=true;
  //DMC.qr_verifica_consulta.Active:=true;
  DMC.qr_verifica_atendente.Active:=true;
  DMC.qr_hora.Active:=true;

  atendente:= t_home.Label1.Caption;

  DMC.qr_verifica_atendente.Close;
  DMC.qr_verifica_atendente.SQL.Clear;
  DMC.qr_verifica_atendente.SQL.Add('select a.nome from atendente as a, login as l where l.cod_func = a.id and l.login = :v1');
  DMC.qr_verifica_atendente.ParamByName('v1').AsString:=atendente;
  DMC.qr_verifica_atendente.Open;

  if DMC.qr_verifica_atendente.RecordCount > 0 then
   begin
     a_nome:= DMC.qr_verifica_atendente.Fields[0].AsString;
     Label2.Caption := a_nome;
     DMC.qr_verifica_atendente.Next;
   end;

end;

procedure Tt_agendamento.GroupBox1Click(Sender: TObject);
begin

end;

procedure Tt_agendamento.Label11Click(Sender: TObject);
begin

end;

procedure Tt_agendamento.txt_buscaChange(Sender: TObject);
begin
  DMC.query_paciente.Locate('nome', txt_busca.Text, [loPartialKey,loCaseInsensitive]);
end;

end.

