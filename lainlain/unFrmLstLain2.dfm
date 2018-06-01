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
  object cxPageControl1: TcxPageControl
    Left = 8
    Top = 55
    Width = 1000
    Height = 423
    ActivePage = cxTabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = 7
    TabOrder = 2
    ExplicitHeight = 398
    ClientRectBottom = 422
    ClientRectLeft = 1
    ClientRectRight = 999
    ClientRectTop = 21
    object cxTabSheet1: TcxTabSheet
      Caption = 'Kategori Barang'
      ImageIndex = 0
      ExplicitLeft = 2
      ExplicitTop = 22
      ExplicitHeight = 376
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
    object cxTabSheet2: TcxTabSheet
      Caption = 'Departemen'
      ImageIndex = 1
      ExplicitHeight = 376
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
    object cxTabSheet3: TcxTabSheet
      Caption = 'Gudang'
      ImageIndex = 2
      object cxGrid3: TcxGrid
        Left = 16
        Top = 16
        Width = 585
        Height = 241
        TabOrder = 0
        object cxGridDBTableView2: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
    end
  end
  object tblKategoriBarang: TZTable
    Connection = DM.zConn
    Active = True
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
    Active = True
    TableName = 'tbl_dept'
    Left = 696
    Top = 176
  end
  object dsDept: TDataSource
    DataSet = tblDept
    Left = 880
    Top = 184
  end
end