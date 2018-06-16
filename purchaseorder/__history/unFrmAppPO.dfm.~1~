inherited frmAppPO: TfrmAppPO
  Caption = 'Approval PO'
  ClientWidth = 939
  OnShow = FormShow
  ExplicitWidth = 939
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 939
    object lbl1: TLabel
      Left = 19
      Top = 13
      Width = 303
      Height = 19
      Caption = 'Approval Permintaan Purchase Order'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Width = 939
    inherited btnSimpan: TButton
      OnClick = btnSimpanClick
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 49
    Width = 939
    Height = 195
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 14
    ExplicitTop = 61
    ExplicitWidth = 641
    object cxTblHead: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.OnRecordChanged = cxTblHeadDataControllerRecordChanged
      object cxColChkApp: TcxGridColumn
        Caption = 'Pilih'
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueGrayed = 'Null'
        HeaderAlignmentHorz = taCenter
        Width = 71
      end
      object cxColID: TcxGridColumn
        Caption = 'ID'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxSpinEditProperties'
        Options.Editing = False
        Width = 79
      end
      object cxColNoPO: TcxGridColumn
        Caption = 'No. PO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 150
      end
      object cxColNoPP: TcxGridColumn
        Caption = 'No. PP'
        Options.Editing = False
        Width = 150
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxTblHead
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 244
    Width = 939
    Height = 41
    Align = alTop
    TabOrder = 3
    ExplicitTop = 304
    ExplicitWidth = 896
  end
  object cxgrd2: TcxGrid
    Left = 0
    Top = 285
    Width = 939
    Height = 219
    Align = alClient
    TabOrder = 4
    ExplicitLeft = -1
    object cxTblDetail: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsDetPO
      DataController.DetailKeyFieldNames = 'id_ref'
      DataController.KeyFieldNames = 'id_ref'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxColTblDetailid: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'id'
      end
      object cxColTblDetailid_ref: TcxGridDBColumn
        Caption = 'ID Ref'
        DataBinding.FieldName = 'id_ref'
        Width = 73
      end
      object cxColTblDetailno_bukti: TcxGridDBColumn
        Caption = 'No Bukti'
        DataBinding.FieldName = 'no_bukti'
      end
      object cxColTblDetailkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg'
        DataBinding.FieldName = 'kode_brg'
        Width = 100
      end
      object cxColTblDetaildeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 200
      end
      object cxColTblDetailqty: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'qty'
        Width = 80
      end
      object cxColTblDetailsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
      end
      object cxColTblDetailharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
      end
      object cxColTblDetailppn: TcxGridDBColumn
        Caption = 'PPn'
        DataBinding.FieldName = 'ppn'
        Width = 100
      end
    end
    object cxgrdlvl1Grid2Level1: TcxGridLevel
      GridView = cxTblDetail
    end
  end
  object dsDetPO: TDataSource
    DataSet = zqrDetPO
    Left = 550
    Top = 422
  end
  object zqrDetPO: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, b.id_ref, a.no_bukti, b.kode_brg, c.deskripsi, b.qt' +
        'y, b.satuan, b.harga, b.ppn'
      'FROM tbl_po_head a'
      'LEFT JOIN tbl_po_det b ON a.id = b.id_ref '
      'LEFT JOIN tbl_barang c ON c.kode = b.kode_brg'
      'where id_ref = :id_ref')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 521
    Top = 423
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
end
