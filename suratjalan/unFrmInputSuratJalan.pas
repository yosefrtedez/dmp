unit unFrmInputSuratJalan;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, DB,
  ZAbstractRODataset, ZDataset, cxCheckBox, cxTextEdit, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLabel, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxSpinEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, Spin, cxButtonEdit, Math;

type
  TfrmInputSuratJalan = class(TfrmTplInput)
    Label13: TLabel;
    cxlbl1: TcxLabel;
    cxlbl4: TcxLabel;
    cxdTglDatang: TcxDateEdit;
    cxtNoBukti: TcxTextEdit;
    cxlbl14: TcxLabel;
    cxtKeterangan: TcxTextEdit;
    cxgSJ: TcxGrid;
    cxtbSJ: TcxGridTableView;
    cxColNo: TcxGridColumn;
    cxColKodeBrg: TcxGridColumn;
    cxColDeskripsi: TcxGridColumn;
    cxColQty: TcxGridColumn;
    cxColSatuan: TcxGridColumn;
    cxColKeterangan: TcxGridColumn;
    cxColIdSatuan: TcxGridColumn;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    cxColGudang: TcxGridColumn;
    zqrGudang: TZReadOnlyQuery;
    dsGudang: TDataSource;
    cxLabel1: TcxLabel;
    cxlCustomer: TcxLookupComboBox;
    zqrCust: TZReadOnlyQuery;
    dsCust: TDataSource;
    cxColNoSO: TcxGridColumn;
    cxLabel2: TcxLabel;
    cxtNopol: TcxTextEdit;
    cxtSopir: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxColQtySO: TcxGridColumn;
    cxLabel4: TcxLabel;
    cxsDiskon: TcxSpinEdit;
    DPP: TcxLabel;
    cxsStlhDiskon: TcxSpinEdit;
    cxsPPN: TcxSpinEdit;
    cxChkPPN: TcxCheckBox;
    cxLabel5: TcxLabel;
    cxsDPP: TcxSpinEdit;
    cxLabel6: TcxLabel;
    cxsHargaTotal: TcxSpinEdit;
    cxColHarga: TcxGridColumn;
    cxColTotal: TcxGridColumn;
    cxLabel7: TcxLabel;
    cxtNoFaktur: TcxTextEdit;
    zqrSO: TZReadOnlyQuery;
    dsSO: TDataSource;
    cxColIdSO: TcxGridColumn;
    cxColQtyTerkirim: TcxGridColumn;
    cxColJmlIkatPerBal: TcxGridColumn;
    cxColHargaIkat: TcxGridColumn;
    cxLabel8: TcxLabel;
    cxdTglJthTempo: TcxDateEdit;
    btnPilihSO: TButton;
    cxLabel9: TcxLabel;
    cxtAlamat: TcxTextEdit;
    cxColIdBrg: TcxGridColumn;
    cxChkSJTanpaSO: TcxCheckBox;
    btnSimpan2: TButton;
    cxgSJTanpaSO: TcxGrid;
    cxtbSJTanpaSO: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxColKodeBrg2: TcxGridColumn;
    cxColDeskripsi2: TcxGridColumn;
    cxColQty2: TcxGridColumn;
    cxColJmlIkatPerBal2: TcxGridColumn;
    cxColHargaIkat2: TcxGridColumn;
    cxColHarga2: TcxGridColumn;
    cxColGudang2: TcxGridColumn;
    cxColSatuan2: TcxGridColumn;
    cxColKeterangan2: TcxGridColumn;
    cxColTotal2: TcxGridColumn;
    cxColIdSatuan2: TcxGridColumn;
    cxColIdBrg2: TcxGridColumn;
    cxColKodeBrg3: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxColNoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxtbBarangMasukDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxtbBarangMasukDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxtbSJDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxtbSJDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxColNoSOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxsDiskonPropertiesChange(Sender: TObject);
    procedure cxChkPPNClick(Sender: TObject);
    procedure btnPilihSOClick(Sender: TObject);
    procedure cxtbSJDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure cxlCustomerPropertiesChange(Sender: TObject);
    procedure cxChkSJTanpaSOClick(Sender: TObject);
    procedure btnSimpan2Click(Sender: TObject);
    procedure cxtbSJTanpaSODataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure cxtbSJTanpaSODataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure cxtbSJTanpaSODataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure Button1Click(Sender: TObject);
  private
    procedure HitungTotal;
    procedure Posting(IDSJ: Integer);
    function CheckSOComplete: boolean;
  public
    { Public declarations }
  end;

var
  frmInputSuratJalan: TfrmInputSuratJalan;

implementation

uses unDM, unTools, unFrmPilihSO, unFrmLstSuratJalan;

{$R *.dfm}

procedure TfrmInputSuratJalan.btnSimpan2Click(Sender: TObject);
var
  q, qh, qd, qSatuan, qGdg : TZQuery;
  sNoBukti, sNoFaktur : string;
  i, id : integer;
  f0: Boolean;
