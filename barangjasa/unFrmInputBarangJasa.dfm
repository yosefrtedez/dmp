inherited frmInputBarangJasa: TfrmInputBarangJasa
  Caption = 'Input Barang dan Jasa'
  ClientHeight = 663
  ClientWidth = 1058
  OnCreate = FormCreate
  ExplicitWidth = 1058
  ExplicitHeight = 663
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1058
    ExplicitWidth = 1058
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 119
      Height = 19
      Caption = 'Master Barang'
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
    ExplicitTop = 614
    ExplicitWidth = 1058
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 64
    Caption = 'Kode'
  end
  object cxtKode: TcxTextEdit
    Left = 104
    Top = 63
    TabOrder = 3
    Width = 265
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 91
    Caption = 'Deskripsi'
  end
  object cxtDeskripsi: TcxTextEdit
    Left = 104
    Top = 90
    TabOrder = 5
    Width = 633
  end
  object cxLabel3: TcxLabel
    Left = 10
    Top = 118
    Caption = 'Kategori'
  end
  object cxlKategori: TcxLookupComboBox
    Left = 104
    Top = 117
    Properties.KeyFieldNames = 'kode'
    Properties.ListColumns = <
      item
        Caption = 'Kategori'
        FieldName = 'kategori'
      end>
    Properties.ListSource = dsKategori
    TabOrder = 7
    Width = 265
  end
  object cxLabel4: TcxLabel
    Left = 10
    Top = 145
    Caption = 'Sub Kategori'
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 104
    Top = 144
    Properties.KeyFieldNames = 'kode'
    Properties.ListColumns = <
      item
        Caption = 'Kategori'
        FieldName = 'kategori'
      end>
    Properties.ListSource = dsKategori
    TabOrder = 9
    Width = 265
  end
  object cxLabel5: TcxLabel
    Left = 10
    Top = 172
    Caption = 'Satuan'
  end
  object cxLookupComboBox2: TcxLookupComboBox
    Left = 104
    Top = 171
    Properties.KeyFieldNames = 'kode'
    Properties.ListColumns = <
      item
        Caption = 'Kategori'
        FieldName = 'kategori'
      end>
    Properties.ListSource = dsKategori
    TabOrder = 11
    Width = 265
  end
  object cxLabel6: TcxLabel
    Left = 10
    Top = 199
    Caption = 'Berat'
  end
  object cxLookupComboBox3: TcxLookupComboBox
    Left = 104
    Top = 198
    Properties.KeyFieldNames = 'kode'
    Properties.ListColumns = <
      item
        Caption = 'Kategori'
        FieldName = 'kategori'
      end>
    Properties.ListSource = dsKategori
    TabOrder = 13
    Width = 265
  end
  object cxLabel7: TcxLabel
    Left = 10
    Top = 226
    Caption = 'Stok'
  end
  object cxSpinEdit1: TcxSpinEdit
    Left = 104
    Top = 225
    TabOrder = 15
    Width = 121
  end
  object zqrKategori: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_kategori_brg'
      'ORDER BY kategori')
    Params = <>
    Left = 840
    Top = 64
  end
  object dsKategori: TDataSource
    DataSet = zqrKategori
    Left = 920
    Top = 64
  end
end
