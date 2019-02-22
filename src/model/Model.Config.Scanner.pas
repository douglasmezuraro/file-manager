unit Model.Config.Scanner;

interface

uses
  Attribute.Control,
  Attribute.Ini;

type
  TScanner = class
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
    [Ident('GRAVARLOGPASTADIGITAL')]
    property RegisterLogDigitalFolder: Boolean read FRegisterLogDigitalFolder write FRegisterLogDigitalFolder;

    [Edit('Tempo de espera (Ms)')]
    [Ident('TEMPOESPERAEMMILISEGUNDOS')]
    property WaitTimeMS: Integer read FWaitTimeMS write FWaitTimeMS;

    [Edit('Tempo de espera')]
    [Ident('TEMPOESPERA')]
    property WaitTime: Integer read FWaitTime write FWaitTime;

    [CheckBox('Duplex')]
    [Ident('DUPLEX')]
    property Duplex: Boolean read FDuplex write FDuplex;

    [CheckBox('AcquireFrame')]
    [Ident('ACQUIREFRAME')]
    property AcquireFrame: Boolean read FAcquireFrame write FAcquireFrame;

    [CheckBox('Detectar papel alimentador?')]
    [Ident('DETECTARPAPELALIMENTADOR')]
    property DetectFeederPaper: Boolean read FDetectFeederPaper write FDetectFeederPaper;

    [Edit('Tamanho da página')]
    [Ident('TAMPAGINA')]
    property PageSize: Integer read FPageSize write FPageSize;

    [Edit('Resolução')]
    [Ident('RESOLUCAO')]
    property Resolution: Integer read FResolution write FResolution;

    [Edit('Resolução (cores)')]
    [Ident('RESOLUCAOCORES')]
    property ColorResolution: Integer read FColorResolution write FColorResolution;

    [Edit('Modelo')]
    [Ident('MODELOSCANNER')]
    property ScannerModel: Integer read FScannerModel write FScannerModel;

    [Edit('Perfil documento')]
    [Ident('PERFILDOC')]
    property DocumentPerfil: Integer read FDocumentPerfil write FDocumentPerfil;

    [Edit('Limiar preto e branco')]
    [Ident('LIMIARPRETOEBRANCO')]
    property BlackAndWhiteThreshold: Integer read FBlackAndWhiteThreshold write FBlackAndWhiteThreshold;

    [CheckBox('Processa preto e branco?')]
    [Ident('PROCESSAPRETOEBRANCO')]
    property BlackAndWhiteProcessing: Boolean read FBlackAndWhiteProcessing write FBlackAndWhiteProcessing;
  end;

implementation

end.

