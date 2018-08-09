unit CWVisaLib_TLB;

// ************************************************************************ //
// AVERTISSEMENT
// -------
// Les types déclarés dans ce fichier ont été générés à partir de données lues
// depuis la bibliothèque de types. Si cette dernière (via une autre bibliothèque de types
// s'y référant) est explicitement ou indirectement ré-importée, ou la commande "Actualiser"
// de l'éditeur de bibliothèque de types est activée lors de la modification de la bibliothèque
// de types, le contenu de ce fichier sera régénéré et toutes les modifications
// manuellement apportées seront perdues.
// ************************************************************************ //

// $Rev: 52393 $
// Fichier généré le 09/04/2013 15:10:00 depuis la bibliothèque de types ci-dessous.

// ************************************************************************  //
// Biblio. types : C:\Windows\system32\CWVisa.ocx (1)
// LIBID : {1B72B24B-C3E3-11D0-80C5-00A02454310A}
// LCID : 0
// Fichier d'aide : C:\Windows\system32\cwvisa.chm
// Chaîne d'aide : National Instruments CW VISA 6.0
// DepndLst : 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Remarque : le symbole 'Type' a été renommé en 'type_'
//   Remarque : paramètre 'Type' dans _DCWVisa.GetVisaAttribute changé en 'Type_'
//   Remarque : paramètre 'Type' dans _DCWVisa.SetVisaAttribute changé en 'Type_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // L'unité doit être compilée sans pointeur à type contrôlé.  
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleCtrls, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS déclarés dans la bibliothèque de types. Préfixes utilisés:        
//   Bibliothèques de types : LIBID_xxxx                                      
//   CoClasses              : CLASS_xxxx                                      
//   Interfaces DISP        : DIID_xxxx                                       
//   Interfaces Non-DISP    : IID_xxxx                                        
// *********************************************************************//
const
  // Versions mineure et majeure de la bibliothèque de types
  CWVisaLibMajorVersion = 1;
  CWVisaLibMinorVersion = 4;

  LIBID_CWVisaLib: TGUID = '{1B72B24B-C3E3-11D0-80C5-00A02454310A}';

  DIID_CWRdWrt: TGUID = '{47F88180-E5C9-11D0-81F1-444553540000}';
  DIID_CWAsrl: TGUID = '{A6A78B00-230D-11D1-81F1-444553540000}';
  DIID_CWTcpip: TGUID = '{1D660537-AD55-42A3-9B81-A7C37C7A0EED}';
  DIID_CWPxi: TGUID = '{62F3C11D-4483-4D16-B185-11EBE8D0D71B}';
  DIID_CWPxiBAR: TGUID = '{B3F0BED5-5DB6-444C-862F-7629D41556F6}';
  DIID_CWVxi: TGUID = '{F0926D60-2FB1-11D1-81F1-444553540000}';
  DIID_CWVisaGPIB: TGUID = '{F0926D61-2FB1-11D1-81F1-444553540000}';
  DIID_CWVxiMemory: TGUID = '{8A724840-44E5-11D1-81F1-444553540000}';
  DIID_CWVisaEvent: TGUID = '{FE41D902-878E-11D1-B32C-006097B77FF4}';
  DIID_CWTasks: TGUID = '{58F5B8C0-EF2E-11D0-ABDA-00A02411EBE6}';
  DIID_CWTask: TGUID = '{8FC4CA40-F158-11D0-ABDA-00A02411EBE6}';
  DIID_CWPatterns: TGUID = '{E2B89D70-F198-11D0-ABDB-00A02411EBE6}';
  DIID_CWPattern: TGUID = '{E2B89D71-F198-11D0-ABDB-00A02411EBE6}';
  DIID_CWTokens: TGUID = '{175551C1-F24A-11D0-ABDB-00A02411EBE6}';
  DIID_CWToken: TGUID = '{175551C0-F24A-11D0-ABDB-00A02411EBE6}';
  DIID__DCWVisa: TGUID = '{1B72B24C-C3E3-11D0-80C5-00A02454310A}';
  DIID__DCWVisaEvents: TGUID = '{1B72B24D-C3E3-11D0-80C5-00A02454310A}';
  CLASS_CWVisa: TGUID = '{1B72B24E-C3E3-11D0-80C5-00A02454310A}';

// *********************************************************************//
// Déclaration d'énumérations définies dans la bibliothèque de types                    
// *********************************************************************//
// Constantes pour enum CWRdWrtIOProtocols
type
  CWRdWrtIOProtocols = TOleEnum;
const
  cwvisaProtocolNormal = $00000001;
  cwvisaProtocolFDC = $00000002;
  cwvisaProtocolHS488 = $00000003;
  cwvisaProtocolASRL488 = $00000004;

// Constantes pour enum CWRdWrtFDCMode
type
  CWRdWrtFDCMode = TOleEnum;
const
  cwvisaFDCNormal = $00000001;
  cwvisaFDCStream = $00000002;

// Constantes pour enum CWAsrlDatabits
type
  CWAsrlDatabits = TOleEnum;
const
  cwasrlDataBits5 = $00000005;
  cwasrlDataBits6 = $00000006;
  cwasrlDataBits7 = $00000007;
  cwasrlDataBits8 = $00000008;

// Constantes pour enum CWAsrlEndProtocols
type
  CWAsrlEndProtocols = TOleEnum;
const
  cwasrlEndNone = $00000000;
  cwasrlEndLastBit = $00000001;
  cwasrlEndTermChar = $00000002;
  cwasrlEndBreak = $00000003;

// Constantes pour enum CWAsrlParity
type
  CWAsrlParity = TOleEnum;
const
  cwasrlParityNone = $00000000;
  cwasrlParityOdd = $00000001;
  cwasrlParityEven = $00000002;
  cwasrlParityMark = $00000003;
  cwasrlParitySpace = $00000004;

// Constantes pour enum CWAsrlStopBits
type
  CWAsrlStopBits = TOleEnum;
const
  cwasrlStopBits1 = $0000000A;
  cwasrlStopBits1_5 = $0000000F;
  cwasrlStopBits2 = $00000014;

// Constantes pour enum CWAsrlFlowControl
type
  CWAsrlFlowControl = TOleEnum;
const
  cwasrlFlowNone = $00000000;
  cwasrlFlowXonXoff = $00000001;
  cwasrlFlowRtsCts = $00000002;
  cwasrlFlowDtrCsr = $00000004;

// Constantes pour enum CWVisaLineStates
type
  CWVisaLineStates = TOleEnum;
const
  cwStateAsserted = $00000001;
  cwStateUnasserted = $00000000;
  cwStateUnknown = $FFFFFFFF;

// Constantes pour enum CWVisaVCQModes
type
  CWVisaVCQModes = TOleEnum;
const
  cwvisaCommand16 = $00000200;
  cwvisaCommmand16Response16 = $00000202;
  cwvisaResponse16 = $00000002;
  cwvisaCommand32 = $00000400;
  cwvisaCommand32Response16 = $00000402;
  cwvisaCommand32Response32 = $00000404;
  cwvisaResponse32 = $00000004;

