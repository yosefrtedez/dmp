object frmLapPO: TfrmLapPO
  Left = 0
  Top = 0
  Caption = 'Laporan PO'
  ClientHeight = 465
  ClientWidth = 917
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object zqrPO: TZReadOnlyQuery
    Connection = DM.zConn
    SQL.Strings = (
      'SELECT a.*, b.qty, c.deskripsi'
      'FROM tbl_po_head a '
      'INNER JOIN tbl_po_det b ON a.id = b.id_ref'
      'LEFT JOIN tbl_barang c ON c.id = b.id_brg'
      'LEFT JOIN tbl_satuan d ON d.id = b.id_satuan')
    Params = <>
    Left = 99
    Top = 65
  end
  object dsPO: TDataSource
    DataSet = zqrPO
    Left = 153
    Top = 65
  end
  object fdbPO: TfrxDBDataset
    UserName = 'fdbPO'
    CloseDataSource = False
    FieldAliases.Strings = (
      'no_bukti=no_bukti'
      'no_fobj=no_fobj'
      'tanggal=tanggal'
      'kode_supp=kode_supp'
      'tgl_required=tgl_required'
      'keterangan=keterangan'
      'user=user'
      'pembayaran=pembayaran'
      'ppn=ppn'
      'currency=currency'
      'nama=nama'
      'alamat=alamat'
      'kota=kota'
      'provinsi=provinsi'
      'negara=negara'
      'qty=qty'
      'harga=harga'
      'deskripsi=deskripsi'
      'satuan=satuan'
      'keterangan_det=keterangan_det'
      'kode_alamat_kirim=kode_alamat_kirim'
      'nama_kirim=nama_kirim'
      'alamat_kirim=alamat_kirim'
      'kota_kirim=kota_kirim'
      'negara_kirim=negara_kirim'
      'mata_uang=mata_uang'
      'nilai_tukar=nilai_tukar'
      'divisi=divisi'
      'no_internal=no_internal'
      'no_po_pajak=no_po_pajak'
      'jenis_po2=jenis_po2'
      'digit=digit')
    DataSource = dsPO
    BCDToCurrency = False
    Left = 207
    Top = 65
  end
  object rptPO: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43314.475617500000000000
    ReportOptions.LastChange = 43314.475617500000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 32
    Top = 64
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
end
