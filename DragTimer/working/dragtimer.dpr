program dragtimer;

uses
  Forms,
  main in 'main.pas' {DragTimerForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDragTimerForm, DragTimerForm);
  Application.Run;
end.
