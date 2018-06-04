unit unFrmInputJurnalUmum;

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
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridLevel, cxGrid, cxTextEdit, cxCheckBox, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxDBLookupComboBox, cxSpinEdit, DB, ZAbstractRODataset,
  ZDataset;

type
  TfrmInputJurnalUmum = class(TfrmTplInput)
    cxLabel2: TcxLabel;
    cxdTgl: TcxDateEdit;
    cxChkPosting: TcxCheckBox;
    cxtNoBukti: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxtKeterangan: TcxTextEdit;
    cxGrd: TcxGrid;
    cxGrdLevel1: TcxGridLevel;
    cxtbJurnalUmum: TcxGridTableView;
    cxColNoAkun: TcxGridColumn;
    cxColNamaAkun: TcxGridColumn;
    cxColDebet: TcxGridColumn;
    cxColKredit: TcxGridColumn;
    cxColKeterangan: TcxGridColumn;
    zqrAkun: TZReadOnlyQuery;
    dsAkun: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxColNoAkunPropertiesChange(Sender: TObject);
    procedure cxtbJurnalUmumFocusedItemChanged(Sender: TcxCustomGridTableView;
      APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxtbJurnalUmumDataControllerNewRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure cxColNoAkunPropertiesEditValueChanged(Sender: TObject);
    procedure cxtbJurnalUmumFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputJurnalUmum: TfrmInputJurnalUmum;

implementation

uses unTools, unDM;

{$R *.dfm}

procedure TfrmInputJurnalUmum.btnSimpanClick(Sender: TObject);
var
  t1, t2: real;
  i: integer;
  f0: Boolean;
  qh, qd: TZQuery;
  sNoBukti: string;
begin
  inherited;
  if Trim(cxdTgl.Text) = '' then begin
    MsgBox('Mohon isi tanggal transaksi.');
    cxdTgl.SetFocus;
  end
  else if Trim(cxtKeterangan.Text) = '' then begin
    MsgBox('Mohon isi keterangan transaksi.');
    cxtKeterangan.SetFocus;
  end
  else begin

    with cxtbJurnalUmum.DataController do begin

      f0 := False;
      for i  := 0 to RecordCount - 1 do begin
        if VarIsNull(Values[i, cxColNoAkun.Index]) then begin
          f0 := True;
          Break;
        end;
      end;
      if f0 then begin
        MsgBox('Mohon pilih No. Akun di detail transaksi.');
        Abort;
      end;

      f0 := False;
      for i  := 0 to RecordCount - 1 do begin
        if (Values[i, cxColDebet.Index] = 0) and (Values[i, cxColKredit.Index] = 0) then begin
          f0 := True;
          Break;
        end;
      end;
      if f0 then begin
        MsgBox('Nilai debet atau kredit ada yang masih 0.');
        Abort;
      end;

      f0 := False;
      for i := 0 to RecordCount - 1 do begin
        if VarIsNull(Values[i, cxColKeterangan.Index]) then begin
          f0 := True;
          Break;
        end;
      end;
      if f0 then begin
        MsgBox('Detail keterangan masih ada yang kosong.');
        Abort;
      end;

      t1 := 0; t2 := 0;
      for i := 0 to RecordCount - 1 do begin
        t1 := t1 + Values[i, cxColDebet.Index];
        t2 := t2 + Values[i, cxColKredit.Index];
      end;

      if t1 <> t2 then begin
        MsgBox('Nilai debet dan kredit tidak balance.');
        Abort;
      end;

      if Self.Jenis = 'T' then begin
        sNoBukti := GetLastFak('jurnal');
        UpdateFaktur(Copy(sNoBukti,1,6));
      end
      else begin
        sNoBukti := cxtNoBukti.text;
      end;

      try
        dm.zConn.StartTransaction;

        qh := OpenRS('SELECT * FROM tbl_jurnal_head WHERE no_jurnal = ''%s''',[sNoBukti]);

        if Self.Jenis = 'T' then begin
          qh.Insert;
        end else begin
          qh.Edit;
          dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_jurnal_det WHERE no_jurnal = ''%s''',[sNoBukti]));
        end;

        qh.FieldByName('no_jurnal').AsString := sNoBukti;
        qh.FieldByName('tanggal').AsDateTime := cxdTgl.Date;
        qh.FieldByName('keterangan').AsString := Trim(cxtKeterangan.Text);
        qh.FieldByName('user').AsString := Aplikasi.NamaUser;
        qh.Post;

        qd := OpenRS('SELECT * FROM tbl_jurnal_det WHERE no_jurnal = ''%s''',[sNoBukti]);
        for i := 0 to RecordCount - 1 do begin
          qd.Insert;
          qd.FieldByName('no_jurnal').AsString := sNoBukti;
          qd.FieldByName('akun').AsString := Values[i, cxColNoAkun.Index];
          qd.FieldByName('debet').AsFloat := Values[i, cxColDebet.Index];
          qd.FieldByName('kredit').AsFloat := Values[i, cxColKredit.Index];
          qd.FieldByName('keterangan').AsString := Values[i, cxColKeterangan.Index];
          qd.Post;
        end;

        qh.Close;
        qd.Close;

        dm.zConn.Commit;

        MsgBox('Transaksi jurnal umum sudah disimpan dengan No. Bukti : ' + sNoBukti);

      except
        on E: Exception do begin
          dm.zConn.Rollback;
          MsgBox('Error: ' + E.Message);
        end;
      end;
    end;
  end;
