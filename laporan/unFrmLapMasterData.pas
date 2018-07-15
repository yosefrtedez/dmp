unit unFrmLapMasterData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZDataset;

type
  TfrmLapMasterData = class(TForm)
    rptMstBarang: TfrxReport;
    zqrMstBarang: TZReadOnlyQuery;
    dsMstBarang: TDataSource;
    fdbMstBarang: TfrxDBDataset;
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
