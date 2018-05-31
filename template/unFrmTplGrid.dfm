object frmTplGrid: TfrmTplGrid
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = [biMaximize]
  BorderStyle = bsNone
  Caption = 'frmTplGrid'
  ClientHeight = 508
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 49
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 459
    Width = 1016
    Height = 49
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      1016
      49)
    object btnTambah: TButton
      Left = 10
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Tambah'
      TabOrder = 0
    end
    object btnEdit: TButton
      Left = 91
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Edit'
      TabOrder = 1
    end
    object btnHapus: TButton
      Left = 172
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 2
    end
    object btnKeluar: TButton
      Left = 933
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Keluar'
      TabOrder = 3
      OnClick = btnKeluarClick
    end
    object btnRefresh: TButton
      Left = 253
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Refresh'
      TabOrder = 4
    end
  end
end
