unit unFrmInputPenerimaanKas;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxLabel, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxSpinEdit, cxButtonEdit, ZDataset, ZAbstractRODataset, cxCheckBox;

type
  TfrmInputPenerimaanKas = class(TfrmTplInput)
    Label13: TLabel;
    cxLabel1: TcxLabel;
    cxtNoBukti: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxdTanggal: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxlAkunKas: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxtTerbilang: TcxTextEdit;
    cxsSebesar: TcxSpinEdit;
    cxtDari: TcxTextEdit;
    cxtNoAkun: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxtMemo: TcxTextEdit;
    cxtbPK: TcxGridTableView;
    cxColNoAkun: TcxGridColumn;
    cxColNamaAkun: TcxGridColumn;
    cxColJumlah: TcxGridColumn;
    cxColMemo: TcxGridColumn;
    zqrAkunDet: TZReadOnlyQuery;
    dsAkunDet: TDataSource;
    zqrAkunKas: TZReadOnlyQuery;
    dsAkunKas: TDataSource;
    cxChkPosting: TcxCheckBox;
    cxColNoAkun2: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxlAkunPropertiesEditValueChanged(Sender: TObject);
    procedure cxtbPKDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxtbPKDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxtbPKDataControllerAfterPost(
      ADataController: TcxCustomDataController);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputPenerimaanKas: TfrmInputPenerimaanKas;

implementation

uses unDM, unTools, unFrmLstPenerimaanKas;

{$R *.dfm}

procedure TfrmInputPenerimaanKas.btnSimpanClick(Sender: TObject);
var
  ID, i: Integer;
  sNoBukti: string;
  qh, qd: TZQuery;
begin

  if cxlAkunKas.Text = '' then begin
    MsgBox('Mohon pilih akun kas.');
    cxlAkunKas.SetFocus;
  end
  else if Trim(cxtDari.Text) = '' then begin
    MsgBox('Mohon isi pemberi dana (dari).');
    cxtDari.SetFocus;
  end
  else if Trim(cxtMemo.Text) = '' then begin
    MsgBox('Mohon isi Memo / Keterangan.');
    cxtMemo.SetFocus;
  end
  else begin

    if (cxtbPK.DataController.EditState = [dceEdit, dceModified]) or
      (cxtbPK.DataController.EditState = [dceInsert, dceModified]) then begin
      MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.');
      Abort;
    end;

    try
      dm.zConn.StartTransaction;

      if Self.Jenis = 'T' then begin
        sNoBukti := GetLastFak('penerimaan_kas');
        UpdateFaktur(Copy(sNoBukti,1,8));
      end
      else begin
        sNoBukti := cxtNoBukti.Text;
      end;

      qh := OpenRS('SELECT * FROM tbl_penerimaankas_head WHERE no_bukti = ''%s''',[sNoBukti]);
      if Self.Jenis = 'T' then
        qh.Insert
      else begin
        qh.Edit;
        ID := qh.FieldByName('id').AsInteger;
      end;

      with qh do begin
        FieldByName('no_bukti').AsString := sNoBukti;
        FieldByName('tanggal').AsDateTime := cxdTanggal.Date;
        FieldByName('akunkas').AsString := cxlAkunKas.EditValue;
        FieldByName('dari').AsString := Trim(cxtDari.Text);
        FieldByName('memo').AsString := Trim(cxtMemo.Text);
        FieldByName('sebesar').AsFloat := cxsSebesar.Value;
        Post;
      end;

      if Self.Jenis = 'T' then ID := LastInsertID;

      if Self.Jenis = 'E' then
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_penerimaankas_det WHERE id_ref = %d', [ID]));

      qd := OpenRS('SELECT * FROM tbl_penerimaankas_det WHERE id_ref = %d',[ID]);
      for i := 0 to cxtbPK.DataController.RecordCount - 1 do begin
        with cxtbPK.DataController do begin
          with qd do begin
            Insert;
            qd.FieldByName('id_ref').AsInteger := ID;
            qd.FieldByName('no_bukti').AsString := sNoBukti;
            qd.FieldByName('noakun').AsString := Values[i, cxColNoAkun2.Index];
            qd.FieldByName('jumlah').AsFloat := Values[i, cxColJumlah.Index];
            qd.FieldByName('memo').AsString := Values[i, cxColMemo.Index];
            qd.FieldByName('id_akun').AsInteger := Values[i, cxColNoAkun.Index];
            Post;
          end;
        end;
      end;

      MsgBox('Penerimaan kas sudah disimpan dengan nomor : ' + sNoBukti);

      dm.zConn.Commit;

      if Assigned(Self.FormInduk) then
        (Self.FormInduk as TFrmLstPenerimaanKas).btnRefreshClick(nil);

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

