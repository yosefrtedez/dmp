object frmKalkulasiStok: TfrmKalkulasiStok
  Left = 631
  Top = 258
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Kalkulasi Ulang Stok'
  ClientHeight = 179
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 95
    Width = 325
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label1'
    Visible = False
  end
  object btnProses: TButton
    Left = 12
    Top = 138
    Width = 73
    Height = 25
    Caption = 'Proses'
    TabOrder = 4
    OnClick = btnProsesClick
  end
  object prgBar: TProgressBar
    Left = 12
    Top = 111
    Width = 325
    Height = 19
    TabOrder = 3
  end
  object btnBatal: TButton
    Left = 90
    Top = 138
    Width = 73
    Height = 25
    Caption = 'Batal'
    TabOrder = 5
    OnClick = btnBatalClick
  end
  object RichEdit1: TRichEdit
    Left = 413
    Top = 45
    Width = 221
    Height = 126
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object cxChkHitungHPP: TcxCheckBox
    Left = 8
    Top = 8
    Caption = 'Hitung HPP'
    TabOrder = 0
    Width = 121
  end
  object cxlBrg: TcxLookupComboBox
    Left = 8
    Top = 35
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        Caption = 'Deskripsi'
        FieldName = 'deskripsi'
      end
      item
        Caption = 'Kode'
        FieldName = 'kode'
      end>
    Properties.ListSource = dsBrg
    TabOrder = 1
    Width = 329
  end
  object zqrBrg: TZReadOnlyQuery
    Connection = DM.zConn
    Active = True
    SQL.Strings = (
      'select 0 as id, '#39'0'#39' as kode, '#39' SEMUA'#39' as deskripsi '
      'union'
      'SELECT id, kode, deskripsi'
      'FROM tbl_barang ORDER BY deskripsi')
    Params = <>
    Left = 224
    Top = 40
  end
  object dsBrg: TDataSource
    DataSet = zqrBrg
    Left = 264
    Top = 40
  end
end