begin

  if (cxtbSJTanpaSO.DataController.EditState = [dceInsert, dceModified]) or
    (cxtbSJTanpaSO.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.' + Chr(10) + Chr(13) +
      'Klik Klik tombol centang hijau.');
    Abort;
  end;

  with cxtbSJTanpaSO.DataController do begin
    if RecordCount = 0 then begin
      MsgBox('Detail transaksi masih kosong.');
      Abort;
    end;

    if Self.Jenis = 'T' then begin
      if cxChkPPN.Checked  then begin
        sNoBukti := GetLastFak('sj-pajak');
        UpdateFaktur(Copy(sNoBukti,1,11));
        sNoFaktur := GetLastFak('faktur-pajak');
        UpdateFaktur(Copy(sNoFaktur,1,11));
      end
      else begin
        sNoBukti := GetLastFak('sj');
        UpdateFaktur(Copy(sNoBukti,1,7));
      end;
    end
    else begin
      sNoBukti := cxtNoBukti.text;
    end;

    try
      dm.zConn.StartTransaction;

      qh := OpenRS('SELECT * FROM tbl_sj_head WHERE no_bukti = ''%s''',[sNoBukti]);
      if Self.Jenis = 'T' then begin
        qh.Insert;
      end
      else begin
        qh.Edit;
        ID := qh.FieldByName('id').AsInteger;
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_sj_det WHERE id_ref = %s',[Self.EditKey]));
      end;

      qh.FieldByName('no_bukti').AsString := sNoBukti;
      qh.FieldByName('tanggal').AsDateTime := Aplikasi.Tanggal;
      qh.FieldByName('id_cust').AsInteger := cxlCustomer.EditValue;
      qh.FieldByName('user').AsString := Aplikasi.NamaUser;
      qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
      qh.FieldByName('tgl_input').AsDateTime := Aplikasi.Tanggal;
      qh.FIeldBYName('diskon').AsFloat := cxsDiskon.Value;
      if cxChkPPN.Checked then
        qh.FieldByName('f_ppn').AsInteger := 1;
      if Trim(cxdTglJthTempo.Text) <> '' then
        qh.FieldByName('jatuh_tempo').AsDateTime := cxdTglJthTempo.Date;
      if cxtNoFaktur.Text <> '' then
       qh.FieldByName('no_faktur').AsString := Trim(cxtNoFaktur.Text);
      qh.FieldByName('nopol').AsString := Trim(cxtNopol.Text);
      qh.FieldByName('sopir').AsString := Trim(cxtSopir.Text);
      qh.FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
      qh.FieldByName('jenis_sj').AsInteger := 1;
      qh.Post;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      qd := OpenRS('SELECT * FROM tbl_sj_det WHERE no_bukti = ''%s''',[sNoBukti]);

      with cxtbSJTanpaSO.DataController do begin
        for i := 0 to RecordCount - 1 do begin
          qd.Insert;
          if Self.Jenis = 'T' then begin
            qd.FieldByName('id_ref').AsInteger := ID;
          end else begin
            qd.FieldByName('id_ref').AsString := qh.FieldByName('id').AsString;
          end;
          qd.FieldByName('no_bukti').AsString := sNoBukti;
          qd.FieldByName('kode_brg').AsString := Values[i, cxColKodeBrg3.Index];
          qd.FieldByName('id_brg').AsInteger := Values[i, cxColKodeBrg2.Index];
          qd.FieldByName('qty').AsFloat := Values[i, cxColQty2.Index];
          qd.FieldByName('id_satuan').AsString := Values[i, cxColIdSatuan2.Index];
          qd.FieldByName('id_gdg').AsString := Values[i, cxColGudang2.Index];
          qd.FieldbyName('harga').AsFloat := Values[i, cxColHarga2.Index];
          if not VarIsNull(Values[i, cxColHargaIkat2.Index]) then
            qd.FieldByName('hrgikat').AsFloat := Values[i, cxColHargaIkat2.Index];
          if VarIsNull(Values[i, cxColKeterangan2.index]) = True then begin
            qd.FieldByName('keterangan').AsString := '';
          end else begin
            qd.FieldByName('keterangan').AsString := Values[i, cxColKeterangan2.Index];
          end;
          qd.Post;
        end;
      end;
      dm.zConn.Commit;
      qh.Close;
      qd.Close;
      Self.Jenis := '';

      MsgBox('Transaksi Surat Jalan barang sudah disimpan dengan No. Bukti : ' + sNoBukti);

      if Assigned(Self.FormInduk) then
        (Self.FormInduk as TfrmLstSuratJalan).btnRefreshClick(nil);

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

procedure TfrmInputSuratJalan.btnSimpanClick(Sender: TObject);
var
  q, qh, qd, qSatuan, qGdg : TZQuery;
  sNoBukti, sNoFaktur : string;
  i, id : integer;
  f0: Boolean;
begin

  if (cxtbSJ.DataController.EditState = [dceInsert, dceModified]) or
    (cxtbSJ.DataController.EditState = [dceEdit, dceModified]) then begin
    MsgBox('Mohon selesaikan pengeditan detail sebelum disimpan.' + Chr(10) + Chr(13) +
      'Klik Klik tombol centang hijau.');
    Abort;
  end;

  with cxtbSJ.DataController do begin
    if RecordCount = 0 then begin
      MsgBox('Detail transaksi masih kosong.');
      Abort;
    end;

    if Self.Jenis = 'T' then begin
      if cxChkPPN.Checked  then begin
        sNoBukti := GetLastFak('sj-pajak');
        UpdateFaktur(Copy(sNoBukti,1,11));
        sNoFaktur := GetLastFak('faktur-pajak');
        UpdateFaktur(Copy(sNoFaktur,1,11));
      end
      else begin
        sNoBukti := GetLastFak('sj');
        UpdateFaktur(Copy(sNoBukti,1,7));
      end;
    end
    else begin
      sNoBukti := cxtNoBukti.text;
    end;

    try
      dm.zConn.StartTransaction;

      qh := OpenRS('SELECT * FROM tbl_sj_head WHERE no_bukti = ''%s''',[sNoBukti]);
      if Self.Jenis = 'T' then begin
        qh.Insert;
      end
      else begin
        qh.Edit;
        ID := qh.FieldByName('id').AsInteger;
        dm.zConn.ExecuteDirect(Format('DELETE FROM tbl_sj_det WHERE id_ref = %s',[Self.EditKey]));
      end;

      qh.FieldByName('no_bukti').AsString := sNoBukti;
      qh.FieldByName('tanggal').AsDateTime := cxdTglDatang.Date;
      qh.FieldByName('id_cust').AsInteger := cxlCustomer.EditValue;
      qh.FieldByName('user').AsString := Aplikasi.NamaUser;
      qh.FieldByName('user_dept').AsString := Aplikasi.UserDept;
      qh.FieldByName('tgl_input').AsDateTime := Aplikasi.Tanggal;
      qh.FIeldBYName('diskon').AsFloat := cxsDiskon.Value;
      if cxChkPPN.Checked then
        qh.FieldByName('f_ppn').AsInteger := 1;
      if Trim(cxdTglJthTempo.Text) <> '' then
        qh.FieldByName('jatuh_tempo').AsDateTime := cxdTglJthTempo.Date;
      if cxtNoFaktur.Text <> '' then
       qh.FieldByName('no_faktur').AsString := Trim(cxtNoFaktur.Text);
      qh.FieldByName('nopol').AsString := Trim(cxtNopol.Text);
      qh.FieldByName('sopir').AsString := Trim(cxtSopir.Text);
      qh.FieldByName('tgl_edit').AsDateTime := Aplikasi.NowServer;
      qh.Post;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      qd := OpenRS('SELECT * FROM tbl_sj_det WHERE no_bukti = ''%s''',[sNoBukti]);

      with cxtbSJ.DataController do begin
        for i := 0 to RecordCount - 1 do begin
          qd.Insert;
          if Self.Jenis = 'T' then begin
            qd.FieldByName('id_ref').AsInteger := ID;
          end else begin
            qd.FieldByName('id_ref').AsString := qh.FieldByName('id').AsString;
          end;
          qd.FieldByName('no_bukti').AsString := sNoBukti;
          qd.FieldByName('kode_brg').AsString := Values[i, cxColKodeBrg.Index];
          qd.FieldByName('id_brg').AsInteger := Values[i, cxColIdBrg.Index];
          qd.FieldByName('qty').AsFloat := Values[i, cxColQty.Index];
          qd.FieldByName('id_satuan').AsString := Values[i, cxColIdSatuan.Index];
          qd.FieldByName('id_gdg').AsString := Values[i, cxColGudang.Index];
          qd.FieldbyName('harga').AsFloat := Values[i, cxColHarga.Index];
          if not VarIsNull(Values[i, cxColHargaIkat.Index]) then
            qd.FieldByName('hrgikat').AsFloat := Values[i, cxColHargaIkat.Index];
          qd.FieldByName('id_so').AsInteger := Values[i, cxColIdSO.Index];
          if VarIsNull(Values[i, cxColKeterangan.index]) = True then begin
            qd.FieldByName('keterangan').AsString := '';
          end else begin
            qd.FieldByName('keterangan').AsString := Values[i, cxColKeterangan.Index];
          end;
          qd.Post;
        end;
      end;
      dm.zConn.Commit;
      qh.Close;
      qd.Close;
      Self.Jenis := '';

      MsgBox('Transaksi Surat Jalan barang sudah disimpan dengan No. Bukti : ' + sNoBukti);

      if Assigned(Self.FormInduk) then
        (Self.FormInduk as TfrmLstSuratJalan).btnRefreshClick(nil);

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

