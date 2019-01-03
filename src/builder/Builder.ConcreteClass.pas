unit Builder.ConcreteClass;

interface

uses
  Builder.API;

type
  TBuilder = class(TInterfacedObject, IBuilder)
  public
    function BuildAlternativeBalancer: IBuilder;
    function BuildApplication: IBuilder;
    function BuildBalancer: IBuilder;
    function BuildClient: IBuilder;
    function BuildDatabase: IBuilder;
    function BuildDUnit: IBuilder;
    function BuildLog: IBuilder;
    function BuildMonitor: IBuilder;
    function BuildScanner: IBuilder;
    function BuildServer: IBuilder;
    function BuildSPP: IBuilder;
    function BuildUpdate: IBuilder;
    function BuildWorkflow: IBuilder;
  end;

implementation

{ TBuilder }

function TBuilder.BuildAlternativeBalancer: IBuilder;
begin
  Result := Self;
end;

function TBuilder.BuildApplication: IBuilder;
begin
  Result := Self;
end;

function TBuilder.BuildBalancer: IBuilder;
begin
  Result := Self;
end;

function TBuilder.BuildClient: IBuilder;
begin
  Result := Self;
end;

function TBuilder.BuildDatabase: IBuilder;
begin
  Result := Self;
end;

function TBuilder.BuildDUnit: IBuilder;
begin
  Result := Self;
end;

function TBuilder.BuildLog: IBuilder;
begin
  Result := Self;
end;

function TBuilder.BuildMonitor: IBuilder;
begin
  Result := Self;
end;

function TBuilder.BuildScanner: IBuilder;
begin
  Result := Self;
end;

function TBuilder.BuildServer: IBuilder;
begin
  Result := Self;
end;

function TBuilder.BuildSPP: IBuilder;
begin
  Result := Self;
end;

function TBuilder.BuildUpdate: IBuilder;
begin
  Result := Self;
end;

function TBuilder.BuildWorkflow: IBuilder;
begin
  Result := Self;
end;

end.
