program dr;

uses
  Forms,
  main in 'main.pas' {MainForm},
  AddDriver in 'AddDriver.pas' {AddForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Драг-рейсинг';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddForm, AddForm);
  Application.Run;
end.
