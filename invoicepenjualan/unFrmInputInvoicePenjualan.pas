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
    cxtbTblPO: TcxGridTableView;
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
    cxsSubTotal: TcxSpinEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxsPPN: TcxSpinEdit;
    cxLabel4: TcxLabel;
    cxsTotal: TcxSpinEdit;
    cxColKodeBrg2: TcxGridColumn;
    cxColPPN: TcxGridColumn;
    cxColDiscount: TcxGridColumn;
    procedure cxLuNoPPPropertiesChange(Sender: TObject);
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
    procedure cxLuNoPPPropertiesEditValueChanged(Sender: TObject);
    procedure cxLuCustomerClick(Sender: TObject);
    procedure cxLuSjPropertiesChange(Sender: TObject);
  private
    mStatus: string;
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
  q, qh, qd, rs_sj: TZQuery;
  sNoBukti : string;
  i, id : integer;
  f0: Boolean;

begin

  {if (cxtbTblPO.DataController.EditState = [dceInsert, dceModified]) or (cxtbTblPO.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.');
    Abort;
  end;}

  if cxLuCustomer.Text = '' then begin
    MsgBox('Nama Customer masih kosong.');
    Abort;
  end;

  with cxtbTblPO.DataController do begin
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
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_po_det WHERE id_ref = %s',[Self.EditKey]));
      end;

      qh.FieldByName('no_bukti').AsString := sNoBukti;
      qh.FieldByName('tanggal').AsDateTime := cxdTgl.Date;
      qh.FieldByName('id_cust').AsString := cxLuCustomer.EditValue;
      qh.FieldByName('user').AsString := Aplikasi.NamaUser;
      qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
      qh.FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
      qh.FieldByName('keterangan').AsString := Trim(cxtKeterangan.Text);
      qh.FieldByName('id_sj').AsInteger := cxLuSj.EditValue;
      qh.Post;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      qd := OpenRS('SELECT * FROM tbl_invoicepenjualan_det WHERE id_ref = %d',[ID]);
      with cxtbTblPO.DataController do begin
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
        end;
      end;
      qh.Close;
      qd.Close;
      Self.Jenis := '';

      dm.zConn.ExecuteDirect(
        Format('UPDATE tbl_sj_head SET f_inv = 1 WHERE id = %s',[cxLuSj.EditValue])
      );

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
  finally

  end;
end;

procedure TfrmInputInvoicePenjualan.cxLuNoPPPropertiesChange(Sender: TObject);
var
  q, z : TZQuery;
  t, i : Integer;

begin
  inherited;
  {
  q := OpenRS('select diajukan_oleh, diajukan_dept from tbl_pp_head where id = %s',[cxlNoPP.EditValue]);
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
  z.Close;
  }
end;

procedure TfrmInputInvoicePenjualan.cxLuNoPPPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  {
  if cxlNoPP.Text <> '' then begin
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
  end;
  }
end;

procedure TfrmInputInvoicePenjualan.cxLuSjPropertiesChange(Sender: TObject);
var
  q : TZQuery;
  i : Integer;
  subtotal, total : Double;
begin
  inherited;
  try
    q := OpenRS('select a.kode_brg, a.id_brg, b.deskripsi, a.qty, d.f_ppn, d.diskon, c.satuan, a.id_satuan, a.harga, a.qty * a.harga as total from tbl_sj_det a left join tbl_barang b on a.kode_brg = b.kode ' +
              'left join tbl_sj_head d on a.id_ref = d.id left join tbl_satuan c on a.id_satuan = c.id where a.no_bukti = ''%s''',[cxluSj.Text]);
    cxtbTblPO.DataController.OnRecordChanged := nil;
    cxtbTblPO.DataController.RecordCount := 0;
    total := 0;
    subtotal := 0;
    while not q.Eof do begin
      with cxtbTblPO.DataController do begin
        i := AppendRecord;
        Values[i, cxColKodeBrg.Index] := q.FieldByName('id_brg').AsString;
        Values[i, cxColDeskripsi.Index] := q.FieldByName('id_brg').AsString;
        Values[i, cxColQty.Index] := q.FieldByName('qty').AsFloat;
        Values[i, cxColSatuan.Index] := q.FieldByName('satuan').AsString;
        Values[i, cxColIdSatuan.Index] := q.FieldByname('id_satuan').AsInteger;
        Values[i, cxColValuta.Index] := 'IDR';
        Values[i, cxColHarga.Index] := q.FieldByName('harga').AsFloat;
        Values[i, cxColDiscount.Index] := q.FieldByName('diskon').AsFloat;
        if q.FieldByName('f_ppn').AsString = '1'  then begin
          Values[i, cxColPPN.Index] := 'PPN';
          if q .FieldByName('diskon').AsFloat <> 0 then begin
            Values[i, cxColTotal.Index] := q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat * 110/100;
            cxsPPN.Value := 10;
            subtotal := subtotal + (q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat);
            total := total + (q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat * 110/100);
          end else begin
            Values[i, cxColTotal.Index] := q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat * 110/100;
            cxsPPN.Value := 10;
            subtotal := subtotal + (q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat);
            total := total + (q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat * 110/100);
          end
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
      cxsTotal.Value := total;
      cxsSubTotal.Value := subtotal
    end;
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
  finally

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


end.