procedure TfrmInputSuratJalan.Button1Click(Sender: TObject);
begin
  inherited;
  cxgSJTanpaSO.Visible := True;
end;

procedure TfrmInputSuratJalan.btnPilihSOClick(Sender: TObject);

  function CheckAda(id_brg, id_so: Integer; var row: Integer): Boolean;
  var
    x: integer;
    f: Boolean;
  begin
    f := false;
    for x := 0 to cxtbSJ.DataController.RecordCount - 1 do begin
      with cxtbSJ.DataController do begin
        if (Values[x, cxColIdBrg.Index] = id_brg) and (Values[x, cxColIdSO.Index] = id_so) then begin
          f := true;
          row := x;
        end;
      end;
    end;
    Result := f;
  end;

var
  f: TfrmPilihSO;
  cx: TcxGridTableView;
  i,j, row: Integer;
  qhrg, qbrg, qc: TZQuery;
begin
  inherited;
  if cxlCustomer.Text = '' then Abort;
  
  f := TfrmPilihSO.Create(Self);
  f.IdCust := cxlCustomer.EditValue;
  if f.ShowModal = mrOk then begin
    cx := f.cxtbSO;
    cxtbSJ.BeginUpdate;
    //cxtbSJ.DataController.RecordCount := 0;
    with cx.DataController do begin
      for i := 0 to RecordCount -  1 do begin
        if Values[i, f.cxColPilih.Index] = 1 then begin

          if CheckAda(Values[i, f.cxColIdBrg.Index], Values[i, f.cxColIdSO.Index], row) then begin
            cxtbSJ.DataController.Values[row, cxColIdBrg.Index] := Values[i, f.cxColIdBrg.Index];
            cxtbSJ.DataController.Values[row, cxColIdSO.Index] := Values[i, f.cxColIdSO.Index];
            cxtbSJ.DataController.Values[row, cxColKodeBrg.Index] := Values[i,f.cxColKodeBrg.Index];
            cxtbSJ.DataController.Values[row, cxColDeskripsi.Index] := Values[i,f.cxColDeskripsi.Index];
            cxtbSJ.DataController.Values[row, cxColNoSO.Index] := Values[i, f.cxColNoSO.Index];
            cxtbSJ.DataController.Values[row, cxColQtySO.Index] := Values[i, f.cxColQtySO.Index];
            cxtbSJ.DataController.Values[row, cxColQty.Index] := Values[i, f.cxColJmlKirim.Index];
            cxtbSJ.DataController.Values[row, cxColQtyTerkirim.Index] := Values[i, f.cxColQtyTerkirim.Index];

            cxtbSJ.DataController.Values[row, cxColGudang.Index] := Values[i, f.cxColGdg.Index];
            cxtbSJ.DataController.Values[row, cxColSatuan.Index] := Values[i, f.cxColSatuan.Index];
            cxtbSJ.DataController.Values[row, cxColIdSatuan.Index] := Values[i, f.cxColIdSatuan.Index];

            qhrg := OpenRS('SELECT harga FROM tbl_so_det WHERE id_ref = %s AND id_brg = %s',
              [Values[i, f.cxColIdSO.Index], Values[i, f.cxColIdBrg.Index]]);
            cxtbSJ.DataController.Values[row, cxColHarga.Index] := qhrg.FieldByname('harga').AsFloat;
            qhrg.Close;

            qbrg := OpenRS('SELECT jml_ikat_per_karung FROM tbl_barang_det_spek WHERE id_ref = %s',
              [Values[i, f.cxColIdBrg.Index]]);
            cxtbSJ.DataController.Values[row, cxColJmlIkatPerBal.Index] := qbrg.FieldbyName('jml_ikat_per_karung').AsInteger;
            qbrg.Close;

            cxtbSJ.DataController.Values[row, cxColTotal.Index] :=
              cxtbSJ.DataController.Values[row, cxColHarga.Index] * cxtbSJ.DataController.Values[row, cxColQty.Index];
          end
          else begin

            j := cxtbSJ.DataController.AppendRecord;
            cxtbSJ.DataController.Values[j, cxColIdBrg.Index] := Values[i, f.cxColIdBrg.Index];
            cxtbSJ.DataController.Values[j, cxColIdSO.Index] := Values[i, f.cxColIdSO.Index];
            cxtbSJ.DataController.Values[j, cxColKodeBrg.Index] := Values[i,f.cxColKodeBrg.Index];
            cxtbSJ.DataController.Values[j, cxColDeskripsi.Index] := Values[i,f.cxColDeskripsi.Index];
            cxtbSJ.DataController.Values[j, cxColNoSO.Index] := Values[i, f.cxColNoSO.Index];
            cxtbSJ.DataController.Values[j, cxColQtySO.Index] := Values[i, f.cxColQtySO.Index];
            cxtbSJ.DataController.Values[j, cxColQty.Index] := Values[i, f.cxColJmlKirim.Index];
            cxtbSJ.DataController.Values[j, cxColQtyTerkirim.Index] := Values[i, f.cxColQtyTerkirim.Index];

            cxtbSJ.DataController.Values[j, cxColGudang.Index] := Values[i, f.cxColGdg.Index];
            cxtbSJ.DataController.Values[j, cxColSatuan.Index] := Values[i, f.cxColSatuan.Index];
            cxtbSJ.DataController.Values[j, cxColIdSatuan.Index] := Values[i, f.cxColIdSatuan.Index];

            qhrg := OpenRS('SELECT harga FROM tbl_so_det WHERE id_ref = %s AND id_brg = %s',
              [Values[i, f.cxColIdSO.Index], Values[i, f.cxColIdBrg.Index]]);
            cxtbSJ.DataController.Values[j, cxColHarga.Index] := qhrg.FieldByname('harga').AsFloat;
            qhrg.Close;

            qbrg := OpenRS('SELECT jml_ikat_per_karung FROM tbl_barang_det_spek WHERE id_ref = %s',
              [Values[i, f.cxColIdBrg.Index]]);
            cxtbSJ.DataController.Values[j, cxColJmlIkatPerBal.Index] := qbrg.FieldbyName('jml_ikat_per_karung').AsInteger;
            qbrg.Close;

            cxtbSJ.DataController.Values[j, cxColTotal.Index] :=
              cxtbSJ.DataController.Values[j, cxColHarga.Index] * cxtbSJ.DataController.Values[j, cxColQty.Index];
          end;
        end;
      end;
      HitungTotal;
    end;
    cxtbSJ.EndUpdate;
  end;
