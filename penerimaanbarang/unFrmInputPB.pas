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
  DB, ZAbstractRODataset, cxCheckBox, Math;

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
    cxColIdBrg: TcxGridColumn;
    cxColGdg: TcxGridColumn;
    zqrGdg: TZReadOnlyQuery;
    dsGdg: TDataSource;
    cxChkPosting: TcxCheckBox;
    cxColQtyDatang: TcxGridColumn;
    cxlSupp: TcxLookupComboBox;
    zqrSupp: TZReadOnlyQuery;
    dsSupp: TDataSource;
    cxChkSelesai: TcxCheckBox;
    cxColIdGdg: TcxGridColumn;
    btnPilihPO: TButton;
    cxColNoPO: TcxGridColumn;
    cxColIdPO: TcxGridColumn;
    cxColTglPO: TcxGridColumn;
    cxChkPBTanpaPO: TcxCheckBox;
    cxGrdPB2: TcxGrid;
    cxtbPB2: TcxGridTableView;
    cxColKodeBrg2: TcxGridColumn;
    cxColDeskripsi2: TcxGridColumn;
    cxColSatuan2: TcxGridColumn;
    cxGridColumn10: TcxGridColumn;
    cxColGdg2: TcxGridColumn;
    cxColKeterangan2: TcxGridColumn;
    cxColKodeBrg22: TcxGridColumn;
    cxColIdGdg22: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    cxColIdSatuan22: TcxGridColumn;
    cxColQtyDatang2: TcxGridColumn;
    btnSimpan2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cxlNoPPPropertiesChange(Sender: TObject);
    procedure cxtbPBDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxtbPBDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure cxlSuppPropertiesChange(Sender: TObject);
    procedure btnPilihPOClick(Sender: TObject);
    procedure cxlSuppExit(Sender: TObject);
    procedure cxChkPBTanpaPOClick(Sender: TObject);
    procedure cxtbPB2DataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxtbPB2DataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure btnSimpan2Click(Sender: TObject);
  private
    id_supplier: integer;
    f_posted: Boolean;
    function CheckPOComplete: TStringList;
  public
    { Public declarations }
  end;

var
  frmInputPB: TfrmInputPB;

implementation

uses unDM, unTools, unFrmLstPB, unFrmPilihPO;

{$R *.dfm}

procedure TfrmInputPB.btnPilihPOClick(Sender: TObject);
var
  f: TfrmPilihPO;
  cx: TcxGridTableView;
  i,j: Integer;
  qhrg, qbrg: TZQuery;
begin
  inherited;
  if cxlSupp.Text = '' then Abort;

  f := TfrmPilihPO.Create(Self);
  f.IdSupp := cxlSupp.EditValue;
  if f.ShowModal = mrOk then begin
    cx := f.cxtbSO;
    cxtbPB.BeginUpdate;
    cxtbPB.DataController.RecordCount := 0;
    with cx.DataController do begin
      for i := 0 to RecordCount -  1 do begin
        if Values[i, f.cxColPilih.Index] = 1 then begin
          j := cxtbPB.DataController.AppendRecord;
          cxtbPB.DataController.Values[j, cxColIdBrg.Index] := Values[i, f.cxColIdBrg.Index];
          cxtbPB.DataController.Values[j, cxColIdPO.Index] := Values[i, f.cxColIdSO.Index];
          cxtbPB.DataController.Values[j, cxColKodeBrg.Index] := Values[i,f.cxColKodeBrg.Index];
          cxtbPB.DataController.Values[j, cxColDeskripsi.Index] := Values[i,f.cxColDeskripsi.Index];
          cxtbPB.DataController.Values[j, cxColNoPO.Index] := Values[i, f.cxColNoPO.Index];
          cxtbPB.DataController.Values[j, cxColTglPO.Index] := Values[i, f.cxColTanggal.Index];
          cxtbPB.DataController.Values[j, cxColQtyPO.Index] := Values[i, f.cxColQtyPO.Index];
          cxtbPB.DataController.Values[j, cxColQtyTerima.Index] := Values[i, f.cxColQtyDiterima.Index];
          cxtbPB.DataController.Values[j, cxColQtyDatang.Index] := Values[i, f.cxColJmlTerima.Index];

          cxtbPB.DataController.Values[j, cxColGdg.Index] := Values[i, f.cxColGdg.Index];
          cxtbPB.DataController.Values[j, cxColSatuan.Index] := Values[i, f.cxColSatuan.Index];
          cxtbPB.DataController.Values[j, cxColIdSatuan.Index] := Values[i, f.cxColIdSatuan.Index];

          qhrg := OpenRS('SELECT harga FROM tbl_so_det WHERE id_ref = %s AND id_brg = %s',
            [Values[i, f.cxColIdSO.Index], Values[i, f.cxColIdBrg.Index]]);
          cxtbPB.DataController.Values[j, cxColHarga.Index] := qhrg.FieldByname('harga').AsFloat;
          qhrg.Close;

          cxtbPB.DataController.Values[j, cxColTotal.Index] :=
            cxtbPB.DataController.Values[j, cxColHarga.Index] * cxtbPB.DataController.Values[j, cxColQtyTerima.Index];
        end;
      end;
      //HitungTotal;
    end;
    cxtbPB.EndUpdate;
  end;
