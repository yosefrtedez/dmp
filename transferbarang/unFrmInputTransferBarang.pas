unit unFrmInputTransferBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, StdCtrls, ExtCtrls, ZDataset, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxLabel,cxTextEdit, cxCalendar,
  ZAbstractRODataset, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxSpinEdit, cxDBLookupComboBox, cxDropDownEdit,
  cxMaskEdit, DB, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmInputTransferBarang = class(TfrmTplInput)
    Label1: TLabel;
    cxLabel1: TcxLabel;
    cxtNoTrans: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxdTglTrs: TcxDateEdit;
    cxGrid1: TcxGrid;
    cxTblTransBarang: TcxGridTableView;
    cxColNo: TcxGridColumn;
    cxColKode: TcxGridColumn;
    cxColDeskripsi: TcxGridColumn;
    cxColQty: TcxGridColumn;
    cxColSatuan: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    cxLabel2: TcxLabel;
    cxtKeterangan: TcxTextEdit;
    cxColGudangAsal: TcxGridColumn;
    cxColGudangTujuan: TcxGridColumn;
    zqrGudang: TZReadOnlyQuery;
    dsGudang: TDataSource;
    cxColStock: TcxGridColumn;
    cxColIdSatuan: TcxGridColumn;
    cxColKodeBrg2: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxTblTransBarangDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxTblTransBarangDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputTransferBarang: TfrmInputTransferBarang;

implementation

uses
  unDM, unTools, unAplikasi, unFrmLstTransferBarang;

{$R *.dfm}

procedure TfrmInputTransferBarang.btnSimpanClick(Sender: TObject);
var
  q,z,qh : TZQuery;
  i,id : Integer;
  sNoTrs : string;
