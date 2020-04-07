unit Model.Config.Scanner;

interface

uses
  Attribute.Component.CheckBox,
  Attribute.Component.Edit,
  Attribute.Ini.Key;

type
  TScanner = class sealed
  private
    FDetectFeederPaper: Boolean;
    FDuplex: Boolean;
    FResolution: Integer;
    FBlackAndWhiteProcessing: Boolean;
    FAcquireFrame: Boolean;
    FRegisterLogDigitalFolder: Boolean;
    FBlackAndWhiteThreshold: Integer;
    FPageSize: Integer;
    FColorResolution: Integer;
    FWaitTimeMS: Integer;
    FWaitTime: Integer;
    FDocumentPerfil: Integer;
    FScannerModel: Integer;
  public
    [CheckBox('Gravar log da pasta digital?')]
    [Key('GRAVARLOGPASTADIGITAL')]
    property RegisterLogDigitalFolder: Boolean read FRegisterLogDigitalFolder write FRegisterLogDigitalFolder;

    [Edit('Tempo de espera (Ms)')]
    [Key('TEMPOESPERAEMMILISEGUNDOS')]
    property WaitTimeMS: Integer read FWaitTimeMS write FWaitTimeMS;

    [Edit('Tempo de espera')]
    [Key('TEMPOESPERA')]
    property WaitTime: Integer read FWaitTime write FWaitTime;

    [CheckBox('Duplex')]
    [Key('DUPLEX')]
    property Duplex: Boolean read FDuplex write FDuplex;

    [CheckBox('AcquireFrame')]
    [Key('ACQUIREFRAME')]
    property AcquireFrame: Boolean read FAcquireFrame write FAcquireFrame;

    [CheckBox('Detectar papel alimentador?')]
    [Key('DETECTARPAPELALIMENTADOR')]
    property DetectFeederPaper: Boolean read FDetectFeederPaper write FDetectFeederPaper;

    [Edit('Tamanho da página')]
    [Key('TAMPAGINA')]
    property PageSize: Integer read FPageSize write FPageSize;

    [Edit('Resolução')]
    [Key('RESOLUCAO')]
    property Resolution: Integer read FResolution write FResolution;

    [Edit('Resolução (cores)')]
    [Key('RESOLUCAOCORES')]
    property ColorResolution: Integer read FColorResolution write FColorResolution;

    [Edit('Modelo')]
    [Key('MODELOSCANNER')]
    property ScannerModel: Integer read FScannerModel write FScannerModel;

    [Edit('Perfil documento')]
    [Key('PERFILDOC')]
    property DocumentPerfil: Integer read FDocumentPerfil write FDocumentPerfil;

    [Edit('Limiar preto e branco')]
    [Key('LIMIARPRETOEBRANCO')]
    property BlackAndWhiteThreshold: Integer read FBlackAndWhiteThreshold write FBlackAndWhiteThreshold;

    [CheckBox('Processa preto e branco?')]
    [Key('PROCESSAPRETOEBRANCO')]
    property BlackAndWhiteProcessing: Boolean read FBlackAndWhiteProcessing write FBlackAndWhiteProcessing;
  end;

implementation

end.

