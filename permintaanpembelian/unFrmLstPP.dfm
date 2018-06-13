inherited frmLstPP: TfrmLstPP
  Caption = 'Permintaan Pembelian'
  ClientWidth = 1110
  OnCreate = FormCreate
  ExplicitWidth = 1110
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1110
    ExplicitWidth = 1110
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 186
      Height = 19
      Caption = 'Permintaan Pembelian'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Width = 1110
    ExplicitWidth = 1110
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      OnClick = btnEditClick
    end
    inherited btnHapus: TButton
      OnClick = btnHapusClick
    end
    inherited btnKeluar: TButton
      Left = 1027
      ExplicitLeft = 1027
    end
    inherited btnRefresh: TButton
      OnClick = btnRefreshClick
    end
  end
  object cxgrd1PP: TcxGrid
    Left = 0
    Top = 49
    Width = 1110
    Height = 410
    Align = alClient
    TabOrder = 2
    object cxgtblPP: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPPHead
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxColPPno_bukti: TcxGridDBColumn
        Caption = 'No Bukti'
        DataBinding.FieldName = 'no_bukti'
        Options.Editing = False
      end
      object cxColPPtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Options.Editing = False
        Width = 92
      end
      object cxColPPtgl_diperlukan: TcxGridDBColumn
        Caption = 'Tgl Diperlukan'
        DataBinding.FieldName = 'tgl_diperlukan'
        Options.Editing = False
        Width = 94
      end
      object cxColPPdiajukan_oleh: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
        Options.Editing = False
      end
      object cxColPPdiajukan_dept: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'user_dept'
        Options.Editing = False
        Width = 230
      end
      object cxColPPlevel_kebutuhan: TcxGridDBColumn
        Caption = 'Level'
        DataBinding.FieldName = 'level_kebutuhan'
        Options.Editing = False
        Width = 164
      end
      object cxColPPLevel1_f_app: TcxGridDBColumn
        Caption = 'Approval'
        DataBinding.FieldName = 'f_app'
        Options.Editing = False
      end
    end
    object cxgtblPP1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPPDet
      DataController.DetailKeyFieldNames = 'kode_brg'
      DataController.KeyFieldNames = 'kode_brg'
      DataController.MasterKeyFieldNames = 'no_bukti'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CellAutoHeight = True
      object cxColPP1no_bukti: TcxGridDBColumn
        Caption = 'No Bukti'
        DataBinding.FieldName = 'no_bukti'
        Width = 100
      end
      object cxColPP1kode_brg: TcxGridDBColumn
        Caption = 'Kode Brg'
        DataBinding.FieldName = 'kode_brg'
        Width = 100
      end
      object cxColPP1deskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 150
      end
      object cxColPP1qty: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'qty'
        Width = 80
      end
      object cxColPP1satuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 80
      end
      object cxColPP1harga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        Width = 90
      end
      object cxColPP1keterangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 200
      end
      object cxColPP1mata_uang: TcxGridDBColumn
        Caption = 'Valuta'
        DataBinding.FieldName = 'mata_uang'
        Width = 100
      end
    end
    object cxTblcxgtblcxgrd1PPDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = dsPPDet
      DataController.DetailKeyFieldNames = 'id_ref'
      DataController.MasterKeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.GroupSummaryLayout = gslAlignWithColumns
      object cxColcxgtblcxgrd1PPDBTableView1no_bukti: TcxGridDBColumn
        Caption = 'No Bukti'
        DataBinding.FieldName = 'no_bukti'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object cxColcxgtblcxgrd1PPDBTableView1kode_brg: TcxGridDBColumn
        Caption = 'Kode Brg'
        DataBinding.FieldName = 'kode_brg'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
      object cxColcxgtblcxgrd1PPDBTableView1deskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 150
      end
      object cxColcxgtblcxgrd1PPDBTableView1qty: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,##.00'
        Width = 90
      end
      object cxColcxgtblcxgrd1PPDBTableView1satuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 80
      end
      object cxColcxgtblcxgrd1PPDBTableView1harga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.AssignedValues.EditFormat = True
        Properties.DisplayFormat = '#,##.00'
        Width = 100
      end
      object cxColcxgtblcxgrd1PPDBTableView1keterangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 150
      end
      object cxColcxgtblcxgrd1PPDBTableView1mata_uang: TcxGridDBColumn
        Caption = 'Valuta'
        DataBinding.FieldName = 'mata_uang'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 100
      end
    end
    object cxgrdlvl1TblPP: TcxGridLevel
      GridView = cxgtblPP
      object cxgrdlvl1cxgrd1PPLevel1: TcxGridLevel
        GridView = cxTblcxgtblcxgrd1PPDBTableView1
      end
    end
  end
  object zqrPPHead: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'select * from tbl_pp_head order by no_bukti;')
    Params = <>
    Left = 810
    Top = 159
  end
  object dsPPHead: TDataSource
    DataSet = zqrPPHead
    Left = 840
    Top = 161
  end
  object zqrPPDet: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, a.id_ref, a.no_bukti, a.kode_brg, b.deskripsi, a.qt' +
        'y, b.satuan, a.harga, a.keterangan, a.mata_uang'
      'FROM tbl_pp_det a'
      'LEFT JOIN tbl_barang b ON a.kode_brg = b.kode')
    Params = <>
    Left = 811
    Top = 208
  end
  object dsPPDet: TDataSource
    AutoEdit = False
    DataSet = zqrPPDet
    Left = 842
    Top = 209
  end
end
