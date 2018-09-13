unit unFrmInputPembayaranPenjualan;

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
  TfrmInputPembayaranPenjualan = class(TfrmTplInput)
    Label1: TLabel;
    cxgrdPP: TcxGrid;
    cxtbInv: TcxGridTableView;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    cxlbl1: TcxLabel;
    cxlbl3: TcxLabel;
    cxlbl5: TcxLabel;
    cxlbl6: TcxLabel;
    cxdTgl: TcxDateEdit;
    cxlCustomer: TcxLookupComboBox;
    cxtAlamat: TcxTextEdit;
    cxtNoBukti: TcxTextEdit;
    zqrInv: TZReadOnlyQuery;
    dsInv: TDataSource;
    zqrCustomer: TZReadOnlyQuery;
    dsCustomer: TDataSource;
    cxlbl14: TcxLabel;
    cxtKeterangan: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxlAkun: TcxLookupComboBox;
    cxColNoInvoice: TcxGridColumn;
    cxColTglInvoice: TcxGridColumn;
    cxColSaldo: TcxGridColumn;
    cxColJmlDibayar: TcxGridColumn;
    cxLabel2: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    zqrAkun: TZReadOnlyQuery;
    dsAkun: TDataSource;
    cxtAkun: TcxTextEdit;
    cxtbInvColumn1: TcxGridColumn;
    procedure cxLuSupplierPropertiesChange(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxtbTblPODataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure FormCreate(Sender: TObject);
    procedure cxtbInvDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
  private
    mStatus: string;
  public
    { Public declarations }
  end;

var
  frmInputPembayaranPembelian: TfrmInputPembayaranPenjualan;

implementation

uses
  unFrmUtama, unDM, unAplikasi, unTools, unFrmLstPembayaranPenjualan;

{$R *.dfm}

procedure TfrmInputPembayaranPenjualan.btnSimpanClick(Sender: TObject);
var
  q, qh, qd, rs_fobj: TZQuery;
  sNoBukti : string;
  i, id : integer;
  f0: Boolean;

begin
  inherited;

  if (cxtbInv.DataController.EditState = [dceInsert, dceModified]) or
    (cxtbInv.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.');
    Abort;
  end;

  if cxlCustomer.Text = '' then begin
    MsgBox('Nama customer masih kosong.');
    cxlCustomer.SetFocus;
    Abort;
  end;

  if cxlAkun.Text = '' then begin
    MsgBox('Mohon pilih akun.');
    cxlAkun.SetFocus;
    Abort;
  end;

  with cxtbInv.DataController do begin

    if RecordCount = 0 then begin
      MsgBox('Detail transaksi masih kosong.');
      Abort;
    end;

    if Self.Jenis = 'T' then begin
      sNoBukti := GetLastFak('pembayaran-penjualan');
      UpdateFaktur(Copy(sNoBukti,1,8));
    end
    else begin
      sNoBukti := cxtNoBukti.text;
    end;

    try
      dm.zConn.StartTransaction;

      qh := OpenRS('SELECT * FROM tbl_pembayaranpenjualan_head WHERE no_bukti = ''%s''',[sNoBukti]);
      if Self.Jenis = 'T' then begin
        qh.Insert;
      end
      else begin
        qh.Edit;
        ID := qh.FieldByName('id').AsInteger;
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_pembayaranpenjualan_det WHERE id_ref = %s',[Self.EditKey]));
      end;

      qh.FieldByName('no_bukti').AsString := sNoBukti;
      qh.FieldByName('tanggal').AsDateTime := cxdTgl.Date;
      qh.FieldByName('id_cust').AsInteger := cxlCustomer.EditValue;
      qh.FieldByName('id_akun').AsInteger := cxlAkun.EditValue;
      qh.FieldByName('user').AsString := Aplikasi.NamaUser;
      qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
      qh.Post;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      qd := OpenRS('SELECT * FROM tbl_pembayaranpenjualan_det WHERE id_ref = %d',[ID]);
      with cxtbInv.DataController do begin
        for i := 0 to RecordCount - 1 do begin
          qd.Insert;
          qd.FieldByName('id_ref').AsInteger := ID;
          qd.FieldByName('id_invoice').AsInteger := Values[i, cxColNoInvoice.Index];
          qd.FieldByName('jml_pembayaran').AsFloat := Values[i, cxColJmlDibayar.Index];
          qd.Post;
        end;
      end;
      dm.zConn.Commit;
      qh.Close;
      qd.Close;
      Self.Jenis := '';
      MsgBox('Transaksi Pembayaran Penjualan sudah disimpan dengan No. Bukti : ' + sNoBukti);

      if Assigned(Self.FormInduk) then
        (Self.FormInduk as TfrmLstPembayaranPenjualan).btnRefreshClick(nil);

      btnBatalClick(nil);
    except
      on E: Exception do begin
        dm.zConn.Rollback;
        MsgBox('Error: ' + E.Message);
      end;
    end;
  end;
end;

procedure TfrmInputPembayaranPenjualan.cxLuSupplierPropertiesChange(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  try
    zqrInv.Close;
    zqrInv.ParamByName('id_cust').AsInteger := cxlCustomer.EditValue;
    zqrInv.Open;
  finally
  end;
end;

procedure TfrmInputPembayaranPenjualan.cxtbInvDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
begin
  inherited;
  if AItemIndex = cxColNoInvoice.Index then begin
    q := OpenRS('SELECT SUM(qty * harga) subtotal, ' +
      '(SELECT SUM(jml_pembayaran) FROM tbl_pembayaranpenjualan_det WHERE id_invoice = a.id_ref) jml_pembayaran ' +
      'FROM tbl_invoicepenjualan_det a ' +
      'WHERE a.id_ref = %s', [ADataController.Values[ARecordIndex, AItemIndex]]);
    ADataController.Values[ARecordIndex, cxColSaldo.Index] :=
      q.FieldByName('subtotal').AsFloat - q.FieldByName('jml_pembayaran').AsFloat;
    q.Close;
  end;
end;

procedure TfrmInputPembayaranPenjualan.cxtbTblPODataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
begin
  inherited;

  i := ADataController.FocusedRowIndex;
  k := ADataController.GetEditingRecordIndex;
  v := ADataController.Values[i, cxColNoInvoice.Index];

  for j := 0 to ADataController.RecordCount - 1 do begin
    if j <> k then begin
      if v = ADataController.Values[j, cxColNoInvoice.Index] then begin
        MsgBox('No. Invoice tersebut sudah ada.');
        ADataController.DeleteRecord(i);
        Abort
      end;
    end;
  end;

  {
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


procedure TfrmInputPembayaranPenjualan.FormCreate(Sender: TObject);
begin
  inherited;
  zqrCustomer.Open;
end;

procedure TfrmInputPembayaranPenjualan.FormShow(Sender: TObject);
  var
   q,z : TZQuery;
   i, nomer: integer;
   sNoTrs : string;
begin

  inherited;
  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('pembayaran-penjualan');
    cxtNoBukti.Text := sNoTrs;
    cxdTgl.Date := Aplikasi.Tanggal;
  end;
  {
  else if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_po_head WHERE id = %s',[Self.EditKey]);
    cxtNoBukti.Text := q.FieldByName('no_bukti').AsString;
    cxlSupplier.EditValue := q.FieldByName('id_supplier').AsInteger;
    cxtKeterangan.Text := q.FieldByName('keterangan').AsString;
    cxCboPembayaran.Text := q.FieldByName('pembayaran').AsString;
    cxdTgl.Date := q.FieldByName('tanggal').AsDateTime;
    cxdTglDatang.Date := q.FieldByName('tgl_required').AsDateTime;
    cxtUser.Text := q.FieldByName('user').AsString;
    cxtDepartemen.Text := q.FieldByName('user_dept').AsString;
    if q.FieldByName('f_app').AsInteger = 1 then cxChkApproval.Checked := True;
    cxlNoPP.Properties.ReadOnly := True;

    q.Close;
    z := OpenRS('SELECT a.*, b.kode, b.deskripsi, c.satuan satuan2 FROM tbl_po_det a ' +
      'left join tbl_barang b on a.id_brg = b.id ' +
      'LEFT JOIN tbl_satuan c on c.id = a.id_satuan ' +
      'WHERE id_ref = %s',[Self.EditKey]);
    nomer := 1;

    cxtbTblPO.DataController.OnRecordChanged := nil;
    while not z.Eof do begin
      with cxtbTblPO.DataController do begin
        i := AppendRecord;
        Values[i, cxColNo.Index] := nomer;
        Values[i, cxColKodeBrg.Index] := z.FieldByName('id_brg').AsString;
        Values[i, cxColDeskripsi.Index] := z.FieldByName('id_brg').AsString;
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
    cxtbTblPO.DataController.OnRecordChanged := Self.cxtbTblPODataControllerRecordChanged;

  end;
  }
end;

end.
