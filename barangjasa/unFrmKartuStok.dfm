object frmKartuStok: TfrmKartuStok
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Kartu Stok'
  ClientHeight = 577
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 16
    Top = 133
    Width = 975
    Height = 393
    TabOrder = 9
    object cxtbKS: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsKS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      object cxtbKSno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Width = 87
      end
      object cxtbKStanggal: TcxGridDBColumn
        Caption = 'Tgl. Trans'
        DataBinding.FieldName = 'tanggal'
        Width = 89
      end
      object cxtbKSColumn1: TcxGridDBColumn
        Caption = 'Tgl. Input'
        DataBinding.FieldName = 'tgl_input'
        Width = 121
      end
      object cxtbKSmasuk: TcxGridDBColumn
        Caption = 'Masuk '
        DataBinding.FieldName = 'masuk'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 84
      end
      object cxtbKSkeluar: TcxGridDBColumn
        Caption = 'Keluar'
        DataBinding.FieldName = 'keluar'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 84
      end
      object cxtbKSstok_akhir: TcxGridDBColumn
        Caption = 'Stok Akhir'
        DataBinding.FieldName = 'stok_akhir'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        Width = 88
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbKS
    end
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 21
    Caption = 'Tanggal'
  end
  object cxdTgl1: TcxDateEdit
    Left = 79
    Top = 20
    TabOrder = 0
    Width = 121
  end
  object cxLabel2: TcxLabel
    Left = 207
    Top = 21
    Caption = 'S/D'
  end
  object cxdTgl2: TcxDateEdit
    Left = 235
    Top = 20
    TabOrder = 1
    Width = 121
  end
  object cxLabel3: TcxLabel
    Left = 16
    Top = 48
    Caption = 'Gudang'
  end
  object btnProses: TButton
    Left = 79
    Top = 74
    Width = 75
    Height = 25
    Caption = 'Proses'
    TabOrder = 6
    OnClick = btnProsesClick
  end
  object btnKeluar: TButton
    Left = 16
    Top = 540
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 10
    OnClick = btnKeluarClick
  end
  object cxlGdg: TcxLookupComboBox
    Left = 79
    Top = 47
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Gudang'
        FieldName = 'nama'
      end>
    Properties.ListSource = dsGdg
    TabOrder = 4
    Width = 121
  end
  object cxLabel4: TcxLabel
    Left = 16
    Top = 106
    Caption = 'Saldo awal '
  end
  object cxsSA: TcxSpinEdit
    Left = 80
    Top = 106
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = '#,#0.00'
    Properties.ReadOnly = True
    TabOrder = 8
    Width = 120
  end
  object zqrKS: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT * FROM ksks')
    Params = <>
    Left = 552
    Top = 40
  end
  object dsKS: TDataSource
    DataSet = zqrKS
    Left = 656
    Top = 40
  end
  object zqrGdg: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT id, nama FROM tbl_gudang')
    Params = <>
    Left = 808
    Top = 48
  end
  object dsGdg: TDataSource
    DataSet = zqrGdg
    Left = 888
    Top = 48
  end
  object zspKS: TZStoredProc
    Connection = DM.zConn
    Params = <
      item
        DataType = ftUnknown
        Name = 'pid_brg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pid_gdg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'psa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ptgl1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ptgl2'
        ParamType = ptUnknown
      end>
    StoredProcName = 'dmp_db.sp_kartustok'
    Left = 456
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pid_brg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pid_gdg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'psa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ptgl1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ptgl2'
        ParamType = ptUnknown
      end>
  end
end
