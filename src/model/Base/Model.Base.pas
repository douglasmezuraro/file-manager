unit Model.Base;

interface

uses
  Helper.Rtti.Util,
  System.SysUtils,
  Types.IniObject;

type
  TModel = class abstract(TIniObject)
  public
    constructor Create(const FileName: TFileName); override;
    destructor Destroy; override;
  end;

implementation

constructor TModel.Create;
begin
  inherited Create(FileName);
  TRttiUtil.CreateProperties(Self);
end;

destructor TModel.Destroy;
begin
  TRttiUtil.DestroyProperties(Self);
  inherited Destroy;
end;

end.
