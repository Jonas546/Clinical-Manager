unit dmo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, db, FileUtil;

type

  { TDMO }

  TDMO = class(TDataModule)
    ds_valor_total: TDataSource;
    ds_despesa: TDataSource;
    ds_total: TDataSource;
    ds_fechamento: TDataSource;
    ds_soma: TDataSource;
    ds_consulta_rel: TDataSource;
    ds_empresa: TDataSource;
    ds_guia_conv: TDataSource;
    ds_material: TDataSource;
    ds_proc: TDataSource;
    ds_plano: TDataSource;
    ds_convenio: TDataSource;
    ds_medicos: TDataSource;
    ds_convenios: TDataSource;
    IbSistema2: TIBConnection;
    query_convenios: TSQLQuery;
    query_proc: TSQLQuery;
    query_material: TSQLQuery;
    query_medicos: TSQLQuery;
    query_convenio: TSQLQuery;
    query_plano: TSQLQuery;
    query_guia_convenio: TSQLQuery;
    qr_guia_conv: TSQLQuery;
    qr_conv_lanc: TSQLQuery;
    qr_empresa: TSQLQuery;
    qr_consulta_rel: TSQLQuery;
    qr_soma: TSQLQuery;
    qr_fechamento: TSQLQuery;
    qr_total: TSQLQuery;
    query_despesa: TSQLQuery;
    query_total: TSQLQuery;
    qr_despesa: TSQLQuery;
    qr_config: TSQLQuery;
    query_config: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DMOS: TDMO;

implementation

{$R *.lfm}

end.

