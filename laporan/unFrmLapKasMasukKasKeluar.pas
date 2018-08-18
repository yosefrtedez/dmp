unit unFrmLapKasMasukKasKeluar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZDataset;

type
  TfrmLapKasMasukKasKeluar = class(TForm)
    zqrKasMasuk: TZReadOnlyQuery;
    dsKasMasuk: TDataSource;
    fdbKasMasuk: TfrxDBDataset;
    rptKasMasuk: TfrxReport;
    zqrKasKeluar: TZReadOnlyQuery;
    dsKasKeluar: TDataSource;
    fdbKasKeluar: TfrxDBDataset;
    rptKasKeluar: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapKasMasukKasKeluar: TfrmLapKasMasukKasKeluar;

implementation

uses unDM;

{$R *.dfm}

end.
