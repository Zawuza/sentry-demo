unit SentryExceptionHandler;

interface

uses
  System.SysUtils,

  FMX.Dialogs;

type
  TSentryExceptionHandler = class
  private
  public
    constructor Create(ADSN: string);
    procedure OnException(ASender: TObject; AE: Exception);
    destructor Destroy; override;
  end;

implementation

{ TSentryExceptionHandler }

constructor TSentryExceptionHandler.Create(ADSN: string);
begin

end;

destructor TSentryExceptionHandler.Destroy;
begin

end;

procedure TSentryExceptionHandler.OnException(ASender: TObject; AE: Exception);
begin
(*
https://docs.sentry.io/development/sdk-dev/interfaces/exception/
{
  "event_id": "fc6d6c0c43fc4630a7850ee518f1b9d0",
  "culprit": "my.module.function_name",
  "timestamp": "2011-05-02T17:41:36",
  "message": "SyntaxError",
  "exception": {
    "values": [
      {
        "type": "SyntaxError",
        "value": "LOL!"
      }
    ]
  }
}
Address:
https://sentry.io/api/1312912/store/
  ?sentry_key=56b96e74b3614c93a47efc99c91a076c&sentry_version=7
*)
end;

end.
