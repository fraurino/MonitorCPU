object MonitorCPU: TMonitorCPU
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Monitor de Uso'
  ClientHeight = 262
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 256
    Height = 17
    Align = alTop
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentFont = False
    Visible = False
    ExplicitWidth = 36
  end
  object Label2: TLabel
    Left = 0
    Top = 17
    Width = 256
    Height = 17
    Align = alTop
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentFont = False
    Visible = False
    ExplicitWidth = 36
  end
  object Label3: TLabel
    Left = 0
    Top = 51
    Width = 256
    Height = 17
    Align = alTop
    Caption = 'Label3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentFont = False
    Visible = False
    ExplicitWidth = 36
  end
  object Label4: TLabel
    Left = 0
    Top = 68
    Width = 256
    Height = 17
    Align = alTop
    Caption = 'Label4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentFont = False
    Visible = False
    ExplicitWidth = 36
  end
  object Label5: TLabel
    Left = 0
    Top = 34
    Width = 256
    Height = 17
    Align = alTop
    Caption = 'Label5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentFont = False
    Visible = False
    ExplicitWidth = 36
  end
  object Label6: TLabel
    Left = 0
    Top = 228
    Width = 256
    Height = 13
    Align = alBottom
    Caption = 'Escolha o tema...'
    ExplicitWidth = 84
  end
  object Gauge1: TGauge
    Left = 345
    Top = 42
    Width = 208
    Height = 39
    Progress = 0
  end
  object cbxVclStyles: TComboBox
    Left = 0
    Top = 241
    Width = 256
    Height = 21
    Align = alBottom
    Style = csDropDownList
    TabOrder = 0
    OnChange = cbxVclStylesChange
  end
  object Memo1: TMemo
    Left = 0
    Top = 91
    Width = 256
    Height = 137
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object btnDadosGerais: TButton
    Left = 40
    Top = 195
    Width = 75
    Height = 25
    Caption = 'btnDadosGerais'
    TabOrder = 2
    Visible = False
    OnClick = btnDadosGeraisClick
  end
  object Button1: TButton
    Left = 264
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 176
    Top = 16
  end
end
