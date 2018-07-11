unit relatorio_atendimento_pdf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { Tt_relatorio_atendimento_pdf }

  Tt_relatorio_atendimento_pdf = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLBand8: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLGroup1: TRLGroup;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    lb_medico: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    lb_inicio: TRLLabel;
    RLLabel7: TRLLabel;
    lb_fim: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLRelMedico: TRLReport;
    RLProc: TRLSubDetail;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    procedure RLRelMedicoBeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure RLRelMedicoPageEnding(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_relatorio_atendimento_pdf: Tt_relatorio_atendimento_pdf;
  key:integer;

implementation

{$R *.lfm}

{ Tt_relatorio_atendimento_pdf }
uses dmo, relatorio_atendimento, medico_relatorio;

procedure Tt_relatorio_atendimento_pdf.RLRelMedicoBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin

  with t_medico_relatorio do
    begin

      lb_medico.Caption:=Label2.Caption;
      lb_inicio.Caption:=Datetostr(date_inicio.Date);
      lb_fim.Caption:=Datetostr(date_fim.Date);

      if rb_com.Checked=true then
        begin
          RLProc.Visible:=true;
        end;

      key:=strtoint(Label3.Caption);

      DMOS.qr_soma.Active:=true;

      DMOS.qr_soma.Close;
      DMOS.qr_soma.ParamByName('v1').AsInteger:=key;
      DMOS.qr_soma.ParamByName('d1').Value:=date_inicio.Date;
      DMOS.qr_soma.ParamByName('d2').Value:=date_fim.Date;
      DMOS.qr_soma.Open;

    end;

end;

procedure Tt_relatorio_atendimento_pdf.RLRelMedicoPageEnding(Sender: TObject);
begin

  DMOS.qr_soma.Active:=true;

  with t_medico_relatorio do
    begin

    if rb_com.Checked=true then
       begin
            RLProc.Visible:=false;
       end;

    end;

end;

end.

