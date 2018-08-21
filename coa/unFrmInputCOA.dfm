inherited frmInputCOA: TfrmInputCOA
  Caption = 'Input COA'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 89
      Height = 19
      Caption = 'Input COA '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    TabOrder = 15
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
    Properties.ListSource = dsTipeAkun
    TabOrder = 1
    Width = 254
  end
  object cxCmbDK: TcxComboBox
    Left = 91
    Top = 198
    Properties.DropDownListStyle = lsEditFixedList
    TabOrder = 13
    Visible = False
    Width = 121
  end
  object cxLabel7: TcxLabel
    Left = 10
    Top = 200
    Caption = 'Default'
    Transparent = True
    Visible = False
  end
  object cxsSaldoAwal: TcxSpinEdit
    Left = 91
    Top = 171
    Properties.DisplayFormat = '#,#0.00'
    Properties.EditFormat = '#,#0.00'
    Properties.ValueType = vtFloat
    TabOrder = 11
    Visible = False
    Width = 121
  end
  object cxLabel5: TcxLabel
    Left = 10
    Top = 173
    Caption = 'Saldo Awal'
    Transparent = True
    Visible = False
  end
  object cxtNamaAKun: TcxTextEdit
    Tag = 1
    Left = 91
    Top = 144
    Properties.CharCase = ecUpperCase
    TabOrder = 9
    Width = 379
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 146
    Caption = 'Nama Akun'
    Transparent = True
  end
  object cxtNoAkun: TcxTextEdit
    Tag = 1
    Left = 91
    Top = 117
    Properties.CharCase = ecUpperCase
    TabOrder = 7
    Width = 114
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 119
    Caption = 'No. Akun'
    Transparent = True
  end
  object cxtNoAkunInduk: TcxTextEdit
    Left = 303
    Top = 89
    Properties.ReadOnly = True
    TabOrder = 4
    Width = 82
  end
  object cxlIndukAkun: TcxLookupComboBox
    Left = 91
    Top = 90
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
    Properties.ListSource = dsInduk
    Properties.OnChange = cxlIndukAkunPropertiesChange
    TabOrder = 5
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
    TabOrder = 2
    Width = 121
  end
  object cxLabel4: TcxLabel
    Left = 10
    Top = 65
    Caption = 'Tipe Akun'
    Transparent = True
  end
  object zqrInduk: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT noakun, nama FROM tbl_coa '
      'ORDER BY nama')
    Params = <>
    Left = 616
    Top = 72
  end
  object dsInduk: TDataSource
    DataSet = zqrInduk
    Left = 696
    Top = 72
  end
  object zqrTipeAkun: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT id, tipe FROM tbl_tipe_akun')
    Params = <>
    Left = 624
    Top = 128
  end
  object dsTipeAkun: TDataSource
    DataSet = zqrTipeAkun
    Left = 704
    Top = 128
  end
end
