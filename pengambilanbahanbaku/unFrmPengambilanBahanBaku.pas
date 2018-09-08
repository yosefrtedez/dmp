unit unFrmPengambilanBahanBaku;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, StdCtrls, ExtCtrls, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, ZAbstractRODataset, ZDataset, cxSpinEdit,
  cxTimeEdit, cxCheckBox, cxDBLookupComboBox;

type
  TfrmPengambilanBahanBaku = class(TfrmTplInput)
    Panel3: TPanel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel4: TPanel;
    cxGrid2: TcxGrid;
    cxtbBOM: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Label13: TLabel;
    cxLabel1: TcxLabel;
    cxdTgl1: TcxDateEdit;
    cxdTgl2: TcxDateEdit;
    cxLabel2: TcxLabel;
    btnProses: TButton;
    zqrSPK: TZReadOnlyQuery;
    dsSPK: TDataSource;
    cxtbSPK: TcxGridDBTableView;
    cxtbSPKid: TcxGridDBColumn;
    cxtbSPKno_spk: TcxGridDBColumn;
    cxtbSPKtanggal: TcxGridDBColumn;
    cxtbSPKno_mo: TcxGridDBColumn;
    cxtbSPKno_so: TcxGridDBColumn;
    cxtbSPKdeskripsi: TcxGridDBColumn;
    cxColKodeBrg: TcxGridDBColumn;
    cxColDeskripsi: TcxGridDBColumn;
    cxColQtySPK: TcxGridDBColumn;
    cxtbBOMColumn4: TcxGridDBColumn;
    cxColDiambil: TcxGridDBColumn;
    cxColSatuan: TcxGridDBColumn;
    Panel5: TPanel;
    cxGrid3: TcxGrid;
    cxGridLevel2: TcxGridLevel;
    cxtbBomDet: TcxGridTableView;
    cxColTanggal: TcxGridColumn;
    cxColJam: TcxGridColumn;
    cxColQtyInput: TcxGridColumn;
    cxColOperator: TcxGridColumn;
    cxColStatus: TcxGridColumn;
    cxColIdBrg: TcxGridDBColumn;
    cxColIdSatuan: TcxGridDBColumn;
    cxColGdg: TcxGridColumn;
    zqrGdg: TZReadOnlyQuery;
    dsGdg: TDataSource;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxlbNoSPK: TcxLabel;
    cxLabel6: TcxLabel;
    cxlbBahanBaku: TcxLabel;
    cxColKodeBrg2: TcxGridColumn;
    cxColDeskripsi2: TcxGridColumn;
    zqrBrg: TZReadOnlyQuery;
    dsBrg: TDataSource;
    cxColIsBom: TcxGridColumn;
    cxColSatuan2: TcxGridColumn;
    cxColIdSatuan2: TcxGridColumn;
    cxColKodeBrg3: TcxGridColumn;
    cxColIsBOM2: TcxGridDBColumn;
    procedure btnProsesClick(Sender: TObject);
    procedure cxtbSPKFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure cxtbBomDetDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure cxtbBomDetDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxtbBOMFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxtbBomDetDataControllerNewRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure cxtbBomDetDataControllerBeforeDelete(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure cxtbBomDetDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPengambilanBahanBaku: TfrmPengambilanBahanBaku;

implementation

uses unDM, unTools;

{$R *.dfm}

procedure TfrmPengambilanBahanBaku.btnProsesClick(Sender: TObject);
begin
  inherited;

  cxtbBOM.BeginUpdate;
  cxtbBOM.DataController.RecordCount := 0;
  cxtbBOM.EndUpdate;

  cxtbBomDet.BeginUpdate;
  cxtbBOMDet.DataController.RecordCount := 0;
  cxtbBomDet.EndUpdate;

  with zqrSPK do begin
    Close;
    ParamByName('tgl1').AsDate := cxdTgl1.Date;
    ParamByName('tgl2').AsDate := cxdTgl2.Date;
    Open;
  end;
end;

procedure TfrmPengambilanBahanBaku.cxtbBomDetDataControllerAfterPost(
  ADataController: TcxCustomDataController);
var
  q, qh, qjd: TZQuery;
  i, j, id_akun, id: integer;
  sNoBukti, sNoJ: string;
begin
  inherited;
  try
    Screen.Cursor := crSQLWait;

    dm.zConn.StartTransaction;

    i := ADataController.GetFocusedRecordIndex;
    j := cxtbBOM.DataController.GetFocusedRecordIndex;

    sNoBukti := GetLastFak('pengambilan-bb');
    UpdateFaktur(Copy(sNoBukti,1,8));
    q := OpenRS('SELECT * FROM tbl_trspengambilanbb WHERE id_spk = %s',[zqrSPK.FieldByName('id').AsString]);
    q.Insert;
    q.FieldByName('no_bukti').AsString := sNoBukti;
    q.FieldByName('tanggal').AsDateTime := ADataController.Values[i, cxColTanggal.Index];
    q.FieldByName('jam').AsDateTime := ADataController.Values[i, cxColJam.Index];
    q.FieldByName('id_spk').AsInteger := zqrSPK.FieldByName('id').AsInteger;
    q.FieldByName('id_brg').AsInteger := ADataController.Values[i, cxColKodeBrg2.Index];
    q.FieldByName('qty').AsFloat := ADataController.Values[i, cxColQtyInput.Index];
    q.FieldByName('operator').AsString := ADataController.Values[i, cxColOperator.INdex];
    q.FieldByName('id_gdg').AsInteger := ADataController.Values[i, cxColGdg.Index];
    q.FieldByName('id_satuan').AsInteger := ADataController.Values[i, cxColIdSatuan2.Index];
    q.FieldByName('user').AsString := Aplikasi.NamaUser;
    q.FieldByName('user_dept').AsString := Aplikasi.UserDept;
    ADataController.Values[i, cxColStatus.Index] := 1;
    q.Post;
    id := LastInsertID;
    q.Close;

    qh := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''',[sNoBukti]);
    qh.Insert;
    qh.FieldByName('id_ref').AsInteger := id;
    qh.FieldByName('no_bukti').AsString := sNobukti;
    qh.FieldByName('tanggal').AsString :=  ADataController.Values[i, cxColTanggal.Index];
    qh.FieldByName('kode_brg').AsString := ADataController.Values[i, cxColKodeBrg3.Index];
    qh.FieldByName('id_brg').AsInteger := ADataController.Values[i, cxColKodeBrg2.Index];
    qh.FieldByName('qty').AsFloat := ADataController.Values[i, cxColQtyInput.Index];
    qh.FieldByName('id_satuan').AsInteger := ADataController.Values[i, cxColIdSatuan2.Index];
    qh.FieldByName('id_gdg').AsInteger := ADataController.Values[i, cxColGdg.Index];
    qh.FieldByName('id_spk').AsInteger := zqrSPK.FieldByName('id').AsInteger;
    qh.FieldByName('id_so').AsInteger := zqrSPK.FieldByName('id_so').AsInteger;
    qh.FieldByName('tipe').AsString := 'o';
    qh.FieldbyName('user').AsString := Aplikasi.NamaUser;
    qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
    qh.Post;
    qh.Close;

    q := OpenRS('SELECT id, stok FROM tbl_barang WHERE id = %s',[ADataController.Values[i, cxColKodeBrg2.Index]]);
    q.Edit;
    q.FieldByName('stok').AsFloat := q.FieldByName('stok').AsFloat - ADataController.Values[i, cxColQtyInput.Index];
    q.Post;

    q := OpenRS('SELECT id_brg, id_gdg, stok FROM tbl_barang_det WHERE id_brg = %s AND id_gdg = %s',
      [ADataController.Values[i, cxColKodeBrg2.Index], ADataController.Values[i, cxColGdg.Index]]);
    if not q.IsEmpty then
      q.Edit
    else
      q.Insert;
    q.FieldByName('id_brg').AsInteger := ADataController.Values[i, cxColKodeBrg2.Index];
    q.FieldByName('id_gdg').AsInteger := ADataController.Values[i, cxColGdg.Index];
    q.FieldByName('stok').AsFloat := q.FieldByName('stok').AsFloat - ADataController.Values[i, cxColQtyInput.Index];
    q.Post;

    if Aplikasi.FAcc then begin
      sNoJ := GetLastFak('jurnal');
      UpdateFaktur(Copy(sNoJ,1,6));

      qjd := OpenRS('SELECT * FROM tbl_jurnal WHERE no_jurnal = ''%s''',[sNoJ]);
      id_akun := GetDefaultAkun('persediaan_dalam_proses');
      qjd.Insert;
      qjd.FieldByName('id_ref').AsInteger := id;
      qjd.FieldbyName('tanggal').AsDateTime := Aplikasi.TanggalServer;
      qjd.FieldByName('no_jurnal').AsString := sNoJ;
      qjd.FieldByName('no_trans').AsString := sNoBukti;
      qjd.FieldByName('id_akun').AsInteger := id_akun;
      qjd.FieldByName('debet').AsFloat := ADataController.Values[i, cxColQtyInput.Index] *
        GetHPP(ADataController.Values[i, cxColKodeBrg2.Index]);
      qjd.FieldByName('dc').AsString := 'D';
      qjd.Post;

      id_akun := GetDefaultAkunBrg(ADataController.Values[i, cxColKodeBrg2.Index], 'persediaan');
      qjd.Insert;
      qjd.FieldByName('tanggal').AsDateTime := Aplikasi.TanggalServer;
      qjd.FieldByName('no_jurnal').AsString := sNoJ;
      qjd.FieldByName('no_trans').AsString := sNoBukti;
      qjd.FieldByName('akun').AsString := id_akun;
      qjd.FieldByName('kredit').AsFloat := ADataController.Values[i, cxColQtyInput.Index] *
        GetHPP(ADataController.Values[i, cxColKodeBrg2.Index]);
      qjd.FieldByName('dc').AsString := 'K';
      qjd.Post;

    end;

    dm.zConn.Commit;

    // update qty pengambilan
    //q := OpenRS('SELECT SUM(qty) qty FROM tbl_trspengambilanbb WHERE id_spk = %s AND id_brg = %s',
    //  [zqrSPK.FieldByName('id').AsString, cxtbBOM.DataController.Values[j, cxColIdBrg.Index]]);
    //cxtbBOM.DataController.Values[j, cxColDiambil.Index] := q.FieldByname('qty').AsFloat;
    //q.Close;

    Screen.Cursor := crDefault;
  except
    on E: Exception do begin
      dm.zConn.Rollback;
      Screen.Cursor := crDefault;
      MsgBox('Error: ' + E.Message);
    end;
  end;

