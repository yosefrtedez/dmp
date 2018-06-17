unit unFrmInputPB;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxTextEdit,
  cxDBLookupComboBox, cxSpinEdit, cxDropDownEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  cxGroupBox, cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxLabel, ZDataset,
  DB, ZAbstractRODataset, cxCheckBox;

type
  TfrmInputPB = class(TfrmTplInput)
    Label1: TLabel;
    cxlbl1: TcxLabel;
    cxlbl2: TcxLabel;
    cxlbl3: TcxLabel;
    cxlbl4: TcxLabel;
    cxlbl5: TcxLabel;
    cxlbl6: TcxLabel;
    cxlbl7: TcxLabel;
    cxlbl8: TcxLabel;
    cxlNoPO: TcxLookupComboBox;
    cxdTglPO: TcxDateEdit;
    cxdTglDatang: TcxDateEdit;
    cxtAlamat: TcxTextEdit;
    cxtNoBukti: TcxTextEdit;
    cxtNopol: TcxTextEdit;
    cxtSopir: TcxTextEdit;
    cxgrpbx1: TcxGroupBox;
    cxlbl9: TcxLabel;
    cxlbl10: TcxLabel;
    cxtUser: TcxTextEdit;
    cxtDepartemen: TcxTextEdit;
    cxlbl11: TcxLabel;
    cxCboPembayaran: TcxComboBox;
    cxlbl12: TcxLabel;
    cxCboRate: TcxComboBox;
    cxlbl13: TcxLabel;
    cxlbl14: TcxLabel;
    cxtKeterangan: TcxTextEdit;
    cxtRate: TcxTextEdit;
    cxgrdPP: TcxGrid;
    cxtbPB: TcxGridTableView;
    cxColNo: TcxGridColumn;
    cxColKodeBrg: TcxGridColumn;
    cxColDeskripsi: TcxGridColumn;
    cxColQtyPO: TcxGridColumn;
    cxColSatuan: TcxGridColumn;
    cxColHarga: TcxGridColumn;
    cxColPPn: TcxGridColumn;
    cxColValuta: TcxGridColumn;
    cxColKeterangan: TcxGridColumn;
    cxColTotal: TcxGridColumn;
    cxColIdSatuan: TcxGridColumn;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    cxColQtyTerima: TcxGridColumn;
    zqrPO: TZReadOnlyQuery;
    dsPO: TDataSource;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    cxtNamaSupp: TcxTextEdit;
    cxColIdBrg: TcxGridColumn;
    cxColGdg: TcxGridColumn;
    zqrGdg: TZReadOnlyQuery;
    dsGdg: TDataSource;
    cxChkPosting: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cxlNoPPPropertiesChange(Sender: TObject);
    procedure cxtbPBDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxtbPBDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure FormShow(Sender: TObject);
  private
    id_supplier: integer;
    f_posted: Boolean;
  public
    { Public declarations }
  end;

var
  frmInputPB: TfrmInputPB;

implementation

uses unDM, unTools;

{$R *.dfm}

procedure TfrmInputPB.btnSimpanClick(Sender: TObject);
var
  sNoTrs: string;
  qh,qd, hst: TZQuery;
  i, ID: Integer;
  sAkhir, hppAkhir, hpp: real;
  f0: boolean;
