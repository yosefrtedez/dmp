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
    cxDateEdit1: TcxDateEdit;
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
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxtbBomDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
  private
    mNoSO: string;
    mNOMO: string;
  public
    property NoSO: string read mNoSO write mNoSO;
    property NoMO: string read mNOMO write mNOMO;
  end;

var
  frmSPK: TfrmSPK;

implementation

uses unTools, unDM;

{$R *.dfm}

procedure TfrmSPK.cxtbBomDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var
  q: TZQuery;
begin
  inherited;
  if AItemIndex = cxColDeskripsi.Index then begin
    q := OpenRS('SELECT a.kode, b.satuan, b.id id_satuan FROM tbl_barang a ' +
      'tbl_satuan b ON a.id_satuan = b.id WHERE a.id = ''%s''',[ADataController.Values[ARecordIndex, cxColDeskripsi.Index]]);
    ADataController.Values[ARecordIndex, cxColSatuan.Index] := q.FieldByName('satuan').AsString;
    ADataController.Values[ARecordIndex, cxColIdSatuan.Index] := q.FieldByName('id_satuan').AsString;
    ADataController.Values[ARecordIndex, cxColKodeBrg.Index] := q.FieldByName('satuan').AsString;
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
begin
  inherited;
  q := OpenRS('SELECT a.* FROM v_mo a WHERE no_mo = ''%s''',[mNoMO]);

  cxtNoMO.Text := mNOMO;
  cxtNoSO.Text := q.FieldByName('no_so').AsString;
  cxtKodeBrg.Text := q.FieldByName('kode_brg').AsString;
  cxtDeskripsi.Text := q.FieldByName('deskripsi').AsString;
  cxtSatuan.Text := q.FieldByName('satuan').AsString;

  q.Close;

  cxtNoSPK.Text := GetLastFak('spk');
end;

end.
