unit AddDriver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, INIFiles, ComCtrls, DB, ADODB;

type
  TAddForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;

    AddBtn: TButton;

    FIOEdit: TEdit;
    NickEdit: TEdit;
    FirmBox: TComboBox;
    ModelBox: TComboBox;
    VolumeBox: TComboBox;
    TransBox: TComboBox;
    TurbinCBox: TCheckBox;
    SChargeCBox: TCheckBox;
    ResinBox: TComboBox;
    GasBox: TComboBox;
    GosNumEdit: TEdit;
    DriversView: TListView;
    CommentsMemo: TMemo;
    ClassEdit: TEdit;
    RotorCBox: TCheckBox;
    racingcon: TADOConnection;
    dataset: TADODataSet;
    StatusBar: TStatusBar;

    procedure FormCreate(Sender: TObject);
    procedure FirmBoxSelect(Sender: TObject);
    procedure VolumeBoxSelect(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure VolumeBoxChange(Sender: TObject);
    procedure FirmBoxChange(Sender: TObject);
    procedure TurbinCBoxKeyPress(Sender: TObject; var Key: Char);
    procedure TurbinCBoxClick(Sender: TObject);
    procedure SChargeCBoxClick(Sender: TObject);
    procedure SChargeCBoxKeyPress(Sender: TObject; var Key: Char);
    procedure RotorCBoxKeyPress(Sender: TObject; var Key: Char);
    procedure RotorCBoxClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure SelVolume;
    procedure ClearInput;
  public
    { Public declarations }
  end;

const dragsec = 'dragracing';
const Max_Cars = 32;
var Cars : array[1..Max_Cars] of
      record
        Firm : string;
        Models : TStringList;
      end;

var AddForm: TAddForm;
    ini : TINIFile;
    NumFirms : integer = 0;
    NumClass1 : integer = 0;
//    NumClass2 : integer = 0;
//    NumClass3 : integer = 0;


implementation uses Main;

{$R *.dfm}

procedure TAddForm.FormCreate(Sender: TObject);
var i,j,n : integer;
    cmd,s : string;
begin
  ini := TINIFile.Create(BasePath+'racing.ini');

  racingcon.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+BasePath+'data\racing.mdb;Persist Security Info=False';
  racingcon.Connected := true;
  NumFirms := ini.ReadInteger(dragsec,'numfirms',0);
  for i := 1 to NumFirms do
  begin
    s := 'firm'+LZ(i,2,'0');
    cars[i].Firm := ini.ReadString(s,s,'');
    FirmBox.Items.Add(cars[i].Firm);
    cars[i].Models := TStringList.Create;
    n := ini.ReadInteger(s,'numcars',0);
    for j := 1 to n do
    begin
      cars[i].Models.Add(trim(ini.ReadString(s,'c'+LZ(j,3,'0'),'')));
    end;
  end;
  ini.Free;

  cmd := 'SELECT * FROM Drivers';
  dataset.CommandType := cmdText;
  dataset.CommandText := cmd;
  dataset.Connection := RacingCon;
  dataset.Open;

  NumDrivers := dataset.RecordCount;
  for i := 1 to NumDrivers do with Drivers[i] do
  begin
    FIO := dataset.FieldByName('FIO').AsString;
    Nick := dataset.FieldByName('Nick').AsString;
    Car := dataset.FieldByName('Car').AsString;
    s := dataset.FieldByName('Volume').AsString;
    val(s,Volume,j);
    Trans := dataset.FieldByName('Trans').AsString;
    Turbo := lowercase(dataset.FieldByName('Turbo').AsString) = 'yes';
    SCharge := lowercase(dataset.FieldByName('SCharge').AsString) = 'yes';
    RotorDrive := lowercase(dataset.FieldByName('RotorDrive').AsString) = 'yes';
    Resin := dataset.FieldByName('Resin').AsString;
    gas := dataset.FieldByName('Gas').AsString;
    s := dataset.FieldByName('Number').AsString;
    val(s,Number,j);
    s := dataset.FieldByName('Class').AsString;
    val(s,CarClass,j);
//    Date := dataset.FieldByName('Date').AsString;
    Comments := dataset.FieldByName('Comments').AsString;
    gosnum := dataset.FieldByName('GosNum').AsString;
    if NumClass1 < Number then NumClass1 := Number;

    with DriversView.Items.Add do
    begin
      Caption := inttostr(Number);
      for j := 0 to 2 do Subitems.Add('');
      Subitems.Strings[0] := FIO;
      Subitems.Strings[1] := Car;
      Subitems.Strings[2] := inttostr(CarClass);
    end;
    s := LZ(Number,2,'0')+': '+FIO+' (класс '+inttostr(CarClass)+', '+Car+')';
    MainForm.Track1Box.Items.Add(s);
    MainForm.Track2Box.Items.Add(s);
    dataset.Next;
  end;

  dataset.Close;

  ClearInput;
end;

procedure TAddForm.FirmBoxSelect(Sender: TObject);
begin
  if (FirmBox.ItemIndex >= 0)and(FirmBox.ItemIndex < NumFirms) then
  begin
    ModelBox.Items.Assign(cars[FirmBox.ItemIndex+1].Models);
    ModelBox.ItemIndex := 0;
  end;
end;

procedure TAddForm.VolumeBoxSelect(Sender: TObject);
begin
  SelVolume;
end;

procedure TAddForm.SelVolume;
var i,e : integer;
    s : string;
    r : double;
begin
{
1800
1800 сс до 2500
2500 сс
}
  s := trim(VolumeBox.Text);
  i := 1;
  while i <= length(s) do
  begin
    if not (s[i] in['0'..'9']) then delete(s,i,1) else inc(i);
  end;
  val(s,i,e);
  r:=i;
  if TurbinCBox.Checked then r := r*1.6;
  if SChargeCBox.Checked then r := r*1.3;
  if RotorCBox.Checked then r := r*1.9;
  if e = 0 then
  begin
    if (r <  1800) then ClassEdit.Text := '1' else
    if (r >= 1800) and (r < 2500) then ClassEdit.Text := '2' else
    if (r >= 2500) then ClassEdit.Text := '3';
  end else ClassEdit.Text := '';
end;

procedure TAddForm.ClearInput;
begin
  FIOEdit.Text := '';
  NickEdit.Text:='';
  FirmBox.ItemIndex := -1;
  ModelBox.Items.Clear;
  ModelBox.Text := '';
  VolumeBox.ItemIndex:=-1;
  VolumeBox.Text := '';
  TransBox.ItemIndex:=-1;
  ResinBox.ItemIndex:=-1;
  GasBox.ItemIndex:=-1;
  GosNumEdit.Text:='';
  ClassEdit.Text := '';
  CommentsMemo.Lines.Clear;
  TurbinCBox.Checked := false;
  SChargeCBox.Checked:=false;
  RotorCBox.Checked := false;
end;

procedure TAddForm.AddBtnClick(Sender: TObject);
var s,cmd : string;
    i,e : integer;
begin
  val(VolumeBox.Text,i,e);
  if (i<1)or(e<>0)or(FIOEdit.Text = '')or(GasBox.ItemIndex = -1)or(FirmBox.ItemIndex = -1)or(ModelBox.Text = '')
    or(VolumeBox.Text = '')or(ClassEdit.Text = '')or(TransBox.ItemIndex = -1)or(ResinBox.ItemIndex = -1) then
  begin
    MessageDlg('Заполните, пожалуйста, правильно все необходимые поля!',mtError,[mbOK],0);
  end else
  begin
    try
      StatusBar.Panels[0].Text := 'Добавление записи...';
      cmd := 'SELECT * FROM Drivers';
      dataset.CommandType := cmdText;
      dataset.CommandText := cmd;
      dataset.Connection := RacingCon;
      dataset.Open;

      dataset.Append;

(*      num := 0;
      case ClassEdit.Text[1] of
      '1': begin inc(NumClass1); num := NumClass1; end;
      '2': begin inc(NumClass2); num := NumClass2; end;
      '3': begin inc(NumClass3); num := NumClass3; end;
      end;
*)
      inc(NumClass1);
      inc(NumDrivers);

(*
    FIO := dataset.FieldByName('FIO').AsString;
    Nick := dataset.FieldByName('Nick').AsString;
    Car := dataset.FieldByName('Car').AsString;
    s := dataset.FieldByName('Volume').AsString;
    val(s,Volume,j);
    Trans := dataset.FieldByName('Trans').AsString;
    Turbo := lowercase(dataset.FieldByName('Turbo').AsString) = 'yes';
    SCharge := lowercase(dataset.FieldByName('SCharge').AsString) = 'yes';
    RotorDrive := lowercase(dataset.FieldByName('RotorDrive').AsString) = 'yes';
    Resin := dataset.FieldByName('Resin').AsString;
    gas := dataset.FieldByName('Gas').AsString;
    s := dataset.FieldByName('Number').AsString;
    val(s,Number,j);
    s := dataset.FieldByName('Class').AsString;
    val(s,CarClass,j);
    Comments := dataset.FieldByName('Comments').AsString;
    gosnum := dataset.FieldByName('GosNum').AsString;
*)
      s := trim(FIOEdit.Text); FIOEdit.Text := s;
      Drivers[NumDrivers].FIO := s;
      dataset.FieldValues['FIO'] := s;
      s := trim(NickEdit.Text); NickEdit.Text := s;
      Drivers[NumDrivers].Nick := s;
      dataset.FieldValues['Nick'] := s;
      s := trim(FirmBox.Text)+' '+trim(ModelBox.Text);
      Drivers[NumDrivers].Car := s;
      dataset.FieldValues['Car'] := s;
      s := trim(VolumeBox.Text);
      val(s,Drivers[NumDrivers].Volume,e); if e <> 0 then Drivers[NumDrivers].Volume := -1;
      dataset.FieldValues['Volume'] := s;
      s := TransBox.Text;
      Drivers[NumDrivers].Trans := s;
      dataset.FieldValues['Trans'] := s;
      if TurbinCBox.Checked then s := 'yes' else s := 'no';
      Drivers[NumDrivers].Turbo := TurbinCBox.Checked;
      dataset.FieldValues['Turbo'] := s;
      if SChargeCBox.Checked then s := 'yes' else s := 'no';
      Drivers[NumDrivers].SCharge := SChargeCBox.Checked;
      dataset.FieldValues['SCharge'] := s;
      if RotorCBox.Checked then s := 'yes' else s := 'no';
      Drivers[NumDrivers].RotorDrive := RotorCBox.Checked;
      dataset.FieldValues['RotorDrive'] := s;
      s := ResinBox.Text;
      Drivers[NumDrivers].Resin := s;
      dataset.FieldValues['Resin'] := s;
      s := GasBox.Text;
      Drivers[NumDrivers].Gas := s;
      dataset.FieldValues['Gas'] := s;
      dataset.FieldValues['Number'] := inttostr(NumClass1);
      Drivers[NumDrivers].Number := NumClass1;
      s := ClassEdit.Text;
      Drivers[NumDrivers].CarClass := strtoint(s);
      dataset.FieldValues['Class'] := s;
      s := inttostr(round(now));
//
      dataset.FieldValues['Date'] := s;
      s := CommentsMemo.Text;
      Drivers[NumDrivers].Comments := s;
      dataset.FieldValues['Comments'] := s;
      s := GosNumEdit.Text;
      Drivers[NumDrivers].GosNum := s;
      dataset.FieldValues['GosNum'] := s;
      Drivers[NumDrivers].GosNum := s;

      dataset.Post;

      s := dataset.FieldByName('ID').AsString;
      StatusBar.Panels[0].Text := 'O.K. (ID:'+s+')';
      with DriversView.Items.Add do
      begin
        Caption := inttostr(NumClass1);
        for i := 0 to 2 do Subitems.Add('');
        Subitems.Strings[0] := FIOEdit.Text;
        Subitems.Strings[1] := trim(FirmBox.Text)+' '+trim(ModelBox.Text);
        Subitems.Strings[2] := ClassEdit.Text;
      end;
      FIOEdit.SetFocus;
      with Drivers[NumDrivers] do
      begin
        s := LZ(Number,2,'0')+': '+FIO+' (класс '+inttostr(CarClass)+', '+Car+')';
        MainForm.Track1Box.Items.Add(s);
        MainForm.Track2Box.Items.Add(s);
      end;

     finally
      dataset.Close;
    end;

    ClearInput;
  end;
end;

procedure TAddForm.VolumeBoxChange(Sender: TObject);
begin
  SelVolume;
end;

procedure TAddForm.FirmBoxChange(Sender: TObject);
begin
  FirmBoxSelect(Sender);
end;

procedure TAddForm.TurbinCBoxKeyPress(Sender: TObject; var Key: Char);
begin
  SelVolume;
end;

procedure TAddForm.TurbinCBoxClick(Sender: TObject);
begin
  SelVolume;
end;

procedure TAddForm.SChargeCBoxClick(Sender: TObject);
begin
  SelVolume;
end;

procedure TAddForm.SChargeCBoxKeyPress(Sender: TObject; var Key: Char);
begin
  SelVolume;
end;

procedure TAddForm.RotorCBoxKeyPress(Sender: TObject; var Key: Char);
begin
  SelVolume;
end;

procedure TAddForm.RotorCBoxClick(Sender: TObject);
begin
  SelVolume;
end;

procedure TAddForm.FormDestroy(Sender: TObject);
var i : integer;
begin
  for i := 1 to NumFirms do
  begin
    cars[i].Firm := '';
    cars[i].Models.Free;
    cars[i].Models := nil;
  end;
  NumFirms := 0;
end;

end.
