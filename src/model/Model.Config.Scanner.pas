unit Model.Config.Scanner;

interface

uses
  Attribute.Ini;

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
    [TEditAttribute('Gravar log da pasta digital?')]
    [TIdent('GRAVARLOGPASTADIGITAL')]
    property RegisterLogDigitalFolder: UInt8 read FRegisterLogDigitalFolder write FRegisterLogDigitalFolder;

    [TEditAttribute('Tempo de espera (Ms)')]
    [TIdent('TEMPOESPERAEMMILISEGUNDOS')]
    property WaitTimeMS: UInt32 read FWaitTimeMS write FWaitTimeMS;

    [TEditAttribute('Tempo de espera')]
    [TIdent('TEMPOESPERA')]
    property WaitTime: Uint32 read FWaitTime write FWaitTime;

    [TCheckBoxAttribute('Duplex')]
    [TIdent('DUPLEX')]
    property Duplex: Boolean read FDuplex write FDuplex;

    [TCheckBoxAttribute('AcquireFrame')]
    [TIdent('ACQUIREFRAME')]
    property AcquireFrame: Boolean read FAcquireFrame write FAcquireFrame;

    [TCheckBoxAttribute('Detectar papel alimentador?')]
    [TIdent('DETECTARPAPELALIMENTADOR')]
    property DetectFeederPaper: Boolean read FDetectFeederPaper write FDetectFeederPaper;

    [TEditAttribute('Tamanho da p�gina')]
    [TIdent('TAMPAGINA')]
    property PageSize: Uint32 read FPageSize write FPageSize;

    [TEditAttribute('Resolu��o')]
    [TIdent('RESOLUCAO')]
    property Resolution: UInt32 read FResolution write FResolution;

    [TEditAttribute('Resolu��o (cores)')]
    [TIdent('RESOLUCAOCORES')]
    property ColorResolution: UInt32 read FColorResolution write FColorResolution;

    [TEditAttribute('Modelo')]
    [TIdent('MODELOSCANNER')]
    property ScannerModel: UInt32 read FScannerModel write FScannerModel;

    [TEditAttribute('Perfil documento')]
    [TIdent('PERFILDOC')]
    property DocumentPerfil: UInt32 read FDocumentPerfil write FDocumentPerfil;

    [TEditAttribute('Limiar preto e branco')]
    [TIdent('LIMIARPRETOEBRANCO')]
    property BlackAndWhiteThreshold: UInt32 read FBlackAndWhiteThreshold write FBlackAndWhiteThreshold;

    [TCheckBoxAttribute('Processa preto e branco?')]
    [TIdent('PROCESSAPRETOEBRANCO')]
    property BlackAndWhiteProcessing: Boolean read FBlackAndWhiteProcessing write FBlackAndWhiteProcessing;
  end;

implementation

end.

