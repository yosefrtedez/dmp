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
    cxtSatuan: TcxTextEdit;
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
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxtbBomDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure btnSimpanClick(Sender: TObject);
  private
    mIDSO: integer;
    mIDMO: integer;
    mIDSPK: Integer;
    mEditable: boolean;
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
  qh, qd: TZQuery;
  ID, i: integer;
begin
  inherited;

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
        else
          Edit;
        FieldByName('no_spk').AsString := sNoSPK;
        FieldByName('id_mo').AsInteger := mIDMO;
        FieldByName('id_so').AsInteger := mIDSO;
        FieldByName('tanggal').AsDateTime := cxdTglPrd.Date;
        FieldbyName('id_mesin').AsInteger := cxlMesin.EditValue;
        FieldByName('qty').AsFloat := cxsQtySPK.EditValue;
        FieldByName('user').AsString := Aplikasi.NamaUser;
        FieldByName('user_dept').AsString := Aplikasi.UserDept;
        FieldByName('toleransi').AsFloat := cxsToleransi.EditValue;
        Post;
      end;

      if Self.Jenis = 'T' then  ID := LastInsertID;

      qd := OpenRS('SELECT * FROM tbl_bom WHERE id_spk = %d',[ID]);
      with cxtbBom.DataController do begin
        for i := 0 to RecordCount - 1 do begin
          if Self.Jenis = 'T' then
            qd.Insert
          else begin
            qd.Locate('id_spk,id_brg',VarArrayOf([ID, Values[i, cxColDeskripsi.Index]]),[]);
            qd.Edit;
          end;
          qd.FieldByName('id_spk').AsInteger := ID;
          qd.FieldByName('kode_brg').AsString := Values[i, cxColKodeBrg.Index];
          qd.FieldByName('id_brg').AsInteger := Values[i, cxColDeskripsi.Index];
          qd.FieldByName('qty').AsFloat := Values[i, cxColQty.Index];
          qd.FieldByName('id_satuan').AsInteger := Values[i, cxColIdSatuan.Index];
          qd.Post;
        end;
      end;
      qd.Close;

      dm.zConn.Commit;

      MsgBox('SPK sudah disimpan dengan nomor: ' + sNoSPK);

      btnBatalClick(nil);
    except
      on E: Exception do begin
        dm.zConn.Rollback;
        MsgBox('Error: ' + E.Message);
      end;
    end;
  end;

end;

procedure TfrmSPK.cxtbBomDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
begin
  inherited;
  if AItemIndex = cxColDeskripsi.Index then begin
    q := OpenRS('SELECT a.kode, b.satuan, b.id id_satuan FROM tbl_barang a ' +
      'LEFT JOIN tbl_satuan b ON a.id_satuan = b.id WHERE a.id = ''%s''',[ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
    ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan').AsString;
    ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsString;
    ADataController.Values[ARecordIndex, cxColKodeBrg.Index] := q.FieldByName('kode').AsString;
    q.Close;
  end;
end;

procedure TfrmSPK.FormCreate(Sender: TObject);
begin
  inherited;
  zqrBrg.Open;
  zqrMesin.Open;
end;

procedure TfrmSPK.FormShow(Sender: TObject);
var
  q: TZQuery;
  i: integer;
begin
  inherited;

  q := OpenRS('SELECT a.* FROM v_mo a WHERE id = %d',[mIDMO]);

  cxtNoMO.Text := q.FieldByName('no_mo').AsString;
  cxtNoSO.Text := q.FieldByName('no_so').AsString;
  cxtKodeBrg.Text := q.FieldByName('kode_brg').AsString;
  cxtDeskripsi.Text := q.FieldByName('deskripsi').AsString;
  cxtSatuan.Text := q.FieldByName('satuan').AsString;
  cxsQtySPK.Value := q.FieldByName('qty_spk').AsFloat;
  cxsQtySO.Value := q.FieldbyName('qty_so').AsFloat;
  q.Close;

  if Self.Jenis = 'T' then
    cxtNoSPK.Text := GetLastFak('spk');

  if Self.Jenis = 'E' then begin
    q := OpenRS('SELECT * FROM tbl_spk WHERE id = %d',[mIDSPK]);
    cxtNoSPK.Text := q.FieldByName('no_spk').AsString;
    cxdTglPrd.Date := q.FieldByName('tanggal').AsDateTime;
    cxlMesin.EditValue := q.FieldByName('id_mesin').AsInteger;
    q.Close;

    q := OpenRS('SELECT a.*, b.satuan satuan2 FROM tbl_bom a LEFT JOIN tbl_satuan b on a.id_satuan = b.id WHERE a.id_spk = %d',[mIDSPK]);
    while not q.Eof do begin
      with cxtbBom.DataController do begin
        i := AppendRecord;
        Values[i, cxColKodeBrg.Index] := q.FieldByName('kode_brg').AsString;
        Values[i, cxColDeskripsi.Index] := q.FieldByName('id_brg').AsInteger;
        Values[i, cxColQty.Index] := q.FieldByName('qty').AsFloat;
        Values[i, cxColSatuan.Index] := q.FieldByName('satuan2').AsString;
        Values[i, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsInteger;
        Values[i, cxColId.Index] := q.FieldByName('id').AsInteger;
      end;
      q.Next;
    end;
  end;

end;

end.
