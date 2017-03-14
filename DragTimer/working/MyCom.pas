// A testcomponent for communicating with RS-232
// developed by JKl productions
//
// This is freware and mainly produced, because I
// couldn't find any such component with source for
// Delphi.
// The product is meant as a test component, and
// errors etc. may still occur but I haven't found
// anything serious.
// There is still lot's of space for improvement etc.
// and you are welcome to update and use this unit.
//
// For comments and ideas, adress to
// Jesper Kleis
// Email: CAVA@Image.DK

unit MyCom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
TBaud=(b110,b300,b1200,b2400,b4800,b9600,b14400,b38400,b56000,
       b57600,b115200,b128000,b256000);
tStopBits=(s10,s15,s20);
tParitet=(Zero,Odd,Even,Binary0,Binary1);
tDataBit=4..8;
tPort=(COM1,COM2,COM3,COM4,COM5,COM6,COM7,COM8);
tFlowControl= (Hardware,XON_XOFF);
TComError=procedure (Sender : Tobject;ECode : integer) of object;
pComm=^TComm;
TComm= class (TComponent)
  constructor Create (AOwner: TComponent); override;
  procedure Connect; virtual; // Set up connection
  procedure DisConnect; virtual; // break down connection
  function GetOut : integer;
  function GetIn : integer;
  function GetError : integer;
  procedure SetError  (ECode : integer);
  function GetFlags :string;
  procedure SetEvent (Event : integer);
  function  GetEvent (var Event : cardinal) : boolean;
  procedure SetEscCode (EscCode : integer);
  procedure SendByte (byt : byte); virtual;
  function GetByte : byte; virtual;
  procedure SendString (str : string); virtual;
  function GetString (Len : integer) : string; virtual;
  destructor done;
  private
    FOnError : TComError;
    FStat : pComStat;
    Fport : integer;
    fComPort : tport;
    FBaud : tbaud;
    FDataBit : tdatabit;
    FParitet : tParitet;
    FStopBit : tStopBits;
    fFlow : tFlowcontrol;
    FErrorCode : Integer;
    fconnected : boolean;
    FXON : Char;
    FXOFF : CHAR;
  public
  published
   // Events
   property OnComError : TComError read FOnError write FonError;
   // properties
   property Baud: tBaud read fBaud write fbaud default b9600;
   property StopBits: tStopbits read fStopbit write fstopbit default s10;
   property Parity: tParitet read fparitet write fparitet default zero;
   property DataBits: tDataBit read fDatabit write fDatabit default 8;
   property FlowControl: tFlowControl read fFlow write fFlow default hardware;
   property Port: tport read fComport write fComport default com1;
   property XON : char read FXON WRITE FXON default #17;
   property XOFF : char read FXOFF WRITE FXOFF default #19;
   // Runtime only
   property InQue : integer read GetIn;
   property OutQue : integer read GetOut;
   property Connected : boolean read fConnected;
end;

procedure Register;

implementation

constructor tComm.Create (AOwner: TComponent);

begin
  Inherited create (AOwner);
  fbaud:=b9600;
  fstopbit:=s10;
  fparitet:=zero;
  fDatabit:=8;
  fFlow:=hardware;
  fComport:=com1;
  fXON:=#17;
  fXOFF:=#19;
  New (Fstat);
  fConnected:=false;
end;

procedure tComm.Connect;

var
  aDCB : TDCB;
  temp : byte;

