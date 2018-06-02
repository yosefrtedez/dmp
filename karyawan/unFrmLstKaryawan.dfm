inherited frmLstkaryawan: TfrmLstkaryawan
  BorderIcons = []
  Caption = 'Karyawan'
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      Left = 92
      OnClick = btnEditClick
      ExplicitLeft = 92
    end
    inherited btnHapus: TButton
      OnClick = btnHapusClick
    end
    inherited btnRefresh: TButton
      OnClick = btnRefreshClick
    end
  end
  object cxgKaraywan: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 2
    object cxtbKaryawan: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsKaryawan
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxgrdbclmnCustomerid: TcxGridDBColumn
        Caption = 'Id'
        DataBinding.FieldName = 'id'
        Width = 60
      end
      object cxgrdbclmnCustomernik: TcxGridDBColumn
        Caption = 'Nik'
        DataBinding.FieldName = 'nik'
        Width = 80
      end
      object cxgrdbclmnCustomernama: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama'
        Width = 200
      end
      object cxgrdbclmnCustomerjabatan: TcxGridDBColumn
        Caption = 'Jabatan'
        DataBinding.FieldName = 'jabatan'
        Width = 150
      end
      object cxgrdbclmnCustomerdivisi: TcxGridDBColumn
        Caption = 'Divisi'
        DataBinding.FieldName = 'divisi'
        Width = 150
      end
      object cxgrdbclmnCustomerfoto: TcxGridDBColumn
        Caption = 'Foto'
        DataBinding.FieldName = 'foto'
        Width = 76
      end
      object cxgrdbclmnCustomerdepartemen: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'departemen'
        Width = 150
      end
      object cxgrdbclmnCustomerf_karyawan: TcxGridDBColumn
        Caption = 'F_Karyawan'
        DataBinding.FieldName = 'f_karyawan'
      end
    end
    object cxgKaraywanLevel1: TcxGridLevel
      GridView = cxtbKaryawan
    end
  end
  object zqrKaryawan: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT * FROM tbl_karyawan')
    Params = <>
    Left = 824
    Top = 192
  end
  object dsKaryawan: TDataSource
    DataSet = zqrKaryawan
    Left = 896
    Top = 192
  end
end
