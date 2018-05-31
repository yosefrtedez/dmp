inherited frmLstCustomer: TfrmLstCustomer
  BorderIcons = []
  Caption = 'Customer'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 139
      Height = 19
      Caption = 'Master Customer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      OnClick = btnEditClick
    end
  end
  object cxgCustomer: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 2
    object cxtbCustomer: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsCustomer
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.Appending = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxtbCustomerkode: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kode'
      end
      object cxtbCustomernama: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama'
        Width = 306
      end
      object cxtbCustomerkontak: TcxGridDBColumn
        Caption = 'Kontak'
        DataBinding.FieldName = 'kontak'
        Width = 130
      end
      object cxtbCustomeralamat: TcxGridDBColumn
        Caption = 'Alamat'
        DataBinding.FieldName = 'alamat'
        Width = 614
      end
      object cxtbCustomeralamat2: TcxGridDBColumn
        Caption = 'Alamat 2'
        DataBinding.FieldName = 'alamat2'
        Width = 706
      end
      object cxtbCustomerkota: TcxGridDBColumn
        Caption = 'Kota'
        DataBinding.FieldName = 'kota'
      end
      object cxtbCustomerprovinsi: TcxGridDBColumn
        Caption = 'Provinsi'
        DataBinding.FieldName = 'provinsi'
        Width = 114
      end
      object cxtbCustomernegara: TcxGridDBColumn
        Caption = 'Negara'
        DataBinding.FieldName = 'negara'
        Width = 86
      end
      object cxtbCustomertelpon: TcxGridDBColumn
        Caption = 'Telepon'
        DataBinding.FieldName = 'telpon'
        Width = 130
      end
      object cxtbCustomerfax: TcxGridDBColumn
        Caption = 'Fax'
        DataBinding.FieldName = 'fax'
        Width = 93
      end
      object cxtbCustomerhp: TcxGridDBColumn
        Caption = 'No.HP'
        DataBinding.FieldName = 'hp'
        Width = 88
      end
      object cxtbCustomerf_aktif: TcxGridDBColumn
        Caption = 'Aktif'
        DataBinding.FieldName = 'f_aktif'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
      end
    end
    object cxgCustomerLevel1: TcxGridLevel
      GridView = cxtbCustomer
    end
  end
  object zqrCustomer: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM tbl_customer')
    Params = <>
    Left = 824
    Top = 192
  end
  object dsCustomer: TDataSource
    DataSet = zqrCustomer
    Left = 896
    Top = 192
  end
end
