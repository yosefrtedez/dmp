unit unFrmMasterOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxContainer, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, StdCtrls, ExtCtrls,ZDataset, ZAbstractRODataset, cxPC, cxSpinEdit;

type
  TfrmMasterOrder = class(TfrmTplInput)
    Label13: TLabel;
    Panel3: TPanel;
    cxtbMO: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel4: TPanel;
    cxdTgl1: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxdTgl2: TcxDateEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    btnProses: TButton;
    zqrMO: TZReadOnlyQuery;
    dsMO: TDataSource;
    cxtbMOno_mo: TcxGridDBColumn;
    cxtbMOno_so: TcxGridDBColumn;
    cxtbMOno_spk: TcxGridDBColumn;
    cxtbMOtgl_spk: TcxGridDBColumn;
    cxtbMOkode_brg: TcxGridDBColumn;
    cxtbMOqty_mo: TcxGridDBColumn;
    cxtbMOqty_so: TcxGridDBColumn;
    cxtbMOdeskripsi: TcxGridDBColumn;
    cxtbMOtanggal: TcxGridDBColumn;
    cxtbMOkode_customer: TcxGridDBColumn;
    cxtbMOnama_customer: TcxGridDBColumn;
    Panel5: TPanel;
    cxtbBOM: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxLabel3: TcxLabel;
    dsBOM: TDataSource;
    zqrBOM: TZReadOnlyQuery;
    cxtbBOMkode_brg: TcxGridDBColumn;
    cxtbBOMsatuan: TcxGridDBColumn;
    cxtbBOMqty: TcxGridDBColumn;
    cxtbBOMdeskripsi: TcxGridDBColumn;
    btnCetakSPK: TButton;
    cxtbMOColumn1: TcxGridDBColumn;
    cxColPengambilan: TcxGridDBColumn;
    cxtbMOColumn2: TcxGridDBColumn;
    cxtbMOColumn3: TcxGridDBColumn;
    cxtbMOColumn4: TcxGridDBColumn;
    cxCmbJenisSO: TcxComboBox;
    btnRefresh: TButton;
    procedure btnProsesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCetakSPKClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure cxtbMOFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMasterOrder: TfrmMasterOrder;

implementation

uses
  unDM, unTools, unFrmSPK, unFrmUtama, unFrmLapSPK;

{$R *.dfm}

procedure TfrmMasterOrder.btnCetakSPKClick(Sender: TObject);
var
  f: TFrmLapSPK;
begin
  inherited;
  if zqrMO.FieldByName('id_spk').IsNull then Abort;
  
  f := TfrmLapSPK.Create(Self);
  with f do begin
    zqrSPK.ParamByName('id_spk').AsInteger := zqrMO.FieldByName('id_spk').AsInteger;
    zqrSPK.Open;
    rptSPK.ShowReport(true);
  end;
  f.Release;
end;

procedure TfrmMasterOrder.btnProsesClick(Sender: TObject);
begin
  inherited;
  with zqrMO do begin
    if Active then Close;
    Screen.Cursor := crSQLWait;
    dm.zConn.ExecuteDirect('CALL sp_tmp_mo');
    //SQL.Text := cxMemo2.Lines.Text;
    ParamByName('tgl1').AsDateTime := cxdTgl1.Date;
    ParamByName('tgl2').AsDateTime := cxdTgl2.Date;
    if cxCmbJenisSO.Text = 'MTS' then
      SQL.Strings[2] := 'AND LEFT(no_so,3) = ''MTS'''
    else if cxCmbJenisSO.Text = 'SO CUSTOMER' then
      SQL.Strings[2] := 'AND LEFT(no_so,3) = ''SO/'''
    else
      SQL.Strings[2] := '-- ';
    Open;
    cxtbMOno_mo.SortOrder := soAscending;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMasterOrder.btnRefreshClick(Sender: TObject);
var
  bm: Variant;
begin
  inherited;
  try
    bm := zqrMO.Bookmark;
    zqrMO.Close;
    zqrMO.Open;
    zqrMO.Bookmark := bm;
  except
  end;
end;

procedure TfrmMasterOrder.Button1Click(Sender: TObject);
var
  f: TFrmSPK;
  ts: TcxTabSheet;
  q: TZQuery;
begin
  if not frmUtama.CekTabOpen('Surat Perintah Kerja (SPK)') then begin
    frmUtama.ToggleMainPage;
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmSPK.Create(nil);
    f.TabSheet := (Self.Parent as TcxTabSheet);
    f.Jenis := 'T';
    if not zqrMO.FieldByName('id_spk').IsNull then begin
      f.IDSPK := zqrMO.FieldByName('id_spk').AsInteger;
      f.Jenis := 'E';

      q := OpenRS('SELECT id_spk FROM tbl_history WHERE id_spk = %d', [zqrMO.FieldByName('id_spk').AsInteger]);
      if not q.IsEmpty then begin
        MsgBox('SPK ini tidak bisa di edit karena sudah ada transaksi (pengambilan bahan baku / hasil produksi).');
        f.Editable := False;
      end;
      q.Close;

    end;
    f.IDSO := zqrMO.FieldByName('id_so').AsInteger;
    f.IDMO := zqrMO.FieldByName('id').AsInteger;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.FormInduk := Self;
    f.Show;

    frmUtama.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmMasterOrder.Button3Click(Sender: TObject);
begin
  inherited;
  Self.btnBatalClick(nil);
end;

procedure TfrmMasterOrder.cxtbMOFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
  with zqrBOM do begin
    Close;
    ParamByName('id_spk').AsInteger := zqrMO.FieldByName('id_spk').AsInteger;
    Open;
  end;
  finally

  end;
end;

procedure TfrmMasterOrder.FormCreate(Sender: TObject);
begin
  inherited;
  cxdTgl1.Date := FDOM(Date);
  cxdTgl2.Date := LDOM(Date);

  cxCmbJenisSO.Properties.Items.CommaText := 'SEMUA,MTS,"SO CUSTOMER"';
  cxCmbJenisSO.ItemIndex := 1;
end;

end.
