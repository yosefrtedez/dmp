inherited frmSettingProgram: TfrmSettingProgram
  Caption = 'Setting Program'
  OnShow = FormShow
  ExplicitWidth = 894
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 134
      Height = 19
      Caption = 'Setting Program'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    TabOrder = 17
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 64
    Caption = 'Nama Perusahaan'
  end
  object cxtNamaPerusahaan: TcxTextEdit
    Left = 136
    Top = 63
    TabOrder = 1
    Width = 449
  end
  object cxtAlamat: TcxTextEdit
    Left = 136
    Top = 90
    TabOrder = 3
    Width = 449
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 91
    Caption = 'Alamat'
  end
  object cxLabel3: TcxLabel
    Left = 10
    Top = 118
    Caption = 'Kota'
  end
  object cxtKota: TcxTextEdit
    Left = 136
    Top = 117
    TabOrder = 5
    Width = 449
  end
  object cxLabel4: TcxLabel
    Left = 10
    Top = 145
    Caption = 'Kode Pos'
  end
  object cxtKodePos: TcxTextEdit
    Left = 136
    Top = 144
    TabOrder = 7
    Width = 185
  end
  object cxLabel5: TcxLabel
    Left = 10
    Top = 253
    Caption = 'NPWP'
  end
  object cxtNPWP: TcxTextEdit
    Left = 136
    Top = 252
    TabOrder = 15
    Width = 449
  end
  object cxLabel6: TcxLabel
    Left = 10
    Top = 172
    Caption = 'Telpon'
  end
  object cxtTelpon: TcxTextEdit
    Left = 136
    Top = 171
    TabOrder = 9
    Width = 281
  end
  object cxLabel7: TcxLabel
    Left = 10
    Top = 226
    Caption = 'Email'
  end
  object cxtEmail: TcxTextEdit
    Left = 136
    Top = 225
    TabOrder = 13
    Width = 449
  end
  object cxLabel8: TcxLabel
    Left = 10
    Top = 199
    Caption = 'Fax'
  end
  object cxtFax: TcxTextEdit
    Left = 136
    Top = 198
    TabOrder = 11
    Width = 281
  end
end
