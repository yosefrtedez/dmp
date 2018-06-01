inherited frmLstSupplier: TfrmLstSupplier
  BorderIcons = []
  Caption = 'Supplier'
  Position = poDesigned
  OnCreate = FormCreate
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      OnClick = btnEditClick
    end
    inherited btnHapus: TButton
      OnClick = btnHapusClick
    end
    inherited btnRefresh: TButton
      OnClick = btnRefreshClick
    end
  end
  object cxgSupplier: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 2
    object cxtbSupplier: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSupllier
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxtbSupplierkode: TcxGridDBColumn
        DataBinding.FieldName = 'kode'
        Width = 100
      end
      object cxtbSuppliernama: TcxGridDBColumn
        DataBinding.FieldName = 'nama'
        Width = 200
      end
      object cxtbSupplierkontak: TcxGridDBColumn
        DataBinding.FieldName = 'kontak'
        Width = 100
      end
      object cxtbSuppliertitle: TcxGridDBColumn
        DataBinding.FieldName = 'title'
        Width = 100
      end
      object cxtbSupplieralamat: TcxGridDBColumn
        DataBinding.FieldName = 'alamat'
        Width = 300
      end
      object cxtbSupplieralamat2: TcxGridDBColumn
        DataBinding.FieldName = 'alamat2'
        Width = 100
      end
      object cxtbSupplierkota: TcxGridDBColumn
        DataBinding.FieldName = 'kota'
        Width = 100
      end
      object cxtbSupplierkodepos: TcxGridDBColumn
        DataBinding.FieldName = 'kodepos'
        Width = 50
      end
      object cxgrdbclmnSupplierprovinsi: TcxGridDBColumn
        DataBinding.FieldName = 'provinsi'
        Width = 90
      end
      object cxgrdbclmnSuppliernegara: TcxGridDBColumn
        DataBinding.FieldName = 'negara'
        Width = 80
      end
      object cxgrdbclmnSuppliertelpon: TcxGridDBColumn
        DataBinding.FieldName = 'telpon'
        Width = 100
      end
      object cxgrdbclmnSupplierfax: TcxGridDBColumn
        DataBinding.FieldName = 'fax'
        Width = 100
      end
      object cxgrdbclmnSupplierhp: TcxGridDBColumn
        DataBinding.FieldName = 'hp'
        Width = 120
      end
      object cxgrdbclmnSupplierdirect: TcxGridDBColumn
        DataBinding.FieldName = 'direct'
        Width = 50
      end
      object cxgrdbclmnSupplierpembayaran: TcxGridDBColumn
        DataBinding.FieldName = 'pembayaran'
        Width = 100
      end
      object cxgrdbclmnSupplieremail: TcxGridDBColumn
        DataBinding.FieldName = 'email'
        Width = 100
      end
      object cxgrdbclmnSupplierf_aktif: TcxGridDBColumn
        DataBinding.FieldName = 'f_aktif'
        Width = 50
      end
    end
    object cxgSupplierLevel1: TcxGridLevel
      GridView = cxtbSupplier
    end
  end
  object zqrSupplier: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_supplier order by nama')
    Params = <>
    Left = 824
    Top = 192
  end
  object dsSupllier: TDataSource
    DataSet = zqrSupplier
    Left = 896
    Top = 192
  end
end
