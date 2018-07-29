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
    TabOrder = 4
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      OnClick = btnEditClick
    end
    inherited btnHapus: TButton
      OnClick = btnHapusClick
    end
    inherited btnKeluar: TButton
      TabOrder = 4
    end
    inherited btnRefresh: TButton
      TabOrder = 3
      OnClick = btnRefreshClick
    end
  end
  object cxgCustomer: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 169
    Align = alClient
    TabOrder = 1
    object cxtbSO: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxtbSOFocusedRecordChanged
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
      object cxtbSOColumn1: TcxGridDBColumn
        Caption = 'Jenis SO '
        DataBinding.FieldName = 'jenis_so'
      end
    end
    object cxgCustomerLevel1: TcxGridLevel
      GridView = cxtbSO
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 218
    Width = 1016
    Height = 41
    Align = alBottom
    TabOrder = 2
    object cxLabel1: TcxLabel
      Left = 10
      Top = 11
      Caption = 'Detail Sales Order'
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 259
    Width = 1016
    Height = 200
    Align = alBottom
    TabOrder = 3
    object cxtbSODet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSODet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#0.00'
          Kind = skSum
          Column = cxtbSODetColumn2
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      object cxtbSODetkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.FieldName = 'kode_brg'
        Width = 103
      end
      object cxtbSODetdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 374
      end
      object cxtbSODetqty: TcxGridDBColumn
        Caption = 'Qty.'
        DataBinding.FieldName = 'qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbSODetsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 54
      end
      object cxtbSODetharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbSODetmata_uang: TcxGridDBColumn
        DataBinding.FieldName = 'mata_uang'
        Visible = False
      end
      object cxtbSODetColumn1: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 370
      end
      object cxtbSODetColumn2: TcxGridDBColumn
        Caption = 'Subtotal'
        DataBinding.FieldName = 'subtotal'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,#0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 97
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbSODet
    end
  end
  object zqrSO: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      
        'SELECT a.*,b.nama, IF(LEFT(no_bukti,3)='#39'MTS'#39','#39'MTS'#39','#39'SO CUSTOMER'#39 +
        ') jenis_so '
      'FROM tbl_so_head a '
      'left join tbl_customer b on a.id_cust = b.id')
    Params = <>
    Left = 720
    Top = 118
  end
  object dsSO: TDataSource
    DataSet = zqrSO
    Left = 776
    Top = 118
  end
  object dsSODet: TDataSource
    DataSet = zqrSODet
    Left = 776
    Top = 174
  end
  object zqrSODet: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.*, b.deskripsi, c.satuan satuan2'
      'FROM tbl_so_det a'
      'LEFT JOIN tbl_barang b ON a.id_brg = b.id  '
      'LEFT JOIN tbl_satuan c ON c.id = a.id_satuan'
      'WHERE a.id_ref = :id_ref')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
    Left = 720
    Top = 174
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_ref'
        ParamType = ptUnknown
      end>
  end
end
