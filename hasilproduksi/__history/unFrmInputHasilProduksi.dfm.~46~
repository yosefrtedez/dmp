inherited frmInputHasilProduksi: TfrmInputHasilProduksi
  Caption = 'Input Hasil Produksi'
  ClientHeight = 653
  ClientWidth = 1011
  ExplicitWidth = 1011
  ExplicitHeight = 653
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1011
    ExplicitWidth = 1011
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 116
      Height = 19
      Caption = 'Hasil Produksi'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 604
    Width = 1011
    TabOrder = 5
    ExplicitTop = 604
    ExplicitWidth = 1011
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 1011
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
    Width = 1011
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
      object cxtbSPKColumn4: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.FieldName = 'kode_brg'
        Width = 85
      end
      object cxtbSPKdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 197
      end
      object cxtbSPKColumn1: TcxGridDBColumn
        Caption = 'Qty. SPK'
        DataBinding.FieldName = 'qty_spk'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
      end
      object cxtbSPKColumn2: TcxGridDBColumn
        Caption = 'Total Hasil Prod.'
        DataBinding.FieldName = 'qty_prod'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 94
      end
      object cxtbSPKColumn3: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbSPK
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 257
    Width = 1011
    Height = 49
    Align = alTop
    TabOrder = 3
    object cxLabel4: TcxLabel
      Left = 10
      Top = 8
      Caption = 'Input Hasil Produksi :'
    end
    object cxLabel6: TcxLabel
      Left = 10
      Top = 26
      Caption = 'No. SPK :'
    end
    object cxlbNoSPK: TcxLabel
      Left = 61
      Top = 26
      Caption = '-'
    end
  end
  object cxGrid3: TcxGrid
    Left = 0
    Top = 306
    Width = 1011
    Height = 129
    Align = alTop
    TabOrder = 4
    ExplicitTop = 280
    object cxtbHslProd: TcxGridTableView
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
      DataController.OnAfterPost = cxtbHslProdDataControllerAfterPost
      DataController.OnBeforeDelete = cxtbHslProdDataControllerBeforeDelete
      DataController.OnBeforePost = cxtbHslProdDataControllerBeforePost
      DataController.OnNewRecord = cxtbHslProdDataControllerNewRecord
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      object cxtbHslProdColumn1: TcxGridColumn
        Caption = 'Tanggal'
        Visible = False
      end
      object cxColJam1: TcxGridColumn
        Caption = 'Jam Awal'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Kind = ckDateTime
        Width = 118
      end
      object cxColJam2: TcxGridColumn
        Caption = 'Jam Akhir'
        DataBinding.ValueType = 'DateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Kind = ckDateTime
        Width = 126
      end
      object cxColShift: TcxGridColumn
        Caption = 'Shift'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          '1'
          '2'
          '3')
      end
      object cxColMesin: TcxGridColumn
        Caption = 'Mesin'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Mesin'
            FieldName = 'kode'
          end>
        Properties.ListSource = dsMesin
        Width = 80
      end
      object cxColOperator: TcxGridColumn
        Caption = 'Operator'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 121
      end
      object cxColQtyProd: TcxGridColumn
        Caption = 'Qty. Hasil Prod'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Properties.ValueType = vtFloat
        Width = 94
      end
      object cxColSatBJ: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Satuan'
            FieldName = 'satuan'
          end>
        Properties.ListSource = dsSatuan
        Properties.ReadOnly = True
        Width = 73
      end
      object cxColGdgBJ: TcxGridColumn
        Caption = 'Gudang BJ'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Gudang'
            FieldName = 'kode'
          end>
        Properties.ListSource = dsGdg
        Width = 73
      end
      object cxColQtyAfal: TcxGridColumn
        Caption = 'Qty. Afal'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Visible = False
        Width = 69
      end
      object cxColSatAfal: TcxGridColumn
        Caption = 'Satuan'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Satuan'
            FieldName = 'satuan'
          end>
        Properties.ListSource = dsSatuan
        Visible = False
      end
      object cxColGdgAfal: TcxGridColumn
        Caption = 'Gudang Afal'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = 'Kode'
            FieldName = 'kode'
          end>
        Properties.ListSource = dsGdg
        Visible = False
        Width = 79
      end
      object cxColStatus: TcxGridColumn
        Caption = 'Status'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ReadOnly = True
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
      end
      object cxColIdSat: TcxGridColumn
        Visible = False
      end
      object cxColIdGdg: TcxGridColumn
        Visible = False
      end
    end
    object cxGridLevel2: TcxGridLevel
      GridView = cxtbHslProd
    end
  end
  object dsSPK: TDataSource
    DataSet = zqrSPK
    Left = 640
    Top = 24
  end
  object zqrSPK: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, a.no_spk, a.tanggal, b.no_mo, b.no_so, c.deskripsi,' +
        ' c.id_satuan, a.qty qty_spk, d.satuan,c.kode kode_brg,c.id id_br' +
        'g, b.id_so,'
      
        'IFNULL((SELECT SUM(qty_prod) FROM tbl_hsl_prd WHERE id_spk = a.i' +
        'd),0) qty_prod '
      'FROM tbl_spk a '
      'LEFT JOIN tbl_mo b on a.id_mo = b.id'
      'LEFT JOIN tbl_barang c on b.id_brg = c.id'
      'LEFT JOIN tbl_satuan d on d.id = c.id_satuan'
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
    Left = 704
    Top = 24
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
  object dsMesin: TDataSource
    DataSet = zqrMesin
    Left = 816
    Top = 24
  end
  object zqrMesin: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT id, kode, nama '
      'FROM tbl_mesin'
      'ORDER BY nama')
    Params = <>
    Left = 896
    Top = 24
  end
  object dsSatuan: TDataSource
    DataSet = zqrSatuan
    Left = 480
    Top = 24
  end
  object zqrSatuan: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT id, satuan '
      'FROM tbl_satuan')
    Params = <>
    Left = 560
    Top = 24
  end
  object dsGdg: TDataSource
    DataSet = zqrGdg
    Left = 336
    Top = 8
  end
  object zqrGdg: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'select id, kode, nama '
      'FROM tbl_gudang')
    Params = <>
    Left = 416
    Top = 8
  end
end
