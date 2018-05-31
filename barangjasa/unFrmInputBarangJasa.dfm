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