begin
  inherited;

  if cxtbPB.DataController.RecordCount = 0 then begin
    MsgBox('Detail transaksi tidak boleh kosong.');
    Abort;
  end;

  if (cxtbPB.DataController.EditState = [dceEdit, dceModified]) or
    (cxtbPB.DataController.EditState = [dceInsert, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.');
    Abort;
  end;

  if cxlNoPO.Text = '' then begin
    MsgBox('Mohon pilih Nomor Purchase Order.');
    cxlNoPO.SetFocus;
    Abort;
  end;

  if Trim(cxdTglDatang.Text) = '' then begin
    MsgBox('Mohon masukkan tanggal kedatangan barang.');
    cxdTglDatang.SetFocus;
    Abort;
  end;

  if f_posted then begin
    MsgBox('Transaksi ini sudah di posting, tidak bisa di edit.');
    Abort;
  end;

  f0 := false;
  with cxtbPB.DataController do begin
    for i := 0 to RecordCount - 1 do begin
      if (VarIsNull(Values[i, cxColQtyTerima.Index])) or
        (Values[i, cxColQtyTerima.Index] = 0) then begin
        f0 := True;
        Break;
      end;
    end;
  end;
  if f0 then begin
    MsgBox('Qty. Penerimaan barang masih ada yang 0. Lakukan penghapusan jika barang belum diterima.');
    Abort;
  end;

  try
    dm.zConn.StartTransaction;

    if Self.Jenis = 'T' then begin
      sNoTrs := GetLastFak('penerimaan');
      UpdateFaktur(Copy(sNoTrs,1,7));
    end
    else begin

    end;

    qh := OpenRS('SELECT * FROM tbl_pb_head WHERE no_bukti = ''%s''',[sNoTrs]);
    if Self.Jenis = 'T' then
      qh.Insert
    else begin
      qh.Edit;
      ID := qh.FieldByName('id').AsInteger;
    end;

    qh.FieldByName('no_bukti').AsString := sNoTrs;
    qh.FieldByName('id_po').AsInteger := cxlNoPO.EditValue;
    qh.FieldByName('tanggal').AsDateTime := Aplikasi.TanggalServer;
    qh.FieldByName('user').AsString := Aplikasi.NamaUser;
    qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
    qh.FieldByName('id_supplier').AsInteger := id_supplier;
    qh.FieldByName('nopol').AsString := cxtNopol.text;
    qh.FieldByName('sopir').AsString := cxtSopir.text;
    qh.Post;

    if Self.Jenis = 'E' then begin
      dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_pb_det WHERE id_ref = %d',[ID]));
    end
    else begin
      ID := LastInsertID;
    end;

    qd := OpenRS('SELECT * FROM tbl_pb_det WHERE id_ref = %d',[ID]);
    with cxtbPB.DataController do begin
      for i := 0 to RecordCount - 1 do begin
        qd.Insert;
        qd.FieldByName('id_ref').AsInteger := ID;
        qd.FieldByName('no_bukti').AsString := sNoTrs;
        qd.FieldByName('id_brg').AsInteger := Values[i, cxColIdBrg.Index];
        qd.FieldByname('kode_brg').AsString := Values[i, cxColKodeBrg.Index];
        qd.FieldByname('qty').AsFloat := Values[i, cxColQtyTerima.Index];
        qd.FieldByName('id_satuan').AsInteger := Values[i, cxColIdSatuan.Index];
        qd.FieldByName('harga').AsFloat := Values[i, cxColHarga.Index];
        qd.Post;
      end;
    end;

    if cxChkPosting.Checked then begin
      hst := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''',[sNoTrs]);
      with cxtbPB.DataController do begin
        for i := 0 to RecordCount - 1 do begin
          hst.Insert;
          hst.FieldByName('no_bukti').AsString := sNoTrs;
          hst.FieldByname('tanggal').AsDateTime := cxdTglDatang.Date;
          hst.FieldByName('id_brg').AsInteger := Values[i, cxColIdBrg.Index];
          hst.FieldByName('id_gdg').AsInteger := Values[i, cxColGdg.Index];
          hst.FieldByname('kode_brg').AsString := Values[i, cxColKodeBrg.Index];
          hst.FieldByname('qty').AsFloat := Values[i, cxColQtyTerima.Index];
          hst.FieldByName('id_satuan').AsInteger := Values[i, cxColIdSatuan.Index];
          hst.FieldByName('id_po').AsInteger := cxlNoPO.EditValue;
          hst.FieldByName('id_pb').AsInteger := ID;
          hst.FieldByName('tipe').AsString := 'i';

          sAkhir := GetStokAkhir(Values[i, cxColIdBrg.Index], Values[i, cxColGdg.Index]);
          hppAkhir := GetHpp(Values[i, cxColIdBrg.Index], Values[i, cxColGdg.Index]);
          hpp := ((hppAkhir * sAkhir) + (Values[i, cxColQtyTerima.Index] * Values[i, cxColHarga.Index])) /
            (sAkhir + Values[i, cxColQtyTerima.Index]);
          hst.FieldByName('avgcost').AsFloat := hpp;

          hst.FieldByName('user').AsString := Aplikasi.NamaUser;
          hst.FieldByName('user_dept').AsString := Aplikasi.UserDept;
          hst.FieldByName('tgl_input').AsDateTime := Aplikasi.NowServer;

          hst.Post;
        end;
      end;
      dm.zConn.ExecuteDirect(Format('UPDATE tbl_pb_head SET f_posted = 1 WHERE id = %d',[ID]));
    end;

    dm.zConn.Commit;

    MsgBox('Penerimaan barang sudah disimpan dengan nomor: ' + sNoTrs);

    btnBatalClick(nil);
  except
    on E: Exception do begin
      dm.zConn.Rollback;
      MsgBox('Error: ' + E.Message);
    end;
  end;

end;

procedure TfrmInputPB.cxlNoPPPropertiesChange(Sender: TObject);
var
  q: TZQuery;
  i, id_ref: integer;
begin
  inherited;

  cxtbPB.DataController.OnRecordChanged := nil;

  q := OpenRS('SELECT a.*, b.nama nama_supplier, b.alamat FROM tbl_po_head a ' +
              'LEFT JOIN tbl_supplier b ON b.id = a.id_supplier ' +
              'WHERE a.id = %s',[cxlNoPO.EditValue]);
  cxdTglPO.Date := q.FieldByName('tanggal').AsDateTime;
  cxtNamaSupp.Text := q.FieldByName('nama_supplier').AsString;
  cxtAlamat.Text := q.FieldByName('alamat').AsString;
  id_ref := q.FieldByName('id').AsInteger;
  id_supplier := q.FieldByName('id_supplier').AsInteger;
  q.Close;

  q := OpenRS('SELECT a.*, b.deskripsi, c.satuan satuan2 FROM tbl_po_det a ' +
              'LEFT JOIN tbl_barang b ON a.id_brg = b.id ' +
              'LEFT JOIN tbl_satuan c ON a.id_satuan = c.id ' +
              'WHERE a.id_ref = %d',[id_ref]);

  cxtbPB.DataController.RecordCount := 0;
  while not q.Eof do begin
    with cxtbPB.DataController do begin
      i := AppendRecord;
      Values[i, cxColKodeBrg.Index] := q.FieldByName('kode_brg').AsString;
      Values[i, cxColDeskripsi.Index] := q.FieldByName('deskripsi').AsString;
      Values[i, cxColQtyPO.Index] := q.FieldByName('qty').AsFloat;
      Values[i, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
      Values[i, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      Values[i, cxColHarga.Index] := q.FieldByName('harga').AsFloat;
      Values[i, cxColIdBrg.Index] := q.FieldByName('id_brg').AsInteger;
      Values[i, cxColGdg.Index] := Aplikasi.GdgPB;
      Values[i, cxColPPn.Index] := q.FieldByName('ppn').AsString;
      Values[i, cxColKeterangan.Index] := q.FieldByName('keterangan').AsString;
    end;
    q.Next;
  end;
  q.Close;

  cxtbPB.DataController.OnRecordChanged := Self.cxtbPBDataControllerRecordChanged;

end;

procedure TfrmInputPB.cxtbPBDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i: integer;
begin
  inherited;

  i := cxtbPB.DataController.GetFocusedRecordIndex;

  if ADataController.Values[i, cxColQtyTerima.Index] <= 0 then begin
    MsgBox('Qty Terima tidak boleh minus');
    Abort;
  end;

  if (VarIsNull(ADataController.Values[i, cxColHarga.Index]))  then begin
    MsgBox('Harga barang harus di isi.');
    Abort;
  end;

  if ADataController.Values[i, cxColHarga.Index] <= 0 then begin
    MsgBox('Harga barang tidak boleh minus.');
    abort
  end;

end;

procedure TfrmInputPB.cxtbPBDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
begin
  inherited;
  if AItemIndex = cxColQtyTerima.Index then begin
    ADataController.Values[ARecordIndex, cxColTotal.Index] :=
      ADataController.Values[ARecordIndex, cxColQtyTerima.Index] * ADataController.Values[ARecordIndex, cxColHarga.Index];
  end;

  if AItemIndex = cxColQtyTerima.Index then begin
    if ADataController.Values[ARecordIndex, cxColQtyTerima.Index] > ADataController.Values[ARecordIndex, cxColQtyPO.Index] then begin
      MsgBox('Qty. Terima tidak boleh melebihi Qty. PO.');
      Abort;
    end;
  end;

  if AItemIndex = cxColHarga.Index then begin
    try
      if cxColPPn.EditValue = 'PPN' then begin
        cxColtotal.EditValue := cxColQtyTerima.EditValue *  cxColHarga.EditValue * 110 /100 ;
      end
      else begin
        cxColTotal.EditValue := cxColQtyTerima.EditValue * cxColHarga.EditValue;
      end;
    except
    end;
  end;


end;

procedure TfrmInputPB.FormCreate(Sender: TObject);
begin
  inherited;
  cxtNoBukti.Text := GetLastFak('penerimaan');
  zqrPO.Open;
  zqrBarang.Open;
  zqrGdg.Open;
end;

procedure TfrmInputPB.FormShow(Sender: TObject);
var
  q, po, pod: TZQuery;
  i, ID, id_po: integer;
begin
  inherited;

  if Self.Jenis = 'E' then begin
    cxlNoPO.Properties.OnChange := nil;

    q := OpenRS('SELECT a.* FROM tbl_pb_head a ' +
      'WHERE id = %s',[Self.EditKey]);
    cxtNoBukti.Text := q.FieldByName('no_bukti').AsString;
    cxlNoPO.EditValue := q.FieldByName('id_po').AsInteger;
    cxdTglDatang.Date := q.FieldByName('tanggal').AsDateTime;
    if q.FieldByName('f_posted').AsInteger = 1 then begin
      cxChkPosting.Checked := True;
      cxChkPosting.Properties.ReadOnly := True;
      f_posted := true;
    end;
    ID := q.FieldByname('id').AsInteger;
    id_po := q.FieldByName('id_po').AsInteger;
    q.Close;

    q := OpenRS('SELECT a.*, b.nama nama_supplier, b.alamat FROM tbl_po_head a ' +
      'LEFT JOIN tbl_supplier b ON b.id = a.id_supplier ' +
      'WHERE a.id = %d',[id_po]);
    id_supplier := q.FieldByname('id_supplier').AsInteger;
    cxtNamaSupp.Text := q.FieldByname('nama_supplier').AsString;
    cxtAlamat.Text := q.FieldByName('alamat').AsString;
    q.Close;

    q := OpenRS('SELECT a.*, b.deskripsi, c.satuan satuan2 FROM tbl_pb_det a ' +
      'LEFT JOIN tbl_barang b ON b.id = a.id_brg ' +
      'LEFT JOIN tbl_satuan c ON c.id = a.id_satuan ' +
      'LEFT JOIN tbl_pb_head d ON d.id = a.id_ref ' +
      'WHERE a.id_ref = %d',[ID]);

    while not q.Eof do begin
      with cxtbPB.DataController do begin
        i := AppendRecord;
        Values[i, cxColKodeBrg.Index] := q.FieldByName('kode_brg').AsString;
        Values[i, cxColDeskripsi.Index] := q.FieldByName('deskripsi').AsString;
        Values[i, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
        Values[i, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
        Values[i, cxColHarga.Index] := q.FieldByName('harga').AsFloat;
        Values[i, cxColIdBrg.Index] := q.FieldByName('id_brg').AsInteger;
        Values[i, cxColQtyTerima.Index] := q.FieldByName('qty').AsFloat;
        Values[i, cxColGdg.Index] := Aplikasi.GdgPB;

        pod := OpenRS('SELECT qty FROM tbl_po_det WHERE id_ref = %d AND id_brg = %d',[id_po, q.FieldByName('id_brg').AsInteger]);
        Values[i, cxColQtyPO.Index] := pod.FieldByName('qty').AsFloat;
        pod.Close;
      end;
      q.Next;
    end;

    q.Close;
    cxlNoPO.Properties.OnChange := Self.cxlNoPPPropertiesChange;

  end;

end;

end.
