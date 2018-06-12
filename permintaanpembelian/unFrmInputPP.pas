unit unFrmInputPP;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxDropDownEdit,
  cxGroupBox, cxRadioGroup, DB, ZAbstractRODataset, ZDataset, cxSpinEdit,
  cxTimeEdit, cxMaskEdit, cxCalendar, cxTextEdit, cxLabel, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGrid, cxDBData, cxGridDBTableView, Menus,
  cxButtons, cxLookupEdit, cxDBLookupEdit;

type
  TfrmInputPP = class(TfrmTplInput)
    Label1: TLabel;
    cxlbl1: TcxLabel;
    cxtNoBukti: TcxTextEdit;
    cxlbl2: TcxLabel;
    cxdTanggal: TcxDateEdit;
    cxlbl3: TcxLabel;
    cxdTglPerlu: TcxDateEdit;
    cxlbl5: TcxLabel;
    cxtDiajukan: TcxTextEdit;
    zqrPP: TZReadOnlyQuery;
    dsPP: TDataSource;
    cxrdgrp1: TcxRadioGroup;
    cxCboLevel: TcxComboBox;
    cxlbl6: TcxLabel;
    cxtDepartemen: TcxTextEdit;
    dsBarang: TDataSource;
    zqrBarang: TZReadOnlyQuery;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    cxgrdTblPP: TcxGridTableView;
    cxColNo: TcxGridColumn;
    cxColKodeBrg: TcxGridColumn;
    cxColDeskripsi: TcxGridColumn;
    cxColQty: TcxGridColumn;
    cxColSatuan: TcxGridColumn;
    cxColHarga: TcxGridColumn;
    cxColValuta: TcxGridColumn;
    cxColKeterangan: TcxGridColumn;
    cxColTotal: TcxGridColumn;
    cxlbltemp: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxgrdTblDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxgrdTblDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxgrd1TableView1DataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxgrd1TableView1DataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure FormShow(Sender: TObject);
    procedure cxgrdTblPPFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxgrdTblPPFocusedItemChanged(Sender: TcxCustomGridTableView;
      APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
  private
    { Private declarations }
    mStatus: string;
    procedure ClearAll;
  public
    { Public declarations }
  end;

var
  frmInputPP: TfrmInputPP;

implementation

uses
  unDM, unFrmUtama, unTools, unAplikasi, unFrmCari;

{$R *.dfm}



procedure TfrmInputPP.btnSimpanClick(Sender: TObject);
var
  in_head, in_det : TZTable;
  sNoTrs, s: string;
  i, ID : integer;
  b : Boolean;
  q, z : TZQuery;
begin
  inherited;
  if cxdTanggal.Date > cxdTglPerlu.Date then begin
    MsgBox('Tanggal perlu lebih kecil dari tanggal terbit permintaan pembelian');
    cxdTglPerlu.SetFocus;
    Abort;
  end;

  try

    DM.zConn.StartTransaction;
    if Self.Jenis = 'E' then begin
        sNoTrs := cxtNoBukti.Text;
    end
    else begin
        sNoTrs := GetLastFak('permintaan_pembelian');
        UpdateFaktur(Copy(sNoTrs,1,7));
      end;
    if Self.Jenis = 'E' then begin
      DM.zConn.ExecuteDirect('delete from tbl_pp_head where no_bukti = ''' + cxtNoBukti.Text + '''');
      DM.zConn.ExecuteDirect('delete from tbl_pp_det where no_bukti = ''' + cxtNoBukti.Text + '''');
    end;
    in_head := OpenTbl('tbl_pp_head');
    in_det := OpenTbl('tbl_pp_det');
    in_head.Insert;
    in_head.FieldByName('no_bukti').AsString := sNoTrs;
    in_head.FieldByName('tanggal').AsDateTime := cxdTanggal.Date;
    in_head.FieldByName('tgl_diperlukan').AsDateTime := cxdTglPerlu.Date;
    in_head.FieldByName('diajukan_oleh').AsString := cxtDiajukan.Text;
    in_head.FieldByName('diajukan_dept').AsString := cxtDepartemen.Text;
    in_head.FieldByName('level_kebutuhan').AsString := cxCboLevel.Text;
    in_head.FieldByName('user').AsString := Aplikasi.NamaUser;
    in_head.FieldByName('user_dept').AsString := Aplikasi.UserDept;
    in_head.FieldByName('tgl_input').AsDateTime := Aplikasi.Tanggal;
    in_head.FieldByName('f_penawaran').AsInteger := 0;
    in_head.FieldByName('f_po').AsInteger := 0;
    in_head.FieldByName('f_app').AsInteger := 0;
    in_head.FieldByName('jenis_fobj').AsString := 'st';
    if Self.Jenis = 'edit' then begin
      in_head.FieldByName('f_edit').AsInteger := 1;
      in_head.FieldByName('user_edit').AsString := Aplikasi.NamaUser;
      in_head.FieldByName('tg_edit').AsDateTime := Aplikasi.Tanggal;
    end else begin
      in_head.FieldByName('f_edit').AsInteger := 0;
    end;
    in_head.Post;
    in_head.Close;

    ID := LastInsertID;
    with cxgrdTblPP.DataController do begin
      for i := 0 to cxgrdTblPP.DataController.RecordCount - 1 do begin
        in_det.Insert;
        in_det.FieldByName('id_ref').AsInteger := ID;
        in_det.FieldByName('no_bukti').AsString := cxtNoBukti.Text;
        in_det.FieldByName('kode_brg').AsString := Values[i, cxColKodeBrg.Index];
        in_det.FieldByName('qty').AsFloat := Values[i, cxColQty.Index];
        in_det.FieldByName('satuan').AsString := Values[i, cxColSatuan.Index];
        if VarIsNull(Values[i,cxColKeterangan.Index]) = True then begin
          in_det.FieldByName('keterangan').AsString := '';
        end else begin
          in_det.FieldByName('keterangan').AsString := Values[i, cxColKeterangan.Index];
        end;
        in_det.FieldByName('mata_uang').AsString := Values[i, cxColValuta.Index];
        in_det.FieldByName('harga').AsFloat := Values[i, cxColHarga.Index];
        in_det.Post;
      end;
    end;
    in_det.Close;
    MsgBox('Data permintaan pembelian dengan nomer  ' + cxtNoBukti.Text + '  berhasil disimpan');

    DM.zConn.Commit;
    cxgrdTblPP.DataController.RecordCount := 0;
    btnBatalClick(nil);
    ClearAll;
  except
    on E : Exception do begin
      MsgBox('Error:' + e.message);
      DM.zConn.Rollback;
      Abort;
    end;
  end;

end;

procedure TfrmInputPP.ClearAll;
var
  i: Integer;
begin
   for i := 0 to ComponentCount - 1 do begin
    if Components[i].Tag = 1 then
      (Components[i] as TcxTextEdit).Text := '';
  end;
end;

procedure TfrmInputPP.cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
  var
  row : Integer;
begin
  inherited;
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;

procedure TfrmInputPP.cxgrd1TableView1DataControllerBeforePost(
  ADataController: TcxCustomDataController);
  var
  i : Integer;
begin
  inherited;
  i := ADataController.FocusedRowIndex;
  if (VarIsNull(ADataController.Values[i, cxColKodeBrg.Index])) or (Trim(ADataController.Values[i, cxColKodeBrg.Index]) = '') then begin
    MsgBox('kode barang harus diisi');
    Abort;
  end;

  if (VarIsNull(ADataController.Values[i, cxColHarga.Index])) or (Trim(ADataController.Values[i, cxColHarga.Index]) = '0') then begin
    MsgBox('harga masih kosoong');
    Abort;
  end;

end;

procedure TfrmInputPP.cxgrd1TableView1DataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
  var
  i : Integer;
  z, q : TZQuery;
begin
  inherited;
  if mStatus = '' then begin
    if AItemIndex = cxColDeskripsi.Index then begin
      try
        cxgrdTblPP.BeginUpdate;
        ADataController.Values[ARecordIndex, cxColKodeBrg.Index] := ADataController.Values[ARecordIndex, cxColDeskripsi.Index];
        cxlbltemp.Caption := ADataController.Values[ARecordIndex, cxColKodeBrg.Index];
        ADataController.Values[ARecordIndex, cxcolqty.Index] := 1;
        ADataController.Values[ARecordIndex, cxColValuta.Index] := 'IDR';
        q := OpenRS('select * from tbl_barang where kode = ''%s''',[cxlbltemp.Caption]);
        with cxgrdTblPP.DataController do begin
          Values[i, cxColSatuan.Index] := q.FieldByName('satuan').AsString;
        end;
        q.Close;
      finally
        cxgrdTblPP.EndUpdate;
      end;
    end else if (AItemIndex = cxColQty.Index) or (AItemIndex = cxColHarga.Index) then  begin
      try
        cxgrdTblPP.BeginUpdate;
        ADataController.Values[ARecordIndex, cxColTotal.Index] := ADataController.Values[ARecordIndex, cxColQty.Index] * ADataController.Values[ARecordIndex, cxColHarga.Index];
      finally
        cxgrdTblPP.EndUpdate;
      end;
    end;
  end;
end;

procedure TfrmInputPP.cxgrdTblDataControllerBeforePost(
  ADataController: TcxCustomDataController);
  var
    i : Integer;
begin
  inherited;

end;

procedure TfrmInputPP.cxgrdTblDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);

  var
  q: TZQuery;
  t, t1, t2, t3 : Real;
  i: Integer ;
