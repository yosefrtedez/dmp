inherited frmLstPB: TfrmLstPB
  Caption = 'Penerimaan Barang'
  ClientHeight = 613
  ExplicitWidth = 1016
  ExplicitHeight = 613
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 161
      Height = 19
      Caption = 'Penerimaan Barang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 564
    TabOrder = 4
    inherited btnTambah: TButton
      OnClick = btnTambahClick
    end
    inherited btnKeluar: TButton
      TabOrder = 4
    end
    inherited btnRefresh: TButton
      TabOrder = 3
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 274
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -153
    ExplicitWidth = 1169
    ExplicitHeight = 168
    object cxtbPBHead: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsView.CellTextMaxLineCount = 10
      Preview.MaxLineCount = 10
      object cxColTblHeadno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
        Options.Editing = False
        Width = 90
      end
      object cxColTblHeadno_fobj: TcxGridDBColumn
        Caption = 'No. PO'
        DataBinding.FieldName = 'no_pp'
        Options.Filtering = False
        Width = 90
      end
      object cxColTblHeadnama: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'nama_supplier'
        Options.Editing = False
        Width = 150
      end
      object cxColTblHeadkontak: TcxGridDBColumn
        DataBinding.FieldName = 'kontak'
        Options.Editing = False
        Width = 120
      end
      object cxColTblHeadtgl_required: TcxGridDBColumn
        Caption = 'Tgl Kedatangan'
        DataBinding.FieldName = 'tgl_required'
        Options.Editing = False
        Width = 90
      end
      object cxColTblHeaduser: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
        Options.Editing = False
        Width = 100
      end
      object cxColTblHeaduser_dept: TcxGridDBColumn
        Caption = 'Departemen'
        DataBinding.FieldName = 'user_dept'
        Options.Editing = False
        Width = 100
      end
      object cxColTblHeadpembayaran: TcxGridDBColumn
        Caption = 'Pembayaran'
        DataBinding.FieldName = 'pembayaran'
        Options.Editing = False
        Width = 100
      end
      object cxColTblHeadnopol: TcxGridDBColumn
        Caption = 'Nopol'
        DataBinding.FieldName = 'nopol'
        Options.Editing = False
        Width = 90
      end
      object cxColTblHeaddriver: TcxGridDBColumn
        Caption = 'Driver'
        DataBinding.FieldName = 'driver'
        Options.Editing = False
        Width = 120
      end
      object cxColTblHeadf_approval: TcxGridDBColumn
        Caption = 'Approval'
        DataBinding.FieldName = 'f_app'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Options.Editing = False
        Width = 50
      end
      object cxColTblHeadf_completed: TcxGridDBColumn
        Caption = 'Komplit'
        DataBinding.FieldName = 'f_completed'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Options.Editing = False
      end
    end
    object cxTblDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DetailKeyFieldNames = 'id_ref'
      DataController.MasterKeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ScrollBars = ssVertical
      OptionsView.CellAutoHeight = True
      OptionsView.CellTextMaxLineCount = 10
      OptionsView.GroupFooters = gfAlwaysVisible
      Preview.MaxLineCount = 10
      object cxColTblDetid: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'id'
      end
      object cxColTblDetid_ref: TcxGridDBColumn
        Caption = 'Id_Ref'
        DataBinding.FieldName = 'id_ref'
      end
      object cxColTblDetno_bukti: TcxGridDBColumn
        Caption = 'No. Bukti'
        DataBinding.FieldName = 'no_bukti'
      end
      object cxColTblDetkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg'
        DataBinding.FieldName = 'kode_brg'
      end
      object cxColTblDetdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
      end
      object cxColTblDetqty: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'qty'
      end
      object cxColTblDetsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
      end
      object cxColTblDetharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
      end
      object cxColTblDetmata_uang: TcxGridDBColumn
        Caption = 'Mata Uang'
        DataBinding.FieldName = 'mata_uang'
      end
    end
    object cxgrdlvl1Grid1Level1: TcxGridLevel
      GridView = cxtbPBHead
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 323
    Width = 1016
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = -153
    ExplicitTop = 217
    ExplicitWidth = 1169
    object cxLabel1: TcxLabel
      Left = 10
      Top = 11
      Caption = 'Detail Penerimaan Barang'
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 364
    Width = 1016
    Height = 200
    Align = alBottom
    TabOrder = 3
    ExplicitLeft = -153
    ExplicitTop = 258
    ExplicitWidth = 1169
    object cxtbPBDet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxtbPBDetkode_brg: TcxGridDBColumn
        Caption = 'Kode Brg.'
        DataBinding.FieldName = 'kode_brg'
        Width = 103
      end
      object cxtbPBDetdeskripsi: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'deskripsi'
        Width = 374
      end
      object cxtbPBDetqty: TcxGridDBColumn
        Caption = 'Qty.'
        DataBinding.FieldName = 'qty'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.DisplayFormat = '#,#0.00'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbPBDetsatuan: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'satuan'
        Width = 54
      end
      object cxtbPBDetharga: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'harga'
        HeaderAlignmentHorz = taRightJustify
      end
      object cxtbPBDetmata_uang: TcxGridDBColumn
        DataBinding.FieldName = 'mata_uang'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxtbPBDet
    end
  end
end
