inherited frmLapOutstandingSO: TfrmLapOutstandingSO
  Caption = 'Laporan Outstanding Sales Order'
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
      Width = 269
      Height = 19
      Caption = 'Laporan Outstanding Sales Order'
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
      DataController.DataSource = dsSO
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      object cxGrid1DBTableView1no_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Width = 123
      end
      object cxGrid1DBTableView1nama_supplier: TcxGridDBColumn
        Caption = 'Nama Customer'
        DataBinding.FieldName = 'nama_customer'
        Width = 303
      end
      object cxGrid1DBTableView1Column2: TcxGridDBColumn
        Caption = 'Telpon'
        DataBinding.FieldName = 'telpon'
        Width = 82
      end
      object cxGrid1DBTableView1kode_brg: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.FieldName = 'kode_brg'
        Width = 72
      end
      object cxGrid1DBTableView1deskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 241
      end
      object cxGrid1DBTableView1qty_po: TcxGridDBColumn
        Caption = 'Qty. SO'
        DataBinding.FieldName = 'qty_so'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
      end
      object cxGrid1DBTableView1qty_terima: TcxGridDBColumn
        Caption = 'Qty. Kirim'
        DataBinding.FieldName = 'qty_kirim'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 76
      end
      object cxGrid1DBTableView1satuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 59
      end
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        Caption = 'Komplit'
        DataBinding.FieldName = 'f_completed'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
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
  object zqrSO: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'select a.no_bukti, b.nama nama_customer, b.telpon, c.kode_brg, d' +
        '.deskripsi, c.qty qty_so,'
      
        'ifnull((select sum(qty) from tbl_sj_det where id_so = a.id and i' +
        'd_brg = c.id_brg),0) qty_kirim,'
      'e.satuan, a.f_completed'
      'from tbl_so_head a'
      'left join tbl_customer b on a.id_cust = b.id'
      'left join tbl_so_det c on c.id_ref = a.id'
      'left join tbl_barang d on d.id = c.id_brg'
      'left join tbl_satuan e on e.id = c.id_satuan'
      'where a.tanggal between :tgl1 and :tgl2'
      'and left(a.no_bukti,2) = '#39'SO'#39)
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
  object dsSO: TDataSource
    DataSet = zqrSO
    Left = 728
    Top = 184
  end
end