// Constantes pour enum CWVisaGpibControlREN
type
  CWVisaGpibControlREN = TOleEnum;
const
  cwvisaGpibRENDeassert = $00000000;
  cwvisaGpibRENAssert = $00000001;
  cwvisaGpibRENDeassertGTL = $00000002;
  cwvisaGpibRENAssertAddress = $00000003;
  cwvisaGpibRENAssertLLO = $00000004;
  cwvisaGpibRENAssertAddressLLO = $00000005;
  cwvisaGpibRENAssertGTL = $00000006;

// Constantes pour enum CWVxiMemoryWinAccess
type
  CWVxiMemoryWinAccess = TOleEnum;
const
  cwVxiMemoryNotMapped = $00000001;
  cwVxiMemoryUserOpers = $00000002;
  cwVxiMemoryDerefAddress = $00000003;

// Constantes pour enum CWVxiMemoryAccessPriv
type
  CWVxiMemoryAccessPriv = TOleEnum;
const
  cwVxiMemoryDataPriv = $00000000;
  cwVxiMemoryDataNonPriv = $00000001;
  cwVxiMemoryProgramPriv = $00000002;
  cwVxiMemoryProgramNonPriv = $00000003;
  cwVxiMemoryBlockPriv = $00000004;
  cwVxiMemoryBlockNonPriv = $00000005;
  cwVxiMemoryD64Priv = $00000006;
  cwVxiMemoryD64NonPriv = $00000007;

// Constantes pour enum CWVxiMemoryByteOrder
type
  CWVxiMemoryByteOrder = TOleEnum;
const
  cwVxiMemoryBigEndian = $00000000;
  cwVxiMemoryLittleEndian = $00000001;

// Constantes pour enum CWVisaTriggerIDs
type
  CWVisaTriggerIDs = TOleEnum;
const
  cwvisaTriggerSW = $FFFFFFFF;
  cwvisaTriggerTTL0 = $00000000;
  cwvisaTriggerTTL1 = $00000001;
  cwvisaTriggerTTL2 = $00000002;
  cwvisaTriggerTTL3 = $00000003;
  cwvisaTriggerTTL4 = $00000004;
  cwvisaTriggerTTL5 = $00000005;
  cwvisaTriggerTTL6 = $00000006;
  cwvisaTriggerTTL7 = $00000007;
  cwvisaTriggerECL0 = $00000008;
  cwvisaTriggerECL1 = $00000009;

// Constantes pour enum CWVisaEventTypes
type
  CWVisaEventTypes = TOleEnum;
const
  cwvisaEventIOCompletion = $3FFF2009;
  cwvisaEventTrigger = $BFFF200A;
  cwvisaEventPxiInterrupt = $3FFF2022;
  cwvisaEventServiceReq = $3FFF200B;
  cwvisaEventVXISIGP = $3FFF2020;
  cwvisaEventVXIVMEInterrupt = $BFFF2021;
  cwvisaEventAll = $3FFF7FFF;

// Constantes pour enum CWParsePatternType
type
  CWParsePatternType = TOleEnum;
const
  cwNumberParser = $00000000;
  cwUserDefined = $00000001;

// Constantes pour enum CWVxiMemSpace
type
  CWVxiMemSpace = TOleEnum;
const
  cwVxiLocalSpace = $00000000;
  cwVxiA16Space = $00000001;
  cwVxiA24Space = $00000002;
  cwVxiA32Space = $00000003;

// Constantes pour enum CWVisaMemSpace
type
  CWVisaMemSpace = TOleEnum;
const
  cwVisaLocalSpace = $00000000;
  cwVisaA16Space = $00000001;
  cwVisaA24Space = $00000002;
  cwVisaA32Space = $00000003;
  cwVisaCfgSpace = $0000000A;
  cwVisaBAR0Space = $0000000B;
  cwVisaBAR1Space = $0000000C;
  cwVisaBAR2Space = $0000000D;
  cwVisaBAR3Space = $0000000E;
  cwVisaBAR4Space = $0000000F;
  cwVisaBAR5Space = $00000010;

// Constantes pour enum CWVisaDataWidth
type
  CWVisaDataWidth = TOleEnum;
const
  cwvisaWidth8 = $00000001;
  cwvisaWidth16 = $00000002;
  cwvisaWidth32 = $00000004;

// Constantes pour enum CWVisaLockTypes
type
  CWVisaLockTypes = TOleEnum;
const
  cwvisaNoLock = $00000000;
  cwvisaLockExclusive = $00000001;
  cwvisaLockShared = $00000002;

// Constantes pour enum CWVisaTriggerProtocols
type
  CWVisaTriggerProtocols = TOleEnum;
const
  cwvisaTriggerProtocolDefault = $00000000;
  cwvisaTriggerProtocolOn = $00000001;
  cwvisaTriggerProtocolOff = $00000002;
  cwvisaTriggerProtocolSync = $00000005;

// Constantes pour enum CWVisaBufferMasks
type
  CWVisaBufferMasks = TOleEnum;
const
  cwvisaInBuffer = $00000010;
  cwvisaOutBuffer = $00000020;
  cwvisaInAndOutBuffers = $00000030;

// Constantes pour enum CWVisaFileReadModes
type
  CWVisaFileReadModes = TOleEnum;
const
  cwModeNoChange = $FFFFFFFF;
  cwModeOverWrite = $00000000;
  cwModeAppend = $00000001;

type

// *********************************************************************//
// Déclaration Forward des types définis dans la bibliothèque de types                     
// *********************************************************************//
  CWRdWrt = dispinterface;
  CWAsrl = dispinterface;
  CWTcpip = dispinterface;
  CWPxi = dispinterface;
  CWPxiBAR = dispinterface;
  CWVxi = dispinterface;
  CWVisaGPIB = dispinterface;
  CWVxiMemory = dispinterface;
  CWVisaEvent = dispinterface;
  CWTasks = dispinterface;
  CWTask = dispinterface;
  CWPatterns = dispinterface;
  CWPattern = dispinterface;
  CWTokens = dispinterface;
  CWToken = dispinterface;
  _DCWVisa = dispinterface;
  _DCWVisaEvents = dispinterface;

// *********************************************************************//
// Déclaration de CoClasses définies dans la bibliothèque de types        
// (REMARQUE: On affecte chaque CoClasse à son Interface par défaut)      
// *********************************************************************//
  CWVisa = _DCWVisa;


// *********************************************************************//
// Déclaration de structures, d'unions et d'alias.                         
// *********************************************************************//
  PPUserType1 = ^CWVisaEvent; {*}
  PWideString1 = ^WideString; {*}
  POleVariant1 = ^OleVariant; {*}


