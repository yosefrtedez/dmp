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
  ZAbstractRODataset, ZDataset, cxContainer, cxLabel;

type
  TfrmAppPO = class(TfrmTplInput)
    lbl1: TLabel;
    zqrPO: TZReadOnlyQuery;
    dsPO: TDataSource;
    zqrPoDet: TZReadOnlyQuery;
    dsPoDet: TDataSource;
    cxgrd1: TcxGrid;
    cxtbPOHead: TcxGridDBTableView;
    cxColTblHeadno_bukti: TcxGridDBColumn;
    cxColTblHeadno_fobj: TcxGridDBColumn;
    cxColTblHeadnama: TcxGridDBColumn;
    cxColTblHeadkontak: TcxGridDBColumn;
    cxColTblHeadtgl_required: TcxGridDBColumn;
    cxColTblHeaduser: TcxGridDBColumn;
    cxColTblHeaduser_dept: TcxGridDBColumn;
    cxColTblHeadpembayaran: TcxGridDBColumn;
    cxColTblHeadnopol: TcxGridDBColumn;
    cxColTblHeaddriver: TcxGridDBColumn;
    cxColTblHeadf_approval: TcxGridDBColumn;
    cxColTblHeadf_completed: TcxGridDBColumn;
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
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxGrid1: TcxGrid;
    cxtbPODet: TcxGridDBTableView;
    cxtbPODetkode_brg: TcxGridDBColumn;
    cxtbPODetdeskripsi: TcxGridDBColumn;
    cxtbPODetqty: TcxGridDBColumn;
    cxtbPODetsatuan: TcxGridDBColumn;
    cxtbPODetharga: TcxGridDBColumn;
    cxtbPODetmata_uang: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure FormShow(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure cxtbPOHeadFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);
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
  i: Integer;
  lst: TStringList;
  chk, sNoSO: string;
  qCek: TZQuery;
begin

  lst := TStringList.Create;
  for i := 0 to cxtbPOHead.DataController.RecordCount - 1 do begin

    if VarIsNull(cxtbPOHead.DataController.Values[i,0]) then
      chk := ''
    else
      chk := cxtbPOHead.DataController.Values[i,0];

    if chk = 'T' then begin
      lst.Add(cxtbPOHead.DataController.Values[i,1]);
    end;
  end;

  if lst.Count > 0 then begin
    try
      dm.zConn.StartTransaction;
      for i := 0 to lst.Count - 1 do begin
        dm.zConn.ExecuteDirect(
          Format('UPDATE tbl_po_head SET f_app = 1, user_app = ''%s'', tgl_app = NOW() WHERE no_bukti = ''%s''',
          [Aplikasi.NamaUser, lst.Strings[i]]));
      end;
      dm.zConn.Commit;
      MsgBox('Purchase Order sudah di Approval.');
      zqrPO.Close;
      zqrPO.Open;
    except
      on E: Exception do begin
        MsgBox('Error: ' + E.Message);
        dm.zConn.Rollback;
      end;
    end;
  end;

end;

procedure TfrmAppPO.cxtbPOHeadFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  try
    zqrPoDet.Close;
    zqrPoDet.ParamByName('id_ref').AsInteger := zqrPO.FieldByName('id').AsInteger;
    zqrPoDet.Open;
  except
  end;
end;

procedure TfrmAppPO.FormCreate(Sender: TObject);
begin
  inherited;
  zqrPO.Open;
end;

procedure TfrmAppPO.FormShow(Sender: TObject);
var
  aCol: TcxGridDBColumn;
  i : integer;
begin
  aCol := cxtbPOHead.CreateColumn;
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

end.
