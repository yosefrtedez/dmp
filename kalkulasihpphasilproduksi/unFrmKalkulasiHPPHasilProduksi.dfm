inherited frmKalkulasiHPPHasilProduksi: TfrmKalkulasiHPPHasilProduksi
  Caption = 'Kalkulasi HPP Hasil Produksi'
  ClientHeight = 605
  ClientWidth = 1069
  OnCreate = FormCreate
  ExplicitWidth = 1069
  ExplicitHeight = 605
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1069
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 234
      Height = 19
      Caption = 'Kalkulasi HPP Hasil Produksi'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 556
    Width = 1069
    TabOrder = 5
    inherited btnTambah: TButton
      Left = 311
      TabOrder = 1
      Visible = False
      ExplicitLeft = 311
    end
    inherited btnEdit: TButton
      Left = 392
      TabOrder = 2
      Visible = False
      ExplicitLeft = 392
    end
    inherited btnHapus: TButton
      Left = 473
      TabOrder = 3
      Visible = False
      ExplicitLeft = 473
    end
    inherited btnKeluar: TButton
      Left = 986
      TabOrder = 5
    end
    inherited btnRefresh: TButton
      Left = 554
      TabOrder = 4
      Visible = False
      ExplicitLeft = 554
    end
    object Button1: TButton
      Left = 8
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 1069
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -60
    ExplicitWidth = 1076
    object cxdTgl1: TcxDateEdit
      Left = 62
      Top = 9
      TabOrder = 1
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
      TabOrder = 2
      Width = 121
    end
    object btnProses: TButton
      Left = 338
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Proses'
      TabOrder = 0
      OnClick = btnProsesClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 90
    Width = 1069
    Height = 200
    Align = alTop
    TabOrder = 2
    ExplicitTop = 87
    object cxtbSPK: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxtbSPKFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxColNoSPK: TcxGridColumn
        Caption = 'No. SPK'
        Options.Editing = False
        Width = 95
      end
      object cxColNoSO: TcxGridColumn
        Caption = 'No. SO'
        Options.Editing = False
        Width = 96
      end
      object cxColDeskripsi: TcxGridColumn
        Caption = 'Deskripsi'
        Options.Editing = False
        Width = 215
      end
      object cxColQtySPK: TcxGridColumn
        Caption = 'Qty. SPK'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0,00'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taRightJustify
        Width = 74
      end
      object cxColQtyHP: TcxGridColumn
        Caption = 'Qty. Produksi'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 78
      end
      object cxColHPP: TcxGridColumn
        Caption = 'HPP'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
        Width = 83
      end
      object cxColIdSPK: TcxGridColumn
        DataBinding.ValueType = 'Integer'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbSPK
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 290
    Width = 1069
    Height = 41
    Align = alTop
    TabOrder = 3
    ExplicitTop = 284
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 331
    Width = 1069
    Height = 225
    Align = alClient
    TabOrder = 4
    ExplicitTop = 98
    ExplicitHeight = 200
    object cxtbBOM: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxColKodeBrg: TcxGridColumn
        Caption = 'Kode Brg.'
        Options.Editing = False
        Width = 95
      end
      object cxColDeskripsi2: TcxGridColumn
        Caption = 'Deskripsi'
        Options.Editing = False
        Width = 321
      end
      object cxColQtyBOM: TcxGridColumn
        Caption = 'Qty. BOM'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Options.Editing = False
        Width = 103
      end
      object cxColQtyPengambilan: TcxGridColumn
        Caption = 'Qty. Pengambilan'
        DataBinding.ValueType = 'Float'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0,00'
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 120
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxtbBOM
    end
  end
  object zqrSPK: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.id, a.no_spk, b.no_bukti no_so, c.deskripsi, a.qty qty_' +
        'spk'
      'FROM tbl_spk a '
      'LEFT JOIN tbl_so_head b ON a.id_so = b.id '
      'LEFT JOIN tbl_barang c ON a.id_brg = c.id'
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
    Left = 640
    Top = 160
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
