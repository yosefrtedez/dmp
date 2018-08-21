unit unFrmInputSOMTS;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxLabel,
  cxTextEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ZAbstractRODataset, ZDataset, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMaskEdit, cxCalendar, cxSpinEdit, cxButtonEdit,
  cxCheckBox;

type
  TfrmInputSOMTS = class(TfrmTplInput)
    Label1: TLabel;
    cxtNoSO: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxlbl2: TcxLabel;
    cxdTanggal: TcxDateEdit;
    zqrSales: TZReadOnlyQuery;
    dsSales: TDataSource;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    cxGrid2: TcxGrid;
    cxtbMTS: TcxGridTableView;
    cxColNo2: TcxGridColumn;
    cxColKode2: TcxGridColumn;
    cxColDeskripsi2: TcxGridColumn;
    cxColQty2: TcxGridColumn;
    cxColSatuan2: TcxGridColumn;
    cxColKeterangan2: TcxGridColumn;
    cxColIdSatuan2: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    cxColKodeBrg2: TcxGridColumn;
    cxLabel2: TcxLabel;
    cxtKeterangan: TcxTextEdit;
    cxColQtyProd: TcxGridColumn;
    cxColSatProd: TcxGridColumn;
    procedure FormShow(Sender: TObject);
    procedure cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxTblSODataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure btnSimpanClick(Sender: TObject);
    procedure ClearAll;
    procedure cxColKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxChkMTSClick(Sender: TObject);
    procedure cxtbMTSDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxtbMTSDataControllerBeforePost(
      ADataController: TcxCustomDataController);
  private
    mJenisSO: string;
  public
    property JenisSO: string read mJenisSO write mJenisSO;
  end;

var
  frmInputSOMTS: TfrmInputSOMTS;

implementation

uses
  unDM, unTools, unFrmLstSO, unFrmCari;

{$R *.dfm}

procedure TfrmInputSOMTS.btnSimpanClick(Sender: TObject);
var
  q,z,qmo,qCekMO : TZQuery ;
  ID, i,j : integer;
  sNoTrs,sNoMO : string;
  tbl_tmp: TZTable;
