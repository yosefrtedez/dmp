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
    cxgrdPP: TcxGrid;
    cxGrdTblPP: TcxGridTableView;
    cxColNo: TcxGridColumn;
    cxColKodeBrg: TcxGridColumn;
    cxColDeskripsi: TcxGridColumn;
    cxColQty: TcxGridColumn;
    cxColSatuan: TcxGridColumn;
    cxColKeterangan: TcxGridColumn;
    cxlbltemp: TcxLabel;
    cxColIdSatuan: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    {procedure cxgrdTblDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxgrdTblDataControllerBeforePost(
      ADataController: TcxCustomDataController);}
    procedure cxgrd1TableView1DataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxgrd1TableView1DataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure FormShow(Sender: TObject);
    procedure cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure btnSimpanClick(Sender: TObject);

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
  unDM, unFrmUtama, unTools, unAplikasi, unFrmCari, unFrmLstPP;

{$R *.dfm}



procedure TfrmInputPP.btnSimpanClick(Sender: TObject);
var
  i, ID: integer;
  f0: Boolean;
  qh, qd: TZQuery;
  sNoBukti: string;
begin
  inherited;

  if (cxGrdTblPP.DataController.EditState = [dceInsert, dceModified]) or (cxGrdTblPP.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.');
    Abort;
  end;

  with cxgrdTblPP.DataController do begin
    if RecordCount = 0 then begin
      MsgBox('Detail transaksi masih kosong.');
      Abort;
    end;

    f0 := False;
    for i  := 0 to RecordCount - 1 do begin
      //if (VarIsNull(Values[i, cxColKodeBrg.Index])) or (VarToStr(Values[i, cxColKodeBrg.Index]) = '') then begin
      if (VarToStr(Values[i, cxColKodeBrg.Index]) = '') then begin
        f0 := True;
        Break;
      end;
    end;
    if f0 then begin
      MsgBox('Kode barang masih kosong.');
      Abort;
    end;

    if Self.Jenis = 'T' then begin
      sNoBukti := GetLastFak('permintaan_pembelian');
      UpdateFaktur(Copy(sNoBukti,1,7));
    end
    else begin
      sNoBukti := cxtNoBukti.text;
    end;

    try
      dm.zConn.StartTransaction;
      qh := OpenRS('SELECT * FROM tbl_pp_head WHERE no_bukti = ''%s''',[sNoBukti]);
      if Self.Jenis = 'T' then begin
        qh.Insert;
      end else begin
        qh.Edit;
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_pp_det WHERE no_bukti = ''%s''',[sNoBukti]));
      end;

      qh.FieldByName('no_bukti').AsString := sNoBukti;
      qh.FieldByName('tanggal').AsDateTime := cxdTanggal.Date;
      qh.FieldByName('tgl_diperlukan').AsDateTime := cxdTglPerlu.Date;
      qh.FieldByName('diajukan_oleh').AsString := cxtDiajukan.Text;
      qh.FieldByName('diajukan_dept').AsString := cxtDepartemen.Text;
      qh.FieldByName('level_kebutuhan').AsString := cxCboLevel.Text;
      qh.FieldByName('user').AsString := Aplikasi.NamaUser;
      qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
      qh.FieldByName('tgl_input').AsDateTime := Aplikasi.Tanggal;
      qh.FieldByName('f_penawaran').AsInteger := 0;
      qh.FieldByName('f_po').AsInteger := 0;
      qh.FieldByName('f_app').AsInteger := 0;
      qh.FieldByName('jenis_fobj').AsString := 'st';
      if Self.Jenis = 'edit' then begin
        qh.FieldByName('f_edit').AsInteger := 1;
        qh.FieldByName('user_edit').AsString := Aplikasi.NamaUser;
        qh.FieldByName('tg_edit').AsDateTime := Aplikasi.Tanggal;
      end else begin
        qh.FieldByName('f_edit').AsInteger := 0;
      end;
      qh.Post;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      qd := OpenRS('SELECT * FROM tbl_pp_det WHERE no_bukti = ''%s''',[sNoBukti]);
      for i := 0 to cxgrdTblPP.DataController.RecordCount - 1 do begin
        qd.Insert;
        if Self.Jenis = 'T' then begin
          qd.FieldByName('id_ref').AsInteger := ID;
        end else begin
          qd.FieldByName('id_ref').AsString := qh.FieldByName('id').AsString;
        end;
        qd.FieldByName('no_bukti').AsString := sNoBukti;
        qd.FieldByName('kode_brg').AsString := Values[i, cxColKodeBrg.Index];
        qd.FieldByName('id_brg').AsInteger := Values[i, cxColDeskripsi.Index];
        qd.FieldByName('qty').AsFloat := Values[i, cxColQty.Index];
        qd.FieldByName('id_satuan').AsString := Values[i, cxColIdSatuan.Index];
        if VarIsNull(Values[i,cxColKeterangan.Index]) = True then begin
          qd.FieldByName('keterangan').AsString := '';
        end else begin
          qd.FieldByName('keterangan').AsString := Values[i, cxColKeterangan.Index];
        end;
        qd.Post;
      end;
      qh.Close;
      qd.Close;
      dm.zConn.Commit;

      if Assigned(Self.FormInduk) then
        (Self.FormInduk as TFrmLstPP).btnRefreshClick(nil);

      MsgBox('Transaksi permintaan pembelian sudah disimpan dengan No. Bukti : ' + sNoBukti);
      btnBatalClick(nil);
    except
      on E: Exception do begin
        dm.zConn.Rollback;
        MsgBox('Error: ' + E.Message);
      end;
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
        MsgBox('Kode barang tersebut sudah ada.');
        ADataController.DeleteRecord(i);
        Abort;
      end;
    end;
  end;

  if (VarIsNull(ADataController.Values[i, cxColKodeBrg.Index])) or
    (Trim(ADataController.Values[i, cxColKodeBrg.Index]) = '')  then begin
    MsgBox('Mohon masukkan kode barang.');
    Abort;
  end
  else if ADataController.Values[i, cxColQty.Index] <= 0 then begin
    MsgBox('Qty. PP tidak boleh nol atau minus.');
    Abort;
  end;

