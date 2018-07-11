unit relatorio_despesa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DbCtrls;

type

  { Tt_relatorio_despesa }

  Tt_relatorio_despesa = class(TForm)
    Button1: TButton;
    DBNavigator1: TDBNavigator;
    db_txt_total: TDBEdit;
    db_txt_valor: TDBEdit;
    db_txt_qtde: TDBEdit;
    db_txt_desc: TDBEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_relatorio_despesa: Tt_relatorio_despesa;

implementation

{$R *.lfm}
uses dmo, despesa, relatorio_gastos_pdf;

{ Tt_relatorio_despesa }

procedure Tt_relatorio_despesa.FormShow(Sender: TObject);
begin

  DMOS.query_despesa.Active:=true;
  DMOS.query_total.Active:=true;

  DMOS.query_despesa.Close;
  DMOS.query_despesa.ParamByName('d1').Value:=t_despesas.date_inicio.Date;
  DMOS.query_despesa.ParamByName('d2').Value:=t_despesas.date_fim.Date;
  DMOS.query_despesa.Open;

  if DMOS.query_despesa.RecordCount < 1 then
     begin
       DBNavigator1.Controls[0].Enabled:=false;
       DBNavigator1.Controls[1].Enabled:=false;
       DBNavigator1.Controls[2].Enabled:=false;
       DBNavigator1.Controls[3].Enabled:=false;
       DBNavigator1.Controls[4].Enabled:=false;
       DBNavigator1.Controls[5].Enabled:=false;
       DBNavigator1.Controls[6].Enabled:=false;
       DBNavigator1.Controls[7].Enabled:=false;
       DBNavigator1.Controls[8].Enabled:=false;
     end;

  DMOS.query_total.Close;
  DMOS.query_total.ParamByName('d1').Value:=t_despesas.date_inicio.Date;
  DMOS.query_total.ParamByName('d2').Value:=t_despesas.date_fim.Date;
  DMOS.query_total.Open;

end;

procedure Tt_relatorio_despesa.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMOS.query_despesa.Active:=false;
  DMOS.query_total.Active:=false;

end;

procedure Tt_relatorio_despesa.Button1Click(Sender: TObject);
begin
  t_relatorio_gastos_pdf.RLReport1.Preview();
end;

end.

