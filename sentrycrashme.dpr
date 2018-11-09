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
  DSN = 'https://56b96e74b3614c93a47efc99c91a076c@sentry.io/1312912';

begin
  LHandler := TSentryExceptionHandler.Create
    ( { Your DSN goes here, mine is deactivated } DSN);

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.OnException := LHandler.OnException;
  Application.Run;

end.
