unit SentryExceptionHandler;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RegularExpressions,
  System.Net.HTTPClient,
  System.JSON,

  FMX.Dialogs;

type
  TSentryExceptionHandler = class
  private
    FProtocol: string;
    FPublicKey: string;
    FHost: string;
    FProjId: string;
  public
    constructor Create(ADSN: string);
    procedure OnException(ASender: TObject; AE: Exception);
    destructor Destroy; override;
  end;

implementation

{ TSentryExceptionHandler }

constructor TSentryExceptionHandler.Create(ADSN: string);
var
  LMatch: TMatch;
begin
  LMatch := TRegEx.Match(ADSN, '(.*):\/\/(.*)@(.*)\/(.*)');
  if LMatch.Success then
  begin
    FProtocol := LMatch.Groups[1].Value;
    FPublicKey := LMatch.Groups[2].Value;
    FHost := LMatch.Groups[3].Value;
    FProjId := LMatch.Groups[4].Value;
  end;
end;

destructor TSentryExceptionHandler.Destroy;
begin

end;

procedure TSentryExceptionHandler.OnException(ASender: TObject; AE: Exception);
var
  HTTPClient: THTTPClient;
  LUrl: string;
  LContent: string;
  JSON: TJSONObject;
  JSONException: TJSONObject;
begin
  JSONException := TJSONObject.Create;
  JSONException.AddPair('type', AE.ClassName);
  JSONException.AddPair('value', AE.Message);

  JSON := TJSONObject.Create;
  JSON.AddPair('exception', TJSONObject.Create);
  TJSONObject(JSON.Values['exception']).AddPair('values', TJSONArray.Create);
  TJSONArray(TJSONObject(JSON.Values['exception']).Values['values'])
    .AddElement(JSONException);

  if UpperCase(FProtocol) = 'HTTPS' then
  begin
    HTTPClient := THTTPClient.Create;
    try
      LUrl := FProtocol + '://' + FHost + '/api/' + FProjId +
        '/store/?sentry_key=' + FPublicKey + '&sentry_version=7';
      HTTPClient.Post(LUrl, TStringStream.Create(JSON.ToString));
    finally
      FreeAndNil(HTTPClient);
    end;
  end;
end;

end.
