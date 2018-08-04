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
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 1011
    Height = 49
    Align = alTop
    TabOrder = 1
    ExplicitTop = 43
    ExplicitWidth = 894
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
    ExplicitWidth = 894
    object cxtbSPK: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
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
    Width = 1011
    Height = 23
    Align = alTop
    TabOrder = 3
    ExplicitWidth = 894
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 280
    Width = 1011
    Height = 110
    Align = alTop
    TabOrder = 4
    ExplicitWidth = 894
    object cxtbBOM: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
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
      end
      object cxColIdSatuan: TcxGridDBColumn
        DataBinding.ValueType = 'Integer'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxtbBOM
    end
  end
  object dsSPK: TDataSource
    DataSet = zqrSPK
    Left = 640
    Top = 24
  end
  object zqrSPK: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT a.id, a.no_spk, a.tanggal, b.no_mo, b.no_so, c.deskripsi'
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
end
