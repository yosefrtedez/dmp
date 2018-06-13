unit unFrmInputPO;

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
  TfrmInputPO = class(TfrmTplInput)
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
    cxlbl2: TcxLabel;
    cxlbl3: TcxLabel;
    cxlbl4: TcxLabel;
    cxlbl5: TcxLabel;
    cxlbl6: TcxLabel;
    cxlbl7: TcxLabel;
    cxlbl8: TcxLabel;
    cxLuNoPP: TcxLookupComboBox;
    cxdTgl: TcxDateEdit;
    cxdTglDatang: TcxDateEdit;
    cxLuSupplier: TcxLookupComboBox;
    cxtAlamat: TcxTextEdit;
    cxtNoBukti: TcxTextEdit;
    cxtNopol: TcxTextEdit;
    cxtSopir: TcxTextEdit;
    cxchk1: TcxCheckBox;
    cxgrpbx1: TcxGroupBox;
    cxlbl9: TcxLabel;
    cxlbl10: TcxLabel;
    cxtUser: TcxTextEdit;
    cxtDepartemen: TcxTextEdit;
    cxlbl11: TcxLabel;
    cxCboPembayaran: TcxComboBox;
    zqrPPHead: TZReadOnlyQuery;
    dsPPHead: TDataSource;
    zqrSupplier: TZReadOnlyQuery;
    dsSupplier: TDataSource;
    cxColPPn: TcxGridColumn;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    cxlbl12: TcxLabel;
    cxCboRate: TcxComboBox;
    cxlbl13: TcxLabel;
    cxlbl14: TcxLabel;
    cxtKeterangan: TcxTextEdit;
    cxtRate: TcxTextEdit;
    cxlbltemp: TcxLabel;
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
  private
    { Private declarations }
    mStatus: string;
  public
    { Public declarations }
  end;

var
  frmInputPO: TfrmInputPO;

implementation

uses
  unFrmUtama, unDM, unAplikasi, unTools;

{$R *.dfm}

procedure TfrmInputPO.btnSimpanClick(Sender: TObject);
var
  qh, qd, rs_fobj: TZQuery;
  sNoBukti : string;
  i, id : integer;
  f0: Boolean;

