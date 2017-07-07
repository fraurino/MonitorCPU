unit Monitor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,Registry,
  uTotalCpuUsagePct,// uses ref. cpu em %
  psAPI, Vcl.Samples.Gauges,  // memoria ram
   Vcl.Themes, Vcl.WinXCtrls; // alteracao de temas
type
  TMonitorCPU = class(TForm)
    Timer1: TTimer;
    cbxVclStyles: TComboBox;
    Label6: TLabel;
    Memo1: TMemo;
    btnDadosGerais: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDadosGeraisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbxVclStylesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  MonitorCPU: TMonitorCPU;
implementation

{$R *.dfm}



//limpar memoria residual
procedure TrimAppMemorySize;
var
  MainHandle: THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID);
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF);
    CloseHandle(MainHandle);
  except
  end;
  Application.ProcessMessages;
end;




// funcao pega uso da memoria ram

function GetProcessMemorySize(_sProcessName: string; var _nMemSize: Cardinal): Boolean;
var
  l_nWndHandle, l_nProcID, l_nTmpHandle: HWND;
  l_pPMC: PPROCESS_MEMORY_COUNTERS;
  l_pPMCSize: Cardinal;
begin
  l_nWndHandle := FindWindow(nil, PChar(_sProcessName));
  if l_nWndHandle = 0 then
  begin
    Result := False;
    Exit;
  end;
  l_pPMCSize := SizeOf(PROCESS_MEMORY_COUNTERS);
  GetMem(l_pPMC, l_pPMCSize);
  l_pPMC^.cb := l_pPMCSize;
  GetWindowThreadProcessId(l_nWndHandle, @l_nProcID);
  l_nTmpHandle := OpenProcess(PROCESS_ALL_ACCESS, False, l_nProcID);
  if (GetProcessMemoryInfo(l_nTmpHandle, l_pPMC, l_pPMCSize)) then
    _nMemSize := l_pPMC^.WorkingSetSize
  else
    _nMemSize := 0;
  FreeMem(l_pPMC);
  Result := True;
end;
//funcao pegar uso da cpu em frequencia

function GetCPUSpeed: Double;
const
  DelayTime = 500;
var
  TimerHi, TimerLo: DWORD;
  PriorityClass, Priority: Integer;
begin
  PriorityClass := GetPriorityClass(GetCurrentProcess);
  Priority      := GetThreadPriority(GetCurrentThread);
  SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS);
  SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_TIME_CRITICAL);
  Sleep(10);
  asm
    dw 310Fh
    mov TimerLo, eax
    mov TimerHi, edx
  end;
  Sleep(DelayTime);
  asm
    dw 310Fh
    sub eax, TimerLo
    sbb edx, TimerHi
    mov TimerLo, eax
    mov TimerHi, edx
  end;
  SetThreadPriority(GetCurrentThread, Priority);
  SetPriorityClass(GetCurrentProcess, PriorityClass);
  Result := TimerLo / (1000 * DelayTime);
end;

procedure TMonitorCPU.btnDadosGeraisClick(Sender: TObject);
const
  cBytesPorMb = 1024 * 1024;
var
  M: TMemoryStatus;
begin
  M.dwLength := SizeOf(M);
  GlobalMemoryStatus(M);
  Memo1.Clear;
  with Memo1.Lines do begin
    Add(' ');
    Add(Format('Memória em uso: %d%%',
      [M.dwMemoryLoad]));
    Add(Format('Total de memória física: %f MB',
      [M.dwTotalPhys / cBytesPorMb]));
    Add(Format('Memória física disponível: %f MB',
      [M.dwAvailPhys / cBytesPorMb]));
    Add(Format('Tam. máx. do arq. de paginação: %f MB',
      [M.dwTotalPageFile / cBytesPorMb]));
    Add(Format('Disponível no arq. de paginação: %f MB',
      [M.dwAvailPageFile / cBytesPorMb]));
    Add(Format('Total de memória virtual: %f MB',
      [M.dwTotalVirtual / cBytesPorMb]));
    Add(Format('Memória virtual disponível: %f MB',
      [M.dwAvailVirtual / cBytesPorMb]));
  end;