begin


  if (cxTblTransBarang.DataController.EditState = [dceInsert, dceModified]) or (cxTblTransBarang.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan. ' + Chr(10) + Chr(13) +
      'Klik tombol centang hijau.');
    Abort;
  end;

  if cxTblTransBarang.DataController.RecordCount = 0 then begin
    MsgBox('Detail transaksi masih kosong.');
    Abort;
  end;

  try
    dm.zConn.StartTransaction;

    if Self.Jenis = 'T' then begin
      sNoTrs := GetLastFak('mutasi');
      UpdateFaktur(Copy(sNoTrs,1,7));
    end
    else begin
      sNoTrs := cxtNoTrans.Text;
    end;

    // header Mutasi
    q := OpenRS('SELECT * FROM tbl_trsmutasi_head where no_bukti =''%s''',[sNoTrs]);

    if Self.Jenis = 'T' then begin
      q.Insert;
    end
    else begin
      q.Edit;
      id := q.FieldByName('id').AsInteger;
    end;

    with q do begin
      FieldByName('no_bukti').AsString        := cxtNoTrans.Text;
      FieldByName('keterangan').AsString      := cxtKeterangan.Text;
      FieldByName('tanggal').AsDateTime       := cxdTglTrs.EditValue;
      if self.Jenis = 'T' then begin
        FieldByName('user').AsString          := aplikasi.NamaUser;
        FieldByName('tgl_input').AsDateTime   := aplikasi.TanggalServer;
      end;
      FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
      Post;
    end;

    if Self.Jenis = 'T' then id := LastInsertID;

    // detail Mutasi
    if Self.Jenis = 'E' then begin
      dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_trsmutasi_det WHERE id_ref = %d',[id]));
    end;

    with cxTblTransBarang.DataController  do begin
      for i := 0 to RecordCount -1 do begin
        z := OpenRS('SELECT * FROM tbl_trsmutasi_det where no_bukti =''%s''',[sNoTrs]) ;
        z.Insert;
        z.FieldByName('id_ref').AsInteger         := id;
        z.FieldByName('no_bukti').AsString        := sNoTrs;
        z.FieldByName('id_brg').AsInteger         := Values[i, cxColDeskripsi.index];
        z.FieldByName('kode_brg').AsString := Values[i, cxColKodeBrg2.Index];
        z.FieldByName('id_gdg_asal').AsInteger    := Values[i, cxColGudangAsal.index];
        z.FieldByName('id_gdg_tujuan').AsInteger  := Values[i, cxColGudangTujuan.index];
        z.FieldByName('qty').AsFloat              := Values[i, cxColQty.Index];
        z.FieldByName('id_satuan').AsString       := Values[i, cxColIdSatuan.Index];
        z.Post;
        z.Close;

        //Simpan tbl_history
        {
        if Self.Jenis = 'T' then begin

          qh := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''', [sNoTrs]);
          with qh do begin
            Insert;
            FieldByName('no_bukti').AsString      := sNoTrs;
            FieldByName('tanggal').AsString       := cxdTglTrs.EditValue;
            FieldByName('kode_brg').AsString      := Values[i, cxColKode.index];
            FieldByName('id_brg').AsInteger       := Values[i, cxColDeskripsi.index];
            FieldByName('tipe').AsString          := 'o';
            FieldByName('qty').AsFloat            := Values[i, cxColQty.Index];
            FieldByName('id_gdg').AsInteger       := Values[i, cxColGudangAsal.Index];
            FieldByName('id_satuan').AsInteger    := Values[i, cxColIdSatuan.Index];
            FieldByName('user').AsString          := aplikasi.NamaUser;
            FieldByName('tgl_input').AsDateTime   := aplikasi.TanggalServer;
            Post;

            Insert;
            FieldByName('no_bukti').AsString      := sNoTrs;
            FieldByName('tanggal').AsString       := cxdTglTrs.EditValue;
            FieldByName('kode_brg').AsString      := Values[i, cxColKode.index];
            FieldByName('id_brg').AsInteger       := Values[i, cxColDeskripsi.index];
            FieldByName('tipe').AsString          := 'i';
            FieldByName('qty').AsFloat            := Values[i, cxColQty.Index];
            FieldByName('id_gdg').AsInteger       := Values[i, cxColGudangTujuan.Index];
            FieldByName('id_satuan').AsInteger    := Values[i, cxColIdSatuan.Index];
            FieldByName('user').AsString          := aplikasi.NamaUser;
            FieldByName('tgl_input').AsDateTime   := aplikasi.TanggalServer;
            Post;
          end;

          qh.Close;
        end
        else begin
           qh := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''', [sNoTrs]);
          with qh do begin
            Insert;
            FieldByName('no_bukti').AsString      := sNoTrs;
            FieldByName('tanggal').AsString       := cxdTglTrs.EditValue;
            FieldByName('kode_brg').AsString      := Values[i, cxColKode.index];
            FieldByName('id_brg').AsInteger       := Values[i, cxColDeskripsi.index];
            FieldByName('tipe').AsString          := 'o';
            FieldByName('qty').AsFloat            := Values[i, cxColQty.Index];
            FieldByName('id_gdg').AsInteger       := Values[i, cxColGudangAsal.Index];
            FieldByName('id_satuan').AsInteger    := Values[i, cxColIdSatuan.Index];
            FieldByName('user').AsString          := aplikasi.NamaUser;
            FieldByName('tgl_input').AsDateTime   := aplikasi.TanggalServer;
            Post;

            Insert;
            FieldByName('no_bukti').AsString      := sNoTrs;
            FieldByName('tanggal').AsString       := cxdTglTrs.EditValue;
            FieldByName('kode_brg').AsString      := Values[i, cxColKode.index];
            FieldByName('id_brg').AsInteger       := Values[i, cxColDeskripsi.index];
            FieldByName('tipe').AsString          := 'i';
            FieldByName('qty').AsFloat            := Values[i, cxColQty.Index];
            FieldByName('id_gdg').AsInteger       := Values[i, cxColGudangTujuan.Index];
            FieldByName('id_satuan').AsInteger    := Values[i, cxColIdSatuan.Index];
            FieldByName('user').AsString          := aplikasi.NamaUser;
            FieldByName('tgl_input').AsDateTime   := aplikasi.TanggalServer;
            Post;
          end;

          qh.Close;

          end;
          }
        end;
      end;
      dm.zConn.Commit;

      MsgBox('Mutasi Barang sudah disimpan dengan nomor : ' + sNoTrs);
      cxTblTransBarang.DataController.RecordCount := 0;
      if Assigned(Self.FormInduk) then
        (Self.FormInduk as TfrmLstTransferBarang).btnRefreshClick(nil);
      btnBatalClick(nil);

      inherited;
  except
    on E: Exception do begin
      MsgBox('Error: ' + E.Message);
      dm.zConn.Rollback;
    end;
  end;
end;

procedure TfrmInputTransferBarang.cxColNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var
  Row: Integer;
begin
  inherited;
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;

procedure TfrmInputTransferBarang.cxTblTransBarangDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
  sa: real;
