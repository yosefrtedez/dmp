unit unTools;

interface

uses SysUtils, ZDataset, unDM, Dialogs, Windows, Forms, Controls, DB, Winsock,
  Classes, DateUtils, Printers, WinSpool, ZConnection, StdCtrls;

const
c1 = 52845;
c2 = 22719;

function UnFormat(s:string): string;
function FloatStr(i: Currency): string;

function OpenRS(sql:string): TZQuery; overload;
function OpenRS(sql:string; Args: array of const): TZQuery; overload;
function OpenRS(sql:string; zc: TZConnection): TZQuery; overload;
function OpenRS(sql:string; Args: array of const; zc: TZConnection): TZQuery; overload;

function OpenRS_RO(sql:string): TZReadOnlyQuery;

function OpenTbl(sTblName: string): TZTable; overload;
function OpenTbl(sTblName: string; zc: TZConnection): TZTable; overload;

procedure MsgBox(sCaption:string);
function StrIsInt(str: string): Boolean;
function StrIsFloat(str: string): Boolean;
function GetLastFak(sTipe: string): string;
function GetLastFakHeader(header: string): string;
function GetFaktur: string;
procedure UpdateFaktur(head: string);
function IsPrevInst(sAppName: string): Boolean;
function DateToMySqlDate(date: TDate): string;
function QuotedTrim(sStr: string): string;
function CheckKey(sNamaTable: string; sField: string; sKeyValue: string): boolean;

function Encrypt (const s: string; Key: Word) : string;
function Decrypt (const s: string; Key: Word) : string;
function DateTimeStrEval(const DateTimeFormat : string;
                         const DateTimeStr : string) : TDateTime;
function FDOM(Date: TDateTime): TDateTime;
function LDOM(Date: TDateTime): TDateTime;
function MySQLFloat(sValue: string): string;
procedure ForceForegroundWindow(hwnd:THandle);
procedure SwitchToThisWindow(h1: hWnd; x: bool); stdcall;
procedure CenterControl(ParentObject, CenterObject: TControl; bTop, bLeft: Boolean; Space: Integer);
function QBox(f: TForm; sText: string; sCap: string): integer;
function GetHostName2: string;
function AltDown : Boolean;
procedure PrintFile(Const sFileName: String);
function IsFormOpen(const FormName: string): boolean;
function WinExec32(FileName: string; Visibility: integer; DoWait : boolean = false ): integer;

function MySQLPassword(sPassword: string): string;

procedure ShowError(s: string);

function ObtainFileSize(const AFile: String): Int64;
function RandomPassword(plen: integer): String;
function FormatDateMySQL(const dt: TDateTime): string;
function RoundUp(X: Extended): Extended; overload;
function RoundUp(X: Extended; JmlPembulatan: Integer): Extended; overload;
function Sgn(X: Extended): Integer;
function GetNamaGudang(sKode: string): string;
function GetStokGudang(sKodeBrg: string; sKodeGdg: string): Real;
procedure OpenAllQ(f: TForm);
function CekStok(kode, gudang: string): real;
procedure RestoreDatabase(sNamaFile: String);
function GetLastFakFOBJ(sHeader: string): string;
function GetFakturSrtPenawaran: string;
procedure OpenSQL(lst: TList);
procedure SplitStr(const Source, Delimiter: String; var DelimitedList: TStringList);

function LastInsertID: Integer;
function Terbilang(sValue: string): string;

function GetStokAkhir(id_brg: integer; id_gdg: Integer): real;
function GetHpp(id_brg: integer): real;
function CheckWewenang(sNamaWewenang, sNamaUser: string): Boolean;

function GetSatuan(id_brg: Integer; var satuan: string): Integer;

function GetKonversiSat(id_brg: Integer; id_satuan: Integer): Real;

function GetDefaultAkunBrg(id_brg: integer; sJenis: string): Integer;

function GetDefaultAkun(jenis: string): integer;

function GetHargaCust(id_cust, id_brg: Integer): real;
procedure UpdateHargaCust(id_cust, id_brg: Integer; harga: real);
function GetHargaSupp(id_supp, id_brg: Integer): real;
procedure UpdateHargaSupp(id_supp, id_brg: Integer; harga: real);
function GetKodeBrg(id_brg: Variant): string;
function GetWewenang(NamaUser, NamaMenu: string): string;

implementation

function LastInsertID: integer;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT last_insert_id() as aidi',[]);
  Result := q.FieldByName('aidi').AsInteger;
  q.Close;
end;

function UnFormat(s:string): string;
var
  tmp: string;
  comma, period: integer;
begin
  tmp := s;
  comma := pos(',', s);
  period := pos('.', s);

  if comma > 0 then Delete(tmp,comma,1);
  if period > 0 then Delete(tmp,period,1);

  Result := tmp;

end;

function FloatStr(i: Currency):string;
begin
  Result := FormatFloat('###,###,###.##',i);
end;

function GetFakturSrtPenawaran: string;
var
  tgl, bulan, tahun: Word;
  romawi: string;
begin
  DecodeDate(Now, tahun, bulan, tgl);

  if Copy(IntToStr(bulan),1,2)='1' then
    romawi := 'I'
  else if Copy(IntToStr(bulan),1,2)='2' then
    romawi := 'II'
  else if Copy(IntToStr(bulan),1,2)='3' then
    romawi := 'III'
  else if Copy(IntToStr(bulan),1,2)='4' then
    romawi := 'IV'
  else if Copy(IntToStr(bulan),1,2)='5' then
    romawi := 'V'
  else if Copy(IntToStr(bulan),1,2)='6' then
    romawi := 'VI'
  else if Copy(IntToStr(bulan),1,2)='7' then
    romawi := 'VII'
  else if Copy(IntToStr(bulan),1,2)='8' then
    romawi := 'VIII'
  else if Copy(IntToStr(bulan),1,2)='9' then
    romawi := 'IX'
  else if Copy(IntToStr(bulan),1,2)='10' then
    romawi := 'X'
  else if Copy(IntToStr(bulan),1,2)='11' then
    romawi := 'XI'
  else
    romawi := 'XII';

  Result := romawi + '/' + Copy(IntToStr(tahun),1,4);