begin
  inherited;
  if cxtNoBukti.Text = '' then begin
    MsgBox('Maaf noner bukti tidak boleh kosong');
    cxtNoBukti.SetFocus;
    Abort;
  end;

  if cxCboPembayaran.Text = '' then begin
    MsgBox('Mode pembayaran masih kosong');
    cxCboPembayaran.SetFocus;
    Abort;
  end;

  if (cxtbTblPO.DataController.EditState = [dceInsert, dceModified]) or (cxtbTblPO.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Pengeditan detail masih belum selesai');
    Abort;
  end;
  if cxLuSupplier.Text = '' then begin
    MsgBox('Nama supllier masih kosong');
    Abort;
  end;

  with cxtbTblPO.DataController do begin
    if RecordCount = 0 then begin
      MsgBox('Detail masih kosong');
      Abort;
    end;

    if Self.Jenis = 'T' then begin
      sNoBukti := GetLastFak('po');
      UpdateFaktur(Copy(sNoBukti,1,7));
    end
    else begin
      sNoBukti := cxtNoBukti.text;
    end;

    try
      dm.zConn.StartTransaction;
      qh := OpenRS('SELECT * FROM tbl_po_head WHERE no_bukti = ''%s''',[sNoBukti]);
      if Self.Jenis = 'T' then begin
        qh.Insert;
      end
      else begin
        qh.Edit;
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_po_det WHERE no_bukti = ''%s''',[sNoBukti]));
      end;

      rs_fobj := OpenRS('select * from tbl_pp_head where no_bukti = ''' + cxLuNoPP.Text + '''');
      if not rs_fobj.Eof then begin
        rs_fobj.Edit;
        rs_fobj.FieldByName('f_po').AsString := '1';
        rs_fobj.Post;
      end;
      rs_fobj.Close;

      qh.FieldByName('no_bukti').AsString := sNoBukti;
      qh.FieldByName('no_fobj').AsString := cxLuNoPP.Text;
      qh.FieldByName('tanggal').AsDateTime := cxdTgl.Date;
      qh.FieldByName('jam').AsDateTime := Aplikasi.ServerTime;
      qh.FieldByName('tgl_required').AsDateTime := cxdTglDatang.Date;
      qh.FieldByName('kode_supp').AsString := cxLuSupplier.EditValue;
      qh.FieldByName('f_revisi').AsString := '0';
      qh.FieldByName('user').AsString := Aplikasi.NamaUser;
      qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
      qh.FieldByName('tgl_input').AsDateTime := Aplikasi.Tanggal;
      qh.FieldByName('jenis_po').AsString := 'st';
      qh.FieldByName('keterangan').AsString := cxtKeterangan.Text;
      qh.FieldByName('pembayaran').AsString := cxCboPembayaran.Text;
      qh.FieldByName('jam').AsDateTime := Aplikasi.ServerTime;
      qh.FieldByName('driver').AsString := cxtSopir.Text;
      qh.FieldByName('nopol').AsString := cxtNopol.Text;
      if cxCboRate.Text = 'IDR' then begin
        qh.FieldByName('currency').AsString := '1';
      end else begin
        qh.FieldByName('currency').AsString := cxtRate.Text;
      end;
      if self.Jenis = 'E' then
        qh.FieldByName('f_revisi').AsInteger := 1
      else
        qh.FieldByName('f_revisi').AsInteger := 0;
      if Self.Jenis = 'edit' then begin
        qh.FieldByName('user_edit').AsString := aplikasi.NamaUser;
        qh.FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
        qh.FieldByName('host').AsString := GetHostName2;
      end;
      qh.Post;

      if Self.Jenis = 'T' then  ID := LastInsertID;
      qd := OpenRS('SELECT * FROM tbl_po_det WHERE no_bukti = ''%s''',[sNoBukti]);
      for i := 0 to cxtbTblPO.DataController.RecordCount - 1 do begin
        qd.Insert;
        if Self.Jenis = 'T' then begin
          qd.FieldByName('id_ref').AsInteger := ID;
        end else begin
          qd.FieldByName('id_ref').AsString := qh.FieldByName('id').AsString;
        end;
        qd.FieldByName('no_bukti').AsString := sNoBukti;
        qd.FieldByName('kode_brg').AsString := cxtbTblPO.DataController.Values[i, cxColKodeBrg.Index];
        qd.FieldByName('qty').AsFloat := cxtbTblPO.DataController.Values[i, cxColQty.Index];
        qd.FieldByName('satuan').AsString := cxtbTblPO.DataController.Values[i, cxColSatuan.Index];
        qd.FieldByName('harga').AsFloat := cxtbTblPO.DataController.Values[i, cxColHarga.Index];
        if cxtbTblPO.DataController.Values[i, cxColValuta.Index] = 'IDR' then begin
          qd.FieldByName('mata_uang').AsString := 'IDR';
          qd.FieldByName('nilai_tukar').AsString := '1';
        end else begin
          qd.FieldByName('mata_uang').AsString := cxtbTblPO.DataController.Values[i, cxColValuta.Index];
          qd.FieldByName('nilai_tukar').AsString := cxtRate.Text;
        end;
        if VarIsNull(cxtbTblPO.DataController.Values[i, cxColPPn.index]) = True then begin
          qd.FieldByName('ppn').AsString := '';
        end else begin
          qd.FieldByName('ppn').AsString := cxtbTblPO.DataController.Values[i, cxColPPn.index];
        end;
        qd.Post;
      end;
      dm.zConn.Commit;
      qh.Close;
      qd.Close;
      Self.Jenis := '';
      MsgBox('Transaksi permintaan pembelian sudah disimpan dengan No. Bukti : ' + sNoBukti);
      with cxtbTblPO.DataController do begin
        BeginUpdate;
        try
          while RecordCount > 0 do
            DeleteRecord(0);
        finally
            EndUpdate
        end
      end;
      btnBatalClick(nil);
    except
      on E: Exception do begin
        dm.zConn.Rollback;
        MsgBox('Error: ' + E.Message);
      end;
    end;
  end;
end;

procedure TfrmInputPO.cxCbo2PropertiesChange(Sender: TObject);
begin
  inherited;
  if cxCboRate.Text = 'USD' then begin
    cxlbl13.Visible := True;
    cxtRate.Visible := True;
  end else begin
    cxlbl13.Visible := False;
    cxtRate.Visible := False;
  end;
end;

procedure TfrmInputPO.cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
 var
  row : Integer;
begin
  inherited;
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;

procedure TfrmInputPO.cxLuNoPPPropertiesChange(Sender: TObject);
var
  q, z : TZQuery;
  t, i : Integer;

