inherited frmLstLain2: TfrmLstLain2
  Caption = 'Kategori - Departemen'
  ClientHeight = 533
  OnCreate = FormCreate
  ExplicitWidth = 1016
  ExplicitHeight = 533
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 330
      Height = 19
      Caption = 'Kategori Barang - Departemen - Gudang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 484
    ExplicitTop = 484
    inherited btnTambah: TButton
      Visible = False
    end
    inherited btnEdit: TButton
      Visible = False
    end
    inherited btnHapus: TButton
      Visible = False
    end
    inherited btnRefresh: TButton
      Visible = False
    end
  end
  object pgLain2: TcxPageControl
    Left = 24
    Top = 67
    Width = 1000
    Height = 423
    ActivePage = cxTabSheet3
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = 7
    TabOrder = 2
    ClientRectBottom = 422
    ClientRectLeft = 1
    ClientRectRight = 999
    ClientRectTop = 21
    object cxTabSheet1: TcxTabSheet
      Caption = 'Kategori Barang'
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 16
        Top = 16
        Width = 585
        Height = 241
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsKategoriBarang
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          object cxGrid1DBTableView1kode: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'kode'
            Options.Editing = False
            Width = 41
          end
          object cxGrid1DBTableView1kategori: TcxGridDBColumn
            Caption = 'Kategori'
            DataBinding.FieldName = 'kategori'
            Width = 477
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = 'Sub Kategori Barang'
      ImageIndex = 4
      object cxGrid5: TcxGrid
        Left = 16
        Top = 16
        Width = 585
        Height = 241
        TabOrder = 0
        object cxGridDBTableView4: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsKategoriBarang
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'kode'
            Options.Editing = False
            Width = 41
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'Kategori'
            DataBinding.FieldName = 'kategori'
            Width = 477
          end
        end
        object cxGridLevel4: TcxGridLevel
          GridView = cxGridDBTableView4
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Departemen'
      ImageIndex = 1
      object cxGrid2: TcxGrid
        Left = 16
        Top = 16
        Width = 585
        Height = 241
        TabOrder = 0
        object cxGridDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsDept
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          object cxColID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'id'
            Options.Editing = False
            Width = 50
          end
          object cxGridDBTableView1departemen: TcxGridDBColumn
            Caption = 'Departemen'
            DataBinding.FieldName = 'departemen'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'Jabatan'
      ImageIndex = 3
      object cxGrid4: TcxGrid
        Left = 16
        Top = 16
        Width = 585
        Height = 241
        TabOrder = 0
        object cxGridDBTableView3: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsJabatan
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'id'
            Options.Editing = False
            Width = 47
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Jabatan'
            DataBinding.FieldName = 'jabatan'
            Width = 291
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = cxGridDBTableView3
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Gudang'
      ImageIndex = 2
      object cxGrid3: TcxGrid
        Left = 16
        Top = 16
        Width = 585
        Height = 241
        TabOrder = 0
        object cxtbGudang: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsGudang
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          object cxtbGudangid: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'id'
            Options.Editing = False
            Width = 32
          end
          object cxtbGudangf_aktif: TcxGridDBColumn
            Caption = 'Aktif'
            DataBinding.FieldName = 'f_aktif'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            Width = 38
          end
          object cxtbGudangkode: TcxGridDBColumn
            Caption = 'Kode'
            DataBinding.FieldName = 'kode'
          end
          object cxtbGudangnama: TcxGridDBColumn
            Caption = 'Nama'
            DataBinding.FieldName = 'nama'
          end
          object cxtbGudanglokasi: TcxGridDBColumn
            Caption = 'Lokasi'
            DataBinding.FieldName = 'lokasi'
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxtbGudang
        end
      end
    end
  end
  object tblKategoriBarang: TZTable
    Connection = DM.zConn
    TableName = 'tbl_kategori_brg'
    Left = 696
    Top = 112
  end
  object dsKategoriBarang: TDataSource
    DataSet = tblKategoriBarang
    Left = 880
    Top = 120
  end
  object tblDept: TZTable
    Connection = DM.zConn
    TableName = 'tbl_dept'
    Left = 696
    Top = 176
  end
  object dsDept: TDataSource
    DataSet = tblDept
    Left = 880
    Top = 184
  end
  object tblJabatan: TZTable
    Connection = DM.zConn
    Active = True
    TableName = 'tbl_jabatan'
    Left = 696
    Top = 232
  end
  object dsJabatan: TDataSource
    DataSet = tblJabatan
    Left = 880
    Top = 240
  end
  object tblGudang: TZTable
    Connection = DM.zConn
    Active = True
    TableName = 'tbl_gudang'
    Left = 696
    Top = 288
    object tblGudangid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object tblGudangkode: TWideStringField
      FieldName = 'kode'
      Required = True
      Size = 10
    end
    object tblGudangnama: TWideStringField
      DisplayLabel = 'Nama Gudang'
      FieldName = 'nama'
    end
    object tblGudangf_aktif: TSmallintField
      FieldName = 'f_aktif'
    end
    object tblGudanglokasi: TWideStringField
      FieldName = 'lokasi'
      Size = 50
    end
  end
  object dsGudang: TDataSource
    DataSet = tblGudang
    Left = 880
    Top = 296
  end
end
