unit dm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, db, FileUtil, StdCtrls;

type

  { TDM }

  TDM = class(TDataModule)
    list_cardiologista: TDataSource;
    list_dentista: TDataSource;
    ds_list_dentista: TDataSource;
    ds_list_cardiologista: TDataSource;
    ds_list_oftalmo: TDataSource;
    ds_list_inf: TDataSource;
    ds_conv_plano: TDataSource;
    ds_plano: TDataSource;
    ds_material: TDataSource;
    ds_list_podologo: TDataSource;
    dsy_convenio: TDataSource;
    dsy_empresa: TDataSource;
    ds_empresa: TDataSource;
    ds_list_proc: TDataSource;
    ds_convenio: TDataSource;
    ds_lista_proc_dentista: TDataSource;
    ds_lista_proc: TDataSource;
    ds_d_valor_consulta: TDataSource;
    ds_orcamento: TDataSource;
    ds_itens: TDataSource;
    ds_dentista_proc: TDataSource;
    ds_agenda_medico: TDataSource;
    ds_dentista: TDataSource;
    ds_oftalmo: TDataSource;
    ds_agenda_diaria: TDataSource;
    ds_historico_paciente: TDataSource;
    ds_cardiologista: TDataSource;
    ds_infectologista: TDataSource;
    ds_podologo: TDataSource;
    ds_consultas: TDataSource;
    ds_agenda_medica: TDataSource;
    ds_paciente: TDataSource;
    ds_medico_ativo: TDataSource;
    ds_medico: TDataSource;
    ds_atendentes: TDataSource;
    ds_atendente: TDataSource;
    ds_login: TDataSource;
    ibSistema: TIBConnection;
    Label1: TLabel;
    qr_login: TSQLQuery;
    qr_atendente: TSQLQuery;
    qr_r_login: TSQLQuery;
    query_atendente: TSQLQuery;
    qr_v_login: TSQLQuery;
    qr_medico: TSQLQuery;
    query_medico: TSQLQuery;
    qr_medico_ativo: TSQLQuery;
    qr_paciente: TSQLQuery;
    query_paciente: TSQLQuery;
    q_medico: TSQLQuery;
    qr_consulta: TSQLQuery;
    qr_verifica_consulta: TSQLQuery;
    qr_verifica_atendente: TSQLQuery;
    query_consultas: TSQLQuery;
    query_podologo: TSQLQuery;
    qr_verifica_medico: TSQLQuery;
    qry_consulta: TSQLQuery;
    qr_procedimentos: TSQLQuery;
    qry1_consulta: TSQLQuery;
    query_infectologista: TSQLQuery;
    query_cardiologista: TSQLQuery;
    qr_historico_paciente: TSQLQuery;
    qr_agenda_diaria: TSQLQuery;
    query_oftalmo: TSQLQuery;
    query_dentista: TSQLQuery;
    qry_agenda_medica: TSQLQuery;
    qr_agenda_medico: TSQLQuery;
    qr_dentista_proc: TSQLQuery;
    query_dentista_proc: TSQLQuery;
    qr_item: TSQLQuery;
    query_itens: TSQLQuery;
    query_orcamento: TSQLQuery;
    dentista_valor_consulta: TSQLQuery;
    delete_item: TSQLQuery;
    qr_lista_proc: TSQLQuery;
    qr_lista_proc_dentista: TSQLQuery;
    qr_convenio: TSQLQuery;
    query_convenio: TSQLQuery;
    qr_list_proc: TSQLQuery;
    query_list_proc: TSQLQuery;
    qr_empresa: TSQLQuery;
    query_empresa: TSQLQuery;
    qry_empresa: TSQLQuery;
    qry_convenio: TSQLQuery;
    query_list_podologo: TSQLQuery;
    qr_material: TSQLQuery;
    query_material: TSQLQuery;
    qr_plano: TSQLQuery;
    query_plano: TSQLQuery;
    qr_conv_plano: TSQLQuery;
    query_list_inf: TSQLQuery;
    query_list_oftalmo: TSQLQuery;
    query_list_cardiologista: TSQLQuery;
    qr_hora: TSQLQuery;
    query_list_dentista: TSQLQuery;
    qry_list_dentista: TSQLQuery;
    qry_list_cardiologista: TSQLQuery;
    qry_plano: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure qr_list_procAfterDelete(DataSet: TDataSet);
    procedure qr_list_procAfterPost(DataSet: TDataSet);
    procedure query_atendenteAfterDelete(DataSet: TDataSet);
    procedure query_atendenteAfterPost(DataSet: TDataSet);
    procedure query_convenioAfterDelete(DataSet: TDataSet);
    procedure query_convenioAfterPost(DataSet: TDataSet);
    procedure query_dentista_procAfterDelete(DataSet: TDataSet);
    procedure query_dentista_procAfterPost(DataSet: TDataSet);
    procedure query_empresaAfterDelete(DataSet: TDataSet);
    procedure query_empresaAfterPost(DataSet: TDataSet);
    procedure query_materialAfterClose(DataSet: TDataSet);
    procedure query_materialAfterDelete(DataSet: TDataSet);
    procedure query_materialAfterPost(DataSet: TDataSet);
    procedure query_medicoAfterDelete(DataSet: TDataSet);
    procedure query_medicoAfterPost(DataSet: TDataSet);
    procedure query_pacienteAfterDelete(DataSet: TDataSet);
    procedure query_pacienteAfterPost(DataSet: TDataSet);
    procedure query_planoAfterDelete(DataSet: TDataSet);
    procedure query_planoAfterPost(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DMC: TDM;

implementation

{$R *.lfm}

{ TDM }

procedure TDM.query_atendenteAfterPost(DataSet: TDataSet);
begin

  if DMC.query_atendente.ChangeCount > 0 then
     begin
       DMC.query_atendente.ApplyUpdates(0);
       DMC.query_atendente.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_atendente.Active:=true;
     end;

end;

procedure TDM.query_convenioAfterDelete(DataSet: TDataSet);
begin

  if DMC.query_convenio.ChangeCount > 0 then
     begin
       DMC.query_convenio.ApplyUpdates(-1);
       DMC.query_convenio.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_convenio.Active:=true;
     end;

end;

procedure TDM.query_convenioAfterPost(DataSet: TDataSet);
begin

  if DMC.query_convenio.ChangeCount > 0 then
     begin
       DMC.query_convenio.ApplyUpdates(0);
       DMC.query_convenio.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_convenio.Active:=true;
     end;

end;

procedure TDM.query_dentista_procAfterDelete(DataSet: TDataSet);
begin

  if DMC.query_dentista_proc.ChangeCount > 0 then
     begin
       DMC.query_dentista_proc.ApplyUpdates(-1);
       DMC.query_dentista_proc.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_dentista_proc.Active:=true;
     end;

end;

procedure TDM.query_dentista_procAfterPost(DataSet: TDataSet);
begin

  if DMC.query_dentista_proc.ChangeCount > 0 then
     begin
       DMC.query_dentista_proc.ApplyUpdates(0);
       DMC.query_dentista_proc.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_dentista_proc.Active:=true;
     end;

end;

procedure TDM.query_empresaAfterDelete(DataSet: TDataSet);
begin

  if DMC.query_empresa.ChangeCount > 0 then
     begin
       DMC.query_empresa.ApplyUpdates(-1);
       DMC.query_empresa.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_empresa.Active:=true;
     end;

end;

procedure TDM.query_empresaAfterPost(DataSet: TDataSet);
begin

  if DMC.query_empresa.ChangeCount > 0 then
     begin
       DMC.query_empresa.ApplyUpdates(0);
       DMC.query_empresa.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_empresa.Active:=true;
     end;

end;

procedure TDM.query_materialAfterClose(DataSet: TDataSet);
begin

end;

procedure TDM.query_materialAfterDelete(DataSet: TDataSet);
begin

    if DMC.query_material.ChangeCount > 0 then
     begin
       DMC.query_material.ApplyUpdates(-1);
       DMC.query_material.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_material.Active:=true;
       DMC.qr_verifica_medico.Active:=true;

       DMC.query_podologo.Active:=false;
       DMC.query_podologo.Active:=true;
       DMC.query_list_podologo.Active:=false;
       DMC.query_list_podologo.Active:=true;

       DMC.query_oftalmo.Active:=false;
       DMC.query_oftalmo.Active:=true;
       DMC.query_list_oftalmo.Active:=false;
       DMC.query_list_oftalmo.Active:=true;

       DMC.query_dentista.Active:=false;
       DMC.query_dentista.Active:=true;
       DMC.qry_list_dentista.Active:=false;
       DMC.qry_list_dentista.Active:=true;

       DMC.query_cardiologista.Active:=false;
       DMC.query_cardiologista.Active:=true;
       DMC.query_list_cardiologista.Active:=false;
       DMC.query_list_cardiologista.Active:=true;

       DMC.query_infectologista.Active:=false;
       DMC.query_infectologista.Active:=true;
       DMC.query_list_inf.Active:=false;
       DMC.query_list_inf.Active:=true;

       DMC.qr_agenda_medico.Active:=false;
       DMC.qr_verifica_medico.Active:=false;
       DMC.qr_agenda_medico.Active:=true;
       DMC.qr_verifica_medico.Active:=true;
     end;

end;

procedure TDM.query_materialAfterPost(DataSet: TDataSet);
begin

  if DMC.query_material.ChangeCount > 0 then
     begin
       DMC.query_material.ApplyUpdates(0);
       DMC.query_material.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_material.Active:=true;
       DMC.qr_verifica_medico.Active:=true;

       DMC.query_podologo.Active:=false;
       DMC.query_podologo.Active:=true;
       DMC.query_list_podologo.Active:=false;
       DMC.query_list_podologo.Active:=true;

       DMC.query_oftalmo.Active:=false;
       DMC.query_oftalmo.Active:=true;
       DMC.query_list_oftalmo.Active:=false;
       DMC.query_list_oftalmo.Active:=true;

       DMC.query_dentista.Active:=false;
       DMC.query_dentista.Active:=true;
       DMC.qry_list_dentista.Active:=false;
       DMC.qry_list_dentista.Active:=true;

       DMC.query_cardiologista.Active:=false;
       DMC.query_cardiologista.Active:=true;
       DMC.query_list_cardiologista.Active:=false;
       DMC.query_list_cardiologista.Active:=true;

       DMC.query_infectologista.Active:=false;
       DMC.query_infectologista.Active:=true;
       DMC.query_list_inf.Active:=false;
       DMC.query_list_inf.Active:=true;

       DMC.qr_agenda_medico.Active:=false;
       DMC.qr_verifica_medico.Active:=false;
       DMC.qr_agenda_medico.Active:=true;
       DMC.qr_verifica_medico.Active:=true;
     end;

end;

procedure TDM.query_medicoAfterDelete(DataSet: TDataSet);
begin

  if DMC.query_medico.ChangeCount > 0 then
     begin
       DMC.query_medico.ApplyUpdates(-1);
       DMC.query_medico.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_medico.Active:=true;
     end;

end;

procedure TDM.query_medicoAfterPost(DataSet: TDataSet);
begin

  if DMC.query_medico.ChangeCount > 0 then
     begin
       DMC.query_medico.ApplyUpdates(0);
       DMC.query_medico.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_medico.Active:=true;
     end;

end;

procedure TDM.query_pacienteAfterDelete(DataSet: TDataSet);
begin

  if DMC.query_paciente.ChangeCount > 0 then
   begin
     DMC.query_paciente.ApplyUpdates(-1);
     DMC.query_paciente.Refresh;
     DMC.SQLTransaction1.Commit;
     DMC.query_paciente.Active:=true;
   end;

end;

procedure TDM.query_pacienteAfterPost(DataSet: TDataSet);
begin

    if DMC.query_paciente.ChangeCount > 0 then
     begin
       DMC.query_paciente.ApplyUpdates(0);
       DMC.query_paciente.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_paciente.Active:=true;
     end;

end;

procedure TDM.query_planoAfterDelete(DataSet: TDataSet);
begin

    if DMC.query_plano.ChangeCount > 0 then;
       begin
         DMC.query_plano.ApplyUpdates(-1);
         DMC.query_plano.Refresh;
         DMC.SQLTransaction1.Commit;
         DMC.query_plano.Active:=true;
       end;

end;

procedure TDM.query_planoAfterPost(DataSet: TDataSet);
begin

  if DMC.query_plano.ChangeCount > 0 then;
     begin
       DMC.query_plano.ApplyUpdates(0);
       DMC.query_plano.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_plano.Active:=true;
     end;

end;

procedure TDM.query_atendenteAfterDelete(DataSet: TDataSet);
begin

  if DMC.query_atendente.ChangeCount > 0 then
     begin
       DMC.query_atendente.ApplyUpdates(-1);
       DMC.query_atendente.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.query_atendente.Active:=true;
     end;
end;

procedure TDM.qr_list_procAfterPost(DataSet: TDataSet);
begin

  if DMC.qr_list_proc.ChangeCount > 0 then
     begin
       DMC.qr_list_proc.ApplyUpdates(0);
       DMC.qr_list_proc.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.qr_list_proc.Active:=true;
     end;

end;

procedure TDM.qr_list_procAfterDelete(DataSet: TDataSet);
begin

  if DMC.qr_list_proc.ChangeCount > 0 then
     begin
       DMC.qr_list_proc.ApplyUpdates(-1);
       DMC.qr_list_proc.Refresh;
       DMC.SQLTransaction1.Commit;
       DMC.qr_list_proc.Active:=true;
     end;

end;

end.

