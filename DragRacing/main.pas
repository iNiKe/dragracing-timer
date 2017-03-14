unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ComCtrls;

const appVer = '1.0b';

type
  TMainForm = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    adsImage: TImage;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Track1Box: TComboBox;
    Track2Box: TComboBox;
    status: TStatusBar;
    CompEdit: TRichEdit;
    Label1: TLabel;
    ReadyBtn: TButton;
    Light: TPaintBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label8: TLabel;
    Edit7: TEdit;
    Label9: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LightPaint(Sender: TObject);
    procedure ReadyBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure RecieveInfo;
  public
    { Public declarations }
  end;

const Max_Drivers = 1024;

type tDriver = record
       FIO : string; // ФИО
       Nick : string; // Ник-нейм
       Car : string; // Машина
       Volume : integer; // Объем
       Trans : string; // Трансмиссия
       Turbo : boolean; // Турбина?
       SCharge : boolean; // Супер чарджер?
       RotorDrive : boolean; // Роторный движок?
       Resin : string; // Резина/Шины
       Gas : string; // Топливо
       Number : integer; // Порядковый номер
       CarClass : integer; // Класс машины
       Comments : string; // Доп. инфо
       GosNum : string; // Гос. номер
    end;

const ltGreen = 0;
      ltRed   = 1;
      ltRed2  = 2;

var
  MainForm : TMainForm;
  BasePath : string;
  RecievedBytes : integer;
  NumDrivers : integer;
  Drivers : array[1..Max_Drivers] of tDriver;
  StartLight : integer = ltRed;
  Ready : boolean = false;
  StartTime : integer;
  Ticks : integer;

function LZ(i,n : integer; ch : char) : string;

implementation

uses AddDriver;

{$R *.dfm}

function LZ(i,n : integer; ch : char) : string;
begin
  Result := inttostr(i);
  while length(Result) < n do Result := ch+Result;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  RecievedBytes := 0;
  Caption := 'Драг-рейсинг в Штыково v'+appVer+' © C.J. NiKe';
  BasePath := trim(extractfilepath(application.exename));
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.N5Click(Sender: TObject);
begin
  AddForm.ShowModal;
end;

procedure TMainForm.RecieveInfo;
begin
  if Random(16) = 1 then inc(RecievedBytes,4);
  if Ready then
  begin
    if Ticks > 50 then
    begin
      if StartLight <> ltGreen then
      begin
        StartLight := ltGreen;
        Light.OnPaint(Self);
      end else
      if (Ticks > 100)and(Ticks < 200) then
      begin
        if Edit1.Text = '' then if random(3) = 1 then Edit1.Text := inttostr(1+random(5))+'.'+inttostr(random(99));
        if Edit4.Text = '' then if random(3) = 2 then Edit4.Text := inttostr(1+random(5))+'.'+inttostr(random(99));
      end else
      if (Ticks > 200)and(Ticks < 250) then
      begin
        if Edit2.Text = '' then if random(3) = 1 then Edit2.Text := inttostr(10+random(6))+'.'+inttostr(random(99));
        if Edit5.Text = '' then if random(3) = 2 then Edit5.Text := inttostr(10+random(6))+'.'+inttostr(random(99));
      end else
      if Ticks > 250 then
      begin
        if Edit3.Text = '' then if random(3) = 1 then Edit3.Text := inttostr(15+random(8))+'.'+inttostr(random(99));
        if Edit6.Text = '' then if random(3) = 2 then Edit6.Text := inttostr(15+random(8))+'.'+inttostr(random(99));
        if (Edit3.Text <> '')and(Edit6.Text <> '') then
        begin
          StartLight := ltRed;
          Ready := false;
          Ticks := 0;
          Edit7.Text := inttostr(150+random(80));
          Edit9.Text := inttostr(150+random(80));
          Edit8.Text := edit3.Text;
          Edit10.Text := edit6.Text;
        end;
      end;
    end;
  end;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  inc(Ticks);
  RecieveInfo;
  status.Panels[2].Text := 'Получено '+inttostr(RecievedBytes)+' байт';
end;

procedure TMainForm.LightPaint(Sender: TObject);
begin
  case StartLight of
  ltRed   : Canvas.Brush.Color := clRed;
  ltRed2  : Canvas.Brush.Color := clYellow;
  ltGreen : Canvas.Brush.Color := clLime;
  end;
  Canvas.Ellipse(Light.Left+2,Light.Top+2,Light.Left+39+2,Light.Top+39+2);
end;

procedure TMainForm.ReadyBtnClick(Sender: TObject);
begin
  Ready := true;
  Ticks := 0;
  StartLight := ltRed2;
  Light.OnPaint(Self);
//  ReadyBtn.Enabled := false;
end;

end.
