unit orcamento_pdf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { Tt_orcamento_pdf }

  Tt_orcamento_pdf = class(TForm)
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLBand8: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    lb_v_consulta: TRLLabel;
    RLLabel2: TRLLabel;
    lb_paciente: TRLLabel;
    RLLabel3: TRLLabel;
    lb_guia: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    lb_matricula: TRLLabel;
    lb_medico: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    lb_total: TRLLabel;
    RLLabel9: TRLLabel;
    RLOrcamento: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    procedure RLOrcamentoBeforePrint(Sender: TObject; var PrintIt: boolean);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_orcamento_pdf: Tt_orcamento_pdf;

implementation

{$R *.lfm}

{ Tt_orcamento_pdf }
uses dm, orcamento;

procedure Tt_orcamento_pdf.RLOrcamentoBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin

   lb_paciente.Caption:=t_orcamento.db_txt_nome.Text;
   lb_guia.Caption:=t_orcamento.db_txt_guia.Text;
   lb_matricula.Caption:=t_orcamento.db_txt_id_paciente.Text;
   lb_medico.Caption:=t_orcamento.txt_medico.Text;
   lb_total.Caption:=t_orcamento.txt_total.Text;
   lb_v_consulta.Caption:=t_orcamento.txt_v_consulta.Text;

end;

end.