// *********************************************************************//
// DispIntf :    CWRdWrt
// Indicateurs : (4096) Dispatchable
// GUID :        {47F88180-E5C9-11D0-81F1-444553540000}
// *********************************************************************//
  CWRdWrt = dispinterface
    ['{47F88180-E5C9-11D0-81F1-444553540000}']
    property IOProtocol: CWRdWrtIOProtocols dispid 1;
    property SendEndEnable: WordBool dispid 2;
    property SuppressEndEnable: WordBool dispid 3;
    property TerminationCharacterEnable: WordBool dispid 4;
    property TerminationCharacter: Smallint dispid 5;
    property FDCChannel: Smallint dispid 6;
    property FDCMode: CWRdWrtFDCMode dispid 7;
    property FDCGenSignalEnable: WordBool dispid 8;
    property FDCUsePair: WordBool dispid 9;
    property DataAsString: WordBool dispid 10;
    property SwapBytes: WordBool dispid 11;
    property DefaultBufferSize: Integer dispid 12;
    property AllowDMA: WordBool dispid 13;
    property EnforceAsyncTimeout: WordBool dispid 15;
  end;

// *********************************************************************//
// DispIntf :    CWAsrl
// Indicateurs : (4096) Dispatchable
// GUID :        {A6A78B00-230D-11D1-81F1-444553540000}
// *********************************************************************//
  CWAsrl = dispinterface
    ['{A6A78B00-230D-11D1-81F1-444553540000}']
    property DataBits: CWAsrlDatabits dispid 1;
    property BaudRate: Integer dispid 2;
    property EndInProtocol: CWAsrlEndProtocols dispid 3;
    property EndOutProtocol: CWAsrlEndProtocols dispid 4;
    property Parity: CWAsrlParity dispid 5;
    property StopBits: CWAsrlStopBits dispid 6;
    property FlowControl: CWAsrlFlowControl dispid 7;
    property AvailableNumber: Integer dispid 8;
    property CtsState: CWVisaLineStates dispid 9;
    property DcdState: CWVisaLineStates dispid 10;
    property DtrState: CWVisaLineStates dispid 11;
    property DsrState: CWVisaLineStates dispid 12;
    property RiState: CWVisaLineStates dispid 13;
    property RtsState: CWVisaLineStates dispid 14;
    property ReplaceCharacter: Smallint dispid 15;
    property XOffCharacter: Smallint dispid 16;
    property XOnCharacter: Smallint dispid 17;
  end;

// *********************************************************************//
// DispIntf :    CWTcpip
// Indicateurs : (4096) Dispatchable
// GUID :        {1D660537-AD55-42A3-9B81-A7C37C7A0EED}
// *********************************************************************//
  CWTcpip = dispinterface
    ['{1D660537-AD55-42A3-9B81-A7C37C7A0EED}']
    property Address: WideString dispid 1;
    property DeviceName: WideString dispid 2;
    property HostName: WideString dispid 3;
    property UseKeepAlivePackets: WordBool dispid 4;
    property NoDelay: WordBool dispid 5;
    property Port: Smallint dispid 6;
  end;

// *********************************************************************//
// DispIntf :    CWPxi
// Indicateurs : (4096) Dispatchable
// GUID :        {62F3C11D-4483-4D16-B185-11EBE8D0D71B}
// *********************************************************************//
  CWPxi = dispinterface
    ['{62F3C11D-4483-4D16-B185-11EBE8D0D71B}']
    property DeviceNumber: Smallint dispid 1;
    property FunctionNumber: Smallint dispid 2;
    property SubManufacturerID: Smallint dispid 9;
    property SubModelCode: Smallint dispid 10;
    property ModelName: WideString dispid 11;
    property ManufacturerName: WideString dispid 12;
    property MemoryBAR0: CWPxiBAR readonly dispid 3;
    property MemoryBAR1: CWPxiBAR readonly dispid 4;
    property MemoryBAR2: CWPxiBAR readonly dispid 5;
    property MemoryBAR3: CWPxiBAR readonly dispid 6;
    property MemoryBAR4: CWPxiBAR readonly dispid 7;
    property MemoryBAR5: CWPxiBAR readonly dispid 8;
  end;

// *********************************************************************//
// DispIntf :    CWPxiBAR
// Indicateurs : (4096) Dispatchable
// GUID :        {B3F0BED5-5DB6-444C-862F-7629D41556F6}
// *********************************************************************//
  CWPxiBAR = dispinterface
    ['{B3F0BED5-5DB6-444C-862F-7629D41556F6}']
    property BaseAddress: Integer dispid 1;
    property type_: Smallint dispid 2;
    property Size: Integer dispid 3;
  end;

// *********************************************************************//
// DispIntf :    CWVxi
// Indicateurs : (4096) Dispatchable
// GUID :        {F0926D60-2FB1-11D1-81F1-444553540000}
// *********************************************************************//
  CWVxi = dispinterface
    ['{F0926D60-2FB1-11D1-81F1-444553540000}']
    property MainframeLA: Smallint dispid 1;
    property CommanderLA: Smallint dispid 2;
    property Slot: Smallint dispid 3;
    property VxiLA: Smallint dispid 4;
    property ModelCode: Smallint dispid 5;
    property ManufacturerId: Smallint dispid 6;
    property ImmediateServant: WordBool dispid 7;
    property InterfaceParentNumber: Smallint dispid 8;
    property ManufacturerName: WideString dispid 9;
    property ModelName: WideString dispid 10;
    property TriggerSupport: Integer dispid 11;
    property DeviceClass: Smallint dispid 12;
    function CommandQuery(mode: CWVisaVCQModes; cmd: Integer): Integer; dispid 13;
  end;

// *********************************************************************//
// DispIntf :    CWVisaGPIB
// Indicateurs : (4096) Dispatchable
// GUID :        {F0926D61-2FB1-11D1-81F1-444553540000}
// *********************************************************************//
  CWVisaGPIB = dispinterface
    ['{F0926D61-2FB1-11D1-81F1-444553540000}']
    property PrimaryAddress: Smallint dispid 1;
    property SecondaryAddress: Smallint dispid 2;
    property ReaddressEnable: WordBool dispid 3;
    property UnaddressEnable: WordBool dispid 4;
    property RENState: WordBool dispid 5;
    procedure ControlREN(mode: CWVisaGpibControlREN); dispid 6;
  end;

// *********************************************************************//
// DispIntf :    CWVxiMemory
// Indicateurs : (4096) Dispatchable
// GUID :        {8A724840-44E5-11D1-81F1-444553540000}
// *********************************************************************//
  CWVxiMemory = dispinterface
    ['{8A724840-44E5-11D1-81F1-444553540000}']
    property WinAccess: CWVxiMemoryWinAccess dispid 1;
    property WinAccessPriv: CWVxiMemoryAccessPriv dispid 2;
    property WinBaseAddr: Integer dispid 3;
    property WinByteOrder: CWVxiMemoryByteOrder dispid 4;
    property WinSize: Integer dispid 5;
    property SrcAccessPriv: CWVxiMemoryAccessPriv dispid 6;
    property SrcByteOrder: CWVxiMemoryByteOrder dispid 7;
    property SrcIncrement: Integer dispid 8;
    property DestAccessPriv: CWVxiMemoryAccessPriv dispid 9;
    property DestByteOrder: CWVxiMemoryByteOrder dispid 10;
    property DestIncrement: Integer dispid 11;
  end;

