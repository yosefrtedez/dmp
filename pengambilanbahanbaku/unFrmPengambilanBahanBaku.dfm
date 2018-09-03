inherited frmPengambilanBahanBaku: TfrmPengambilanBahanBaku
  Caption = 'Pengambilan Bahan Baku'
  ClientHeight = 782
  ClientWidth = 1044
  Position = poDesigned
  ExplicitWidth = 1044
  ExplicitHeight = 782
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1044
    ExplicitWidth = 1044
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 208
      Height = 19
      Caption = 'Pengambilan Bahan Baku'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 733
    Width = 1044
    TabOrder = 7
    ExplicitTop = 733
    ExplicitWidth = 1044
    inherited btnSimpan: TButton
      Visible = False
    end
    inherited btnBatal: TButton
      Left = 10
      Top = 13
      Caption = 'Keluar'
      ExplicitLeft = 10
      ExplicitTop = 13
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 1044
    Height = 49
    Align = alTop
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 10
      Top = 15
      Caption = 'Tanggal'
    end
    object cxdTgl1: TcxDateEdit
      Left = 60
      Top = 14
      TabOrder = 1
      Width = 121
    end
    object cxdTgl2: TcxDateEdit
      Left = 213
      Top = 14
      TabOrder = 2
      Width = 121
    end
    object cxLabel2: TcxLabel
      Left = 186
      Top = 15
      Caption = 'S/D'
    end
    object btnProses: TButton
      Left = 341
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Proses'
      TabOrder = 0
      OnClick = btnProsesClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 98
    Width = 1044
    Height = 159
    Align = alTop
    TabOrder = 2
    object cxtbSPK: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxtbSPKFocusedRecordChanged
      DataController.DataSource = dsSPK
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      object cxtbSPKid: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        Visible = False
      end
      object cxtbSPKno_spk: TcxGridDBColumn
        Caption = 'No. SPK'
        DataBinding.FieldName = 'no_spk'
        Width = 85
      end
      object cxtbSPKtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
      end
      object cxtbSPKno_mo: TcxGridDBColumn
        Caption = 'No. MO'
        DataBinding.FieldName = 'no_mo'
      end
      object cxtbSPKno_so: TcxGridDBColumn
        Caption = 'No. SO'
        DataBinding.FieldName = 'no_so'
      end
      object cxtbSPKdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 379
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbSPK
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 257
    Width = 1044
    Height = 49
    Align = alTop
    TabOrder = 3
    object cxLabel3: TcxLabel
      Left = 10
      Top = 8
      Caption = 'Bill Of Material / Bahan Baku :'
    end
    object cxLabel5: TcxLabel
      Left = 10
      Top = 26
      Caption = 'No. SPK : '
    end
    object cxlbNoSPK: TcxLabel
      Left = 60
      Top = 26
      Caption = '-'
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 306
    Width = 1044
    Height = 110
    Align = alTop
    TabOrder = 4
    object cxtbBOM: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxtbBOMFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsView.GroupByBox = False
      object cxColIsBOM2: TcxGridDBColumn
        Caption = 'BOM?'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 37
      end
      object cxColKodeBrg: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.ValueType = 'String'
        PropertiesClassName = 'TcxTextEditProperties'
      end
      object cxColDeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.ValueType = 'String'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 286
      end
      object cxColQtySPK: TcxGridDBColumn
        Caption = 'Qty. SPK'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 70
      end
      object cxColSatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.ValueType = 'String'
      end
      object cxColDiambil: TcxGridDBColumn
        Caption = 'Sudah Diambil'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 97
      end
      object cxtbBOMColumn4: TcxGridDBColumn
        Caption = 'Sisa'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 106
      end
      object cxColIdBrg: TcxGridDBColumn
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxSpinEditProperties'
        Visible = False
      end
      object cxColIdSatuan: TcxGridDBColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxtbBOM
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 416
    Width = 1044
    Height = 34
    Align = alTop
    TabOrder = 5
    object cxLabel4: TcxLabel
      Left = 10
      Top = 8
      Caption = 'Input Pengambilan Bahan Baku :'
    end
    object cxLabel6: TcxLabel
      Left = 298
      Top = 6
      Caption = 'Bahan Baku : '
      Visible = False
    end
    object cxlbBahanBaku: TcxLabel
      Left = 367
      Top = 6
      Caption = '-'
      Visible = False
    end
  end
  object cxGrid3: TcxGrid
    Left = 0
    Top = 450
    Width = 1044
    Height = 135
    Align = alTop
    TabOrder = 6
    object cxtbBomDet: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.PriorPage.Visible = False
      NavigatorButtons.NextPage.Visible = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
      NavigatorButtons.Refresh.Visible = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.OnAfterPost = cxtbBomDetDataControllerAfterPost
      DataController.OnBeforeDelete = cxtbBomDetDataControllerBeforeDelete
      DataController.OnBeforePost = cxtbBomDetDataControllerBeforePost
      DataController.OnNewRecord = cxtbBomDetDataControllerNewRecord
      DataController.OnRecordChanged = cxtbBomDetDataControllerRecordChanged
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.Appending = True
      OptionsData.Inserting = False
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      object cxColKodeBrg2: TcxGridColumn
        Caption = 'Kode Brg.'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Kode'
            FieldName = 'kode'
          end
          item
            Caption = 'Deskripsi'
            FieldName = 'deskripsi'
          end>
        Properties.ListSource = dsBrg
        Width = 71
      end
      object cxColDeskripsi2: TcxGridColumn
        Caption = 'Deskripsi'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Deskripsi'
            FieldName = 'deskripsi'
          end
          item
            Caption = 'Kode'
            FieldName = 'kode'
          end>
        Properties.ListSource = dsBrg
        Width = 236
      end
      object cxColIsBom: TcxGridColumn
        Caption = 'BOM?'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Width = 41
      end
      object cxColTanggal: TcxGridColumn
        Caption = 'Tanggal'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 63
      end
      object cxColJam: TcxGridColumn
        Caption = 'Jam'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxTimeEditProperties'
        Width = 81
      end
      object cxColQtyInput: TcxGridColumn
        Caption = 'Quantity'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        HeaderAlignmentHorz = taRightJustify
        Width = 84
      end
      object cxColSatuan2: TcxGridColumn
        Caption = 'Satuan'
        Width = 62
      end
      object cxColOperator: TcxGridColumn
        Caption = 'Personil Gdg.'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 107
      end
      object cxColGdg: TcxGridColumn
        Caption = 'Gudang'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Gudang'
            FieldName = 'kode'
          end>
        Properties.ListSource = dsGdg
      end
      object cxColStatus: TcxGridColumn
        Caption = 'Status'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 82
      end
      object cxColIdSatuan2: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
      object cxColKodeBrg3: TcxGridColumn
        Visible = False
      end
    end
    object cxGridLevel2: TcxGridLevel
      GridView = cxtbBomDet
    end
  end
  object zqrSPK: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, a.no_spk, a.tanggal, b.no_mo, b.no_so, c.deskripsi,' +
        ' a.id_so'
      'FROM tbl_spk a '
      'LEFT JOIN tbl_mo b on a.id_mo = b.id'
      'LEFT JOIN tbl_barang c on b.id_brg = c.id'
      'WHERE a.tanggal BETWEEN :tgl1 AND :tgl2')
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
    Left = 656
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
  object dsSPK: TDataSource
    DataSet = zqrSPK
    Left = 600
  end
  object zqrGdg: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT id, kode FROM tbl_gudang')
    Params = <>
    Left = 792
  end
  object dsGdg: TDataSource
    DataSet = zqrGdg
    Left = 744
  end
  object zqrBrg: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT id, kode, deskripsi'
      'FROM tbl_barang '
      'WHERE f_aktif = 1'
      'ORDER BY deskripsi')
    Params = <>
    Left = 488
    Top = 360
  end
  object dsBrg: TDataSource
    DataSet = zqrBrg
    Left = 552
    Top = 360
  end
end
