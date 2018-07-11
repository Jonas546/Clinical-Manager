unit historico_paciente_pdf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { Tt_historico_pdf }

  Tt_historico_pdf = class(TForm)
    lb_content: TRLLabel;
    lb_convenio: TRLLabel;
    lb_desc: TRLLabel;
    lb_empresa: TRLLabel;
    lb_plano: TRLLabel;
    lb_rg: TRLLabel;
    lb_cpf: TRLLabel;
    lb_sexo: TRLLabel;
    lb_nasc: TRLLabel;
    lb_id: TRLLabel;
    lb_unit: TRLLabel;
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
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
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
    lb_valor: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel2: TRLLabel;
    lb_nome: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLHistorico: TRLReport;
    RLProc: TRLSubDetail;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    procedure RLBand1AfterPrint(Sender: TObject);
    procedure RLBand5AfterPrint(Sender: TObject);
    procedure RLHistoricoAfterPrint(Sender: TObject);
    procedure RLHistoricoBeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure RLHistoricoPageEnding(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_historico_pdf: Tt_historico_pdf;
  a_guia:integer;

implementation

{$R *.lfm}

{ Tt_historico_pdf }
uses dm, historico_paciente;

procedure Tt_historico_pdf.RLHistoricoBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin

  DMC.query_itens.Active:=true;

  with t_historico do
  begin

  if db_txt_guia.Text <> '' then
     begin
       a_guia:=strtoint(db_txt_guia.Text);
     end
  else
      begin
      a_guia:=0;
      end;

  DMC.query_itens.Close;
  DMC.query_itens.ParamByName('v1').AsInteger:=a_guia;
  DMC.query_itens.Open;

  if rb_cproc.Checked=true then
     begin

       RLProc.Visible:=true;
       lb_content.Visible:=false;
       lb_desc.Visible:=true;
       lb_unit.Visible:=true;

     end
  else
      begin

       RLProc.Visible:=false;
       lb_content.Visible:=true;
       lb_desc.Visible:=false;
       lb_unit.Visible:=false;

      end;

  lb_nome.Caption:=db_txt_paciente.Text;
  lb_sexo.Caption:=db_txt_sexo.Text;
  lb_nasc.Caption:=db_txt_nasc.Text;
  lb_id.Caption:=db_txt_matricula.Text;
  lb_rg.Caption:=db_txt_rg.Text;
  lb_cpf.Caption:=db_txt_cpf.Text;
  lb_convenio.Caption:=db_txt_convenio.Text;
  lb_plano.Caption:=db_txt_plano.Text;
  lb_empresa.Caption:=db_txt_empresa.Text;
  lb_valor.Caption:=db_txt_valor.Text;

  end;

end;

procedure Tt_historico_pdf.RLHistoricoPageEnding(Sender: TObject);
begin

       DMC.query_itens.Active:=false;

       RLProc.Visible:=false;
       lb_content.Visible:=true;
       lb_desc.Visible:=false;
       lb_unit.Visible:=false;

end;

procedure Tt_historico_pdf.RLBand1AfterPrint(Sender: TObject);
begin

end;

procedure Tt_historico_pdf.RLBand5AfterPrint(Sender: TObject);
begin

end;

procedure Tt_historico_pdf.RLHistoricoAfterPrint(Sender: TObject);
begin

end;

end.

