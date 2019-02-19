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
    [Edit('Gravar log da pasta digital?')]
    [Ident('GRAVARLOGPASTADIGITAL')]
    property RegisterLogDigitalFolder: UInt8 read FRegisterLogDigitalFolder write FRegisterLogDigitalFolder;

    [Edit('Tempo de espera (Ms)')]
    [Ident('TEMPOESPERAEMMILISEGUNDOS')]
    property WaitTimeMS: UInt32 read FWaitTimeMS write FWaitTimeMS;

    [Edit('Tempo de espera')]
    [Ident('TEMPOESPERA')]
    property WaitTime: Uint32 read FWaitTime write FWaitTime;

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
    property PageSize: Uint32 read FPageSize write FPageSize;

    [Edit('Resolução')]
    [Ident('RESOLUCAO')]
    property Resolution: UInt32 read FResolution write FResolution;

    [Edit('Resolução (cores)')]
    [Ident('RESOLUCAOCORES')]
    property ColorResolution: UInt32 read FColorResolution write FColorResolution;

    [Edit('Modelo')]
    [Ident('MODELOSCANNER')]
    property ScannerModel: UInt32 read FScannerModel write FScannerModel;

    [Edit('Perfil documento')]
    [Ident('PERFILDOC')]
    property DocumentPerfil: UInt32 read FDocumentPerfil write FDocumentPerfil;

    [Edit('Limiar preto e branco')]
    [Ident('LIMIARPRETOEBRANCO')]
    property BlackAndWhiteThreshold: UInt32 read FBlackAndWhiteThreshold write FBlackAndWhiteThreshold;

    [CheckBox('Processa preto e branco?')]
    [Ident('PROCESSAPRETOEBRANCO')]
    property BlackAndWhiteProcessing: Boolean read FBlackAndWhiteProcessing write FBlackAndWhiteProcessing;
  end;

implementation

end.

