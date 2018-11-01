unit unFrmSPK;

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
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, cxLabel, cxSpinEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit,
  cxCalendar, ZDataset, ZAbstractRODataset, ZAbstractDataset;

type
  TfrmSPK = class(TfrmTplInput)
    Label13: TLabel;
    cxLabel1: TcxLabel;
    cxtNoSO: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxtNoSPK: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel6: TcxLabel;
    cxtKodeBrg: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxtDeskripsi: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxdTglPrd: TcxDateEdit;
    cxlMesin: TcxLookupComboBox;
    cxsQtySPK: TcxSpinEdit;
    cxtNoMO: TcxTextEdit;
    zqrMesin: TZReadOnlyQuery;
    dsMesin: TDataSource;
    dsBrg: TDataSource;
    zqrBrg: TZReadOnlyQuery;
    cxtbBom: TcxGridTableView;
    cxColKodeBrg: TcxGridColumn;
    cxColDeskripsi: TcxGridColumn;
    cxColQty: TcxGridColumn;
    cxColSatuan: TcxGridColumn;
    cxColIdSatuan: TcxGridColumn;
    cxColId: TcxGridColumn;
    cxLabel9: TcxLabel;
    cxsQtySO: TcxSpinEdit;
    cxLabel10: TcxLabel;
    cxsToleransi: TcxSpinEdit;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxsTotalSPK: TcxSpinEdit;
    cxColKodeBrg2: TcxGridColumn;
    clblSat1: TcxLabel;
    cxLabel14: TcxLabel;
    cxsQtySOKG: TcxSpinEdit;
    clblSat2: TcxLabel;
    cxColStok: TcxGridColumn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxtbBomDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxtbBomDataControllerBeforePost(
      ADataController: TcxCustomDataController);
  private
    mIDSO: integer;
    mIDMO: integer;
    mIDSPK: Integer;
    mIdBrg: Integer;
    mEditable: boolean;
    mIdSatBJ: Integer;
    procedure CheckBrgSpk(id_brg: Integer);
  public
    property IDSO: integer read mIDSO write mIDSO;
    property IDMO: Integer read mIDMO write mIDMO;
    property IDSPK: Integer read mIDSPK write mIDSPK;
    property Editable: Boolean write mEditable;
  end;

var
  frmSPK: TfrmSPK;

implementation

uses unTools, unDM;

{$R *.dfm}

procedure TfrmSPK.btnSimpanClick(Sender: TObject);
var
  sNoSPK: string;
  q, qh, qd: TZQuery;
  ID, i: integer;