end;

function OpenRS(sql:string): TZQuery;
var
  q: TZQuery;
begin
  q := TZQuery.Create(nil);
  q.Connection := dm.zConn;
  q.SQL.Text := sql;
  q.Open;
  Result := q;
end;

function OpenRS(sql:string; Args: array of const): TZQuery;
var
  q: TZQuery;
begin
  q := TZQuery.Create(nil);
  q.Connection := dm.zConn;
  q.SQL.Text := Format(sql,Args);
  q.Open;
  Result := q;
end;

function OpenRS(sql:string; zc: TZConnection): TZQuery;
var
  q: TZQuery;
begin
  q := TZQuery.Create(nil);
  q.Connection := zc;
  q.SQL.Text := sql;
  q.Open;
  Result := q;
end;

function OpenRS(sql:string; Args: array of const; zc: TZConnection): TZQuery;
var
  q: TZQuery;
begin
  q := TZQuery.Create(nil);
  q.Connection := zc;
  q.SQL.Text := Format(sql,Args);
  q.Open;
  Result := q;
end;

function OpenRS_RO(sql:string): TZReadOnlyQuery;
var
  q: TZReadOnlyQuery;
begin
  q := TZReadOnlyQuery.Create(nil);
  q.Connection := dm.zConn;
  q.SQL.Text := sql;
  q.Open;
  Result := q;
end;

function OpenTbl(sTblName: string): TZTable;
var
  tmp: TZTable;
begin
  tmp := TZTable.Create(nil);
  tmp.Connection := dm.zConn;
  tmp.TableName := sTblName;
  tmp.Open;
  Result := tmp;
end;

function OpenTbl(sTblName: string; zc: TZConnection): TZTable;
var
  tmp: TZTable;
begin
  tmp := TZTable.Create(nil);
  tmp.Connection := zc;
  tmp.TableName := sTblName;
  tmp.Open;
  Result := tmp;
end;

procedure MsgBox(sCaption:string);
var
  Form: TForm;
  lbl: TLabel;
  ExtraWidth: integer;
begin
  //MessageDlg(sCaption,mtWarning,[mbOk],0);
  Form := CreateMessageDialog(sCaption, mtWarning, [mbOK]);
  ExtraWidth := 10;
  try
    lbl := Form.FindComponent('Message') as TLabel;
    lbl.Width := lbl.Width + ExtraWidth;
    Form.ClientWidth := Form.ClientWidth + ExtraWidth;
    Form.Position := poScreenCenter;
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

function StrIsInt(str: string): Boolean;
var
  I, Code: Integer;
begin
  Val(str,I,Code);
  Result := Code = 0;
end;

function StrIsFloat(str: string): Boolean;
var
  I: Real;
  Code: Integer;
begin
  Val(str,I,Code);
  result := Code = 0;
end;

function GetLastFak(sTipe: string): string;
var
  q: TZQuery;
  depan, head: string;
  counter: integer;