// *********************************************************************//
// DispIntf :    CWVisaEvent
// Indicateurs : (4096) Dispatchable
// GUID :        {FE41D902-878E-11D1-B32C-006097B77FF4}
// *********************************************************************//
  CWVisaEvent = dispinterface
    ['{FE41D902-878E-11D1-B32C-006097B77FF4}']
    property StatusId: Integer dispid 1;
    property InterruptLevel: Integer dispid 2;
    property TriggerID: CWVisaTriggerIDs dispid 3;
    property Status: Integer dispid 4;
    property Data: OleVariant dispid 5;
    property Count: Integer dispid 6;
    property EventType: CWVisaEventTypes dispid 7;
    property VisaStatus: Integer dispid 8;
    property JobId: Integer dispid 9;
  end;

// *********************************************************************//
// DispIntf :    CWTasks
// Indicateurs : (4096) Dispatchable
// GUID :        {58F5B8C0-EF2E-11D0-ABDA-00A02411EBE6}
// *********************************************************************//
  CWTasks = dispinterface
    ['{58F5B8C0-EF2E-11D0-ABDA-00A02411EBE6}']
    property Count: Smallint dispid 256;
    function Item(Item: OleVariant): CWTask; dispid 0;
    function _NewEnum: IUnknown; dispid -4;
    procedure Remove(Element: OleVariant); dispid 257;
    procedure RemoveAll; dispid 259;
    function Add: CWTask; dispid 258;
  end;

// *********************************************************************//
// DispIntf :    CWTask
// Indicateurs : (4096) Dispatchable
// GUID :        {8FC4CA40-F158-11D0-ABDA-00A02411EBE6}
// *********************************************************************//
  CWTask = dispinterface
    ['{8FC4CA40-F158-11D0-ABDA-00A02411EBE6}']
    property Name: WideString dispid 1;
    property OutputString: WideString dispid 2;
    procedure Run(bufferSize: OleVariant); dispid 3;
    function Parse(Data: OleVariant): OleVariant; dispid 4;
    property Patterns: CWPatterns readonly dispid 5;
    procedure ReadAsync(bufferSize: OleVariant); dispid 6;
    function Read(bufferSize: OleVariant): OleVariant; dispid 7;
  end;

// *********************************************************************//
// DispIntf :    CWPatterns
// Indicateurs : (4096) Dispatchable
// GUID :        {E2B89D70-F198-11D0-ABDB-00A02411EBE6}
// *********************************************************************//
  CWPatterns = dispinterface
    ['{E2B89D70-F198-11D0-ABDB-00A02411EBE6}']
    property Count: Smallint dispid 256;
    function Item(Item: OleVariant): CWPattern; dispid 0;
    function _NewEnum: IUnknown; dispid -4;
    procedure Remove(Element: OleVariant); dispid 257;
    procedure RemoveAll; dispid 259;
    function Add: CWPattern; dispid 258;
  end;

// *********************************************************************//
// DispIntf :    CWPattern
// Indicateurs : (4096) Dispatchable
// GUID :        {E2B89D71-F198-11D0-ABDB-00A02411EBE6}
// *********************************************************************//
  CWPattern = dispinterface
    ['{E2B89D71-F198-11D0-ABDB-00A02411EBE6}']
    property Name: WideString dispid 1;
    property RepetitionFactor: Smallint dispid 2;
    property type_: CWParsePatternType dispid 3;
    property Tokens: CWTokens readonly dispid 4;
  end;

// *********************************************************************//
// DispIntf :    CWTokens
// Indicateurs : (4096) Dispatchable
// GUID :        {175551C1-F24A-11D0-ABDB-00A02411EBE6}
// *********************************************************************//
  CWTokens = dispinterface
    ['{175551C1-F24A-11D0-ABDB-00A02411EBE6}']
    property Count: Smallint dispid 256;
    function Item(Item: OleVariant): CWToken; dispid 0;
    function _NewEnum: IUnknown; dispid -4;
    procedure Remove(Element: OleVariant); dispid 257;
    procedure RemoveAll; dispid 259;
    function Add: CWToken; dispid 258;
  end;

// *********************************************************************//
// DispIntf :    CWToken
// Indicateurs : (4096) Dispatchable
// GUID :        {175551C0-F24A-11D0-ABDB-00A02411EBE6}
// *********************************************************************//
  CWToken = dispinterface
    ['{175551C0-F24A-11D0-ABDB-00A02411EBE6}']
    property Value: OleVariant dispid 1;
    property RepetitionFactor: Smallint dispid 2;
    property Ignore: WordBool dispid 3;
  end;

