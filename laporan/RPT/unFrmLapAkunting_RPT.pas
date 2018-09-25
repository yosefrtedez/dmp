unit unFrmLapAkunting_RPT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZDataset;

type
  TfrmLapAkunting_RPT = class(TForm)
    zqrPengeluaranKas: TZReadOnlyQuery;
    dsPengeluaranKas: TDataSource;
    fdbPengeluaranKas: TfrxDBDataset;
    rptPengeluaranKas: TfrxReport;
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
