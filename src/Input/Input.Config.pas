unit Input.Config;

interface

uses
  Input.Item, System.Classes, System.IOUtils;

type
  /// <summary>
  ///  Config file class.
  /// </summary>
  TInput = class sealed(TPersistent)
  private
    FItems: TArray<TItem>;
    FLanguage: string;
    FHelpURL: string;
  public
    /// <summary>
    ///  Destructor of class
    /// </summary>
    destructor Destroy; override;

    /// <summary>
    ///  Returns the path of input file
    /// </summary>
    /// <returns>
    ///  string of complete input file path
    /// </returns>
    class function Path: string; inline;

    /// <summary>
    ///  Defines the files
    /// </summary>
    property Items: TArray<TItem> read FItems write FItems;

    /// <summary>
    ///  Defines the language of application
    /// </summary>
    /// <remarks>
    ///  If it is undefined uses the default language witch is PT-BR
    /// </remarks>
    property Language: string read FLanguage;

    /// <summary>
    ///  Defines the URL of help page
    /// </summary>
    property HelpURL: string read FHelpURL write FHelpURL;
  end;

implementation

destructor TInput.Destroy;
var
  Item: TItem;
begin
  for Item in Items do
    Item.Free;

  inherited Destroy;
end;

class function TInput.Path: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), 'input.json');
end;

end.

