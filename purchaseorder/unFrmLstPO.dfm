inherited frmLstPO: TfrmLstPO
  Caption = 'frmLstPO'
  ClientHeight = 507
  ClientWidth = 1169
  OnCreate = FormCreate
  ExplicitWidth = 1169
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1169
    ExplicitWidth = 1169
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 125
      Height = 19
      Caption = 'Purchase Order'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 458
    Width = 1169
    ExplicitTop = 458
    ExplicitWidth = 1169
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
      Left = 1086
      ExplicitLeft = 1086
    end
    inherited btnRefresh: TButton
      OnClick = btnRefreshClick
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 49
    Width = 1169
    Height = 409
    Align = alClient
    TabOrder = 2
    ExplicitTop = 50
    object cxTblHead: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPO
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CellTextMaxLineCount = 10
      Preview.MaxLineCount = 10
      object cxColTblHeadno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Width = 90
      end
      object cxColTblHeadno_fobj: TcxGridDBColumn
        Caption = 'No PP'
        DataBinding.FieldName = 'no_fobj'
        Width = 90
      end
      object cxColTblHeadnama: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama'
        Width = 150
      end
      object cxColTblHeadkontak: TcxGridDBColumn
        DataBinding.FieldName = 'kontak'
        Width = 120
      end
      object cxColTblHeadtgl_required: TcxGridDBColumn
        Caption = 'Tgl Kedatangan'
        DataBinding.FieldName = 'tgl_required'
        Width = 90
      end
      object cxColTblHeaduser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
        Width = 100
      end
      object cxColTblHeaduser_dept: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'user_dept'
        Width = 100
      end
      object cxColTblHeadpembayaran: TcxGridDBColumn
        Caption = 'Pembayaran'
        DataBinding.FieldName = 'pembayaran'
        Width = 100
      end
      object cxColTblHeadnopol: TcxGridDBColumn
        Caption = 'Nopol'
        DataBinding.FieldName = 'nopol'
        Width = 90
      end
      object cxColTblHeaddriver: TcxGridDBColumn
        Caption = 'Driver'
        DataBinding.FieldName = 'driver'
        Width = 120
      end
      object cxColTblHeadf_approval: TcxGridDBColumn
        Caption = 'F_App'
        DataBinding.FieldName = 'f_approval'
        Width = 50
      end
      object cxColTblHeadf_completed: TcxGridDBColumn
        Caption = 'F_Komplit'
        DataBinding.FieldName = 'f_completed'
      end
    end
    object cxTblDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPoDet
      DataController.DetailKeyFieldNames = 'id_ref'
      DataController.MasterKeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ScrollBars = ssVertical
      OptionsView.CellAutoHeight = True
      OptionsView.CellTextMaxLineCount = 10
      OptionsView.GroupFooters = gfAlwaysVisible
      Preview.MaxLineCount = 10
      object cxColTblDetid: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'id'
      end
      object cxColTblDetid_ref: TcxGridDBColumn
        Caption = 'Id_Ref'
        DataBinding.FieldName = 'id_ref'
      end
      object cxColTblDetno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
      end
      object cxColTblDetkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg'
        DataBinding.FieldName = 'kode_brg'
      end
      object cxColTblDetdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
      end
      object cxColTblDetqty: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'qty'
      end
      object cxColTblDetsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
      end
      object cxColTblDetharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
      end
      object cxColTblDetmata_uang: TcxGridDBColumn
        Caption = 'Mata Uang'
        DataBinding.FieldName = 'mata_uang'
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxTblHead
      object cxgrdlvl1cxgrd1Level1: TcxGridLevel
        GridView = cxTblDet
      end
    end
  end
  object zqrPO: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, a.no_bukti, a.no_fobj, a.tgl_required, jenis_po, a.' +
        'user, a.user_dept, a.pembayaran, a.f_approval, a.nopol, a.driver' +
        ', a.f_completed,'
      'b.nama, b.kontak'
      'FROM tbl_po_head a '
      'LEFT JOIN tbl_supplier b ON a.kode_supp = b.kode;')
    Params = <>
    Left = 775
    Top = 196
  end
  object dsPO: TDataSource
    DataSet = zqrPO
    Left = 803
    Top = 197
  end
  object zqrPoDet: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      
        'SELECT a.id,  a.id_ref, a.no_bukti, a.kode_brg, b.deskripsi, a.q' +
        'ty, b.satuan, a.harga, a.mata_uang'
      'FROM tbl_po_det a'
      'LEFT JOIN tbl_barang b ON a.kode_brg = b.kode ')
    Params = <>
    Left = 764
    Top = 252
  end
  object dsPoDet: TDataSource
    DataSet = zqrPoDet
    Left = 801
    Top = 252
  end
end
