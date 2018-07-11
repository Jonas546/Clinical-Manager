program clinica;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, inicial, login, dm, home, resgistrar_atendente, gerenciar_atendentes,
  criar_login_atendente, registrar_medico, gerenciar_medicos,
  criar_login_medico, registrar_paciente, gerenciar_paciente, datetimectrls,
  agendamento, agenda_medica, consultas, consulta_podologo,
  consulta_infectologista, consulta_cardiologista, fortes324forlaz,
  historico_paciente, historico_paciente_pdf, agenda_diaria, consulta_oftalmo,
  consulta_dentista, agenda_diaria_pdf, podologo_agenda, dentista_agenda,
  prodedimento, gerenciar_procedimento, gerenciar_procedimentos, orcamento,
  orcamento_pdf, lancamento_convenio, lista_procedimentos, registrar_convenio,
  gerenciar_convenio, podologo_orcamento, podologo_procedimentos,
  podologo_gerenciar_proc, registrar_empresa, gerenciar_empresas,
  podologo_materiais, registrar_plano, gerenciar_plano, dmo, relatorio_convenio,
  lancar_guia, relatorio_convenio_pdf, dentista_materiais,
  podologo_orcamento_pdf, dentista_orcamento_pdf, infectologista_agenda,
  infectologista_orcamento, infectologista_orcamento_pdf,
  infectologista_procedimentos, inf_gerenciar_proc, infectologista_materiais,
  cardiologista_procedimentos, cardiologista_gerenciar_proc,
  relatorio_convenio_pdf2, relatorio_convenio_pdf3, relatorio_convenio_pdf4,
  relatorio_convenio_pdf5, relatorio_convenio_pdf6, medico_relatorio,
  relatorio_atendimento, relatorio_atendimento_pdf, cardiologista_proc,
  cardiologista_agenda, cardiologista_orcamento, cardiologista_materiais,
  cardiologista_orcamento_pdf, oftalmo_proc, oftalmo_gerenciar_proc,
  oftalmo_agenda, oftalmo_orcamento, oftalmo_orcamento_pdf, oftalmo_materiais,
  relatorio_financeiro, visualiza_financeiro, relatorio_financeiro_pdf, despesa,
  relatorio_despesa, registar_gastos, relatorio_gastos_pdf, nome_clinica, 
