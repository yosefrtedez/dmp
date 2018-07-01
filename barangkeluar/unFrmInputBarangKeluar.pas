unit unFrmInputBarangKeluar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, DB,
  ZAbstractRODataset, ZDataset, cxCheckBox, cxTextEdit, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLabel, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxSpinEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, Spin;

type
  TfrmInputBarangKeluar = class(TfrmTplInput)
    Label13: TLabel;
    cxlbl1: TcxLabel;
    cxlbl4: TcxLabel;
    cxdTglDatang: TcxDateEdit;
    cxtNoBukti: TcxTextEdit;
    cxlbl14: TcxLabel;
    cxtKeterangan: TcxTextEdit;
    zqrSupplier: TZReadOnlyQuery;
    dsSupplier: TDataSource;
    cxgrdPP: TcxGrid;
    cxtbRetur: TcxGridTableView;
    cxColNo: TcxGridColumn;
    cxColKodeBrg: TcxGridColumn;
    cxColDeskripsi: TcxGridColumn;
    cxColQty: TcxGridColumn;
    cxColSatuan: TcxGridColumn;
    cxColKeterangan: TcxGridColumn;
    cxColTotal: TcxGridColumn;
    cxColIdSatuan: TcxGridColumn;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    cxColGudang: TcxGridColumn;
    zqrGudang: TZReadOnlyQuery;
    dsGudang: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure cxlSupplierPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxtbReturDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxtbReturDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputBarangKeluar: TfrmInputBarangKeluar;

implementation

uses unDM, unTools;

{$R *.dfm}

procedure TfrmInputBarangKeluar.btnSimpanClick(Sender: TObject);
var
  q, qh, qd : TZQuery;
  sNoBukti : string;
  i, id : integer;
  f0: Boolean;

