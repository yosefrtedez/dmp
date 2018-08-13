inherited frmLstPengeluaranKas: TfrmLstPengeluaranKas
  Caption = 'Penerimaan Kas'
  ExplicitWidth = 1016
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label13: TLabel
      Left = 10
      Top = 13
      Width = 137
      Height = 19
      Caption = 'Pengeluaran Kas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    TabOrder = 2
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnEdit: TButton
      OnClick = btnEditClick
    end
    inherited btnKeluar: TButton
      TabOrder = 4
    end
    inherited btnRefresh: TButton
      TabOrder = 3
      OnClick = btnRefreshClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 410
    Align = alClient
    TabOrder = 1
    object cxtbPK: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPK
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxColPKid: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'id'
      end
      object cxColPKno_bukti: TcxGridDBColumn
        Caption = 'No Bukti'
        DataBinding.FieldName = 'no_bukti'
      end
      object cxColPKtanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
      end
      object cxColPKkepada: TcxGridDBColumn
        Caption = 'Kepada'
        DataBinding.FieldName = 'kepada'
        Width = 168
      end
      object cxColPKketerangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 200
      end
      object cxColPKjumlah: TcxGridDBColumn
        Caption = 'Jumlah'
        DataBinding.FieldName = 'jumlah'
      end
      object cxColPKakun: TcxGridDBColumn
        Caption = 'Akun'
        DataBinding.FieldName = 'akun'
        Width = 80
      end
      object cxColPKuser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
        Width = 100
      end
      object cxColPKuser_dept: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'user_dept'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbPK
    end
  end
  object zqrPK: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'SELECT *'
      'FROM tbl_trskk_head'
      'ORDER BY tanggal')
    Params = <>
    Properties.Strings = (
      'select * from tbl_trskk_head order by id;')
    Left = 696
    Top = 128
  end
  object dsPK: TDataSource
    DataSet = zqrPK
    Left = 800
    Top = 152
  end
end