begin
  fstat^.cbinque:=0;
  if fconnected then
    closehandle (Fport);
  Temp:=byte (fComport)+1;
  FPort:=CreateFile (pchar('COM'+IntToStr(temp)),
                    GENERIC_READ or GENERIC_WRITE,0,NIl,
                    OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
  If not SetupComm (fPort,1600,1600) then
    SetError (GetLastError);
  If Not GetCommState (fport,aDCB) then
    SetError (GetLastError);;
  case fbaud of
    b110:    ADCB.baudrate:=CBR_110;
    b300:    ADCB.baudrate:=CBR_300;
    b1200:   ADCB.baudrate:=CBR_1200;
    b2400:   ADCB.baudrate:=CBR_2400;
    b4800:   ADCB.baudrate:=CBR_4800;
    b9600:   ADCB.BaudRate:=CBR_9600;
    b14400:  ADCB.baudrate:=CBR_14400;
    b38400:  ADCB.baudrate:=CBR_38400;
    b56000:  ADCB.baudrate:=CBR_56000;
    b57600:  ADCB.baudrate:=CBR_57600;
    b115200: ADCB.baudrate:=CBR_115200;
    b128000: ADCB.baudrate:=CBR_128000;
    b256000: ADCB.baudrate:=CBR_256000;
  end;
  ADCB.bytesize:=FDatabit;
  ADCB.Parity:=Integer(FParitet);
  ADCB.StopBits:=Integer(FStopbit);
  FErrorCode:=0;
  If FFlow=XON_XOFF then
  begin
    aDcb.flags:=ADcb.flags OR (3 shl 9);
    ADCB.XONChar:=FXON;
    ADCB.XOFFChar:=FXOFF;
  end else
  begin
    aDcb.flags:=ADcb.flags OR (3 shl 9);
    aDcb.flags:=ADcb.flags XOR (3 shl 9);
  end;;
  If Not SetCommState (fport,aDcb) then
    SetError (GetLastError);
  fConnected:=true;
end;

procedure TComm.SetError  (ECode : integer);

begin
  if ECode<>0 then
  begin
    FErrorCode:=ECode;
      if Assigned(OnComError) then OnComError (Self,ECode);
  end;
end;

function TComm.GetFlags :string;

var
  aDCb : tdcb;
  i,test : integer;

begin
  test :=1;
  if not GetCommState (fPort,aDcb) then
    SetError (GetLastError);
  Result:='';
  for i:=0 to 15 do
  begin
    if (test and aDcb.flags)>0 then
      Result:='1'+Result else
      Result:='0'+Result;
    Test:=test shl 1;
  end;
end;

function Tcomm.GetError : integer;

begin
  result:=fErrorCode;
  fErrorCode:=0;
end;

procedure tComm.SendString (Str : string);

var
  a: array [0..1600] of byte;
  Nof : cardinal;
  i : byte;

begin
  for i:=1 to length (str) do
    a[i-1]:=Byte(Str[i]);
  if not WriteFile (fPort,a,Length(str),NOF,NIL) then
    SetError (GetLastError);
end;

function tComm.GetString (Len:Integer) :string;

var
  a: array [0..1600] of byte;
  Nof : cardinal;
  i : byte;
  TStr : string;

begin
  TStr:='';
  if not ReadFile(fPort,a,Len,NOF,NIL) then
    SetError (GetLastError);
  for i:=1 to Nof do
    Tstr:=TStr+Char(a[i-1]);
  Result:=Tstr;
end;

procedure Tcomm.SendByte;

var
  Nof : cardinal;

begin
  if not writeFile (Fport,byt,1,NOF,NIL) then
    SetError (GetLastError);
end;

function Tcomm.GetByte : byte;

var
  Nof : cardinal;
  Byt : byte;

begin
  if not ReadFile (Fport,byt,1,NOF,NIL) then
    SetError (GetLastError);
  result:=byt;
end;

function Tcomm.GetEvent (var Event : cardinal) : boolean;

var
  ev : cardinal;

begin
  if not GetCommMask (fport,Ev) then
    SetError (GetLastError);
  Result:=ev=event;
  Event:=ev;
{
EV_BREAK	A break was detected on input.
EV_CTS          the CTS (clear-to-send) signal changed state.
EV_DSR          The DSR (data-set-ready) signal changed state.
EV_ERR          A line-status error occurred. Line-status errors are CE_FRAME, CE_OVERRUN, and CE_RXPARITY.
EV_EVENT1	An event of the first provider-specific type occured.
EV_EVENT2	An event of the second provider-specific type occured.
EV_RING	        A ring indicator was detected.
EV_RLSD	        The RLSD (receive-line-signal-detect) signal changed state.
EV_RX80FULL     The receive buffer is 80 percent full.
EV_RXCHAR       A character was received and placed in the input buffer.
EV_RXFLAG       The event character was received and placed in the input buffer. The event character is specified in the device's DCB structure, which is applied to a serial port by using the SetCommState function.
EV_TXEMPTY      The last character in the output buffer was sent.
}
end;

procedure TComm.SetEvent (Event : integer);

begin
  if not SetCommMask (FPort,Event) then
    SetError (GetLastError);
end;

procedure TComm.SetEscCode;

begin
  if not EscapeCommFunction (FPort,EscCode) then
    SetError (GetLastError);
{
CLRDTR	Clears the DTR (data-terminal-ready) signal.
CLRRTS	Clears the RTS (request-to-send) signal.
SETDTR	Sends the DTR (data-terminal-ready) signal.
SETRTS	Sends the RTS (request-to-send) signal.
SETXOFF	Causes transmission to act as if an XOFF character has been received.
SETXON	Causes transmission to act as if an XON character has been received.
}
end;

function tComm.GetOut : integer;

var
  mErrorCode : cardinal;

begin
  ClearCommError (FPort,mErrorCode,fStat);
  If FerrorCode = 0 then
    SetError(mErrorCode);
  Result:=fstat^.cboutQue;
end;

function tComm.GetIn : integer;

var
  mErrorCode : cardinal;

begin
  ClearCommError (FPort,mErrorCode,fStat);
  If FerrorCode = 0 then
    SetError(mErrorCode);
  Result:=fstat^.cbinQue;
end;

destructor tComm.done;

begin
  dispose (Fstat);
  closeHandle (fPort);
  FConnected := false;
end;

procedure Register;

begin
  RegisterComponents ('Samples',[tComm]);
end;

procedure TComm.DisConnect;
begin
  if fconnected then
  begin
    closehandle (Fport);
    fConnected := false;
    fPort := -1;
    SetError (0);
  end;
end;

end.