// *********************************************************************//
// DispIntf :    _DCWVisa
// Indicateurs : (4096) Dispatchable
// GUID :        {1B72B24C-C3E3-11D0-80C5-00A02454310A}
// *********************************************************************//
  _DCWVisa = dispinterface
    ['{1B72B24C-C3E3-11D0-80C5-00A02454310A}']
    property Timeout: Integer dispid 201;
    property RsrcName: WideString dispid 202;
    property ExceptionOnError: WordBool dispid 204;
    property MaxQueueLength: Integer dispid 208;
    property InterfaceType: Smallint dispid 224;
    property UserData: Integer dispid 216;
    property TriggerID: CWVisaTriggerIDs dispid 217;
    property ResourceManufacturerName: WideString dispid 219;
    property ResourceManufacturerId: Smallint dispid 220;
    property InterfaceInstanceName: WideString dispid 221;
    property InterfaceNumber: Smallint dispid 222;
    property ResourceImplVersion: Integer dispid 226;
    property ResourceLockState: CWVisaLockTypes dispid 227;
    property ResourceSpecVersion: Integer dispid 228;
    property VisaStatus: Integer dispid 287;
    property MemSize: Integer dispid 292;
    property MemBase: Integer dispid 293;
    property MemSpace: CWVisaMemSpace dispid 294;
    property ResourceClass: WideString dispid 295;
    property RdWrt: CWRdWrt readonly dispid 205;
    property Asrl: CWAsrl readonly dispid 229;
    property Pxi: CWPxi readonly dispid 234;
    property Tcpip: CWTcpip readonly dispid 233;
    property Vxi: CWVxi readonly dispid 230;
    property GPIB: CWVisaGPIB readonly dispid 231;
    property VxiMemory: CWVxiMemory readonly dispid 232;
    property Tasks: CWTasks readonly dispid 277;
    procedure Close; dispid 206;
    procedure DiscardEvents(EventType: CWVisaEventTypes); dispid 207;
    procedure EnableEvent(EventType: CWVisaEventTypes); dispid 209;
    procedure DisableEvent(EventType: CWVisaEventTypes); dispid 210;
    function In8(space: CWVisaMemSpace; offset: Integer): Smallint; dispid 275;
    function In16(space: CWVisaMemSpace; offset: Integer): Smallint; dispid 212;
    function In32(space: CWVisaMemSpace; offset: Integer): Integer; dispid 250;
    procedure AssertTrigger(protocol: CWVisaTriggerProtocols); dispid 251;
    procedure Clear; dispid 252;
    function MapAddress(mapSpace: CWVisaMemSpace; mapBase: Integer; mapSize: Integer; 
                        access: WordBool; suggested: Integer): Integer; dispid 253;
    function MemAlloc(Size: Integer): Integer; dispid 254;
    procedure MemFree(offset: Integer); dispid 255;
    procedure Move(srcSpace: CWVisaMemSpace; srcOffset: Integer; srcWidth: CWVisaDataWidth; 
                   destSpace: CWVisaMemSpace; destOffset: Integer; destWidth: CWVisaDataWidth; 
                   length: Integer); dispid 256;
    function MoveAsync(srcSpace: CWVisaMemSpace; srcOffset: Integer; srcWidth: CWVisaDataWidth; 
                       destSpace: CWVisaMemSpace; destOffset: Integer; destWidth: CWVisaDataWidth; 
                       length: Integer): Integer; dispid 263;
    function MoveInAsync(width: CWVisaDataWidth; space: CWVisaMemSpace; offset: Integer; 
                         length: Integer): Integer; dispid 288;
    function MoveOutAsync(width: CWVisaDataWidth; space: CWVisaMemSpace; offset: Integer; 
                          buffer: OleVariant): Integer; dispid 289;
    function MoveIn8(space: CWVisaMemSpace; offset: Integer; length: Integer): OleVariant; dispid 278;
    function MoveIn16(space: CWVisaMemSpace; offset: Integer; length: Integer): OleVariant; dispid 279;
    function MoveIn32(space: CWVisaMemSpace; offset: Integer; length: Integer): OleVariant; dispid 280;
    procedure MoveOut8(space: CWVisaMemSpace; offset: Integer; buffer: OleVariant); dispid 281;
    procedure MoveOut16(space: CWVisaMemSpace; offset: Integer; buffer: OleVariant); dispid 282;
    procedure MoveOut32(space: CWVisaMemSpace; offset: Integer; buffer: OleVariant); dispid 283;
    function WaitOnEvent(evType: CWVisaEventTypes; Timeout: Integer; var visaEvent: CWVisaEvent): WordBool; dispid 284;
    procedure Open(Lock: OleVariant); dispid 285;
    function Read(bufferSize: OleVariant): OleVariant; dispid 257;
    function ReadSTB: Integer; dispid 258;
    procedure UnmapAddress; dispid 259;
    procedure Write(buf: OleVariant); dispid 260;
    procedure Out8(space: CWVisaMemSpace; offset: Integer; val8: Smallint); dispid 276;
    procedure Out16(space: CWVisaMemSpace; offset: Integer; val16: Smallint); dispid 261;
    procedure Out32(space: CWVisaMemSpace; offset: Integer; val32: Integer); dispid 262;
    function ReadAsync(bufferSize: OleVariant): Integer; dispid 264;
    function WriteAsync(buf: OleVariant): Integer; dispid 265;
    function Lock(lockType: CWVisaLockTypes; Timeout: Integer; var AccessKey: WideString): WordBool; dispid 266;
    procedure Unlock; dispid 267;
    procedure Terminate(JobId: Integer); dispid 268;
    function Peek8(addr: Integer): Smallint; dispid 274;
    function Peek16(addr: Integer): Smallint; dispid 269;
    function Peek32(addr: Integer): Integer; dispid 270;
    procedure Poke8(addr: Integer; val8: Smallint); dispid 273;
    procedure Poke16(addr: Integer; val16: Smallint); dispid 271;
    procedure Poke32(addr: Integer; val32: Integer); dispid 272;
    function GetVisaAttribute(ID: Integer; Type_: Integer): OleVariant; dispid 290;
    procedure SetVisaAttribute(ID: Integer; Type_: Integer; Value: OleVariant); dispid 291;
    procedure Flush(mask: CWVisaBufferMasks; discard: WordBool); dispid 297;
    function ReadToFile(const filename: WideString; nbytes: Integer; readMode: CWVisaFileReadModes): Integer; dispid 298;
    function WriteFromFile(const filename: WideString; nbytes: Integer): Integer; dispid 299;
    procedure SetBufferSize(mask: CWVisaBufferMasks; Size: Integer); dispid 300;
    function FindResource(const query: WideString): OleVariant; dispid 302;
    procedure ImportStyle(const filename: WideString); dispid 514;
    procedure ExportStyle(const filename: WideString); dispid 513;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf :    _DCWVisaEvents
// Indicateurs : (4096) Dispatchable
// GUID :        {1B72B24D-C3E3-11D0-80C5-00A02454310A}
// *********************************************************************//
  _DCWVisaEvents = dispinterface
    ['{1B72B24D-C3E3-11D0-80C5-00A02454310A}']
    procedure DataReady(taskNumber: Smallint; const Data: OleVariant); dispid 1;
    procedure WriteComplete; dispid 2;
    procedure VxiSignalProc(const visaEvent: CWVisaEvent); dispid 3;
    procedure VxiVmeInterrupt(const visaEvent: CWVisaEvent); dispid 4;
    procedure Trigger(const visaEvent: CWVisaEvent); dispid 5;
    procedure ServiceRequest; dispid 6;
    procedure IOCompletion(const visaEvent: CWVisaEvent); dispid 7;
    procedure OnError(ErrorCode: Integer; const ErrMsg: WideString); dispid 8;
    procedure PxiInterrupt(const visaEvent: CWVisaEvent); dispid 9;
  end;


