unit unFrmKetUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmKetUpdate = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    prgBar: TProgressBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKetUpdate: TfrmKetUpdate;

implementation

{$R *.dfm}

procedure TfrmKetUpdate.Timer1Timer(Sender: TObject);
begin
  prgBar.Position := prgBar.Position + 1;
  prgBar.Update;
  Update;
  Self.Refresh;
end;

procedure TfrmKetUpdate.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

end.
