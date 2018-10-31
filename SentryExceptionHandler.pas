unit SentryExceptionHandler;

interface

uses
  System.SysUtils,

  FMX.Dialogs,

  uRavenClient;

type
  TSentryExceptionHandler = class
  private
    FRaven: TRavenClient;
  public
    constructor Create;
    procedure OnException(ASender: TObject; AE: Exception);
    destructor Destroy; override;
  end;

implementation

{ TSentryExceptionHandler }

constructor TSentryExceptionHandler.Create;
begin
  FRaven := TRavenClient.Create;
end;

destructor TSentryExceptionHandler.Destroy;
begin
  FreeAndNil(FRaven);
  inherited;
end;

procedure TSentryExceptionHandler.OnException(ASender: TObject; AE: Exception);
begin
  FRaven.sendException(AE);
end;

end.
