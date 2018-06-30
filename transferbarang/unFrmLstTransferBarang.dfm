inherited frmLstTransferBarang: TfrmLstTransferBarang
  Caption = 'Transfer Barang'
  OnCreate = FormCreate
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 75
    ExplicitHeight = 75
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 132
      Height = 19
      Caption = 'Transfer Barang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 47
      Caption = 'Tanggal'
    end
    object cxdTgl1: TcxDateEdit
      Left = 62
      Top = 46
      TabOrder = 1
      Width = 121
    end
    object cxLabel2: TcxLabel
      Left = 186
      Top = 47
      Caption = 'S/D'
    end
    object cxdTgl2: TcxDateEdit
      Left = 211
      Top = 46
      TabOrder = 3
      Width = 121
    end
    object btnProses: TButton
      Left = 338
      Top = 44
      Width = 75
      Height = 25
      Caption = 'Proses'
      TabOrder = 4
      OnClick = btnProsesClick
    end
  end
  inherited Panel2: TPanel
    TabOrder = 2
    inherited btnTambah: TButton
      Top = 14
      OnClick = btnTambahClick
      ExplicitTop = 14
    end
    inherited btnEdit: TButton
      Top = 14
      OnClick = btnEditClick
      ExplicitTop = 14
    end
    inherited btnHapus: TButton
      OnClick = btnHapusClick
    end
    inherited btnKeluar: TButton
      TabOrder = 4
    end
    inherited btnRefresh: TButton
      TabOrder = 3
      OnClick = btnRefreshClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 75
    Width = 1016
    Height = 172
    Align = alClient
    TabOrder = 1
    object cxTblTransBarang: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxTblTransBarangFocusedRecordChanged
      DataController.DataSource = dsTransBarang
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxTblTransBarangno_bukti: TcxGridDBColumn
        Caption = 'No.Bukti'
        DataBinding.FieldName = 'no_bukti'
        Width = 105
      end
      object cxTblTransBarangtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Width = 106
      end
      object cxTblTransBarangketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 326
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxTblTransBarang
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 247
    Width = 1016
    Height = 41
    Align = alBottom
    TabOrder = 3
    object cxLabel3: TcxLabel
      Left = 10
      Top = 11
      Caption = 'Detail Transfer Barang'
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 288
    Width = 1016
    Height = 171
    Align = alBottom
    TabOrder = 4
    object cxTblTransBarangDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsTransBarangDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxTblTransBarangDetno: TcxGridDBColumn
        DataBinding.FieldName = 'no'
        Width = 27
      end
      object cxTblTransBarangDetkode: TcxGridDBColumn
        Caption = 'Kode Brg'
        DataBinding.FieldName = 'kode'
        Width = 168
      end
      object cxTblTransBarangDetdeskripsi: TcxGridDBColumn
        Caption = 'Nama Brg'
        DataBinding.FieldName = 'deskripsi'
        Width = 397
      end
      object cxTblTransBarangDetasal: TcxGridDBColumn
        Caption = 'Gudang Asal'
        DataBinding.FieldName = 'asal'
      end
      object cxTblTransBarangDettujuan: TcxGridDBColumn
        Caption = 'Gudang Tujuan'
        DataBinding.FieldName = 'tujuan'
      end
      object cxTblTransBarangDetsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 92
      end
      object cxTblTransBarangDetqty: TcxGridDBColumn
        Caption = 'Qty.Transfer'
        DataBinding.FieldName = 'qty'
        Width = 81
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxTblTransBarangDet
    end
  end
  object zqrTransBarang: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_trsmutasi_head'
      'WHERE (tanggal BETWEEN :tgl1 AND :tgl2) ')
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
    Left = 496
    Top = 14
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
  object dsTransBarang: TDataSource
    DataSet = zqrTransBarang
    Left = 576
    Top = 14
  end
  object zqrTransBarangDet: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      
        'SELECT a.no,b.kode,b.deskripsi,d.nama as asal,e.nama as tujuan,c' +
        '.satuan,a.qty'
      'FROM tbl_trsmutasi_det a'
      'LEFT JOIN tbl_barang b ON a.id_brg = b.id'
      'LEFT JOIN tbl_satuan c ON c.id = a.id_satuan'
      'LEFT JOIN tbl_gudang d ON a.id_gdg_asal=d.id'
      'LEFT JOIN tbl_gudang e ON a.id_gdg_tujuan=e.id'
      'WHERE a.id_ref = :id_ref')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 660
    Top = 20
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
  object dsTransBarangDet: TDataSource
    DataSet = zqrTransBarangDet
    Left = 761
    Top = 20
  end
end
