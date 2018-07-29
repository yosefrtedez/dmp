unit unFrmTmpLap01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, DB, ZAbstractRODataset, ZDataset, frxDBSet, frxExportPDF,
  frxExportXLS;

type
  TfrmTmpLap01 = class(TForm)
    rptSJ01: TfrxReport;
    zqrSJ01: TZReadOnlyQuery;
    dsSJ01: TDataSource;
    fdbSJ01: TfrxDBDataset;
    rptFakturPenjualan: TfrxReport;
    rptFakturPenjualanNonPPN: TfrxReport;
    rptSJ01NonPPN: TfrxReport;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTmpLap01: TfrmTmpLap01;

implementation

uses unDM;

{$R *.dfm}

end.
