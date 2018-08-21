inherited frmInputSales: TfrmInputSales
  Caption = 'Input Sales'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 92
      Height = 19
      Caption = 'Input Sales'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    TabOrder = 5
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 64
    Caption = 'Kode'
  end
  object cxtKode: TcxTextEdit
    Left = 80
    Top = 63
    TabOrder = 1
    Width = 121
  end
  object cxtNama: TcxTextEdit
    Left = 80
    Top = 90
    TabOrder = 3
    Width = 361
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 91
    Caption = 'Nama'
  end
end
