inherited frmLstKoreksi: TfrmLstKoreksi
  Caption = 'Koreksi Barang'
  OnCreate = FormCreate
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 124
      Height = 19
      Caption = 'Koreksi Barang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    TabOrder = 4
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      OnClick = btnEditClick
    end
    inherited btnHapus: TButton
      OnClick = btnHapusClick
    end
    inherited btnRefresh: TButton
      OnClick = btnRefreshClick
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 169
    Align = alClient
    TabOrder = 1
    object cxtbKoreksiHead: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Visible = False
      NavigatorButtons.Cancel.Visible = False
      NavigatorButtons.Refresh.Visible = True
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      OnFocusedRecordChanged = cxtbKoreksiHeadFocusedRecordChanged
      DataController.DataSource = dsKoreksi
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Navigator = True
      OptionsView.CellTextMaxLineCount = 10
      Preview.MaxLineCount = 10
      object cxtbKoreksiHeadColumn2: TcxGridDBColumn
        Caption = 'Posting'
        DataBinding.FieldName = 'f_posting'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
      end
      object cxColTblTrsMasukHeadno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Options.Editing = False
        Width = 100
      end
      object cxColTblTrsMasukHeadtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Options.Editing = False
        Width = 100
      end
      object cxColTblTrsMasukHeaduser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
        Options.Editing = False
        Width = 120
      end
      object cxColTblTrsMasukHeaduser_dept: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'user_dept'
        Options.Editing = False
      end
    end
    object cxTblDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
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
      GridView = cxtbKoreksiHead
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 218
    Width = 1016
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      1016
      41)
    object cxLabel1: TcxLabel
      Left = 10
      Top = 12
      Caption = 'Detail Koreksi Barang'
    end
    object btnPosting: TButton
      Left = 933
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Posting'
      TabOrder = 0
      Visible = False
      OnClick = btnPostingClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 259
    Width = 1016
    Height = 200
    Align = alBottom
    TabOrder = 3
    object cxtbKoreksiDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsKoreksiDet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      object cxColTblTrsMasukDetno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Options.Editing = False
        Width = 100
      end
      object cxColTblTrsMasukDetkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg'
        DataBinding.FieldName = 'kode_brg'
        Options.Editing = False
        Width = 100
      end
      object cxColTblTrsMasukDetdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Options.Editing = False
        Width = 200
      end
      object cxColTblTrsMasukDetqty: TcxGridDBColumn
        Caption = 'Stok Lama'
        DataBinding.FieldName = 'stoklama'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        Options.Editing = False
        Width = 80
      end
      object cxtbKoreksiDetColumn1: TcxGridDBColumn
        Caption = 'Stok Baru'
        DataBinding.FieldName = 'stokbaru'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
      end
      object cxtbKoreksiDetColumn2: TcxGridDBColumn
        Caption = 'Qty. Koreksi'
        DataBinding.FieldName = 'qtykoreksi'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        Width = 71
      end
      object cxColTblTrsMasukDetsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Options.Editing = False
        Width = 80
      end
      object cxColTblTrsMasukDetketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Options.Editing = False
        Width = 200
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbKoreksiDet
    end
  end
  object zqrKoreksi: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'select * from  tbl_trskoreksi_head order by no_bukti')
    Params = <>
    Left = 601
    Top = 146
  end
  object dsKoreksi: TDataSource
    DataSet = zqrKoreksi
    Left = 693
    Top = 154
  end
  object zqrKoreksiDet: TZReadOnlyQuery
    Connection = DM.zConn
    AutoCalcFields = False
    SQL.Strings = (
      
        'SELECT a.id, a.id_ref, a.no_bukti, a.kode_brg, b.deskripsi, c.sa' +
        'tuan, a.stoklama, a.stokbaru, a.qtykoreksi, a.keterangan'
      'FROM tbl_trskoreksi_det a'
      'LEFT JOIN tbl_barang b ON a.id_brg = b.id'
      'LEFT JOIN tbl_satuan c ON a.id_satuan = c.id'
      'LEFT JOIN tbl_gudang d ON d.id = a.id_gdg'
      'where a.id_ref = :id_ref')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 621
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
  object dsKoreksiDet: TDataSource
    DataSet = zqrKoreksiDet
    Left = 690
    Top = 368
  end
end