procedure TfrmInputPenerimaanKas.cxlAkunPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  try
    cxtNoAkun.Text := zqrAkunKas.FieldByName('noakun').AsString;
  except
  end;
end;

procedure TfrmInputPenerimaanKas.cxtbPKDataControllerAfterPost(
  ADataController: TcxCustomDataController);
var
  total: real;
  i: integer;
begin
  inherited;
  total := 0;
  for i := 0 to ADataController.RecordCount - 1 do begin
    total := total + ADataController.Values[i, cxColJumlah.Index];
  end;
  cxsSebesar.Value := total;
  cxtTerbilang.Text := Terbilang(IntToStr(cxsSebesar.EditValue));
end;

procedure TfrmInputPenerimaanKas.cxtbPKDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
begin
  inherited;
  i := ADataController.FocusedRowIndex;
  k := ADataController.GetEditingRecordIndex;

  if VarIsNull(ADataController.Values[i, cxColNoAkun.Index]) then begin
    MsgBox('No. Akun harus di isi.');
    Abort;
  end;

  if (VarIsNull(cxColJumlah.EditValue)) or (cxColJumlah.EditValue <= 0) then begin
    MsgBox('Jumlah pengeluaran harus di isi.');
    Abort;
  end;

  if (VarIsNull(cxColMemo.EditValue)) or (Trim(cxColMemo.EditValue) = '') then begin
    MsgBox('Memo / Keterangan detail transaksi harus di isi.');
    Abort;
  end;

end;

procedure TfrmInputPenerimaanKas.cxtbPKDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
begin
  inherited;
  if AItemIndex = cxColNoAkun.Index then begin
    ADataController.Values[ARecordIndex, cxColNamaAkun.Index] := ADataController.Values[ARecordIndex, AItemIndex];
    q := OpenRS('SELECT noakun FROM tbl_coa WHERE id = %s',[ADataController.Values[ARecordIndex, AItemIndex]]);
    ADataController.Values[ARecordIndex, cxColNoAkun2.Index] := q.FieldByName('noakun').AsString;
    q.Close;
  end;

  if AItemIndex = cxColNamaAkun.index then begin
    ADataController.Values[ARecordIndex, cxColNoAkun.Index] := ADataController.Values[ARecordIndex, AItemIndex];
    q := OpenRS('SELECT noakun FROM tbl_coa WHERE id = %s',[ADataController.Values[ARecordIndex, AItemIndex]]);
    ADataController.Values[ARecordIndex, cxColNoAkun2.Index] := q.FieldByName('noakun').AsString;
    q.Close;
  end;
end;

procedure TfrmInputPenerimaanKas.FormCreate(Sender: TObject);
begin
  inherited;
  zqrAkunKas.Open;
  zqrAkunDet.Open;
end;

procedure TfrmInputPenerimaanKas.FormShow(Sender: TObject);
var
  q: TZQuery;
  total: real;
  i: integer;
begin
  inherited;
  if Self.Jenis = 'T' then
    cxtNoBukti.Text := GetLastFak('penerimaan_kas')
  else begin
    q := OpenRS('SELECT * FROM tbl_penerimaankas_head WHERE id = %s', [Self.EditKey]);
    cxtNoBukti.Text := q.FieldByName('no_bukti').AsString;
    cxdTanggal.Date := q.FieldByName('tanggal').AsDateTime;
    cxlAkunKas.EditValue := q.FieldByName('akunkas').AsString;
    cxtDari.Text := q.FieldByName('dari').AsString;
    cxtMemo.Text := q.FieldByName('memo').AsString;
    q.Close;

    q := OpenRS('SELECT * FROM tbl_penerimaankas_det WHERE id_ref = %s',[Self.EditKey]);
    total := 0;
    cxtbPK.DataController.OnRecordChanged := nil;
    while not q.Eof do begin
      with cxtbPK.DataController do begin
        i := AppendRecord;
        Values[i, cxColNoAkun.Index] := q.FieldByName('noakun').AsString;
        Values[i, cxColNamaAkun.Index] := q.FieldByName('noakun').AsString;
        Values[i, cxColJumlah.Index] := q.FieldByName('jumlah').AsString;
        Values[i, cxColMemo.Index] := q.FieldByName('memo').AsString;
        total := total + q.FieldByName('jumlah').AsFloat;
      end;
      q.Next;
    end;
    cxsSebesar.Value := total;
    cxtTerbilang.Text := Terbilang(IntToStr(cxsSebesar.EditValue));
    cxtbPK.DataController.OnRecordChanged := Self.cxtbPKDataControllerRecordChanged;
    q.Close;
  end;
end;

end.