end;

procedure TfrmInputPB.btnSimpan2Click(Sender: TObject);
var
  sNoTrs: string;
  q, qh,qd, hst, qbrg: TZQuery;
  i, ID: Integer;
  sAkhir, hppAkhir, hpp: real;
  f0: boolean;
  lstPOClose: TStringList;
begin

  if cxtbPB2.DataController.RecordCount = 0 then begin
    MsgBox('Detail transaksi tidak boleh kosong.');
    Abort;
  end;

  if (cxtbPB2.DataController.EditState = [dceEdit, dceModified]) or
    (cxtbPB2.DataController.EditState = [dceInsert, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.');
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
  with cxtbPB2.DataController do begin
    for i := 0 to RecordCount - 1 do begin
      if (VarIsNull(Values[i, cxColQtyDatang2.Index])) or
        (Values[i, cxColQtyDatang2.Index] = 0) then begin
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

    if Self.Jenis = 'E' then begin
      MsgBox('Transaksi tidak bisa di simpan karena sudah di posting.');
      Abort;
    end;

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
    qh.FieldByName('tanggal').AsDateTime := cxdTglDatang.Date;
    qh.FieldByName('user').AsString := Aplikasi.NamaUser;
    qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
    qh.FieldByName('id_supplier').AsInteger := cxlSupp.EditValue;
    qh.FieldByName('nopol').AsString := cxtNopol.text;
    qh.FieldByName('sopir').AsString := cxtSopir.text;
    qh.FieldByName('keterangan').AsString := cxtKeterangan.Text;
    qh.FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
    qh.FieldByname('jenis_pb').AsInteger := 1;
    qh.Post;

    if Self.Jenis = 'E' then begin
      dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_pb_det WHERE id_ref = %d',[ID]));
    end
    else begin
      ID := LastInsertID;
    end;

    qd := OpenRS('SELECT * FROM tbl_pb_det WHERE id_ref = %d',[ID]);
    with cxtbPB2.DataController do begin
      for i := 0 to RecordCount - 1 do begin
        qd.Insert;
        qd.FieldByName('id_ref').AsInteger := ID;
        qd.FieldByName('no_bukti').AsString := sNoTrs;
        qd.FieldByName('id_brg').AsInteger := Values[i, cxColKodeBrg2.Index];
        qd.FieldByname('kode_brg').AsString := Values[i, cxColKodeBrg2.Index];
        qd.FieldByname('qty').AsFloat := Values[i, cxColQtyDatang2.Index];
        qd.FieldByName('id_satuan').AsInteger := Values[i, cxColIdSatuan22.Index];
        qd.FieldbyName('id_gdg').AsInteger := Values[i, cxColGdg2.Index];
        qd.Post;
      end;
    end;

    if cxChkPosting.Checked then begin
      hst := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''',[sNoTrs]);
      with cxtbPB2.DataController do begin
        for i := 0 to RecordCount - 1 do begin
          hst.Insert;
          hst.FieldByName('no_bukti').AsString := sNoTrs;
          hst.FieldByname('tanggal').AsDateTime := cxdTglDatang.Date;
          hst.FieldByName('id_brg').AsInteger := Values[i, cxColKodeBrg2.Index];
          hst.FieldByName('id_gdg').AsInteger := Values[i, cxColGdg2.Index];
          hst.FieldByname('kode_brg').AsString := Values[i, cxColKodeBrg2.Index];
          hst.FieldByname('qty').AsFloat := Values[i, cxColQtyDatang2.Index];
          hst.FieldByName('id_satuan').AsInteger := Values[i, cxColIdSatuan22.Index];
          hst.FieldByName('id_pb').AsInteger := ID;
          hst.FieldByName('tipe').AsString := 'i';

          sAkhir := GetStokAkhir(Values[i, cxColKodeBrg2.Index], Values[i, cxColGdg2.Index]);
          //hppAkhir := GetHpp(Values[i, cxColKodeBrg2.Index], Values[i, cxColGdg2.Index]);
          //hpp := ((hppAkhir * sAkhir) + (Values[i, cxColQtyDatang2.Index] * Values[i, cxColHarga.Index])) /
          //  (sAkhir + Values[i, cxColQtyDatang2.Index]);
          //hst.FieldByName('avgcost').AsFloat := hpp;

          hst.FieldByName('user').AsString := Aplikasi.NamaUser;
          hst.FieldByName('user_dept').AsString := Aplikasi.UserDept;
          hst.FieldByName('tgl_input').AsDateTime := Aplikasi.NowServer;

          hst.Post;

          // update barang
          qbrg := OpenRS('SELECT * FROM tbl_barang WHERE id = %s',[Values[i, cxColKodeBrg2.Index]]);
          qbrg.Edit;
          qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat + Values[i, cxColQtyDatang2.Index];
          qbrg.Post;
          qbrg.Close;

          // update detail barang
          qbrg := OpenRS('SELECT * FROM tbl_barang_det WHERE id_brg = %s AND id_gdg = %s',
            [Values[i, cxColKodeBrg2.Index], Values[i, cxColGdg2.Index]]);
          if qbrg.IsEmpty then
            qbrg.Insert
          else
            qbrg.Edit;
          qbrg.FieldByName('id_brg').AsInteger := Values[i, cxColKodeBrg2.Index];
          qbrg.FieldByName('id_gdg').AsInteger := Values[i, cxColGdg2.Index];
          qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat + Values[i, cxColQtyDatang2.Index];
          qbrg.Post;
          qbrg.Close;
        end;
      end;
      dm.zConn.ExecuteDirect(Format('UPDATE tbl_pb_head SET f_posted = 1 WHERE id = %d',[ID]));
    end;

    dm.zConn.Commit;

    MsgBox('Penerimaan barang sudah disimpan dengan nomor: ' + sNoTrs);

    lstPOClose := CheckPOComplete;
    if lstPOClose.Count > 0 then begin
      MsgBox('PO : ' + lstPOClose.CommaText + ' sudah selesai.');
    end;

    if Assigned(Self.FormInduk) then
        (Self.FormInduk as TFrmLstPB).btnRefreshClick(nil);

    btnBatalClick(nil);

    inherited;
  except
    on E: Exception do begin
      dm.zConn.Rollback;
      MsgBox('Error: ' + E.Message);
    end;
  end;

end;
procedure TfrmInputPB.btnSimpanClick(Sender: TObject);
var
  sNoTrs: string;
  q, qh,qd, hst, qbrg: TZQuery;
  i, ID: Integer;
  sAkhir, hppAkhir, hpp: real;
  f0: boolean;
  lstPOClose: TStringList;
begin

  if cxtbPB.DataController.RecordCount = 0 then begin
    MsgBox('Detail transaksi tidak boleh kosong.');
    Abort;
  end;

  if (cxtbPB.DataController.EditState = [dceEdit, dceModified]) or
    (cxtbPB.DataController.EditState = [dceInsert, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.');
    Abort;
  end;

  {
  if cxlNoPO.Text = '' then begin
    MsgBox('Mohon pilih Nomor Purchase Order.');
    cxlNoPO.SetFocus;
    Abort;
  end;
  }

  if Trim(cxdTglDatang.Text) = '' then begin
    MsgBox('Mohon masukkan tanggal kedatangan barang.');
    cxdTglDatang.SetFocus;
    Abort;
  end;

  if f_posted then begin
    MsgBox('Transaksi ini sudah di posting, tidak bisa di edit.');
    Abort;
  end;

  {
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
  }

  try

    if Self.Jenis = 'E' then begin
      MsgBox('Transaksi tidak bisa di simpan karena sudah di posting.');
      Abort;
    end;

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
    //qh.FieldByName('id_po').AsInteger := cxlNoPO.EditValue;
    qh.FieldByName('tanggal').AsDateTime := cxdTglDatang.Date;
    qh.FieldByName('user').AsString := Aplikasi.NamaUser;
    qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
    qh.FieldByName('id_supplier').AsInteger := cxlSupp.EditValue;
    qh.FieldByName('nopol').AsString := cxtNopol.text;
    qh.FieldByName('sopir').AsString := cxtSopir.text;
    qh.FieldByName('keterangan').AsString := cxtKeterangan.Text;
    qh.FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
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
        qd.FieldByname('qty').AsFloat := Values[i, cxColQtyDatang.Index];
        qd.FieldByName('id_satuan').AsInteger := Values[i, cxColIdSatuan.Index];
        qd.FieldByName('harga').AsFloat := Values[i, cxColHarga.Index];
        qd.FieldByName('id_po').AsInteger := Values[i, cxColIdPO.Index];
        qd.FieldbyName('id_gdg').AsInteger := Values[i, cxColGdg.Index];
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
          hst.FieldByname('qty').AsFloat := Values[i, cxColQtyDatang.Index];
          hst.FieldByName('id_satuan').AsInteger := Values[i, cxColIdSatuan.Index];
          hst.FieldByName('id_po').AsInteger := Values[i, cxColIdPO.Index];
          hst.FieldByName('id_pb').AsInteger := ID;
          hst.FieldByName('tipe').AsString := 'i';

          sAkhir := GetStokAkhir(Values[i, cxColIdBrg.Index], Values[i, cxColGdg.Index]);
          hppAkhir := GetHpp(Values[i, cxColIdBrg.Index], Values[i, cxColGdg.Index]);
          hpp := ((hppAkhir * sAkhir) + (Values[i, cxColQtyDatang.Index] * Values[i, cxColHarga.Index])) /
            (sAkhir + Values[i, cxColQtyDatang.Index]);
          hst.FieldByName('avgcost').AsFloat := hpp;

          hst.FieldByName('user').AsString := Aplikasi.NamaUser;
          hst.FieldByName('user_dept').AsString := Aplikasi.UserDept;
          hst.FieldByName('tgl_input').AsDateTime := Aplikasi.NowServer;

          hst.Post;

          // update barang
          qbrg := OpenRS('SELECT * FROM tbl_barang WHERE id = %s',[Values[i, cxColIdBrg.Index]]);
          qbrg.Edit;
          qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat + Values[i, cxColQtyDatang.Index];
          qbrg.Post;
          qbrg.Close;

          // update detail barang
          qbrg := OpenRS('SELECT * FROM tbl_barang_det WHERE id_brg = %s AND id_gdg = %s',
            [Values[i, cxColIdBrg.Index], Values[i, cxColGdg.Index]]);
          if qbrg.IsEmpty then
            qbrg.Insert
          else
            qbrg.Edit;
          qbrg.FieldByName('id_brg').AsInteger := Values[i, cxColIdBrg.Index];
          qbrg.FieldByName('id_gdg').AsInteger := Values[i, cxColGdg.Index];
          qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat + Values[i, cxColQtyDatang.Index];
          qbrg.Post;
          qbrg.Close;
        end;
      end;
      dm.zConn.ExecuteDirect(Format('UPDATE tbl_pb_head SET f_posted = 1 WHERE id = %d',[ID]));
    end;

    dm.zConn.Commit;

    MsgBox('Penerimaan barang sudah disimpan dengan nomor: ' + sNoTrs);

    lstPOClose := CheckPOComplete;
    if lstPOClose.Count > 0 then begin
      MsgBox('PO : ' + lstPOClose.CommaText + ' sudah selesai.');
    end;

    if Assigned(Self.FormInduk) then
        (Self.FormInduk as TFrmLstPB).btnRefreshClick(nil);

    btnBatalClick(nil);

    inherited;
  except
    on E: Exception do begin
      dm.zConn.Rollback;
      MsgBox('Error: ' + E.Message);
    end;
  end;

end;

function TfrmInputPB.CheckPOComplete: TStringList;
var
  q: TZQuery;
  f: Boolean;
  a,b: Extended;
  i, idx: integer;
  lst: TStringList;
begin
  lst := TStringList.Create;
  for i := 0 to cxtbPB.DataController.RecordCount - 1 do begin
    q := OpenRS('SELECT a.id_brg, a.qty, (SELECT SUM(qty) FROM tbl_pb_det WHERE id_po = a.id_ref AND id_brg = a.id_brg) qty_terima ' +
      'FROM tbl_po_det a WHERE a.id_ref = %s',[cxtbPB.DataController.Values[i, cxColIdPO.Index]]);
    f := False;
    while not q.Eof do begin
      a := q.FieldByName('qty').AsFloat;
      b := q.FIeldByName('qty_terima').AsFloat;
      if CompareValue(a, b) = 0 then
        f := true
      else begin
        f := false;
        Break;
      end;
      q.Next;
    end;
    if f then begin
      dm.zConn.ExecuteDirect(Format('UPDATE tbl_po_head SET f_completed = 1 WHERE id = %s',
        [cxtbPB.DataController.Values[i, cxColIdPO.Index]]));
      if not lst.Find(cxtbPB.DataController.Values[i, cxColIdPO.Index], idx) then
        lst.Add(cxtbPB.DataController.Values[i, cxColNoPO.Index]);
    end;
  end;
  Result := lst;
end;

procedure TfrmInputPB.cxChkPBTanpaPOClick(Sender: TObject);
begin
  inherited;
  cxGrdPB2.Visible := cxChkPBTanpaPO.Checked;
  btnPilihPO.Visible := not cxChkPBTanpaPO.Checked;
  btnSimpan.Visible := not cxChkPBTanpaPO.Checked;
  btnSimpan2.Visible := cxChkPBTanpaPO.Checked;
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
  cxtAlamat.Text := q.FieldByName('alamat').AsString;
  id_ref := q.FieldByName('id').AsInteger;
  id_supplier := q.FieldByName('id_supplier').AsInteger;
  cxCboPembayaran.Properties.Items.Text := q.FieldByName('pembayaran').AsString;
  cxCboPembayaran.ItemIndex := 0;
  cxCboPembayaran.Properties.ReadOnly := True;
  if q.FieldByName('currency').AsString = '1' then begin
    cxCboRate.Properties.Items.Text := 'IDR';
    cxCboRate.ItemIndex := 0;
    cxCboRate.Properties.ReadOnly := True;
    cxtRate.Properties.ReadOnly := True;
  end else begin
    cxCboRate.Properties.Items.Text := 'USD';
    cxCboRate.ItemIndex := 0;
    cxCboRate.Properties.ReadOnly := True;
    cxtRate.Properties.ReadOnly := False;
  end;

  q.Close;

  q := OpenRS('SELECT a.*, b.deskripsi, c.satuan satuan2, ' +
              'IFNULL((SELECT SUM(d.`qty`) FROM tbl_pb_det d WHERE d.`id_brg` = a.`id_brg` and d.id_po = %s),0) AS qty_datang ' +
              'FROM tbl_po_det a ' +
              'left join tbl_po_head e on a.`id_ref` = e.`id` ' +
              'left join tbl_pb_head f on f.`id_po` = e.`id` ' +
              'LEFT JOIN tbl_barang b ON a.id_brg = b.id ' +
              'LEFT JOIN tbl_satuan c ON a.id_satuan = c.id ' +
              'WHERE a.id_ref = %s group by a.id_brg',[cxlNoPO.EditValue, cxlNoPO.EditValue]);

  cxtbPB.DataController.RecordCount := 0;
  while not q.Eof do begin
    with cxtbPB.DataController do begin
      i := AppendRecord;
      Values[i, cxColKodeBrg.Index] := q.FieldByName('kode_brg').AsString;
      Values[i, cxColDeskripsi.Index] := q.FieldByName('deskripsi').AsString;
      Values[i, cxColQtyPO.Index] := q.FieldByName('qty').AsFloat;
      Values[i, cxColQtyDatang.Index] := q.FieldByName('qty_datang').AsFloat;
      Values[i, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
      Values[i, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      Values[i, cxColHarga.Index] := q.FieldByName('harga').AsFloat;
      Values[i, cxColIdBrg.Index] := q.FieldByName('id_brg').AsInteger;
      Values[i, cxColGdg.Index] := Aplikasi.GdgPB;
      Values[i, cxColKeterangan.Index] := q.FieldByName('keterangan').AsString;
    end;
    q.Next;
  end;
  q.Close;

  cxtbPB.DataController.OnRecordChanged := Self.cxtbPBDataControllerRecordChanged;

end;

procedure TfrmInputPB.cxlSuppExit(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  try
    zqrPO.Close;
    zqrPO.ParamByName('id_supplier').AsInteger := cxlSupp.EditValue;
    zqrPO.Open;

    cxtbPB.DataController.RecordCount := 0;
    cxdTglPO.Text := '';
    q := OpenRS('SELECT alamat, alamat2, kota, provinsi, negara FROM tbl_supplier WHERE id = %s',[cxlSupp.EditValue]);
    cxtAlamat.Text := q.FieldByName('alamat').AsString + ', ' + q.FieldByName('alamat2').AsString +
      ', ' + q.FieldByname('kota').AsString + ', ' + q.FieldByName('provinsi').AsString;
    q.Close;
  except
  end;
end;

procedure TfrmInputPB.cxlSuppPropertiesChange(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  try
    //if not VarIsNull(cxlSupp.EditValue) then begin
      zqrPO.Close;
      zqrPO.ParamByName('id_supplier').AsInteger := cxlSupp.EditValue;
      zqrPO.Open;

      cxtbPB.DataController.RecordCount := 0;
      cxdTglPO.Text := '';
      q := OpenRS('SELECT alamat, alamat2, kota, provinsi, negara FROM tbl_supplier WHERE id = %s',[cxlSupp.EditValue]);
      cxtAlamat.Text := q.FieldByName('alamat').AsString + ', ' + q.FieldByName('alamat2').AsString +
        ', ' + q.FieldByname('kota').AsString + ', ' + q.FieldByName('provinsi').AsString;
      q.Close;
    //end;
  except
  end;
end;

procedure TfrmInputPB.cxtbPB2DataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
  sa: real;
begin
  inherited;
  i := ADataController.FocusedRowIndex;
  k := ADataController.GetEditingRecordIndex;
  v := ADataController.Values[i, cxColKodeBrg2.Index];

  for j := 0 to ADataController.RecordCount - 1 do begin
    if j <> k then begin
      if v = ADataController.Values[j, cxColKodeBrg2.Index] then begin
        MsgBox('Item tersebut sudah ada.');
        ADataController.DeleteRecord(i);
        Abort
      end;
    end;
  end;

  if (VarIsNull(ADataController.Values[i, cxColKodeBrg2.Index])) or
      (Trim(ADataController.Values[i, cxColKodeBrg2.Index]) = '')  then begin
    MsgBox('Kode barang harus diisi.');
    Abort;
  end;

  if (VarIsNull(ADataController.Values[i, cxColGdg2.Index])) or
      (Trim(ADataController.Values[i, cxColGdg2.Index]) = '')  then begin
    MsgBox('Kode gudang harus diisi.');
    Abort;
  end;

  if ADataController.Values[i, cxColQtyDatang2.Index] <= 0 then begin
    MsgBox('Qty. Datang tidak boleh 0 atau minus.');
    Abort;
  end;

end;

procedure TfrmInputPB.cxtbPB2DataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  sat: string;
begin
  inherited;
  if AItemIndex = cxColKodeBrg2.Index then begin
    ADataController.Values[ARecordIndex, cxColDeskripsi2.Index] := ADataController.Values[ARecordIndex, AItemIndex];
    ADataController.Values[ARecordIndex, cxColIdSatuan22.Index] := GetSatuan(ADataController.Values[ARecordIndex, AItemIndex], sat);
    ADataController.Values[ARecordIndex, cxColSatuan2.Index] := sat;
  end;

  if AItemIndex = cxColDeskripsi2.index then begin
    ADataController.Values[ARecordIndex, cxColKodeBrg2.Index] := ADataController.Values[ARecordIndex, AItemIndex];
    ADataController.Values[ARecordIndex, cxColIdSatuan22.Index] := GetSatuan(ADataController.Values[ARecordIndex, AItemIndex], sat);
    ADataController.Values[ARecordIndex, cxColSatuan2.Index] := sat;
  end;

  {
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
  }
end;

procedure TfrmInputPB.cxtbPBDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i: integer;
begin
  inherited;

  {
  i := cxtbPB.DataController.GetFocusedRecordIndex;

  if ADataController.Values[i, cxColQtyTerima.Index] <= 0 then begin
    MsgBox('Qty Terima tidak boleh minus.');
    Abort;
  end;
  if ADataController.Values[i, cxColQtyTerima.Index] > ADataController.Values[i, cxColQtyPO.Index]-ADataController.Values[i, cxColQtyDatang.Index]  then begin
      MsgBox('Qty. Terima tidak boleh melebihi QTY PO.');
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
  }

end;

procedure TfrmInputPB.cxtbPBDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
begin
  inherited;
  {
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
  }

end;

procedure TfrmInputPB.FormCreate(Sender: TObject);
begin
  inherited;
  cxtNoBukti.Text := GetLastFak('penerimaan');
  zqrSupp.Open;
  zqrBarang.Open;
  zqrGdg.Open;

  cxGrdPB2.Top := cxgrdPP.Top;
  cxGrdPB2.Left := cxgrdPP.Left;
  cxGrdPB2.Visible := False;
  cxChkPBTanpaPO.Visible := True;

  btnSimpan2.Visible := False;
  btnSimpan2.Left := btnSimpan.Left;
end;

procedure TfrmInputPB.FormShow(Sender: TObject);
var
  q, po, pod: TZQuery;
  i, ID, id_po, nomer : integer;
begin
  inherited;

  if Self.Jenis = 'E' then begin
    cxlNoPO.Properties.OnChange := nil;

    q := OpenRS('SELECT a.*, b.tanggal as tglpo, b.`pembayaran`, b.`currency`  FROM tbl_pb_head a ' +
      'LEFT JOIN tbl_po_head b ON a.id_po = b.id ' +
      'WHERE a.id = %s',[Self.EditKey]);

    cxlSupp.EditValue := q.FieldByName('id_supplier').AsInteger;
    cxlSupp.Properties.ReadOnly := True;

    cxtNoBukti.Text := q.FieldByName('no_bukti').AsString;

    cxlNoPO.EditValue := q.FieldByName('id_po').AsInteger;
    cxlSupp.Properties.ReadOnly := True;

    cxdTglDatang.Date := q.FieldByName('tanggal').AsDateTime;
    cxdTglPO.Date := q.fieldbyname('tglpo').AsDateTime;
    cxCboPembayaran.Properties.Items.Text := q.FieldByName('pembayaran').AsString;
    cxCboPembayaran.ItemIndex := 0;
    cxCboPembayaran.Properties.ReadOnly := True;

    cxtNopol.Text := q.FieldByname('nopol').AsString;
    cxtSopir.Text := q.FieldByName('sopir').AsString;
    cxtKeterangan.Text := q.FieldByName('keterangan').Text;

    if q.FieldByName('Currency').AsInteger = 1 then begin
      cxCboRate.Properties.Items.Text := 'IDR';
      cxCboRate.Properties.ReadOnly := True;
      cxCboRate.ItemIndex := 0;
      cxtRate.Properties.ReadOnly := True;
    end else begin
      cxCboRate.Properties.Items.Text := 'USD';
      cxCboRate.Properties.ReadOnly := True;
      cxCboRate.ItemIndex := 0;
      cxtRate.Properties.ReadOnly := False;
    end;

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
      //cxtNamaSupp.Text := q.FieldByname('nama_supplier').AsString;
      cxtAlamat.Text := q.FieldByName('alamat').AsString;
      q.Close;
   //cxgrdPP.DataController.OnRecordChanged := nil;
   cxtbPB.DataController.OnRecordChanged := nil;
   q := OpenRS('SELECT a.*, b.deskripsi, c.satuan satuan2, f.qty AS qty_po, ' +
            'IFNULL((SELECT SUM(e.`qty`) FROM tbl_pb_det e WHERE a.`id_brg` = e.`id_brg` AND e.`id_ref` <> d.`id`),0) AS qty_datang ' +
            'FROM tbl_pb_det a ' +
            'LEFT JOIN tbl_pb_head d ON a.`id_ref` = d.`id` ' +
            'LEFT JOIN tbl_po_head e ON e.id = d.`id_po` ' +
            'LEFT JOIN tbl_po_det f ON f.id_ref = e.`id` AND f.`id_brg` = a.`id_brg` ' +
            'LEFT JOIN tbl_barang b ON a.id_brg = b.id ' +
            'LEFT JOIN tbl_satuan c ON a.id_satuan = c.id ' +
            'WHERE a.id_ref = %s',[Self.EditKey]);
    nomer := 0;
    while not q.Eof do begin
      with cxtbPB.DataController do begin
        i := AppendRecord;
        {Values[i, cxColKodeBrg.Index] := q.FieldByName('kode_brg').AsString;
        Values[i, cxColDeskripsi.Index] := q.FieldByName('id_brg').AsString;
        Values[i, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
        Values[i, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
        //Values[i, cxColHarga.Index] := q.FieldByName('harga').AsFloat;
        Values[i, cxColIdBrg.Index] := q.FieldByName('id_brg').AsInteger;
        Values[i, cxColQtyTerima.Index] := q.FieldByName('qty').AsFloat;
        Values[i, cxColGdg.Index] := q.FieldByName('id_gdg').AsInteger;
        //Values[i, cxColQtyPO.Index] := q.FieldByName('qty').AsFloat;
        }
        Values[i, cxColNo.Index] := nomer + 1;
        Values[i, cxColKodeBrg.Index] := q.FieldByName('kode_brg').AsString;
        Values[i, cxColDeskripsi.Index] := q.FieldByName('deskripsi').AsString;
        Values[i, cxColQtyPO.Index] := q.FieldByName('qty_po').AsFloat;
        Values[i, cxColQtyTerima.Index] := q.FieldByName('qty').AsFloat;
        Values[i, cxColQtyDatang.Index] := q.FieldByName('qty_datang').AsFloat;
        Values[i, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
        Values[i, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
        Values[i, cxColHarga.Index] := q.FieldByName('harga').AsInteger;
        Values[i, cxColIdBrg.Index] := q.FieldByName('id_brg').AsInteger;
        Values[i, cxColGdg.Index] := Aplikasi.GdgPB;
        //Values[i, cxColPPn.Index] := q.FieldByName('ppn').AsString;
        Values[i, cxColKeterangan.Index] := q.FieldByName('keterangan').AsString;
        Values[i, cxColTotal.Index] := q.FieldByName('qty').AsFloat * q.FieldByName('harga').AsFloat;
      end;
      q.Next;

    end;

    q.Close;
    cxlNoPO.Properties.OnChange := Self.cxlNoPPPropertiesChange;
    //cxtbBarangMasuk.DataController.OnRecordChanged := Self.cxtbBarangMasukDataControllerRecordChanged;
    cxtbPB.DataController.OnRecordChanged := Self.cxtbPBDataControllerRecordChanged;

  end;

end;

end.
