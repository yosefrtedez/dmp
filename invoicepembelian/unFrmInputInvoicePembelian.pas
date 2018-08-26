unit unFrmInputInvoicePembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxTextEdit, cxDBLookupComboBox, cxSpinEdit, cxDropDownEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  cxContainer, cxGroupBox, cxCheckBox, cxCalendar, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxLabel, DB, ZAbstractRODataset, ZDataset;

type
  TfrmInputInvoicePembelian = class(TfrmTplInput)
    Label1: TLabel;
    cxgrdPP: TcxGrid;
    cxtbInvPemb: TcxGridTableView;
    cxColNo: TcxGridColumn;
    cxColKodeBrg: TcxGridColumn;
    cxColDeskripsi: TcxGridColumn;
    cxColQty: TcxGridColumn;
    cxColSatuan: TcxGridColumn;
    cxColHarga: TcxGridColumn;
    cxColValuta: TcxGridColumn;
    cxColKeterangan: TcxGridColumn;
    cxColTotal: TcxGridColumn;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    cxlbl1: TcxLabel;
    cxlbl3: TcxLabel;
    cxlbl5: TcxLabel;
    cxlbl6: TcxLabel;
    cxdTgl: TcxDateEdit;
    cxlSupplier: TcxLookupComboBox;
    cxtAlamat: TcxTextEdit;
    cxtNoBukti: TcxTextEdit;
    cxlbl11: TcxLabel;
    zqrPOHead: TZReadOnlyQuery;
    dsPOHead: TDataSource;
    zqrSupplier: TZReadOnlyQuery;
    dsSupplier: TDataSource;
    cxColPPn: TcxGridColumn;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    cxColIdSatuan: TcxGridColumn;
    cxColKodeBrg2: TcxGridColumn;
    cxColNoPO: TcxGridColumn;
    cxlNoPenerimaan: TcxLookupComboBox;
    zqrPB: TZReadOnlyQuery;
    dsPB: TDataSource;
    cxsSubtotal: TcxSpinEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxsPPN: TcxSpinEdit;
    cxLabel3: TcxLabel;
    cxsTotal: TcxSpinEdit;
    cxColDiscPersen: TcxGridColumn;
    cxColIdBrg: TcxGridColumn;
    cxColIdPO: TcxGridColumn;
    procedure cxLuNoPPPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxLuSupplierPropertiesChange(Sender: TObject);
    procedure cxCbo2PropertiesChange(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxtbTblPODataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxtbTblPODataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxLuNoPPPropertiesEditValueChanged(Sender: TObject);
    procedure cxlSupplierPropertiesEditValueChanged(Sender: TObject);
    procedure cxChkTanpaPOClick(Sender: TObject);
    procedure cxlNoPenerimaanPropertiesChange(Sender: TObject);
  private
    mStatus: string;
    procedure HitungTotal;
  public
    { Public declarations }
  end;

var
  frmInputInvoiePembelian: TfrmInputInvoicePembelian;

implementation

uses
  unFrmUtama, unDM, unAplikasi, unTools, unFrmLstInvoicePembelian;

{$R *.dfm}

procedure TfrmInputInvoicePembelian.btnSimpanClick(Sender: TObject);
var
  q, qh, qd, rs_fobj: TZQuery;
  sNoBukti : string;
  i, id : integer;
  f0: Boolean;

begin

  if cxlSupplier.Text = '' then begin
    MsgBox('Nama supllier masih kosong.');
    Abort;
  end;

  if cxlNoPenerimaan.Text = '' then begin
    MsgBox('Pilih No. Penerimaan.');
    Abort;
  end;

  with cxtbInvPemb.DataController do begin
    if RecordCount = 0 then begin
      MsgBox('Detail transaksi masih kosong.');
      Abort;
    end;

    if Self.Jenis = 'T' then begin
      sNoBukti := GetLastFak('invoice-pembelian');
      UpdateFaktur(Copy(sNoBukti,1,8));
    end
    else begin
      sNoBukti := cxtNoBukti.text;
    end;

    try
      dm.zConn.StartTransaction;

      qh := OpenRS('SELECT * FROM tbl_invoicepembelian_head WHERE no_bukti = ''%s''',[sNoBukti]);
      if Self.Jenis = 'T' then begin
        qh.Insert;
      end
      else begin
        qh.Edit;
        ID := qh.FieldByName('id').AsInteger;
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_invoicepembelian_det WHERE id_ref = %s',[Self.EditKey]));
      end;

      qh.FieldByName('no_bukti').AsString := sNoBukti;
      qh.FieldByName('tanggal').AsDateTime := cxdTgl.Date;
      qh.FieldByName('id_supp').AsString := cxlSupplier.EditValue;
      qh.FieldByName('f_revisi').AsString := '0';
      qh.FieldByName('user').AsString := Aplikasi.NamaUser;
      qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
      qh.FieldByName('tgl_input').AsDateTime := Aplikasi.Tanggal;

      if Self.Jenis = 'E' then begin
        qh.FieldByName('user_edit').AsString := aplikasi.NamaUser;
        qh.FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
      end;
      qh.Post;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      qd := OpenRS('SELECT * FROM tbl_invoicepembelian_det WHERE no_bukti = ''%s''',[sNoBukti]);
      with cxtbInvPemb.DataController do begin
        for i := 0 to RecordCount - 1 do begin
          qd.Insert;
          qd.FieldByName('id_ref').AsInteger := ID;
          qd.FieldByName('no_bukti').AsString := sNoBukti;
          qd.FieldByName('id_brg').AsInteger := Values[i, cxColIdBrg.Index];
          qd.FieldByName('qty').AsFloat := Values[i, cxColQty.Index];
          qd.FieldByName('id_satuan').AsString := Values[i, cxColIdSatuan.Index];
          qd.FieldByName('harga').AsFloat := Values[i, cxColHarga.Index];
          qd.FieldByName('disc_persen').AsFloat := Values[i, cxColDiscPersen.Index];
          if not VarIsNull(Values[i, cxColPPn.index]) = True then
            qd.FieldByName('ppn').AsString := Values[i, cxColPPn.index];
          if not VarIsNull(Values[i, cxColKeterangan.Index]) then
            qd.FieldByname('keterangan').AsString := Values[i, cxColKeterangan.Index];
          if not VarIsNull(Values[i, cxColIdPO.Index]) then
            qd.FieldByName('id_po').AsInteger := Values[i, cxColIdPO.Index];
          qd.Post;
        end;
      end;
      dm.zConn.Commit;
      qh.Close;
      qd.Close;

      dm.zConn.ExecuteDirect('UPDATE tbl_invoicepembelian SET f_inv = 1 WHERE no_bukti = ''%s''',[cxlNoPenerimaan.Text]);

      MsgBox('Transaksi Invoice Pembelian sudah disimpan dengan No. Bukti : ' + sNoBukti);

      if Assigned(Self.FormInduk) then
        (Self.FormInduk as TfrmLstInvoicePembelian).btnRefreshClick(nil);

      btnBatalClick(nil);

      inherited;
    except
      on E: Exception do begin
        dm.zConn.Rollback;
        MsgBox('Error: ' + E.Message);
      end;
    end;
  end;

end;

procedure TfrmInputInvoicePembelian.cxCbo2PropertiesChange(Sender: TObject);
begin
  inherited;
  {
  if cxCboRate.Text = 'USD' then begin
    cxlbl13.Visible := True;
    cxtRate.Visible := True;
  end else begin
    cxlbl13.Visible := False;
    cxtRate.Visible := False;
  end;
  }
end;

procedure TfrmInputInvoicePembelian.cxChkTanpaPOClick(Sender: TObject);
begin
  inherited;
  {
  if cxChkTanpaPO.Checked = True then begin
    with zqrSupplier do begin
      Close ;
      SQL.Text := 'select id as id_supplier, kode, nama from tbl_supplier order by nama' ;
      Open;
    end;
     with zqrBarang do begin
        Close ;
        SQL.Text := 'select id, kode, deskripsi from tbl_barang' ;
        Open;
      end;
    cxtColNoPO.Visible := False ;
    //cxtColNoPO.EditValue :=null;
  end else begin
    with zqrSupplier do begin
      Close ;
      SQL.Text := 'select distinct a.id_supplier,b.kode,b.nama ' +
                  'from tbl_po_head a left join tbl_supplier b  ' +
                  'on a.id_supplier=b.id WHERE f_app=1' ;
      Open;
    end;
    cxtColNoPO.Visible := True ;
  end;
  }
end;

procedure TfrmInputInvoicePembelian.cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
 var
  row : Integer;
begin
  inherited;
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;

procedure TfrmInputInvoicePembelian.cxlNoPenerimaanPropertiesChange(
  Sender: TObject);
var
  q: TZQuery;
  i: integer;
  disc1: real;
begin
  inherited;
  try
    q := OpenRS('SELECT a.*, b.kode kode_brg2,  b.deskripsi, c.no_bukti no_po2, d.satuan satuan2, e.ppn, e.disc_persen FROM tbl_pb_det a ' +
      'LEFT JOIN tbl_barang b ON b.id = a.id_brg ' +
      'LEFT JOIN tbl_po_head c ON c.id = a.id_po ' +
      'LEFT JOIN tbl_satuan d ON d.id = a.id_satuan ' +
      'LEFT JOIN tbl_po_det e ON e.id_ref = c.id AND e.id_brg = a.id_brg ' +
      'WHERE a.id_ref = %s',
      [cxlNoPenerimaan.EditValue]);
    cxtbInvPemb.DataController.RecordCount := 0;
    while not q.Eof do begin
      with cxtbInvPemb.DataController do begin
        i := AppendRecord;
        Values[i, cxColKodeBrg.Index] := q.FieldByName('kode_brg2').AsString;
        Values[i, cxColDeskripsi.Index] := q.FieldByName('deskripsi').AsString;

        Values[i, cxColIdBrg.Index] := q.FieldByName('id_brg').AsInteger;
        Values[i, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;

        Values[i, cxColNoPO.Index] := q.FieldByName('no_po2').AsString;

        if Values[i, cxColNoPO.Index] <> '' then begin
          cxColHarga.Properties.ReadOnly := True;
          cxColDiscPersen.Properties.ReadOnly := True;
          cxColPPn.Properties.ReadOnly := True;
        end
        else begin
          cxColHarga.Properties.ReadOnly := False;
          cxColDiscPersen.Properties.ReadOnly := False;
          cxColPPn.Properties.ReadOnly := False;
        end;

        Values[i, cxColQty.Index] := q.FieldByName('qty').AsFloat;
        Values[i, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
        Values[i, cxColHarga.Index] := q.FieldByName('harga').AsFloat;
        Values[i, cxColPPn.Index] := q.FieldbyName('ppn').AsString;
        Values[i, cxColDiscPersen.Index] := q.FieldByName('disc_persen').AsFloat;
        if not q.FieldByName('id_po').IsNull then
          Values[i, cxColIdPO.Index] := q.FieldByName('id_po').AsInteger;

        disc1 := 0;
        if Values[i, cxColDiscPersen.Index] > 0 then
          disc1 := (Values[i, cxColHarga.Index] * Values[i, cxColQty.Index] * Values[i, cxColDiscPersen.Index] / 100);

        if Values[i, cxColPPn.Index] = 'PPN' then
          Values[i, cxColTotal.Index] := ((Values[i, cxColHarga.Index] * 110/100) * Values[i, cxColQty.Index]) - disc1
        else
          Values[i, cxColTotal.Index] := (Values[i, cxColHarga.Index] * Values[i, cxColQty.Index]) - disc1;

      end;
      q.Next;
    end;
    q.Close;
    HitungTotal;
  except
  end;
end;

procedure TfrmInputInvoicePembelian.cxlSupplierPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  with zqrPOHead do begin
      if Active then Close;
      ParamByName('supplier').AsString:= cxlSupplier.EditValue;
      Open;
    end;
end;

procedure TfrmInputInvoicePembelian.cxLuNoPPPropertiesChange(Sender: TObject);
var
  q, z : TZQuery;
  t, i : Integer;

begin
  inherited;

  {q := OpenRS('select diajukan_oleh, diajukan_dept from tbl_pp_head where id = %s',[cxlNoPP.EditValue]);
  if not q.Eof then begin
    cxtUser.Text := q.FieldByName('diajukan_oleh').AsString;
    cxtDepartemen.Text := q.FieldByName('diajukan_dept').AsString;
  end;
  q.Close;

  z := OpenRS('SELECT a.*, b.deskripsi, c.satuan satuan2 FROM tbl_pp_det a ' +
    'LEFT JOIN tbl_barang b ON a.kode_brg = b.kode ' +
    'LEFT JOIN tbl_satuan c ON c.id = a.id_satuan ' +
    'WHERE a.id_ref = %s',[cxlNoPP.EditValue]);

  if not z.IsEmpty then begin
    cxtbTblPO.DataController.RecordCount := 0;
    t := 1;

    cxtbTblPO.DataController.OnRecordChanged := nil;
    while not z.Eof do begin
      cxgrdPP.BeginUpdate;
      with cxtbTblPO.DataController do begin
        i := AppendRecord;
        Values[i, cxColNo.Index] := t;
        Values[i, cxColKodeBrg.Index] := z.FieldByName('kode_brg').AsString;
        Values[i, cxColDeskripsi.Index] := z.FieldByName('id_brg').AsString;
        Values[i, cxColQty.Index] := z.FieldByName('qty').AsFloat;
        Values[i, cxColSatuan.Index] := z.FieldByName('satuan2').AsString;
        Values[i, cxColIdSatuan.Index] := z.FieldByName('id_satuan').AsInteger;
        Values[i, cxColHarga.Index] := z.FieldByName('harga').AsInteger;
        Values[i, cxColValuta.Index] := 'IDR';
        Values[i, cxColPPn.Index] := 'NON PPN';
        if Values[i, cxColPPn.Index] = 'PPN' then begin
          Values[i, cxColTotal.Index] := z.FieldByName('qty').AsFloat * z.FieldByName('harga').AsFloat * 110/100;
        end else begin
          Values[i, cxColTotal.Index] := z.FieldByName('qty').AsFloat * z.FieldByName('harga').AsFloat
        end;
        t := t + 1;
      end;
      cxgrdPP.EndUpdate;
      z.Next;
    end;
    cxtbTblPO.DataController.OnRecordChanged := Self.cxtbTblPODataControllerRecordChanged;

    cxtbTblPO.NavigatorButtons.Append.Enabled := False;
    cxtbTblPO.NavigatorButtons.Delete.Enabled := False;

  end;
  z.Close;  }

end;

procedure TfrmInputInvoicePembelian.cxLuNoPPPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
 { if cxlNoPP.Text <> '' then begin
    cxtbTblPO.NavigatorButtons.Append.Enabled := False;
    cxtbTblPO.NavigatorButtons.Delete.Enabled := False;
  end else begin
    cxtbTblPO.NavigatorButtons.Append.Enabled := True;
    cxtbTblPO.NavigatorButtons.Delete.Enabled := True;
    with cxtbTblPO.DataController do begin
      BeginUpdate;
      try
        while RecordCount > 0 do
          DeleteRecord(0);
          cxtbTblPO.DataController.ClearDetails;
      finally
          EndUpdate
      end
    end;
  end; }
end;

procedure TfrmInputInvoicePembelian.cxLuSupplierPropertiesChange(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  try
    q := OpenRS('SELECT alamat, alamat2, kota, provinsi, negara FROM tbl_supplier WHERE id = %s',[cxlSupplier.EditValue]);
    cxtAlamat.Text := q.FieldByName('alamat').AsString + ', ' + q.FieldByName('alamat2').AsString +
      ', ' + q.FieldByname('kota').AsString + ', ' + q.FieldByName('provinsi').AsString;
    q.Close;

    zqrPB.Close;
    zqrPB.ParamByName('id_supplier').AsInteger := cxlSupplier.EditValue;
    zqrPB.Open;
  finally

  end;
end;

procedure TfrmInputInvoicePembelian.cxtbTblPODataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
begin
  {
  inherited;
  i := ADataController.FocusedRowIndex;
  k := ADataController.GetEditingRecordIndex;
  v := ADataController.Values[i, cxColKodeBrg.Index];

  for j := 0 to ADataController.RecordCount - 1 do begin
    if j <> k then begin
      if v = ADataController.Values[j, cxColKodeBrg.Index] then begin
        MsgBox('Item tersebut sudah ada.');
        ADataController.DeleteRecord(i);
        Abort
      end;
    end;
  end;

  if (VarIsNull(ADataController.Values[i, cxColKodeBrg.Index])) or
      (Trim(ADataController.Values[i, cxColKodeBrg.Index]) = '')  then begin
      MsgBox('Kode barang harus di isi.');
      Abort;
  end;

  if ADataController.Values[i, cxColQty.Index] <= 0 then begin
    MsgBox('Qty tidak boleh minus');
    Abort;
  end;

  if (VarIsNull(ADataController.Values[i, cxColHarga.Index]))  then begin
    MsgBox('harga masih kosong');
    Abort;
  end;

  if ADataController.Values[i, cxColHarga.Index] <= 0 then begin
    MsgBox('harga tidak boleh minus');
    abort
  end;
  }
end;


procedure TfrmInputInvoicePembelian.cxtbTblPODataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
  t, t1, t2, t3, disc1 : Real;
  i: Integer ;
begin
  i := ARecordIndex;
  if (AItemIndex = cxColHarga.Index) or (AItemIndex = cxColDiscPersen.Index) or (AItemINdex = cxColPPn.Index) then begin
    try
      cxtbInvPemb.BeginUpdate;
      with ADataController do begin
        disc1 := 0;
        if Values[ARecordIndex, cxColDiscPersen.Index] > 0 then
          disc1 := (Values[i, cxColHarga.Index] * Values[i, cxColQty.Index] * Values[i, cxColDiscPersen.Index] / 100);

        if cxColPPn.EditValue = 'PPN' then
          Values[i, cxColTotal.Index] := ((Values[i, cxColHarga.Index] * 110/100) * Values[i, cxColQty.Index]) - disc1
        else
          Values[i, cxColTotal.Index] := (Values[i, cxColHarga.Index] * Values[i, cxColQty.Index]) - disc1
      end;
    finally
      cxtbInvPemb.EndUpdate;
    end;
  end;

end;

procedure TfrmInputInvoicePembelian.FormCreate(Sender: TObject);
begin
inherited;
  {
  cxdTgl.Date := Aplikasi.Tanggal;
  cxCboRate.ItemIndex := 0;
  }
  zqrSupplier.Open;
  zqrBarang.Open;
end;

procedure TfrmInputInvoicePembelian.FormShow(Sender: TObject);
  var
   q,z : TZQuery;
   i, nomer: integer;
   sNoTrs : string;
begin
  inherited;

  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('invoice-pembelian');
    cxtNoBukti.Text := sNoTrs;
    cxdTgl.Date := Aplikasi.Tanggal;
  end
  {
  else if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_invoicepembelian_head WHERE id = %s',[Self.EditKey]);
    cxtNoBukti.Text := q.FieldByName('no_bukti').AsString;
    cxlSupplier.EditValue := q.FieldByName('id_supp').AsInteger;
    cxdTgl.Date := q.FieldByName('tanggal').AsDateTime;
    if q.FieldByName('f_app').AsInteger = 1 then cxChkApproval.Checked := True;
    if q.FieldByName('f_po').AsInteger = 1 then cxChkTanpaPO.Checked := True;

    q.Close;
    z := OpenRS('SELECT a.*, b.kode, b.deskripsi, c.satuan satuan2 FROM tbl_invoicepembelian_det a ' +
      'left join tbl_barang b on a.id_brg = b.id ' +
      'LEFT JOIN tbl_satuan c on c.id = a.id_satuan ' +
      'WHERE id_ref = %s',[Self.EditKey]);
    nomer := 1;

    cxtbTblPI.DataController.OnRecordChanged := nil;
    while not z.Eof do begin
      with cxtbTblPI.DataController do begin
        i := AppendRecord;
        Values[i, cxColNo.Index] := nomer;
        Values[i, cxtColNoPO.Index] := z.FieldByName('no_po').AsString;
        Values[i, cxColKodeBrg.Index] := z.FieldByName('id_brg').AsInteger;
        Values[i, cxColDeskripsi.Index] := z.FieldByName('id_brg').AsInteger;
        Values[i, cxColQty.Index] := z.FieldByName('qty').AsFloat;
        Values[i, cxColSatuan.Index] := z.FieldByName('satuan2').AsString;
        Values[i, cxColIdSatuan.Index] := z.FieldByname('id_satuan').AsInteger;
        Values[i, cxColValuta.Index] := z.FieldByName('mata_uang').AsString;
        Values[i, cxColHarga.Index] := z.FieldByName('harga').AsFloat;
        Values[i, cxColPPn.Index] := z.FieldByName('PPN').AsString;
        if Values[i, cxColPPn.Index] = 'PPN' then begin
          Values[i, cxColTotal.Index] := z.FieldByName('qty').AsFloat * z.FieldByName('harga').AsFloat * 110/100;
        end else begin
          Values[i, cxColTotal.Index] := z.FieldByName('qty').AsFloat * z.FieldByName('harga').AsFloat
        end;
        Values[i, cxColKeterangan.Index] := z.FieldByName('keterangan').AsString;
        nomer := nomer +1;
        Values[i, cxColKodeBrg2.Index] := z.FieldByName('kode').AsString;
      end;
      z.Next;
    end;
    z.Close;
    cxtbTblPI.DataController.OnRecordChanged := Self.cxtbTblPODataControllerRecordChanged;

  end;
  }
end;


procedure TfrmInputInvoicePembelian.HitungTotal;
var
  i: integer;
  ppn, tot, disc: Real;
begin
  tot := 0;
  ppn := 0;
  disc := 0;
  with cxtbInvPemb.DataController do begin
    for i := 0 to RecordCount - 1 do begin
      tot := tot + (Values[i, cxColQty.Index] * Values[i, cxColHarga.Index]);
      if Values[i, cxColPPn.Index] = 'PPN' then
        ppn := ppn + (Values[i, cxColQty.Index] * Values[i, cxColHarga.Index] * (10/100));
      if Values[i, cxColDiscPersen.Index] > 0 then begin
        disc := disc + (tot * Values[i, cxColDiscPersen.Index] / 100);
      end;
    end;
  end;
  cxsSubtotal.Value := tot - disc;
  cxsPPN.Value := ppn;
  cxsTotal.Value := cxsSubtotal.Value + cxsPPN.Value;
end;

end.
