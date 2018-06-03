inherited frmInputCOA: TfrmInputCOA
  Caption = 'Input COA'
  ExplicitWidth = 894
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 96
      Height = 19
      Caption = 'Input Akun '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object cxlTipeAkun: TcxLookupComboBox
    Left = 91
    Top = 63
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Tipe Akun'
        FieldName = 'tipe'
      end>
    Properties.ListOptions.SyncMode = True
    TabOrder = 2
    Width = 254
  end
  object cxCmbDK: TcxComboBox
    Left = 91
    Top = 190
    Properties.DropDownListStyle = lsEditFixedList
    TabOrder = 3
    Width = 121
  end
  object cxLabel7: TcxLabel
    Left = 10
    Top = 192
    Caption = 'Default'
    Transparent = True
  end
  object cxsSaldoAwal: TcxSpinEdit
    Left = 91
    Top = 165
    Properties.DisplayFormat = '#,#0.00'
    Properties.EditFormat = '#,#0.00'
    Properties.ValueType = vtFloat
    TabOrder = 5
    Width = 121
  end
  object cxLabel5: TcxLabel
    Left = 10
    Top = 167
    Caption = 'Saldo Awal'
    Transparent = True
  end
  object cxtNamaAKun: TcxTextEdit
    Tag = 1
    Left = 91
    Top = 140
    Properties.CharCase = ecUpperCase
    TabOrder = 7
    Width = 379
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 142
    Caption = 'Nama Akun'
    Transparent = True
  end
  object cxtNoAkun: TcxTextEdit
    Tag = 1
    Left = 91
    Top = 114
    Properties.CharCase = ecUpperCase
    TabOrder = 9
    Width = 114
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 116
    Caption = 'No. Akun'
    Transparent = True
  end
  object cxtNoAkunInduk: TcxTextEdit
    Left = 303
    Top = 89
    Properties.ReadOnly = True
    TabOrder = 11
    Width = 82
  end
  object cxlIndukAkun: TcxLookupComboBox
    Left = 91
    Top = 89
    Properties.DropDownWidth = 400
    Properties.GridMode = True
    Properties.KeyFieldNames = 'noakun'
    Properties.ListColumns = <
      item
        Caption = 'Nama Akun'
        FieldName = 'nama'
      end
      item
        Caption = 'No. Akun'
        Width = 100
        FieldName = 'noakun'
      end>
    Properties.ListOptions.SyncMode = True
    TabOrder = 12
    Width = 209
  end
  object cxLabel3: TcxLabel
    Left = 10
    Top = 91
    Caption = 'Induk Akun'
    Transparent = True
  end
  object cxChkAktif: TcxCheckBox
    Left = 350
    Top = 63
    Caption = ' Aktif'
    TabOrder = 14
    Width = 121
  end
  object cxLabel4: TcxLabel
    Left = 10
    Top = 65
    Caption = 'Tipe Akun'
    Transparent = True
  end
end
