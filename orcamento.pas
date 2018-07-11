unit orcamento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DbCtrls, Buttons, MaskEdit;

type

  { Tt_orcamento }

  Tt_orcamento = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    db_txt_id: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    db_txt_guia: TDBEdit;
    db_txt_id_paciente: TDBEdit;
    db_txt_nome: TDBEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    txt_v_consulta: TMaskEdit;
    txt_total: TMaskEdit;
    txt_medico: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_orcamento: Tt_orcamento;
  a_guia: integer;
  unitario,v_total,v_consulta: Double;

implementation

{$R *.lfm}
uses dm, consulta_dentista, orcamento_pdf;

{ Tt_orcamento }

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

procedure Tt_orcamento.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  DMC.query_itens.Active:=false;
  DMC.dentista_valor_consulta.Active:=false;
  DMC.query_orcamento.Active:=false;
end;

procedure Tt_orcamento.Button2Click(Sender: TObject);
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
     DMC.query_dentista.Active:=false;
     DMC.query_dentista.Active:=true;
     DMC.qr_agenda_medico.Active:=false;
     DMC.qr_agenda_medico.Active:=true;
     DMC.qr_verifica_medico.Active:=false;
     DMC.qr_verifica_medico.Active:=true;
     DMC.query_dentista_proc.Active:=false;
     DMC.query_dentista_proc.Active:=true;

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

procedure Tt_orcamento.Button1Click(Sender: TObject);
begin
  t_orcamento_pdf.RLOrcamento.Preview();
end;

procedure Tt_orcamento.Button3Click(Sender: TObject);
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
     DMC.query_dentista.Active:=false;
     DMC.query_dentista.Active:=true;
     DMC.qr_agenda_medico.Active:=false;
     DMC.qr_agenda_medico.Active:=true;
     DMC.qr_verifica_medico.Active:=false;
     DMC.qr_verifica_medico.Active:=true;
     DMC.query_dentista_proc.Active:=false;
     DMC.query_dentista_proc.Active:=true;

     showmessage('Orçamento Confirmado com Sucesso..');

     end
  else
      begin
           showmessage('Lista de Procedimentos Vazia.');
      end;

end;

procedure Tt_orcamento.FormCreate(Sender: TObject);
begin

end;

procedure Tt_orcamento.FormShow(Sender: TObject);
begin

  DMC.query_itens.Active:=true;
  DMC.dentista_valor_consulta.Active:=true;
  DMC.query_orcamento.Active:=true;
 //DMC.delete_item.Active:=true;

  a_guia:=strtoint(t_consulta_dentista.db_txt_guia.Text);

  CarregaItens(a_guia);

  CarregaOrcamento(a_guia);

  CarregaValorConsulta(a_guia);

  v_consulta:=v_total+unitario;

  txt_v_consulta.Text:=floattostrF(unitario, ffFixed, 5, 2);

  txt_total.Text:=floattostrF(v_consulta, ffFixed, 5, 2);

  txt_medico.Text:=t_consulta_dentista.Label9.Caption;

  //Label6.Caption:=floattostr(unitario);

end;

end.

