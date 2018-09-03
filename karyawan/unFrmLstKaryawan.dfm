inherited frmLstkaryawan: TfrmLstkaryawan
  BorderIcons = []
  Caption = 'Karyawan'
  ClientHeight = 512
  OnCreate = FormCreate
  ExplicitWidth = 1016
  ExplicitHeight = 512
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 463
    TabOrder = 2
    ExplicitTop = 463
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
    Height = 414
    Align = alClient
    TabOrder = 1
    object cxtbKaryawan: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsKaryawan
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
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
    end
    object cxgKaraywanLevel1: TcxGridLevel
      GridView = cxtbKaryawan
    end
  end
  object zqrKaryawan: TZReadOnlyQuery
    Connection = DM.zConn
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
