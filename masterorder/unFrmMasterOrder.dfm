inherited frmMasterOrder: TfrmMasterOrder
  Caption = 'frmMasterOrder'
  OnCreate = FormCreate
  ExplicitWidth = 894
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
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
    Visible = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 894
    Height = 41
    Align = alTop
    TabOrder = 2
    object cxdTgl1: TcxDateEdit
      Left = 62
      Top = 9
      TabOrder = 0
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
      TabOrder = 3
      Width = 121
    end
    object btnProses: TButton
      Left = 338
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Proses'
      TabOrder = 4
      OnClick = btnProsesClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 90
    Width = 894
    Height = 295
    Align = alClient
    TabOrder = 3
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsMO
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1no_mo: TcxGridDBColumn
        Caption = 'No.MO'
        DataBinding.FieldName = 'no_mo'
      end
      object cxGrid1DBTableView1no_so: TcxGridDBColumn
        Caption = 'No.SO'
        DataBinding.FieldName = 'no_so'
      end
      object cxGrid1DBTableView1no_spk: TcxGridDBColumn
        Caption = 'No.SPK'
        DataBinding.FieldName = 'no_spk'
      end
      object cxGrid1DBTableView1tgl_spk: TcxGridDBColumn
        Caption = 'Tgl.SPK'
        DataBinding.FieldName = 'tgl_spk'
      end
      object cxGrid1DBTableView1kode_brg: TcxGridDBColumn
        Caption = 'Kode Barang'
        DataBinding.FieldName = 'kode_brg'
      end
      object cxGrid1DBTableView1deskripsi: TcxGridDBColumn
        Caption = 'Nama Barang'
        DataBinding.FieldName = 'deskripsi'
        Width = 314
      end
      object cxGrid1DBTableView1qty_mo: TcxGridDBColumn
        Caption = 'Qty.MO'
        DataBinding.FieldName = 'qty_mo'
      end
      object cxGrid1DBTableView1qty_so: TcxGridDBColumn
        Caption = 'Qty.SO'
        DataBinding.FieldName = 'qty_so'
      end
      object cxGrid1DBTableView1tanggal: TcxGridDBColumn
        Caption = 'Tgl.SO'
        DataBinding.FieldName = 'tanggal'
      end
      object cxGrid1DBTableView1kode_customer: TcxGridDBColumn
        Caption = 'Kode Customer'
        DataBinding.FieldName = 'kode_customer'
      end
      object cxGrid1DBTableView1nama_customer: TcxGridDBColumn
        Caption = 'Nama Customer'
        DataBinding.FieldName = 'nama_customer'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 385
    Width = 894
    Height = 168
    Align = alBottom
    TabOrder = 4
    object Button1: TButton
      Left = 10
      Top = 6
      Width = 75
      Height = 25
      Caption = 'SPK'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 91
      Top = 6
      Width = 92
      Height = 25
      Caption = 'Mutasi Gudang'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 10
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Keluar'
      TabOrder = 2
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
    Left = 194
    Top = 9
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
    Left = 224
    Top = 12
  end
end