begin


  if (cxtbBom.DataController.EditState = [dceInsert, dceModified]) or (cxtbBom.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan. #10#13' +
      'Klik tombol centang hijau.');
    Abort;
  end;

  if not mEditable then begin
    MsgBox('SPK ini tidak bisa di edit karena sudah ada transaksi (pengambilan bahan baku / hasil produksi).');
    Abort;
  end;

  if cxsQtySPK.Value = 0 then begin
    MsgBox('Mohon isi Qty. SPK.');
    cxsQtySPK.SetFocus;
  end
  else if VarIsNull(cxdTglPrd.EditValue) then begin
    MsgBox('Mohon isi tanggal produksi.');
    cxdTglPrd.SetFocus;
  end
  else if cxlMesin.Text = '' then begin
    MsgBox('Mohon pilih mesin.');
    cxlMesin.SetFocus;
  end
  else begin

    {
    q := OpenRS('SELECT SUM(qty) spk_total  FROM tbl_spk WHERE id_so = %d',[mIDSO]);
    if (cxsQtySPK.Value + q.FieldByName('spk_total').AsFloat) > cxsQtySO.Value then begin
      MsgBox('Qty. SPK sudah melebihi Qty. SO.');
      q.Close;
      Abort;
    end;
    q.Close;
    }

    if cxtbBom.DataController.RecordCount = 0 then begin
      MsgBox('Detail Bill Of Material harus di isi.');
      Abort;
    end;

    try
      dm.zConn.StartTransaction;

      if Self.Jenis = 'T' then begin
        sNoSPK := GetLastFak('spk');
        UpdateFaktur(Copy(sNoSPK,1,8));
      end
      else begin
        sNoSPK := cxtNoSPK.Text;
      end;

      qh := OpenRS('SELECT * FROM tbl_spk WHERE no_spk = ''%s''',[sNoSPK]);

      if Self.Jenis = 'E' then ID := qh.FieldByName('id').AsInteger;

      with qh do begin
        if Self.Jenis = 'T' then
          Insert
        else begin
          Edit;
        end;
        FieldByName('no_spk').AsString := sNoSPK;
        FieldByName('id_mo').AsInteger := mIDMO;
        FieldByName('id_so').AsInteger := mIDSO;
        FieldByName('tanggal').AsDateTime := cxdTglPrd.Date;
        FieldbyName('id_mesin').AsInteger := cxlMesin.EditValue;
        FieldByName('qty').AsFloat := cxsQtySPK.EditValue;
        FieldByName('user').AsString := Aplikasi.NamaUser;
        FieldByName('user_dept').AsString := Aplikasi.UserDept;
        FieldByName('toleransi').AsFloat := cxsToleransi.EditValue;
        FieldByName('id_brg').AsInteger := mIdBrg;
        FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
        FieldByName('id_satuan').AsInteger := Aplikasi.SatProd;
        FieldByName('id_satuan_bj').AsInteger := mIdSatBJ;
        Post;
      end;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      qd := OpenRS('SELECT * FROM tbl_bom WHERE id_spk = %d',[ID]);
      with cxtbBom.DataController do begin
        for i := 0 to RecordCount - 1 do begin
          if Self.Jenis = 'T' then
            qd.Insert
          else begin
            if qd.Locate('id',VarArrayOf([Values[i, cxColId.Index]]),[]) then
              qd.Edit
            else
              qd.Insert;
          end;
          qd.FieldByName('id_spk').AsInteger := ID;
          qd.FieldByName('kode_brg').AsString := Values[i, cxColKodeBrg2.Index];
          qd.FieldByName('id_brg').AsInteger := Values[i, cxColDeskripsi.Index];
          qd.FieldByName('qty').AsFloat := Values[i, cxColQty.Index];
          qd.FieldByName('id_satuan').AsInteger := Values[i, cxColIdSatuan.Index];
          qd.FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
          qd.Post;
          qd.First;
        end;
      end;
      qd.Close;

      dm.zConn.ExecuteDirect(Format('UPDATE tbl_mo SET id_spk = %d WHERE id = %d',[ID,mIDMO]));

      dm.zConn.Commit;

      MsgBox('SPK sudah disimpan dengan nomor: ' + sNoSPK);

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

procedure TfrmSPK.CheckBrgSpk(id_brg: Integer);
var
  q: TZQuery;
begin
  q := OpenRS('SELECT b.no_spk, a.qty FROM tbl_bom a ' +
    'LEFT JOIN tbl_spk b ON a.id_spk = b.id ' +
    'WHERE a.id_brg = %d AND b.f_completed = 0',[id_brg]);
  if not q.IsEmpty then begin
    MsgBox('Barang ini digunakan di SPK : ' + q.FieldByName('no_spk').AsString + Chr(10) + Chr(13) +
      'Sejumlah : ' + FormatFloat('#,#0.00', q.FieldByName('qty').AsFloat));
  end;
  q.Close;
end;

procedure TfrmSPK.cxtbBomDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
  qc: TZQuery;
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
    end;
  end;

  if (VarIsNull(ADataController.Values[i, cxColDeskripsi.Index])) or
      (Trim(ADataController.Values[i, cxColDeskripsi.Index]) = '')  then begin
    MsgBox('Kode barang harus diisi.');
    Abort;
  end;

  if VarIsNull(ADataController.Values[i, cxColQty.Index]) or
    (ADataController.Values[i, cxColQty.Index] < 1) then begin
    MsgBox('Qty. Bahan baku harus di isi.');
    Abort;
  end;

end;

procedure TfrmSPK.cxtbBomDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
  sa: Real;