begin
  if sTipe = 'brg-masuk' then
    depan := 'IN/'
  else if sTipe = 'brg-keluar' then
    depan := 'OT/'
  else if sTipe = 'brg_in_cst' then
    depan := 'INCST/'
  else if sTipe = 'mutasi' then
    depan := 'MG/'
  else if sTipe = 'mutasi_antar_barang' then
    depan := 'MAB/'
  else if sTipe = 'pembatalan_mutasi' then
    depan := 'PM/'
  else if sTipe = 'koreksi' then
    depan := 'KS/'
  else if sTipe = 'consumable' then
    depan := 'BC/'
  else if sTipe = 'pengambilan-bb' then
    depan := 'PBB/'
  else if sTipe = 'sales_order' then
    depan := 'SO/'
  else if sTipe = 'sales_order_plt' then
    depan := 'SPL/'  
  else if sTipe = 'mts' then
    depan := 'MTS/'
  else if sTipe = 'spmb' then
    depan := 'SPMB/'
  else if sTipe = 'sj' then
    depan := 'SJ/'
  else if sTipe = 'sj-pajak' then
    depan := 'SJ/DMP/'
  else if sTipe = 'faktur' then
    depan := 'FT/'
  else if sTipe = 'faktur-pajak' then
    depan := 'FT/DMP/'
  else if sTipe = 'spk_potong' then
    depan := 'SP/'
  else if sTipe = 'stok_awal' then
    depan := 'SA/'
  else if sTipe = 'master_order' then
    depan := 'MO/'
  else if sTipe = 'mutasi_so' then
    depan := 'MSO/'
  else if sTipe = 'spk_assem' then
    depan := 'SPA/'
  else if sTipe = 'spk' then
    depan := 'SPK/'
  else if sTipe = 'spk_giling' then
    depan := 'SPKG/'
  else if sTipe = 'pembatalan' then
    depan := 'BTL/'
  else if sTipe = 'retur-penj' then
    depan := 'RP/'
  else if sTipe = 'po' then
    depan := 'PO/'
  else if sTipe = 'spbb' then
    depan := 'SPBB/'
  else if sTipe = 'spbs' then
    depan := 'SPBS/'
  else if sTipe = 'spbb_retur' then
    depan := 'SPBR/'
  else if sTipe = 'penawaran' then
    depan := 'PEN/'
  else if sTipe = 'lkm' then
    depan := 'LKM/'
  else if sTipe = 'penerimaan' then
    depan := 'PB/'
  else if sTipe = 'frk' then
    depan := 'FRK/'
  else if sTipe = 'sju' then
    depan := 'SJU/'
  else if sTipe = 'po_peletan' then
    depan := 'POP/'
  else if sTipe = 'hasil-produksi' then
    depan := 'HPR/'
  else if sTipe = 'retur-pemb' then
    depan := 'RB/'
  else if sTipe = 'bppb' then
    depan := 'BPP/'
  else if sTipe = 'po_jasa' then
    depan := 'POJ/'
  else if sTipe = 'trial' then
    depan := 'TRL/'
  else if sTipe = 'insentif' then
    depan := 'INS/'
  else if sTipe = 'insentifpel' then
    depan := 'INP/'
  else if sTipe = 'preventive' then
    depan := 'PM/'
  else if sTipe = 'spk-router' then
    depan := 'SPR/'
  else if sTipe = 'revisi_trs' then
    depan := 'REV/'
  else if sTipe = 'spk_ekstrusi' then
    depan := 'SPK/EKS/'
  else if sTipe = 'spk_gulung' then
    depan := 'SPK/GUL/'
  else if sTipe = 'spk_bungkus' then
    depan := 'SPK/BKS/'
  else if sTipe = 'atk' then
    depan := 'ATK/'
  else if sTipe = 'spk_paket' then
    depan := 'SPP/'
  else if sTipe = 'memo' then
    depan := 'MEMO/'
  // JURNAL
  else if sTipe = 'jurnal' then
    depan := 'J/'
  else if sTipe = 'jurnal-umum' then
    depan := 'JU/'
  else if sTipe = 'permintaan_pembelian' then
    depan := 'PP/'
  else if sTipe = 'po' then
    depan := 'PO/'
  else if sTipe = 'penerimaan_kas' then
    depan := 'BKM/'
  else if sTipe = 'pengeluaran_kas' then
    depan := 'BKK/'
  else if sTipe = 'invoice-penjualan' then
    depan := 'INV/'
  else if sTipe = 'invoice-pembelian' then
    depan := 'INP/'
  else if sTipe = 'pembayaran-pembelian' then
    depan := 'PPB/'
  else if sTipe = 'pembayaran-penjualan' then
    depan := 'PPJ/';

  head := depan + GetFaktur;

  q := OpenRS('SELECT * FROM tbl_head_no WHERE header = ''' +
    head + '''', dm.zConn);

  if q.IsEmpty then
    head := head + '0001'
  else begin
    counter := q.FieldValues['counter'] + 1;

    head := head + Copy('0000',0,4 - Length(IntToStr(counter))) +
      IntToStr(counter);
  end;
  Result := head;
end;

function GetLastFakHeader(header: string): string;
var
  q: TZQuery;
  depan, head: string;
  counter: integer;
begin
  head := header;

  q := OpenRS('SELECT * FROM tbl_head_no WHERE header = ''' +
    head + '''', dm.zConn);

  if q.IsEmpty then
    head := head + '-1'
  else begin
    counter := q.FieldValues['counter'] + 1;
    head := head + '-' + IntToStr(counter);
  end;
  Result := head;
end;

function GetLastFakSPK(sHeader: string): string;
var
  q: TZQuery;
  depan, head: string;
  counter: integer;
begin
  head := sHeader;

  q := OpenRS('SELECT * FROM tbl_head_no WHERE header = ''' +
    head + '''', dm.zConn);

  if q.IsEmpty then
    head := head + '-1'
  else begin
    counter := q.FieldValues['counter'] + 1;

    head := head + '-' + IntToStr(counter);
  end;
  Result := head;
end;

function GetLastFakFOBJ(sHeader: string): string;
var
  q: TZQuery;
  depan, head: string;
  counter: integer;
begin
  head := sHeader;
  head := 'FOBJ/' + head + '/' + GetFaktur;

  q := OpenRS('SELECT * FROM tbl_head_no WHERE header = ''' +
    head + '''', dm.zConn);

  if q.IsEmpty then
    head := head + '0001'
  else begin
    counter := q.FieldValues['counter'] + 1;

    head := head + Copy('0000',0,4 - Length(IntToStr(counter))) +
      IntToStr(counter);
  end;
  Result := head;
end;

procedure UpdateFaktur(head: string);
var
  zTblNoFak: TZTable;
  q: TZQuery;
begin

  try
    dm.zConn.StartTransaction;
    {
    //zTblNoFak := OpenTbl('tbl_head_no');
    q := OpenRS('SELECT * FROM tbl_head_no WHERE header = ''%s''',
      [head]);
    if q.IsEmpty then begin
      dm.zConn.ExecuteDirect(
        Format('INSERT INTO tbl_head_no ' +
          'SET header = ''%s'', counter = 1',[head])
      );
    end
    else begin
      dm.zConn.ExecuteDirect('UPDATE tbl_head_no SET counter = counter + 1 ' +
        'WHERE header = ''' + head + '''');
    end;
    }

    dm.zConn.ExecuteDirect(
      Format('CALL update_head(''%s'')',[head])
    );
    dm.zConn.Commit;

    //q.Close;
    //zTblNoFak.Close;
  except
    on E: Exception do begin
      MsgBox('Error: ' + E.Message);
      dm.zConn.Rollback;
    end;
  end;

end;

function GetFaktur: string;
const
  hurufBulan: String = 'ABCDEFGHIJKL';
var
  tgl, bulan, tahun: Word;
begin
  DecodeDate(Now, tahun, bulan, tgl);
  Result := hurufBulan[bulan] + Copy(IntToStr(tahun),3,2) + '/';
end;

{
Here is a function proposed by Brendan Delumpa on the Internet that, when
called by a program, checks if there is already another instance running and
then reactivates it. It returns TRUE if there
is another instance. (Brendan Delumpa : http://webx.best.com/~bdelumpa/ )
}

function IsPrevInst(sAppName: string): Boolean;
var
  semName,
  appClass: PChar;
  hSem    : THandle;
  hWndMe  : HWnd;
  appTitle: Array[0..MAX_PATH] of Char;
begin
  // Initializations
  Result := FALSE;
  GetMem(semName,15);
  GetMem(appClass,15);
  //StrPCopy(semName,'xxxStokAwalxxx');
  StrPCopy(semName, sAppName);
  StrPCopy(appClass,'TApplication');
  StrPCopy(appTitle,ExtractFileName(Application.Title));
  // Lets create a semaphore. If this is the first instance, hSem will contain 0.
  hSem := CreateSemaphore(nil,0,1,semName);
  // Does the semaphore already exist ? Yes : second instance.
  if (hSem <> 0) and (GetLastError = ERROR_ALREADY_EXISTS) then
    begin
      CloseHandle(hSem);
      // Lets change our main window title in order to find the first instance's one.
      hWndMe := FindWindow(appClass,appTitle);
      SetWindowText(hWndMe,'ZZZZZZZ');

      // Then we find the preceeding instance's main window, reactivate it and
      // bring it on front. It isfound by looking for the application's class and title.
      hWndMe := FindWindow(appClass,appTitle);
      if (hWndMe <> 0) then
        begin
          BringWindowToTop(hWndMe);
          ShowWindow(hWndMe,SW_SHOWNORMAL);
        end;
      Result := TRUE;
    end;
  // Deallocate used Data
  FreeMem(semName,15);
  FreeMem(appClass,15);
end;

function DateToMySqlDate(date: TDate): string;
var
  tgl, bln, thn: Word;
begin
  DecodeDate(date,thn,bln,tgl);
  Result := IntToStr(thn) + '-' +
    IntToStr(bln) + '-' +
    IntToStr(tgl);
end;

function QuotedTrim(sStr: string): string;
begin
  sStr := QuotedStr(Trim(sStr));
  Result := sStr;
end;

function CheckKey(sNamaTable: string; sField: string; sKeyValue: string): boolean;
var
  q: TZQuery;
begin
  q := OpenRS(Format('SELECT * FROM %s WHERE %s = %s',
    [sNamaTable, sField, sKeyValue]));
  if not q.IsEmpty then
    Result := true
  else
    Result := false;
  q.Close;
end;

function Encrypt (const s: string; Key: Word) : string;
var
  i : byte;
  ResultStr : string;
begin
  Result:=s;
  {Result[0] := s[0]; }
  for i := 0 to (length (s)) do
  begin
    Result[i] := Char (byte (s[i]) xor (Key shr 8));
    Key := (byte (Result[i]) + Key) * c1 + c2
  end
end;

function Decrypt (const s: string; Key: Word) : string;
var
  i : byte;
begin
  {Result[0] := s[0];}
  Result:=s;
  for i := 0 to (length (s)) do
  begin
    Result[i] := Char (byte (s[i]) xor (Key shr 8));
    Key := (byte (s[i]) + Key) * c1 + c2
  end
end;

function DateTimeStrEval(const DateTimeFormat : string;
                         const DateTimeStr : string) : TDateTime;
var i,ii,iii : integer;
    Retvar : TDateTime;
    Tmp,
    Fmt,Data,Mask,Spec : string;
    Year,Month,Day,Hour,
    Minute,Second,MSec : word;
    AmPm : integer;
begin
  Year := 1;
  Month := 1;
  Day := 1;
  Hour := 0;
  Minute := 0;
  Second := 0;
  MSec := 0;
  Fmt := UpperCase(DateTimeFormat);
  Data := UpperCase(DateTimeStr);
  i := 1;
  Mask := '';
  AmPm := 0;

  while i < length(Fmt) do begin
    if Fmt[i] in ['A','P','D','M','Y','H','N','S','Z'] then begin
      // Start of a date specifier
      Mask  := Fmt[i];
      ii := i + 1;

      // Keep going till not valid specifier
      while true do begin
        if ii > length(Fmt) then Break; // End of specifier string
        Spec := Mask + Fmt[ii];

        if (Spec = 'DD') or (Spec = 'DDD') or (Spec = 'DDDD') or
           (Spec = 'MM') or (Spec = 'MMM') or (Spec = 'MMMM') or
           (Spec = 'YY') or (Spec = 'YYY') or (Spec = 'YYYY') or
           (Spec = 'HH') or (Spec = 'NN') or (Spec = 'SS') or
           (Spec = 'ZZ') or (Spec = 'ZZZ') or
           (Spec = 'AP') or (Spec = 'AM') or (Spec = 'AMP') or
           (Spec = 'AMPM') then begin
          Mask := Spec;
          inc(ii);
        end
        else begin
          // End of or Invalid specifier
          Break;
        end;
      end;

      // Got a valid specifier ? - evaluate it from data string
      if (Mask <> '') and (length(Data) > 0) then begin
        // Day 1..31
        if (Mask = 'DD') then begin
           Day := StrToIntDef(trim(copy(Data,1,2)),0);
           delete(Data,1,2);
        end;

        // Day Sun..Sat (Just remove from data string)
        if Mask = 'DDD' then delete(Data,1,3);

        // Day Sunday..Saturday (Just remove from data string LEN)
        if Mask = 'DDDD' then begin
          Tmp := copy(Data,1,3);
          for iii := 1 to 7 do begin
            if Tmp = Uppercase(copy(LongDayNames[iii],1,3)) then begin
              delete(Data,1,length(LongDayNames[iii]));
              Break;
            end;
          end;
        end;

        // Month 1..12
        if (Mask = 'MM') then begin
           Month := StrToIntDef(trim(copy(Data,1,2)),0);
           delete(Data,1,2);
        end;

        // Month Jan..Dec
        if Mask = 'MMM' then begin
          Tmp := copy(Data,1,3);
          for iii := 1 to 12 do begin
            if Tmp = Uppercase(copy(LongMonthNames[iii],1,3)) then begin
              Month := iii;
              delete(Data,1,3);
              Break;
            end;
          end;
        end;


        // Month January..December
        if Mask = 'MMMM' then begin
          Tmp := copy(Data,1,3);
          for iii := 1 to 12 do begin
            if Tmp = Uppercase(copy(LongMonthNames[iii],1,3)) then begin
              Month := iii;
              delete(Data,1,length(LongMonthNames[iii]));
              Break;
            end;
          end;
        end;

        // Year 2 Digit
        if Mask = 'YY' then begin
          Year := StrToIntDef(copy(Data,1,2),0);
          delete(Data,1,2);
          if Year < TwoDigitYearCenturyWindow then
            Year := (YearOf(Date) div 100) * 100 + Year
          else
            Year := (YearOf(Date) div 100 - 1) * 100 + Year;
        end;

        // Year 4 Digit
        if Mask = 'YYYY' then begin
          Year := StrToIntDef(copy(Data,1,4),0);
          delete(Data,1,4);
        end;

        // Hours
        if Mask = 'HH' then begin
           Hour := StrToIntDef(trim(copy(Data,1,2)),0);
           delete(Data,1,2);
        end;

        // Minutes
        if Mask = 'NN' then begin
           Minute := StrToIntDef(trim(copy(Data,1,2)),0);
           delete(Data,1,2);
        end;

        // Seconds
        if Mask = 'SS' then begin
           Second := StrToIntDef(trim(copy(Data,1,2)),0);
           delete(Data,1,2);
        end;

        // Milliseconds
        if (Mask = 'ZZ') or (Mask = 'ZZZ') then begin
           MSec := StrToIntDef(trim(copy(Data,1,3)),0);
           delete(Data,1,3);
        end;


        // AmPm A or P flag
        if (Mask = 'AP') then begin
           if Data[1] = 'A' then
             AmPm := -1
           else
             AmPm := 1;
           delete(Data,1,1);
        end;

        // AmPm AM or PM flag
        if (Mask = 'AM') or (Mask = 'AMP') or (Mask = 'AMPM') then begin
           if copy(Data,1,2) = 'AM' then
             AmPm := -1
           else
             AmPm := 1;
           delete(Data,1,2);
        end;

        Mask := '';
        i := ii;
      end;
    end
    else begin
      // Remove delimiter from data string
      if length(Data) > 1 then delete(Data,1,1);
      inc(i);
    end;
  end;

  if AmPm = 1 then Hour := Hour + 12;
  if not TryEncodeDateTime(Year,Month,Day,Hour,Minute,Second,MSec,Retvar) then
    Retvar := 0.0;
  Result := Retvar;
end;

// first date of month
function FDOM(Date: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := EncodeDate(Year, Month, 1);
end;

// end date of month
function LDOM(Date: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  // (if Month < 12 then inc(Month)
  // else begin Month := 1; inc(Year) end;
  // Result := EncodeDate(Year, Month, 1) - 1;
  Result := EncodeDate(Year, Month,
            MonthDays[IsLeapYear(Year), Month]);
end;

function MySQLFloat(sValue: string): string;
var
  i: integer;
  tmp,period: string;
begin
  tmp := sValue;
  i := Pos(',',tmp);
  if i > 0 then begin
    Delete(tmp,i,1);
    period := '.';
    Insert('.',tmp,i);
  end;
  Result := tmp;
end;

procedure CenterControl(ParentObject, CenterObject: TControl; bTop, bLeft: Boolean;
  Space: Integer);
begin
  with CenterObject do
  begin
    if bLeft then
      Left := ParentObject.Width div 2 - Width div 2 + Space;

    if bTop then
      Top := ParentObject.Height div 2 - Height div 2;
  end;
end;

procedure ForceForegroundWindow(hwnd:THandle);
//(W)2001DanielRolf
//http://www.finecode.de
//rolf@finecode.de
var
hlp:TForm;
begin
hlp:=TForm.Create(nil);
try
hlp.BorderStyle:=bsNone;
hlp.SetBounds(0,0,1,1);
hlp.FormStyle:=fsStayOnTop;
hlp.Show;
mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN,0,0,0,0);
mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP,0,0,0,0);
SetForegroundWindow(hwnd);
finally
hlp.Free;
end;
end;

procedure SwitchToThisWindow(h1: hWnd; x: bool); stdcall;
  external user32 Name 'SwitchToThisWindow';
         {x = false: Size unchanged, x = true: normal size}

// Message Box pertanyaan
function QBox(f: TForm; sText: string; sCap: string): integer;
begin
  Result := MessageBox(f.Handle,PChar(sText),
    PChar(sCap), MB_YESNO + MB_ICONQUESTION);
end;

function GetHostName2: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;

function AltDown : Boolean;
var
  State : TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[vk_Menu] and 128) <> 0);
end;

procedure PrintFile(Const sFileName: String);
Const
  cBUFSIZE = 16384;
Type
  TDoc_Info_1 = record
  pDocName: pChar;
  pOutputFile: pChar;
  pDataType: pChar;
end;
Var
  Count : Cardinal;
  BytesWritten: Cardinal;
  hPrinter : THandle;
  hDeviceMode : THandle;
  Device : Array[0..255] Of Char;
  Driver : Array[0..255] Of Char;
  Port : Array[0..255] Of Char;
  DocInfo : TDoc_Info_1;
  f : File;
  Buffer : Pointer;
begin
  Printer.PrinterIndex := -1;
  Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
  If Not WinSpool.OpenPrinter(@Device, hPrinter, Nil) Then
    Exit;
  DocInfo.pDocName := 'Report';
  DocInfo.pOutputFile := Nil;
  DocInfo.pDatatype := 'RAW';

  If StartDocPrinter(hPrinter, 1, @DocInfo) = 0 Then
  begin
    WinSpool.ClosePrinter(hPrinter);
    Exit;
  end;

  If Not StartPagePrinter(hPrinter) Then
  begin
    EndDocPrinter(hPrinter);
    WinSpool.ClosePrinter(hPrinter);
    Exit;
  end;

  System.Assign(f, sFileName);
  try
    Reset(f, 1);
    GetMem(Buffer, cBUFSIZE);
    While Not Eof(f) Do
    begin
      Blockread(f, Buffer^, cBUFSIZE, Count);
      If Count > 0 Then
      begin
        If Not WritePrinter(hPrinter, Buffer, Count, BytesWritten) Then
        begin
          EndPagePrinter(hPrinter);
          EndDocPrinter(hPrinter);
          WinSpool.ClosePrinter(hPrinter);
          FreeMem(Buffer, cBUFSIZE);
          Exit;
        end;
      end;
    end;
    FreeMem(Buffer, cBUFSIZE);
    EndDocPrinter(hPrinter);
    WinSpool.ClosePrinter(hPrinter);
  finally
    System.CloseFile(f);
  end;
end;

function IsFormOpen(const FormName: string): boolean;
var
  i: integer;
begin
  Result := False;
  for i := Screen.FormCount - 1 DownTo 0 do
    if (Screen.Forms[i].Name = FormName) then begin
      Screen.Forms[i].SetFocus;
      Result := True;
      Break;
    end;
end;

function WinExec32(FileName: string; Visibility: integer; DoWait : boolean = false ): integer;
var
zAppName: array[0..512] of char;
StartupInfo: TStartupInfo;
ProcessInfo: TProcessInformation;
Res : DWORD;
begin
StrPCopy(zAppName, FileName);
FillChar(StartupInfo, Sizeof(StartupInfo), #0);
StartupInfo.cb := Sizeof(StartupInfo);
StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
StartupInfo.wShowWindow := Visibility;
if CreateProcess (nil,
zAppName, { pointer to command line string }
nil, { pointer to process security attributes }
nil, { pointer to thread security attributes }
false, { handle inheritance flag }
CREATE_NEW_CONSOLE or { creation flags }
NORMAL_PRIORITY_CLASS,
nil, { pointer to new environment block }
nil, { pointer to current directory name }
StartupInfo, { pointer to STARTUPINFO }
ProcessInfo) then begin { pointer to PROCESS_INF }
if DoWait then begin
WaitforSingleObject(ProcessInfo.hProcess, INFINITE);
GetExitCodeProcess(ProcessInfo.hProcess, Res);
Result:=Res;
end
else begin
Result:=0;
end;
CloseHandle(ProcessInfo.hProcess);
CloseHandle(ProcessInfo.hThread);
end
else begin
Result := -1
end;
end;

function MySQLPassword(sPassword: string): string;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT CONVERT(PASSWORD(''%s''), CHAR(100)) AS pass', [sPassword]);
  Result := q.FieldByName('pass').AsString;
  q.Close;
end;

procedure ShowError(s: string);
begin
  MsgBox('Error: ' + s);
end;

function ObtainFileSize(const AFile: String): Int64;
begin
 with TFileStream.Create(AFile, fmOpenRead or fmShareDenyNone) do
   begin
     try
       Result := Size;
     finally
       Free;
     end;
   end;
end;

function RandomPassword(plen: integer): String;
var
  head, str:String;
begin
  head := FormatDateTime('ddmmyyyyhhmmss', Now);
  Randomize;
  //string with all possible chars
  str:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Result:='';
  repeat
    Result:= Result+str[Random(Length(str))+1];
  until(Length(Result)=PLen);
  Result := head + '-' + Result;
end;

function FormatDateMySQL(const dt: TDateTime): string;
begin
  Result := FormatDateTime('yyyy-mm-dd', dt);
end;

function RoundUp(X: Extended): Extended;
// Returns the first integer greater than or
// equal to a given number in absolute value
// (sign is preserved).
//   RoundUp(3.3) = 4    RoundUp(-3.3) = -4
begin
  Result := Int(X) + Sgn(Frac(X));
end;

function Sgn(X: Extended): Integer;
// Returns -1, 0 or 1 according to the
// sign of the argument
begin
  if X < 0 then
    Result := -1
  else if X = 0 then
    Result := 0
  else
    Result := 1;
end;

function RoundUp(X: Extended; JmlPembulatan: Integer): Extended;
begin
  Result := Round(X / JmlPembulatan) * JmlPembulatan;
end;

function GetNamaGudang(sKode: string): string;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT * FROM tbl_gudang WHERE kode = ''%s''', [sKode]);
  if not q.IsEmpty then
    Result := q.FieldByName('nama').AsString
  else
    Result := '';
  q.Close;
