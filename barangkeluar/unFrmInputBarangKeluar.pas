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
    cxtbBrgKeluar: TcxGridTableView;
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
    cxColHarga: TcxGridColumn;
    cxlCustomer: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    zqrCust: TZReadOnlyQuery;
    dsCust: TDataSource;
    cxLabel2: TcxLabel;
    cxsDiskon: TcxSpinEdit;
    DPP: TcxLabel;
    cxsStlhDiskon: TcxSpinEdit;
    cxsPPN: TcxSpinEdit;
    cxChkPPN: TcxCheckBox;
    cxLabel3: TcxLabel;
    cxsDPP: TcxSpinEdit;
    cxLabel4: TcxLabel;
    cxsHargaTotal: TcxSpinEdit;
    cxLabel5: TcxLabel;
    cxdTglJthTempo: TcxDateEdit;
    cxColJmlIkatPerBal: TcxGridColumn;
    cxLabel6: TcxLabel;
    cxCmbJenisTrs: TcxComboBox;
    cxLabel7: TcxLabel;
    cxtNoSJ: TcxTextEdit;
    btnPilihHarga: TButton;
    cxLabel8: TcxLabel;
    cxtNoFaktur: TcxTextEdit;
    cxColQtyKG: TcxGridColumn;
    cxColHargaIkat: TcxGridColumn;
    cxColIdBrg: TcxGridColumn;
    cxColKodeBrg2: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxtbReturDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxtbReturDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxChkPPNClick(Sender: TObject);
    procedure cxsDiskonPropertiesChange(Sender: TObject);
    procedure cxCmbJenisTrsPropertiesChange(Sender: TObject);
    procedure btnPilihHargaClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure HitungTotal;
  public
    { Public declarations }
  end;

var
  frmInputBarangKeluar: TfrmInputBarangKeluar;

implementation

uses unDM, unTools, unFrmPilihHarga, unFrmLstBarangKeluar, unFrmUtama;

{$R *.dfm}

procedure TfrmInputBarangKeluar.btnBatalClick(Sender: TObject);
begin
  inherited;
  frmUtama.pgMain.ActivePage := Self.TabSheet;
end;

procedure TfrmInputBarangKeluar.btnPilihHargaClick(Sender: TObject);
var
  f: TfrmPilihHarga;
  i: integer;
begin
  inherited;

  if cxtbBrgKeluar.DataController.RecordCount = 0 then Abort;

  i := cxtbBrgKeluar.DataController.GetFocusedRecordIndex;
  f := TfrmPilihHarga.Create(Self);
  f.ID := cxtbBrgKeluar.DataController.Values[i, cxColDeskripsi.Index];
  if f.ShowModal = mrOk then begin
    cxtbBrgKeluar.DataController.Values[i, cxColHarga.Index] := f.Harga;
  end;
  f.Free;
end;

procedure TfrmInputBarangKeluar.btnSimpanClick(Sender: TObject);
var
  q, qh, qd, qhst, qbrg : TZQuery;
  sNoBukti : string;
  i, id : integer;
  f0: Boolean;