end;

procedure TMonitorCPU.cbxVclStylesChange(Sender: TObject);
begin
TStyleManager.SetStyle(cbxVclStyles.Text);
end;

procedure TMonitorCPU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Timer1.Free;
end;

procedure TMonitorCPU.FormCreate(Sender: TObject);
var
StyleName: string;
begin
MonitorCPU.TOP:=  SCREEN.WorkAreaHeight - MonitorCPU.HEIGHT;
MonitorCPU.LEFT:= SCREEN.WorkareaWidth - MonitorCPU.WIDTH;

    // carregando temas incorporado no projeto
 for StyleName in TStyleManager.StyleNames do
    cbxVclStyles.Items.Add(StyleName);
    cbxVclStyles.ItemIndex := cbxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);

end;

procedure TMonitorCPU.FormShow(Sender: TObject);

begin
// DEIXAR O MONITOR NA FRENTE DE TODAS AS APLICACOES
//Caption := 'Monitor de CPU';
SetWindowPos(MonitorCPU.handle, HWND_TOPMOST, MonitorCPU.Left,  MonitorCPU.Top,MonitorCPU.Width, MonitorCPU.Height, 0); // HWND_NOTOPMOST normal
SetFocus;
MonitorCPU.Top := 0;
MonitorCPU.Left := Screen.Width - MonitorCPU.Width;
MonitorCPU.Top := 0;
MonitorCPU.Left := Screen.Width - MonitorCPU.Width;

end;

procedure TMonitorCPU.Timer1Timer(Sender: TObject);
const
  cBytesPorMb = 1024 * 1024;
  // ref. a monitoramento da bateria

var
TotalCPUusagePercentage: Double; // uso em %
memory, M: TMemoryStatus; // memoria
EstadoDaFonte: _SYSTEM_POWER_STATUS;//verifica bateria
begin
  M.dwLength := SizeOf(M);
  GlobalMemoryStatus(M);
  label1.Visible := True;
  label2.Visible := true;
  label3.Visible := true;
  label4.Visible := true;
  label5.Visible := true;
  label7.Visible := true;
  label8.Visible := true;




// uso da cpu em frequencia
  label1.Caption := (Format('Uso da CPU: %f MHz', [GetCPUSpeed]));

//verificando uso da cpu em %
    TotalCPUusagePercentage := GetTotalCpuUsagePct();
    Label2.Caption := 'Uso da CPU: ' + IntToStr(Round(TotalCPUusagePercentage)) + '%';

  label3.Caption := (Format('Total Fisica: %f MB', [M.dwTotalPhys / cBytesPorMb]));
  label4.Caption:=  (Format('Memória Livre: %f MB', [M.dwAvailPhys / cBytesPorMb]));
// medidor de uso da memoria em %

  M.dwLength:= SizeOf(M);
  GlobalMemoryStatus(M);
  Label5.Caption := Format('Uso da Memória RAM: %d%%', [M.dwMemoryLoad]);
  btnDadosGerais.Click;


  // verifica bateria do notebook

   GetSystemPowerStatus(EstadoDaFonte);
   if EstadoDaFonte.BatteryLifePercent <= 100 then
  Label7.Caption := 'Nível: '+IntToStr(EstadoDaFonte.BatteryLifePercent)+'%'
  else if EstadoDaFonte.BatteryLifePercent = HIGH(BYTE) then
  Label7.Caption := 'Nível: Desconhecido';

  if EstadoDaFonte.BatteryLifeTime < HIGH(DWORD) then
  Label8.Caption := 'Tempo restante de uso: ' + IntToStr(EstadoDaFonte.BatteryLifeTime div 60) + ' minutos'
  else
  Label8.Caption := 'Tempo restante de uso: Carregando...';


end;

end.


