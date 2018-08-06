unit unFrmInputSuratJalan;

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
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, Spin, cxButtonEdit;

type
  TfrmInputSuratJalan = class(TfrmTplInput)
    Label13: TLabel;
    cxlbl1: TcxLabel;
    cxlbl4: TcxLabel;
    cxdTglDatang: TcxDateEdit;
    cxtNoBukti: TcxTextEdit;
    cxlbl14: TcxLabel;
    cxtKeterangan: TcxTextEdit;
    cxgrdPP: TcxGrid;
    cxtbSJ: TcxGridTableView;
    cxColNo: TcxGridColumn;
    cxColKodeBrg: TcxGridColumn;
    cxColDeskripsi: TcxGridColumn;
    cxColQty: TcxGridColumn;
    cxColSatuan: TcxGridColumn;
    cxColKeterangan: TcxGridColumn;
    cxColIdSatuan: TcxGridColumn;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    cxColGudang: TcxGridColumn;
    zqrGudang: TZReadOnlyQuery;
    dsGudang: TDataSource;
    cxLabel1: TcxLabel;
    cxlCustomer: TcxLookupComboBox;
    zqrCust: TZReadOnlyQuery;
    dsCust: TDataSource;
    cxColNoSO: TcxGridColumn;
    cxLabel2: TcxLabel;
    cxtNopol: TcxTextEdit;
    cxtSopir: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxColQtySO: TcxGridColumn;
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
    cxColHarga: TcxGridColumn;
    cxColTotal: TcxGridColumn;
    cxLabel7: TcxLabel;
    cxtNoFaktur: TcxTextEdit;
    zqrSO: TZReadOnlyQuery;
    dsSO: TDataSource;
    cxColIdSO: TcxGridColumn;
    cxColQtyTerkirim: TcxGridColumn;
    cxColJmlIkatPerBal: TcxGridColumn;
    cxColHargaIkat: TcxGridColumn;
    cxLabel8: TcxLabel;
    cxdTglJthTempo: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxtbBarangMasukDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxtbBarangMasukDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxtbSJDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxtbSJDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxColNoSOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxsDiskonPropertiesChange(Sender: TObject);
  private
    procedure HitungTotal;
  public
    { Public declarations }
  end;

var
  frmInputSuratJalan: TfrmInputSuratJalan;

implementation

uses unDM, unTools, unFrmPilihSO, unFrmLstSuratJalan;

{$R *.dfm}

procedure TfrmInputSuratJalan.btnSimpanClick(Sender: TObject);
var
  q, qh, qd, qSatuan, qGdg : TZQuery;
  sNoBukti : string;
  i, id : integer;
  f0: Boolean;

begin
  inherited;

  if (cxtbSJ.DataController.EditState = [dceInsert, dceModified]) or
    (cxtbSJ.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.' + Chr(10) + Chr(13) +
      'Klik Klik tombol centang hijau.');
    Abort;
  end;

  with cxtbSJ.DataController do begin
    if RecordCount = 0 then begin
      MsgBox('Detail transaksi masih kosong.');
      Abort;
    end;

    if Self.Jenis = 'T' then begin
      sNoBukti := GetLastFak('sj');
      UpdateFaktur(Copy(sNoBukti,1,7));
    end
    else begin
      sNoBukti := cxtNoBukti.text;
    end;

    try
      dm.zConn.StartTransaction;

      qh := OpenRS('SELECT * FROM tbl_sj_head WHERE no_bukti = ''%s''',[sNoBukti]);
      if Self.Jenis = 'T' then begin
        qh.Insert;
      end
      else begin
        qh.Edit;
        ID := qh.FieldByName('id').AsInteger;
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_sj_det WHERE id_ref = %s',[Self.EditKey]));
      end;

      qh.FieldByName('no_bukti').AsString := sNoBukti;
      qh.FieldByName('tanggal').AsDateTime := Aplikasi.Tanggal;
      qh.FieldByName('user').AsString := Aplikasi.NamaUser;
      qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
      qh.FieldByName('tgl_input').AsDateTime := Aplikasi.Tanggal;
      qh.FIeldBYName('diskon').AsFloat := cxsDiskon.Value;
      if cxChkPPN.Checked then
        qh.FieldByName('f_ppn').AsInteger := 1;
      if Trim(cxdTglJthTempo.Text) <> '' then
        qh.FieldByName('jatuh_tempo').AsDateTime := cxdTglJthTempo.Date;
      if cxtNoFaktur.Text <> '' then
       qh.FieldByName('no_faktur').AsString := Trim(cxtNoFaktur.Text);
      qh.Post;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      qd := OpenRS('SELECT * FROM tbl_sj_det WHERE no_bukti = ''%s''',[sNoBukti]);

      with cxtbSJ.DataController do begin
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
          qd.FieldByName('id_gdg').AsString := Values[i, cxColGudang.Index];
          qd.FieldbyName('harga').AsFloat := Values[i, cxColHarga.Index];
          qd.FieldByName('hrgikat').AsFloat := Values[i, cxColHargaIkat.Index];
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
      MsgBox('Transaksi Surat Jalan barang sudah disimpan dengan No. Bukti : ' + sNoBukti);
      if Assigned(Self.FormInduk) then
        (Self.FormInduk as TfrmLstSuratJalan).btnRefreshClick(nil);
      btnBatalClick(nil);
    except
      on E: Exception do begin
        dm.zConn.Rollback;
        MsgBox('Error: ' + E.Message);
      end;
    end;
  end;

