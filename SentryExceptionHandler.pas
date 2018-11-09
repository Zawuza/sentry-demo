unit SentryExceptionHandler;

interface

uses
  System.SysUtils,

  FMX.Dialogs;

type
  TSentryExceptionHandler = class
  private
  public
    constructor Create;
    procedure OnException(ASender: TObject; AE: Exception);
    destructor Destroy; override;
  end;

const
  DSN = 'https://56b96e74b3614c93a47efc99c91a076c@sentry.io/1312912';

implementation

{ TSentryExceptionHandler }

constructor TSentryExceptionHandler.Create;
begin

end;

destructor TSentryExceptionHandler.Destroy;
begin

end;

procedure TSentryExceptionHandler.OnException(ASender: TObject; AE: Exception);
begin

end;

end.
