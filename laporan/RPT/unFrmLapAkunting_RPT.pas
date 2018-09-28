unit unFrmLapAkunting_RPT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZDataset, frxExportXLS,
  frxExportPDF;

type
  TfrmLapAkunting_RPT = class(TForm)
    zqrPengeluaranKas: TZReadOnlyQuery;
    dsPengeluaranKas: TDataSource;
    fdbPengeluaranKas: TfrxDBDataset;
    rptPengeluaranKas: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    zqrPenerimaanKas: TZReadOnlyQuery;
    dsPenerimaanKas: TDataSource;
    fdbPenerimaanKas: TfrxDBDataset;
    rptPenerimaanKas: TfrxReport;
    zqrJurnal: TZReadOnlyQuery;
    dsJurnal: TDataSource;
    fdbJurnal: TfrxDBDataset;
    rptJurnal: TfrxReport;
    zqrBukuKas: TZReadOnlyQuery;
    dsBukuKas: TDataSource;
    fdbBukuKas: TfrxDBDataset;
    rptBukuKas: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapAkunting_RPT: TfrmLapAkunting_RPT;

implementation

uses unDM;

{$R *.dfm}

end.
