unit unFrmInputHasilProduksi;

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
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxTextEdit, cxSpinEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, ZAbstractRODataset, ZDataset,
  cxCheckBox, cxDBLookupComboBox, cxMemo;

type
  TfrmInputHasilProduksi = class(TfrmTplInput)
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxdTgl1: TcxDateEdit;
    cxdTgl2: TcxDateEdit;
    cxLabel2: TcxLabel;
    btnProses: TButton;
    cxGrid1: TcxGrid;
    cxtbSPK: TcxGridDBTableView;
    cxtbSPKid: TcxGridDBColumn;
    cxtbSPKno_spk: TcxGridDBColumn;
    cxtbSPKtanggal: TcxGridDBColumn;
    cxtbSPKno_mo: TcxGridDBColumn;
    cxtbSPKno_so: TcxGridDBColumn;
    cxtbSPKdeskripsi: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel4: TPanel;
    Label13: TLabel;
    dsSPK: TDataSource;
    zqrSPK: TZReadOnlyQuery;
    cxtbSPKColumn1: TcxGridDBColumn;
    cxtbSPKColumn2: TcxGridDBColumn;
    dsMesin: TDataSource;
    zqrMesin: TZReadOnlyQuery;
    cxGrid3: TcxGrid;
    cxGridLevel2: TcxGridLevel;
    cxtbHslProd: TcxGridTableView;
    cxtbHslProdColumn1: TcxGridColumn;
    cxColJam1: TcxGridColumn;
    cxColJam2: TcxGridColumn;
    cxColShift: TcxGridColumn;
    cxColMesin: TcxGridColumn;
    cxColOperator: TcxGridColumn;
    cxColQtyProd: TcxGridColumn;
    cxColSatBJ: TcxGridColumn;
    cxColGdgBJ: TcxGridColumn;
    cxColQtyAfal: TcxGridColumn;
    cxColSatAfal: TcxGridColumn;
    cxColGdgAfal: TcxGridColumn;
    cxColStatus: TcxGridColumn;
    cxColIdSat: TcxGridColumn;
    cxColIdGdg: TcxGridColumn;
    dsSatuan: TDataSource;
    zqrSatuan: TZReadOnlyQuery;
    dsGdg: TDataSource;
    zqrGdg: TZReadOnlyQuery;
    cxtbSPKColumn3: TcxGridDBColumn;
    cxtbSPKColumn4: TcxGridDBColumn;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxlbNoSPK: TcxLabel;
    cxColQtyProdKG: TcxGridColumn;
    cxColIdBrg: TcxGridDBColumn;
    cxColIdSatBJ: TcxGridColumn;
    cxtbSPKColumn5: TcxGridDBColumn;
    cxtbSPKColumn6: TcxGridDBColumn;
    cxtbSPKColumn7: TcxGridDBColumn;
    procedure btnProsesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxtbHslProdDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure cxtbHslProdDataControllerNewRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure cxtbSPKFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxtbHslProdDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxtbHslProdDataControllerBeforeDelete(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputHasilProduksi: TfrmInputHasilProduksi;

implementation

uses unDM, unTools;

{$R *.dfm}

procedure TfrmInputHasilProduksi.btnProsesClick(Sender: TObject);
begin
  inherited;
  with zqrSPK do begin
    Close;
    ParamByName('tgl1').AsDate := cxdTgl1.Date;
    ParamByName('tgl2').AsDate := cxdTgl2.Date;
    Open;
  end;
end;

procedure TfrmInputHasilProduksi.cxtbHslProdDataControllerAfterPost(
  ADataController: TcxCustomDataController);
var
  q, qh: TZQuery;
  i, j: integer;
  sNoBukti: string;
  dt: TDateTime;
  yy, mm, dd : Word;
begin
  inherited;
  try
    Screen.Cursor := crSQLWait;

    dm.zConn.StartTransaction;

    i := ADataController.GetFocusedRecordIndex;
    j := cxtbSPK.DataController.GetFocusedRecordIndex;

    sNoBukti := GetLastFak('hasil-produksi');
    UpdateFaktur(Copy(sNoBukti,1,8));
    q := OpenRS('SELECT * FROM tbl_hsl_prd WHERE id_spk = %s',
      [zqrSPK.FieldByName('id').AsString]);
    q.Insert;
    q.FieldByName('id_spk').AsInteger := zqrSPK.FieldByName('id').AsInteger;
    q.FieldByName('no_bukti').AsString := sNoBukti;
    q.FieldByName('no_spk').AsString := sNoBukti;
    q.FieldByName('tanggal').AsDateTime := ADataController.Values[i, cxColJam1.Index];
    q.FieldByName('jam1').AsDateTime := ADataController.Values[i, cxColJam1.Index];
    q.FieldByName('jam2').AsDateTime := ADataController.Values[i, cxColJam2.Index];
    q.FieldByName('shift').AsInteger := ADataController.Values[i, cxColShift.Index];
    q.FieldByName('id_mesin').AsInteger := ADataController.Values[i, cxColMesin.Index];
    q.FieldByName('operator').AsString := ADataController.Values[i, cxColOperator.Index];
    q.FieldByName('qty_prod').AsFloat := ADataController.Values[i, cxColQtyProd.Index];
    q.FieldByName('qty_prod_kg').AsFloat := ADataController.Values[i, cxColQtyProdKG.Index];
    q.FieldByName('id_satuan').AsInteger := zqrSPK.FieldByName('id_satuan').AsInteger;
    q.FieldByName('id_gdg').AsInteger := ADataController.Values[i, cxColGdgBJ.Index];
    q.FieldByName('user').AsString := Aplikasi.NamaUser;
    q.FieldByName('user_dept').AsString := Aplikasi.UserDept;
    q.FIeldByName('id_so').AsInteger := zqrSPK.FieldByname('id_so').AsInteger;
    q.FieldByName('id_brg').AsInteger := zqrSPK.FieldByName('id_brg').AsInteger;
    q.FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
    ADataController.Values[i, cxColStatus.Index] := 1;
    q.Post;
    q.Close;

    qh := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''',[sNoBukti]);
    qh.Insert;
    qh.FieldByName('no_bukti').AsString := sNobukti;
    qh.FieldByName('tanggal').AsDateTime := ADataController.Values[i, cxColJam1.Index]; 
    qh.FieldByName('kode_brg').AsString := zqrSPK.FieldByName('kode_brg').AsString;
    qh.FieldByName('id_brg').AsInteger := zqrSPK.FieldByName('id_brg').AsInteger;
    qh.FieldByName('qty').AsFloat := ADataController.Values[i, cxColQtyProd.Index];
    //qh.FieldByName('id_satuan').AsInteger := zqrSPK.FieldByName('id_satuan').AsInteger;
    qh.FieldByName('id_satuan').AsInteger := zqrSPK.FieldByName('id_satuan_bj').AsInteger;
    qh.FieldByName('id_gdg').AsInteger := ADataController.Values[i, cxColGdgBJ.Index];
    qh.FieldByName('id_spk').AsInteger := zqrSPK.FieldByName('id').AsInteger;
    qh.FieldByName('id_so').AsInteger := zqrSPK.FieldByName('id_so').AsInteger;
    qh.FieldbyName('tipe').AsString := 'i';
    qh.FieldByName('tgl_input').AsDateTime := Aplikasi.NowServer;
    qh.FieldbyName('user').AsString := Aplikasi.NamaUser;
    qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
    qh.FieldByName('tgl_input').AsDateTime := Aplikasi.NowServer;
    qh.Post;
    qh.Close;

    q := OpenRS('SELECT id, stok FROM tbl_barang WHERE id = %d',[zqrSPK.FieldByName('id_brg').AsInteger]);
    q.Edit;
    q.FieldByName('stok').AsFloat := q.FieldByName('stok').AsFloat + ADataController.Values[i, cxColQtyProd.Index];
    q.Post;

    q := OpenRS('SELECT id_brg, id_gdg, stok FROM tbl_barang_det WHERE id_brg = %s AND id_gdg = %s',
      [zqrSPK.FieldByName('id_brg').AsString, ADataController.Values[i, cxColGdgBJ.Index]]);
    if not q.IsEmpty then
      q.Edit
    else
      q.Insert;
    q.FieldByName('id_brg').AsInteger := zqrSPK.FieldByName('id_brg').AsInteger;
    q.FieldByName('id_gdg').AsInteger := ADataController.Values[i, cxColGdgBJ.Index];
    q.FieldByName('stok').AsFloat := q.FieldByName('stok').AsFloat + ADataController.Values[i, cxColQtyProd.Index];
    q.Post;
    
    dm.zConn.Commit;

    Screen.Cursor := crDefault;
  except
    on E: Exception do begin
      dm.zConn.Rollback;
      Screen.Cursor := crDefault;
      MsgBox('Error: ' + E.Message);
    end;
  end;

end;

procedure TfrmInputHasilProduksi.cxtbHslProdDataControllerBeforeDelete(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  inherited;
  if ADataController.Values[ARecordIndex, cxColStatus.Index] = 1 then Abort;
end;

procedure TfrmInputHasilProduksi.cxtbHslProdDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i: integer;
  berr: boolean;
begin
  inherited;
  i := ADataController.GetFocusedRecordIndex;

  berr := true;
  with ADataController do begin
    if VarIsNull(Values[i, cxColJam1.Index]) then berr := false;
    if VarIsNull(Values[i, cxColJam2.Index]) then berr := false;
    if VarIsNull(Values[i, cxColShift.Index]) then berr := false;
    if VarIsNull(Values[i, cxColMesin.Index]) then berr := false;
    if VarIsNull(Values[i, cxColQtyProd.Index]) then berr := false;
    if VarIsNull(Values[i, cxColQtyProdKG.Index]) then berr := false;
    
  end;
  if not berr then begin
    MsgBox('Mohon lengkapi inputan yang masih kosong.');
    Abort;
  end;

  if ADataController.Values[i, cxColStatus.Index] = 1 then Abort;

end;
procedure TfrmInputHasilProduksi.cxtbHslProdDataControllerNewRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
var
  q: TZQuery;
begin
  inherited;
  ADataController.Values[ARecordIndex, cxColGdgBJ.Index] := Aplikasi.GdgBJ;
  //ADataController.Values[ARecordIndex, cxColSatBJ.Index] := zqrSPK.FieldByName('id_satuan').AsInteger;

  q := OpenRS('SELECT id_satuan FROM tbl_barang WHERE id = %d',[zqrSPK.FieldByName('id_brg').AsInteger]);
  ADataController.Values[ARecordIndex, cxColSatBJ.Index] := q.FieldByName('id_satuan').AsInteger;
  q.Close;

  ADataController.Values[ARecordIndex, cxColStatus.Index] := 0;
end;

procedure TfrmInputHasilProduksi.cxtbSPKFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  q: TZQuery;
  i: integer;
begin
  inherited;
  try
    with cxtbHslProd.DataController do begin
      RecordCount := 0;
      q := OpenRS('SELECT a.*, b.satuan satuan2 ' +
        'FROM tbl_hsl_prd a ' +
        'LEFT JOIN tbl_satuan b ON b.id = a.id_satuan WHERE id_spk = %d',
        [zqrSPK.FieldByName('id').AsInteger]);
      while not q.Eof do begin
        i := AppendRecord;
        Values[i, cxColJam1.Index] := q.FieldByName('jam1').AsDateTime;
        Values[i, cxColJam2.Index] := q.FieldByName('jam2').AsDateTime;
        Values[i, cxColShift.Index] := q.FieldByName('shift').AsInteger;
        Values[i, cxColMesin.Index] := q.FieldByName('id_mesin').AsInteger;
        Values[i, cxColOperator.Index] := q.FieldByName('operator').AsString;
        Values[i, cxColQtyProd.Index] := q.FieldByName('qty_prod').AsFloat;
        Values[i, cxColSatBJ.Index] := zqrSPK.FieldByName('id_satuan_bj').AsInteger;
        Values[i, cxColGdgBJ.Index] := q.FieldByName('id_gdg').AsInteger;
        Values[i, cxColQtyProdKG.Index] := q.FieldByName('qty_prod_kg').AsFloat;
        Values[i, cxColStatus.Index] := 1;
        q.Next;
      end;
      q.Close;
    end;
    cxlbNoSPK.Caption := zqrSPK.FieldByName('no_spk').AsString;
  except

  end;
end;

procedure TfrmInputHasilProduksi.FormCreate(Sender: TObject);
begin
  inherited;
  zqrSatuan.Open;
  zqrMesin.Open;
  zqrGdg.Open;
  cxdTgl1.Date := unTools.FDOM(Aplikasi.TanggalServer);
  cxdTgl2.Date := unTools.LDOM(Aplikasi.TanggalServer);
end;

end.