begin
  inherited;

end;

procedure TfrmInputPP.cxgrdTblPPFocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
  var
  i,p,r: integer;
begin
  inherited;
 { i := AFocusedItem.Index;
  p := APrevFocusedItem.Index;
  r := cxgrdTblPP.DataController.GetFocusedRecordIndex;

  with cxgrdTblPP.DataController do begin
    if p = cxColKodeBrg.Index then begin
      if not VarIsNull(Values[r, cxColKodeBrg.Index]) then Values[r, cxColKodeBrg.Index] := Values[r, cxColKodeBrg.Index];
    end;
    if p = cxColDeskripsi.Index then begin
      if not VarIsNull(Values[r, cxColDeskripsi.Index]) then Values[r, cxColDeskripsi.Index] := Values[r, cxColDeskripsi.Index];
    end;
    if p = cxColSatuan.Index then begin
      if not VarIsNull(Values[r, cxColSatuan.Index]) then Values[r, cxColSatuan.Index] := Values[r, cxColSatuan.Index];
    end;
  end; }
end;

procedure TfrmInputPP.cxgrdTblPPFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
  var
  i,j: integer;
begin
  inherited;

 { try
    i := AFocusedRecord.Index;
    j := APrevFocusedRecord.Index;
    with cxgrdTblPP.DataController do begin
      if not VarIsNull(Values[i, cxColKodeBrg.Index]) then
        Values[i, cxColKodeBrg.Index] := Values[i, cxColKodeBrg.Index];
      if not VarIsNull(Values[j, cxColDeskripsi.Index]) then
        Values[j, cxColDeskripsi.Index] := Values[j, cxColDeskripsi.Index];
    end;
  finally

  end;}
