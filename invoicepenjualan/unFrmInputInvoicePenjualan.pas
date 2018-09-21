unit unFrmInputInvoicePenjualan;

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
  TfrmInputInvoicePenjualan = class(TfrmTplInput)
    Label1: TLabel;
    cxgrdPP: TcxGrid;
    cxtbInv: TcxGridTableView;
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
    cxLuCustomer: TcxLookupComboBox;
    cxtAlamat: TcxTextEdit;
    cxtNoBukti: TcxTextEdit;
    zqrSjHead: TZReadOnlyQuery;
    dsSjHead: TDataSource;
    zqrCustomer: TZReadOnlyQuery;
    dsCustomer: TDataSource;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    cxlbl14: TcxLabel;
    cxtKeterangan: TcxTextEdit;
    cxColIdSatuan: TcxGridColumn;
    cxLabel1: TcxLabel;
    cxLuSj: TcxLookupComboBox;
    cxColKodeBrg2: TcxGridColumn;
    cxColPPN: TcxGridColumn;
    cxColDiscount: TcxGridColumn;
    cxLabel4: TcxLabel;
    cxsDiskon: TcxSpinEdit;
    DPP: TcxLabel;
    cxsStlhDiskon: TcxSpinEdit;
    cxsPPN: TcxSpinEdit;
    cxChkPPN: TcxCheckBox;
    cxLabel5: TcxLabel;
    cxsDPP: TcxSpinEdit;
    cxLabel6: TcxLabel;
    cxsHargaTotal: TcxSpinEdit;
    cxLabel2: TcxLabel;
    cxdTglJatuhTempo: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure cxLuSupplierPropertiesChange(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxtbTblPODataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxtbTblPODataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxLuCustomerClick(Sender: TObject);
    procedure cxLuSjPropertiesChange(Sender: TObject);
  private
    mStatus: string;
    procedure HitungTotal;
  public
    { Public declarations }
  end;

var
  frmInputInvoicePenjualan: TfrmInputInvoicePenjualan;

implementation

uses
  unFrmUtama, unDM, unAplikasi, unTools, unFrmLstPO, unFrmLstInvoicePenjualan;

{$R *.dfm}

procedure TfrmInputInvoicePenjualan.btnSimpanClick(Sender: TObject);
var
  q, qh, qd, rs_sj, qjd: TZQuery;
  sNoBukti, sNoJ : string;
  i, id, id_akun : integer;
  f0: Boolean;
begin

  if (cxtbInv.DataController.EditState = [dceInsert, dceModified]) or
    (cxtbInv.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.');
    Abort;
  end;

  if cxLuCustomer.Text = '' then begin
    MsgBox('Nama Customer masih kosong.');
    Abort;
  end;

  with cxtbInv.DataController do begin
    if RecordCount = 0 then begin
      MsgBox('Detail transaksi masih kosong.');
      Abort;
    end;

    if Self.Jenis = 'T' then begin
      sNoBukti := GetLastFak('invoice-penjualan');
      UpdateFaktur(Copy(sNoBukti,1,8));
    end
    else begin
      sNoBukti := cxtNoBukti.text;
    end;

    try
      dm.zConn.StartTransaction;

      qh := OpenRS('SELECT * FROM tbl_invoicepenjualan_head WHERE no_bukti = ''%s''',[sNoBukti]);
      if Self.Jenis = 'T' then begin
        qh.Insert;
      end
      else begin
        qh.Edit;
        ID := qh.FieldByName('id').AsInteger;
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_invoicepenjualan_det WHERE id_ref = %s',[Self.EditKey]));
      end;

      qh.FieldByName('no_bukti').AsString := sNoBukti;
      qh.FieldByName('tanggal').AsDateTime := cxdTgl.Date;
      qh.FieldByName('id_cust').AsString := cxLuCustomer.EditValue;
      qh.FieldByName('user').AsString := Aplikasi.NamaUser;
      qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
      qh.FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
      qh.FieldByName('keterangan').AsString := Trim(cxtKeterangan.Text);
      qh.FieldByName('id_sj').AsInteger := cxLuSj.EditValue;
      qh.FieldByName('total').AsFloat := cxsHargaTotal.Value;
      if cxsDiskon.Value > 0 then
        qh.FieldByName('diskon').AsFloat := (cxsHargaTotal.Value * cxsDiskon.Value / 100);
      if cxChkPPN.Checked then
        qh.FieldByName('f_ppn').AsInteger := 1;
      qh.FieldByName('tgl_jatuhtempo').AsDateTime := cxdTglJatuhTempo.Date;
      qh.Post;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      sNoJ := GetLastFak('faktur');
      UpdateFaktur(Copy(sNoJ, 1,6));

      qd := OpenRS('SELECT * FROM tbl_invoicepenjualan_det WHERE id_ref = %d',[ID]);
      with cxtbInv.DataController do begin
        for i := 0 to RecordCount - 1 do begin
          qd.Insert;
          qd.FieldByName('id_ref').AsInteger := ID;
          qd.FieldByName('no_bukti').AsString := sNoBukti;
          qd.FieldByName('id_brg').AsString := Values[i, cxColKodeBrg.Index];
          qd.FieldByName('qty').AsFloat := Values[i, cxColQty.Index];
          qd.FieldByName('harga').AsFloat := Values[i, cxColHarga.Index];
          qd.FieldByName('id_satuan').AsInteger := Values[i, cxColIdSatuan.Index];
          qd.FieldByName('ppn').AsString := Values[i, cxColPPN.Index];
          qd.FieldByName('discount').AsFloat := Values[i, cxColDiscount.Index];
          //qd.FieldByName('valuta').AsString := values[i, cxColValuta.Index];
          qd.FieldByName('keterangan').AsString := values[i, cxColKeterangan.Index];
          qd.Post;

          id_akun := GetDefaultAkunBrg(Values[i, cxColKodeBrg.Index],'penjualan');
          qjd := OpenRS('SELECT * FROM tbl_jurnal_det WHERE no_jurnal = ''%s''',[sNoJ]);
          qjd.Insert;
          qjd.FieldByName('id_ref').AsInteger := ID;
          qjd.FieldbyName('tanggal').AsDateTime := Aplikasi.TanggalServer;
          qjd.FieldByName('no_jurnal').AsString := sNoJ;
          qjd.FieldByName('no_trans').AsString := sNoBukti;
          qjd.FieldByName('id_akun').AsInteger := id_akun;
          qjd.FieldByName('kredit').AsFloat := cxsStlhDiskon.Value;
          qjd.FieldByName('dc').AsString := 'K';
          qjd.Post;
          qjd.Close;

        end;
      end;
      qh.Close;
      qd.Close;
      Self.Jenis := '';

      dm.zConn.ExecuteDirect(
        Format('UPDATE tbl_sj_head SET f_inv = 1 WHERE id = %s',[cxLuSj.EditValue])
      );

      if Aplikasi.FAcc then begin
        id_akun := GetDefaultAkun('piutangcustomer');

        qjd.Insert;
        qjd.FieldByName('id_ref').AsInteger := ID;
        qjd.FieldbyName('tanggal').AsDateTime := Aplikasi.TanggalServer;
        qjd.FieldByName('no_jurnal').AsString := sNoJ;
        qjd.FieldByName('no_trans').AsString := sNoBukti;
        qjd.FieldByName('id_akun').AsInteger := id_akun;
        qjd.FieldByName('debet').AsFloat := cxsHargaTotal.Value;
        qjd.FieldByName('dc').AsString := 'D';
        qjd.Post;



      end;

      dm.zConn.Commit;

      MsgBox('Transaksi Invoice Penjualan sudah disimpan dengan No. Bukti : ' + sNoBukti);

      if Assigned(Self.FormInduk) then
        (Self.FormInduk as TfrmLstInvoicePenjualan).btnRefreshClick(nil);

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

procedure TfrmInputInvoicePenjualan.cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
 var
  row : Integer;
begin
  inherited;
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;

procedure TfrmInputInvoicePenjualan.cxLuCustomerClick(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  try
    q := OpenRS('SELECT * FROM tbl_customer WHERE id = %s',[CxLuCustomer.EditValue]);
    cxtAlamat.Text := q.FieldByName('alamat').AsString + ', ' + q.FieldByName('alamat2').AsString +
      ', ' + q.FieldByname('kota').AsString + ', ' + q.FieldByName('provinsi').AsString;

    zqrSjHead.ParamByName('id_Cust').AsString := q.FieldByName('id').AsString;
    zqrSjHead.Close;

    zqrSjHead.Open;
    q.Close;
  except
  end;
end;

procedure TfrmInputInvoicePenjualan.cxLuSjPropertiesChange(Sender: TObject);
var
  q : TZQuery;
  i : Integer;
  subtotal, total : Double;
begin
  inherited;
  try
    q := OpenRS('select a.kode_brg, a.id_brg, b.deskripsi, a.qty, d.f_ppn, d.diskon, c.satuan, a.id_satuan, a.harga, a.qty * a.harga as total, IFNULL(a.disc,0) disc, ' +
      'd.diskon, d.jatuh_tempo, ' +
      '(a.qty * a.harga) - ((a.qty * a.harga) * a.disc / 100) subtotal ' +
      'from tbl_sj_det a left join tbl_barang b on a.kode_brg = b.kode ' +
      'left join tbl_sj_head d on a.id_ref = d.id ' +
      'left join tbl_satuan c on a.id_satuan = c.id ' +
      'where a.id_ref = %s',[cxluSj.EditValue]);

    cxsDiskon.Value := q.FieldByName('diskon').AsFloat;
    cxdTglJatuhTempo.Date := q.FieldByname('jatuh_tempo').AsDateTime;

    cxChkPPN.Properties.ReadOnly := True;
    if q.FieldByName('f_ppn').AsInteger = 1 then
      cxChkPPN.Checked := True
    else
      cxChkPPN.Checked := False;

    cxtbInv.DataController.OnRecordChanged := nil;
    cxtbInv.DataController.RecordCount := 0;
    total := 0;
    subtotal := 0;
    while not q.Eof do begin
      with cxtbInv.DataController do begin
        i := AppendRecord;
        Values[i, cxColKodeBrg.Index] := q.FieldByName('id_brg').AsString;
        Values[i, cxColDeskripsi.Index] := q.FieldByName('id_brg').AsString;
        Values[i, cxColQty.Index] := q.FieldByName('qty').AsFloat;
        Values[i, cxColSatuan.Index] := q.FieldByName('satuan').AsString;
        Values[i, cxColIdSatuan.Index] := q.FieldByname('id_satuan').AsInteger;
        Values[i, cxColValuta.Index] := 'IDR';
        Values[i, cxColHarga.Index] := q.FieldByName('harga').AsFloat;
        Values[i, cxColDiscount.Index] := q.FieldByName('disc').AsFloat;
        if q.FieldByName('f_ppn').AsString = '1'  then begin
          Values[i, cxColPPN.Index] := 'PPN';
          cxsPPN.Value := 10;
          Values[i, cxColTotal.Index] := q.FieldByName('subtotal').AsFloat;
        end else begin
          if q.FieldByName('diskon').AsFloat <> 0  then begin
            Values[i, cxColPPN.Index] := 'NON PPN';
            Values[i, cxColTotal.Index] := q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat;
            total := total + (q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat);
            subtotal := subtotal + (q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat);
            cxsPPN.Value := 0;
          end else begin
            Values[i, cxColPPN.Index] := 'NON PPN';
            Values[i, cxColTotal.Index] := q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat;
            total := total + (q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat);
            subtotal := subtotal + (q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat);
            cxsPPN.Value := 0;          
          end;
        end;
        Values[i, cxColKeterangan.Index] := '';

       // Values[i, cxColKodeBrg2.Index] := q.FieldByName('kode').AsString;
      end;
      q.Next;
    end;
    HitungTotal;
  finally

  end;
end;

procedure TfrmInputInvoicePenjualan.cxLuSupplierPropertiesChange(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  try
    q := OpenRS('SELECT * FROM tbl_customer WHERE id = %s',[CxLuCustomer.EditValue]);
    cxtAlamat.Text := q.FieldByName('alamat').AsString + ', ' + q.FieldByName('alamat2').AsString +
      ', ' + q.FieldByname('kota').AsString + ', ' + q.FieldByName('provinsi').AsString;

    zqrSjHead.ParamByName('id_Cust').AsString := q.FieldByName('id').AsString;
    zqrSjHead.Close;

    zqrSjHead.Open;
    q.Close;
  except
  end;
end;

procedure TfrmInputInvoicePenjualan.cxtbTblPODataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
begin
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

end;


procedure TfrmInputInvoicePenjualan.cxtbTblPODataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
  t, t1, t2, t3 : Real;
  i: Integer ;
begin
  inherited;
  {
  if AItemIndex = cxColKodeBrg.Index then begin
    try
      cxtbTblPO.BeginUpdate;
      ADataController.Values[ARecordIndex, cxColDeskripsi.Index] := ADataController.Values[ARecordIndex, AItemIndex];
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
        [ADataController.Values[ARecordIndex, AItemIndex]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg.Index] :=  ADataController.Values[ARecordIndex, AItemIndex];
      ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      ADataController.Values[ARecordIndex, cxColqty.Index] := '1';
      ADataController.Values[ARecordIndex, cxColValuta.Index] := 'IDR';
      ADataController.Values[ARecordIndex, cxColKodeBrg2.Index] := q.FieldByName('kode').AsString;
      q.Close;
    finally
      cxtbTblPO.EndUpdate;
    end;
  end;

  if AItemIndex = cxColDeskripsi.Index then begin
    try
      cxtbTblPO.BeginUpdate;
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
        [ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg.Index] :=  ADataController.Values[ARecordIndex, AItemIndex];
      ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      ADataController.Values[ARecordIndex, cxColqty.Index] := '1';
      ADataController.Values[ARecordIndex, cxColValuta.Index] := 'IDR';
      ADataController.Values[ARecordIndex, cxColKodeBrg2.Index] := q.FieldByName('kode').AsString;
      q.Close;
    finally
      cxtbTblPO.EndUpdate
    end;
  end;

  if AItemIndex = cxColHarga.Index then begin
    try
      cxtbTblPO.BeginUpdate;
//      if cxColPPn.EditValue = 'PPN' then begin
//        cxColtotal.EditValue := cxColQty.EditValue *  cxColHarga.EditValue * 110 /100 ;
//        cxtbTblPO.DataController.RefreshExternalData;
//      end
//      else begin
//        cxColTotal.EditValue := cxColQty.EditValue * cxColHarga.EditValue;
//        cxtbTblPO.DataController.RefreshExternalData;
//      end;
    finally
      cxtbTblPO.EndUpdate
    end;
  end;

//  if AItemIndex = cxColPPn.Index then begin
//    try
//      cxtbTblPO.BeginUpdate;
//     { if cxColPPn.EditValue = 'PPN' then begin
//        cxColTotal.EditValue := cxColQty.EditValue * cxColHarga.EditValue * 110 /100;
//        cxtbTblPO.DataController.RefreshExternalData;
//      end
//      else begin
//        cxColtotal.EditValue := cxColQty.EditValue * cxColHarga.EditValue;
//        cxtbTblPO.DataController.RefreshExternalData;
//      end;}
//    finally
//      cxtbTblPO.EndUpdate;
//    end;
//  end;

end;

procedure TfrmInputInvoicePenjualan.FormCreate(Sender: TObject);
begin
inherited;

  cxdTgl.Date := Aplikasi.Tanggal;
  zqrSjHead.Open;
  zqrCustomer.Open;
  zqrBarang.Open;

end;

procedure TfrmInputInvoicePenjualan.FormShow(Sender: TObject);
  var
   q,z : TZQuery;
   i, nomer: integer;
   sNoTrs : string;
begin
  inherited;

  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('invoice-penjualan');
    cxtNoBukti.Text := sNoTrs;
    cxdTgl.Date := Aplikasi.Tanggal;
   
  end
  else if Self.Jenis = 'E' then begin
   { q := OpenRS('SELECT * FROM tbl_invoicepenjualan_head WHERE id = %s',[Self.EditKey]);
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
  }
  end;

end;


procedure TfrmInputInvoicePenjualan.HitungTotal;
var
  i: integer;
  tot, diskon, ppn, disc: real;
begin
  try

    tot := 0;
    disc := 0;

    for i := 0 to cxtbInv.DataController.RecordCount - 1 do begin
      tot := tot + cxtbInv.DataController.Values[i, cxColTotal.Index];
    end;

    diskon := 0;
    if cxsDiskon.Value > 0 then
      diskon := (cxsDiskon.Value / 100) * tot;

    //if disc > 0 then
    //  cxsDiskon.Value := disc;

    cxsStlhDiskon.Value := tot - diskon;

    if cxChkPPN.Checked then
      cxsDPP.Value := cxsStlhDiskon.Value / 1.1
    else
      cxsDPP.Value := 0;

    ppn := 0;
    if cxChkPPN.Checked then
      ppn := (10 / 100) * cxsDPP.Value;

    cxsHargaTotal.Value := cxsDPP.Value + ppn;

  except
  end;
end;

end.