end;

procedure TfrmInputJurnalUmum.cxColNoAkunPropertiesChange(Sender: TObject);
var
  i: integer;
begin
  inherited;
  
end;

procedure TfrmInputJurnalUmum.cxColNoAkunPropertiesEditValueChanged(
  Sender: TObject);
var
  i: Integer;
begin
  inherited;
  {
  i := cxtbJurnalUmum.DataController.GetFocusedRecordIndex;
  MsgBox(cxtbJurnalUmum.DataController.Values[i, cxColNoAkun.Index]);
  }
end;

procedure TfrmInputJurnalUmum.cxtbJurnalUmumDataControllerNewRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  inherited;
  ADataController.Values[ARecordIndex, cxColDebet.Index] := 0;
  ADataController.Values[ARecordIndex, cxColKredit.Index] := 0;
end;

procedure TfrmInputJurnalUmum.cxtbJurnalUmumFocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
var
  i,p,r: integer;
begin
  inherited;
  i := AFocusedItem.Index;
  p := APrevFocusedItem.Index;
  r := cxtbJurnalUmum.DataController.GetFocusedRecordIndex;

  with cxtbJurnalUmum.DataController do begin
    if p = cxColNoAkun.Index then begin
      if not VarIsNull(Values[r, cxColNoAkun.Index]) then Values[r, cxColNamaAkun.Index] := Values[r, cxColNoAkun.Index];
    end;
    if p = cxColNamaAkun.Index then begin
      if not VarIsNull(Values[r, cxColNamaAkun.Index]) then Values[r, cxColNoAkun.Index] := Values[r, cxColNamaAkun.Index];
    end;
    if p = cxColDebet.Index then begin
      if Values[r, cxColDebet.Index] > 0 then Values[r, cxColKredit.Index] := 0;
    end;
    if p = cxColKredit.Index then begin
      if Values[r, cxColKredit.Index] > 0 then Values[r, cxColDebet.Index] := 0;
    end;
  end;

end;

procedure TfrmInputJurnalUmum.cxtbJurnalUmumFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  i,j: integer;
begin
  inherited;
  try
    i := AFocusedRecord.Index;
    j := APrevFocusedRecord.Index;
    with cxtbJurnalUmum.DataController do begin
      if not VarIsNull(Values[i, cxColNamaAkun.Index]) then
        Values[i, cxColNoAkun.Index] := Values[i, cxColNamaAkun.Index];
      if not VarIsNull(Values[j, cxColNamaAkun.Index]) then
        Values[j, cxColNoAkun.Index] := Values[j, cxColNamaAkun.Index];
    end;
  finally

  end;
end;

procedure TfrmInputJurnalUmum.FormCreate(Sender: TObject);
begin
  inherited;
  zqrAkun.Open;
  cxdTgl.Date := Aplikasi.TanggalServer;
end;

procedure TfrmInputJurnalUmum.FormShow(Sender: TObject);
var
  q: TZQuery;
  i: integer;
begin
  inherited;
  if Self.Jenis = 'T' then begin
    cxtNoBukti.Text := GetLastFak('jurnal');
  end
  else if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_jurnal_head WHERE no_jurnal = ''%s''',[Self.EditKey]);
    cxtNoBukti.Text := Self.EditKey;
    cxdTgl.Date := q.FieldByName('tanggal').AsDateTime;
    cxtKeterangan.Text := q.FieldByName('keterangan').AsString;
    q.Close;

    q := OpenRS('SELECT * FROM tbl_jurnal_det WHERE no_jurnal = ''%s''',[Self.EditKey]);
    while not q.Eof do begin
      with cxtbJurnalUmum.DataController do begin
        i := AppendRecord;
        Values[i, cxColNoAkun.Index] := q.FieldByName('akun').AsString;
        Values[i, cxColNamaAkun.Index] := q.FieldByName('akun').AsString;
        Values[i, cxColDebet.Index] := q.FieldByName('debet').AsFloat;
        Values[i, cxColKredit.Index] := q.FieldByName('kredit').AsFloat;
        Values[i, cxColKeterangan.Index] := q.FieldByName('keterangan').AsString;
      end;
      q.Next;
    end;
    q.Close;

  end;
end;

end.
