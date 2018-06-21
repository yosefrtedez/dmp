unit unFrmLaporan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmTplInput, StdCtrls, ExtCtrls, Buttons;

type
  TfrmLaporan = class(TfrmTplInput)
    ScrollBox1: TScrollBox;
    BitBtn1: TBitBtn;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLaporan: TfrmLaporan;

implementation

uses unDM;

{$R *.dfm}

end.
