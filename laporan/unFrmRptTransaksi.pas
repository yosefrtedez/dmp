unit unFrmRptTransaksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZDataset, frxExportPDF,
  frxExportXLS;

type
  TfrmRptTransaksi = class(TForm)
    rptLapRekapTrsKeluar: TfrxReport;
    zqrLapRekapTrsKeluar: TZReadOnlyQuery;
    dsLapRekapTrsKeluar: TDataSource;
    fdbLapRekapTrsKeluar: TfrxDBDataset;
    rptLapRekapTrsMasuk: TfrxReport;
    zqrLapRekapTrsMasuk: TZReadOnlyQuery;
    dsLapRekapTrsMasuk: TDataSource;
    fdbLapRekapTrsMasuk: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRptTransaksi: TfrmRptTransaksi;

implementation

uses unDM;

{$R *.dfm}

end.
