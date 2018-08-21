inherited frmInputSupplier: TfrmInputSupplier
  Caption = 'Input Supplier'
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
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 128
      Height = 19
      Caption = 'Master Supplier'
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
    TabOrder = 34
    ExplicitTop = 614
    ExplicitWidth = 1058
  end
  object cxtKode: TcxTextEdit
    Left = 94
    Top = 71
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    Width = 113
  end
  object cxlbl1: TcxLabel
    Left = 10
    Top = 72
    Caption = 'Kode Supplier'
  end
  object cxtNama: TcxTextEdit
    Left = 94
    Top = 98
    Properties.CharCase = ecUpperCase
    TabOrder = 4
    Width = 185
  end
  object cxtKontak: TcxTextEdit
    Left = 94
    Top = 125
    Properties.CharCase = ecUpperCase
    TabOrder = 6
    Width = 225
  end
  object cxtTitle: TcxTextEdit
    Left = 94
    Top = 152
    Properties.CharCase = ecUpperCase
    TabOrder = 8
    Width = 209
  end
  object cxtAlamat: TcxTextEdit
    Left = 94
    Top = 179
    Properties.CharCase = ecUpperCase
    TabOrder = 10
    Width = 265
  end
  object cxtAlamat2: TcxTextEdit
    Left = 94
    Top = 206
    Properties.CharCase = ecUpperCase
    TabOrder = 12
    Width = 265
  end
  object cxtKota: TcxTextEdit
    Left = 94
    Top = 233
    Properties.CharCase = ecUpperCase
    TabOrder = 15
    Width = 185
  end
  object cxtProvinsi: TcxTextEdit
    Left = 94
    Top = 287
    Properties.CharCase = ecUpperCase
    TabOrder = 18
    Width = 185
  end
  object cxtNegara: TcxTextEdit
    Left = 94
    Top = 314
    Properties.CharCase = ecUpperCase
    TabOrder = 20
    Width = 185
  end
  object cxtTelp: TcxTextEdit
    Left = 94
    Top = 341
    Properties.CharCase = ecUpperCase
    TabOrder = 22
    Width = 185
  end
  object cxtFax: TcxTextEdit
    Left = 94
    Top = 368
    Properties.CharCase = ecUpperCase
    TabOrder = 25
    Width = 185
  end
  object cxtHp: TcxTextEdit
    Left = 94
    Top = 395
    Properties.CharCase = ecUpperCase
    TabOrder = 26
    Width = 185
  end
  object cxtDirect: TcxTextEdit
    Left = 94
    Top = 421
    Properties.CharCase = ecUpperCase
    TabOrder = 28
    Width = 185
  end
  object cxCboPembayaran: TcxComboBox
    Left = 94
    Top = 448
    Properties.DropDownListStyle = lsEditFixedList
    Properties.ReadOnly = False
    TabOrder = 30
    Width = 185
  end
  object cxtEmail: TcxTextEdit
    Left = 94
    Top = 475
    Properties.CharCase = ecUpperCase
    TabOrder = 32
    Width = 345
  end
  object cxchkAktif: TcxCheckBox
    Left = 219
    Top = 71
    Caption = 'Aktif'
    TabOrder = 2
    Width = 113
  end
  object cxlbl2: TcxLabel
    Left = 10
    Top = 102
    Caption = 'Nama Supplier'
  end
  object cxlbl3: TcxLabel
    Left = 10
    Top = 129
    Caption = 'Kontak'
  end
  object cxlbl4: TcxLabel
    Left = 10
    Top = 153
    Caption = 'Title'
  end
  object cxlbl5: TcxLabel
    Left = 10
    Top = 180
    Caption = 'Alamat'
  end
  object cxlbl6: TcxLabel
    Left = 10
    Top = 207
    Caption = 'Alamat 2'
  end
  object cxlbl7: TcxLabel
    Left = 10
    Top = 233
    Caption = 'Kota'
  end
  object cxlbl8: TcxLabel
    Left = 10
    Top = 264
    Caption = 'Kode Pos'
  end
  object cxlbl9: TcxLabel
    Left = 10
    Top = 288
    Caption = 'Provinsi'
  end
  object cxlbl10: TcxLabel
    Left = 10
    Top = 318
    Caption = 'Negara'
  end
  object cxlbl11: TcxLabel
    Left = 10
    Top = 343
    Caption = 'Telp'
  end
  object cxlbl12: TcxLabel
    Left = 10
    Top = 367
    Caption = 'Fax'
  end
  object cxlbl13: TcxLabel
    Left = 10
    Top = 422
    Caption = 'Direct'
  end
  object cxlbl14: TcxLabel
    Left = 10
    Top = 449
    Caption = 'Pembayaran'
  end
  object cxlbl15: TcxLabel
    Left = 10
    Top = 397
    Caption = 'HP'
  end
  object cxlbl16: TcxLabel
    Left = 10
    Top = 480
    Caption = 'Email'
  end
  object cxtKodePos: TcxTextEdit
    Left = 94
    Top = 259
    Properties.CharCase = ecUpperCase
    TabOrder = 16
    Width = 185
  end
  object zqrSupplier: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_dept')
    Params = <>
    Left = 568
    Top = 464
  end
  object dsSupplier: TDataSource
    DataSet = zqrSupplier
    Left = 648
    Top = 464
  end
end