end;

function GetStokGudang(sKodeBrg: string; sKodeGdg: string): real;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT * FROM tbl_barang_det WHERE kode_brg = %s ' +
    'AND kode_gdg = ''%s''',
    [sKodeBrg, sKodeGdg]);
  if q.IsEmpty then
    Result := 0
  else
    Result := q.FieldByName('stok').AsFloat;
  q.Close;
end;

procedure OpenAllQ(f: TForm);
var
  i: Integer;
begin
  for i := 0 to f.ComponentCount - 1 do begin
    if f.Components[i].Tag = 12 then begin
      if (f.Components[i].ClassName = 'TZReadOnlyQuery') then
        if (f.Components[i] as TZReadOnlyQuery).Active = False then
          (f.Components[i] as TZReadOnlyQuery).Open;
      if (f.Components[i].ClassName = 'TZQuery') then
        if (f.Components[i] as TZQuery).Active = False then
          (f.Components[i] as TZQuery).Open;
    end;
  end;
end;

function CekStok(kode, gudang: string): real;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT * from tbl_barang_det WHERE kode_brg = %s ' +
    'AND kode_gdg = ''%s''',
    [kode, gudang]);
  Result := q.FieldByName('stok').AsFloat;
  q.Close;
end;

procedure RestoreDatabase(sNamaFile: String);
var
  sTgl,
  sCmd, sNamaFileBat, sPath : string;
  sBackupPath : string;
  F: TextFile;
