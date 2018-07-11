unit lancar_guia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, DateTimePicker, Forms,
  Controls, Graphics, Dialogs, StdCtrls, DbCtrls, DBGrids, DateUtils;

type

  { Tt_lancar_guia }

  Tt_lancar_guia = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    db_txt_esp: TDBEdit;
    db_txt_doc: TDBEdit;
    db_txt_medico: TDBEdit;
    db_txt_valor: TDBEdit;
    db_txt_emp: TDBEdit;
    db_txt_plano: TDBEdit;
    db_txt_conv: TDBEdit;
    db_txt_mat: TDBEdit;
    db_txt_paciente: TDBEdit;
    db_txt_pref: TDBEdit;
    db_txt_tipo: TDBEdit;
    db_txt_hora: TDBEdit;
    db_txt_data: TDBEdit;
    db_txt_guia: TDBEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_lancar_guia: Tt_lancar_guia;
  a_guia:integer;

implementation

{$R *.lfm}

{ Tt_lancar_guia }
uses dmo;

procedure Tt_lancar_guia.FormShow(Sender: TObject);
begin

  DMOS.query_guia_convenio.Active:=true;

end;

procedure Tt_lancar_guia.FormCreate(Sender: TObject);
begin

  DMOS.qr_guia_conv.Active:=true;
  DMOS.qr_conv_lanc.Active:=true;

end;

procedure Tt_lancar_guia.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  DMOS.qr_guia_conv.Active:=false;
  DMOS.query_guia_convenio.Active:=false;
  DMOS.qr_conv_lanc.Active:=false;

end;

procedure Tt_lancar_guia.Button1Click(Sender: TObject);
var
  st:String;
begin

  a_guia := strtoint(db_txt_guia.Text);
  st := 'N.Enviado';

  if db_txt_guia.Text = '' then
  begin
       showmessage('Nenhuma Guia Selecionada.')
  end
  else
  begin

  DMOS.qr_guia_conv.Close;
  DMOS.qr_guia_conv.SQL.Clear;
  DMOS.qr_guia_conv.SQL.Add('update consulta set data_entrega = :v1 where guia = :v2');
  DMOS.qr_guia_conv.ParamByName('v1').Value:=now;
  DMOS.qr_guia_conv.ParamByName('v2').AsInteger:=a_guia;
  DMOS.qr_guia_conv.ExecSQL;

  DMOS.qr_conv_lanc.Close;
  DMOS.qr_conv_lanc.SQL.Clear;
  DMOS.qr_conv_lanc.SQL.Add('insert into convenio_lancamento (data_entrega, cod_guia, status) values (:v1, :v2, :v3)');
  DMOS.qr_conv_lanc.ParamByName('v1').Value:=now;
  DMOS.qr_conv_lanc.ParamByName('v2').AsInteger:=a_guia;
  DMOS.qr_conv_lanc.ParamByName('v3').AsString:=st;
  DMOS.qr_conv_lanc.ExecSQL;

  DMOS.SQLTransaction1.Commit;
  DMOS.query_guia_convenio.Active:=false;
  DMOS.query_guia_convenio.Active:=true;
  showmessage('Guia Lançada com Sucesso.');

  end;

end;

end.

