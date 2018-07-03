inherited frmInputBarangJasa: TfrmInputBarangJasa
  Caption = 'Input Barang dan Jasa'
  ClientHeight = 663
  ClientWidth = 1058
  OnCreate = FormCreate
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
    TabOrder = 16
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
    TabOrder = 1
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
    Properties.KeyFieldNames = 'id'
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
  object cxlSubKategori: TcxLookupComboBox
    Left = 104
    Top = 144
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'SubKategori'
        FieldName = 'subkategori'
      end>
    Properties.ListSource = dsSubKategori
    TabOrder = 9
    Width = 265
  end
  object cxLabel5: TcxLabel
    Left = 10
    Top = 172
    Caption = 'Satuan'
  end
  object cxlSatuan: TcxLookupComboBox
    Left = 104
    Top = 171
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Satuan'
        FieldName = 'satuan'
      end>
    Properties.ListSource = dsSatuan
    TabOrder = 11
    Width = 137
  end
  object cxBrgDet: TcxPageControl
    Left = 8
    Top = 264
    Width = 1042
    Height = 344
    ActivePage = cxTabSheet4
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = 7
    TabOrder = 15
    ClientRectBottom = 343
    ClientRectLeft = 1
    ClientRectRight = 1041
    ClientRectTop = 21
    object cxTabSheet3: TcxTabSheet
      Caption = 'Data'
      ImageIndex = 2
      object cxLabel8: TcxLabel
        Left = 14
        Top = 16
        Caption = 'Stok'
      end
      object cxSpinEdit2: TcxSpinEdit
        Left = 131
        Top = 15
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        TabOrder = 0
        Width = 121
      end
      object cxSpinEdit3: TcxSpinEdit
        Left = 131
        Top = 42
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        TabOrder = 4
        Width = 121
      end
      object cxLabel9: TcxLabel
        Left = 14
        Top = 43
        Caption = 'Dipesan Ke Supplier'
      end
      object cxLabel10: TcxLabel
        Left = 14
        Top = 70
        Caption = 'Dipesan Customer'
      end
      object cxSpinEdit4: TcxSpinEdit
        Left = 131
        Top = 69
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        TabOrder = 8
        Width = 121
      end
      object cxLabel11: TcxLabel
        Left = 14
        Top = 97
        Caption = 'Stok Minimal'
      end
      object cxSpinEdit5: TcxSpinEdit
        Left = 131
        Top = 96
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        TabOrder = 12
        Width = 121
      end
      object cxLabel12: TcxLabel
        Left = 270
        Top = 16
        Caption = 'Harga Beli Terakhir'
      end
      object cxSpinEdit6: TcxSpinEdit
        Left = 387
        Top = 15
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        TabOrder = 1
        Width = 121
      end
      object cxLabel13: TcxLabel
        Left = 270
        Top = 43
        Caption = 'Harga Jual Satuan'
      end
      object cxSpinEdit7: TcxSpinEdit
        Left = 387
        Top = 42
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        TabOrder = 5
        Width = 121
      end
      object cxLabel14: TcxLabel
        Left = 270
        Top = 70
        Caption = 'Harga Pokok Satuan'
      end
      object cxSpinEdit8: TcxSpinEdit
        Left = 387
        Top = 69
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Properties.ValueType = vtFloat
        TabOrder = 9
        Width = 121
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'Spesifikasi'
      ImageIndex = 3
      object cxLabel7: TcxLabel
        Left = 14
        Top = 16
        Caption = 'Dimensi'
      end
      object cxtDimensi: TcxTextEdit
        Left = 130
        Top = 15
        Properties.ReadOnly = True
        TabOrder = 0
        Width = 135
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'Konversi Satuan'
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 16
        Top = 14
        Width = 465
        Height = 200
        TabOrder = 0
        object cxtbSatuan: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Append.Visible = True
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DataController.OnBeforePost = cxtbSatuanDataControllerBeforePost
          OptionsData.Appending = True
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          object cxColSatuan: TcxGridColumn
            Caption = 'Satuan'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = 'Satuan'
                FieldName = 'satuan'
              end>
            Properties.ListSource = dsSatuan
            Width = 80
          end
          object cxColQty: TcxGridColumn
            Caption = 'Qty.'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#,#0.00'
            Properties.ValueType = vtFloat
          end
          object cxColKeterangan: TcxGridColumn
            Caption = 'Keterangan'
            Width = 283
          end
          object cxColID: TcxGridColumn
            Visible = False
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxtbSatuan
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Kode Akun'
      ImageIndex = 1
    end
  end
  object cxLabel6: TcxLabel
    Left = 10
    Top = 199
    Caption = 'Tipe'
  end
  object cxlTipe: TcxLookupComboBox
    Left = 104
    Top = 198
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Tipe'
        FieldName = 'tipe'
      end>
    Properties.ListSource = dsTipe
    TabOrder = 13
    Width = 265
  end
  object cxChkAktif: TcxCheckBox
    Left = 375
    Top = 63
    Caption = 'Aktif'
    TabOrder = 2
    Width = 58
  end
  object cxChkPPN: TcxCheckBox
    Left = 432
    Top = 63
    Caption = 'PPN'
    TabOrder = 3
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
  object zqrSubKategori: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_subkategori_brg'
      'ORDER BY subkategori')
    Params = <>
    Left = 840
    Top = 136
  end
  object dsSubKategori: TDataSource
    DataSet = zqrSubKategori
    Left = 920
    Top = 136
  end
  object zqrSatuan: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_satuan ORDER BY satuan')
    Params = <>
    Left = 824
    Top = 216
  end
  object dsSatuan: TDataSource
    DataSet = zqrSatuan
    Left = 904
    Top = 216
  end
  object zqrTipe: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_tipe_brg ORDER BY tipe')
    Params = <>
    Left = 656
    Top = 184
  end
  object dsTipe: TDataSource
    DataSet = zqrTipe
    Left = 736
    Top = 184
  end
end
