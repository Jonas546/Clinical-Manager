unit lista_procedimentos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls, DBGrids;

type

  { Tt_procedimentos }

  Tt_procedimentos = class(TForm)
    grid_lista: TDBGrid;
    txt_medico: TEdit;
    Label3: TLabel;
    txt_paciente: TEdit;
    Label2: TLabel;
    txt_guia: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_procedimentos: Tt_procedimentos;
  esp:String;
  a_guia:integer;

implementation

{$R *.lfm}
uses dm, historico_paciente;

{ Tt_procedimentos }

procedure Tt_procedimentos.FormShow(Sender: TObject);
begin

  txt_guia.Text:=t_historico.db_txt_guia.Text;
  txt_paciente.Text:=t_historico.db_txt_paciente.Text;
  txt_medico.Text:=t_historico.db_txt_medico.Text;

  esp:=t_historico.db_txt_especialiade.Text;

  a_guia:=strtoint(txt_guia.Text);

  DMC.query_itens.Active:=true;

  DMC.query_itens.Close;
  DMC.query_itens.ParamByName('v1').AsInteger:=a_guia;
  DMC.query_itens.Open;

end;

procedure Tt_procedimentos.FormCreate(Sender: TObject);
begin

end;

procedure Tt_procedimentos.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMC.query_itens.Active:=false;

end;

end.