begin
  inherited;

  if (cxtbRetur.DataController.EditState = [dceInsert, dceModified]) or (cxtbRetur.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.');
    Abort;
  end;

  if cxluSupplier.Text = '' then begin
    MsgBox('Nama supllier masih kosong.');
    Abort;
  end;

  // cek approval PO
  if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT f_app FROM tbl_trsreturpemb_head WHERE id = %s',[Self.EditKey]);
    if q.FieldByName('f_app').AsInteger = 1 then begin
      MsgBox('Retur pembelian tidak bisa di edit karena sudah di Approval.');
      Abort;
    end;
  end;

  with cxtbRetur.DataController do begin
    if RecordCount = 0 then begin
      MsgBox('Detail transaksi masih kosong.');
      Abort;
    end;

    if Self.Jenis = 'T' then begin
      sNoBukti := GetLastFak('retur-pemb');
      UpdateFaktur(Copy(sNoBukti,1,7));
    end
    else begin
      sNoBukti := cxtNoBukti.text;
    end;

    try
      dm.zConn.StartTransaction;

      qh := OpenRS('SELECT * FROM tbl_trsreturpemb_head WHERE no_bukti = ''%s''',[sNoBukti]);
      if Self.Jenis = 'T' then begin
        qh.Insert;
      end
      else begin
        qh.Edit;
        ID := qh.FieldByName('id').AsInteger;
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_trsreturpemb_det WHERE id_ref = %s',[Self.EditKey]));
      end;

      qh.FieldByName('no_bukti').AsString := sNoBukti;
      if cxLuInvoice.Text = '' then begin
        qh.FieldByName('id_invoice').AsString := '';
      end
      else begin
        qh.FieldByName('id_invoice').AsString := cxLuInvoice.EditValue;
      end;
      qh.FieldByName('id_supplier').AsString := cxLuSupplier.EditValue;
      qh.FieldByName('keterangan').AsString := cxtKeterangan.Text;
      qh.FieldByName('tanggal').AsDateTime := Aplikasi.Tanggal;
      qh.FieldByName('user').AsString := Aplikasi.NamaUser;
      qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
      qh.FieldByName('tgl_input').AsDateTime := Aplikasi.Tanggal;
      qh.Post;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      qd := OpenRS('SELECT * FROM tbl_trsreturpemb_det WHERE no_bukti = ''%s''',[sNoBukti]);
      with cxtbRetur.DataController do begin
        for i := 0 to RecordCount - 1 do begin
          qd.Insert;
          if Self.Jenis = 'T' then begin
            qd.FieldByName('id_ref').AsInteger := ID;
          end else begin
            qd.FieldByName('id_ref').AsString := qh.FieldByName('id').AsString;
          end;
          qd.FieldByName('no_bukti').AsString := sNoBukti;
          qd.FieldByName('kode_brg').AsString := Values[i, cxColKodeBrg.Index];
          qd.FieldByName('id_brg').AsInteger := Values[i, cxColDeskripsi.Index];
          qd.FieldByName('qty').AsFloat := Values[i, cxColQty.Index];
          qd.FieldByName('id_satuan').AsString := Values[i, cxColIdSatuan.Index];
          qd.FieldByName('harga').AsFloat := Values[i, cxColHarga.Index];
          qd.FieldByName('id_gdg').AsString := Values[i, cxColGudang.Index];
          if Values[i, cxColValuta.Index] = 'IDR' then begin
            qd.FieldByName('mata_uang').AsString := 'IDR';
            qd.FieldByName('nilai_tukar').AsString := '1';
          end else begin
            qd.FieldByName('mata_uang').AsString := Values[i, cxColValuta.Index];
            qd.FieldByName('nilai_tukar').AsString := cxsrate.Text;
          end;
          if VarIsNull(Values[i, cxColPPn.index]) = True then begin
            qd.FieldByName('ppn').AsString := '';
          end else begin
            qd.FieldByName('ppn').AsString := Values[i, cxColPPn.index];
          end;
          if VarIsNull(Values[i, cxColKeterangan.index]) = True then begin
            qd.FieldByName('keterangan').AsString := '';
          end else begin
            qd.FieldByName('keterangan').AsString := Values[i, cxColKeterangan.Index];
          end;
          qd.Post;
        end;
      end;
      dm.zConn.Commit;
      qh.Close;
      qd.Close;
      Self.Jenis := '';
      MsgBox('Transaksi retur pembelian sudah disimpan dengan No. Bukti : ' + sNoBukti);
      btnBatalClick(nil);
    except
      on E: Exception do begin
        dm.zConn.Rollback;
        MsgBox('Error: ' + E.Message);
      end;
    end;
  end;

end;

procedure TfrmInputBarangKeluar.cxColNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var
  row : Integer;
begin
  inherited;
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;

procedure TfrmInputBarangKeluar.cxlSupplierPropertiesChange(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  q := OpenRS('SELECT alamat FROM tbl_supplier WHERE id = %s',[cxluSupplier.EditValue]);
  cxtAlamat.Text := q.FieldByName('alamat').AsString;
  q.Close;
end;

procedure TfrmInputBarangKeluar.cxtbReturDataControllerBeforePost(
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
      MsgBox('Kode barang harus diisi.');
      Abort;
  end;

  if (VarIsNull(ADataController.Values[i, cxColGudang.Index])) or
      (Trim(ADataController.Values[i, cxColGudang.Index]) = '')  then begin
      MsgBox('Kode gudang harus diisi.');
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

  if ADataController.Values[i, cxColValuta.Index] = 'USD' then begin
    if cxsrate.Text = '1'  then begin
      MsgBox('Periksa Lagi Rate Anda');
      Abort;
    end;
  end;


end;

procedure TfrmInputBarangKeluar.cxtbReturDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
  t, t1, t2, t3 : Real;
  i: Integer ;
begin
  inherited;

  if AItemIndex = cxColDeskripsi.Index then begin
    try
      cxtbRetur.BeginUpdate;
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
      [ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg.Index] :=  q.FieldByName('kode').AsString;
      ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      ADataController.Values[ARecordIndex, cxColqty.Index] := '1';
      ADataController.Values[ARecordIndex, cxColPPn.Index] := 'NON PPN';
      ADataController.Values[ARecordIndex, cxColValuta.Index] := 'IDR';
      q.Close;
    finally
      cxtbRetur.EndUpdate
    end;
  end;

  if AItemIndex = cxColHarga.Index then begin
    try
      cxtbRetur.BeginUpdate;
      if cxColPPn.EditValue = 'PPN' then begin
        cxColtotal.EditValue := cxColQty.EditValue *  cxColHarga.EditValue * 110 /100 ;
        cxtbRetur.DataController.RefreshExternalData;
      end
      else begin
        cxColTotal.EditValue := cxColQty.EditValue * cxColHarga.EditValue;
        cxtbRetur.DataController.RefreshExternalData;
      end;
    finally
      cxtbRetur.EndUpdate
    end;
  end;

  if AItemIndex = cxColPPn.Index then begin
    try
      cxtbRetur.BeginUpdate;
      if cxColPPn.EditValue = 'PPN' then begin
        cxColTotal.EditValue := cxColQty.EditValue * cxColHarga.EditValue * 110 /100;
        cxtbRetur.DataController.RefreshExternalData;
      end
      else begin
        cxColtotal.EditValue := cxColQty.EditValue * cxColHarga.EditValue;
        cxtbRetur.DataController.RefreshExternalData;
      end;
    finally
      cxtbRetur.EndUpdate;
    end;
  end;

end;

procedure TfrmInputBarangKeluar.FormCreate(Sender: TObject);
begin
  inherited;
  cxdTglDatang.Date := Aplikasi.Tanggal;
  zqrBarang.Open;
  zqrSupplier.Open;
  zqrGudang.Open;
  cxsrate.Text := '1';
end;

procedure TfrmInputBarangKeluar.FormShow(Sender: TObject);
  var
   q,z : TZQuery;
   i, nomer: integer;
   sNoTrs : string;
begin
  inherited;
  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('retur-pemb');
    cxtNoBukti.Text := sNoTrs;
    cxdTglDatang.Date := Aplikasi.Tanggal;

  end
  else if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_trsreturpemb_head WHERE id = %s',[Self.EditKey]);
    cxtNoBukti.Text := q.FieldByName('no_bukti').AsString;
    cxluSupplier.EditValue := q.FieldByName('id_supplier').AsInteger;
    cxtKeterangan.Text := q.FieldByName('keterangan').AsString;

    q.Close;
    z := OpenRS('SELECT a.*, b.deskripsi, c.satuan satuan2 FROM tbl_trsreturpemb_det a ' +
      'left join tbl_barang b on a.id_brg = b.id ' +
      'LEFT JOIN tbl_satuan c on c.id = a.id_satuan ' +
      'WHERE id_ref = %s',[Self.EditKey]);
    nomer := 1;

    cxtbRetur.DataController.OnRecordChanged := nil;
    while not z.Eof do begin
      with cxtbRetur.DataController do begin
        i := AppendRecord;
        Values[i, cxColNo.Index] := nomer;
        Values[i, cxColKodeBrg.Index] := z.FieldByName('kode_brg').AsString;
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
      end;
      z.Next;
    end;
    z.Close;
    cxtbRetur.DataController.OnRecordChanged := Self.cxtbReturDataControllerRecordChanged;

  end;
end;

end.
