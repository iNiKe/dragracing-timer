unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, SerialNG, ExtCtrls, XComDrv, Spin;

type tcmdblock = record
       sig : byte;
       blockcnt : byte;
       addr : byte;
       data : byte;
       crc : byte;
       tail : byte;
     end;

type
  TDragTimerForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Label9: TLabel;
    Label10: TLabel;
    Timer1: TTimer;
    Button4: TButton;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    TabSheet3: TTabSheet;
    cbPort: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Button3: TButton;
    TrackTimerCBox: TCheckBox;
    GroupBox1: TGroupBox;
    fdReqBtn: TButton;
    Spd1CBox: TCheckBox;
    Spd2CBox: TCheckBox;
    Time1CBox: TCheckBox;
    Time2CBox: TCheckBox;
    GroupBox2: TGroupBox;
    DataReqBtn: TButton;
    isSpd1CBox: TCheckBox;
    isSpd2CBox: TCheckBox;
    isTime1CBox: TCheckBox;
    isTime2CBox: TCheckBox;
    Time1Btn: TButton;
    Time2Btn: TButton;
    Speed1Btn: TButton;
    Speed2Btn: TButton;
    Time1Edit: TEdit;
    Time2Edit: TEdit;
    Speed1Edit: TEdit;
    Speed2Edit: TEdit;
    fdFalseTrack1CBox: TCheckBox;
    fdFalseTrack2CBox: TCheckBox;

    ltRedCBox: TCheckBox;
    ltYellowCBox: TCheckBox;
    ltGreenCBox: TCheckBox;
    lt2RedCBox: TCheckBox;
    lt2YellowCBox: TCheckBox;
    lt2GreenCBox: TCheckBox;

    fdReadyTrack1CBox: TCheckBox;
    fdReadyTrack2CBox: TCheckBox;
    fdRefCBox: TCheckBox;
    Button5: TButton;
    Memo1: TMemo;
    TabSheet4: TTabSheet;
    Button7: TButton;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    T1DriverEdit: TEdit;
    T2DriverEdit: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    T1CarEdit: TEdit;
    T2CarEdit: TEdit;
    Button8: TButton;
    T1Red: TMemo;
    T1Yellow: TMemo;
    T1Green: TMemo;
    T2Red: TMemo;
    T2Yellow: TMemo;
    T2Green: TMemo;
    Label15: TLabel;
    Label16: TLabel;
    Button9: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ReadyBtn: TButton;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Button6: TButton;
    XCommp: TXComm;
    T1SpdEdit: TEdit;
    T1TimeEdit: TEdit;
    T2SpdEdit: TEdit;
    T2TimeEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button11: TButton;
    TimeDivEdit: TSpinEdit;
    Label6: TLabel;
    Time1TEdit: TEdit;
    Time2TEdit: TEdit;
    Speed1TEdit: TEdit;
    Speed2TEdit: TEdit;
    DragMemo: TMemo;
    Timer2: TTimer;
    FinishCheckBox: TCheckBox;
    Label7: TLabel;
    Timer3: TTimer;
    FinishStatusEdit: TEdit;
    SPD1CheckBox: TCheckBox;
    FIN1CheckBox: TCheckBox;
    SPD2CheckBox: TCheckBox;
    FIN2CheckBox: TCheckBox;

    procedure N3Click(Sender: TObject);
    procedure ltRedCBoxClick(Sender: TObject);
    procedure ltYellowCBoxClick(Sender: TObject);
    procedure ltGreenCBoxClick(Sender: TObject);
    procedure fdReqBtnClick(Sender: TObject);
    procedure DataReqBtnClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Time1BtnClick(Sender: TObject);
    procedure Time2BtnClick(Sender: TObject);
    procedure Speed1BtnClick(Sender: TObject);
    procedure Speed2BtnClick(Sender: TObject);
    procedure TrackTimerCBoxClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure lt2RedCBoxClick(Sender: TObject);
    procedure lt2YellowCBoxClick(Sender: TObject);
    procedure lt2GreenCBoxClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);

    function  StartStatus : integer;
    function  BlockStartCmd(a1 : byte; var bbuf : array of byte; var outcnt : integer; waitans : boolean) : integer;
    function  BlockFinishCmd(a1 : byte; var bbuf : array of byte; var outcnt : integer; waitans : boolean) : integer;
    function  SendBlkCmd(const cmd : tcmdblock; var outdata : array of byte; var outcnt : integer) : integer;
    function  SetTrackTimers(f : boolean) : integer;
    function  ReadTrackTimer(t : byte) :  integer;
    procedure GetDataStatus;

    procedure DoLog(s : string);
    procedure Button8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure XCommpCommEvent(Sender: TObject;
      const Events: TDeviceEvents);
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ReadyBtnClick(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure TimeDivEditChange(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    function mySetRTS(fl : boolean) : integer;
    procedure FinishCheckBoxClick(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const ltRed = 1;
      ltYellow = 2;
      ltGreen = 3;
      ltFalse1 = 4;
      ltFalse2 = 5;

      defwritedelay = 150;
      defreaddelay = 100;

      clrRTSTime = 100;

      url_nikesoft_updates = 'http://www.nikesoft.ru/updates/';
      url_nikesoft_ru = 'http://www.nikesoft.ru/';
      url_nikesoft_guest = 'http://www.nikesoft.ru/gb/';
      url_nikesoft_forum = 'http://www.nikesoft.ru/forum/';

var
  DragTimerForm: TDragTimerForm;
  tticks : integer = 0;
  receive : boolean = false;
  racestopped : boolean = true;
  rxcluster : boolean = false;
  I_ExtendedTicks: Boolean;
  I_Freq: Int64;
  writedelay : integer = defwritedelay;
  readdelay : integer = defreaddelay;
  writedone : boolean = false;
  track1time,track2time,track1speed,track2speed : double;

  timediv : integer = 25000;

function OpenPort(sport : string) : integer;
function ClosePort : integer;
//function SendPort(b : byte) : integer;
//function GetPortByte(var b : byte) : integer;
//function GetPortLongint(var l : longint) : integer;
function SetLight(track, l : integer; f : boolean) : integer;
function SetTimerOn(ison : boolean) : integer;
procedure OpenURL(url : string);


implementation uses shellapi;

{$R *.dfm}

procedure OpenURL(url : string);
begin
  ShellExecute(0,'open',PAnsiChar(url),nil,nil,SW_SHOWNORMAL);
end;

(*
procedure IncRead(i : integer);
begin
  if not _connected then exit;
  if i > 0 then
  begin
    inc(_total_read,i);
// status
    Application.ProcessMessages;
  end;
end;

procedure IncWrite(i : integer);
begin
  if not _connected then exit;
  if i > 0 then
  begin
    inc(_total_write,i);
// status
    Application.ProcessMessages;
  end;
end;
*)
function OpenPort(sport : string) : integer;
var lDCB: TDCB;
begin
  result := -1;
  with DragTimerForm do
  begin
    if XCommp.Opened then ClosePort;

    sport := trim(sport);
    XCommp.DeviceName := sport;
    XCommp.DataControl.DataBits := db8;
    XCommp.DataControl.Parity := paNone;
    XCommp.DataControl.StopBits := sb1;
//    XCommp.FlowControl := fcRtsCts;
    XCommp.FlowControl := fcNone;

    XCommp.OpenDevice;

    if XCommp.Opened then
    begin
      if GetCommState( XCommp.Handle, lDCB) then
      begin
//         ldcb.Flags:=(ldcb.Flags And $FFFFC0FF) Or $00000100;  // Manual RTS
        SetCommState( XCommp.Handle, ldcb);
      end;

//      XCommp.ToggleRTS(brSet);
      mySetRTS(true);

      XCommp.PurgeIn;
      XCommp.PurgeOut;

      statusbar1.Panels[0].Text := sport;
      TabSheet1.Enabled := true;
      TabSheet2.Enabled := true;
      TabSheet4.Enabled := true;
    end else
    begin
      MessageDlg('Ошибка открытия порта! ['+inttostr(result)+']',mtError,[mbOk],0)
    end;
  end;
end;

function ClosePort : integer;
begin
  result := -1;
  with DragTimerForm do
  begin
    if XCommp.Opened then XCommp.CloseDevice;
    statusbar1.Panels[0].Text := '';
    TabSheet1.Enabled := false;
    TabSheet2.Enabled := false;
    TabSheet4.Enabled := false;
  end;
  result := 0;
end;

(*
function SendPort(b : byte) : integer;
var nr : cardinal;
    s : string;
    l,i : integer;
begin
  result := -1; nr := 0;
  if not DragTimerForm.ComPortNG.Active then exit;
  DragTimerForm.ComPortNG.SendData(@b,1);
  result := 0;
  if result = 0 then
  begin
    for i := 7 downto 0 do
    begin
      l := 1 shl i;
      if (b and l = l) then s := s + '1' else s := s + '0';
    end;
  end;
end;

function GetPortByte(var b : byte) : integer;
begin
  result := -1;
  b := 0;
  if not DragTimerForm.ComPortNG.Active then exit;
  with DragTimerForm do
  begin
    if ComPortNG.GetIn > 0 then
    begin
      b := ComPort.GetByte;
      result := ComPort.GetError;
    end;
  end;
end;

function GetPortLongint(var l : longint) : integer;
var b1,b2,b3,b4 : byte;
begin
  result := -1;
  l := 0;
  if not DragTimerForm.ComPortNG.Active then exit;
  if (GetPortByte(b1) = 0)and(GetPortByte(b2) = 0)and(GetPortByte(b3) = 0)and(GetPortByte(b4) = 0) then
  begin
    result := 0;
    l := b1 + b2 shl 8 + b3 shl 16 + b4 shl 24;
  end;
end;
*)

function SetTimerOn(ison : boolean) : integer;
var sb : byte;
    oc : integer;
    bbuf : array[1..128] of byte;
begin
  result := -1;
  if not DragTimerForm.XCommp.Opened then exit;
  sb := 1;
  if ison then sb := sb or (1 shl 5);
  result := DragTimerForm.BlockFinishCmd(sb,bbuf,oc,true);
  DragTimerForm.Timer2.Enabled := ison;
end;

function SetLight(track,l : integer; f : boolean) : integer;
var b,b2,sb : byte;
    bf : array[1..32] of byte;
    bfc : integer;
begin
  result := -1;
  with DragTimerForm do
  begin
    if not XCommp.Opened then exit;
    if (l >= 1)and(l <= 5) then
    begin
      sb := byte(l);
      if (track <> 1) then b2 := 1 else b2 := 0;
      if f then b := 1 else b := 0;
      if f then sb := sb or (b shl 5);
      sb := sb or (b2 shl 2);
      result := BlockStartCmd(sb,bf,bfc,true);
      if track = 1 then
      begin
        if l = ltRed then if f then begin ltRedCBox.Checked := true; T1Red.Color := clRed; end else begin ltRedCBox.Checked := false; T1Red.Color := clBtnFace; end;
        if l = ltYellow then if f then begin ltYellowCBox.Checked := true; T1Yellow.Color := clYellow; end else begin ltYellowCBox.Checked := false; T1Yellow.Color := clBtnFace; end;
        if l = ltGreen then if f then begin ltGreenCBox.Checked := true; T1Green.Color := clLime; end else begin ltGreenCBox.Checked := false; T1Green.Color := clBtnFace; end;
      end else
//      if track = 2 then
      begin
        if l = ltRed then if f then begin lt2RedCBox.Checked := true; T2Red.Color := clRed; end else begin lt2RedCBox.Checked := false; T2Red.Color := clBtnFace; end;
        if l = ltYellow then if f then begin lt2YellowCBox.Checked := true; T2Yellow.Color := clYellow; end else begin lt2YellowCBox.Checked := false; T2Yellow.Color := clBtnFace; end;
        if l = ltGreen then if f then begin lt2GreenCBox.Checked := true; T2Green.Color := clLime; end else begin lt2GreenCBox.Checked := false; T2Green.Color := clBtnFace; end;
      end;
    end;
  end;
end;

procedure TDragTimerForm.N3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TDragTimerForm.ltRedCBoxClick(Sender: TObject);
begin
  SetLight(1,ltRed,(Sender as TCheckBox).Checked);
end;

procedure TDragTimerForm.ltYellowCBoxClick(Sender: TObject);
begin
  SetLight(1,ltYellow,(Sender as TCheckBox).Checked);
end;

procedure TDragTimerForm.ltGreenCBoxClick(Sender: TObject);
begin
  SetLight(1,ltGreen,(Sender as TCheckBox).Checked);
end;

procedure TDragTimerForm.fdReqBtnClick(Sender: TObject);
var sb,b1,b2 : byte;
    outcnt,e : integer;
    blk : tcmdblock;
    str : string;
    bbuf : array[1..128] of byte;
begin
  if not XCommp.Opened then exit;

  Spd1CBox.Checked := false;
  Spd2CBox.Checked := false;
  Time1CBox.Checked := false;
  Time2CBox.Checked := false;
  Spd1CBox.Enabled := false;
  Spd2CBox.Enabled := false;
  Time1CBox.Enabled := false;
  Time2CBox.Enabled := false;

  BlockFinishCmd($40,bbuf,outcnt,true);

  begin
    b2 := bbuf[11];
    begin
//      if b1 = sb then
      begin
        if ((b2 and 1) <> 1) then
        begin
          Time1CBox.Checked := true;
          Time1CBox.Enabled := true;
        end;
        if ((b2 and 2) <> 2) then
        begin
          Time2CBox.Checked := true;
          Time2CBox.Enabled := true;
        end;
        if ((b2 and 4) <> 4) then
        begin
          Spd1CBox.Checked := true;
          Spd1CBox.Enabled := true;
        end;
        if ((b2 and 8) <> 8) then
        begin
          Spd2CBox.Checked := true;
          Spd2CBox.Enabled := true;
        end;
      end;
    end;
  end;
end;

procedure TDragTimerForm.DataReqBtnClick(Sender: TObject);
begin
  GetDataStatus;
end;

procedure TDragTimerForm.Button3Click(Sender: TObject);
begin
  StartStatus;
end;

procedure TDragTimerForm.FormCreate(Sender: TObject);
begin
  timediv := TimeDivEdit.Value;
  T1SpdEdit.Text := '';
  T1TimeEdit.Text := '';
  T2SpdEdit.Text := '';
  T2TimeEdit.Text := '';

  TabSheet1.Enabled := false;
  TabSheet2.Enabled := false;
  TabSheet4.Enabled := false;

  fdFalseTrack1CBox.Checked := false;
  fdFalseTrack2CBox.Checked := false;
  fdReadyTrack1CBox.Checked := false;
  fdReadyTrack2CBox.Checked := false;
  fdRefCBox.Checked := false;
  ltRedCBox.Checked := false;
  ltYellowCBox.Checked := false;
  ltGreenCBox.Checked := false;
  TrackTimerCBox.Checked := false;
  Spd1CBox.Checked := false;
  Spd2CBox.Checked := false;
  Time1CBox.Checked := false;
  Time2CBox.Checked := false;
  Spd1CBox.Enabled := false;
  Spd2CBox.Enabled := false;
  Time1CBox.Enabled := false;
  Time2CBox.Enabled := false;
  isSpd1CBox.Checked := false;
  isSpd2CBox.Checked := false;
  isTime1CBox.Checked := false;
  isTime2CBox.Checked := false;
  isSpd1CBox.Enabled := false;
  isSpd2CBox.Enabled := false;
  isTime1CBox.Enabled := false;
  isTime2CBox.Enabled := false;
  Time1Edit.Text := '';
  Time2Edit.Text := '';
  Speed1Edit.Text := '';
  Speed2Edit.Text := '';
  cbPort.ItemIndex := 0;
  Time1Btn.Enabled := false;
  Time2Btn.Enabled := false;
  Speed1Btn.Enabled := false;
  Speed2Btn.Enabled := false;
  T1Red.Color := clBtnFace;
  T1Yellow.Color := clBtnFace;
  T1Green.Color := clBtnFace;
  T2Red.Color := clBtnFace;
  T2Yellow.Color := clBtnFace;
  T2Green.Color := clBtnFace;
end;

procedure TDragTimerForm.Button2Click(Sender: TObject);
begin
  if ClosePort = 0 then
  begin
    statusbar1.Panels[0].Text := '';
    TabSheet1.Enabled := false;
    TabSheet2.Enabled := false;
    TabSheet4.Enabled := false;
  end;
end;

procedure TDragTimerForm.Button1Click(Sender: TObject);
begin
  OpenPort(cbPort.Text);
end;

procedure TDragTimerForm.Time1BtnClick(Sender: TObject);
var outcnt,time : integer;
    b1,b2,b3,b4 : byte;
    var bbuf : array[1..128] of byte;
begin
  if not DragTimerForm.XCommp.Opened then exit;

  BlockFinishCmd($61,bbuf,outcnt,true);

  b1 := bbuf[11];
  b2 := bbuf[12];
  b3 := bbuf[13];

  time := b1 + b2 shl 8 + b3 shl 16;
  time1edit.Text := floattostr(time/timediv);
  Time1TEdit.Text := inttostr(time);
end;

procedure TDragTimerForm.Time2BtnClick(Sender: TObject);
var outcnt,time : integer;
    b1,b2,b3,b4 : byte;
    var bbuf : array[1..128] of byte;
begin
  if not DragTimerForm.XCommp.Opened then exit;

  BlockFinishCmd($62,bbuf,outcnt,true);

  b1 := bbuf[11];
  b2 := bbuf[12];
  b3 := bbuf[13];

  time := b1 + b2 shl 8 + b3 shl 16;
  time2edit.Text := floattostr(time/timediv);
  Time2TEdit.Text := inttostr(time);
end;

procedure TDragTimerForm.Speed1BtnClick(Sender: TObject);
var outcnt,time : integer;
    b1,b2,b3,b4 : byte;
    var bbuf : array[1..128] of byte;
begin
  if not DragTimerForm.XCommp.Opened then exit;

  BlockFinishCmd($63,bbuf,outcnt,true);

  b1 := bbuf[11];
  b2 := bbuf[12];
  b3 := bbuf[13];

  time := b1 + b2 shl 8 + b3 shl 16;
  Speed1Edit.Text := floattostr(time/timediv);
end;

procedure TDragTimerForm.Speed2BtnClick(Sender: TObject);
var outcnt,time : integer;
    b1,b2,b3,b4 : byte;
    var bbuf : array[1..128] of byte;
begin
  if not DragTimerForm.XCommp.Opened then exit;

  BlockFinishCmd($64,bbuf,outcnt,true);

  b1 := bbuf[11];
  b2 := bbuf[12];
  b3 := bbuf[13];

  time := b1 + b2 shl 8 + b3 shl 16;
  Speed2Edit.Text := floattostr(time/timediv);
end;

procedure TDragTimerForm.TrackTimerCBoxClick(Sender: TObject);
begin
  SetTimerOn((Sender as TCheckBox).Checked);
end;

procedure TDragTimerForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if XCommp.Opened then ClosePort;
end;

procedure TDragTimerForm.N7Click(Sender: TObject);
begin
  OpenURL(url_nikesoft_updates);
end;

procedure TDragTimerForm.N6Click(Sender: TObject);
begin
  OpenURL(url_nikesoft_ru);
end;

procedure TDragTimerForm.N8Click(Sender: TObject);
begin
  OpenURL(url_nikesoft_forum);
end;

procedure TDragTimerForm.N9Click(Sender: TObject);
begin
  OpenURL(url_nikesoft_guest);
end;

function TDragTimerForm.BlockFinishCmd(a1 : byte; var bbuf: array of byte; var outcnt: integer; waitans : boolean): integer;
var blk : tcmdblock;
    str : string;
    nn,i : integer;
begin
  result := -1;
  if not XCommp.Opened then exit;

  blk.sig := $aa;
  blk.blockcnt := $01;
  blk.addr := $31;
  blk.data := a1;
  if (a1 >= 61)and(a1 <= 64) then nn := 2 else nn := 0;
  blk.crc := (blk.blockcnt + blk.addr + blk.data) mod 256;
  blk.tail := $55;

  result := SendBlkCmd(blk,bbuf,outcnt);
end;

function TDragTimerForm.BlockStartCmd(a1 : byte; var bbuf: array of byte;
  var outcnt: integer; waitans : boolean): integer;
var blk : tcmdblock;
    i : integer;
    str : string;
    stime : dword;
begin
  result := -1;
  if not XCommp.Opened then exit;

  blk.sig      := $aa;
  blk.blockcnt := $01;
  blk.addr     := $21;
  blk.data     := a1;
  blk.crc      := (blk.blockcnt + blk.addr + blk.data) mod 256;
  blk.tail     := $55;

  DoLog('-> StartCMD ['+inttostr(a1)+']');

  result := SendBlkCmd(blk,bbuf,outcnt);
end;

procedure TDragTimerForm.lt2RedCBoxClick(Sender: TObject);
begin
  SetLight(2,ltRed,(Sender as TCheckBox).Checked);
end;

procedure TDragTimerForm.lt2YellowCBoxClick(Sender: TObject);
begin
  SetLight(2,ltYellow,(Sender as TCheckBox).Checked);
end;

procedure TDragTimerForm.lt2GreenCBoxClick(Sender: TObject);
begin
  SetLight(2,ltGreen,(Sender as TCheckBox).Checked);
end;

function TDragTimerForm.StartStatus: integer;
var sb,b1,b2 : byte;
    ar : array[1..128] of byte;
    tc : integer;
begin
  if not XCommp.Opened then exit;

  fillchar(ar,sizeof(ar),#0);
  if BlockStartCmd($40,ar,tc,true) = 0 then
  begin
    fdFalseTrack2CBox.Checked := not ((ar[11] and 128) = 128);
    fdFalseTrack1CBox.Checked := not ((ar[11] and 64) = 64);
    fdReadyTrack2CBox.Checked := not ((ar[11] and 32) = 32);
    fdReadyTrack1CBox.Checked := not ((ar[11] and 16) = 16);
    fdRefCBox.Checked         := not ((ar[11] and 8) = 8);
  end;
end;

procedure TDragTimerForm.Timer1Timer(Sender: TObject);
begin
//  StartStatus;
  tticks := (tticks + 1) mod 6;

  case tticks of
  0: begin SetLight(2,ltGreen,false); SetLight(1,ltRed,true); end;
  1: begin SetLight(1,ltRed,false); SetLight(1,ltYellow,true); end;
  2: begin SetLight(1,ltYellow,false); SetLight(1,ltGreen,true); end;
  3: begin SetLight(1,ltGreen,false); SetLight(2,ltRed,true); end;
  4: begin SetLight(2,ltRed,false); SetLight(2,ltYellow,true); end;
  5: begin SetLight(2,ltYellow,false); SetLight(2,ltGreen,true); end;
  end;
end;

procedure TDragTimerForm.Button4Click(Sender: TObject);
begin
  SetLight(1,ltRed,false);
  SetLight(1,ltYellow,false);
  SetLight(1,ltGreen,false);

  SetLight(2,ltRed,false);
  SetLight(2,ltYellow,false);
  SetLight(2,ltGreen,false);
end;

procedure TDragTimerForm.Button5Click(Sender: TObject);
begin
  SetLight(1,ltRed,true);
  SetLight(1,ltYellow,true);
  SetLight(1,ltGreen,true);

  SetLight(2,ltRed,true);
  SetLight(2,ltYellow,true);
  SetLight(2,ltGreen,true);
end;

function TDragTimerForm.SetTrackTimers(f: boolean): integer;
begin
  SetTimerOn(f);
  result := 0;
end;

function TDragTimerForm.ReadTrackTimer(t: byte): integer;
var outcnt,time : integer;
    b1,b2,b3,b4 : byte;
    var bbuf : array[1..128] of byte;
begin
  if not DragTimerForm.XCommp.Opened then exit;

  BlockFinishCmd($60+t,bbuf,outcnt,true);

  b1 := bbuf[11];
  b2 := bbuf[12];
  b3 := bbuf[13];

  time := b1 + b2 shl 8 + b3 shl 16;
//  time1edit.Text := floattostr(time/timediv);
//  Time1TEdit.Text := inttostr(time);
  result := time;
end;

procedure TDragTimerForm.DoLog(s: string);
begin
  memo1.Lines.Add(s);
end;

procedure TDragTimerForm.Button8Click(Sender: TObject);
begin
  FinishCheckBox.Checked := false;
  Timer1.Enabled := false;
  Timer2.Enabled := false;

  racestopped := true;
  SetLight(1,ltRed,true);
  SetLight(1,ltYellow,true);
  SetLight(1,ltGreen,true);

  SetLight(2,ltRed,true);
  SetLight(2,ltYellow,true);
  SetLight(2,ltGreen,true);
  SetTrackTimers(false);
end;

procedure TDragTimerForm.N2Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 2;
end;

procedure TDragTimerForm.Button6Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TDragTimerForm.XCommpCommEvent(Sender: TObject;
  const Events: TDeviceEvents);
begin
  if deOutEmpty in Events then
  begin
//    DoLog('deOutEmpty');
    writedone := true;
  end;
end;

procedure TDragTimerForm.Button9Click(Sender: TObject);
begin
  FinishCheckBox.Checked := false;
  racestopped := true;
  Timer1.Enabled := false;

  T1SpdEdit.Text := '';
  T1TimeEdit.Text := '';
  T2SpdEdit.Text := '';
  T2TimeEdit.Text := '';
  
  SetLight(1,ltRed,true);
  SetLight(1,ltYellow,false);
  SetLight(1,ltGreen,false);

  SetLight(2,ltRed,true);
  SetLight(2,ltYellow,false);
  SetLight(2,ltGreen,false);
  SetTrackTimers(false);
end;

procedure TDragTimerForm.Button7Click(Sender: TObject);
begin
  FinishCheckBox.Checked := false;
  T1SpdEdit.Text := '';
  T1TimeEdit.Text := '';
  T2SpdEdit.Text := '';
  T2TimeEdit.Text := '';

  track1speed := 0;
  track2speed := 0;
  track1time := 0;
  track2time := 0;

  racestopped := false;
  Timer1.Enabled := false;

  SetTrackTimers(false);
  SetLight(1,ltRed,false);
  SetLight(1,ltGreen,false);
  SetLight(2,ltRed,false);
  SetLight(2,ltGreen,false);

  SetLight(1,ltYellow,true);
  SetLight(2,ltYellow,true);
  Application.ProcessMessages;
  if racestopped then exit;
  sleep(2000);
  if racestopped then exit;
  SetLight(2,ltYellow,false);
  SetLight(1,ltYellow,false);
  Application.ProcessMessages;
  if racestopped then exit;
  sleep(300);
  if racestopped then exit;
  SetLight(2,ltYellow,true);
  SetLight(1,ltYellow,true);
  Application.ProcessMessages;
  if racestopped then exit;
  sleep(1500);
  if racestopped then exit;
  SetLight(2,ltYellow,false);
  SetLight(1,ltYellow,false);
  Application.ProcessMessages;
  if racestopped then exit;
  sleep(300);
  if racestopped then exit;
  SetLight(2,ltYellow,true);
  SetLight(1,ltYellow,true);
  Application.ProcessMessages;
  if racestopped then exit;
  sleep(1500);
  if racestopped then exit;
  SetLight(2,ltYellow,false);
  SetLight(1,ltYellow,false);
  SetLight(1,ltGreen,true);
  SetLight(2,ltGreen,true);
  SetTrackTimers(true);
  Application.ProcessMessages;
end;

procedure TDragTimerForm.ReadyBtnClick(Sender: TObject);
begin
  FinishCheckBox.Checked := false;
  racestopped := true;
  SetTrackTimers(false);
  Timer1.Enabled := false;
  Timer2.Enabled := false;
  SetLight(1,ltRed,false);
  SetLight(1,ltYellow,false);
  SetLight(1,ltGreen,false);
  SetLight(2,ltRed,false);
  SetLight(2,ltYellow,false);
  SetLight(2,ltGreen,false);
{
  T1SpdEdit.Text := '';
  T1TimeEdit.Text := '';
  T2SpdEdit.Text := '';
  T2TimeEdit.Text := '';
}
end;

procedure TDragTimerForm.Button11Click(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled; 
end;

procedure TDragTimerForm.TimeDivEditChange(Sender: TObject);
begin
  timediv := TimeDivEdit.Value;
end;

procedure TDragTimerForm.GetDataStatus;
var sb,b1,b2 : byte;
    bbuf : array[1..128] of byte;
    outcnt : integer;

    time : integer;
    timesec : double;
//**************
  procedure FinishStatus;
  begin
(*
    if (not racestopped) then
    begin
      if (track1time > track2time)or(track1time <= 0) then
      begin
        SetLight(2,ltRed,true);
        SetLight(2,ltYellow,true);
        SetLight(2,ltGreen,true);

        SetLight(1,ltRed,false);
        SetLight(1,ltYellow,false);
        SetLight(1,ltGreen,false);
      end;
      if (track1time < track2time)or(track2time <= 0) then
      begin
        SetLight(1,ltRed,true);
        SetLight(1,ltYellow,true);
        SetLight(1,ltGreen,true);

        SetLight(2,ltRed,false);
        SetLight(2,ltYellow,false);
        SetLight(2,ltGreen,false);
      end;
    end;
*)
  end;

begin
  isSpd1CBox.Checked := false;
  isSpd2CBox.Checked := false;
  isTime1CBox.Checked := false;
  isTime2CBox.Checked := false;
  isSpd1CBox.Enabled := false;
  isSpd2CBox.Enabled := false;
  isTime1CBox.Enabled := false;
  isTime2CBox.Enabled := false;

  Time1Edit.Text := '';
  Time2Edit.Text := '';
  Speed1Edit.Text := '';
  Speed2Edit.Text := '';

  Time1TEdit.Text := '';
  Time2TEdit.Text := '';
  Speed1TEdit.Text := '';
  Speed2TEdit.Text := '';

  Time1Btn.Enabled := false;
  Time2Btn.Enabled := false;
  Speed1Btn.Enabled := false;
  Speed2Btn.Enabled := false;

  if not XCommp.Opened then exit;

  sb := 1;
  sb := sb + (1 shl 6);

  BlockFinishCmd(sb,bbuf,outcnt,true);

  b2 := bbuf[11];

  if ((b2 and 1) = 1) then
  begin
    isTime1CBox.Checked := true;
    isTime1CBox.Enabled := true;

    time := ReadTrackTimer(1);
    timesec := time/timediv;
    time1edit.Text := floattostr(timesec);
    Time1TEdit.Text := inttostr(time);
    T1TimeEdit.Text := floattostr(timesec);
    track1time := timesec;
    FinishStatus;
  end;
  if ((b2 and 2) = 2) then
  begin
    isTime2CBox.Checked := true;
    isTime2CBox.Enabled := true;

    time := ReadTrackTimer(2);
    timesec := time/timediv;
    time2edit.Text := floattostr(timesec);
    Time2TEdit.Text := inttostr(time);
    T2TimeEdit.Text := floattostr(timesec);
    track2time := timesec;
    FinishStatus;
  end;
  if ((b2 and 4) = 4) then
  begin
    isSpd1CBox.Checked := true;
    isSpd1CBox.Enabled := true;

    time := ReadTrackTimer(3);
    timesec := time/timediv;
    speed1edit.Text := floattostr(timesec);
    speed1TEdit.Text := inttostr(time);
    T1SpdEdit.Text := floattostr(timesec);
    track1speed := timesec;
  end;
  if ((b2 and 8) = 8) then
  begin
    isSpd2CBox.Checked := true;
    isSpd2CBox.Enabled := true;

    time := ReadTrackTimer(4);
    timesec := time/timediv;
    speed2edit.Text := floattostr(timesec);
    speed2TEdit.Text := inttostr(time);
    T2SpdEdit.Text := floattostr(timesec);
    track2speed := timesec;
  end;

  Speed1Btn.Enabled := isSpd1CBox.Checked;
  Speed2Btn.Enabled := isSpd2CBox.Checked;
  Time1Btn.Enabled := isTime1CBox.Checked;
  Time2Btn.Enabled := isTime2CBox.Checked;

  if not racestopped then
  begin
    if (isTime1CBox.Checked)and(isTime2CBox.Checked) then
    begin
      ReadyBtn.Click;
    end;
  end;
end;

procedure TDragTimerForm.Timer2Timer(Sender: TObject);
begin
  if racestopped then exit;
  GetDataStatus;
end;

function TDragTimerForm.SendBlkCmd(const cmd: tcmdblock;
  var outdata: array of byte; var outcnt: integer): integer;
begin
  if (XCommp.OutCount > 0) then
  begin
//    mySetRTS(false);
    XCommp.ToggleRTS(brSet);
    XCommp.ReadData(outdata,XCommp.OutCount);
  end;

  XCommp.PurgeIn;
  XCommp.PurgeOut;

  XCommp.ToggleRTS(brClear);

  writedone := false;
//  mySetRTS(true);
  outcnt := XCommp.SendData(cmd,sizeof(cmd));
  if outcnt > 0 then result := 0;
  fillchar(outdata,sizeof(outdata),#0);
  while not writedone do Application.ProcessMessages;
//  sleep(100);
  Application.ProcessMessages;
  XCommp.ToggleRTS(brClear);
//  mySetRTS(false);
  outcnt := XCommp.ReadData(outdata,13);
  result := 0;
end;

function TDragTimerForm.mySetRTS(fl: boolean): integer;
begin
  result := -1;
  if not XCommp.Opened then exit;
//  if not fl then EscapeCommFunction( XCommp.Handle, SETRTS) else EscapeCommFunction( XCommp.Handle, CLRRTS);
  EscapeCommFunction( XCommp.Handle, CLRRTS);
  result := 0;
end;

procedure TDragTimerForm.FinishCheckBoxClick(Sender: TObject);
begin
  if XCommp.Opened then Timer3.Enabled := FinishCheckBox.Checked;
end;

procedure TDragTimerForm.Timer3Timer(Sender: TObject);
var bbuf : array[1..128] of byte;
    outcnt : integer;
    fl,ok : boolean;
    b2 : byte;
begin
  if not XCommp.Opened then exit;
  ok := false;
  if BlockFinishCmd($40,bbuf,outcnt,true) = 0 then
  begin
    if (outcnt = 13) and
       (bbuf[ 1] = $aa)and(bbuf[ 2] = $01)and(bbuf[ 3] = $31)and(bbuf[ 4] = $40)and(bbuf[ 5] = $72)and(bbuf[ 6] = $55)and
       (bbuf[ 7] = $aa)and(bbuf[ 8] = $02)and(bbuf[ 9] = $13)and(bbuf[10] = $40){and(bbuf[11] = $03)and(bbuf[12] = $58)}and(bbuf[13] = $55) then
    begin
      FinishStatusEdit.Text := 'Status: OK ['+inttostr(bbuf[11])+']';
      b2 := bbuf[11];
      fl := (b2 and 1) <> 1;
      FIN1CheckBox.Checked := fl;
      FIN1CheckBox.Enabled := fl;

      fl := (b2 and 2) <> 2;
      FIN2CheckBox.Checked := fl;
      FIN2CheckBox.Enabled := fl;

      fl := (b2 and 4) <> 4;
      Spd1CheckBox.Checked := fl;
      Spd1CheckBox.Enabled := fl;

      fl := (b2 and 8) <> 8;
      Spd2CheckBox.Checked := fl;
      Spd2CheckBox.Enabled := fl;

      ok := true;
    end else
    begin
      FinishStatusEdit.Text := 'Неправильный ответ';
    end;
  end else FinishStatusEdit.Text := '[nolink ?]';
  if not ok then
  begin
    FIN1CheckBox.Checked := false;
    FIN1CheckBox.Enabled := false;
    FIN2CheckBox.Checked := false;
    FIN2CheckBox.Enabled := false;
    Spd1CheckBox.Checked := false;
    Spd1CheckBox.Enabled := false;
    Spd2CheckBox.Checked := false;
    Spd2CheckBox.Enabled := false;
  end;
end;

end.
