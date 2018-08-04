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
    procedure btnProsesClick(Sender: TObject);
    procedure cxtbSPKFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure cxtbBomDetDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure cxtbBomDetDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxtbBomDetDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxtbBOMFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxtbBomDetDataControllerNewRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
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
  q, qh: TZQuery;
  i, j: integer;
  sNoBukti: string;
begin
  inherited;
  try
  i := ADataController.GetFocusedRecordIndex;
  j := cxtbBOM.DataController.GetFocusedRecordIndex;

  sNoBukti := GetLastFak('pengambilan-bb');
  UpdateFaktur(Copy(sNoBukti,1,8));
  q := OpenRS('SELECT * FROM tbl_trspengambilanbb WHERE id_spk = %s AND id_brg = %s',
    [zqrSPK.FieldByName('id').AsString, cxtbBOM.DataController.Values[j, cxColIdBrg.Index]]);
  q.Insert;
  q.FieldByName('no_bukti').AsString := sNoBukti;
  q.FieldByName('tanggal').AsDateTime := ADataController.Values[i, cxColTanggal.Index];
  q.FieldByName('jam').AsDateTime := ADataController.Values[i, cxColJam.Index];
  q.FieldByName('id_spk').AsInteger := zqrSPK.FieldByName('id').AsInteger;
  q.FieldByName('id_brg').AsInteger := cxtbBOM.DataController.Values[j, cxColIdBrg.Index];
  q.FieldByName('qty').AsFloat := ADataController.Values[i, cxColQtyInput.Index];
  q.FieldByName('operator').AsString := ADataController.Values[i, cxColOperator.INdex];
  q.FieldByName('id_gdg').AsInteger := ADataController.Values[i, cxColGdg.Index];
  q.FieldByName('id_satuan').AsInteger := cxtbBOM.DataController.Values[j, cxColIdSatuan.Index];
  ADataController.Values[i, cxColStatus.Index] := 1;
  q.Post;
  q.Close;

  qh := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''',[sNoBukti]);
  qh.Insert;
  qh.FieldByName('no_bukti').AsString := sNobukti;
  qh.FieldByName('tanggal').AsString :=  ADataController.Values[i, cxColTanggal.Index];
  qh.FieldByName('kode_brg').AsString := cxtbBOM.DataController.Values[j, cxColKodeBrg.Index];
  qh.FieldByName('id_brg').AsInteger := cxtbBOM.DataController.Values[j, cxColIdBrg.Index];
  qh.FieldByName('qty').AsFloat := ADataController.Values[i, cxColQtyInput.Index];
  qh.FieldByName('id_satuan').AsInteger := cxtbBOM.DataController.Values[j, cxColIdSatuan.Index];
  qh.FieldByName('id_gdg').AsInteger := ADataController.Values[i, cxColGdg.Index];
  qh.Post;
  qh.Close;

  except
  end;

end;

procedure TfrmPengambilanBahanBaku.cxtbBomDetDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i: integer;
begin
  inherited;
  i := ADataController.GetFocusedRecordIndex;
  if ADataController.Values[i, cxColStatus.Index] = 1 then Abort;

end;

procedure TfrmPengambilanBahanBaku.cxtbBomDetDataControllerNewRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  inherited;
  ADataController.Values[ARecordIndex, cxColGdg.Index] := Aplikasi.GdgBB;
end;

procedure TfrmPengambilanBahanBaku.cxtbBomDetDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
begin
  inherited;
  //if ADataController.Values[ARecordIndex, cxColStatus.Index] = 1 then Abort;
  
end;

procedure TfrmPengambilanBahanBaku.cxtbBOMFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  q: TZQuery;
  j,i: integer;
begin
  inherited;
  try
  j := cxtbBOM.DataController.GetFocusedRecordIndex;
  q := OpenRS('SELECT * FROM tbl_trspengambilanbb WHERE id_spk = %s AND id_brg = %s',
    [zqrSPK.FieldByName('id').AsString, cxtbBOM.DataController.Values[j, cxColIdBrg.Index]]);

  cxtbBomDet.DataController.RecordCount := 0;
  cxtbBomDet.BeginUpdate;
  while not q.Eof do begin
    with cxtbBomDet.DataController do begin
      i := AppendRecord;
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
  Except
  end;
end;

procedure TfrmPengambilanBahanBaku.cxtbSPKFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  q: TZQuery;
  i: integer;
begin
  inherited;
  try
  with cxtbBOM.DataController do begin
    RecordCount := 0;
    q := OpenRS('SELECT a.*, b.kode, b.deskripsi, c.satuan satuan2, ' +
      '(SELECT SUM(qty) FROM tbl_trspengambilanbb WHERE id_spk = a.id_spk AND id_brg = a.id_brg) qty_ambil ' +
      'FROM tbl_bom a ' +
      'LEFT JOIN tbl_barang b ON b.id = a.id_brg ' +
      'LEFT JOIN tbl_satuan c ON c.id = a.id_satuan WHERE id_spk = %d',
      [zqrSPK.FieldByName('id').AsInteger]);
    while not q.Eof do begin
      i := AppendRecord;
      Values[i, cxColKodeBrg.Index] := q.FieldByName('kode').AsString;
      Values[i, cxColDeskripsi.Index] := q.FieldByName('deskripsi').AsString;
      Values[i, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
      Values[i, cxColQtySPK.Index] := q.FieldByName('qty').AsFloat;
      Values[i, cxColDiambil.Index] := q.FieldByName('qty_ambil').AsFloat;
      Values[i, cxColIdBrg.Index] := q.FieldByName('id_brg').AsInteger;
      Values[i, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      q.Next;
    end;
    q.Close;
  end;
  finally

  end;
end;

procedure TfrmPengambilanBahanBaku.FormCreate(Sender: TObject);
begin
  inherited;
  cxdTgl1.Date := unTools.FDOM(Aplikasi.TanggalServer);
  cxdTgl2.Date := unTools.LDOM(Aplikasi.TanggalServer);
end;

end.