end;

procedure TfrmInputSuratJalan.cxColNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var
  row : Integer;
begin
  inherited;
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;


procedure TfrmInputSuratJalan.cxColNoSOPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  f: TfrmPilihSO;
  i: integer;
  q: TZQuery;
begin
  inherited;
  try
  i := cxtbSJ.DataController.GetFocusedRecordIndex;
  f := TfrmPilihSO.Create(Self);
  f.IdBrg := cxtbSJ.DataController.Values[i, cxColDeskripsi.Index];
  f.IdCust := cxlCustomer.EditValue;
  if f.ShowModal = mrOk then begin
    q := OpenRS('SELECT a.no_bukti, b.qty, b.harga FROM tbl_so_head a INNER JOIN tbl_so_det b ON a.id = b.id_ref WHERE a.id = %d', [f.IdSO]);
    cxtbSJ.DataController.Values[i, cxColNoSO.Index] := q.FieldByName('no_bukti').AsString;
    cxtbSJ.DataController.Values[i, cxColIdSO.Index] := f.idSO;
    cxtbSJ.DataController.Values[i, cxColQtySO.Index] := q.FieldByName('qty').AsFloat;
    cxtbSJ.DataController.Values[i, cxColHarga.Index] := q.FieldByName('harga').AsFloat;
    q.Close;
    q := OpenRS('SELECT SUM(qty) qty_kirim FROM tbl_sj_det WHERE id_so = %d AND id_brg = %s',
      [f.IdSO, cxtbSJ.DataController.Values[i, cxColDeskripsi.Index]]);
    cxtbSJ.DataController.Values[i, cxColQtyTerkirim.Index] := q.FieldByName('qty_kirim').AsFloat;
    q.Close;
  end;
  f.Free;
  finally
  end;
end;

procedure TfrmInputSuratJalan.cxsDiskonPropertiesChange(Sender: TObject);
begin
  inherited;
  HitungTotal;
end;

