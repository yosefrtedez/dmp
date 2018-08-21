inherited frmInputMesin: TfrmInputMesin
  Caption = 'Input Mesin'
  ClientHeight = 663
  ClientWidth = 1058
  OnShow = FormShow
  ExplicitWidth = 1058
  ExplicitHeight = 663
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1058
    ExplicitWidth = 1058
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 96
      Height = 19
      Caption = 'Input Mesin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 614
    Width = 1058
    TabOrder = 32
    ExplicitTop = 614
    ExplicitWidth = 1058
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 65
    Caption = 'Kode'
    Transparent = True
  end
  object cxtKode: TcxTextEdit
    Tag = 1
    Left = 146
    Top = 64
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    Width = 216
  end
  object cxChkAktif: TcxCheckBox
    Left = 364
    Top = 65
    Caption = 'Aktif'
    TabOrder = 3
    Transparent = True
    Width = 121
  end
  object cxLabel10: TcxLabel
    Left = 10
    Top = 91
    Caption = 'Nama'
    Transparent = True
  end
  object cxtNama: TcxTextEdit
    Tag = 1
    Left = 146
    Top = 89
    Properties.CharCase = ecUpperCase
    TabOrder = 4
    Width = 336
  end
  object cxLabel4: TcxLabel
    Left = 10
    Top = 116
    Caption = 'Lokasi'
    FocusControl = btnBatal
    Transparent = True
  end
  object cxlLokasi: TcxLookupComboBox
    Left = 146
    Top = 114
    Properties.KeyFieldNames = 'lokasi'
    Properties.ListColumns = <
      item
        Caption = 'Lokasi'
        FieldName = 'lokasi'
      end>
    Properties.ListSource = dsLokasi
    TabOrder = 6
    Width = 236
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 141
    Caption = 'Grup Mesin'
    FocusControl = btnBatal
    Transparent = True
  end
  object cxCmbGrupMesin: TcxComboBox
    Left = 146
    Top = 139
    Properties.DropDownListStyle = lsEditFixedList
    TabOrder = 8
    Width = 236
  end
  object cxLabel7: TcxLabel
    Left = 10
    Top = 165
    Caption = 'Cycle Time (Minute)'
    FocusControl = btnBatal
    Transparent = True
  end
  object cxsCycle: TcxSpinEdit
    Left = 146
    Top = 164
    Properties.DisplayFormat = '#,##0.00'
    Properties.EditFormat = '#,##0.00'
    Properties.ValueType = vtFloat
    TabOrder = 10
    Width = 76
  end
  object cxLabel8: TcxLabel
    Left = 242
    Top = 165
    Caption = 'Setup Time (Minute)'
    FocusControl = btnBatal
    Transparent = True
  end
  object cxsSetup: TcxSpinEdit
    Left = 354
    Top = 164
    Properties.DisplayFormat = '#,##0.00'
    Properties.EditFormat = '#,##0.00'
    Properties.ValueType = vtFloat
    TabOrder = 11
    Width = 76
  end
  object cxsHeater: TcxSpinEdit
    Left = 354
    Top = 188
    Properties.DisplayFormat = '#,##0.00'
    Properties.EditFormat = '#,##0.00'
    Properties.ValueType = vtFloat
    TabOrder = 15
    Width = 76
  end
  object cxLabel13: TcxLabel
    Left = 242
    Top = 189
    Caption = 'Daya Heater (KW)'
    FocusControl = btnBatal
    Transparent = True
  end
  object cxsWait: TcxSpinEdit
    Left = 146
    Top = 188
    Properties.DisplayFormat = '#,##0.00'
    Properties.EditFormat = '#,##0.00'
    Properties.ValueType = vtFloat
    TabOrder = 14
    Width = 76
  end
  object cxLabel9: TcxLabel
    Left = 10
    Top = 189
    Caption = 'Wait/Move Time (Minute)'
    FocusControl = btnBatal
    Transparent = True
  end
  object cxLabel12: TcxLabel
    Left = 10
    Top = 213
    Caption = 'Daya Motor (KW)'
    FocusControl = btnBatal
    Transparent = True
  end
  object cxsMotor: TcxSpinEdit
    Left = 146
    Top = 212
    Properties.DisplayFormat = '#,##0.00'
    Properties.EditFormat = '#,##0.00'
    Properties.ValueType = vtFloat
    TabOrder = 18
    Width = 76
  end
  object cxLabel14: TcxLabel
    Left = 242
    Top = 214
    Caption = 'Jml. Line'
    FocusControl = btnBatal
    Transparent = True
  end
  object cxsLine: TcxSpinEdit
    Left = 354
    Top = 212
    Properties.DisplayFormat = '#,##0.00'
    Properties.EditFormat = '#,##0.00'
    Properties.ValueType = vtFloat
    TabOrder = 19
    Width = 76
  end
  object cxlSatuan: TcxComboBox
    Left = 354
    Top = 235
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      'M'
      'KG'
      'PCS'
      'ROLL')
    TabOrder = 22
    Width = 78
  end
  object cxLabel15: TcxLabel
    Left = 242
    Top = 237
    Caption = 'Satuan'
    FocusControl = btnBatal
    Transparent = True
  end
  object cxsOutput: TcxSpinEdit
    Left = 146
    Top = 236
    Properties.DisplayFormat = '#,##0.00'
    Properties.EditFormat = '#,##0.00'
    Properties.ValueType = vtFloat
    TabOrder = 23
    Width = 76
  end
  object cxLabel11: TcxLabel
    Left = 10
    Top = 237
    Caption = 'Hasil Output Per Jam'
    FocusControl = btnBatal
    Transparent = True
  end
  object cxLabel3: TcxLabel
    Left = 10
    Top = 262
    Caption = 'Jml. Personil Run'
    FocusControl = btnBatal
    Transparent = True
  end
  object cxsJmlPersonil: TcxSpinEdit
    Left = 146
    Top = 260
    Properties.DisplayFormat = '#,##0.00'
    Properties.EditFormat = '#,##0.00'
    Properties.ValueType = vtFloat
    TabOrder = 26
    Width = 76
  end
  object cxLabel16: TcxLabel
    Left = 242
    Top = 262
    Caption = 'Jml. Personil Setup'
    FocusControl = btnBatal
    Transparent = True
  end
  object cxsOperatorSet: TcxSpinEdit
    Left = 354
    Top = 260
    Properties.DisplayFormat = '#,##0.00'
    Properties.EditFormat = '#,##0.00'
    Properties.ValueType = vtFloat
    TabOrder = 27
    Width = 76
  end
  object cxsDie: TcxSpinEdit
    Left = 146
    Top = 284
    Properties.DisplayFormat = '#,##0'
    Properties.EditFormat = '#,##0'
    Properties.ValueType = vtFloat
    TabOrder = 30
    Width = 76
  end
  object cxLabel17: TcxLabel
    Left = 10
    Top = 285
    Caption = 'DIE'
    FocusControl = btnBatal
    Transparent = True
  end
  object zqrLokasi: TZQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT lokasi FROM tbl_lokasi'
      'ORDER BY lokasi')
    Params = <>
    Left = 633
    Top = 108
  end
  object dsLokasi: TDataSource
    DataSet = zqrLokasi
    Left = 679
    Top = 108
  end
end