// *********************************************************************//
// Déclaration de classe proxy de contrôle OLE
// Nom du contrôle      : TCWVisa
// Chaîne d'aide : CWVisa Control
// Interface par défaut : _DCWVisa
// DISP Int. Déf. ?     : Yes
// Interface événements : _DCWVisaEvents
// TypeFlags            : (34) CanCreate Control
// *********************************************************************//
  TCWVisaDataReady = procedure(ASender: TObject; taskNumber: Smallint; const Data: OleVariant) of object;
  TCWVisaVxiSignalProc = procedure(ASender: TObject; const visaEvent: CWVisaEvent) of object;
  TCWVisaVxiVmeInterrupt = procedure(ASender: TObject; const visaEvent: CWVisaEvent) of object;
  TCWVisaTrigger = procedure(ASender: TObject; const visaEvent: CWVisaEvent) of object;
  TCWVisaIOCompletion = procedure(ASender: TObject; const visaEvent: CWVisaEvent) of object;
  TCWVisaOnError = procedure(ASender: TObject; ErrorCode: Integer; const ErrMsg: WideString) of object;
  TCWVisaPxiInterrupt = procedure(ASender: TObject; const visaEvent: CWVisaEvent) of object;

  TCWVisa = class(TOleControl)
  private
    FOnDataReady: TCWVisaDataReady;
    FOnWriteComplete: TNotifyEvent;
    FOnVxiSignalProc: TCWVisaVxiSignalProc;
    FOnVxiVmeInterrupt: TCWVisaVxiVmeInterrupt;
    FOnTrigger: TCWVisaTrigger;
    FOnServiceRequest: TNotifyEvent;
    FOnIOCompletion: TCWVisaIOCompletion;
    FOnError: TCWVisaOnError;
    FOnPxiInterrupt: TCWVisaPxiInterrupt;
    FIntf: _DCWVisa;
    function  GetControlInterface: _DCWVisa;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_RdWrt: CWRdWrt;
    function Get_Asrl: CWAsrl;
    function Get_Pxi: CWPxi;
    function Get_Tcpip: CWTcpip;
    function Get_Vxi: CWVxi;
    function Get_GPIB: CWVisaGPIB;
    function Get_VxiMemory: CWVxiMemory;
    function Get_Tasks: CWTasks;
  public
    procedure Close;
    procedure DiscardEvents(EventType: CWVisaEventTypes);
    procedure EnableEvent(EventType: CWVisaEventTypes);
    procedure DisableEvent(EventType: CWVisaEventTypes);
    function In8(space: CWVisaMemSpace; offset: Integer): Smallint;
    function In16(space: CWVisaMemSpace; offset: Integer): Smallint;
    function In32(space: CWVisaMemSpace; offset: Integer): Integer;
    procedure AssertTrigger(protocol: CWVisaTriggerProtocols);
    procedure Clear;
    function MapAddress(mapSpace: CWVisaMemSpace; mapBase: Integer; mapSize: Integer; 
                        access: WordBool; suggested: Integer): Integer;
    function MemAlloc(Size: Integer): Integer;
    procedure MemFree(offset: Integer);
    procedure Move(srcSpace: CWVisaMemSpace; srcOffset: Integer; srcWidth: CWVisaDataWidth; 
                   destSpace: CWVisaMemSpace; destOffset: Integer; destWidth: CWVisaDataWidth; 
                   length: Integer);
    function MoveAsync(srcSpace: CWVisaMemSpace; srcOffset: Integer; srcWidth: CWVisaDataWidth; 
                       destSpace: CWVisaMemSpace; destOffset: Integer; destWidth: CWVisaDataWidth; 
                       length: Integer): Integer;
    function MoveInAsync(width: CWVisaDataWidth; space: CWVisaMemSpace; offset: Integer; 
                         length: Integer): Integer;
    function MoveOutAsync(width: CWVisaDataWidth; space: CWVisaMemSpace; offset: Integer; 
                          buffer: OleVariant): Integer;
    function MoveIn8(space: CWVisaMemSpace; offset: Integer; length: Integer): OleVariant;
    function MoveIn16(space: CWVisaMemSpace; offset: Integer; length: Integer): OleVariant;
    function MoveIn32(space: CWVisaMemSpace; offset: Integer; length: Integer): OleVariant;
    procedure MoveOut8(space: CWVisaMemSpace; offset: Integer; buffer: OleVariant);
    procedure MoveOut16(space: CWVisaMemSpace; offset: Integer; buffer: OleVariant);
    procedure MoveOut32(space: CWVisaMemSpace; offset: Integer; buffer: OleVariant);
    function WaitOnEvent(evType: CWVisaEventTypes; Timeout: Integer; var visaEvent: CWVisaEvent): WordBool;
    procedure Open; overload;
    procedure Open(Lock: OleVariant); overload;
    function Read: OleVariant; overload;
    function Read(bufferSize: OleVariant): OleVariant; overload;
    function ReadSTB: Integer;
    procedure UnmapAddress;
    procedure Write(buf: OleVariant);
    procedure Out8(space: CWVisaMemSpace; offset: Integer; val8: Smallint);
    procedure Out16(space: CWVisaMemSpace; offset: Integer; val16: Smallint);
    procedure Out32(space: CWVisaMemSpace; offset: Integer; val32: Integer);
    function ReadAsync: Integer; overload;
    function ReadAsync(bufferSize: OleVariant): Integer; overload;
    function WriteAsync(buf: OleVariant): Integer;
    function Lock(lockType: CWVisaLockTypes; Timeout: Integer; var AccessKey: WideString): WordBool;
    procedure Unlock;
    procedure Terminate(JobId: Integer);
    function Peek8(addr: Integer): Smallint;
    function Peek16(addr: Integer): Smallint;
    function Peek32(addr: Integer): Integer;
    procedure Poke8(addr: Integer; val8: Smallint);
    procedure Poke16(addr: Integer; val16: Smallint);
    procedure Poke32(addr: Integer; val32: Integer);
    function GetVisaAttribute(ID: Integer; Type_: Integer): OleVariant;
    procedure SetVisaAttribute(ID: Integer; Type_: Integer; Value: OleVariant);
    procedure Flush(mask: CWVisaBufferMasks; discard: WordBool);
    function ReadToFile(const filename: WideString; nbytes: Integer; readMode: CWVisaFileReadModes): Integer;
    function WriteFromFile(const filename: WideString; nbytes: Integer): Integer;
    procedure SetBufferSize(mask: CWVisaBufferMasks; Size: Integer);
    function FindResource(const query: WideString): OleVariant;
    procedure ImportStyle(const filename: WideString);
    procedure ExportStyle(const filename: WideString);
    procedure AboutBox;
    property  ControlInterface: _DCWVisa read GetControlInterface;
    property  DefaultInterface: _DCWVisa read GetControlInterface;
    property RdWrt: CWRdWrt read Get_RdWrt;
    property Asrl: CWAsrl read Get_Asrl;
    property Pxi: CWPxi read Get_Pxi;
    property Tcpip: CWTcpip read Get_Tcpip;
    property Vxi: CWVxi read Get_Vxi;
    property GPIB: CWVisaGPIB read Get_GPIB;
    property VxiMemory: CWVxiMemory read Get_VxiMemory;
    property Tasks: CWTasks read Get_Tasks;
  published
    property Anchors;
    property Timeout: Integer index 201 read GetIntegerProp write SetIntegerProp stored False;
    property RsrcName: WideString index 202 read GetWideStringProp write SetWideStringProp stored False;
    property ExceptionOnError: WordBool index 204 read GetWordBoolProp write SetWordBoolProp stored False;
    property MaxQueueLength: Integer index 208 read GetIntegerProp write SetIntegerProp stored False;
    property InterfaceType: Smallint index 224 read GetSmallintProp write SetSmallintProp stored False;
    property UserData: Integer index 216 read GetIntegerProp write SetIntegerProp stored False;
    property TriggerID: TOleEnum index 217 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ResourceManufacturerName: WideString index 219 read GetWideStringProp write SetWideStringProp stored False;
    property ResourceManufacturerId: Smallint index 220 read GetSmallintProp write SetSmallintProp stored False;
    property InterfaceInstanceName: WideString index 221 read GetWideStringProp write SetWideStringProp stored False;
    property InterfaceNumber: Smallint index 222 read GetSmallintProp write SetSmallintProp stored False;
    property ResourceImplVersion: Integer index 226 read GetIntegerProp write SetIntegerProp stored False;
    property ResourceLockState: TOleEnum index 227 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ResourceSpecVersion: Integer index 228 read GetIntegerProp write SetIntegerProp stored False;
    property VisaStatus: Integer index 287 read GetIntegerProp write SetIntegerProp stored False;
    property MemSize: Integer index 292 read GetIntegerProp write SetIntegerProp stored False;
    property MemBase: Integer index 293 read GetIntegerProp write SetIntegerProp stored False;
    property MemSpace: TOleEnum index 294 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property ResourceClass: WideString index 295 read GetWideStringProp write SetWideStringProp stored False;
    property OnDataReady: TCWVisaDataReady read FOnDataReady write FOnDataReady;
    property OnWriteComplete: TNotifyEvent read FOnWriteComplete write FOnWriteComplete;
    property OnVxiSignalProc: TCWVisaVxiSignalProc read FOnVxiSignalProc write FOnVxiSignalProc;
    property OnVxiVmeInterrupt: TCWVisaVxiVmeInterrupt read FOnVxiVmeInterrupt write FOnVxiVmeInterrupt;
    property OnTrigger: TCWVisaTrigger read FOnTrigger write FOnTrigger;
    property OnServiceRequest: TNotifyEvent read FOnServiceRequest write FOnServiceRequest;
    property OnIOCompletion: TCWVisaIOCompletion read FOnIOCompletion write FOnIOCompletion;
    property OnError: TCWVisaOnError read FOnError write FOnError;
    property OnPxiInterrupt: TCWVisaPxiInterrupt read FOnPxiInterrupt write FOnPxiInterrupt;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

