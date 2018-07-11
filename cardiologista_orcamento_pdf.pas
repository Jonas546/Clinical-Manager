unit cardiologista_orcamento_pdf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { Tcardiologista_orcamento_pdf }

  Tcardiologista_orcamento_pdf = class(TForm)
    lb_data: TRLLabel;
    lb_guia: TRLLabel;
    lb_hora: TRLLabel;
    lb_mat: TRLLabel;
    lb_medico: TRLLabel;
    lb_paciente: TRLLabel;
    lb_tipo: TRLLabel;
    lb_total: TRLLabel;
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
    RLLabel12: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLOrcamento: TRLReport;
    procedure RLOrcamentoBeforePrint(Sender: TObject; var PrintIt: boolean);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_cardiologista_orcamento_pdf: Tcardiologista_orcamento_pdf;

implementation

{$R *.lfm}
uses dm, cardiologista_orcamento, consulta_cardiologista;

{ Tcardiologista_orcamento_pdf }

procedure Tcardiologista_orcamento_pdf.RLOrcamentoBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin

  with t_consulta_cardiologista do
         begin

           lb_guia.Caption:=db_txt_guia.Text;
           lb_paciente.Caption:=db_txt_nome.Text;
           lb_mat.Caption:=db_txt_id_paciente.Text;
           lb_medico.Caption:=Label9.Caption;
           lb_data.Caption:=db_txt_data.Text;
           lb_hora.Caption:=db_txt_hora.Text;
           lb_tipo.Caption:=db_txt_tipo.Text;

         end;

    with t_cardiologista_orcamento do
         begin

         lb_total.Caption:=txt_total.Text;
         end;

end;

end.