begin
  inherited;
  i := ADataController.FocusedRowIndex;
  k := ADataController.GetEditingRecordIndex;
  v := ADataController.Values[i, cxColKode.Index];

  for j := 0 to ADataController.RecordCount - 1 do begin
    if j <> k then begin
      if v = ADataController.Values[j, cxColKode.Index] then begin
        MsgBox('Item tersebut sudah ada.');
        ADataController.DeleteRecord(i);
        Abort
      end;
    end;
  end;
  if (VarIsNull(ADataController.Values[i, cxColKode.Index])) or
    (Trim(ADataController.Values[i, cxColKode.Index]) = '')  then begin
    MsgBox('Kode barang harus di isi.');
    Abort;
  end;

  //Cek value gudang
  if (VarIsNull(ADataController.Values[i, cxColGudangAsal.Index])) or
    (VarIsNull(ADataController.Values[i, cxColGudangTujuan.Index]))  then begin
    MsgBox('Gudang Asal/Tujuan harus di isi.');
    Abort;
  end;

  sa := GetStokAkhir(ADataController.Values[i, cxColDeskripsi.Index], ADataController.Values[i, cxColGudangAsal.Index]);
  if sa < ADataController.Values[i, cxColQty.Index] then begin
    MsgBox('Stok barang tidak mencukupi. Stok : ' + FormatFloat('#,#0.00', sa));
    Abort;
  end;

end;

procedure TfrmInputTransferBarang.cxTblTransBarangDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  i : Integer;
  z,q : TZQuery;
  sa: real;
begin
  inherited;
    if AItemIndex = cxColKode.Index then begin
      try
        cxTblTransBarang.BeginUpdate;
        z := OpenRS('SELECT a.id_satuan,a.kode,b.satuan FROM tbl_barang a join tbl_satuan b on a.id_satuan=b.id where a.id =%s',
          [ADataController.Values[ARecordIndex, AItemIndex]]) ;
        with cxTblTransBarang.DataController do begin
          Values[ARecordIndex, cxColDeskripsi.Index] := ADataController.Values[ARecordIndex, AItemIndex];
          Values[i, cxColKodeBrg2.Index] := z.FieldByName('kode').AsString;
          Values[i, cxColSatuan.Index] := z.FieldByName('satuan').AsString ;
          Values[i, cxColIdSatuan.Index] := z.FieldByName('id_satuan').AsInteger ;
        end;
        z.Close ;

        //Menampilkan Stock Gudang Asal
        z := OpenRS('SELECT sf_get_stokakhir(''%s'',''%s'') as stok',
          [ADataController.Values[ARecordIndex, cxColDeskripsi.Index],ADataController.Values[ARecordIndex, cxColGudangAsal.Index]]) ;
        ADataController.Values[i, cxColStock.Index] := z.FieldByName('stok').AsFloat ;
        z.Close ;

      finally
        cxTblTransBarang.EndUpdate;
      end;
    end;

    if AItemIndex = cxColDeskripsi.Index then begin
      i := ADataController.GetFocusedRecordIndex;
      try
        cxTblTransBarang.BeginUpdate;
        z := OpenRS('SELECT a.id_satuan,a.kode,b.satuan FROM tbl_barang a join tbl_satuan b on a.id_satuan=b.id where a.id =%s',
          [ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]) ;
        with cxTblTransBarang.DataController do begin
          Values[i, cxColKodeBrg2.Index] := z.FieldByName('kode').AsString;
          Values[i, cxColKode.Index] := ADataController.Values[ARecordIndex, AItemIndex];
          Values[i, cxColSatuan.Index] := z.FieldByName('satuan').AsString ;
          Values[i, cxColIdSatuan.Index] := z.FieldByName('id_satuan').AsInteger ;
          Values[i, cxColKode.Index] := z.FieldByName('kode').AsString ;
        end;
        z.Close ;

        //Menampilkan Stock Gudang Asal
        z := OpenRS('SELECT sf_get_stokakhir(''%s'',''%s'') as stok',
          [ADataController.Values[ARecordIndex, cxColDeskripsi.Index],ADataController.Values[ARecordIndex, cxColGudangAsal.Index]]) ;
        with cxTblTransBarang.DataController do begin
         Values[i, cxColStock.Index] := z.FieldByName('stok').AsFloat ;
        end;
        z.Close ;

      finally
        cxTblTransBarang.EndUpdate;
      end;
   end
   else if AItemIndex = cxColGudangAsal.Index then begin
      if (ADataController.Values[ARecordIndex, cxColGudangAsal.Index]=ADataController.Values[ARecordIndex, cxColGudangTujuan.Index]) then begin
        MsgBox('Gudang Asal tidak boleh sama dengan Gudang Tujuan');
        Abort;
      end;

      //Menampilkan Stock Gudang Asal
      sa := unTools.GetStokAkhir(ADataController.Values[ARecordIndex, cxColDeskripsi.Index],
        ADataController.Values[ARecordIndex, cxColGudangAsal.Index]);
      ADataController.Values[ARecordIndex, cxColStock.Index] := sa;

   end
   else if AItemIndex = cxColGudangTujuan.Index then begin
      if (ADataController.Values[ARecordIndex, cxColGudangAsal.Index]=ADataController.Values[ARecordIndex, cxColGudangTujuan.Index]) then begin
        MsgBox('Gudang Tujuan tidak boleh sama dengan Gudang Asal');
        Abort;
      end;
   end;