end;

procedure TfrmPengambilanBahanBaku.cxtbBomDetDataControllerBeforeDelete(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  inherited;
  if ADataController.Values[ARecordIndex, cxColSatuan.Index] = 1 then Abort;
end;

procedure TfrmPengambilanBahanBaku.cxtbBomDetDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i, j: integer;
  berr: boolean;
  sa: real;
begin
  inherited;
  i := ADataController.GetFocusedRecordIndex;
  j := cxtbBOM.DataController.GetFocusedRecordIndex;

  berr := true;
  with ADataController do begin
    if VarIsNull(Values[i, cxColKodeBrg2.Index]) then berr := false;
    if VarIsNull(Values[i, cxColTanggal.Index]) then berr := false;
    if VarIsNull(Values[i, cxColJam.Index]) then berr := false;
    if VarIsNull(Values[i, cxColQtyInput.Index]) then berr := false;
  end;

  if not berr then begin
    MsgBox('Mohon lengkapi inputan yang masih kosong.');
    Abort;
  end;

  sa := GetStokAkhir(StrToInt(ADataController.Values[i, cxColKodeBrg2.Index]), StrToInt(ADataController.Values[i, cxColGdg.Index]));
  if sa < ADataController.Values[i, cxColQtyInput.Index] then begin
    MsgBox('Stok barang tidak mencukupi. Stok : ' + FormatFloat('#,#0.00', sa));
    Abort;
  end;

  if ADataController.Values[i, cxColStatus.Index] = 1 then Abort;

end;

procedure TfrmPengambilanBahanBaku.cxtbBomDetDataControllerNewRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  inherited;
  ADataController.Values[ARecordIndex, cxColGdg.Index] := Aplikasi.GdgBB;
  ADataController.Values[ARecordIndex, cxColIsBom.Index] := 0;
end;

procedure TfrmPengambilanBahanBaku.cxtbBomDetDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
  t, t1, t2, t3 : Real;
  i: Integer ;
begin
  inherited;

  if AItemIndex = cxColKodeBrg2.Index then begin
    try
      cxtbBomDet.BeginUpdate;
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
        [ADataController.Values[ARecordIndex, AItemIndex]]);
      ADataController.Values[ARecordIndex, cxColDeskripsi2.Index] :=  ADataController.Values[ARecordIndex, AItemIndex];
      ADataController.Values[ARecordIndex, cxColSatuan2.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan2.Index] := q.FieldByname('id_satuan').AsInteger;
      ADataController.Values[ARecordIndex, cxColKodeBrg3.Index] := q.FieldByName('kode').AsString;
      q.Close;

      q := OpenRS('SELECT id_brg FROM tbl_bom WHERE id_brg = %s AND id_spk = %s',
        [ADataController.Values[ARecordIndex, AItemIndex], zqrSPK.FieldByName('id').AsString]);
      if not q.IsEmpty then ADataController.Values[ARecordIndex, cxColIsBom.Index] := 1;
      q.Close;
    finally
      cxtbBomDet.EndUpdate
    end;
  end;

  if AItemIndex = cxColDeskripsi2.Index then begin
    try
      cxtbBOMDet.BeginUpdate;
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
        [ADataController.Values[ARecordIndex, AItemIndex]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg2.Index] := q.FieldByName('id').AsString;
      ADataController.Values[ARecordIndex, cxColSatuan2.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan2.Index] := q.FieldByname('id_satuan').AsInteger;
      ADataController.Values[ARecordIndex, cxColKodeBrg3.Index] := q.FieldByName('kode').AsString;
      q.Close;

      q := OpenRS('SELECT id_brg FROM tbl_bom WHERE id_brg = %s AND id_spk = %s',
        [ADataController.Values[ARecordIndex, AItemIndex], zqrSPK.FieldByName('id').AsString]);
      if not q.IsEmpty then ADataController.Values[ARecordIndex, cxColIsBom.Index] := 1;
      q.Close;
    finally
      cxtbBomDet.EndUpdate
    end;
  end;

