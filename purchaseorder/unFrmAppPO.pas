unit unFrmAppPO;

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
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCheckBox, cxSpinEdit, cxTextEdit,
  ZAbstractRODataset, ZDataset;

type
  TfrmAppPO = class(TfrmTplInput)
    lbl1: TLabel;
    cxgrd1: TcxGrid;
    cxTblHead: TcxGridTableView;
    cxColChkApp: TcxGridColumn;
    cxColID: TcxGridColumn;
    cxColNoPO: TcxGridColumn;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    pnl1: TPanel;
    cxColNoPP: TcxGridColumn;
    cxgrd2: TcxGrid;
    cxTblDetail: TcxGridDBTableView;
    cxgrdlvl1Grid2Level1: TcxGridLevel;
    dsDetPO: TDataSource;
    zqrDetPO: TZReadOnlyQuery;
    cxColTblDetailid: TcxGridDBColumn;
    cxColTblDetailid_ref: TcxGridDBColumn;
    cxColTblDetailno_bukti: TcxGridDBColumn;
    cxColTblDetailkode_brg: TcxGridDBColumn;
    cxColTblDetaildeskripsi: TcxGridDBColumn;
    cxColTblDetailqty: TcxGridDBColumn;
    cxColTblDetailsatuan: TcxGridDBColumn;
    cxColTblDetailharga: TcxGridDBColumn;
    cxColTblDetailppn: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure cxTblHeadDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure btnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAppPO: TfrmAppPO;

implementation

uses
  unTools, unAplikasi, unDM;

{$R *.dfm}

procedure TfrmAppPO.btnSimpanClick(Sender: TObject);
var
  i : Integer;
  q : TZQuery;
begin
  inherited;
  for i := 0 to cxtblHead.DataController.RecordCount - 1 do begin
    with cxtblHead.DataController do begin
      q := OpenRS('select * from tbl_po_head where no_bukti = ''' + Values[i, cxColNoPo.index] + '''');
      if Values[i, cxColChkApp.index] = True then begin
        q.Edit;
        q.FieldByName('f_approval').AsInteger := 1;
        q.FieldByName('tgl_app').AsDateTime := Aplikasi.Tanggal;
        q.FieldByName('user_app').AsString := Aplikasi.NamaUser;
        q.Post;
        q.Close;
        MsgBox('Approval purchase order berhasil disimpan');
        //btnBatalClick(nil);
      end;
    end;
  end;
end;

procedure TfrmAppPO.cxTblHeadDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  i: integer;
  z :TZQuery;
begin
  inherited;
  i := cxtblHead.DataController.GetFocusedRecordIndex;
  zqrDetPO.Close;
  if VarIsNull(cxTblHead.DataController.Values[i, cxColNoPP.Index])  then begin
    zqrDetPO.ParamByName('id_ref').AsString := '';
  end else begin
    zqrDetPO.ParamByName('id_ref').AsInteger := cxtblHead.DataController.Values[i, cxColID.Index];
  end;
  zqrDetPO.Open;
end;

procedure TfrmAppPO.FormShow(Sender: TObject);
var
  q : TZQuery;
  i : Integer;
begin
  inherited;
  q := OpenRS('select * from tbl_po_head where f_approval = 0');
  while not q.eof do begin
    with cxtblHead.DataController  do begin
      i := AppendRecord;
      Values[i, cxColID.Index] := q.FieldByName('id').AsInteger;
      Values[i, cxColNoPO.Index] := q.FieldByName('no_bukti').AsString;
      Values[i, cxColNoPP.Index] := q.FieldByName('no_fobj').AsString;
    end;
    q.Next;
  end;
  q.Close;
end;

end.
