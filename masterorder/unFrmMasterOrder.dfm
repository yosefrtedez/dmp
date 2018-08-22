inherited frmMasterOrder: TfrmMasterOrder
  Caption = 'Master Order'
  ClientHeight = 667
  ClientWidth = 1076
  ExplicitWidth = 1076
  ExplicitHeight = 667
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1076
    ExplicitWidth = 1076
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 107
      Height = 19
      Caption = 'Master Order'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Align = alNone
    TabOrder = 6
    Visible = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 1076
    Height = 41
    Align = alTop
    TabOrder = 1
    object cxdTgl1: TcxDateEdit
      Left = 62
      Top = 9
      TabOrder = 1
      Width = 121
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 10
      Caption = 'Tanggal'
    end
    object cxLabel2: TcxLabel
      Left = 186
      Top = 10
      Caption = 'S/D'
    end
    object cxdTgl2: TcxDateEdit
      Left = 211
      Top = 9
      TabOrder = 2
      Width = 121
    end
    object btnProses: TButton
      Left = 338
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Proses'
      TabOrder = 0
      OnClick = btnProsesClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 90
    Width = 1076
    Height = 226
    Align = alClient
    TabOrder = 2
    object cxtbMO: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxtbMOFocusedRecordChanged
      DataController.DataSource = dsMO
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      object cxtbMOno_mo: TcxGridDBColumn
        Caption = 'No.MO'
        DataBinding.FieldName = 'no_mo'
      end
      object cxtbMOno_so: TcxGridDBColumn
        Caption = 'No.SO'
        DataBinding.FieldName = 'no_so'
        Width = 104
      end
      object cxtbMOno_spk: TcxGridDBColumn
        Caption = 'No.SPK'
        DataBinding.FieldName = 'no_spk'
      end
      object cxtbMOtgl_spk: TcxGridDBColumn
        Caption = 'Tgl.SPK'
        DataBinding.FieldName = 'tgl_spk'
      end
      object cxtbMOkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.FieldName = 'kode_brg'
        Width = 68
      end
      object cxtbMOdeskripsi: TcxGridDBColumn
        Caption = 'Nama Barang'
        DataBinding.FieldName = 'deskripsi'
        Width = 314
      end
      object cxtbMOqty_so: TcxGridDBColumn
        Caption = 'Qty. SO'
        DataBinding.FieldName = 'qty_so'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
      end
      object cxtbMOqty_mo: TcxGridDBColumn
        Caption = 'Qty. SPK'
        DataBinding.FieldName = 'qty_spk'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
      end
      object cxtbMOColumn4: TcxGridDBColumn
        Caption = 'Qty. SPK Prod'
        DataBinding.FieldName = 'qty_kg'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        Width = 80
      end
      object cxtbMOColumn1: TcxGridDBColumn
        Caption = 'Qty. Prod'
        DataBinding.FieldName = 'qty_prod'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
      end
      object cxtbMOColumn2: TcxGridDBColumn
        Caption = 'Qty. SJ'
        DataBinding.FieldName = 'qty_sj'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
      end
      object cxtbMOColumn3: TcxGridDBColumn
        Caption = 'Sat'
        DataBinding.FieldName = 'satuan'
        Width = 38
      end
      object cxtbMOtanggal: TcxGridDBColumn
        Caption = 'Tgl.SO'
        DataBinding.FieldName = 'tanggal'
      end
      object cxtbMOkode_customer: TcxGridDBColumn
        Caption = 'Kode Customer'
        DataBinding.FieldName = 'kode_customer'
        Visible = False
        Width = 100
      end
      object cxtbMOnama_customer: TcxGridDBColumn
        Caption = 'Nama Customer'
        DataBinding.FieldName = 'nama_customer'
        Width = 175
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbMO
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 499
    Width = 1076
    Height = 168
    Align = alBottom
    TabOrder = 5
    object Button1: TButton
      Left = 10
      Top = 6
      Width = 75
      Height = 25
      Caption = 'SPK'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 547
      Top = 6
      Width = 92
      Height = 25
      Caption = 'Mutasi Gudang'
      TabOrder = 2
      Visible = False
    end
    object Button3: TButton
      Left = 10
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Keluar'
      TabOrder = 3
      OnClick = Button3Click
    end
    object btnCetakSPK: TButton
      Left = 91
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cetak SPK'
      TabOrder = 1
      OnClick = btnCetakSPKClick
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 316
    Width = 1076
    Height = 41
    Align = alBottom
    TabOrder = 3
    object cxLabel3: TcxLabel
      Left = 10
      Top = 12
      Caption = 'Bill Of Material :'
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 357
    Width = 1076
    Height = 142
    Align = alBottom
    TabOrder = 4
    object cxtbBOM: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsBOM
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxtbBOMkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.FieldName = 'kode_brg'
        Width = 74
      end
      object cxtbBOMdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 270
      end
      object cxtbBOMqty: TcxGridDBColumn
        Caption = 'Qty.'
        DataBinding.FieldName = 'qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxColPengambilan: TcxGridDBColumn
        Caption = 'Qty. Pengambilan'
        DataBinding.FieldName = 'qty_ambil'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        Properties.ReadOnly = True
        Width = 104
      end
      object cxtbBOMsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan_1'
        Width = 93
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxtbBOM
    end
  end
  object zqrMO: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM v_mo'
      'WHERE (tanggal BETWEEN :tgl1 AND :tgl2) AND (no_mo IS NOT NULL)'
      'ORDER BY tanggal DESC')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tgl1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tgl2'
        ParamType = ptUnknown
      end>
    Left = 474
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tgl1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tgl2'
        ParamType = ptUnknown
      end>
  end
  object dsMO: TDataSource
    DataSet = zqrMO
    Left = 520
    Top = 12
  end
  object dsBOM: TDataSource
    DataSet = zqrBOM
    Left = 648
    Top = 20
  end
  object zqrBOM: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.*, b.deskripsi, c.satuan,'
      
        'IFNULL((SELECT SUM(qty) FROM tbl_trspengambilanbb WHERE id_spk =' +
        ' a.id_spk AND id_brg = a.id_brg),0) qty_ambil'
      'FROM tbl_bom a '
      'LEFT JOIN tbl_barang b ON b.id = a.id_brg'
      'LEFT JOIN tbl_satuan c ON c.id = a.id_satuan'
      'WHERE a.id_spk = :id_spk')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_spk'
        ParamType = ptUnknown
      end>
    Left = 586
    Top = 9
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_spk'
        ParamType = ptUnknown
      end>
  end
end