end;

procedure TfrmInputSuratJalan.cxChkPPNClick(Sender: TObject);
var
  sNoSJ, sNoFaktur: string;
begin
  inherited;
  if cxChkPPN.Checked then begin
    if Self.Jenis = 'T' then begin
      sNoSJ := GetLastFak('sj-pajak');
      sNoFaktur := GetLastFak('faktur-pajak');
    end;
    cxsPPN.Value := 10;
  end
  else begin
    if Self.Jenis = 'T' then begin
      cxsPPN.Value := 0;
      sNoSJ := GetLastFak('sj');
    end;
    sNoFaktur := '';
  end;
  if Self.Jenis = 'T' then begin
    cxtNoBukti.Text := sNoSJ;
    cxtNoFaktur.Text := sNoFaktur;
  end;

  HitungTotal;
end;

procedure TfrmInputSuratJalan.cxChkSJTanpaSOClick(Sender: TObject);
begin
  inherited;
  btnPilihSO.Visible := not cxChkSJTanpaSO.Checked;
  cxgSJ.Visible := not cxChkSJTanpaSO.Checked;
  cxgSJTanpaSO.Visible := cxChkSJTanpaSO.Checked;
  btnSimpan.Visible := not cxChkSJTanpaSO.Checked;
  btnSimpan2.Visible := cxChkSJTanpaSO.Checked;
end;

procedure TfrmInputSuratJalan.cxColNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var
  row : Integer;
begin
  inherited;
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;


procedure TfrmInputSuratJalan.cxColNoSOPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  f: TfrmPilihSO;
  i: integer;
  q: TZQuery;
begin
  inherited;
  try
  i := cxtbSJ.DataController.GetFocusedRecordIndex;
  f := TfrmPilihSO.Create(Self);
  f.IdBrg := cxtbSJ.DataController.Values[i, cxColDeskripsi.Index];
  f.IdCust := cxlCustomer.EditValue;
  if f.ShowModal = mrOk then begin
    q := OpenRS('SELECT a.no_bukti, b.qty, b.harga FROM tbl_so_head a INNER JOIN tbl_so_det b ON a.id = b.id_ref WHERE a.id = %d', [f.IdSO]);
    cxtbSJ.DataController.Values[i, cxColNoSO.Index] := q.FieldByName('no_bukti').AsString;
    cxtbSJ.DataController.Values[i, cxColIdSO.Index] := f.idSO;
    cxtbSJ.DataController.Values[i, cxColQtySO.Index] := q.FieldByName('qty').AsFloat;
    cxtbSJ.DataController.Values[i, cxColHarga.Index] := q.FieldByName('harga').AsFloat;
    q.Close;
    q := OpenRS('SELECT SUM(qty) qty_kirim FROM tbl_sj_det WHERE id_so = %d AND id_brg = %s',
      [f.IdSO, cxtbSJ.DataController.Values[i, cxColDeskripsi.Index]]);
    cxtbSJ.DataController.Values[i, cxColQtyTerkirim.Index] := q.FieldByName('qty_kirim').AsFloat;
    q.Close;
  end;
  f.Free;
  finally
  end;
end;

