inherited frmAppPP: TfrmAppPP
  Caption = 'Approval Permintaan Pembelian'
  ExplicitWidth = 894
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 264
      Height = 19
      Caption = 'Approval Permintaan Pembelian'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 49
    Width = 894
    Height = 256
    Align = alTop
    TabOrder = 2
    object cxtbPPHead: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedItemChanged = cxtbPPHeadFocusedItemChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxtbPPHeadColumn1: TcxGridColumn
        Caption = 'Pilih'
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        HeaderAlignmentHorz = taCenter
      end
      object cxColNoPP: TcxGridColumn
        Caption = 'No. PP'
        Width = 126
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbPPHead
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 305
    Width = 894
    Height = 41
    Align = alTop
    Caption = 'Panel3'
    TabOrder = 3
    ExplicitTop = 304
    ExplicitWidth = 185
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 346
    Width = 894
    Height = 158
    Align = alClient
    TabOrder = 4
    ExplicitLeft = 472
    ExplicitTop = 376
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxGrid2DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsDetPP
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid2DBTableView1kode_brg: TcxGridDBColumn
        DataBinding.FieldName = 'kode_brg'
      end
      object cxGrid2DBTableView1qty: TcxGridDBColumn
        DataBinding.FieldName = 'qty'
      end
      object cxGrid2DBTableView1satuan: TcxGridDBColumn
        DataBinding.FieldName = 'satuan'
      end
      object cxGrid2DBTableView1keterangan: TcxGridDBColumn
        DataBinding.FieldName = 'keterangan'
      end
      object cxGrid2DBTableView1mata_uang: TcxGridDBColumn
        DataBinding.FieldName = 'mata_uang'
      end
      object cxGrid2DBTableView1nama_jasa: TcxGridDBColumn
        DataBinding.FieldName = 'nama_jasa'
      end
      object cxGrid2DBTableView1harga: TcxGridDBColumn
        DataBinding.FieldName = 'harga'
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object zqrDetPP: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT * FROM tbl_pp_det WHERE no_bukti = :no_bukti')
    Params = <
      item
        DataType = ftUnknown
        Name = 'no_bukti'
        ParamType = ptUnknown
      end>
    Left = 584
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'no_bukti'
        ParamType = ptUnknown
      end>
  end
  object dsDetPP: TDataSource
    DataSet = zqrDetPP
    Left = 512
    Top = 416
  end
end