procedure TfrmInputSuratJalan.cxtbBarangMasukDataControllerBeforePost(
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

  {
  if ADataController.Values[i, cxColQty.Index] <= 0 then begin
    MsgBox('Qty tidak boleh minus');
    Abort;
  end;
  }
end;

procedure TfrmInputSuratJalan.cxtbBarangMasukDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
  t, t1, t2, t3 : Real;
  i: Integer ;
begin
  inherited;
  {
  if AItemIndex = cxColDeskripsi.Index then begin
    try
      cxtbSJ.BeginUpdate;
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
      [ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg.Index] :=  q.FieldByName('kode').AsString;
      ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      q.Close;
    finally
      cxtbSJ.EndUpdate
    end;
  end;

  if AItemIndex = cxColGudang.Index then begin
    try
      q := OpenRS('SELECT sf_getstok_per_gdg(%s,%s) as stok',
        [ADataController.Values[ARecordIndex, cxColDeskripsi.Index], ADataController.Values[ARecordIndex, cxColGudang.Index]]);
      ADataController.Values[ARecordIndex, cxColStokLama.Index] := q.FieldByName('stok').AsFloat;
      q.Close;
    finally

    end;
  end;
  }
end;

procedure TfrmInputSuratJalan.cxtbSJDataControllerBeforePost(
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

  if (VarIsNull(ADataController.Values[i, cxColGudang.Index])) or
      (Trim(ADataController.Values[i, cxColGudang.Index]) = '')  then begin
    MsgBox('Kode gudang harus diisi.');
    Abort;
  end;

  sa := GetStokAkhir(ADataController.Values[i, cxColDeskripsi.Index], ADataController.Values[i, cxColGudang.Index]);
  if sa < ADataController.Values[i, cxColQty.Index] then begin
    MsgBox('Stok barang tidak mencukupi. Stok : ' + FormatFloat('#,#0.00', sa));
    Abort;
  end;
  
end;

procedure TfrmInputSuratJalan.cxtbSJDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
  t, t1, t2, t3 : Real;
  i: Integer ;
begin
  inherited;

  if AItemIndex = cxColDeskripsi.Index then begin
    try
      cxtbSJ.BeginUpdate;
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
      [ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg.Index] :=  q.FieldByName('kode').AsString;
      ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      q.Close;

      q := OpenRS('SELECT * FROM tbl_barang_det_spek WHERE id_ref = %s',
        [ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
      ADataController.Values[ARecordIndex, cxColJmlIkatPerBal.Index] := q.FieldByName('jml_ikat_per_karung').AsFloat;
      q.Close;

    finally
      cxtbSJ.EndUpdate
    end;
  end;

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

  {
  if AItemIndex = cxColGudang.Index then begin
    if VarIsNull(ADataController.Values[ARecordIndex, cxColDeskripsi.Index]) then begin
      ADataController.Values[ARecordIndex, cxColGudang.Index] := '';
      Abort;
    end;
    try
      q := OpenRS('SELECT sf_getstok_per_gdg(%s,%s) as stok',
        [ADataController.Values[ARecordIndex, cxColDeskripsi.Index], ADataController.Values[ARecordIndex, cxColGudang.Index]]);
      ADataController.Values[ARecordIndex, cxColStokLama.Index] := q.FieldByName('stok').AsFloat;
      q.Close;
    finally

    end;
  end;
  }

end;

procedure TfrmInputSuratJalan.FormCreate(Sender: TObject);
begin
  inherited;
  cxdTglDatang.Date := Aplikasi.Tanggal;
  zqrBarang.Open;
  zqrGudang.Open;
  zqrCust.Open;
end;

procedure TfrmInputSuratJalan.FormShow(Sender: TObject);
  var
   q,z : TZQuery;
   i, nomer: integer;
   sNoTrs : string;
begin
  inherited;

  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('sj');
    cxtNoBukti.Text := sNoTrs;
  end
  else if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_sj_head WHERE id = %s',[Self.EditKey]);
    cxtNoBukti.Text := q.FieldByName('no_bukti').AsString;
    cxtKeterangan.Text := q.FieldByName('keterangan').AsString;
    cxlCustomer.EditValue := q.FieldByName('id_customer').AsInteger;
    cxdTglJthTempo.Date := q.FieldByname('jatuh_tempo').AsDateTime;
    if q.FieldByName('f_ppn').AsInteger = 1 then
      cxChkPPN.Checked := True;
    cxsDiskon.Value := q.FieldByname('diskon').AsFloat;
    cxtNoFaktur.Text := q.FieldByName('no_faktur').AsString;
    q.Close;

    z := OpenRS('SELECT a.*, b.deskripsi, c.satuan satuan2, d.jml_ikat_per_karung  FROM tbl_sj_det a ' +
      'left join tbl_barang b on a.id_brg = b.id ' +
      'LEFT JOIN tbl_satuan c on c.id = a.id_satuan ' +
      'LEFT JOIN tbl_barang_det_spek d on d.id_ref = a.id_brg ' +
      'WHERE a.id_ref = %s',[Self.EditKey]);
    nomer := 1;

    cxtbSJ.DataController.OnRecordChanged := nil;
    while not z.Eof do begin
      with cxtbSJ.DataController do begin
        i := AppendRecord;
        Values[i, cxColNo.Index] := nomer;
        Values[i, cxColKodeBrg.Index] := z.FieldByName('kode_brg').AsString;
        Values[i, cxColDeskripsi.Index] := z.FieldByName('id_brg').AsString;
        Values[i, cxColQty.Index] := z.FieldByName('qty').AsFloat;
        Values[i, cxColSatuan.Index] := z.FieldByName('satuan2').AsString;
        Values[i, cxColIdSatuan.Index] := z.FieldByname('id_satuan').AsInteger;
        Values[i, cxColKeterangan.Index] := z.FieldByName('keterangan').AsString;
        Values[i, cxColHargaIkat.Index] := z.FieldByName('hrgikat').AsFloat;
        Values[i, cxColHarga.Index] := z.FieldByname('hrgjual').AsFloat;
        Values[i, cxColTotal.Index] := z.FieldByname('hrgjual').AsFloat * z.FieldByname('qty').AsFloat;
        Values[i, cxColGudang.Index] := z.FieldByName('id_gdg').AsInteger;
        Values[i, cxColJmlIkatPerBal.Index] := z.FieldByName('jml_ikat_per_karung').AsFloat;
        nomer := nomer +1;
      end;
      z.Next;
    end;
    z.Close;
    cxtbSJ.DataController.OnRecordChanged := Self.cxtbSJDataControllerRecordChanged;

    HitungTotal;
  end;

end;

procedure TfrmInputSuratJalan.HitungTotal;
var
  i: integer;
  tot, diskon, ppn: real;
begin
  try

    tot := 0;
    for i := 0 to cxtbSJ.DataController.RecordCount - 1 do begin
      tot := tot + cxtbSJ.DataController.Values[i, cxColTotal.Index];
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
