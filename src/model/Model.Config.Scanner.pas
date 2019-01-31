unit Model.Config.Scanner;

interface

uses
  Attribute.Control,
  Attribute.Ident;

type
  TScanner = class
  private
    FDetectFeederPaper: Boolean;
    FDuplex: Boolean;
    FResolution: UInt32;
    FBlackAndWhiteProcessing: Boolean;
    FAcquireFrame: Boolean;
    FRegisterLogDigitalFolder: UInt8;
    FBlackAndWhiteThreshold: UInt32;
    FPageSize: Uint32;
    FColorResolution: UInt32;
    FWaitTimeMS: UInt32;
    FWaitTime: Uint32;
    FDocumentPerfil: UInt32;
    FScannerModel: UInt32;
  public
    [TControl('Gravar log da pasta digital?')]
    [TIdent('GRAVARLOGPASTADIGITAL')]
    property RegisterLogDigitalFolder: UInt8 read FRegisterLogDigitalFolder write FRegisterLogDigitalFolder;

    [TControl('Tempo de espera (Ms)')]
    [TIdent('TEMPOESPERAEMMILISEGUNDOS')]
    property WaitTimeMS: UInt32 read FWaitTimeMS write FWaitTimeMS;

    [TControl('Tempo de espera')]
    [TIdent('TEMPOESPERA')]
    property WaitTime: Uint32 read FWaitTime write FWaitTime;

    [TControl('Duplex')]
    [TIdent('DUPLEX')]
    property Duplex: Boolean read FDuplex write FDuplex;

    [TControl('AcquireFrame')]
    [TIdent('ACQUIREFRAME')]
    property AcquireFrame: Boolean read FAcquireFrame write FAcquireFrame;

    [TControl('Detectar papel alimentador?')]
    [TIdent('DETECTARPAPELALIMENTADOR')]
    property DetectFeederPaper: Boolean read FDetectFeederPaper write FDetectFeederPaper;

    [TControl('Tamanho da página')]
    [TIdent('TAMPAGINA')]
    property PageSize: Uint32 read FPageSize write FPageSize;

    [TControl('Resolução')]
    [TIdent('RESOLUCAO')]
    property Resolution: UInt32 read FResolution write FResolution;

    [TControl('Resolução (cores)')]
    [TIdent('RESOLUCAOCORES')]
    property ColorResolution: UInt32 read FColorResolution write FColorResolution;

    [TControl('Modelo')]
    [TIdent('MODELOSCANNER')]
    property ScannerModel: UInt32 read FScannerModel write FScannerModel;

    [TControl('Perfil documento')]
    [TIdent('PERFILDOC')]
    property DocumentPerfil: UInt32 read FDocumentPerfil write FDocumentPerfil;

    [TControl('Limiar preto e branco')]
    [TIdent('LIMIARPRETOEBRANCO')]
    property BlackAndWhiteThreshold: UInt32 read FBlackAndWhiteThreshold write FBlackAndWhiteThreshold;

    [TControl('Processa preto e branco?')]
    [TIdent('PROCESSAPRETOEBRANCO')]
    property BlackAndWhiteProcessing: Boolean read FBlackAndWhiteProcessing write FBlackAndWhiteProcessing;
  end;

implementation

end.