begin
  inherited;
  q := OpenRS('select diajukan_oleh, diajukan_dept from tbl_pp_head where no_bukti = ''' + cxLuNoPP.EditValue + '''');
  if not q.Eof then begin
    cxtUser.Text := q.FieldByName('diajukan_oleh').AsString;
    cxtDepartemen.Text := q.FieldByName('diajukan_dept').AsString;
  end;
  q.Close;
  z := OpenRS('SELECT a.*, b.deskripsi, b.satuan FROM tbl_pp_det a LEFT JOIN tbl_barang b ON a.kode_brg = b.kode WHERE no_bukti = ''%s''',[cxlunopp.Text]);
  if not z.IsEmpty then begin
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
    t := 1;

    cxtbTblPO.DataController.OnRecordChanged := nil;
    while not z.Eof do begin
      cxgrdPP.BeginUpdate;
      with cxtbTblPO.DataController do begin
        i := AppendRecord;
        Values[i, cxColNo.Index] := t;
        Values[i, cxColKodeBrg.Index] := z.FieldByName('kode_brg').AsString;
        Values[i, cxColDeskripsi.Index] := z.FieldByName('kode_brg').AsString;
        Values[i, cxColQty.Index] := z.FieldByName('qty').AsFloat;
        Values[i, cxColSatuan.Index] := z.FieldByName('satuan').AsString;
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
end;

procedure TfrmInputPO.cxLuNoPPPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if cxLuNoPP.Text <> '' then begin
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
end;

procedure TfrmInputPO.cxLuSupplierPropertiesChange(Sender: TObject);
var
  q : TZQuery;
begin
  inherited;
  q := OpenRS('select * from tbl_supplier where kode = ''' + cxLuSupplier.EditValue + '''');
  if not q.Eof  then begin
    cxtAlamat.Text := q.FieldByName('alamat').AsString;
  end;
  q.Close;
end;

procedure TfrmInputPO.cxtbTblPODataControllerBeforePost(
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
    end else
    if (VarIsNull(ADataController.Values[i, cxColKodeBrg.Index])) or
      (Trim(ADataController.Values[i, cxColKodeBrg.Index]) = '')  then begin
      MsgBox('Kode barang harus di isi.');
      Abort;
    end else
    if ADataController.Values[i, cxColQty.Index] <= 0 then begin
      MsgBox('Qty tidak boleh mines');
      ADataController.DeleteRecord(i);
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
end;


procedure TfrmInputPO.cxtbTblPODataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
  t, t1, t2, t3 : Real;
  i: Integer ;
begin
  inherited;
  //if (Self.Jenis = 'T') and (cxLuNoPP.Text = '')  then begin      --> kondisi iki membuat bawahnya tidak di eksekusi eong cxllunopp selalu ada isinya

  if (Self.Jenis = 'T') or (Self.Jenis = 'E')then begin
    if AItemIndex = cxColDeskripsi.Index then begin
      try
        cxtbTblPO.BeginUpdate;
        ADataController.Values[ARecordIndex, cxColKodeBrg.Index] :=  ADataController.Values[ARecordIndex, cxColDeskripsi.Index];
        q := OpenRS('SELECT * FROM tbl_barang WHERE kode = ''%s''',[ADataController.Values[ARecordIndex, cxColKodeBrg.Index]]);
        ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan').AsString;
        ADataController.Values[ARecordIndex, cxColqty.Index] := '1';
        ADataController.Values[ARecordIndex, cxColPPn.Index] := 'NON PPN';
        ADataController.Values[ARecordIndex, cxColValuta.Index] := 'IDR';
        q.Close;
      finally
        cxtbTblPO.EndUpdate
      end;
    end;
    if AItemIndex = cxColHarga.Index then begin
      try
        cxtbTblPO.BeginUpdate;
        if cxColPPn.EditValue = 'PPN' then begin
          cxColtotal.EditValue := cxColQty.EditValue *  cxColHarga.EditValue * 110 /100 ;
          cxtbTblPO.DataController.RefreshExternalData;
        end
        else begin
          cxColTotal.EditValue := cxColQty.EditValue * cxColHarga.EditValue;
          cxtbTblPO.DataController.RefreshExternalData;
        end;
      finally
        cxtbTblPO.EndUpdate
      end;
    end;
    if AItemIndex = cxColPPn.Index then begin
      try
        cxtbTblPO.BeginUpdate;
        if cxColPPn.EditValue = 'PPN' then begin
          cxColTotal.EditValue := cxColQty.EditValue * cxColHarga.EditValue * 110 /100;
          cxtbTblPO.DataController.RefreshExternalData;
        end
        else begin
          cxColtotal.EditValue := cxColQty.EditValue * cxColHarga.EditValue;
          cxtbTblPO.DataController.RefreshExternalData;
        end;
      finally
        cxtbTblPO.EndUpdate;
      end;
    end;
  end;