end;

procedure TfrmPengambilanBahanBaku.cxtbBOMFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  q: TZQuery;
  j,i: integer;
begin
  inherited;
  {
  try
    j := cxtbBOM.DataController.GetFocusedRecordIndex;
    q := OpenRS('SELECT * FROM tbl_trspengambilanbb WHERE id_spk = %s',[zqrSPK.FieldByName('id').AsString]);

    cxtbBomDet.DataController.RecordCount := 0;
    cxtbBomDet.BeginUpdate;
    while not q.Eof do begin
      with cxtbBomDet.DataController do begin
        i := AppendRecord;
        Values[i, cxColKodeBrg2.Index] := q.FieldByname('id_brg').AsInteger;
        Values[i, cxColDeskripsi2.Index] := q.FieldByName('id_brg').AsInteger;
        Values[i, cxColTanggal.Index] := q.FieldByName('tanggal').AsDateTime;
        Values[i, cxColJam.Index] := q.FieldByName('jam').AsDateTime;
        Values[i, cxColQtyInput.Index] := q.FieldByname('qty').AsFloat;
        Values[i, cxColOperator.Index] := q.FieldByName('operator').AsString;
        Values[i, cxColGdg.Index] := q.FieldByName('id_gdg').AsInteger;
        Values[i, cxColStatus.Index] := 1;
      end;
      q.Next;
    end;
    cxtbBomDet.EndUpdate;
    q.Close;

    cxlbBahanBaku.Caption := cxtbBom.DataController.Values[j, cxColDeskripsi.Index];
  Except
  end;
  }
