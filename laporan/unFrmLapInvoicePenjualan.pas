unit unFrmLapInvoicePenjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZDataset;

type
  TfrmLapInvoicePenjualan = class(TForm)
    rptInvoicePenjualan: TfrxReport;
    zqrRptInvoicePenjualan: TZReadOnlyQuery;
    dsRptInvoicePenjualan: TDataSource;
    fdbInvoicePenjualan: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapInvoicePenjualan: TfrmLapInvoicePenjualan;

implementation

uses unDM, unTools;

{$R *.dfm}

end.
