unit unFrmInputPembayaranPembelian;

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
  cxDBLookupEdit, cxLabel, DB, ZAbstractRODataset, ZDataset, cxMemo, Math;

type
  TfrmInputPembayaranPembelian = class(TfrmTplInput)
    Label1: TLabel;
    cxgrdPP: TcxGrid;
    cxtbInv: TcxGridTableView;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    cxlbl1: TcxLabel;
    cxlbl3: TcxLabel;
    cxlbl5: TcxLabel;
    cxlbl6: TcxLabel;
    cxdTgl: TcxDateEdit;
    cxlSupplier: TcxLookupComboBox;
    cxtAlamat: TcxTextEdit;
    cxtNoBukti: TcxTextEdit;
    zqrInv: TZReadOnlyQuery;
    dsInv: TDataSource;
    zqrSupplier: TZReadOnlyQuery;
    dsSupplier: TDataSource;
    cxlbl14: TcxLabel;
    cxtKeterangan: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxlAkun: TcxLookupComboBox;
    cxColNoInvoice: TcxGridColumn;
    cxColTglInvoice: TcxGridColumn;
    cxColSaldo: TcxGridColumn;
    cxColJmlDibayar: TcxGridColumn;
    cxLabel2: TcxLabel;
    zqrAkun: TZReadOnlyQuery;
    dsAkun: TDataSource;
    cxtAkun: TcxTextEdit;
    cxColTglJatuhTempo: TcxGridColumn;
    cxmTerbilang: TcxMemo;
    procedure cxLuSupplierPropertiesChange(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxtbTblPODataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure FormCreate(Sender: TObject);
    procedure cxtbInvDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxlAkunPropertiesEditValueChanged(Sender: TObject);
    procedure cxtbInvDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure cxlSupplierPropertiesEditValueChanged(Sender: TObject);
  private
    mStatus: string;
    procedure HitungTotal;
    procedure CekLunas;
  public
    { Public declarations }
  end;

var
  frmInputPembayaranPembelian: TfrmInputPembayaranPembelian;

implementation

uses
  unFrmUtama, unDM, unAplikasi, unTools, unFrmLstPembayaranPembelian;

{$R *.dfm}

procedure TfrmInputPembayaranPembelian.btnSimpanClick(Sender: TObject);
var
  q, qh, qd, rs_fobj, qjd: TZQuery;
  sNoBukti, sNoJ : string;
  i, id, id_akun : integer;
  f0: Boolean;

begin

  if (cxtbInv.DataController.EditState = [dceInsert, dceModified]) or
    (cxtbInv.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.');
    Abort;
  end;

  if cxlSupplier.Text = '' then begin
    MsgBox('Nama supplier masih kosong.');
    cxlSupplier.SetFocus;
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
      sNoBukti := GetLastFak('pembayaran-pembelian');
      UpdateFaktur(Copy(sNoBukti,1,8));
    end
    else begin
      sNoBukti := cxtNoBukti.text;
    end;

    try
      dm.zConn.StartTransaction;

      qh := OpenRS('SELECT * FROM tbl_pembayaranpembelian_head WHERE no_bukti = ''%s''',[sNoBukti]);
      if Self.Jenis = 'T' then begin
        qh.Insert;
      end
      else begin
        qh.Edit;
        ID := qh.FieldByName('id').AsInteger;
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_pembayaranpembelian_det WHERE id_ref = %s',[Self.EditKey]));
      end;

      qh.FieldByName('no_bukti').AsString := sNoBukti;
      qh.FieldByName('tanggal').AsDateTime := cxdTgl.Date;
      qh.FieldByName('id_supp').AsInteger := cxlSupplier.EditValue;
      qh.FieldByName('id_akun').AsInteger := cxlAkun.EditValue;
      qh.FieldByName('user').AsString := Aplikasi.NamaUser;
      qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
      qh.Post;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      if Aplikasi.FAcc then begin
        sNoJ := GetLastFak('jurnal');
        UpdateFaktur(Copy(sNoJ,1,6));
        qjd := OpenRS('SELECT * FROM tbl_jurnal WHERE no_jurnal = ''%s''',[sNoJ]);
      end;

      qd := OpenRS('SELECT * FROM tbl_pembayaranpembelian_det WHERE id_ref = %d',[ID]);
      with cxtbInv.DataController do begin
        for i := 0 to RecordCount - 1 do begin
          qd.Insert;
          qd.FieldByName('id_ref').AsInteger := ID;
          qd.FieldByName('id_invoice').AsInteger := Values[i, cxColNoInvoice.Index];
          qd.FieldByName('jml_pembayaran').AsFloat := Values[i, cxColJmlDibayar.Index];
          qd.FieldByName('idakun_bank').AsInteger := cxlAkun.EditValue;
          qd.Post;

          if Aplikasi.FAcc then begin
            id_akun := GetDefaultAkun('hutang_usaha_supplier');
            qjd.Insert;
            qjd.FieldByName('id_ref').AsInteger := ID;
            qjd.FieldbyName('tanggal').AsDateTime := Aplikasi.TanggalServer;
            qjd.FieldByName('no_jurnal').AsString := sNoJ;
            qjd.FieldByName('id_akun').AsInteger := id_akun;
            qjd.FieldByName('debet').AsFloat := cxtbInv.DataController.Values[i, cxColJmlDibayar.Index];
            qjd.FieldByName('keterangan').AsString := 'Pembayaran Pembelian, ' + cxlSupplier.Text;
            qjd.FieldByName('dc').AsString := 'D';
            qjd.FieldByName('no_trans').AsString := sNoBukti;
            qjd.FieldByName('tglinput').AsDateTime := Aplikasi.NowServer;
            qjd.Post;

            id_akun := GetDefaultAkun('depositintransit');
            qjd.Insert;
            qjd.FieldByName('id_ref').AsInteger := ID;
            qjd.FieldbyName('tanggal').AsDateTime := Aplikasi.TanggalServer;
            qjd.FieldByName('no_jurnal').AsString := sNoJ;
            qjd.FieldByName('id_akun').AsInteger := id_akun;
            qjd.FieldByName('kredit').AsFloat := cxtbInv.DataController.Values[i, cxColJmlDibayar.Index];
            qjd.FieldByName('keterangan').AsString := 'Pembayaran Pembelian, ' + cxlSupplier.Text;
            qjd.FieldByName('dc').AsString := 'K';
            qjd.FieldByName('no_trans').AsString := sNoBukti;
            qjd.FieldByName('tglinput').AsDateTime := Aplikasi.NowServer;
            qjd.Post;

            {
            if cxTbl.DataController.Values[i, cxColCair.Index] = 1 then begin
              sAkun := GetDefaultAkun('depositintransit');
              qjd.Insert;
              qjd.FieldbyName('tanggal').AsDateTime := Aplikasi.TanggalServer;
              qjd.FieldByName('no_jurnal').AsString := sNoJ;
              qjd.FieldByName('no_trans').AsString := cxTbl.DataController.Values[i, cxColNoInvoice.Index];
              qjd.FieldByName('akun').AsString := sAkun;
              qjd.FieldByName('debet').AsFloat := cxTbl.DataController.Values[i, cxColDibayar.Index];
              qjd.FieldByName('keterangan').AsString := 'PEMBAYARAN PEMBELIAN (AP)';
              qjd.FieldByName('dc').AsString := 'D';
              qjd.Post;

              sAkun := cxtNoAkun.Text;
              qjd.Insert;
              qjd.FieldbyName('tanggal').AsDateTime := Aplikasi.TanggalServer;
              qjd.FieldByName('no_jurnal').AsString := sNoJ;
              qjd.FieldByName('no_trans').AsString := cxTbl.DataController.Values[i, cxColNoInvoice.Index];
              qjd.FieldByName('akun').AsString := sAkun;
              qjd.FieldByName('kredit').AsFloat := cxTbl.DataController.Values[i, cxColDibayar.Index];
              qjd.FieldByName('keterangan').AsString := 'PEMBAYARAN PEMBELIAN (AP)';
              qjd.FieldByName('dc').AsString := 'K';
              qjd.Post;
              qjd.Close;
            end;
            }
          end;
        end;
      end;

      CekLunas;

      dm.zConn.Commit;
      qh.Close;
      qd.Close;
      Self.Jenis := '';
      MsgBox('Transaksi Pembayaran Pembelian sudah disimpan dengan No. Bukti : ' + sNoBukti);

      if Assigned(Self.FormInduk) then
        (Self.FormInduk as TfrmLstPembayaranPembelian).btnRefreshClick(nil);

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

procedure TfrmInputPembayaranPembelian.CekLunas;
var
  i: Integer;
  q: TZQuery;
  a,b: real;
begin
  for i := 0 to cxtbInv.DataController.RecordCount - 1 do begin
    q := OpenRS('SELECT ' +
      'SUM((a.qty * a.harga) - ((a.qty * a.harga) * a.disc_persen / 100)  + if(a.ppn = ''PPN'',((a.qty * a.harga) - ((a.qty * a.harga) * a.disc_persen / 100)) * 0.1,0)) subtotal, ' +
      '(SELECT SUM(jml_pembayaran) FROM tbl_pembayaranpembelian_det WHERE id_invoice = a.id_ref) jml_pembayaran ' +
      'FROM tbl_invoicepembelian_det a ' +
      'WHERE a.id_ref = %s', [cxtbInv.DataController.Values[i, cxColNoInvoice.Index]]);
    a := q.FieldByName('subtotal').AsFloat;
    b := q.FieldByName('jml_pembayaran').AsFloat;

    if CompareValue(a,b) = 0 then begin
      try
        dm.zConn.StartTransaction;
        dm.zConn.ExecuteDirect(
          Format('UPDATE tbl_invoicepembelian_head SET f_completed = 1 WHERE id = %s',
            [cxtbInv.DataController.Values[i, cxColNoInvoice.Index]])
        );
        dm.zConn.Commit;
      except
        on E: Exception do begin
          dm.zConn.Rollback;
          MsgBox('Error: ' + E.Message);
        end;
      end;
    end;
  end;
end;

procedure TfrmInputPembayaranPembelian.cxlAkunPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  try
    cxtAkun.Text := zqrAkun.FieldByName('noakun').AsString;
  except
  end;
end;

procedure TfrmInputPembayaranPembelian.cxlSupplierPropertiesEditValueChanged(
  Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  try
    zqrInv.Close;
    zqrInv.ParamByName('id_supp').AsInteger := cxlSupplier.EditValue;
    zqrInv.Open;

    q := OpenRS('SELECT alamat, alamat2, kota, provinsi, negara FROM tbl_supplier WHERE id = %s',[cxlSupplier.EditValue]);
      cxtAlamat.Text := q.FieldByName('alamat').AsString + ', ' + q.FieldByName('alamat2').AsString +
      ', ' + q.FieldByname('kota').AsString + ', ' + q.FieldByName('provinsi').AsString;
    q.Close;
  except
  end;
end;

procedure TfrmInputPembayaranPembelian.cxLuSupplierPropertiesChange(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  try
    zqrInv.Close;
    zqrInv.ParamByName('id_supp').AsInteger := cxlSupplier.EditValue;
    zqrInv.Open;

    q := OpenRS('SELECT alamat, alamat2, kota, provinsi, negara FROM tbl_supplier WHERE id = %s',[cxlSupplier.EditValue]);
      cxtAlamat.Text := q.FieldByName('alamat').AsString + ', ' + q.FieldByName('alamat2').AsString +
      ', ' + q.FieldByname('kota').AsString + ', ' + q.FieldByName('provinsi').AsString;
    q.Close;
  except
  end;
end;

procedure TfrmInputPembayaranPembelian.cxtbInvDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  try
    HitungTotal;
  except
  end;
end;

procedure TfrmInputPembayaranPembelian.cxtbInvDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
begin
  inherited;
  if AItemIndex = cxColNoInvoice.Index then begin
    q := OpenRS('SELECT ' +
      'SUM((a.qty * a.harga) - ((a.qty * a.harga) * a.disc_persen / 100)  + if(a.ppn = ''PPN'',((a.qty * a.harga) - ((a.qty * a.harga) * a.disc_persen / 100)) * 0.1,0)) subtotal, ' +
      '(SELECT SUM(jml_pembayaran) FROM tbl_pembayaranpembelian_det WHERE id_invoice = a.id_ref) jml_pembayaran, ' +
      'b.tgl_jatuhtempo, b.tanggal ' +
      'FROM tbl_invoicepembelian_det a ' +
      'LEFT JOIN tbl_invoicepembelian_head b ON a.id_ref = b.id ' +
      'WHERE a.id_ref = %s', [ADataController.Values[ARecordIndex, AItemIndex]]);
    ADataController.Values[ARecordIndex, cxColSaldo.Index] :=
      q.FieldByName('subtotal').AsFloat - q.FieldByName('jml_pembayaran').AsFloat;
    ADataController.Values[ARecordIndex, cxColTglInvoice.Index] := q.FieldByName('tanggal').AsDateTime;
    ADataController.Values[ARecordIndex, cxColTglJatuhTempo.Index] := q.FieldByname('tgl_jatuhtempo').AsDateTime;
    q.Close;
  end;
end;

procedure TfrmInputPembayaranPembelian.cxtbTblPODataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
  q: TZQuery;
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

  if (VarIsNull(ADataController.Values[i, cxColNoInvoice.Index])) or
      (Trim(ADataController.Values[i, cxColNoInvoice.Index]) = '')  then begin
    MsgBox('Mohon pilih Nomor Invoice.');
    Abort;
  end;

  if (VarIsNull(ADataController.Values[i, cxColJmlDibayar.Index])) or
      (ADataController.Values[i, cxColJmlDibayar.Index] = 0)  then begin
    MsgBox('Jml. Pembayaran harus di isi.');
    Abort;
  end
  else begin
    q := OpenRS('SELECT ' +
      'SUM((a.qty * a.harga) - ((a.qty * a.harga) * a.disc_persen / 100)  + if(a.ppn = ''PPN'',((a.qty * a.harga) - ((a.qty * a.harga) * a.disc_persen / 100)) * 0.1,0)) subtotal, ' +
      '(SELECT SUM(jml_pembayaran) FROM tbl_pembayaranpembelian_det WHERE id_invoice = a.id_ref) jml_pembayaran ' +
      'FROM tbl_invoicepembelian_det a ' +
      'WHERE a.id_ref = %s', [ADataController.Values[i, cxColNoInvoice.Index]]);
    if q.FieldByName('subtotal').AsFloat - q.FieldByName('jml_pembayaran').AsFloat <
      ADataController.Values[i, cxColJmlDibayar.Index] then begin
      MsgBox('Jml. Pembayaran melebihi saldo.');
      q.Close;
      Abort;
    end;
    q.Close;
  end;

end;


procedure TfrmInputPembayaranPembelian.FormCreate(Sender: TObject);
begin
  inherited;
  zqrSupplier.Open;
  zqrAkun.Open;
end;

procedure TfrmInputPembayaranPembelian.FormShow(Sender: TObject);
  var
   q,z : TZQuery;
   i, nomer: integer;
   sNoTrs : string;
begin

  inherited;
  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('pembayaran-pembelian');
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

procedure TfrmInputPembayaranPembelian.HitungTotal;
var
  total: real;
  i: integer;
begin
  total := 0;
  for i := 0 to cxtbInv.DataController.RecordCount - 1 do begin
    total := total + cxtbInv.DataController.Values[i, cxColJmlDibayar.Index];
  end;
  cxmTerbilang.Text := Terbilang(FloatToStr(total));
end;

end.