end;


procedure TfrmInputPO.FormCreate(Sender: TObject);
begin
inherited;
  cxtNoBukti.Text := GetLastFak('po');
  cxdTgl.Date := Aplikasi.Tanggal;
  cxdTglDatang.Date := Aplikasi.Tanggal;
  zqrPPHead.Open;
  cxCboRate.ItemIndex := 0;
  zqrSupplier.Open;
  zqrBarang.Open;
end;

procedure TfrmInputPO.FormShow(Sender: TObject);
  var
   q,z : TZQuery;
   i, nomer: integer;
   sNoTrs : string;
begin
  inherited;
  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('po');
    cxtNoBukti.Text := sNoTrs;
    cxdTgl.Date := Aplikasi.Tanggal;
    cxdTglDatang.Date := Aplikasi.Tanggal;
    cxtUser.Text := Aplikasi.NamaUser;
    cxtDepartemen.Text := Aplikasi.UserDept;
  end
  else if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_po_head WHERE id = ''%s''',[Self.EditKey]);
    cxtNoBukti.Text := q.FieldByName('no_bukti').AsString;
    if q.FieldByName('no_fobj').AsString = '' then begin
      cxLuNoPP.EditValue := '';
    end else begin
      cxLuNoPP.EditValue := q.FieldByName('no_fobj').AsString;
    end;
    cxLuSupplier.EditValue := q.FieldByName('kode_supp').AsString;
    cxtSopir.Text := q.FieldByName('driver').AsString;
    cxtKeterangan.Text := q.FieldByName('keterangan').AsString;
    cxCboPembayaran.Text := q.FieldByName('pembayaran').AsString;
    cxtNopol.Text := q.FieldByName('nopol').AsString;
    cxdTgl.Date := q.FieldByName('tanggal').AsDateTime;
    cxdTglDatang.Date := q.FieldByName('tgl_required').AsDateTime;
    cxtUser.Text := q.FieldByName('user').AsString;
    cxtDepartemen.Text := q.FieldByName('user_dept').AsString;
    q.Close;
    z := OpenRS('SELECT a.kode_brg, b.deskripsi, a.qty, b.satuan, a.keterangan, a.mata_uang, a.ppn, a.harga, (a.qty * a.harga)  as total FROM tbl_po_det a left join tbl_barang b on a.kode_brg = b.kode WHERE id_ref = ''%s''',[Self.EditKey]);
    nomer := 1;

    cxtbTblPO.DataController.OnRecordChanged := nil;
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
    while not z.Eof do begin
      with cxtbTblPO.DataController do begin
        i := AppendRecord;
        Values[i, cxColNo.Index] := nomer;
        Values[i, cxColKodeBrg.Index] := z.FieldByName('kode_brg').AsString;
        Values[i, cxColDeskripsi.Index] := z.FieldByName('kode_brg').AsString;
        Values[i, cxColQty.Index] := z.FieldByName('qty').AsFloat;
        Values[i, cxColSatuan.Index] := z.FieldByName('satuan').AsString;
        Values[i, cxColValuta.Index] := z.FieldByName('mata_uang').AsString;
        Values[i, cxColHarga.Index] := z.FieldByName('harga').AsFloat;
        Values[i, cxColPPn.Index] := z.FieldByName('PPN').AsString;
        if Values[i, cxColPPn.Index] = 'PPN' then begin
          Values[i, cxColTotal.Index] := z.FieldByName('qty').AsFloat * z.FieldByName('harga').AsFloat * 110/100;
        end else begin
          Values[i, cxColTotal.Index] := z.FieldByName('qty').AsFloat * z.FieldByName('harga').AsFloat
        end;

        nomer := nomer +1;
      end;
      z.Next;
    end;
    z.Close;
    cxtbTblPO.DataController.OnRecordChanged := Self.cxtbTblPODataControllerRecordChanged;
  end;
end;


end.
