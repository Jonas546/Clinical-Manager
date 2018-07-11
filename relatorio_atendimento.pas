unit relatorio_atendimento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DbCtrls;

type

  { Tt_relatorio_atendimento }

  Tt_relatorio_atendimento = class(TForm)
    Button1: TButton;
    db_txt_valor: TDBEdit;
    db_txt_matricula: TDBEdit;
    DBNavigator1: TDBNavigator;
    db_txt_par: TDBEdit;
    db_txt_meio: TDBEdit;
    db_txt_plano: TDBEdit;
    db_txt_convenio: TDBEdit;
    db_txt_paciente: TDBEdit;
    db_txt_guia: TDBEdit;
    db_txt_tipo: TDBEdit;
    DBGrid1: TDBGrid;
    grid_proc: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure db_txt_guiaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_relatorio_atendimento: Tt_relatorio_atendimento;
  a_guia,key: integer;

implementation

{$R *.lfm}

{ Tt_relatorio_atendimento }
uses dmo, medico_relatorio, relatorio_atendimento_pdf;

procedure CarregaProcedimentos(x_guia:integer);
begin

  DMOS.query_proc.Close;
  DMOS.query_proc.ParamByName('v1').AsInteger:=x_guia;
  DMOS.query_proc.Open;

end;

procedure Tt_relatorio_atendimento.FormShow(Sender: TObject);
begin

  DMOS.qr_consulta_rel.Active:=true;

  with t_medico_relatorio do
    begin

      grid_proc.Enabled:=true;
      key := strtoint(Label3.Caption);

      DMOS.qr_consulta_rel.Close;
      DMOS.qr_consulta_rel.ParamByName('v1').AsInteger:=key;
      DMOS.qr_consulta_rel.ParamByName('d1').Value:=date_inicio.Date;
      DMOS.qr_consulta_rel.ParamByName('d2').Value:=date_fim.Date;
      DMOS.qr_consulta_rel.Open;

      if rb_com.Checked=true then
        begin

          DMOS.query_proc.Active:=true;

        end;

    end;

end;

procedure Tt_relatorio_atendimento.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  with t_medico_relatorio do
    begin

      if rb_com.Checked=true then
        begin

          DMOS.query_proc.Active:=false;
          grid_proc.Enabled:=false;

        end;

    end;

end;

procedure Tt_relatorio_atendimento.db_txt_guiaChange(Sender: TObject);
begin

  with t_medico_relatorio do
    begin

      if rb_com.Checked=true then
        begin

          if db_txt_guia.Text <> '' then
             begin

                  a_guia:=strtoint(db_txt_guia.Text);
                  CarregaProcedimentos(a_guia);

             end;

        end;

    end;

end;

procedure Tt_relatorio_atendimento.Button1Click(Sender: TObject);
begin
  t_relatorio_atendimento_pdf.RLRelMedico.Preview();
end;

end.

