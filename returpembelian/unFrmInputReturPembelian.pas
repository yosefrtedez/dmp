unit unFrmInputReturPembelian;

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
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmInputReturPembelian = class(TfrmTplInput)
    Label13: TLabel;
    cxlbl1: TcxLabel;
    cxlbl2: TcxLabel;
    cxlbl4: TcxLabel;
    cxlbl5: TcxLabel;
    cxlbl6: TcxLabel;
    cxlNoPP: TcxLookupComboBox;
    cxdTglDatang: TcxDateEdit;
    cxlSupplier: TcxLookupComboBox;
    cxtAlamat: TcxTextEdit;
    cxtNoBukti: TcxTextEdit;
    cxChkPosting: TcxCheckBox;
    cxlbl14: TcxLabel;
    cxtKeterangan: TcxTextEdit;
    zqrSupplier: TZReadOnlyQuery;
    dsSupplier: TDataSource;
    cxgrdPP: TcxGrid;
    cxtbRetur: TcxGridTableView;
    cxColNo: TcxGridColumn;
    cxColKodeBrg: TcxGridColumn;
    cxColDeskripsi: TcxGridColumn;
    cxColQty: TcxGridColumn;
    cxColSatuan: TcxGridColumn;
    cxColHarga: TcxGridColumn;
    cxColPPn: TcxGridColumn;
    cxColValuta: TcxGridColumn;
    cxColKeterangan: TcxGridColumn;
    cxColTotal: TcxGridColumn;
    cxColIdSatuan: TcxGridColumn;
    cxgrdlvl1Grid1Level1: TcxGridLevel;
    zqrBarang: TZReadOnlyQuery;
    dsBarang: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure cxlSupplierPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputReturPembelian: TfrmInputReturPembelian;

implementation

uses unDM, unTools;

{$R *.dfm}

procedure TfrmInputReturPembelian.cxlSupplierPropertiesChange(Sender: TObject);
var
  q: TZQuery;
begin
  inherited;
  q := OpenRS('SELECT alamat FROM tbl_supplier WHERE id = %s',[cxlSupplier.EditValue]);
  cxtAlamat.Text := q.FieldByName('alamat').AsString;
  q.Close;
end;

procedure TfrmInputReturPembelian.FormCreate(Sender: TObject);
begin
  inherited;
  zqrSupplier.Open;
end;

end.
