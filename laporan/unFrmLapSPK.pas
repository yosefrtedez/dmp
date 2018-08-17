unit unFrmLapSPK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZDataset;

type
  TfrmLapSPK = class(TForm)
    rptSPK_OLD: TfrxReport;
    zqrSPK: TZReadOnlyQuery;
    dsSPK: TDataSource;
    fdbSPK: TfrxDBDataset;
    rptSPK: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapSPK: TfrmLapSPK;

implementation

{$R *.dfm}

end.