procedure TfrmInputSuratJalan.cxlCustomerPropertiesChange(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  q := OpenRS('SELECT alamat, alamat2, kota, provinsi FROM tbl_customer ' +
    'WHERE id = %s',[cxlCustomer.EditValue]);
  cxtAlamat.Text := q.FieldbyName('alamat').AsString + ' ' + q.FieldByname('alamat2').AsString +
    ', ' + q.FieldByName('kota').AsString + ', ' + q.FieldByname('provinsi').AsString;
  q.Close;
  cxtbSJ.DataController.RecordCount := 0;
end;

procedure TfrmInputSuratJalan.cxsDiskonPropertiesChange(Sender: TObject);
begin
  inherited;
  HitungTotal;
end;

procedure TfrmInputSuratJalan.cxtbBarangMasukDataControllerBeforePost(
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
        MsgBox('Item tersebut sudah ada.');
        ADataController.DeleteRecord(i);
        Abort
      end;
    end;
  end;

  if (VarIsNull(ADataController.Values[i, cxColKodeBrg.Index])) or
      (Trim(ADataController.Values[i, cxColKodeBrg.Index]) = '')  then begin
      MsgBox('Kode barang harus diisi.');
      Abort;
  end;

  if (VarIsNull(ADataController.Values[i, cxColGudang.Index])) or
      (Trim(ADataController.Values[i, cxColGudang.Index]) = '')  then begin
      MsgBox('Kode gudang harus diisi.');
      Abort;
  end;

  {
  if ADataController.Values[i, cxColQty.Index] <= 0 then begin
    MsgBox('Qty tidak boleh minus');
    Abort;
  end;
  }
end;

procedure TfrmInputSuratJalan.cxtbBarangMasukDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
  t, t1, t2, t3 : Real;
  i: Integer ;
begin
  inherited;
  {
  if AItemIndex = cxColDeskripsi.Index then begin
    try
      cxtbSJ.BeginUpdate;
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
      [ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg.Index] :=  q.FieldByName('kode').AsString;
      ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      q.Close;
    finally
      cxtbSJ.EndUpdate
    end;
  end;

  if AItemIndex = cxColGudang.Index then begin
    try
      q := OpenRS('SELECT sf_getstok_per_gdg(%s,%s) as stok',
        [ADataController.Values[ARecordIndex, cxColDeskripsi.Index], ADataController.Values[ARecordIndex, cxColGudang.Index]]);
      ADataController.Values[ARecordIndex, cxColStokLama.Index] := q.FieldByName('stok').AsFloat;
      q.Close;
    finally

    end;
  end;
  }
end;

procedure TfrmInputSuratJalan.cxtbSJDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  try
    HitungTotal;
  finally
  end;
end;

procedure TfrmInputSuratJalan.cxtbSJDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
  sa: real;
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

  if (VarIsNull(ADataController.Values[i, cxColKodeBrg.Index])) or
      (Trim(ADataController.Values[i, cxColKodeBrg.Index]) = '')  then begin
    MsgBox('Kode barang harus diisi.');
    Abort;
  end;

  if (VarIsNull(ADataController.Values[i, cxColGudang.Index])) or
      (Trim(ADataController.Values[i, cxColGudang.Index]) = '')  then begin
    MsgBox('Kode gudang harus diisi.');
    Abort;
  end;

  {
  sa := GetStokAkhir(ADataController.Values[i, cxColDeskripsi.Index], ADataController.Values[i, cxColGudang.Index]);
  if sa < ADataController.Values[i, cxColQty.Index] then begin
    MsgBox('Stok barang tidak mencukupi. Stok : ' + FormatFloat('#,#0.00', sa));
    Abort;
  end;
  }
end;

procedure TfrmInputSuratJalan.cxtbSJDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
  t, t1, t2, t3 : Real;
  i: Integer ;
begin
  inherited;

  {
  if AItemIndex = cxColDeskripsi.Index then begin
    try
      cxtbSJ.BeginUpdate;
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
      [ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg.Index] :=  q.FieldByName('kode').AsString;
      ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
      q.Close;

      q := OpenRS('SELECT * FROM tbl_barang_det_spek WHERE id_ref = %s',
        [ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
      ADataController.Values[ARecordIndex, cxColJmlIkatPerBal.Index] := q.FieldByName('jml_ikat_per_karung').AsFloat;
      q.Close;

    finally
      cxtbSJ.EndUpdate
    end;
  end;
  }

  if (AItemIndex = cxColHargaIkat.Index) or (AItemIndex = cxColQty.Index) then begin
    try
      ADataController.Values[ARecordIndex, cxColHarga.Index] :=
        ADataController.Values[ARecordIndex, cxColHargaIkat.Index] *
        ADataController.Values[ARecordIndex, cxColJmlIkatPerBal.Index];
      ADataController.Values[ARecordIndex, cxColTotal.Index] :=
        ADataController.Values[ARecordIndex, cxColQty.Index] * ADataController.Values[ARecordIndex, cxColHarga.Index];
    finally
    end;
    HitungTotal;
  end;

  {
  if AItemIndex = cxColGudang.Index then begin
    if VarIsNull(ADataController.Values[ARecordIndex, cxColDeskripsi.Index]) then begin
      ADataController.Values[ARecordIndex, cxColGudang.Index] := '';
      Abort;
    end;
    try
      q := OpenRS('SELECT sf_getstok_per_gdg(%s,%s) as stok',
        [ADataController.Values[ARecordIndex, cxColDeskripsi.Index], ADataController.Values[ARecordIndex, cxColGudang.Index]]);
      ADataController.Values[ARecordIndex, cxColStokLama.Index] := q.FieldByName('stok').AsFloat;
      q.Close;
    finally

    end;
  end;
  }

end;

procedure TfrmInputSuratJalan.cxtbSJTanpaSODataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  try
    HitungTotal;
  except
  end;
end;

procedure TfrmInputSuratJalan.cxtbSJTanpaSODataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  i,j,k: integer;
  v: variant;
  sa: real;
begin
  inherited;
  i := ADataController.FocusedRowIndex;
  k := ADataController.GetEditingRecordIndex;
  v := ADataController.Values[i, cxColKodeBrg2.Index];

  for j := 0 to ADataController.RecordCount - 1 do begin
    if j <> k then begin
      if v = ADataController.Values[j, cxColKodeBrg2.Index] then begin
        MsgBox('Item tersebut sudah ada.');
        ADataController.DeleteRecord(i);
        Abort
      end;
    end;
  end;

  if (VarIsNull(ADataController.Values[i, cxColKodeBrg2.Index])) or
      (Trim(ADataController.Values[i, cxColKodeBrg2.Index]) = '')  then begin
    MsgBox('Kode barang harus diisi.');
    Abort;
  end;

  if (VarIsNull(ADataController.Values[i, cxColGudang2.Index])) or
      (Trim(ADataController.Values[i, cxColGudang2.Index]) = '')  then begin
    MsgBox('Kode gudang harus diisi.');
    Abort;
  end;

  if (VarIsNull(ADataController.Values[i, cxColQty2.Index])) or
      (ADataController.Values[i, cxColQTy2.Index] = 0)  then begin
    MsgBox('Qty. kirim harus di isi.');
    Abort;
  end;

  sa := GetStokAkhir(ADataController.Values[i, cxColDeskripsi2.Index], ADataController.Values[i, cxColGudang2.Index]);
  if sa < ADataController.Values[i, cxColQty2.Index] then begin
    MsgBox('Stok barang tidak mencukupi. Stok : ' + FormatFloat('#,#0.00', sa));
    Abort;
  end;

end;
procedure TfrmInputSuratJalan.cxtbSJTanpaSODataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
  t, t1, t2, t3, sa : Real;
  i: Integer ;
begin
  inherited;

  if AItemIndex = cxColDeskripsi2.Index then begin
    try
      cxtbSJTanpaSO.BeginUpdate;
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
        [ADataController.Values[ARecordIndex, cxColDeskripsi2.Index]]);
      ADataController.Values[ARecordIndex, cxColKodeBrg2.Index] :=  q.FieldByName('id').AsString;
      ADataController.Values[ARecordIndex, cxColSatuan2.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan2.Index] := q.FieldByName('id_satuan').AsInteger;
      ADataController.Values[ARecordIndex, cxColKodeBrg3.Index] := q.FieldByName('kode').AsString;
      q.Close;

      q := OpenRS('SELECT * FROM tbl_barang_det_spek WHERE id_ref = %s',
        [ADataController.Values[ARecordIndex, cxColDeskripsi2.Index]]);
      ADataController.Values[ARecordIndex, cxColJmlIkatPerBal2.Index] := q.FieldByName('jml_ikat_per_karung').AsFloat;
      q.Close;
    finally
      cxtbSJTanpaSO.EndUpdate
    end;
  end;

  if AItemIndex = cxColKodeBrg2.Index then begin
    try
      cxtbSJTanpaSO.BeginUpdate;
      q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = %s',
        [ADataController.Values[ARecordIndex, AItemIndex]]);
      ADataController.Values[ARecordIndex, cxColDeskripsi2.Index] :=  q.FieldByName('id').AsString;
      ADataController.Values[ARecordIndex, cxColSatuan2.Index] := q.FieldByName('satuan2').AsString;
      ADataController.Values[ARecordIndex, cxColIdSatuan2.Index] := q.FieldByName('id_satuan').AsInteger;
      ADataController.Values[ARecordIndex, cxColKodeBrg3.Index] := q.FieldByName('kode').AsString;
      q.Close;

      q := OpenRS('SELECT * FROM tbl_barang_det_spek WHERE id_ref = %s',
        [ADataController.Values[ARecordIndex, cxColDeskripsi2.Index]]);
      ADataController.Values[ARecordIndex, cxColJmlIkatPerBal2.Index] := q.FieldByName('jml_ikat_per_karung').AsFloat;
      q.Close;
    finally
      cxtbSJTanpaSO.EndUpdate
    end;
  end;

  if (AItemIndex = cxColHargaIkat2.Index) or (AItemIndex = cxColQty2.Index) then begin
    try
      cxtbSJTanpaSO.BeginUpdate;
      ADataController.Values[ARecordIndex, cxColHarga2.Index] :=
        ADataController.Values[ARecordIndex, cxColHargaIkat2.Index] *
        ADataController.Values[ARecordIndex, cxColJmlIkatPerBal2.Index];
      ADataController.Values[ARecordIndex, cxColTotal2.Index] :=
        ADataController.Values[ARecordIndex, cxColQty2.Index] * ADataController.Values[ARecordIndex, cxColHarga2.Index];
    finally
      cxtbSJTanpaSO.EndUpdate;
    end;
    HitungTotal;
  end;

  if AItemIndex = cxColGudang2.Index then begin
    try

      if VarIsNull(ADataController.Values[ARecordIndex, cxColDeskripsi2.Index]) then begin
        ADataController.Values[ARecordIndex, cxColGudang.Index] := '';
        Abort;
      end;
    finally

    end;
  end;



end;

procedure TfrmInputSuratJalan.FormCreate(Sender: TObject);
begin
  inherited;
  cxdTglDatang.Date := Aplikasi.Tanggal;
  zqrBarang.Open;
  zqrGudang.Open;
  zqrCust.Open;

  cxgSJTanpaSO.Top := cxgSJ.Top;
  cxgSJTanpaSO.Left := cxgSJ.Left;

  btnSimpan2.Left := btnSimpan.Left;
end;

procedure TfrmInputSuratJalan.FormShow(Sender: TObject);
  var
   q,z : TZQuery;
   i, nomer: integer;
   sNoTrs : string;
begin
  inherited;

  if Self.Jenis = 'T' then begin
    sNoTrs := GetLastFak('sj');
    cxtNoBukti.Text := sNoTrs;
    cxgSJ.Visible := True;
    cxgSJTanpaSO.Visible := False;
    btnSimpan2.Visible := False;
  end
  else if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_sj_head WHERE id = %s',[Self.EditKey]);

    if q.FieldByName('jenis_sj').AsInteger = 0 then begin

      btnSimpan2.Visible := False;
      cxgSJTanpaSO.Visible := False;
      cxChkSJTanpaSO.Properties.ReadOnly := True;
      cxtNoBukti.Text := q.FieldByName('no_bukti').AsString;
      cxtKeterangan.Text := q.FieldByName('keterangan').AsString;
      cxlCustomer.EditValue := q.FieldByName('id_cust').AsInteger;
      cxdTglJthTempo.Date := q.FieldByname('jatuh_tempo').AsDateTime;
      if q.FieldByName('f_ppn').AsInteger = 1 then
        cxChkPPN.Checked := True;
      cxsDiskon.Value := q.FieldByname('diskon').AsFloat;
      cxtNoFaktur.Text := q.FieldByName('no_faktur').AsString;
      cxtSopir.Text := q.FieldByName('sopir').AsString;
      cxtNopol.Text := q.FieldByName('nopol').AsString;
      cxtNoFaktur.Text := q.FieldByName('no_faktur').AsString;
      q.Close;

      z := OpenRS('SELECT a.*, b.deskripsi, c.satuan satuan2, d.jml_ikat_per_karung, e.no_bukti no_so2, e.qty qty_so2 ' +
        'FROM tbl_sj_det a ' +
        'left join tbl_barang b on a.id_brg = b.id ' +
        'LEFT JOIN tbl_satuan c on c.id = a.id_satuan ' +
        'LEFT JOIN tbl_barang_det_spek d on d.id_ref = a.id_brg ' +
        'LEFT JOIN tbl_so_det e on e.id_ref = a.id_so and e.id_brg = a.id_brg ' +
        'WHERE a.id_ref = %s',[Self.EditKey]);
      nomer := 1;

      cxtbSJ.DataController.OnRecordChanged := nil;
      while not z.Eof do begin
        with cxtbSJ.DataController do begin
          i := AppendRecord;
          Values[i, cxColNo.Index] := nomer;
          Values[i, cxColKodeBrg.Index] := z.FieldByName('kode_brg').AsString;
          Values[i, cxColDeskripsi.Index] := z.FieldByName('deskripsi').AsString;
          Values[i, cxColNoSO.Index] := z.FieldByName('no_so2').AsString;
          Values[i, cxColQtySO.Index] := z.FieldByname('qty_so2').AsFloat;
          Values[i, cxColQty.Index] := z.FieldByName('qty').AsFloat;
          Values[i, cxColSatuan.Index] := z.FieldByName('satuan2').AsString;
          Values[i, cxColIdSatuan.Index] := z.FieldByname('id_satuan').AsInteger;
          Values[i, cxColKeterangan.Index] := z.FieldByName('keterangan').AsString;
          Values[i, cxColHargaIkat.Index] := z.FieldByName('hrgikat').AsFloat;
          Values[i, cxColHarga.Index] := z.FieldByname('harga').AsFloat;
          Values[i, cxColTotal.Index] := z.FieldByname('harga').AsFloat * z.FieldByname('qty').AsFloat;
          Values[i, cxColGudang.Index] := z.FieldByName('id_gdg').AsInteger;
          Values[i, cxColJmlIkatPerBal.Index] := z.FieldByName('jml_ikat_per_karung').AsFloat;
          Values[i, cxColIdSO.Index] := z.FieldByName('id_so').AsInteger;
          Values[i, cxColIdBrg.Index] := z.FieldByName('id_brg').AsInteger;
          nomer := nomer +1;
        end;
        z.Next;
      end;
      z.Close;
      cxtbSJ.DataController.OnRecordChanged := Self.cxtbSJDataControllerRecordChanged;

      HitungTotal;
    end
    else begin

      cxChkSJTanpaSO.Checked := True;
      cxChkSJTanpaSO.Properties.ReadOnly := True;
      btnSimpan2.Visible := True;
      btnSimpan.Visible := False;
      cxtNoBukti.Text := q.FieldByName('no_bukti').AsString;
      cxtKeterangan.Text := q.FieldByName('keterangan').AsString;
      cxlCustomer.EditValue := q.FieldByName('id_cust').AsInteger;
      cxdTglJthTempo.Date := q.FieldByname('jatuh_tempo').AsDateTime;
      if q.FieldByName('f_ppn').AsInteger = 1 then
        cxChkPPN.Checked := True;
      cxsDiskon.Value := q.FieldByname('diskon').AsFloat;
      cxtNoFaktur.Text := q.FieldByName('no_faktur').AsString;
      cxtSopir.Text := q.FieldByName('sopir').AsString;
      cxtNopol.Text := q.FieldByName('nopol').AsString;
      cxtNoFaktur.Text := q.FieldByName('no_faktur').AsString;
      q.Close;

      z := OpenRS('SELECT a.*, b.deskripsi, c.satuan satuan2, d.jml_ikat_per_karung, e.no_bukti no_so2, e.qty qty_so2 ' +
        'FROM tbl_sj_det a ' +
        'left join tbl_barang b on a.id_brg = b.id ' +
        'LEFT JOIN tbl_satuan c on c.id = a.id_satuan ' +
        'LEFT JOIN tbl_barang_det_spek d on d.id_ref = a.id_brg ' +
        'LEFT JOIN tbl_so_det e on e.id_ref = a.id_so and e.id_brg = a.id_brg ' +
        'WHERE a.id_ref = %s',[Self.EditKey]);
      nomer := 1;

      cxtbSJTanpaSO.DataController.OnRecordChanged := nil;
      while not z.Eof do begin
        with cxtbSJTanpaSO.DataController do begin
          i := AppendRecord;
          Values[i, cxColKodeBrg2.Index] := z.FieldByName('id_brg').AsString;
          Values[i, cxColDeskripsi2.Index] := z.FieldByName('id_brg').AsString;
          Values[i, cxColQty2.Index] := z.FieldByName('qty').AsFloat;
          Values[i, cxColSatuan2.Index] := z.FieldByName('satuan2').AsString;
          Values[i, cxColIdSatuan2.Index] := z.FieldByname('id_satuan').AsInteger;
          Values[i, cxColKeterangan2.Index] := z.FieldByName('keterangan').AsString;
          Values[i, cxColHargaIkat2.Index] := z.FieldByName('hrgikat').AsFloat;
          Values[i, cxColHarga2.Index] := z.FieldByname('harga').AsFloat;
          Values[i, cxColTotal2.Index] := z.FieldByname('harga').AsFloat * z.FieldByname('qty').AsFloat;
          Values[i, cxColGudang2.Index] := z.FieldByName('id_gdg').AsInteger;
          Values[i, cxColJmlIkatPerBal2.Index] := z.FieldByName('jml_ikat_per_karung').AsFloat;
          Values[i, cxColKodeBrg3.Index] := z.FieldByName('kode_brg').AsString;
          nomer := nomer +1;
        end;
        z.Next;
      end;
      z.Close;
      cxtbSJTanpaSO.DataController.OnRecordChanged := Self.cxtbSJTanpaSODataControllerRecordChanged;

      HitungTotal;
      cxgSJ.Visible := False;
      cxgSJTanpaSO.Visible := True;
    end;
  end;

end;

procedure TfrmInputSuratJalan.HitungTotal;
var
  i: integer;
  tot, diskon, ppn: real;
begin
  try
    if cxChkSJTanpaSO.Checked then begin
      tot := 0;
      for i := 0 to cxtbSJTanpaSO.DataController.RecordCount - 1 do begin
        tot := tot +cxtbSJTanpaSO.DataController.Values[i, cxColTotal2.Index];
      end;

      diskon := 0;
      if cxsDiskon.Value > 0 then
        diskon := (cxsDiskon.Value /100) * tot;

      cxsStlhDiskon.Value := tot - diskon;

      if cxChkPPN.Checked then
        cxsDPP.Value := cxsStlhDiskon.Value / 1.1
      else
        cxsDPP.Value := 0;

      ppn := 0;
      if cxChkPPN.Checked then
        ppn := (10 / 100) * cxsDPP.Value;

      cxsHargaTotal.Value := cxsDPP.Value + ppn;
    end
    else begin
      tot := 0;
      for i := 0 to cxtbSJ.DataController.RecordCount - 1 do begin
        tot := tot + cxtbSJ.DataController.Values[i, cxColTotal.Index];
      end;

      diskon := 0;
      if cxsDiskon.Value > 0 then
        diskon := (cxsDiskon.Value /100) * tot;

      cxsStlhDiskon.Value := tot - diskon;

      if cxChkPPN.Checked then
        cxsDPP.Value := cxsStlhDiskon.Value / 1.1
      else
        cxsDPP.Value := 0;

      ppn := 0;
      if cxChkPPN.Checked then
        ppn := (10 / 100) * cxsDPP.Value;

      cxsHargaTotal.Value := cxsDPP.Value + ppn;
    end;
  except
  end;
end;

procedure TfrmInputSuratJalan.Posting(IDSJ: Integer);
var
  zqrSJ, qd, q, qbrg: TZQuery;
begin
  inherited;
  try
    dm.zConn.StartTransaction;
    Screen.Cursor := crSQLWait;

    zqrSJ := OpenRS('SELECT * FROM tbl_sj_head WHERE id = %d', [IDSJ]);

    q := OpenRS('SELECT * FROM tbl_history WHERE no_bukti = ''%s''',[zqrSJ.FieldByName('no_bukti').AsString]);
    qd := OpenRS('SELECT * FROM tbl_sj_det WHERE id_ref = %s',[zqrSJ.FieldByName('id').AsString]);

    while not qd.Eof do begin
      with q do begin
        Insert;
        FieldByName('no_bukti').AsString := zqrSJ.FieldByName('no_bukti').AsString;
        FieldByName('tanggal').AsDateTime := Aplikasi.TanggalServer;
        FieldByName('kode_brg').AsString := qd.FieldByName('kode_brg').AsString;
        FieldByName('id_brg').AsInteger := qd.FieldByName('id_brg').AsInteger;
        FieldByName('qty').AsFloat := qd.FieldByName('qty').AsFloat;
        FieldByName('tipe').AsString := 'o';
        FieldByName('id_satuan').AsInteger := qd.FieldByName('id_satuan').AsInteger;
        FieldByname('id_gdg').AsInteger := qd.FieldByName('id_gdg').AsInteger;
        FieldByName('keterangan').AsString := qd.FieldByName('keterangan').AsString;
        FieldByName('tgl_input').AsDateTime := Aplikasi.NowServer;
        FieldByName('user').AsString := Aplikasi.NamaUser;
        FieldByName('user_dept').AsString := Aplikasi.UserDept;
        FieldByName('id_so').AsInteger := qd.FieldByName('id_so').AsInteger;
        Post;
      end;

      qbrg := OpenRS('SELECT * FROM tbl_barang WHERE id = %s',[qd.FieldByName('id_brg').AsString]);
      qbrg.Edit;
      qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat - qd.FieldByName('qty').AsFloat;
      qbrg.Post;
      qbrg.Close;

      qbrg := OpenRS('SELECT * FROM tbl_barang_det WHERE id_brg = %s AND id_gdg = %s',
        [qd.FieldByName('id_brg').AsString, qd.FieldByName('id_gdg').AsString]);
      if qbrg.IsEmpty then begin
        qbrg.Insert;
        qbrg.FieldByName('id_brg').AsInteger := qd.FieldByName('id_brg').AsInteger;
        qbrg.FieldByName('kode_brg').AsString := qd.FieldByName('kode_brg').AsString;
        qbrg.FieldByName('id_gdg').AsInteger := qd.FieldByName('id_gdg').AsInteger;
      end
      else
        qbrg.Edit;
      qbrg.FieldByName('stok').AsFloat := qbrg.FieldByName('stok').AsFloat - qd.FieldByName('qty').AsFloat;
      qbrg.Post;
      qbrg.Close;

      dm.zConn.ExecuteDirect(Format('UPDATE tbl_sj_head SET f_posting = 1 WHERE id = %s',
        [zqrSJ.FieldByName('id').AsString]));

      qd.Next;
    end;

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

function TfrmInputSuratJalan.CheckSOComplete: boolean;
var
  q: TZQuery;
  f: Boolean;
  a,b: Extended;
  i: integer;
begin
  for i := 0 to cxtbSJ.DataController.RecordCount - 1 do begin
    with cxtbSJ.DataController do begin
      q := OpenRS('SELECT a.id_brg, a.qty, (SELECT SUM(qty) FROM tbl_sj_det WHERE id_so = a.id_ref AND id_brg = a.id_brg) qty_kirim ' +
        'FROM tbl_so_det a WHERE a.id_ref = %s',[Values[i, cxColIdSO.Index]]);
      f := False;
      while not q.Eof do begin
        a := q.FieldByName('qty').AsFloat;
        b := q.FIeldByName('qty_kirim').AsFloat;
        if CompareValue(a, b) = 0 then
          f := true
        else begin
          f := false;
          Break;
        end;
        q.Next;
      end;

      if f then
        dm.zConn.ExecuteDirect(Format('UPDATE tbl_so_head SET f_completed = 1 WHERE id = %s',[Values[i, cxColIdSO.Index]]));
    end;
  end;
end;

end.