begin
  inherited;

  if (cxtbBrgKeluar.DataController.EditState = [dceInsert, dceModified]) or (cxtbBrgKeluar.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan. ' + Chr(10) + Chr(13) +
      'Klik tombol centang hijau.');
    Abort;
  end;

  if cxCmbJenisTrs.Text = '' then begin
    MsgBox('Jenis transaksi harus di isi.');
    cxCmbJenisTrs.SetFocus;
    Abort;
  end;

  with cxtbBrgKeluar.DataController do begin
    if RecordCount = 0 then begin
      MsgBox('Detail transaksi masih kosong.');
      Abort;
    end;

    if Self.Jenis = 'T' then begin
      sNoBukti := GetLastFak('brg-keluar');
      UpdateFaktur(Copy(sNoBukti,1,7));
    end
    else begin
      sNoBukti := cxtNoBukti.text;
    end;

    try
      dm.zConn.StartTransaction;

      qh := OpenRS('SELECT * FROM tbl_trskeluar_head WHERE no_bukti = ''%s''',[sNoBukti]);
      if Self.Jenis = 'T' then begin
        qh.Insert;
      end
      else begin
        qh.Edit;
        ID := qh.FieldByName('id').AsInteger;
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_trskeluar_det WHERE id_ref = %s',[Self.EditKey]));
      end;

      qh.FieldByName('no_bukti').AsString := sNoBukti;
      qh.FieldByName('keterangan').AsString := cxtKeterangan.Text;
      qh.FieldByName('tanggal').AsDateTime := Aplikasi.Tanggal;
      qh.FieldByName('user').AsString := Aplikasi.NamaUser;
      qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
      qh.FieldByName('tgl_input').AsDateTime := Aplikasi.Tanggal;
      if cxlCustomer.Text <> '' then
        qh.FieldByName('id_customer').AsInteger := cxlCustomer.EditValue;
      qh.FieldByName('diskon').AsFloat := cxsDiskon.Value;
      if cxChkPPN.Checked = true then
        qh.FieldByName('f_ppn').AsInteger := 1;
      if Trim(cxdTglJthTempo.Text) <> '' then
        qh.FieldByName('jatuh_tempo').AsDateTime := cxdTglJthTempo.Date;
      qh.FieldByname('jenistrs').AsString := cxCmbJenisTrs.Text;
      qh.FieldByName('no_faktur').AsString := Trim(cxtNoFaktur.Text);
      qh.FieldByName('no_sj').AsString := cxtNoSJ.Text;
      qh.FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
      qh.Post;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      qd := OpenRS('SELECT * FROM tbl_trskeluar_det WHERE no_bukti = ''%s''',[sNoBukti]);
      qhst := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''',[sNoBukti]);

      with cxtbBrgKeluar.DataController do begin
        for i := 0 to RecordCount - 1 do begin
          qd.Insert;
          if Self.Jenis = 'T' then begin
            qd.FieldByName('id_ref').AsInteger := ID;
          end else begin
            qd.FieldByName('id_ref').AsString := qh.FieldByName('id').AsString;
          end;
          qd.FieldByName('no_bukti').AsString := sNoBukti;
          qd.FieldByName('kode_brg').AsString := Values[i, cxColKodeBrg2.Index];
          qd.FieldByName('id_brg').AsInteger := Values[i, cxColDeskripsi.Index];
          qd.FieldByName('qty').AsFloat := Values[i, cxColQty.Index];
          qd.FieldByName('id_satuan').AsString := Values[i, cxColIdSatuan.Index];
          qd.FieldByName('id_gdg').AsString := Values[i, cxColGudang.Index];
          if VarIsNull(Values[i, cxColKeterangan.index]) = True then begin
            qd.FieldByName('keterangan').AsString := '';
          end else begin
            qd.FieldByName('keterangan').AsString := Values[i, cxColKeterangan.Index];
          end;
          if not VarIsNull(Values[i, cxColHarga.Index]) then
            qd.FieldByName('hrgjual').AsFloat := Values[i, cxColHarga.Index];
          if not VarIsNull(Values[i, cxColQtyKG.Index]) then
            qd.FieldByName('qty_kg').AsFloat := Values[i,cxColQtyKG.Index];
          if cxCmbJenisTrs.Text = 'PENJUALAN' then begin
            qd.FieldByName('hrgikat').AsFloat := Values[i, cxColHargaIkat.Index];
          end;
          qd.Post;

          { 01/08/2018
          with qhst do begin
            Insert;
            FieldByName('no_bukti').AsString := sNoBukti;
            FieldByName('tanggal').AsDateTime := Aplikasi.TanggalServer;
            FieldByName('kode_brg').AsString := Values[i, cxColKodeBrg.Index];
            FieldByName('id_brg').AsInteger := Values[i, cxColDeskripsi.Index];
            FieldByName('qty').AsFloat := Values[i, cxColQty.Index];
            FieldByName('tipe').AsString := 'o';
            FieldByName('id_satuan').AsInteger := Values[i, cxColIdSatuan.Index];
            FieldByname('id_gdg').AsInteger := Values[i, cxColGudang.Index];
            if not VarIsNull(Values[i, cxColKeterangan.Index]) then
              FieldByName('keterangan').AsString := Values[i, cxColKeterangan.Index];
            FieldByName('tgl_input').AsDateTime := Aplikasi.NowServer;
            Post;
          end;

          qbrg := OpenRS('SELECT * FROM tbl_barang WHERE id = %s',[Values[i, cxColDeskripsi.Index]]);
          qbrg.Edit;
          qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat - Values[i, cxColQty.Index];
          qbrg.Post;
          qbrg.Close;

          qbrg := OpenRS('SELECT * FROM tbl_barang_det WHERE id_brg = %s AND id_gdg = %s',
            [Values[i, cxColDeskripsi.Index], Values[i, cxColGudang.Index]]);
          if qbrg.IsEmpty then begin
            qbrg.Insert;
            qbrg.FieldByName('id_brg').AsInteger := Values[i, cxColDeskripsi.Index];
            qbrg.FieldByName('kode_brg').AsString := Values[i, cxColKodeBrg.Index];
            qbrg.FieldByName('id_gdg').AsInteger := Values[i, cxColGudang.Index];
          end
          else
            qbrg.Edit;
          qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat - Values[i, cxColQty.Index];
          qbrg.Post;
          qbrg.Close;
          }

        end;
      end;
      dm.zConn.Commit;
      qh.Close;
      qd.Close;
      Self.Jenis := '';
      MsgBox('Transaksi barang keluar sudah disimpan dengan No. Bukti : ' + sNoBukti);
      if Assigned(Self.FormInduk) then
        (Self.FormInduk as TFrmLstBarangKeluar).btnRefreshClick(nil);

      btnBatalClick(nil);
    except
      on E: Exception do begin
        dm.zConn.Rollback;
        MsgBox('Error: ' + E.Message);
      end;
    end;
  end;

end;

procedure TfrmInputBarangKeluar.Button1Click(Sender: TObject);
begin
  inherited;
  MsgBOx(Self.TabSheet.Caption);
end;

procedure TfrmInputBarangKeluar.cxChkPPNClick(Sender: TObject);
begin
  inherited;
  if cxChkPPN.Checked then
    cxsPPN.Value := 10
  else
    cxsPPN.Value := 0;

  HitungTotal;
end;

procedure TfrmInputBarangKeluar.cxCmbJenisTrsPropertiesChange(Sender: TObject);
begin
  inherited;
  if cxCmbJenisTrs.Text = 'PENJUALAN' then begin
    zqrBarang.Close;
    zqrBarang.SQL.Strings[2] := 'WHERE f_dijual = 1';
    zqrBarang.Open;
    cxColJmlIkatPerBal.Visible := True;
    cxColHargaIkat.Visible := True;
    cxColHarga.Visible := True;
    cxColQtyKG.Visible := True;
  end
  else if (cxCmbJenisTrs.Text = 'MUTASI') or (cxCmbJenisTrs.Text = 'RETUR PENJUALAN') then begin
    cxColJmlIkatPerBal.Visible := False;
    cxColHargaIkat.Visible := False;
    cxColHarga.Visible := False;
    cxColQtyKG.Visible := False;
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

procedure TfrmInputBarangKeluar.cxsDiskonPropertiesChange(Sender: TObject);
begin
  inherited;
  HitungTotal;
end;

procedure TfrmInputBarangKeluar.cxtbReturDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
  sa: real;
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

  if cxCmbJenisTrs.Text = 'PENJUALAN' then begin
    if (VarIsNull(ADataController.Values[i, cxColHargaIkat.Index])) or
        (Trim(ADataController.Values[i, cxColHargaIkat.Index]) = '')  then begin
        MsgBox('Harga per ikat harus di isi.');
        Abort;
    end;
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

  sa := GetStokAkhir(ADataController.Values[i, cxColDeskripsi.Index], ADataController.Values[i, cxColGudang.Index]);
  if sa < ADataController.Values[i, cxColQty.Index] then begin
    MsgBox('Stok barang tidak mencukupi. Stok : ' + FormatFloat('#,#0.00', sa));
    Abort;
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

  if AItemIndex = cxColKodeBrg.Index then begin
    try
      cxtbBrgKeluar.BeginUpdate;
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
        [ADataController.Values[ARecordIndex, AItemIndex]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg2.Index] := q.FieldByName('kode').AsString;
      ADataController.Values[ARecordIndex, cxColDeskripsi.Index] :=  ADataController.Values[ARecordIndex, AItemIndex];
      ADataController.Values[ARecordIndex, cxColIdBrg.Index] := ADataController.Values[ARecordIndex, AItemIndex];
      ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      ADataController.Values[ARecordIndex, cxColqty.Index] := '1';
      q.Close;

      q := OpenRS('SELECT * FROM tbl_barang_det_spek WHERE id_ref = %s',
        [ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
      ADataController.Values[ARecordIndex, cxColJmlIkatPerBal.Index] := q.FieldByName('jml_ikat_per_karung').AsFloat;
      q.Close;
    finally
      cxtbBrgKeluar.EndUpdate
    end;
  end;

  if AItemIndex = cxColDeskripsi.Index then begin
    try
      cxtbBrgKeluar.BeginUpdate;
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
        [ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg2.Index] := q.FieldByName('kode').AsString;
      ADataController.Values[ARecordIndex, cxColKodeBrg.Index] :=  ADataController.Values[ARecordIndex, AItemIndex];
      ADataController.Values[ARecordIndex, cxColIdBrg.Index] := ADatacontroller.Values[ARecordIndex, AItemIndex];
      ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      ADataController.Values[ARecordIndex, cxColqty.Index] := '1';
      q.Close;

      q := OpenRS('SELECT * FROM tbl_barang_det_spek WHERE id_ref = %s',
        [ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
      ADataController.Values[ARecordIndex, cxColJmlIkatPerBal.Index] := q.FieldByName('jml_ikat_per_karung').AsFloat;
      q.Close;
    finally
      cxtbBrgKeluar.EndUpdate
    end;
  end;

  if cxCmbJenisTrs.Text = 'PENJUALAN' then begin
    if (AItemIndex = cxColHargaIkat.Index) or (AItemIndex = cxColQty.Index) then begin
      try
        ADataController.Values[ARecordIndex, cxColHarga.Index] :=
          ADataController.Values[ARecordIndex, cxColHargaIkat.Index] *
          ADataController.Values[ARecordIndex, cxColJmlIkatPerBal.Index];
        ADataController.Values[ARecordIndex, cxColTotal.Index] :=
          ADataController.Values[ARecordIndex, cxColQty.Index] * ADataController.Values[ARecordIndex, cxColHarga.Index];
      finally
      end;
      HitungTotal;
    end;
  end;

  {
  if (AItemIndex = cxColHarga.Index) or (AItemIndex = cxColQty.Index) then begin
    try
      ADataController.Values[ARecordIndex, cxColTotal.Index] :=
        ADataController.Values[ARecordIndex, cxColQty.Index] * ADataController.Values[ARecordIndex, cxColHarga.Index];
    finally
    end;
    HitungTotal;
  end;
  }
end;

procedure TfrmInputBarangKeluar.FormCreate(Sender: TObject);
begin
  inherited;
  cxdTglDatang.Date := Aplikasi.Tanggal;
  zqrBarang.Open;
  zqrSupplier.Open;
  zqrGudang.Open;
  zqrCust.Open;

  cxCmbJenisTrs.Properties.Items.CommaText := ',PENJUALAN,"RETUR PENJUALAN",MUTASI';
  cxCmbJenisTrs.ItemIndex := 0;

end;

procedure TfrmInputBarangKeluar.FormShow(Sender: TObject);
  var
   q,z : TZQuery;
   i, nomer: integer;
   sNoTrs : string;
begin
  inherited;
  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('brg-keluar');
    cxtNoBukti.Text := sNoTrs;
    cxdTglDatang.Date := Aplikasi.Tanggal;

  end
  else if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_trskeluar_head WHERE id = %s',[Self.EditKey]);
    cxtNoBukti.Text := q.FieldByName('no_bukti').AsString;
    cxtKeterangan.Text := q.FieldByName('keterangan').AsString;
    cxlCustomer.EditValue := q.FieldByName('id_customer').AsInteger;
    cxdTglJthTempo.Date := q.FieldByname('jatuh_tempo').AsDateTime;
    if q.FieldByName('f_ppn').AsInteger = 1 then
      cxChkPPN.Checked := True;
    cxsDiskon.Value := q.FieldByname('diskon').AsFloat;
    cxCmbJenisTrs.Text := q.FieldByName('jenistrs').AsString;
    cxtNoSJ.Text := q.FieldByName('no_sj').AsString;
    cxtNoFaktur.Text := q.FieldByName('no_faktur').AsString;
    q.Close;

    z := OpenRS('SELECT a.*, b.deskripsi, c.satuan satuan2, d.jml_ikat_per_karung  FROM tbl_trskeluar_det a ' +
      'left join tbl_barang b on a.id_brg = b.id ' +
      'LEFT JOIN tbl_satuan c on c.id = a.id_satuan ' +
      'LEFT JOIN tbl_barang_det_spek d on d.id_ref = a.id_brg ' +
      'WHERE a.id_ref = %s',[Self.EditKey]);
    nomer := 1;

    cxtbBrgKeluar.DataController.OnRecordChanged := nil;
    while not z.Eof do begin
      with cxtbBrgKeluar.DataController do begin
        i := AppendRecord;
        Values[i, cxColNo.Index] := nomer;
        Values[i, cxColKodeBrg.Index] := z.FieldByName('id_brg').AsString;
        Values[i, cxColKodeBrg2.Index] := z.FieldByName('kode_brg').AsString;
        Values[i, cxColIdBrg.Index] := z.FieldByname('id_brg').AsInteger;
        Values[i, cxColDeskripsi.Index] := z.FieldByName('id_brg').AsString;
        Values[i, cxColQty.Index] := z.FieldByName('qty').AsFloat;
        Values[i, cxColSatuan.Index] := z.FieldByName('satuan2').AsString;
        Values[i, cxColIdSatuan.Index] := z.FieldByname('id_satuan').AsInteger;
        Values[i, cxColKeterangan.Index] := z.FieldByName('keterangan').AsString;
        Values[i, cxColHargaIkat.Index] := z.FieldByName('hrgikat').AsFloat;
        Values[i, cxColHarga.Index] := z.FieldByname('hrgjual').AsFloat;
        Values[i, cxColTotal.Index] := z.FieldByname('hrgjual').AsFloat * z.FieldByname('qty').AsFloat;
        Values[i, cxColGudang.Index] := z.FieldByName('id_gdg').AsInteger;
        Values[i, cxColQtyKG.Index] := z.FieldByName('qty_kg').AsFloat;
        Values[i, cxColJmlIkatPerBal.Index] := z.FieldByName('jml_ikat_per_karung').AsFloat;
        nomer := nomer +1;
      end;
      z.Next;
    end;
    z.Close;
    cxtbBrgKeluar.DataController.OnRecordChanged := Self.cxtbReturDataControllerRecordChanged;

    HitungTotal;
  end;
end;

procedure TfrmInputBarangKeluar.HitungTotal;
var
  i: integer;
  tot, diskon, ppn: real;
begin
  try

    tot := 0;
    for i := 0 to cxtbBrgKeluar.DataController.RecordCount - 1 do begin
      tot := tot + cxtbBrgKeluar.DataController.Values[i, cxColTotal.Index];
    end;

    diskon := 0;
    if cxsDiskon.Value > 0 then
      diskon := (cxsDiskon.Value /100) * tot;

    cxsStlhDiskon.Value := tot - diskon;

    cxsDPP.Value := cxsStlhDiskon.Value / 1.1;

    ppn := 0;
    if cxChkPPN.Checked then
      ppn := (10 / 100) * cxsDPP.Value;

    cxsHargaTotal.Value := cxsDPP.Value + ppn;
  except
  end;
end;

end.