procedure TCWVisa.InitControlData;
const
  CEventDispIDs: array [0..8] of DWORD = (
    $00000001, $00000002, $00000003, $00000004, $00000005, $00000006,
    $00000007, $00000008, $00000009);
  CLicenseKey: array[0..64] of Word = ( $0069, $0063, $0065, $0068, $0067, $006F, $0070, $0063, $0064, $006A, $0067
    , $0064, $006E, $0067, $006B, $0063, $006E, $0063, $006D, $0070, $0069
    , $0063, $0069, $006D, $0063, $006E, $006A, $006D, $0062, $006C, $0068
    , $0069, $0070, $006C, $006D, $0070, $006A, $0062, $006E, $0067, $0065
    , $006A, $006C, $006B, $006C, $0061, $006A, $0064, $006B, $006E, $0064
    , $006F, $0067, $006A, $0063, $0068, $0063, $006C, $0061, $0061, $006F
    , $0062, $0063, $0063, $0000);
  CControlData: TControlData2 = (
    ClassID:      '{1B72B24E-C3E3-11D0-80C5-00A02454310A}';
    EventIID:     '{1B72B24D-C3E3-11D0-80C5-00A02454310A}';
    EventCount:   9;
    EventDispIDs: @CEventDispIDs;
    LicenseKey:   @CLicenseKey;
    Flags:        $00000000;
    Version:      500);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := UIntPtr(@@FOnDataReady) - UIntPtr(Self);
end;

procedure TCWVisa.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _DCWVisa;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TCWVisa.GetControlInterface: _DCWVisa;
begin
  CreateControl;
  Result := FIntf;
end;

function TCWVisa.Get_RdWrt: CWRdWrt;
begin
  Result := DefaultInterface.RdWrt;
end;

function TCWVisa.Get_Asrl: CWAsrl;
begin
  Result := DefaultInterface.Asrl;
end;

function TCWVisa.Get_Pxi: CWPxi;
begin
  Result := DefaultInterface.Pxi;
end;

function TCWVisa.Get_Tcpip: CWTcpip;
begin
  Result := DefaultInterface.Tcpip;
end;

function TCWVisa.Get_Vxi: CWVxi;
begin
  Result := DefaultInterface.Vxi;
end;

function TCWVisa.Get_GPIB: CWVisaGPIB;
begin
  Result := DefaultInterface.GPIB;
end;

function TCWVisa.Get_VxiMemory: CWVxiMemory;
begin
  Result := DefaultInterface.VxiMemory;
end;

function TCWVisa.Get_Tasks: CWTasks;
begin
  Result := DefaultInterface.Tasks;
end;

procedure TCWVisa.Close;
begin
  DefaultInterface.Close;
end;

procedure TCWVisa.DiscardEvents(EventType: CWVisaEventTypes);
begin
  DefaultInterface.DiscardEvents(EventType);
end;

procedure TCWVisa.EnableEvent(EventType: CWVisaEventTypes);
begin
  DefaultInterface.EnableEvent(EventType);
end;

procedure TCWVisa.DisableEvent(EventType: CWVisaEventTypes);
begin
  DefaultInterface.DisableEvent(EventType);
end;

function TCWVisa.In8(space: CWVisaMemSpace; offset: Integer): Smallint;
begin
  Result := DefaultInterface.In8(space, offset);
end;

function TCWVisa.In16(space: CWVisaMemSpace; offset: Integer): Smallint;
begin
  Result := DefaultInterface.In16(space, offset);
end;

function TCWVisa.In32(space: CWVisaMemSpace; offset: Integer): Integer;
begin
  Result := DefaultInterface.In32(space, offset);
end;

procedure TCWVisa.AssertTrigger(protocol: CWVisaTriggerProtocols);
begin
  DefaultInterface.AssertTrigger(protocol);
end;

procedure TCWVisa.Clear;
begin
  DefaultInterface.Clear;
end;

function TCWVisa.MapAddress(mapSpace: CWVisaMemSpace; mapBase: Integer; mapSize: Integer; 
                            access: WordBool; suggested: Integer): Integer;
begin
  Result := DefaultInterface.MapAddress(mapSpace, mapBase, mapSize, access, suggested);
end;

function TCWVisa.MemAlloc(Size: Integer): Integer;
begin
  Result := DefaultInterface.MemAlloc(Size);
end;

procedure TCWVisa.MemFree(offset: Integer);
begin
  DefaultInterface.MemFree(offset);
end;

procedure TCWVisa.Move(srcSpace: CWVisaMemSpace; srcOffset: Integer; srcWidth: CWVisaDataWidth; 
                       destSpace: CWVisaMemSpace; destOffset: Integer; destWidth: CWVisaDataWidth; 
                       length: Integer);
begin
  DefaultInterface.Move(srcSpace, srcOffset, srcWidth, destSpace, destOffset, destWidth, length);
end;

