object MonitorCPU: TMonitorCPU
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Monitor de Uso'
  ClientHeight = 325
  ClientWidth = 460
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
  object Label6: TLabel
    Left = 0
    Top = 291
    Width = 460
    Height = 13
    Align = alBottom
    Caption = 'Escolha o tema...'
    ExplicitTop = 383
    ExplicitWidth = 84
  end
  object cbxVclStyles: TComboBox
    Left = 0
    Top = 304
    Width = 460
    Height = 21
    Align = alBottom
    Style = csDropDownList
    TabOrder = 0
    OnChange = cbxVclStylesChange
    ExplicitTop = 396
    ExplicitWidth = 483
  end
  object Memo1: TMemo
    Left = 0
    Top = 154
    Width = 460
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
    ExplicitTop = 246
    ExplicitWidth = 483
  end
  object btnDadosGerais: TButton
    Left = 296
    Top = 187
    Width = 121
    Height = 25
    Caption = 'btnDadosGerais'
    TabOrder = 2
    Visible = False
    OnClick = btnDadosGeraisClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 240
    Height = 154
    Align = alLeft
    Caption = 'Medidor de CPU'
    TabOrder = 3
    ExplicitLeft = 1
    ExplicitTop = 8
    ExplicitHeight = 142
    object Label1: TLabel
      Left = 2
      Top = 15
      Width = 236
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
      Left = 2
      Top = 32
      Width = 236
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
    object Label5: TLabel
      Left = 2
      Top = 49
      Width = 236
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
    object Label3: TLabel
      Left = 2
      Top = 66
      Width = 236
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
      Left = 2
      Top = 83
      Width = 236
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
  end
  object GroupBox2: TGroupBox
    Left = 242
    Top = 0
    Width = 218
    Height = 154
    Align = alRight
    Caption = 'Medidor da Bateria'
    TabOrder = 4
    ExplicitLeft = 247
    ExplicitTop = 6
    ExplicitHeight = 142
    object Label7: TLabel
      Left = 2
      Top = 15
      Width = 214
      Height = 17
      Align = alTop
      Caption = 'Label7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      ParentFont = False
      Visible = False
      ExplicitWidth = 36
    end
    object Label8: TLabel
      Left = 2
      Top = 32
      Width = 214
      Height = 17
      Align = alTop
      Caption = 'Label8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      ParentFont = False
      Visible = False
      ExplicitWidth = 36
    end
    object Label9: TLabel
      Left = 2
      Top = 49
      Width = 214
      Height = 17
      Align = alTop
      Caption = 'Label9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      ParentFont = False
      Visible = False
      ExplicitWidth = 36
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 176
    Top = 16
  end
end
