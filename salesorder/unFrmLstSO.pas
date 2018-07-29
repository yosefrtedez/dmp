unit unFrmLstSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplGrid, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ZAbstractRODataset, ZDataset, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid,cxPC, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinValentine,
  dxSkinXmas2008Blue, cxSpinEdit, cxContainer, cxLabel;

type
  TfrmLstSO = class(TfrmTplGrid)
    Label1: TLabel;
    cxgCustomer: TcxGrid;
    cxtbSO: TcxGridDBTableView;
    cxgCustomerLevel1: TcxGridLevel;
    zqrSO: TZReadOnlyQuery;
    dsSO: TDataSource;
    cxtbSOno_bukti: TcxGridDBColumn;
    cxtbSOtanggal: TcxGridDBColumn;
    cxtbSOpo: TcxGridDBColumn;
    cxtbSOnama: TcxGridDBColumn;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxGrid1: TcxGrid;
    cxtbSODet: TcxGridDBTableView;
    cxtbSODetkode_brg: TcxGridDBColumn;
    cxtbSODetdeskripsi: TcxGridDBColumn;
    cxtbSODetqty: TcxGridDBColumn;
    cxtbSODetsatuan: TcxGridDBColumn;
    cxtbSODetharga: TcxGridDBColumn;
    cxtbSODetmata_uang: TcxGridDBColumn;
    cxtbSODetColumn1: TcxGridDBColumn;
    cxtbSODetColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dsSODet: TDataSource;
    zqrSODet: TZReadOnlyQuery;
    cxtbSOColumn1: TcxGridDBColumn;
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure cxtbSOFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLstSO: TfrmLstSO;

implementation

uses
  unDM, unTools, unFrmInputSO, unFrmUtama;

{$R *.dfm}

procedure TfrmLstSO.btnEditClick(Sender: TObject);
var
 f: TfrmInputSO;
 ts: TcxTabSheet;
 q: TZQuery;
begin
  inherited;
  if not fu.CekTabOpen('Edit Sales Order') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;
    f := TfrmInputSO.Create(Self);
    f.Jenis := 'E';
    f.Caption := 'Edit Sales Order';
    f.EditKey := zqrSO.FieldByName('id').AsString;
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

	  fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstSO.btnHapusClick(Sender: TObject);
begin
  inherited;
  try
    dm.zConn.StartTransaction;
    dm.zConn.ExecuteDirect('DELETE from tbl_so_head_dmp WHERE no_bukti = ''' + zqrSO.FieldByName('no_bukti').AsString + '''');
    dm.zConn.ExecuteDirect('DELETE from tbl_so_det_dmp WHERE no_bukti = ''' + zqrSO.FieldByName('no_bukti').AsString + '''');
    dm.zConn.Commit;
    MsgBox('No.SO: ' + zqrSO.FieldByName('no_bukti').AsString + ' sudah berhasil di Hapus.');
    zqrSO.Close;
    zqrSO.Open;
  except
    on E: Exception do begin
      MsgBox('Error: ' + E.Message);
      dm.zConn.Rollback;
    end;
  end;
end;

procedure TfrmLstSO.btnRefreshClick(Sender: TObject);
begin
  inherited;
  zqrSO.Close;
  zqrSO.Open;
end;

procedure TfrmLstSO.btnTambahClick(Sender: TObject);
var
  f: TfrmInputSO;
  ts: TcxTabSheet;
begin
  inherited;
  if not fu.CekTabOpen('Input Sales Order') then begin
    ts := TcxTabSheet.Create(Self);
    ts.PageControl := frmUtama.pgMain;

    f := TfrmInputSO.Create(Self);
    f.Jenis := 'T';
    f.Parent := ts;
    ts.Caption := f.Caption;
    f.Show;

    fu.pgMain.ActivePage := ts;
  end;
end;

procedure TfrmLstSO.cxtbSOFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  zqrSODet.Close;
  zqrSODet.ParamByName('id_ref').AsInteger := zqrSO.FieldByName('id').AsInteger;
  zqrSODet.Open;
end;

procedure TfrmLstSO.FormCreate(Sender: TObject);
begin
  inherited;
  Self.NamaMenu := 'mnMkt_SalesOrder';
  TerapkanWewenang(Self.NamaMenu);
  zqrSO.Open;
end;

end.
