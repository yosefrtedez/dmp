unit unFrmAppRetur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCheckBox, cxSpinEdit, cxContainer, ZAbstractRODataset, ZDataset,
  cxLabel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmAppRetur = class(TfrmTplInput)
    Label13: TLabel;
    cxgrd1: TcxGrid;
    cxTblAppReturHead: TcxGridDBTableView;
    cxTblDet: TcxGridDBTableView;
    cxColTblDetid: TcxGridDBColumn;
    cxColTblDetid_ref: TcxGridDBColumn;
    cxColTblDetno_bukti: TcxGridDBColumn;
    cxColTblDetkode_brg: TcxGridDBColumn;
    cxColTblDetdeskripsi: TcxGridDBColumn;
    cxColTblDetqty: TcxGridDBColumn;
    cxColTblDetsatuan: TcxGridDBColumn;
    cxColTblDetharga: TcxGridDBColumn;
    cxColTblDetmata_uang: TcxGridDBColumn;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    Panel5: TPanel;
    cxLabel1: TcxLabel;
    cxGrid1: TcxGrid;
    cxTblAppReturDet: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    zqrRet: TZReadOnlyQuery;
    dsRet: TDataSource;
    zqrRetDet: TZReadOnlyQuery;
    dsRetDet: TDataSource;
    cxColTblAppReturDetno_bukti: TcxGridDBColumn;
    cxColTblAppReturDetkode_brg: TcxGridDBColumn;
    cxColTblAppReturDetqty: TcxGridDBColumn;
    cxColTblAppReturDetketerangan: TcxGridDBColumn;
    cxColTblAppReturDetharga: TcxGridDBColumn;
    cxColTblAppReturDetmata_uang: TcxGridDBColumn;
    cxColTblAppReturDetnilai_tukar: TcxGridDBColumn;
    cxColTblAppReturDetppn: TcxGridDBColumn;
    cxColTblAppReturDetdeskripsi: TcxGridDBColumn;
    cxColTblAppReturDetkode: TcxGridDBColumn;
    cxColTblAppReturDetsatuan: TcxGridDBColumn;
    cxColTblAppReturDettotal: TcxGridDBColumn;
    cxColTblAppReturHeadno_bukti: TcxGridDBColumn;
    cxColTblAppReturHeadid_invoice: TcxGridDBColumn;
    cxColTblAppReturHeadketerangan: TcxGridDBColumn;
    cxColTblAppReturHeadtanggal: TcxGridDBColumn;
    cxColTblAppReturHeaduser: TcxGridDBColumn;
    cxColTblAppReturHeaduser_dept: TcxGridDBColumn;
    cxColTblAppReturHeadnama: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxTblAppReturHeadFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAppRetur: TfrmAppRetur;

implementation

uses unDM, unTools, unFrmLstReturPembelian;

{$R *.dfm}

procedure TfrmAppRetur.btnSimpanClick(Sender: TObject);
var
  i: Integer;
  lst: TStringList;
  chk, sNoBukti: string;
  qCek, qBrg, qGdg, qBrgDet, qHst: TZQuery;
