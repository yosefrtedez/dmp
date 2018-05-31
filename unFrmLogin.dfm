object frmLogin: TfrmLogin
  Left = 2219
  Top = 261
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 136
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxtNamaUser: TcxTextEdit
    Left = 89
    Top = 26
    Properties.CharCase = ecUpperCase
    Properties.LookupItemsSorted = True
    TabOrder = 1
    OnKeyPress = cxtNamaUserKeyPress
    Width = 204
  end
  object cxLabel1: TcxLabel
    Left = 7
    Top = 26
    Caption = 'Nama User'
  end
  object cxtPass: TcxTextEdit
    Left = 89
    Top = 55
    Properties.CharCase = ecUpperCase
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    TabOrder = 3
    OnKeyPress = cxtPassKeyPress
    Width = 204
  end
  object cxLabel2: TcxLabel
    Left = 7
    Top = 55
    Caption = 'Password'
  end
  object Panel2: TPanel
    Left = 0
    Top = 95
    Width = 300
    Height = 41
    Align = alBottom
    TabOrder = 4
    object btnLogin: TButton
      Left = 9
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Login'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnLoginClick
    end
    object btnBatal: TButton
      Left = 87
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Batal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnBatalClick
    end
  end
end