end;

procedure TfrmInputPP.cxgrd1TableView1DataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
  i: Integer ;
begin
  inherited;

  if AItemIndex = cxColDeskripsi.Index then begin
    try
      cxGrdTblPP.BeginUpdate;
      ADataController.Values[ARecordIndex, cxColKodeBrg.Index] :=  ADataController.Values[ARecordIndex, cxColDeskripsi.Index];
      q := OpenRS('SELECT a.kode, a.id_satuan, b.satuan FROM tbl_barang a ' +
        'LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',[ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg.Index] := q.FieldByName('kode').AsString;
      ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      q.Close;
      ADataController.Values[ARecordIndex, cxColqty.Index] := '1';
    finally
      cxGrdTblPP.EndUpdate;
    end;
  end;

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

    z := OpenRS('SELECT a.kode_brg, b.deskripsi, a.qty, c.satuan, a.id_satuan, a.keterangan, a.mata_uang ' +
      'FROM tbl_pp_det a left join tbl_barang b on a.kode_brg = b.kode ' +
      'LEFT JOIN tbl_satuan c ON c.id = a.id_satuan WHERE id_ref = %s',[Self.EditKey]);
    nomer := 1;

    cxGrdTblPP.DataController.OnRecordChanged := nil;
    while not z.Eof do begin
      with cxgrdTblPP.DataController do begin
        i := AppendRecord;
        Values[i, cxColNo.Index] := nomer;
        Values[i, cxColKodeBrg.Index] := z.FieldByName('kode_brg').AsString;
        Values[i, cxColDeskripsi.Index] := z.FieldByName('kode_brg').AsString;
        Values[i, cxColQty.Index] := z.FieldByName('qty').AsString;
        Values[i, cxColSatuan.Index] := z.FieldByName('satuan').AsString;
        Values[i, cxColIdSatuan.Index] := z.FieldByName('id_satuan').AsInteger;
        Values[i, cxColKeterangan.Index] := z.FieldByName('keterangan').AsString;
        nomer := nomer +1;
      end;
      z.Next;
    end;
    z.Close;
    cxGrdTblPP.DataController.OnRecordChanged :=  Self.cxgrd1TableView1DataControllerRecordChanged;

  end;
end;
end.
