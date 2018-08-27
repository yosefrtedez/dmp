unit unFrmLapInvoicePembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZDataset;

type
  TfrmLapInvoicePembelian = class(TForm)
    rptInvoicePembelian: TfrxReport;
    zqrInvoicePembelian: TZReadOnlyQuery;
    dsInvoicePembelian: TDataSource;
    fdbInvoicePembelian: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapInvoicePembelian: TfrmLapInvoicePembelian;

implementation

uses unDM, unTools;

{$R *.dfm}

end.
