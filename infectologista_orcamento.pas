unit infectologista_orcamento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DbCtrls, MaskEdit;

type

  { Tt_infectologista_orcamento }

  Tt_infectologista_orcamento = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    db_txt_guia: TDBEdit;
    db_txt_id: TDBEdit;
    db_txt_id_paciente: TDBEdit;
    db_txt_nome: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txt_medico: TEdit;
    txt_total: TMaskEdit;
    txt_v_consulta: TMaskEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_infectologista_orcamento: Tt_infectologista_orcamento;
  a_guia: integer;
  unitario,v_total,v_consulta: Double;

implementation

{$R *.lfm}
uses dm, consulta_infectologista, infectologista_orcamento_pdf;

procedure CarregaItens(e_guia:integer);
begin

  DMC.query_itens.Close;
  DMC.query_itens.ParamByName('v1').AsInteger:=e_guia;
  DMC.query_itens.Open;

end;

procedure CarregaOrcamento(e_guia:integer);
begin

  DMC.query_orcamento.Close;
  DMC.query_orcamento.ParamByName('v1').AsInteger:=e_guia;
  DMC.query_orcamento.Open;

  v_total:=DMC.query_orcamento.Fields[0].Value;

end;

procedure CarregaValorConsulta(e_guia:integer);
begin

  DMC.dentista_valor_consulta.Close;
  DMC.dentista_valor_consulta.ParamByName('v1').AsInteger:=e_guia;
  DMC.dentista_valor_consulta.Open;

  unitario:=DMC.dentista_valor_consulta.Fields[0].Value;

end;

{ Tt_infectologista_orcamento }

procedure Tt_infectologista_orcamento.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMC.query_itens.Active:=false;
  DMC.dentista_valor_consulta.Active:=false;
  DMC.query_orcamento.Active:=false;
end;

procedure Tt_infectologista_orcamento.Button2Click(Sender: TObject);
var
  x_id: integer;
begin

  if db_txt_id.Text <> '' then
         begin

         x_id:=strtoint(db_txt_id.Text);

         DMC.delete_item.Close;
         DMC.delete_item.SQL.Clear;
         DMC.delete_item.SQL.Add('delete from consulta_item where id = :v1');
         DMC.delete_item.ParamByName('v1').AsInteger:=x_id;
         DMC.delete_item.ExecSQL;
         DMC.SQLTransaction1.Commit;
         DMC.delete_item.Active:=false;
         CarregaItens(a_guia);
         DMC.query_infectologista.Active:=false;
         DMC.query_infectologista.Active:=true;
         DMC.qr_agenda_medico.Active:=false;
         DMC.qr_agenda_medico.Active:=true;
         DMC.qr_verifica_medico.Active:=false;
         DMC.qr_verifica_medico.Active:=true;
         DMC.query_list_inf.Active:=false;
         DMC.query_list_inf.Active:=true;

         CarregaItens(a_guia);

         CarregaOrcamento(a_guia);

         CarregaValorConsulta(a_guia);

         v_consulta:=v_total+unitario;

         txt_v_consulta.Text:=floattostrF(unitario, ffFixed, 5, 2);

         txt_total.Text:=floattostrF(v_consulta, ffFixed, 5, 2);

         showmessage('Item Exluído com Sucesso');

         end
      else
          begin
               showmessage('Lista de Procedimentos Vazia.');
          end;

end;

procedure Tt_infectologista_orcamento.Button1Click(Sender: TObject);
begin
  t_infectologista_orcamento_pdf.RLOrcamento.Preview();
end;

procedure Tt_infectologista_orcamento.Button3Click(Sender: TObject);
var
  x_guia: integer;
  t_total: Double;
begin

  if db_txt_id.Text <> '' then
         begin

         x_guia:=strtoint(db_txt_guia.Text);
         t_total:=strtofloat(txt_total.Text);

         //DMC.qry_consulta.Active:=true;
         DMC.qry_consulta.Open;
         DMC.qry_consulta.SQL.Clear;
         DMC.qry_consulta.SQL.Add('update consulta set valor_total = :v1 where guia = :v2');
         DMC.qry_consulta.ParamByName('v1').Value:=t_total;
         DMC.qry_consulta.ParamByName('v2').AsInteger:=x_guia;
         DMC.qry_consulta.ExecSQL;
         DMC.SQLTransaction1.Commit;
         DMC.qry_consulta.Active:=false;
         CarregaItens(a_guia);
         DMC.query_infectologista.Active:=false;
         DMC.query_infectologista.Active:=true;
         DMC.qr_agenda_medico.Active:=false;
         DMC.qr_agenda_medico.Active:=true;
         DMC.qr_verifica_medico.Active:=false;
         DMC.qr_verifica_medico.Active:=true;
         DMC.query_list_inf.Active:=false;
         DMC.query_list_inf.Active:=true;

         showmessage('Orçamento Confirmado com Sucesso..');

         end
      else
          begin
               showmessage('Lista de Procedimentos Vazia.');
          end;

end;

procedure Tt_infectologista_orcamento.FormShow(Sender: TObject);
begin

  DMC.query_itens.Active:=true;
  DMC.dentista_valor_consulta.Active:=true;
  DMC.query_orcamento.Active:=true;

  db_txt_guia.Text:=t_consulta_infectologista.db_txt_guia.Text;
  db_txt_nome.Text:=t_consulta_infectologista.db_txt_nome.Text;
  db_txt_id_paciente.Text:=t_consulta_infectologista.db_txt_id_paciente.Text;

  a_guia:=strtoint(t_consulta_infectologista.db_txt_guia.Text);

  CarregaItens(a_guia);

  CarregaOrcamento(a_guia);

  CarregaValorConsulta(a_guia);

  v_consulta:=v_total+unitario;

  txt_v_consulta.Text:=floattostrF(unitario, ffFixed, 5, 2);

  txt_total.Text:=floattostrF(v_consulta, ffFixed, 5, 2);

  txt_medico.Text:=t_consulta_infectologista.Label9.Caption;

end;

end.

