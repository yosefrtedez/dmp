inherited frmLstJurnalUmum: TfrmLstJurnalUmum
  Caption = 'Jurnal Umum '
  OnShow = FormShow
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
    inherited btnRefresh: TButton
      OnClick = btnRefreshClick
    end
  end
  object cxgJurnalUmum: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 2
    object cxtbJurnalUmum: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsJurnalUmum
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxtbJurnalUmumno_jurnal: TcxGridDBColumn
        Caption = 'No. Jurnal'
        DataBinding.FieldName = 'no_jurnal'
      end
      object cxtbJurnalUmumtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
      end
      object cxtbJurnalUmumketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 294
      end
      object cxtbJurnalUmumjenis: TcxGridDBColumn
        Caption = 'Jenis'
        DataBinding.FieldName = 'jenis'
      end
      object cxtbJurnalUmumuser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
      end
      object cxtbJurnalUmumuser_dept: TcxGridDBColumn
        Caption = 'User Dept'
        DataBinding.FieldName = 'user_dept'
      end
    end
    object cxgJurnalUmumLevel1: TcxGridLevel
      GridView = cxtbJurnalUmum
    end
  end
  object zqrJurnalUmum: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT * FROM tbl_jurnal_head')
    Params = <>
    Left = 760
    Top = 208
  end
  object dsJurnalUmum: TDataSource
    DataSet = zqrJurnalUmum
    Left = 864
    Top = 216
  end
end