begin
  if dm.zConn.HostName = 'localhost' then begin
   
    sBackupPath := ExtractFilePath(Application.ExeName) + '\backup';
    sNamaFileBat := sBackupPath + '\restore.bat';

    if FileExists(sNamaFile) then
      MsgBox('File ' + sNamaFile + ' tidak ditemukan.');

    AssignFile(F, sNamaFileBat);

    Rewrite(F);

    //Writeln(F, 'mysql.exe -u ' + aplikasi.DBUser + ' -p' +
    //  aplikasi.DBPassword + ' < "' + sNamaFile + '"');

    CloseFile(F);

    WinExec(PAnsiChar('"' + sNamaFileBat + '"'), 1);

    MsgBox('Restore Database selesai');
  end
  else
    MsgBox('Restore database hanya bisa dilakukan di komputer server.');

end;

{
function GetLastNoPOPajak : string;
var
  q: TZQuery;
  depan, head: string;
  counter: integer;
begin
  head := 'SDP/' + FormatDateTime('yy', Aplikasi.TanggalServer) + '/';

  q := OpenRS('SELECT * FROM tbl_head_no WHERE header = ''' +
    head + '''');

  if q.IsEmpty then
    head := head + '0001'
  else begin
    counter := q.FieldValues['counter'] + 1;

    head := head + Copy('0000',0,4 - Length(IntToStr(counter))) +
      IntToStr(counter);
  end;
  Result := head;
end;
}

procedure OpenSQL(lst: TList);
var
  i: integer;
  q: TZReadOnlyQuery;
begin
  for i := 0 to lst.Count - 1 do begin
    q := lst[i];
    q.Open;
  end;
end;

procedure SplitStr(const Source, Delimiter: String; var DelimitedList: TStringList);
var
  s: PChar;

  DelimiterIndex: Integer;
  Item: String;
begin
  s:=PChar(Source);

  repeat
    DelimiterIndex:=Pos(Delimiter, s);
    if DelimiterIndex=0 then Break;

    Item:=Copy(s, 1, DelimiterIndex-1);

    DelimitedList.Add(Item);

    inc(s, DelimiterIndex + Length(Delimiter)-1);
  until DelimiterIndex = 0;
  DelimitedList.Add(s);
end;

function terbilang(sValue: string): string;
const
  Angka : array [1..20] of string = ('', 'Satu', 'Dua', 'Tiga', 'Empat',
                                    'Lima', 'Enam', 'Tujuh', 'Delapan',
                                    'Sembilan', 'Sepuluh', 'Sebelas',
                                    'Dua Belas', 'Tiga Belas', 'Empat Belas',
                                    'Lima Belas', 'Enam Belas', 'Tujuh Belas',
                                    'Delapan Belas', 'Sembilan Belas');
  sPattern: string = '000000000000000';
var
  S, Rupiah, Satu, Dua, Tiga, Belas, Gabung, Sen, Sen1, Sen2, curr: string;
  Hitung, one, two, three: integer;

begin
  curr := '';
  One := 4;
  Two := 5;
  Three := 6;
  Hitung := 1;
  Rupiah := '';
  S := copy(sPattern, 1, length(sPattern) - length(trim(sValue))) + sValue;
  Sen1 := Copy(S, 14, 1);
  Sen2 := Copy(S, 15, 1);
  Sen := Sen1 + Sen2;
  while Hitung < 5 do begin
    Satu := Copy(S, One, 1);
    Dua := Copy(S, Two, 1);
    Tiga := Copy(S, Three, 1);
    Gabung := Satu + Dua + Tiga;

    if StrToInt(Satu) = 1 then
      Rupiah := Rupiah + 'Seratus '
    else if StrToInt(Satu) > 1 Then
      Rupiah := Rupiah + Angka[StrToInt(satu)+1] + ' Ratus ';

    if StrToInt(Dua) = 1 then begin
      Belas := Dua + Tiga;
      Rupiah := Rupiah + Angka[StrToInt(Belas)+1];
    end else if StrToInt(Dua) > 1 Then
      Rupiah := Rupiah + Angka[StrToInt(Dua)+1] + ' Puluh ' +
      Angka[StrToInt(Tiga)+1]
    else if (StrToInt(Dua) = 0) and (StrToInt(Tiga) > 0) Then begin
      if ((Hitung = 3) and (Gabung = '001')) or ((Hitung = 3) and (Gabung = ' 1')) then
        Rupiah := Rupiah + 'Seribu '
      else
        Rupiah := Rupiah + Angka[StrToInt(Tiga)+1];
    end;

    if (hitung = 1) and (StrToInt(Gabung) > 0) then
      Rupiah := Rupiah + ' Milyar '
    else if (Hitung = 2) and (StrToInt(Gabung) > 0) then
      Rupiah := Rupiah + ' Juta '
    else if (Hitung = 3) and (StrToInt(Gabung) > 0) then begin
      if (Gabung = '001') or (Gabung = ' 1') then
        Rupiah := Rupiah + ''
      else
        Rupiah := Rupiah + ' Ribu ';
    end;
    Hitung := Hitung + 1;
    One := One + 3;
    Two := Two + 3;
    Three := Three + 3;
  end;
  if length(Rupiah) > 1 then Rupiah := Rupiah + ' ' +curr;
  Result := Rupiah;
end;

function GetStokAkhir(id_brg: integer; id_gdg: Integer): real;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT sf_get_stokakhir(%d,%d) stokakhir',[id_brg, id_gdg]);
  Result := q.FieldByName('stokakhir').AsFloat;
  q.Close;
end;

function GetHpp(id_brg: integer): real;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT IFNULL(sf_get_hpp(%d),0) hpp',[id_brg]);
  Result := q.FieldByName('hpp').AsFloat;
  q.Close;
end;

function CheckWewenang(sNamaWewenang, sNamaUser: string): Boolean;
var
  q: TZQuery;
  f: Boolean;
begin
  f := False;
  q := OpenRS('SELECT * FROM tbl_wewenang WHERE nama = ''%s'' AND nm_comp = ''%s''',
    [sNamaUser, sNamaWewenang]);
  if not q.IsEmpty then
    if q.FieldByName('b').AsInteger = 1 then
      f := True;
  Result := f;
end;

function GetSatuan(id_brg: Integer; var satuan: string): Integer;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT a.id_satuan, b.satuan FROM tbl_barang a LEFT JOIN tbl_satuan b ON a.id_satuan = b.id ' +
    'WHERE a.id = %d',[id_brg]);
  if not q.IsEmpty then begin
    Result := q.FieldByName('id_satuan').AsInteger;
    satuan := q.FieldByName('satuan').AsString;
  end
  else
    Result := 0;
  q.Close;
