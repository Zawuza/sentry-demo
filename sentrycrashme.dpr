program sentrycrashme;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {Form1},
  uHMAC in 'dependencies\uHMAC.pas',
  uRavenClient in 'dependencies\uRavenClient.pas',
  uRavenConnection in 'dependencies\uRavenConnection.pas',
  uEvent in 'dependencies\uEvent.pas',
  SentryExceptionHandler in 'SentryExceptionHandler.pas';

{$R *.res}

var
  LHandler: TSentryExceptionHandler;

begin
  LHandler := TSentryExceptionHandler.Create;

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.OnException := LHandler.OnException;
  Application.Run;
end.