end;

procedure TfrmPengambilanBahanBaku.cxtbSPKFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  q: TZQuery;
  i,j: integer;
begin
  inherited;
  try
    with cxtbBOM.DataController do begin
      cxlbNoSPK.Caption := '-';
      cxlbBahanBaku.Caption := '-';

      cxtbBomDet.DataController.RecordCount := 0;
      RecordCount := 0;
      {
      q := OpenRS('SELECT a.*, b.kode, b.deskripsi, c.satuan satuan2, ' +
        '(SELECT SUM(qty) FROM tbl_trspengambilanbb WHERE id_spk = a.id_spk AND id_brg = a.id_brg) qty_ambil ' +
        'FROM tbl_bom a ' +
        'LEFT JOIN tbl_barang b ON b.id = a.id_brg ' +
        'LEFT JOIN tbl_satuan c ON c.id = a.id_satuan WHERE id_spk = %d',
        [zqrSPK.FieldByName('id').AsInteger]);
      }

      q := OpenRS('select a.id_spk, a.id_brg, a.id_satuan, b.kode, b.deskripsi, c.satuan satuan2, ' +
        'ifnull((select qty from tbl_bom where id_spk = a.id_spk and id_brg = a.id_brg),0) qty_bom, ' +
        'sum(qty) qty_ambil from ' +
        '( ' +
        'select a.id_spk, a.id_brg, a.id_satuan, 0 qty from tbl_bom a where a.id_spk = %d ' +
        'union all ' +
        'select b.id_spk, b.id_brg, b.id_satuan, b.qty from tbl_trspengambilanbb b where b.id_spk = %d) a ' +
        'left join tbl_barang b ON b.id = a.id_brg ' +
        'left join tbl_satuan c ON c.id = a.id_satuan ' +
        'group by a.id_spk, a.id_brg, a.id_satuan, b.kode, b.deskripsi, c.satuan',
        [zqrSPK.FieldByName('id').AsInteger, zqrSPK.FieldByName('id').AsInteger]);

      while not q.Eof do begin
        i := AppendRecord;
        Values[i, cxColKodeBrg.Index] := q.FieldByName('kode').AsString;
        Values[i, cxColDeskripsi.Index] := q.FieldByName('deskripsi').AsString;
        Values[i, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
        Values[i, cxColQtySPK.Index] := q.FieldByName('qty_bom').AsFloat;
        Values[i, cxColDiambil.Index] := q.FieldByName('qty_ambil').AsFloat;
        Values[i, cxColIdBrg.Index] := q.FieldByName('id_brg').AsInteger;
        Values[i, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
        if q.FieldByName('qty_bom').AsFloat > 0 then
          Values[i, cxColIsBOM2.Index] := 1
        else
          Values[i, cxColIsBOM2.Index] := 0;
        q.Next;
      end;
      q.Close;
    end;
    cxlbNoSPK.Caption := zqrSPK.FieldByName('no_spk').AsString;

    q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_trspengambilanbb a ' +
      'LEFT JOIN tbl_satuan b ON b.id = a.id_satuan ' +
      'WHERE id_spk = %s',[zqrSPK.FieldByName('id').AsString]);

    cxtbBomDet.DataController.RecordCount := 0;
    cxtbBomDet.BeginUpdate;
    while not q.Eof do begin
      with cxtbBomDet.DataController do begin
        i := AppendRecord;
        Values[i, cxColKodeBrg2.Index] := q.FieldByname('id_brg').AsInteger;
        Values[i, cxColDeskripsi2.Index] := q.FieldByName('id_brg').AsInteger;
        Values[i, cxColTanggal.Index] := q.FieldByName('tanggal').AsDateTime;
        Values[i, cxColJam.Index] := q.FieldByName('jam').AsDateTime;
        Values[i, cxColQtyInput.Index] := q.FieldByname('qty').AsFloat;
        Values[i, cxColOperator.Index] := q.FieldByName('operator').AsString;
        Values[i, cxColGdg.Index] := q.FieldByName('id_gdg').AsInteger;
        Values[i, cxColSatuan2.Index] := q.FieldByName('satuan2').AsString;
        Values[i, cxColIdSatuan2.Index] := q.FieldByName('id_satuan').AsInteger;
        Values[i, cxColStatus.Index] := 1;
      end;
      q.Next;
    end;
    cxtbBomDet.EndUpdate;
    q.Close;

    cxlbBahanBaku.Caption := cxtbBom.DataController.Values[j, cxColDeskripsi.Index];

  except
  end;
end;

procedure TfrmPengambilanBahanBaku.FormCreate(Sender: TObject);
begin
  inherited;
  cxdTgl1.Date := unTools.FDOM(Aplikasi.TanggalServer);
  cxdTgl2.Date := unTools.LDOM(Aplikasi.TanggalServer);
  zqrBrg.Open;
  zqrGdg.Open;
end;

end.