end;

procedure TfrmInputPP.FormCreate(Sender: TObject);
begin
  inherited;

  cxCboLevel.Properties.Items.Add('PENTING');
  cxCboLevel.Properties.Items.Add('MENDESAK');
  cxCboLevel.ItemIndex := 0;
  zqrPP.Open;
  zqrBarang.Open;
end;

procedure TfrmInputPP.FormShow(Sender: TObject);
  var
   q,z : TZQuery;
   i, nomer: integer;
   sNoTrs : string;
begin
  inherited;
  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('permintaan_pembelian');
    cxtNoBukti.Text := sNoTrs;
    cxdTanggal.Date := Aplikasi.Tanggal;
    cxdTglPerlu.Date := Aplikasi.Tanggal;
    cxtDiajukan.Text := Aplikasi.NamaUser;
    cxtDepartemen.Text := Aplikasi.UserDept;
  end
  else if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_pp_head WHERE id = ''%s''',[Self.EditKey]);
    cxtNoBukti.Text := q.FieldByName('no_bukti').AsString;
    cxdTanggal.Date := q.FieldByName('tanggal').AsDateTime;
    cxdTglPerlu.Date := q.FieldByName('tgl_diperlukan').AsDateTime;
    cxtDiajukan.Text := q.FieldByName('diajukan_oleh').AsString;
    cxtDepartemen.Text := q.FieldByName('diajukan_dept').AsString;
    cxCboLevel.Text := q.FieldByName('level_kebutuhan').AsString;
    q.Close;

    z := OpenRS('SELECT a.kode_brg, b.deskripsi, a.qty, b.satuan, a.keterangan, a.mata_uang, a.harga, (a.qty * a.harga) as total FROM tbl_pp_det a left join tbl_barang b on a.kode_brg = b.kode WHERE id_ref = ''%s''',[Self.EditKey]);
    nomer := 1;
    zqrBarang.Close;
    zqrBarang.Open;
    while not z.Eof do begin
      with cxgrdTblPP.DataController do begin
        i := AppendRecord;
        Values[i, cxColNo.Index] := nomer;
        Values[i, cxColKodeBrg.Index] := z.FieldByName('kode_brg').AsString;
        Values[i, cxColDeskripsi.Index] := z.FieldByName('kode_brg').AsString;
        Values[i, cxColQty.Index] := z.FieldByName('qty').AsString;
        Values[i, cxColSatuan.Index] := z.FieldByName('satuan').AsString;
        Values[i, cxColHarga.Index] := z.FieldByName('harga').AsFloat;
        Values[i, cxColValuta.Index] := z.FieldByName('mata_uang').AsString;
        Values[i, cxColTotal.Index] := z.FieldByName('total').AsString;
        nomer := nomer +1;
      end;
      z.Next;
    end;
    z.Close;

  end;
end;

end.
