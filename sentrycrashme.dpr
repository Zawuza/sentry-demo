program sentrycrashme;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {Form1} ,
  SentryExceptionHandler in 'SentryExceptionHandler.pas';

{$R *.res}

var
  LHandler: TSentryExceptionHandler;

const
  DSN = 'Your DSN';

begin
  LHandler := TSentryExceptionHandler.Create
    (DSN);

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.OnException := LHandler.OnException;
  Application.Run;

end.
