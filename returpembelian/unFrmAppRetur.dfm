inherited frmAppRetur: TfrmAppRetur
  Caption = 'Approval Retur Pembelian'
  ClientWidth = 1134
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1134
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1134
    ExplicitWidth = 1134
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 215
      Height = 19
      Caption = 'Approval Retur Pembelian'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Width = 1134
    TabOrder = 4
    ExplicitWidth = 1134
    inherited btnSimpan: TButton
      Left = 9
      Top = 11
      OnClick = btnSimpanClick
      ExplicitLeft = 9
      ExplicitTop = 11
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 49
    Width = 1134
    Height = 214
    Align = alClient
    TabOrder = 1
    object cxTblAppReturHead: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxTblAppReturHeadFocusedRecordChanged
      DataController.DataSource = dsRet
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsView.CellTextMaxLineCount = 10
      Preview.MaxLineCount = 10
      object cxColTblAppReturHeadno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Options.Editing = False
        Width = 100
      end
      object cxColTblAppReturHeadid_invoice: TcxGridDBColumn
        Caption = 'Invoice'
        DataBinding.FieldName = 'id_invoice'
        Options.Editing = False
        Width = 100
      end
      object cxColTblAppReturHeadnama: TcxGridDBColumn
        Caption = 'Supplier'
        DataBinding.FieldName = 'nama'
        Options.Editing = False
        Width = 150
      end
      object cxColTblAppReturHeadketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Options.Editing = False
        Width = 200
      end
      object cxColTblAppReturHeadtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Options.Editing = False
      end
      object cxColTblAppReturHeaduser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
        Options.Editing = False
      end
      object cxColTblAppReturHeaduser_dept: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'user_dept'
        Options.Editing = False
      end
    end
    object cxTblDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsRetDet
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
      GridView = cxTblAppReturHead
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 263
    Width = 1134
    Height = 41
    Align = alBottom
    TabOrder = 2
    object cxLabel1: TcxLabel
      Left = 10
      Top = 11
      Caption = 'Detail Purchase Order'
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 304
    Width = 1134
    Height = 200
    Align = alBottom
    TabOrder = 3
    object cxTblAppReturDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsRetDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#0.00'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      object cxColTblAppReturDetno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Options.Editing = False
        Width = 100
      end
      object cxColTblAppReturDetkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg'
        DataBinding.FieldName = 'kode_brg'
        Options.Editing = False
        Width = 90
      end
      object cxColTblAppReturDetdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Options.Editing = False
        Width = 150
      end
      object cxColTblAppReturDetqty: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'qty'
        Options.Editing = False
      end
      object cxColTblAppReturDetsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Options.Editing = False
        Width = 70
      end
      object cxColTblAppReturDetharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        Options.Editing = False
        Width = 100
      end
      object cxColTblAppReturDetketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Options.Editing = False
        Width = 200
      end
      object cxColTblAppReturDetkode: TcxGridDBColumn
        Caption = 'Gudang'
        DataBinding.FieldName = 'kode'
        Options.Editing = False
      end
      object cxColTblAppReturDetmata_uang: TcxGridDBColumn
        Caption = 'Valuta'
        DataBinding.FieldName = 'mata_uang'
        Options.Editing = False
      end
      object cxColTblAppReturDetnilai_tukar: TcxGridDBColumn
        Caption = 'Rate'
        DataBinding.FieldName = 'nilai_tukar'
        Options.Editing = False
      end
      object cxColTblAppReturDetppn: TcxGridDBColumn
        Caption = 'PPn'
        DataBinding.FieldName = 'ppn'
        Options.Editing = False
      end
      object cxColTblAppReturDettotal: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
        Options.Editing = False
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxTblAppReturDet
    end
  end
  object zqrRet: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.*, b.nama'
      'FROM tbl_trsreturpemb_head a'
      'LEFT JOIN tbl_supplier b ON a.id_supplier = b.id'
      'where a.f_app = 0')
    Params = <>
    Left = 734
    Top = 202
  end
  object dsRet: TDataSource
    DataSet = zqrRet
    Left = 766
    Top = 202
  end
  object zqrRetDet: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT a.*, b.deskripsi, c.kode, d.satuan,'
      
        'IF(ppn='#39'PPN'#39',a.qty * a.harga * 110/100, a.qty * a.harga) AS tota' +
        'l'
      'FROM tbl_trsreturpemb_det a'
      'LEFT JOIN tbl_barang b ON a.kode_brg = b.kode'
      'LEFT JOIN tbl_gudang c ON a.id_gdg = c.id'
      'LEFT JOIN tbl_satuan d ON a.id_satuan = d.id'
      'WHERE a.id_ref = :id_ref')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 732
    Top = 252
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
  object dsRetDet: TDataSource
    DataSet = zqrRetDet
    Left = 801
    Top = 252
  end
end