end;

procedure TfrmInputTransferBarang.FormCreate(Sender: TObject);
var
  sNoTrs : string;
begin
  inherited;
  if Self.Jenis = 'T' then begin
    sNoTrs            := GetLastFak('mutasi_antar_barang');
    cxtNoTrans.Text   := sNoTrs;
    cxdTglTrs.Date    := Aplikasi.Tanggal;
  end;
  zqrBarang.Open;
  zqrGudang.Open;
end;

procedure TfrmInputTransferBarang.FormShow(Sender: TObject);
var
  q,z,a : TZQuery;
  i : Integer ;
  sNoTrs : string;
  sa: real;
begin
  inherited;

  if Self.Jenis = 'T' then begin
    sNoTrs            := GetLastFak('mutasi');
    cxtNoTrans.Text   := sNoTrs;
    cxdTglTrs.Date    := Aplikasi.Tanggal;
  end
  else if Self.Jenis= 'E' then begin
    cxTblTransBarang.DataController.OnRecordChanged := nil ;
    q := OpenRS('SELECT * FROM tbl_trsmutasi_head WHERE id = %s', [Self.EditKey] );

    with q do begin
      cxtNoTrans.Text               := FieldByName('no_bukti').AsString;
      cxtKeterangan.Text            := FieldByName('keterangan').AsString;
      cxdTglTrs.EditValue           := FieldByName('tanggal').AsDateTime;

      z := OpenRS('SELECT a.*, b.deskripsi, c.satuan satuan2 ' +
                  'FROM tbl_trsmutasi_det a ' +
                  'LEFT JOIN tbl_barang b ON a.id_brg = b.id ' +
                  'LEFT JOIN tbl_satuan c ON c.id = a.id_satuan ' +
                  'LEFT JOIN tbl_gudang d ON a.id_gdg_asal= d.id ' +
                  'LEFT JOIN tbl_gudang e ON a.id_gdg_tujuan = e.id ' +
                  'where a.id_ref = %s',[Self.EditKey]);

      cxTblTransBarang.BeginUpdate;
      while not z.Eof do begin
        with cxTblTransBarang.DataController do begin
          i := AppendRecord ;
          Values[i, cxColkode.index]        := z.FieldByName('id_brg').AsString;
          Values[i, cxColKodeBrg2.Index] := z.FieldByName('kode_brg').AsString;
          Values[i, cxColDeskripsi.Index]   := z.FieldByName('id_brg').AsInteger;
          Values[i, cxColQty.Index]         := z.FieldByName('qty').AsFloat ;
          Values[i, cxColSatuan.Index]      := z.FieldByName('satuan2').AsString ;
          Values[i, cxColIdSatuan.Index]    := z.FieldByName('id_satuan').AsInteger ;
          Values[i, cxColGudangAsal.Index]  := z.FieldByName('id_gdg_asal').AsInteger;
          Values[i, cxColGudangTujuan.Index]:= z.FieldByName('id_gdg_tujuan').AsInteger;
          sa := GetStokAkhir(Values[i, cxColKode.Index], Values[i, cxColGudangAsal.Index]);
          Values[i, cxColStock.Index]       := sa;
        end;
        z.Next;
      end;
      z.Close;
      cxTblTransBarang.EndUpdate;

      cxTblTransBarang.DataController.OnRecordChanged := frmInputTransferBarang.cxTblTransBarangDataControllerRecordChanged ;
    end;


  end;
end;

end.
