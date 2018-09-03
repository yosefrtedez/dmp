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
    TabOrder = 2
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
    TabOrder = 1
    object cxtbSupplier: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSupllier
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxtbSupplierkode: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kode'
        Width = 100
      end
      object cxtbSuppliernama: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama'
        Width = 200
      end
      object cxtbSupplierkontak: TcxGridDBColumn
        Caption = 'Kontak'
        DataBinding.FieldName = 'kontak'
        Width = 100
      end
      object cxtbSuppliertitle: TcxGridDBColumn
        Caption = 'Title'
        DataBinding.FieldName = 'title'
        Width = 100
      end
      object cxtbSupplieralamat: TcxGridDBColumn
        Caption = 'Alamat'
        DataBinding.FieldName = 'alamat'
        Width = 300
      end
      object cxtbSupplieralamat2: TcxGridDBColumn
        Caption = 'Alamat2'
        DataBinding.FieldName = 'alamat2'
        Width = 100
      end
      object cxtbSupplierkota: TcxGridDBColumn
        Caption = 'Kota'
        DataBinding.FieldName = 'kota'
        Width = 100
      end
      object cxtbSupplierkodepos: TcxGridDBColumn
        Caption = 'Kode Pos'
        DataBinding.FieldName = 'kodepos'
        Width = 50
      end
      object cxgrdbclmnSupplierprovinsi: TcxGridDBColumn
        Caption = 'Provinsi'
        DataBinding.FieldName = 'provinsi'
        Width = 90
      end
      object cxgrdbclmnSuppliernegara: TcxGridDBColumn
        Caption = 'Negara'
        DataBinding.FieldName = 'negara'
        Width = 80
      end
      object cxgrdbclmnSuppliertelpon: TcxGridDBColumn
        Caption = 'Telpon'
        DataBinding.FieldName = 'telpon'
        Width = 100
      end
      object cxgrdbclmnSupplierfax: TcxGridDBColumn
        Caption = 'Fax'
        DataBinding.FieldName = 'fax'
        Width = 100
      end
      object cxgrdbclmnSupplierhp: TcxGridDBColumn
        Caption = 'Nomer HP'
        DataBinding.FieldName = 'hp'
        Width = 120
      end
      object cxgrdbclmnSupplierdirect: TcxGridDBColumn
        Caption = 'Direct'
        DataBinding.FieldName = 'direct'
        Width = 50
      end
      object cxgrdbclmnSupplierpembayaran: TcxGridDBColumn
        Caption = 'Pembayaran'
        DataBinding.FieldName = 'pembayaran'
        Width = 100
      end
      object cxgrdbclmnSupplieremail: TcxGridDBColumn
        Caption = 'Email'
        DataBinding.FieldName = 'email'
        Width = 100
      end
      object cxgrdbclmnSupplierf_aktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'f_aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
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