begin

  lst := TStringList.Create;
  for i := 0 to cxTblAppReturHead.DataController.RecordCount - 1 do begin

    if VarIsNull(cxTblAppReturHead.DataController.Values[i,0]) then
      chk := ''
    else
      chk := cxTblAppReturHead.DataController.Values[i,0];

    if chk = 'T' then begin
      lst.Add(cxTblAppReturHead.DataController.Values[i,1]);
    end;
  end;

  if lst.Count > 0 then begin
    try
      dm.zConn.StartTransaction;
      for i := 0 to lst.Count - 1 do begin
        dm.zConn.ExecuteDirect(
          Format('UPDATE tbl_trsreturpemb_head SET f_app = 1, user_app = ''%s'', tgl_app = NOW() WHERE no_bukti = ''%s''',
          [Aplikasi.NamaUser, lst.Strings[i]]));

        qCek := OpenRS('SELECT a.no_bukti, a.tanggal, b.kode_brg, b.id_brg, b.id_satuan, b.id_gdg, c.deskripsi, c.satuan, b.qty, b.id_gdg,' +
        ' d.kode FROM tbl_trsreturpemb_head a LEFT JOIN tbl_trsreturpemb_det b ON a.no_bukti = b.no_bukti ' +
        'LEFT JOIN tbl_barang c ON b.kode_brg = c.kode LEFT JOIN tbl_gudang d ON b.id_gdg = d.id WHERE a.`no_bukti` = ''%s''',[lst.Strings[i]]);
        while not qCek.Eof do begin
          //update tbl_history
          qHst := OpenRS('select * from tbl_history where no_bukti = ''%s''',[qCek.FieldByName('no_bukti').AsString]);
          qHst.Insert;
          qHst.FieldByName('no_bukti').AsString := qCek.FieldByName('no_Bukti').AsString;
          qHst.FieldByName('tanggal').AsDateTime := qCek.FieldByName('tanggal').AsDateTime;
          qHst.FieldByName('jam').AsString := Aplikasi.JamString;
          qHst.FieldByName('kode_brg').AsString := qCek.FieldByName('kode_brg').AsString;
          qHst.FieldByName('id_brg').AsInteger := qCek.FieldByName('id_brg').AsInteger;
          qHst.FieldByName('tipe').AsString := 'i';
          qHst.FieldByName('qty').AsInteger := qCek.FieldByName('qty').AsInteger;
          qHst.FieldByName('satuan').AsString := qCek.FieldByName('satuan').AsString;
          qHst.FieldByName('id_satuan').AsInteger := qCek.FieldByName('id_satuan').AsInteger;
          qHst.FieldByName('gudang').AsString := qCek.FieldByName('kode').AsString;
          qHst.FieldByName('id_gdg').AsString := qCek.FieldByName('id_gdg').AsString;
          qHst.FieldByName('user').AsString := aplikasi.NamaUser;
          qHst.FieldByName('user_dept').AsString := Aplikasi.UserDept;
          //untuk so masih dikosongin dulu nunggu sistem selanjutnya
          qHst.FieldByName('no_so').AsString := '';
          qHst.FieldByName('tgl_input').AsDateTime := Aplikasi.Tanggal;
          qHst.Post;
          qHst.Close;

          //update tbl_barang
          qBrg := OpenRS('SELECT * from tbl_barang WHERE kode = ''%s''',[qCek.FieldByName('kode_brg').AsString]);
          if not qBrg.Eof then begin
            qBrg.Edit;
            qBrg.FieldByName('stok').AsFloat := qBrg.FieldByName('stok').AsFloat + qCek.FieldByName('qty').AsFloat;
            qBrg.Post;
          end;
          qBrg.Close;

          //update tbl_barang_det
          qBrgDet := OpenRS('select * from tbl_barang_det where kode_brg = ''%s'' and kode_gdg = ''%s''', [qCek.FieldByName('kode_brg').AsString, qCek.FieldByName('kode').AsString]);
          if not qBrgDet.Eof then begin
            qBrgDet.Edit;
            qBrgDet.FieldByName('stok').AsFloat := qBrgDet.FieldByName('stok').AsFloat + qCek.FieldByName('qty').AsFloat;
            qBrgDet.Post;
          end;
          qBrgDet.Close;
          qCek.Next;
        end;
      end;
      dm.zConn.Commit;
      MsgBox('Retur pembelian sudah di Approval.');
      zqrRet.Close;
      zqrRet.Open;
    except
      on E: Exception do begin
        MsgBox('Error: ' + E.Message);
        dm.zConn.Rollback;
      end;
    end;
  end;

end;

procedure TfrmAppRetur.cxTblAppReturHeadFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrRetDet.Close;
    zqrRetDet.ParamByName('id_ref').AsInteger := zqrRet.FieldByName('id').AsInteger;
    zqrRetDet.Open;
  except
  end;
end;

procedure TfrmAppRetur.FormCreate(Sender: TObject);
begin
  inherited;
  zqrRet.Open;
end;

procedure TfrmAppRetur.FormShow(Sender: TObject);
var
  aCol: TcxGridDBColumn;
  i : integer;
begin
  aCol := cxTblAppReturHead.CreateColumn;
  with aCol do begin
    Name := 'colUnbound';
    Caption := 'Check';
  end;
  aCol.DataBinding.ValueTypeClass := TcxStringValueType;
  aCol.PropertiesClass := TcxCheckBoxProperties;
  with aCol.Properties as TcxCheckBoxProperties do begin
    AllowGrayed := false;
    ValueChecked := 'T';
    ValueUnchecked := 'F';
    NullStyle := nssUnchecked;
    ImmediatePost := True;
  end;
  aCol.Index := 0;
end;

End.
