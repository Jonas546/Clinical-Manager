unit home;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
    ExtCtrls, StdCtrls, DbCtrls, Clipbrd, Windows;

type

  { Tt_home }

  Tt_home = class(TForm)
    DBImage1: TDBImage;
    DBText1: TDBText;
    DBText2: TDBText;
    db_permission: TDBText;
    Label1: TLabel;
    lb_name: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    mn_nome: TMenuItem;
    mm234: TMenuItem;
    mn_config: TMenuItem;
    mn_gasto: TMenuItem;
    mm_rel: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    mm_paciente: TMenuItem;
    MenuItem7: TMenuItem;
    mm_sair: TMenuItem;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure mm234Click(Sender: TObject);
    procedure mm_gastoClick(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem29Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem35Click(Sender: TObject);
    procedure MenuItem36Click(Sender: TObject);
    procedure MenuItem37Click(Sender: TObject);
    procedure MenuItem38Click(Sender: TObject);
    procedure MenuItem39Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem40Click(Sender: TObject);
    procedure MenuItem41Click(Sender: TObject);
    procedure MenuItem42Click(Sender: TObject);
    procedure MenuItem43Click(Sender: TObject);
    procedure MenuItem44Click(Sender: TObject);
    procedure MenuItem45Click(Sender: TObject);
    procedure MenuItem46Click(Sender: TObject);
    procedure MenuItem47Click(Sender: TObject);
    procedure MenuItem48Click(Sender: TObject);
    procedure MenuItem49Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure mm_relClick(Sender: TObject);
    procedure mm_sairClick(Sender: TObject);
    procedure mn_gastoClick(Sender: TObject);
    procedure mn_nomeClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_home: Tt_home;

implementation

{$R *.lfm}

{ Tt_home }
uses dm, registrar_logotipo, dmo, resgistrar_atendente, gerenciar_atendentes, registrar_medico, gerenciar_medicos, registrar_paciente, gerenciar_paciente, agendamento, consultas, consulta_podologo, infectologista_agenda, consulta_cardiologista, agenda_diaria, consulta_oftalmo, consulta_dentista, podologo_agenda, prodedimento, dentista_agenda, registrar_convenio, gerenciar_convenio, podologo_procedimentos, registrar_empresa, gerenciar_empresas, registrar_plano, gerenciar_plano, lancamento_convenio, lancar_guia, infectologista_procedimentos, medico_relatorio, cardiologista_proc, cardiologista_agenda, oftalmo_agenda, oftalmo_proc, relatorio_financeiro, despesa, registar_gastos, nome_clinica;

function GetComputerNameFunc : string;
var ipbuffer : string;
      nsize : dword;
begin
   nsize := 255;
   SetLength(ipbuffer,nsize);
   if GetComputerName(pchar(ipbuffer),nsize) then
      result := ipbuffer;
end;

procedure Tt_home.mm_sairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tt_home.mn_gastoClick(Sender: TObject);
begin
  t_registrar_gastos.ShowModal;
end;

procedure Tt_home.mn_nomeClick(Sender: TObject);
begin
  t_nome_clinica.ShowModal;
end;

procedure Tt_home.MenuItem2Click(Sender: TObject);
begin
  t_registrar_atendente.ShowModal;
end;

procedure Tt_home.MenuItem35Click(Sender: TObject);
begin
  t_lancamento_convenio.ShowModal;
end;

procedure Tt_home.MenuItem36Click(Sender: TObject);
begin
  t_convenio.ShowModal;
end;

procedure Tt_home.MenuItem37Click(Sender: TObject);
begin
  t_gerenciar_convenio.ShowModal;
end;

procedure Tt_home.MenuItem38Click(Sender: TObject);
begin
  t_podologo_procedimentos.ShowModal;
end;

procedure Tt_home.MenuItem39Click(Sender: TObject);
begin

end;

procedure Tt_home.FormShow(Sender: TObject);
var
  permission:integer;
  usuario:String;
begin

  DMC.ibSistema.HostName:=GetComputerNameFunc;
  DMC.ibSistema.Connected:=true;
  DMC.SQLTransaction1.Active:=true;

  DMOS.ibSistema2.HostName:=GetComputerNameFunc;
  DMOS.ibSistema2.Connected:=true;
  DMOS.SQLTransaction1.Active:=true;

  DMOS.query_config.Active:=true;

  DMOS.query_config.Close;
  DMOS.query_config.Open;

  if DMOS.query_config.IsEmpty=false then
    begin

      lb_name.Caption:=DMOS.query_config.Fields[1].AsString;
      DBImage1.Picture.LoadFromFile(DMOS.query_config.Fields[2].AsString);

    end;

  permission := strtoint(db_permission.Caption);
  usuario := DBText2.Caption;
  Label1.Caption := usuario;

  if (permission = 1) or (permission = 4) then
     begin
          MenuItem8.Enabled:=true;
          MenuItem1.Enabled:=true;
          mm_paciente.Enabled:=true;
          MenuItem19.Enabled:=true;
          mn_gasto.Enabled:=true;
          mm_rel.Enabled:=true;
     end;

  if (permission = 2) or (permission = 3) or (permission = 5) or (permission = 6) or (permission = 7) or (permission = 4) then
     begin
          MenuItem11.Enabled:=true;
          MenuItem49.Enabled:=true;
     end;

  if (permission = 3) or (permission = 4) then
     begin
          MenuItem12.Enabled:=true;
     end;

  if (permission = 2) or (permission = 4) then
     begin
          MenuItem13.Enabled:=true;
     end;

  if (permission = 6) or (permission = 4) then
     begin
          MenuItem14.Enabled:=true;
     end;

  if (permission = 5) or (permission = 4) then
     begin
          MenuItem15.Enabled:=true;
     end;

  if (permission = 7) or (permission = 4)  then
     begin
          MenuItem16.Enabled:=true;
     end;

  if permission = 4 then
     begin
          mn_config.Enabled:=true;
     end;

end;

procedure Tt_home.FormCreate(Sender: TObject);
begin

end;

procedure Tt_home.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DMOS.query_config.Active:=false;
end;

procedure Tt_home.MenuItem10Click(Sender: TObject);
begin
  t_consultas.ShowModal;
end;

procedure Tt_home.MenuItem12Click(Sender: TObject);
begin
  //t_consulta_oftalmo.ShowModal;
end;

procedure Tt_home.MenuItem14Click(Sender: TObject);
begin

end;

procedure Tt_home.MenuItem15Click(Sender: TObject);
begin

end;

procedure Tt_home.MenuItem17Click(Sender: TObject);
begin
  t_oftalmo_agenda.ShowModal;
end;

procedure Tt_home.MenuItem18Click(Sender: TObject);
begin
  t_oftalmo_proc.ShowModal;
end;

procedure Tt_home.MenuItem19Click(Sender: TObject);
begin
  t_relatorio_financeiro.ShowModal;
end;

procedure Tt_home.MenuItem20Click(Sender: TObject);
begin
  t_podologo_agenda.ShowModal;
end;

procedure Tt_home.MenuItem21Click(Sender: TObject);
begin
  t_infectologista_agenda.ShowModal;
end;

procedure Tt_home.mm234Click(Sender: TObject);
begin
  t_logotipo.ShowModal;
end;

procedure Tt_home.mm_gastoClick(Sender: TObject);
begin
  t_consulta_cardiologista.ShowModal;
end;

procedure Tt_home.MenuItem24Click(Sender: TObject);
begin
  t_agenda_diaria.ShowModal;
end;

procedure Tt_home.MenuItem25Click(Sender: TObject);
begin
  t_dentista_atendimento.ShowModal;
end;

procedure Tt_home.MenuItem26Click(Sender: TObject);
begin
  //t_podologo_relatorio_semanal.ShowModal;
end;

procedure Tt_home.MenuItem27Click(Sender: TObject);
begin
  //t_podologo_relatorio_mensal.ShowModal;
end;

procedure Tt_home.MenuItem28Click(Sender: TObject);
begin
  //t_podologo_rel_anual.ShowModal;
end;

procedure Tt_home.MenuItem29Click(Sender: TObject);
begin
  t_procedimento.ShowModal;
end;

procedure Tt_home.MenuItem3Click(Sender: TObject);
begin
  t_gerenciar_atendentes.ShowModal;
end;

procedure Tt_home.MenuItem40Click(Sender: TObject);
begin
  t_registrar_empresa.ShowModal;
end;

procedure Tt_home.MenuItem41Click(Sender: TObject);
begin
  t_gerenciar_empresa.ShowModal;
end;

procedure Tt_home.MenuItem42Click(Sender: TObject);
begin
  t_registrar_plano.ShowModal;
end;

procedure Tt_home.MenuItem43Click(Sender: TObject);
begin
  t_gerenciar_plano.ShowModal;
end;

procedure Tt_home.MenuItem44Click(Sender: TObject);
begin
  t_lancar_guia.ShowModal;
end;

procedure Tt_home.MenuItem45Click(Sender: TObject);
begin
  t_inf_procedimentos.ShowModal;
end;

procedure Tt_home.MenuItem46Click(Sender: TObject);
begin

end;

procedure Tt_home.MenuItem47Click(Sender: TObject);
begin
  t_cardiologista_agenda.ShowModal;
end;

procedure Tt_home.MenuItem48Click(Sender: TObject);
begin

  t_cardiologista_proc.ShowModal;

end;

procedure Tt_home.MenuItem49Click(Sender: TObject);
begin
  t_medico_relatorio.ShowModal;
end;

procedure Tt_home.MenuItem4Click(Sender: TObject);
begin
  t_registrar_medico.ShowModal;
end;

procedure Tt_home.MenuItem5Click(Sender: TObject);
begin
  t_gerenciar_medico.ShowModal;
end;

procedure Tt_home.MenuItem6Click(Sender: TObject);
begin
  t_gerenciar_pacientes.ShowModal;
end;

procedure Tt_home.MenuItem7Click(Sender: TObject);
begin
  t_registrar_paciente.ShowModal;
end;

procedure Tt_home.MenuItem9Click(Sender: TObject);
begin
  t_agendamento.ShowModal;
end;

procedure Tt_home.mm_relClick(Sender: TObject);
begin
  t_despesas.ShowModal;
end;

end.

