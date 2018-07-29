unit unFrmLapMasterData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZDataset, frxExportPDF,
  frxExportXLS;

type
  TfrmLapMasterData = class(TForm)
    rptMstBarang: TfrxReport;
    zqrMstBarang: TZReadOnlyQuery;
    dsMstBarang: TDataSource;
    fdbMstBarang: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapMasterData: TfrmLapMasterData;

implementation

{$R *.dfm}

end.
