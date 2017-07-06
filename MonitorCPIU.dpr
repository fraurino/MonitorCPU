program MonitorCPIU;

uses
  Vcl.Forms,
  Monitor in 'Monitor.pas' {MonitorCPU},
  uTotalCpuUsagePct in 'uTotalCpuUsagePct.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Monitor de Uso';
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TMonitorCPU, MonitorCPU);
  Application.Run;
end.