end;

function GetKonversiSat(id_brg: Integer; id_satuan: Integer): Real;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT qty FROM tbl_konv_brg WHERE id_barang = %d AND id_satuan = %d',[id_brg, id_satuan]);
  if q.IsEmpty then
    Result := 0
  else
    Result := q.FieldByName('qty').AsFloat;
  q.Close;
end;

function GetDefaultAkunBrg(id_brg: integer; sJenis: string): Integer;
var
  sSQL: string;
  q: TZQuery;
begin
  sSQL := 'SELECT idakun_' + sJenis + ' FROM tbl_barang WHERE id = ' + IntToStr(id_brg);
  q := OpenRS(sSQL);
  if not q.IsEmpty then
    Result := q.FieldByName('idakun_' + sJenis).AsInteger
  else
    Result := 0;
  q.Close;
end;

function GetDefaultAkun(jenis: string): integer;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT id_akun FROM tbl_akundefault WHERE jenis = ''%s''',[jenis]);
  Result := q.FieldByName('id_akun').AsInteger;
  q.Close;
end;

function GetHargaCust(id_cust, id_brg: Integer): real;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT harga FROM tbl_historyhargajual WHERE id_cust = %d AND id_brg = %d', [id_cust, id_brg]);
  if not q.IsEmpty then
    Result := q.FieldByName('harga').AsFloat
  else
    Result := 0;
  q.Close;
end;

procedure UpdateHargaCust(id_cust, id_brg: Integer; harga: real);
var
  q: TZQuery;
begin
  q := OpenRS('SELECT * FROM tbl_historyhargajual WHERE id_cust = %d AND id_brg = %d', [id_cust, id_brg]);
  if q.IsEmpty then
    q.Insert
  else
    q.Edit;
  q.FieldByName('id_cust').AsInteger := id_cust;
  q.FieldByName('id_brg').AsInteger := id_brg;
  q.FieldByName('harga').AsFloat := harga;
  q.Post;
  q.Close;
end;

function GetHargaSupp(id_supp, id_brg: Integer): real;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT harga FROM tbl_historyhargabeli WHERE id_supp = %d AND id_brg = %d', [id_supp, id_brg]);
  if not q.IsEmpty then
    Result := q.FieldByName('harga').AsFloat
  else
    Result := 0;
  q.Close;
end;

procedure UpdateHargaSupp(id_supp, id_brg: Integer; harga: real);
var
  q: TZQuery;
begin
  q := OpenRS('SELECT * FROM tbl_historyhargabeli WHERE id_supp = %d AND id_brg = %d', [id_supp, id_brg]);
  if q.IsEmpty then
    q.Insert
  else
    q.Edit;
  q.FieldByName('id_supp').AsInteger := id_supp;
  q.FieldByName('id_brg').AsInteger := id_brg;
  q.FieldByName('harga').AsFloat := harga;
  q.Post;
  q.Close;
end;

function GetKodeBrg(id_brg: Variant): string;
var
  q: TZQuery;
  s: string;
begin
  q := OpenRS('SELECT kode FROM tbl_barang WHERE id = ''%s''',[id_brg]);
  s := '';
  if not q.IsEmpty then
    s := q.FieldByname('kode').AsString;
  Result := s;
  q.Close;
end;

function GetWewenang(NamaUser, NamaMenu: string): string;
var
  q: TZQuery;
begin
  q := OpenRS('SELECT CONVERT(CONCAT(b,i,e,h), CHAR(10)) as wewenang FROM tbl_wewenang WHERE nama = ''%s'' AND nm_comp = ''%s''',
    [NamaUser, NamaMenu]);
  if not q.IsEmpty then
    Result := q.FieldByName('wewenang').AsString
  else
    Result := '';
  q.Close;
end;

end.
