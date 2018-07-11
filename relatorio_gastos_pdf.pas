unit relatorio_gastos_pdf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { Tt_relatorio_gastos_pdf }

  Tt_relatorio_gastos_pdf = class(TForm)
    lb_fim: TRLLabel;
    lb_inicio: TRLLabel;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLReport1: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: boolean);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_relatorio_gastos_pdf: Tt_relatorio_gastos_pdf;

implementation

{$R *.lfm}

{ Tt_relatorio_gastos_pdf }
uses dmo, despesa;

procedure Tt_relatorio_gastos_pdf.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin

  with t_despesas do
   begin

     lb_inicio.Caption:=Datetostr(date_inicio.Date);
     lb_fim.Caption:=Datetostr(date_fim.Date);

   end;

end;

end.