registrar_logotipo, relatorio_convenio_2pdf, dentista_gerenciar_proc;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(Tt_inicial, t_inicial);
  Application.CreateForm(Tt_login, t_login);
  Application.CreateForm(TDM, DMC);
  Application.CreateForm(Tt_home, t_home);
  Application.CreateForm(Tt_registrar_atendente, t_registrar_atendente);
  Application.CreateForm(Tgerenciar_atendentes, t_gerenciar_atendentes);
  Application.CreateForm(Tlogin_atendente, t_login_atendente);
  Application.CreateForm(Tt_registrar_medico, t_registrar_medico);
  Application.CreateForm(Tt_gerenciar_medico, t_gerenciar_medico);
  Application.CreateForm(Tcriar_login_medico, t_criar_login_medico);
  Application.CreateForm(Tt_registrar_paciente, t_registrar_paciente);
  Application.CreateForm(Tt_gerenciar_pacientes, t_gerenciar_pacientes);
  Application.CreateForm(Tt_agendamento, t_agendamento);
  Application.CreateForm(Tt_agenda_medica, t_agenda_medica);
  Application.CreateForm(Tt_consultas, t_consultas);
  Application.CreateForm(Tt_consulta_podologo, t_consulta_podologo);
  Application.CreateForm(Tt_consulta_infectologista, t_consulta_infectologista);
  Application.CreateForm(Tt_consulta_cardiologista, t_consulta_cardiologista);
  Application.CreateForm(Tt_historico, t_historico);
  Application.CreateForm(Tt_historico_pdf, t_historico_pdf);
  Application.CreateForm(Tt_agenda_diaria, t_agenda_diaria);
  Application.CreateForm(Tt_consulta_oftalmo, t_consulta_oftalmo);
  Application.CreateForm(Tt_consulta_dentista, t_consulta_dentista);
  Application.CreateForm(Tt_agenda_pdf, t_agenda_pdf);
  Application.CreateForm(Tt_podologo_agenda, t_podologo_agenda);
  Application.CreateForm(Tt_dentista_atendimento, t_dentista_atendimento);
  Application.CreateForm(Tt_procedimento, t_procedimento);
  Application.CreateForm(Tt_gerenciar_proc, t_gerenciar_proc);
  Application.CreateForm(Tt_gerenciar_procedimentos, t_gerenciar_procedimentos);
  Application.CreateForm(Tt_orcamento, t_orcamento);
  Application.CreateForm(Tt_orcamento_pdf, t_orcamento_pdf);
  Application.CreateForm(Tt_lancamento_convenio, t_lancamento_convenio);
  Application.CreateForm(Tt_procedimentos, t_procedimentos);
  Application.CreateForm(Tt_convenio, t_convenio);
  Application.CreateForm(Tt_gerenciar_convenio, t_gerenciar_convenio);
  Application.CreateForm(Tt_podologo_orcamento, t_podologo_orcamento);
  Application.CreateForm(Tt_podologo_procedimentos, t_podologo_procedimentos);
  Application.CreateForm(Tt_po_gerenciar_procedimentos, 
    t_po_gerenciar_procedimentos);
  Application.CreateForm(Tt_registrar_empresa, t_registrar_empresa);
  Application.CreateForm(Tt_gerenciar_empresa, t_gerenciar_empresa);
  Application.CreateForm(Tt_podologo_materiais, t_podologo_materiais);
  Application.CreateForm(Tt_registrar_plano, t_registrar_plano);
  Application.CreateForm(Tt_gerenciar_plano, t_gerenciar_plano);
  Application.CreateForm(TDMO, DMOS);
  Application.CreateForm(Tt_relatorio_convenio, t_relatorio_convenio);
  Application.CreateForm(Tt_lancar_guia, t_lancar_guia);
  Application.CreateForm(Tt_relatorio_convenio_pdf, t_relatorio_convenio_pdf);
  Application.CreateForm(Tt_dentista_materiais, t_dentista_materiais);
  Application.CreateForm(Tt_podologo_orcamento_pdf, t_podologo_orcamento_pdf);
  Application.CreateForm(Tt_dentista_orcamento_pdf, t_dentista_orcamento_pdf);
  Application.CreateForm(Tt_infectologista_agenda, t_infectologista_agenda);
  Application.CreateForm(Tt_infectologista_orcamento, t_infectologista_orcamento
    );
  Application.CreateForm(Tt_infectologista_orcamento_pdf, 
    t_infectologista_orcamento_pdf);
  Application.CreateForm(Tt_inf_procedimentos, t_inf_procedimentos);
  Application.CreateForm(Tt_inf_gerenciar_proc, t_inf_gerenciar_proc);
  Application.CreateForm(Tt_inf_materiais, t_inf_materiais);
  Application.CreateForm(Tt_cardiolgista_procedimentos, 
    t_cardiolgista_procedimentos);
  Application.CreateForm(Tt_cardiologista_gerenciar_proc, 
    t_cardiologista_gerenciar_proc);
  Application.CreateForm(Tt_relatorio_convenio_pdf2, t_relatorio_convenio_pdf2);
  Application.CreateForm(Tt_relatorio_convenio_pdf3, t_relatorio_convenio_pdf3);
  Application.CreateForm(Tt_relatorio_convenio_pdf4, t_relatorio_convenio_pdf4);
  Application.CreateForm(Tt_relatorio_convenio_pdf5, t_relatorio_convenio_pdf5);
  Application.CreateForm(Tt_relatorio_convenio_pdf6, t_relatorio_convenio_pdf6);
  Application.CreateForm(Tt_medico_relatorio, t_medico_relatorio);
  Application.CreateForm(Tt_relatorio_atendimento, t_relatorio_atendimento);
  Application.CreateForm(Tt_relatorio_atendimento_pdf, 
    t_relatorio_atendimento_pdf);
  Application.CreateForm(Tt_cardiologista_proc, t_cardiologista_proc);
  Application.CreateForm(Tt_cardiologista_agenda, t_cardiologista_agenda);
  Application.CreateForm(Tt_cardiologista_orcamento, t_cardiologista_orcamento);
  Application.CreateForm(Tt_cardiologista_materiais, t_cardiologista_materiais);
  Application.CreateForm(Tcardiologista_orcamento_pdf, 
    t_cardiologista_orcamento_pdf);
  Application.CreateForm(Tt_oftalmo_proc, t_oftalmo_proc);
  Application.CreateForm(Tt_oftalmo_gerenciar_proc, t_oftalmo_gerenciar_proc);
  Application.CreateForm(Tt_oftalmo_agenda, t_oftalmo_agenda);
  Application.CreateForm(Tt_oftalmo_orcamento, t_oftalmo_orcamento);
  Application.CreateForm(Tt_oftalmo_orcamento_pdf, t_oftalmo_orcamento_pdf);
  Application.CreateForm(Tt_oftalmo_materiais, t_oftalmo_materiais);
  Application.CreateForm(Tt_relatorio_financeiro, t_relatorio_financeiro);
  Application.CreateForm(Tt_visualiza_financeiro, t_visualiza_financeiro);
  Application.CreateForm(Tt_relatorio_financeiro_pdf, t_relatorio_financeiro_pdf
    );
  Application.CreateForm(Tt_despesas, t_despesas);
  Application.CreateForm(Tt_relatorio_despesa, t_relatorio_despesa);
  Application.CreateForm(Tt_registrar_gastos, t_registrar_gastos);
  Application.CreateForm(Tt_relatorio_gastos_pdf, t_relatorio_gastos_pdf);
  Application.CreateForm(Tt_nome_clinica, t_nome_clinica);
  Application.CreateForm(Tt_logotipo, t_logotipo);
  Application.CreateForm(Tt_relatorio_entrega2, t_relatorio_entrega2);
  Application.CreateForm(Tt_dentista_proc, t_dentista_proc);
  Application.Run;
end.