begin


  if (cxtbMTS.DataController.EditState = [dceInsert, dceModified]) or
    (cxtbMTS.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.');
    Abort;
  end;

  for i := 0 to cxtbMTS.DataController.RecordCount - 1 do begin
    if VarIsNull(cxtbMTS.DataController.Values[i, cxColQty2.Index]) then begin
      MsgBox('Qty masih ada yang kosong.');
      Abort;
    end;
  end;

  //Cek Status SO
  q := OpenRS('SELECT * FROM tbl_so_head WHERE no_bukti = ''%s''',[cxtNoSO.Text]);
  if not q.IsEmpty then begin
    if q.FieldByName('f_completed').AsInteger = 1 then begin
      MsgBox('SO ini sudah komplit / selesai. Tidak bisa di edit.');
      q.Close;
      Abort;
    end;
  end;
  q.Close;

  try
    dm.zConn.StartTransaction;

    if Self.Jenis = 'T' then begin
      sNoTrs := GetLastFak('mts');
      UpdateFaktur(Copy(sNoTrs,1,8));
    end
    else begin
      sNoTrs := cxtNoSO.Text;
    end;

    // header SO
    q := OpenRS('SELECT * FROM tbl_so_head where no_bukti =''%s''',[sNoTrs]);

    if Self.Jenis = 'T' then
      q.Insert
    else begin
      q.Edit;
      ID := q.FieldByName('id').AsInteger;
    end;

    with q do begin
      FieldByName('no_bukti').AsString          := cxtNoSO.Text;
      FieldByName('tanggal').AsDateTime         := cxdTanggal.EditValue;
      FieldByName('tanggal').AsDateTime         := cxdTanggal.Date;
      if self.Jenis = 'T' then begin
        FieldByName('user').AsString          := aplikasi.NamaUser;
        FieldByName('tgl_input').AsDateTime   := aplikasi.TanggalServer;
        FieldByName('f_revisi').AsInteger     := 0;
      end;
      if Self.Jenis = 'E' then begin
        FieldByName('user_edit').AsString     := aplikasi.NamaUser;
        FieldByName('tgl_edit').AsDateTime    := aplikasi.TanggalServer;
        FieldByName('f_revisi').AsInteger     := 1;
      end;
      Post;
    end;

    // detail SO
    if Self.Jenis = 'E' then begin
      dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_so_det WHERE id_ref = %d',[ID]));
      dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_mo WHERE id_so = %d',[ID]));
    end;

    if Self.Jenis = 'T' then ID := LastInsertID;

    with cxtbMTS.DataController  do begin
      for i := 0 to RecordCount -1 do begin
        z := OpenRS('SELECT * FROM tbl_so_det where no_bukti =''%s''',[sNoTrs]) ;
        z.Insert;
        z.FieldByName('no_bukti').AsString      := sNoTrs;
        z.FieldByname('id_ref').AsInteger       := ID;
        z.FieldByName('kode_brg').AsString      := Values[i, cxColKodeBrg2.index];
        z.FieldByName('id_brg').AsInteger       := Values[i, cxColDeskripsi2.Index];
        z.FieldByName('qty').AsFloat            := Values[i, cxColQty2.Index];
        z.FieldByName('satuan').AsString        := Values[i, cxColSatuan2.Index];
        z.FieldByName('id_satuan').AsInteger    := Values[i, cxColIdSatuan2.Index];
        z.FieldByName('keterangan').AsString    := VarToStr(Values[i, cxColKeterangan2.Index]);
        z.Post;
        z.Close;

        sNoMO := GetLastFak('master_order');
        UpdateFaktur(Copy(sNoMO,1,7));

        qmo := OpenRS('SELECT * FROM tbl_mo WHERE id_so = %d', [ID]);
        with qmo do begin
          Insert;
          FieldByName('no_mo').AsString     := sNoMO;
          FieldByName('no_so').AsString     := sNoTrs;
          FieldByName('id_so').AsInteger    := ID;
          FieldByName('kode_brg').AsString  := Values[i, cxColKodeBrg2.index];
          FieldByName('id_brg').AsInteger   := Values[i, cxColDeskripsi2.Index];
          FieldByName('qty_mo').AsFloat     := Values[i, cxColQty2.Index];
          FieldByName('qty_so').AsFloat     := Values[i, cxColQty2.Index];
          FieldByName('jenis').AsString     := 'BJ';
          FieldByName('keterangan').AsString := VarToStr(Values[i, cxColKeterangan2.Index]);
          Post;
        end;

      end;
    end;

    dm.zConn.Commit;

    MsgBox('Sales Order MTS sudah disimpan dengan nomor : ' + sNoTrs);

    if Assigned(Self.FormInduk) then
      (Self.FormInduk as TfrmLstSO).btnRefreshClick(nil);

    btnBatalClick(nil);
    inherited;
  except
    on E: Exception do begin
      MsgBox('Error: ' + E.Message);
      dm.zConn.Rollback;
    end;
   end;

end;

procedure TfrmInputSOMTS.ClearAll;
var
  i: Integer;
begin
  for i := 0 to ComponentCount  - 1 do
  begin
    if Components[i] is TcxTextEdit then
      (Components[i] as TcxTextEdit).Text := '';
    if Components[i] is TcxSpinEdit then
      (Components[i] as TcxSpinEdit).Value := 0;
    if Components[i] is TcxLookupComboBox then
      (Components[i] as TcxLookupComboBox).Text := ''
  end;
end;

procedure TfrmInputSOMTS.cxChkMTSClick(Sender: TObject);
begin
  inherited;
  {
  if cxChkMTS.Checked then begin
    cxlCust.Enabled := False;
    cxlSales.Enabled := False;
    cxtPO.Enabled := False;
    cxtNoSO.Text := GetLastFak('mts');
    cxGrid1.Visible := False;
    cxGrid2.Visible := True;
    GroupBox1.Visible := False;
  end
  else begin
    cxlCust.Enabled := True;
    cxlSales.Enabled := True;
    cxtPO.Enabled := True;
    cxtNoSO.Text := GetLastFak('sales_order');
    cxGrid2.Visible := False;
    cxGrid1.Visible := True;
    GroupBox1.Visible := True;
  end;
  }
end;

procedure TfrmInputSOMTS.cxColKodePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  f: TFrmCari;
begin
  inherited;
  f := TfrmCari.Create(Self);
  f.Jenis := 'barang';
  f.ShowModal;
end;

procedure TfrmInputSOMTS.cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var
  Row: Integer;
begin
  inherited;
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;

procedure TfrmInputSOMTS.cxTblSODataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  i : Integer;
  z,q : TZQuery;
begin
  inherited;
  {
   if AItemIndex = cxColDeskripsi.Index then begin
      try
        cxTblSO.BeginUpdate;
        q := OpenRS('SELECT a.kode, a.id_satuan, b.satuan FROM tbl_barang a ' +
          'LEFT JOIN tbl_satuan b ON a.id_satuan = b.id ' +
          'WHERE a.id = %s',[ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
        ADataController.Values[ARecordIndex, cxColKode.Index] := q.FieldByname('kode').AsString;
        ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan').AsString;
        ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
        q.Close;
      finally
        cxTblSO.EndUpdate;
      end;
   end
   else if (AItemIndex = cxColHarga.Index) or (AItemIndex = cxColQty.Index) then begin
      try
        cxTblSO.BeginUpdate;
        ADataController.Values [ARecordIndex, cxColGross.Index] :=
        ADataController.Values [ARecordIndex, cxColQty.Index] *
        ADataController.Values [ARecordIndex, cxColHarga.Index] ;

        ADataController.Values[ARecordIndex, cxColDiscAmount.Index] := 0 ;
      finally
        cxTblSO.EndUpdate;
      end;
   end
   else if AItemIndex = cxColDisc.Index then begin
       try
        cxTblSO.BeginUpdate;
        ADataController.Values[ARecordIndex, cxColDiscAmount.Index] :=
        (ADataController.Values [ARecordIndex, cxColGross.Index]*
        ADataController.Values [ARecordIndex, cxColDisc.Index])/100 ;
      finally
        cxTblSO.EndUpdate;
      end;
   end;
   }
end;

procedure TfrmInputSOMTS.cxtbMTSDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
  sa: real;
begin
  inherited;
  i := ADataController.FocusedRowIndex;
  k := ADataController.GetEditingRecordIndex;
  v := ADataController.Values[i, cxColKode2.Index];

  for j := 0 to ADataController.RecordCount - 1 do begin
    if j <> k then begin
      if v = ADataController.Values[j, cxColKode2.Index] then begin
        MsgBox('Item tersebut sudah ada.');
        ADataController.DeleteRecord(i);
        Abort
      end;
    end;
  end;

end;

procedure TfrmInputSOMTS.cxtbMTSDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  i : Integer;
  z,q : TZQuery;
  r: real;
  sat: string;
begin
  inherited;
  if AItemIndex = cxColKode2.Index then begin
    try
      cxtbMTS.BeginUpdate;
      q := OpenRS('SELECT a.kode, a.id_satuan, b.satuan FROM tbl_barang a ' +
        'LEFT JOIN tbl_satuan b ON a.id_satuan = b.id ' +
        'WHERE a.id = %s',[ADataController.Values[ARecordIndex, AItemIndex]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg2.Index] := q.FieldbyName('kode').AsString;
      ADataController.Values[ARecordIndex, cxColDeskripsi2.Index] := ADataController.Values[ARecordIndex, AItemindex];
      ADataController.Values[ARecordIndex, cxColSatuan2.Index] := q.FieldByName('satuan').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan2.Index] := q.FieldByName('id_satuan').AsInteger;
      q.Close;
    finally
      cxtbMTS.EndUpdate;
    end;
  end;

  if AItemIndex = cxColDeskripsi2.Index then begin
    try
      cxtbMTS.BeginUpdate;
      q := OpenRS('SELECT a.kode, a.id_satuan, b.satuan FROM tbl_barang a ' +
        'LEFT JOIN tbl_satuan b ON a.id_satuan = b.id ' +
        'WHERE a.id = %s',[ADataController.Values[ARecordIndex, cxColDeskripsi2.Index]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg2.Index] := q.FieldByName('kode').AsString;
      ADataController.Values[ARecordIndex, cxColKode2.Index] := ADataController.Values[ARecordIndex, AItemIndex];
      ADataController.Values[ARecordIndex, cxColSatuan2.Index] := q.FieldByName('satuan').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan2.Index] := q.FieldByName('id_satuan').AsInteger;
      q.Close;
    finally
      cxtbMTS.EndUpdate;
    end;
  end;

  if AItemIndex = cxColQty2.index then begin
    try
      if ADataController.Values[ARecordIndex, cxColIdSatuan2.Index] <> Aplikasi.SatProd then begin
        r := GetKonversiSat(ADataController.Values[ARecordIndex, cxColKode2.Index], Aplikasi.SatProd);
        ADataController.Values[ARecordIndex, cxColQtyProd.Index] :=
          ADataController.Values[ARecordIndex, AItemIndex] * r;
        q := OpenRS('SELECT satuan FROM tbl_satuan WHERE id = %d',[Aplikasi.SatProd]);
        ADataController.Values[ARecordIndex, cxColSatProd.Index] := q.FieldByname('satuan').AsString;
        q.Close;
      end;
    finally

    end;
  end;

end;


procedure TfrmInputSOMTS.FormShow(Sender: TObject);
var
  q,z : TZQuery;
  i : Integer ;
  sNoTrs : string;
begin
  inherited;
  zqrSales.Open;
  zqrBarang.Open;

  cxGrid2.Visible := True;

  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('mts');
    cxtNoSo.Text := sNoTrs;
    cxdTanggal.Date := Aplikasi.Tanggal;
  end
  else if Self.Jenis= 'E' then begin

    Label1.Caption := 'Edit Sales Order';
    q := OpenRS('SELECT * FROM tbl_so_head WHERE id =%s', [Self.EditKey] );
    cxTbMTS.DataController.OnRecordChanged := nil;

    with q do begin
      cxtNoSO.Text                  := FieldByName('no_bukti').AsString;
      cxdTanggal.EditValue          := FieldByName('tanggal').AsDateTime;

      z := OpenRS('SELECT a.*, c.kode kode_brg2, b.satuan satuan2 FROM tbl_so_det a ' +
        'LEFT JOIN tbl_satuan b ON a.id_satuan = b.id ' +
        'LEFT JOIN tbl_barang c ON c.id = a.id_brg ' +
        'where id_ref = %s order by no asc',[Self.EditKey]) ;
      while not z.Eof do begin
        cxGrid2.BeginUpdate;
        with cxtbMTS.DataController do begin
          i := AppendRecord ;
          Values[i, cxColKode2.index]        := z.FieldByName('id_brg').AsString;
          Values[i, cxColKodeBrg2.Index] := z.FieldByname('kode_brg2').AsString;
          Values[i, cxColDeskripsi2.Index]   := z.FieldByName('id_brg').AsInteger;
          Values[i, cxColQty2.Index]         := z.FieldByName('qty').AsFloat ;
          Values[i, cxColSatuan2.Index]      := z.FieldByName('satuan2').AsString ;
          Values[i, cxColKeterangan2.Index] := z.FieldByName('keterangan').AsString;
          Values[i, cxColIdSatuan2.Index]    := z.FieldByName('id_satuan').AsString;
        end;
        cxGrid2.EndUpdate;
        z.Next;
      end;
      z.Close;
    end;
    cxtbMTS.DataController.OnRecordChanged := Self.cxTblSODataControllerRecordChanged;
  end;

end;

end.