begin
  inherited;

  if AItemIndex = cxColKodeBrg.Index then begin
    try
      cxtbBom.BeginUpdate;
      q := OpenRS('SELECT a.id id_brg1, a.kode, b.satuan, b.id id_satuan FROM tbl_barang a ' +
        'LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = ''%s''',[ADataController.Values[ARecordIndex, AItemIndex]]);
      ADataController.Values[ARecordIndex, cxColDeskripsi.Index] := ADataController.Values[ARecordIndex, AItemIndex];
      ADataController.Values[ARecordIndex, cxColKodeBrg2.Index] := q.FieldByName('kode').AsString;
      ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsString;
      sa := GetStokAkhir(ADataController.Values[ARecordIndex, AItemIndex], Aplikasi.GdgBB);
      ADataController.Values[ARecordIndex, cxColStok.Index] := sa;
      CheckBrgSpk(q.FieldByName('id_brg1').AsInteger);
      q.Close;
    finally
      cxtbBom.EndUpdate;
    end;
  end;

  if AItemIndex = cxColDeskripsi.Index then begin
    try
      cxtbBom.BeginUpdate;
      q := OpenRS('SELECT b.id id_brg1, a.kode, b.satuan, b.id id_satuan FROM tbl_barang a ' +
        'LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = ''%s''',[ADataController.Values[ARecordIndex, AItemIndex]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg.Index] := ADataController.Values[ARecordIndex, AItemIndex];
      ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsString;
      ADataController.Values[ARecordIndex, cxColKodeBrg2.Index] := q.FieldByName('kode').AsString;
      sa := GetStokAkhir(ADataController.Values[ARecordIndex, AItemIndex], Aplikasi.GdgBB);
      ADataController.Values[ARecordIndex, cxColStok.Index] := sa;
      CheckBrgSpk(q.FieldByName('id_brg1').AsInteger);
      q.Close;
    finally
      cxtbBom.EndUpdate;
    end;
  end;

  if AItemIndex = cxColQty.Index then begin
    if VarIsNull(ADataController.Values[ARecordIndex, AItemIndex]) or
      (ADataController.Values[ARecordIndex, AItemIndex] < 1) then begin
      MsgBox('Qty. Bahan baku harus di isi.');
      Abort;
    end;
  end;

end;

procedure TfrmSPK.FormCreate(Sender: TObject);
begin
  inherited;
  zqrBrg.Open;
  zqrMesin.Open;
  mEditable := True;
end;

procedure TfrmSPK.FormShow(Sender: TObject);
var
  q, qspk: TZQuery;
  i: integer;
  sa, conv: real;
begin
  inherited;

  q := OpenRS('SELECT a.* FROM v_mo a WHERE id = %d',[mIDMO]);

  cxtNoMO.Text := q.FieldByName('no_mo').AsString;
  cxtNoSO.Text := q.FieldByName('no_so').AsString;
  cxtKodeBrg.Text := q.FieldByName('kode_brg').AsString;
  cxtDeskripsi.Text := q.FieldByName('deskripsi').AsString;
  clblSat1.Caption := q.FieldByName('satuan').AsString;
  clblSat2.Caption := 'KG';
  cxsQtySPK.Value := q.FieldByName('qty_spk').AsFloat;
  cxsQtySO.Value := q.FieldbyName('qty_so').AsFloat;
  cxsQtySOKG.Value := q.FieldByName('qty_kg').AsFloat;

  mIdBrg := q.FieldByname('id_brg').AsInteger;
  conv := GetKonversiSat(mIdBrg, 2);
  q.Close;

  qspk := OpenRS('SELECT IFNULL(SUM(qty),0) spk_total FROM tbl_spk WHERE id_so = %d',[mIDSO]);
  cxsTotalSPK.Value := qspk.FieldByName('spk_total').AsFloat;
  qspk.Close;

  // get satuan barang jadi
  // 21/08
  q := OpenRS('SELECT id_satuan FROM tbl_barang WHERE id = %d',[mIdBrg]);
  mIdSatBJ := q.FieldByName('id_satuan').AsInteger;
  q.Close;

  if Self.Jenis = 'T' then
    cxtNoSPK.Text := GetLastFak('spk');

  if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_spk WHERE id = %d',[mIDSPK]);
    cxtNoSPK.Text := q.FieldByName('no_spk').AsString;
    cxdTglPrd.Date := q.FieldByName('tanggal').AsDateTime;
    cxlMesin.EditValue := q.FieldByName('id_mesin').AsInteger;
    q.Close;

    q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_bom a ' +
      'LEFT JOIN tbl_satuan b on a.id_satuan = b.id ' +
      'WHERE a.id_spk = %d',[mIDSPK]);
    cxtbBom.BeginUpdate;
    while not q.Eof do begin
      with cxtbBom.DataController do begin
        i := AppendRecord;
        Values[i, cxColKodeBrg.Index] := q.FieldByName('id_brg').AsString;
        Values[i, cxColKodeBrg2.Index] := q.FieldByName('kode_brg').AsString;
        Values[i, cxColDeskripsi.Index] := q.FieldByName('id_brg').AsInteger;
        Values[i, cxColQty.Index] := q.FieldByName('qty').AsFloat;
        Values[i, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
        Values[i, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
        Values[i, cxColId.Index] := q.FieldByName('id').AsInteger;

        sa := GetStokAkhir(q.FieldByName('id_brg').AsInteger, Aplikasi.GdgBB);
        Values[i, cxColStok.Index] := sa;
      end;
      q.Next;
    end;
    cxtbBom.EndUpdate;
  end;

end;

end.