function TCWVisa.MoveAsync(srcSpace: CWVisaMemSpace; srcOffset: Integer; srcWidth: CWVisaDataWidth; 
                           destSpace: CWVisaMemSpace; destOffset: Integer; 
                           destWidth: CWVisaDataWidth; length: Integer): Integer;
begin
  Result := DefaultInterface.MoveAsync(srcSpace, srcOffset, srcWidth, destSpace, destOffset, 
                                       destWidth, length);
end;

function TCWVisa.MoveInAsync(width: CWVisaDataWidth; space: CWVisaMemSpace; offset: Integer; 
                             length: Integer): Integer;
begin
  Result := DefaultInterface.MoveInAsync(width, space, offset, length);
end;

function TCWVisa.MoveOutAsync(width: CWVisaDataWidth; space: CWVisaMemSpace; offset: Integer; 
                              buffer: OleVariant): Integer;
begin
  Result := DefaultInterface.MoveOutAsync(width, space, offset, buffer);
end;

function TCWVisa.MoveIn8(space: CWVisaMemSpace; offset: Integer; length: Integer): OleVariant;
begin
  Result := DefaultInterface.MoveIn8(space, offset, length);
end;

function TCWVisa.MoveIn16(space: CWVisaMemSpace; offset: Integer; length: Integer): OleVariant;
begin
  Result := DefaultInterface.MoveIn16(space, offset, length);
end;

function TCWVisa.MoveIn32(space: CWVisaMemSpace; offset: Integer; length: Integer): OleVariant;
begin
  Result := DefaultInterface.MoveIn32(space, offset, length);
end;

procedure TCWVisa.MoveOut8(space: CWVisaMemSpace; offset: Integer; buffer: OleVariant);
begin
  DefaultInterface.MoveOut8(space, offset, buffer);
end;

procedure TCWVisa.MoveOut16(space: CWVisaMemSpace; offset: Integer; buffer: OleVariant);
begin
  DefaultInterface.MoveOut16(space, offset, buffer);
end;

procedure TCWVisa.MoveOut32(space: CWVisaMemSpace; offset: Integer; buffer: OleVariant);
begin
  DefaultInterface.MoveOut32(space, offset, buffer);
end;

function TCWVisa.WaitOnEvent(evType: CWVisaEventTypes; Timeout: Integer; var visaEvent: CWVisaEvent): WordBool;
begin
  Result := DefaultInterface.WaitOnEvent(evType, Timeout, visaEvent);
end;

procedure TCWVisa.Open;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Open(EmptyParam);
end;

procedure TCWVisa.Open(Lock: OleVariant);
begin
  DefaultInterface.Open(Lock);
end;

function TCWVisa.Read: OleVariant;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.Read(EmptyParam);
end;

function TCWVisa.Read(bufferSize: OleVariant): OleVariant;
begin
  Result := DefaultInterface.Read(bufferSize);
end;

function TCWVisa.ReadSTB: Integer;
begin
  Result := DefaultInterface.ReadSTB;
end;

procedure TCWVisa.UnmapAddress;
begin
  DefaultInterface.UnmapAddress;
end;

procedure TCWVisa.Write(buf: OleVariant);
begin
  DefaultInterface.Write(buf);
end;

procedure TCWVisa.Out8(space: CWVisaMemSpace; offset: Integer; val8: Smallint);
begin
  DefaultInterface.Out8(space, offset, val8);
end;

procedure TCWVisa.Out16(space: CWVisaMemSpace; offset: Integer; val16: Smallint);
begin
  DefaultInterface.Out16(space, offset, val16);
end;

procedure TCWVisa.Out32(space: CWVisaMemSpace; offset: Integer; val32: Integer);
begin
  DefaultInterface.Out32(space, offset, val32);
end;

function TCWVisa.ReadAsync: Integer;
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  Result := DefaultInterface.ReadAsync(EmptyParam);
end;

function TCWVisa.ReadAsync(bufferSize: OleVariant): Integer;
begin
  Result := DefaultInterface.ReadAsync(bufferSize);
end;

function TCWVisa.WriteAsync(buf: OleVariant): Integer;
begin
  Result := DefaultInterface.WriteAsync(buf);
end;

function TCWVisa.Lock(lockType: CWVisaLockTypes; Timeout: Integer; var AccessKey: WideString): WordBool;
begin
  Result := DefaultInterface.Lock(lockType, Timeout, AccessKey);
end;

procedure TCWVisa.Unlock;
begin
  DefaultInterface.Unlock;
end;

procedure TCWVisa.Terminate(JobId: Integer);
begin
  DefaultInterface.Terminate(JobId);
end;

function TCWVisa.Peek8(addr: Integer): Smallint;
begin
  Result := DefaultInterface.Peek8(addr);
end;

function TCWVisa.Peek16(addr: Integer): Smallint;
begin
  Result := DefaultInterface.Peek16(addr);
end;

function TCWVisa.Peek32(addr: Integer): Integer;
begin
  Result := DefaultInterface.Peek32(addr);
end;

procedure TCWVisa.Poke8(addr: Integer; val8: Smallint);
begin
  DefaultInterface.Poke8(addr, val8);
end;

procedure TCWVisa.Poke16(addr: Integer; val16: Smallint);
begin
  DefaultInterface.Poke16(addr, val16);
end;

procedure TCWVisa.Poke32(addr: Integer; val32: Integer);
begin
  DefaultInterface.Poke32(addr, val32);
end;

function TCWVisa.GetVisaAttribute(ID: Integer; Type_: Integer): OleVariant;
begin
  Result := DefaultInterface.GetVisaAttribute(ID, Type_);
end;

procedure TCWVisa.SetVisaAttribute(ID: Integer; Type_: Integer; Value: OleVariant);
begin
  DefaultInterface.SetVisaAttribute(ID, Type_, Value);
end;

procedure TCWVisa.Flush(mask: CWVisaBufferMasks; discard: WordBool);
begin
  DefaultInterface.Flush(mask, discard);
end;

function TCWVisa.ReadToFile(const filename: WideString; nbytes: Integer; 
                            readMode: CWVisaFileReadModes): Integer;
begin
  Result := DefaultInterface.ReadToFile(filename, nbytes, readMode);
end;

function TCWVisa.WriteFromFile(const filename: WideString; nbytes: Integer): Integer;
begin
  Result := DefaultInterface.WriteFromFile(filename, nbytes);
end;

procedure TCWVisa.SetBufferSize(mask: CWVisaBufferMasks; Size: Integer);
begin
  DefaultInterface.SetBufferSize(mask, Size);
end;

function TCWVisa.FindResource(const query: WideString): OleVariant;
begin
  Result := DefaultInterface.FindResource(query);
end;

procedure TCWVisa.ImportStyle(const filename: WideString);
begin
  DefaultInterface.ImportStyle(filename);
end;

procedure TCWVisa.ExportStyle(const filename: WideString);
begin
  DefaultInterface.ExportStyle(filename);
end;

procedure TCWVisa.AboutBox;
begin
  DefaultInterface.AboutBox;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TCWVisa]);
end;

end.
