inherited frmLstSO: TfrmLstSO
  Caption = 'Sales Order'
  OnCreate = FormCreate
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 94
      Height = 19
      Caption = 'Sales Order'
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
    inherited btnHapus: TButton
      OnClick = btnHapusClick
    end
    inherited btnRefresh: TButton
      OnClick = btnRefreshClick
    end
  end
  object cxgCustomer: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 55
    object cxtbSO: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSO
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.Appending = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxtbSOno_bukti: TcxGridDBColumn
        Caption = 'No.SO'
        DataBinding.FieldName = 'no_bukti'
      end
      object cxtbSOtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        Width = 130
      end
      object cxtbSOpo: TcxGridDBColumn
        Caption = 'No.PO'
        DataBinding.FieldName = 'po#'
      end
      object cxtbSOnama: TcxGridDBColumn
        Caption = 'Nama Customer'
        DataBinding.FieldName = 'nama'
        Width = 486
      end
      object cxtbSOf_approve: TcxGridDBColumn
        Caption = 'Approve'
        DataBinding.FieldName = 'f_approve'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
      end
    end
    object cxgCustomerLevel1: TcxGridLevel
      GridView = cxtbSO
    end
  end
  object zqrSO: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      
        'SELECT a.*,b.nama FROM tbl_so_head_dmp as a join tbl_customer as' +
        ' b on a.kode_customer=b.kode')
    Params = <>
    Left = 832
    Top = 198
  end
  object dsSO: TDataSource
    DataSet = zqrSO
    Left = 904
    Top = 198
  end
end
