unit agenda_diaria_pdf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport, DateUtils;

type

  { Tt_agenda_pdf }

  Tt_agenda_pdf = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLLabel1: TRLLabel;
    RLAgenda: TRLReport;
    lb_data: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    procedure RLAgendaBeforePrint(Sender: TObject; var PrintIt: boolean);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_agenda_pdf: Tt_agenda_pdf;

implementation

{$R *.lfm}

{ Tt_agenda_pdf }
uses dm, agenda_diaria;

procedure Tt_agenda_pdf.RLAgendaBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin

  lb_data.Caption:=t_agenda_diaria.txt_data.Text;

  if lb_data.Caption = '' then
     begin
          lb_data.Caption:=datetostr(now);
     end;

end;

end.

