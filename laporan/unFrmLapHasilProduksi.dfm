inherited frmLapHasilProduksi: TfrmLapHasilProduksi
  Caption = 'frmLapHasilProduksi'
  ClientHeight = 610
  ClientWidth = 1125
  OnCreate = FormCreate
  ExplicitWidth = 1125
  ExplicitHeight = 610
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1125
    ExplicitWidth = 1125
    object Label13: TLabel
      Left = 10
      Top = 16
      Width = 187
      Height = 19
      Caption = 'Laporan Hasil Produksi'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 561
    Width = 1125
    TabOrder = 3
    ExplicitTop = 561
    ExplicitWidth = 1125
    inherited btnTambah: TButton
      Left = 498
      TabOrder = 2
      Visible = False
      ExplicitLeft = 498
    end
    inherited btnEdit: TButton
      Left = 579
      TabOrder = 3
      Visible = False
      ExplicitLeft = 579
    end
    inherited btnHapus: TButton
      Left = 660
      TabOrder = 4
      Visible = False
      ExplicitLeft = 660
    end
    inherited btnKeluar: TButton
      Left = 822
      Top = 19
      TabOrder = 6
      Visible = False
      ExplicitLeft = 822
      ExplicitTop = 19
    end
    inherited btnRefresh: TButton
      Left = 741
      TabOrder = 5
      Visible = False
      ExplicitLeft = 741
    end
    object Button1: TButton
      Left = 15
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Excel'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 96
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Keluar'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 97
    Width = 1125
    Height = 464
    Align = alClient
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsHP
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      object cxGrid1DBTableView1no_mo: TcxGridDBColumn
        Caption = 'No. MO'
        DataBinding.FieldName = 'no_mo'
        Width = 104
      end
      object cxGrid1DBTableView1no_so: TcxGridDBColumn
        Caption = 'No. SO'
        DataBinding.FieldName = 'no_so'
        Width = 102
      end
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        Caption = 'No. SPK'
        DataBinding.FieldName = 'no_spk'
        Width = 122
      end
      object cxGrid1DBTableView1deskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 187
      end
      object cxGrid1DBTableView1tanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
      end
      object cxGrid1DBTableView1jam1: TcxGridDBColumn
        Caption = 'Awal'
        DataBinding.FieldName = 'jam1'
      end
      object cxGrid1DBTableView1jam2: TcxGridDBColumn
        Caption = 'Akhir'
        DataBinding.FieldName = 'jam2'
      end
      object cxGrid1DBTableView1no_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
      end
      object cxGrid1DBTableView1Column2: TcxGridDBColumn
        Caption = 'Qty. SPK'
        DataBinding.FieldName = 'qty_spk'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 76
      end
      object cxGrid1DBTableView1qty_prod: TcxGridDBColumn
        Caption = 'Qty. Prod'
        DataBinding.FieldName = 'qty_prod'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 78
      end
      object cxGrid1DBTableView1shift: TcxGridDBColumn
        Caption = 'Shift'
        DataBinding.FieldName = 'shift'
      end
      object cxGrid1DBTableView1operator: TcxGridDBColumn
        Caption = 'Operator'
        DataBinding.FieldName = 'operator'
        Width = 267
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 1125
    Height = 48
    Align = alTop
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 15
      Top = 14
      Caption = 'Tanggal'
    end
    object cxdTgl1: TcxDateEdit
      Left = 70
      Top = 14
      TabOrder = 2
      Width = 121
    end
    object cxdTgl2: TcxDateEdit
      Left = 225
      Top = 14
      TabOrder = 3
      Width = 121
    end
    object cxLabel2: TcxLabel
      Left = 197
      Top = 15
      Caption = 'S/D'
    end
    object btnProses: TButton
      Left = 353
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Proses'
      TabOrder = 0
      OnClick = btnProsesClick
    end
  end
  object zqrHP: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'select a.tanggal, b.no_spk, jam1, jam2, a.no_bukti, a.qty_prod, ' +
        'c.no_mo, c.no_so, d.deskripsi, a.shift, a.operator, b.qty qty_sp' +
        'k'
      'from tbl_hsl_prd a'
      'left join tbl_spk b on b.id = a.id_spk'
      'left join tbl_mo c on c.id = b.id_mo'
      'left join tbl_barang d on d.id = c.id_brg'
      'where a.tanggal between :tgl1 and :tgl2')
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
    Left = 632
    Top = 184
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
  object dsHP: TDataSource
    DataSet = zqrHP
    Left = 728
    Top = 184
  end
end
