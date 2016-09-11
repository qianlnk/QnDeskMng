{*****************************************************************************
* �汾��Ϣ:
*     ǳŵ�����������v1.0
* �ļ�����:
*     UseShortcutKey.pas
* ����ժҪ:
*     �����ݷ�ʽ���������༰���У�
* ��ʷ��¼:
*     2013.1.28 created by xzj
* �����޸�:
*     2013.2.5 modified by xzj
*     ��ݷ�ʽ���Ʋ���ʾ��ݷ�ʽID,��ع�������Ӧ���޸ģ���ID���������naID��
*
* ����Ϊ����ԭ�����޸��뱣��������Ϣ���ĺ����ɷ����������乲ͬ�ο�����ͬ������
* лл֧�֡�
******************************************************************************}
unit UseShortcutKey;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, jpeg, ExtCtrls, TntExtCtrls, TntForms,
  ComCtrls, TntComCtrls, ImgList, DB, ADODB, Menus, TntMenus, Buttons, RzTray,
  TntButtons, Spin, RzButton, Mask, RzEdit, RzBtnEdt, RzBmpBtn, RzCmboBx,
  RzTabs, RzTrkBar, WinSkinStore, WinSkinData;
const
  WM_MouseEnter = $B013;
  WM_MouseLeave = $B014;
type
  TFormUse = class(TForm)
    imglogo: TTntImage;
    lblName: TTntLabel;
    lbl1: TTntLabel;
    lbl2: TTntLabel;
    tntscrlbxType: TTntScrollBox;
    tntpmnType: TTntPopupMenu;
    tmr1: TTimer;
    con1: TADOConnection;
    qryCmd: TADOQuery;
    il1: TImageList;
    ImageTxt: TImage;
    ImageRAR: TImage;
    ImageFiles: TImage;
    ImageMDB: TImage;
    ImageXLS: TImage;
    ImageDOC: TImage;
    ImagePPT: TImage;
    Imagepsd: TImage;
    ImagePhoto: TImage;
    Imagepdf: TImage;
    ImageDPR: TImage;
    ImagePAS: TImage;
    Imagedfm: TImage;
    ImageDLL: TImage;
    ImageWZ: TImage;
    Image1: TImage;
    Image2: TImage;
    rztrycn1: TRzTrayIcon;
    tntmntmAdd: TTntMenuItem;
    tntpgcntrl1: TTntPageControl;
    pg1: TTntTabSheet;
    edtAdd: TTntEdit;
    pg2: TTntTabSheet;
    edtEdt: TTntEdit;
    tntmntmqx: TTntMenuItem;
    tntpmnPro: TTntPopupMenu;
    tntmntmEdtPro: TTntMenuItem;
    tntmntmDelPro: TTntMenuItem;
    tntmntmTail: TTntMenuItem;
    tntmntmList: TTntMenuItem;
    tntmntmdefault: TTntMenuItem;
    tntmntmN1: TTntMenuItem;
    tntmntmWc: TTntMenuItem;
    tntpmnOperbtn: TTntPopupMenu;
    tntmntmEdit: TTntMenuItem;
    tntmntmdelete: TTntMenuItem;
    lbl3: TTntLabel;
    edtnow: TTntEdit;
    lbl4: TTntLabel;
    tntmntmN2: TTntMenuItem;
    tntmntmhide: TTntMenuItem;
    N1: TTntMenuItem;
    tntmntmdelall: TTntMenuItem;
    Imagebat: TImage;
    tntmntmdelalltype: TTntMenuItem;
    tntmntmN3: TTntMenuItem;
    tntcntrlbr1: TTntControlBar;
    tntmntmSendLink: TTntMenuItem;
    tntmntmN4: TTntMenuItem;
    tntpmnPC: TTntPopupMenu;
    btnPC: TRzMenuButton;
    btn1: TRzShapeButton;
    tntpmnMN: TTntPopupMenu;
    tntmntmClose: TTntMenuItem;
    tmr2: TTimer;
    tntmntmAutoOpen: TTntMenuItem;
    tntmntmSendAll: TTntMenuItem;
    edtTime: TTntEdit;
    tmr3: TTimer;
    tmrRe: TTimer;
    edtKeyNow: TTntEdit;
    tmrsx: TTimer;
    pnl1: TPanel;
    grp1: TGroupBox;
    qrySet: TADOQuery;
    qryInit: TADOQuery;
    tntpgcntrl2: TRzPageControl;
    pg3: TRzTabSheet;
    lvPro: TTntListView;
    pg4: TRzTabSheet;
    mmo1: TTntMemo;
    pg5: TRzTabSheet;
    tntpnl1: TTntPanel;
    tntmntmN5: TTntMenuItem;
    tntmntmexit: TTntMenuItem;
    tntmntmHideZT: TTntMenuItem;
    tntmntmHideV: TTntMenuItem;
    grp2: TTntGroupBox;
    lbl5: TTntLabel;
    cbbFC: TRzColorComboBox;
    lbl6: TTntLabel;
    cbbFONTC: TRzColorComboBox;
    cbbGC: TRzColorComboBox;
    lbl7: TTntLabel;
    lbl9: TTntLabel;
    cbbEC: TRzColorComboBox;
    cbbFT: TRzComboBox;
    lbl8: TTntLabel;
    lbl11: TTntLabel;
    cbbHD: TRzComboBox;
    cbbSH: TRzComboBox;
    lbl10: TTntLabel;
    lbl12: TTntLabel;
    rztrckbr1: TRzTrackBar;
    dlgFont1: TFontDialog;
    lbl13: TTntLabel;
    btn2: TRzButtonEdit;
    skndt1: TSkinData;
    sknstr1: TSkinStore;
    procedure FormCreate(Sender: TObject);
    procedure BtnTypeClick (Sender: TObject);
    procedure LoadShortcutKey(Sender : TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure edtAddKeyPress(Sender: TObject; var Key: Char);
    procedure tntmntmAddClick(Sender: TObject);
    procedure edtEdtKeyPress(Sender: TObject; var Key: Char);
    procedure Openqry(var qry1 : TADOQuery; sqltxt : string);
    procedure Execqry(var qry1 : TADOQuery; sqltxt : string);
    procedure tntmntmqxClick(Sender: TObject);
    procedure lvProDblClick(Sender: TObject);
    procedure tntmntmTailClick(Sender: TObject);
    procedure tntmntmListClick(Sender: TObject);
    procedure tntmntmdefaultClick(Sender: TObject);
    procedure tntmntmEdtProClick(Sender: TObject);
    procedure tntmntmWcClick(Sender: TObject);
    procedure LBWindowProc(var Message: TMessage);
    procedure WMDROPFILES_L(var Msg: TMessage);
    procedure tntmntmDelProClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tntmntmEditClick(Sender: TObject);
    procedure tntmntmdeleteClick(Sender: TObject);
    procedure tntmntmhideClick(Sender: TObject);
    procedure lvProMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tntmntmdelallClick(Sender: TObject);
    procedure lvProEdited(Sender: TObject; Item: TTntListItem;
      var S: WideString);
    procedure lvProKeyPress(Sender: TObject; var Key: Char);
    procedure tntmntmdelalltypeClick(Sender: TObject);
    procedure CreateLink(programPath,programArg,LinkPath,Descr : string);
    procedure tntmntmSendLinkClick(Sender: TObject);
    procedure GetSystemPath();
    procedure MenuBtnOnClick(Sender : TObject);
    procedure btn1Click(Sender: TObject);
    procedure tntmntmCloseClick(Sender: TObject);
    //procedure tmr2Timer(Sender: TObject);
    procedure tntmntmAutoOpenClick(Sender: TObject);
    procedure tntmntmSendAllClick(Sender: TObject);
    procedure tmr3Timer(Sender: TObject);
    procedure tmrReTimer(Sender: TObject);
    procedure tmrsxTimer(Sender: TObject);
    procedure cbbFCChange(Sender: TObject);
    procedure cbbFONTCChange(Sender: TObject);
    procedure cbbGCChange(Sender: TObject);
    procedure cbbECChange(Sender: TObject);
    procedure cbbFTChange(Sender: TObject);
    procedure cbbHDChange(Sender: TObject);
    procedure cbbSHChange(Sender: TObject);
    procedure InitForm();
    procedure AddInitForm();
    procedure tntmntmexitClick(Sender: TObject);
    procedure tntmntmHideZTClick(Sender: TObject);
    procedure tntmntmHideVClick(Sender: TObject);
    procedure rztrckbr1Change(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imglogoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tntpnl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure grp2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tntpgcntrl2Change(Sender: TObject);
    procedure btn2ButtonClick(Sender: TObject);
  private
    { Private declarations }
    abtnType: array[1..50] of TRzBitBtn;  //���鰴ť
    anID : array[0..500] of Integer;
    sActiveBtn : string;                //��ǰ��İ�ť
    SYS_COLOR : TColor;      //������ɫ
    FONT_COLOR : TColor;     //������ɫ
    GROUP_COLOR : TColor;    //��ѡ�еķ���������ɫ
    EDITING_COLOR : TColor;  //�޸�ʱ������ɫ
    HIDE_DIRECTION : string; //�������ط���
    sTypeLoadFlag : string;  //���ͼ��ر�ʶ�����ڲ��ظ����أ�
    procedure WMMouseEnter(var Msg: TMessage); message WM_MouseEnter;
    procedure QNLoadType();
  public
    { Public declarations }
  end;

var
  FormUse: TFormUse;
  sPath: string;
  sType: string;
  hInNow : HKL;       //��ǰ���뷨
  keyValue : string;  //������ѯ
  isEditing : Boolean; //�Ƿ��Ǳ༭״̬
  RWindowProc: TWndMethod;
  LWindowProc: TWndMethod;
  OldBtn : TRzBitBtn;
implementation
uses registry, shlobj, ActiveX, ComObj, ShellAPI;
{$R *.dfm}

{****************************************************************
* ��������:  Openqry
* ��������:  ���ݿ��ѯ
* ����˵��:  TADOQuery��string
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.28 created by xzj
*****************************************************************}
procedure  TFormUse.Openqry(var qry1 : TADOQuery; sqltxt : string);
begin
  with qry1 do
  begin
    Close;
    sql.clear;
    sql.add(sqltxt);
    Open;
  end;
end;

{****************************************************************
* ��������:  Execqry
* ��������:  ���ݿ����
* ����˵��:  TADOQuery��string
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.28 created by xzj
*****************************************************************}
procedure  TFormUse.Execqry(var qry1 : TADOQuery; sqltxt : string);
begin
  with qry1 do
  begin
    Close;
    sql.clear;
    sql.add(sqltxt);
    ExecSQL;
  end;
end;

{****************************************************************
* ��������:  WMMouseEnter
* ��������:  ����������صĴ��壬��������
* ����˵��:  TMessage
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.28 created by xzj
*****************************************************************}
procedure TFormUse.WMMouseEnter(var Msg: TMessage);
var iIndex : Integer;
begin
  if (Top < 0) and (HIDE_DIRECTION = '��������') then
  begin
    //while(Top < 0) do
    //begin
    //  iIndex := 10;
    //  Top := Top + 2;
    //  while(iIndex > 0) do
    //  begin
    //    iIndex := iIndex - 1;
    //  end;
    //end;
    Top := 0;
    //Ϊ��֤����������������ǰ��
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //�������Ƶ���ǰ
    //���ֲ�ȡ��Ч������
    SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //Ȼ��ȡ��������ǰ
  end
  else if (Left < 0) and (HIDE_DIRECTION = '��������') then
  begin
    Left := 0;
    //Ϊ��֤����������������ǰ��
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //�������Ƶ���ǰ
    //���ֲ�ȡ��Ч������
    SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //Ȼ��ȡ��������ǰ
  end
  else if ((Left + Self.Width) > screen.Width) and (HIDE_DIRECTION = '��������') then
  begin
    Left := Screen.Width - Self.Width;
    //Ϊ��֤����������������ǰ��
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //�������Ƶ���ǰ
    //���ֲ�ȡ��Ч������
    SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //Ȼ��ȡ��������ǰ
  end
  else if ((Top + Self.Height) > Screen.Height) and (HIDE_DIRECTION = '��������') then
  begin
    Top := Screen.Height - Self.Height;
    //Ϊ��֤����������������ǰ��
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //�������Ƶ���ǰ
    //���ֲ�ȡ��Ч������
    SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //Ȼ��ȡ��������ǰ
  end;
  Tmr1.Enabled := True;
end;

{****************************************************************
* ��������:  GetTempDirectory
* ��������:  ȡϵͳ��ʱ·��
* ����˵��:  ��
* �� �� ֵ:  string ·��
* ��ʷ��¼:  2013.1.28 created by xzj
*****************************************************************}
function GetTempDirectory: string; 
var
  TempDir: array[0..255] of Char;
begin
  GetTempPath(255, @TempDir);
  Result := StrPas(TempDir);

end;

{****************************************************************
* ��������:  QNLoadType
* ��������:  ��������ѡ��ť
* ����˵��:  ��
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.28 created by xzj
*****************************************************************}
procedure TFormUse.QNLoadType();
var i, j,k,nRand : Integer;
    bmpName : string;
begin
  Randomize;
  with qryCmd do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from PRO_TYPE');
    Open;
  end;
  //����ǰ�ͷ������ڴ棬��ֹ�ڴ��ͻ
  for k := 1 to 49 do
  begin
    if abtnType[k] <> nil then
    begin
      abtnType[k].Destroy;
      abtnType[k] := nil;
    end;
  end;

  nRand := Random(97) + 1;
  qryCmd.First;
  //Ĭ���õ�һ����ťΪ�����г���
  abtnType[1] := TRzBitBtn.Create(Self);
  abtnType[1].Height := 30;
  abtnType[1].Width := tntscrlbxType.Width - 5;
  abtnType[1].Top := 1;
  abtnType[1].Left := tntscrlbxType.Left;
  abtnType[1].Name := 'btn_0';
  abtnType[1].Parent := tntscrlbxType;
  abtnType[1].Caption := '���г���';
  abtnType[1].ParentColor := True;
  abtnType[1].ParentFont := True;
  bmpName := 'emotions\' + IntToStr(nRand) + 'fixed.bmp';
  abtnType[1].Glyph.LoadFromFile(bmpName);
  abtnType[1].OnClick := BtnTypeClick;
  abtnType[1].Visible := True;
  OldBtn := abtnType[1];
  for i := 1 to qryCmd.RecordCount do
  begin
    nRand := Random(95) + 1;
    abtnType[i + 1] := TRzBitBtn.Create(Self);
    abtnType[i + 1].Height := 30;
    abtnType[i + 1].Width := tntscrlbxType.Width - 5;
    j := trunc(i / 1);
    abtnType[i + 1].Top := 1 + (abtnType[i + 1].Height + 1) * j;
    j := i mod 1;
    abtnType[i + 1].Left := abtnType[i + 1].Width * (j);
    abtnType[i + 1].Name := 'btn_' + inttostr(i + 1);
    abtnType[i + 1].Parent := tntscrlbxType;
    abtnType[i + 1].Caption := qryCmd.FieldByName('PRO_TYPE').Value;
    abtnType[i + 1].ParentColor := True;
    abtnType[i + 1].ParentFont := True;
    abtnType[i + 1].PopupMenu := tntpmnOperbtn;
    bmpName := 'emotions\' + IntToStr(nRand + 1) + 'fixed.bmp';
    abtnType[i + 1].Glyph.LoadFromFile(bmpName);
    abtnType[i + 1].OnClick := BtnTypeClick;
    abtnType[i + 1].Visible := True;
    //nNewTop := abtnType[i + 1].Top + 31;
    qryCmd.next;
  end;
  tntpgcntrl1.Visible := False;
end;

{****************************************************************
* ��������:  LoadShortcutKey
* ��������:  ���ؿ�ݷ�ʽ
* ����˵��:  Sender : TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.28 created by xzj
*****************************************************************}
procedure TFormUse.LoadShortcutKey(Sender : TObject);
var
  i : Integer;
  lListItem: TListItem;
  bmp: TBitmap;
  sFilePath: string;
begin
  qryCmd.First;
  il1.Clear;
  lvPro.Clear;

 for i := 0 to qryCmd.RecordCount - 1 do
  begin
    lListItem := lvPro.Items.Add;
    lListItem.Caption := Trim(qryCmd.fieldbyname('PRO_NAME').value);
    lListItem.ImageIndex := i;
    anID[lListItem.ImageIndex] := qryCmd.fieldbyname('ID').value;

   //��ȡ����ͼ��
    sFilePath := qryCmd.FieldByName('PRO_PATH').Value;


    if (LowerCase(ExtractFileExt(sFilePath))) = '' then
      image1.Picture := ImageFiles.Picture
    else if (LowerCase(ExtractFileExt(sFilePath))) = '.txt' then
      image1.Picture := ImageTxt.Picture
    else if ((LowerCase(ExtractFileExt(sFilePath))) = '.rar') or ((LowerCase(ExtractFileExt(sFilePath))) = '.zip') then
      image1.Picture := ImageRAR.Picture
    else if (LowerCase(ExtractFileExt(sFilePath))) = '.mdb' then
      image1.Picture := ImageMDB.Picture
    else if (LowerCase(ExtractFileExt(sFilePath))) = '.xls' then
      image1.Picture := Imagexls.Picture
    else if ((LowerCase(ExtractFileExt(sFilePath))) = '.doc')
            or ((LowerCase(ExtractFileExt(sFilePath))) = '.docx') then
      image1.Picture := Imagedoc.Picture
    else if (LowerCase(ExtractFileExt(sFilePath))) = '.ppt' then
      image1.Picture := Imageppt.Picture
    else if (LowerCase(ExtractFileExt(sFilePath))) = '.pdf' then
      image1.Picture := Imagepdf.Picture
    else if (LowerCase(ExtractFileExt(sFilePath))) = '.psd' then
      image1.Picture := Imagepsd.Picture
    else if ((LowerCase(ExtractFileExt(sFilePath))) = '.jpg')
              or ((LowerCase(ExtractFileExt(sFilePath))) = '.bmp')
              or ((LowerCase(ExtractFileExt(sFilePath))) = '.jpeg')
              or ((LowerCase(ExtractFileExt(sFilePath))) = '.gif')
              or ((LowerCase(ExtractFileExt(sFilePath))) = '.cdr') then
      image1.Picture := ImagePhoto.Picture
    else if (LowerCase(ExtractFileExt(sFilePath))) = '.dpr' then
      image1.Picture := Imagedpr.Picture
    else if (LowerCase(ExtractFileExt(sFilePath))) = '.dfm' then
      image1.Picture := Imagedfm.Picture
    else if (LowerCase(ExtractFileExt(sFilePath))) = '.pas' then
      image1.Picture := Imagepas.Picture
    else if (LowerCase(ExtractFileExt(sFilePath))) = '.dll' then
      image1.Picture := Imagedll.Picture
    else if (LowerCase(ExtractFileExt(sFilePath))) = '.bat' then
      image1.Picture := Imagebat.Picture
    else if (LowerCase(ExtractFileExt(sFilePath))) = '.exe' then
      image1.Picture.Icon.handle := ExtractIcon(hInstance, pchar(sFilePath), 0)
    else
      image1.Picture := Imagewz.Picture;

    bmp := TBitmap.Create;
    bmp.width := image1.Picture.Width;
    bmp.height := image1.Picture.Height;
    bmp.canvas.Draw(0, 0, image1.Picture.Graphic);
    bmp.SaveToFile(GetTempDirectory + 'QNsystem.bmp');
    image2.Picture.LoadFromFile(GetTempDirectory + 'QNsystem.bmp');
    il1.Add(image2.Picture.Bitmap, image2.Picture.bitmap);

    qryCmd.Next;
  end;
  qryCmd.Close;
end;

{****************************************************************
* ��������:  BtnTypeClick
* ��������:  ���Ͱ�ť��Ӧ
* ����˵��:  Sender : TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.28 created by xzj
* �޸������� 2013.2.3 modified by xzj
*            ���Ӱ�ť��ɫ�ı书�ܣ���ǰ�����Ϊ��ɫ
*            2013.2.17 modified by xzj
*            �������ѡ������ǰһ�����ظ����ؿ�ݷ�ʽ
*            2013.2.18 modified by xzj
*            �޸�2.17���޸ĵĲ��ظ����أ��༭��ˢ������
*****************************************************************}
procedure TFormUse.BtnTypeClick(Sender : TObject);
var sqltxt : string;
begin
  keyValue := '';   //��ťֱ�Ӳ�ѯҪ�õĳ�ʼ��
  if ActiveControl.ClassType <> TRzBitBtn then
    Exit;
  if Copy(ActiveControl.Name,1,4) <> 'btn_' then
    Exit;

  sType := TRzBitBtn(Sender).Caption;
  if (sTypeLoadFlag = sType) and (isEditing = false) then
  begin
    tntpgcntrl2.ActivePage := pg3;
    Exit;
  end;
  //��ť��ɫ�ı�
  sTypeLoadFlag := sType;
  OldBtn.Font.Color := FONT_COLOR;
  OldBtn.ParentFont := True;
  TRzBitBtn(Sender).Font.Color := GROUP_COLOR;
  OldBtn := TRzBitBtn(Sender);

  if TRzBitBtn(Sender).Name = 'btn_0' then
  begin
    sqltxt := 'select * from PRO_LIST order by PRO_NAME';
  end
  else
  begin
    sqltxt := 'select * from PRO_LIST where PRO_TYPE = ''' + sType + ''' order by PRO_NAME';
  end;
  with qryCmd do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sqltxt);
    Open;
  end;
  sActiveBtn := sType;
  edtnow.Text := sActiveBtn;
  pg3.Caption := sActiveBtn;
  LoadShortcutKey(Sender);
  tntpgcntrl2.ActivePage := pg3;
end;

{****************************************************************
* ��������:  FormCreate
* ��������:  ���ݿ����ӣ����ط���
* ����˵��:  Sender : TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.29 created by xzj
*****************************************************************}
procedure TFormUse.FormCreate(Sender: TObject);
var
  sDir, connTmp: string;
begin
  getdir(0, sPath);
  sDir := ExtractFilePath(Application.ExeName);
  chDir(sDir); // ���ù���Ŀ¼Ϊ����Ŀ¼��
  SetCurrentDir(sDir);
  connTmp := 'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=' + sDir + '\LIST.accdb;Persist Security Info=False';

  con1.ConnectionString := connTmp;
  con1.Open;

  TOP := 0;
  LEFT := 0;
  FormUse.Width := screen.Width div 2 - 20;
  FormUse.Height := screen.Height - 32;
  tntpgcntrl2.Align := alclient;
  lvPro.Align := alclient;
  InitForm();
  QNLoadType; //�������Ͱ�ť
end;

{****************************************************************
* ��������:  tmr1Timer
* ��������:  ��겻����������ʱ�Զ����ؽ���
* ����˵��:  Sender : TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.29 created by xzj
* �޸�����:  2013.2.1 modified by xzj
*            ���ӷ��������ݷ�ʽ����
*****************************************************************}
procedure TFormUse.tmr1Timer(Sender: TObject);
var
  rc: TRECT;
  pt: TPOINT;
begin
  if isEditing = True then
  begin
    Exit;
  end;
  GetWindowRect(self.Handle, rc);         //ȡ����ľ�������
  GetCursorPos(pt);                       //ȡ�õ�ǰ�������λ��
  if (not PtInRect(rc, pt)) then          //�����겻�ڴ��巶Χ��
  begin
    if (HIDE_DIRECTION = '��������') then          //���Ŀǰ��������������Ļ���أ����������ش���
    begin
      Top := 0 - Height + 2;
    end
    else if (HIDE_DIRECTION = '��������') then
    begin
      Top := Screen.Height - 2;
    end
    else if (HIDE_DIRECTION = '��������') then
    begin
      Left := 0 - Self.Width + 2;
      Top := 0;
    end
    else
    begin
      Left := Screen.Width - 2;
      Top := 0;
    end;
    Tmr1.Enabled := False;      //�������غ�ʱ���ر�
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //�������Ƶ���ǰ
  end;
end;

{****************************************************************
* ��������:  edtAddKeyPress
* ��������:  �����·��飬ʹ�ûس�����ť�¼����޸����ݿ�����
* ����˵��:  Sender: TObject; var Key: Char
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.29 created by xzj
* �޸�����:  2013.2.1 modified by xzj
*            ���Ʒ�������Ϊ��
*****************************************************************}
procedure TFormUse.edtAddKeyPress(Sender: TObject; var Key: Char);
var sqltxt : string;
begin
  if Key = #13 then
  begin
    if edtAdd.Text = '' then
    begin
      ShowMessagePos('��������Ϊ��',(Self.Left + 250),(Self.Top + 300));
      exit;
    end;

    sqltxt := 'select * from PRO_TYPE where PRO_TYPE = ''' + edtAdd.Text + ''' ';
    with qryCmd do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sqltxt);

      Open;
    end;
    if(qryCmd.RecordCount > 0) then
    begin
      ShowMessagePos('�Ѵ�����Ϊ' + edtAdd.Text + '�����',(Self.Left + 250),(Self.Top + 300));
      exit;
    end;
    sqltxt := 'insert into PRO_TYPE(PRO_TYPE) values(''' + edtAdd.Text + ''') ';
    with qryCmd do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sqltxt);

      ExecSQL;
    end;
    edtAdd.Text := '���س���ȷ��';
    QNLoadType;   //���¼��ط���
  end;
end;

{****************************************************************
* ��������:  tntmntmAddClick
* ��������:  �����·��飬��ʾ�����
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.29 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmAddClick(Sender: TObject);
begin
  tntpgcntrl1.visible := True;
  tntpgcntrl1.activepage := pg1;
  edtAdd.SetFocus;
end;

{****************************************************************
* ��������:  edtEdtKeyPress
* ��������:  �޸ķ��飬ʹ�ûس�����ť�¼����޸����ݿ�����
* ����˵��:  Sender: TObject; var Key: Char
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.29 created by xzj
*****************************************************************}
procedure TFormUse.edtEdtKeyPress(Sender: TObject; var Key: Char);
var sqltxt,sqlEdtType,sqlEdtList : string;
begin
  if sActiveBtn = '' then
  begin
    ShowMessagePos('��ѡ��Ҫ�޸ĵ����',(Self.Left + 250),(Self.Top + 300));
    exit;
  end;
  sqlEdtType := 'update PRO_TYPE set PRO_TYPE = ''' + edtEdt.Text +''' where PRO_TYPE = ''' + sActiveBtn + ''' ';
  sqlEdtList := 'update PRO_LIST set PRO_TYPE = ''' + edtEdt.Text +''' where PRO_TYPE = ''' + sActiveBtn + ''' ';
  if Key = #13 then
  begin
    if edtEdt.Text = '' then
    begin
      ShowMessagePos('��������Ϊ��',(Self.Left + 250),(Self.Top + 300));
      exit;
    end;
    sqltxt := 'select * from PRO_TYPE where PRO_TYPE = ''' + edtEdt.Text + ''' ';
    Openqry(qrycmd,sqltxt);
    if(qryCmd.RecordCount > 0) then
    begin
      ShowMessagePos('�Ѵ�����Ϊ' + edtEdt.Text + '�����',(Self.Left + 250),(Self.Top + 300));
      exit;
    end
    else
    begin
      Execqry(qryCmd,sqlEdtType);
      Execqry(qrycmd,sqlEdtList);
    end;
    edtAdd.Text := '���س���ȷ��';
    QNLoadType;  //���¼��ط���
  end;
end;

{****************************************************************
* ��������:  tntmntmqxClick
* ��������:  ȡ���������������Ӻ��޸ĵ�page
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.29 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmqxClick(Sender: TObject);
begin
  tntpgcntrl1.visible := False;
end;

{****************************************************************
* ��������:  lvProDblClick
* ��������:  ˫����ݷ�ʽ������Ӧ�ĳ���
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
* �޸�����:
*            2013.1.31 modified by xzj
*            ���ڱ༭״̬�������г���
*****************************************************************}
procedure TFormUse.lvProDblClick(Sender: TObject);
var sActive,sqltxt : string;
begin

  if not Assigned(lvPro.Selected) then  //û��ѡ�п�ݷ�ʽ��������Ч
  begin
    Exit;
  end
  else if isEditing = True then
  begin
    ShowMessagePos('���ڴ��ڱ༭״̬�����˳��༭',(Self.Left + 250),(Self.Top + 300));
    exit;
  end
  else
  begin
    //��ȡ��ѡ�еĿ�ݷ�ʽ�����ݿ��ж�Ӧ��ID
    sActive := IntToStr(anID[lvPro.Selected.ImageIndex]);
    //��ѯ��Ӧ�Ŀ�ݷ�ʽ��¼
    sqltxt := 'select * from PRO_LIST where ID = ' + sActive + '';
    Openqry(qryCmd,sqltxt);
    //�ҵ���¼�еĿ�ݷ�ʽ·������.exe�ļ�
    ShellExecute(handle, 'open', pchar(Trim(qryCmd.FieldByName('PRO_PATH').Value)), nil, nil, SW_SHOWNORMAL);

    //���г�������ش���
    if (HIDE_DIRECTION = '��������') then          
    begin
      Top := 0 - Height + 2;
    end
    else if (HIDE_DIRECTION = '��������') then
    begin
      Top := Screen.Height - 2;
    end
    else if (HIDE_DIRECTION = '��������') then
    begin
      Left := 0 - Self.Width + 2;
      Top := 0;
    end
    else
    begin
      Left := Screen.Width - 2;
      Top := 0;
    end;
    //�������غ�ʱ���ر�
    Tmr1.Enabled := False;
  end;
end;

{****************************************************************
* ��������:  tntmntmTailClick
* ��������:  �޸Ĳ鿴��ʽΪ�����顯
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmTailClick(Sender: TObject);
begin
  lvPro.ViewStyle := vsSmallIcon;
  tntmntmTail.Checked := True;
  tntmntmList.Checked := False;
  tntmntmdefault.Checked := False;
end;

{****************************************************************
* ��������:  tntmntmListClick
* ��������:  �޸Ĳ鿴��ʽΪ���б���
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmListClick(Sender: TObject);
begin
  lvPro.ViewStyle := vsList;
  tntmntmTail.Checked := False;
  tntmntmList.Checked := True;
  tntmntmdefault.Checked := False;
end;

{****************************************************************
* ��������:  tntmntmdefaultClick
* ��������:  �޸Ĳ鿴��ʽΪ��Ĭ�ϡ�
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmdefaultClick(Sender: TObject);
begin
  lvPro.ViewStyle := vsIcon;
  tntmntmTail.Checked := False;
  tntmntmList.Checked := False;
  tntmntmdefault.Checked := True;
end;

{****************************************************************
* ��������:  tntmntmEdtProClick
* ��������:  ����༭״̬�����ñ༭׼��
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmEdtProClick(Sender: TObject);
begin
  //��ֹ�û���ε���༭��ť
  if isEditing = True then
  begin
    Exit;
  end;
  tntmntmEdtPro.Checked := True;
  //��ʾ����༭״̬
  isEditing := True;
  //�����ɫ����ʾ�û������Ǳ༭״̬
  lvPro.Color := EDITING_COLOR;
  if  tntmntmEdtPro.Checked = True then
  begin
    //��ݷ�ʽ����ɱ༭״̬
    lvPro.ReadOnly := False;
    //���ӿ�ݷ�ʽʱʹ����ҷ��ʽ
    LWindowProc := lvPro.WindowProc;
    lvPro.WindowProc := LBWindowProc;
    DragAcceptFiles(lvPro.Handle, True);
    //ɾ����ť����
    tntmntmDelPro.Enabled := True;
    //��ɰ�ť����
    tntmntmWc.Enabled := True;
    //ɾ�����а�ť����
    tntmntmdelall.Enabled := True;
  end;
  if tntmntmhide.Checked = True then
    tntmntmhide.Click;
  tntmntmhide.Enabled := False;
end;

{****************************************************************
* ��������:  tntmntmWcClick
* ��������:  �༭��ɣ����������༭״̬�෴
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmWcClick(Sender: TObject);
begin
  lvPro.Color := SYS_COLOR;
  lvPro.ParentColor := True;
  //lvPro.ParentFont := True;
  isEditing := False;
  tntmntmEdtPro.Checked := False;
  tntmntmDelPro.Enabled := False;
  tntmntmWc.Enabled := False;
  tntmntmdelall.Enabled := False;
  lvPro.ReadOnly := True;
  tntmntmhide.Enabled := True;
  //�ر���ҷ
  lvPro.WindowProc := LWindowProc;
  DragAcceptFiles(lvPro.Handle, False);
end;

{****************************************************************
* ��������:  tntmntmEdtProClick
* ��������:  ȡ������ӵ�Ŀ���ļ�
* ����˵��:  const linkname: string
* �� �� ֵ:  string
* ��ʷ��¼:  2013.1.30 created by xzj
*****************************************************************}
function ExeFromLink(const linkname: string): string;
var
  link: IShellLink;
  storage: IPersistFile;
  filedata: TWin32FindData;
  buf: array[0..MAX_PATH] of Char;
  widepath: WideString;
begin
  OleCheck(CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER, IShellLink, link));
  OleCheck(link.QueryInterface(IPersistFile, storage));
  widepath := linkname;
  Result := '��Ч�Ŀ�ݷ�ʽ�����������ʧЧ��';
  if Succeeded(storage.Load(@widepath[1], STGM_READ)) then
    if Succeeded(link.Resolve(GetActiveWindow, SLR_NOUPDATE)) then
      if Succeeded(link.GetPath(buf, sizeof(buf), filedata, SLGP_UNCPRIORITY)) then
        Result := buf;
  storage := nil;
  link := nil;
end;

{****************************************************************
* ��������:  LBWindowProc
* ��������:  ������ҷ
* ����˵��:  Message: TMessage
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.LBWindowProc(var Message: TMessage);
begin
  if Message.Msg = WM_DROPFILES then
    WMDROPFILES_l(Message);
  LWindowProc(Message);
end;

{****************************************************************
* ��������:  WMDROPFILES_L
* ��������:  ���ӿ�ݷ�ʽ
* ����˵��:  Message: TMessage
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.WMDROPFILES_L(var Msg: TMessage);
var
  pcFileName: PChar;
  i, iSize, iFileCount: integer;
  v_ps: string;
  sCutPath : string;
  sCutName : string;
  sqltxt : string;
begin
  pcFileName := '';
  iFileCount := DragQueryFile(Msg.wParam, $FFFFFFFF, pcFileName, 255);
  for i := 0 to iFileCount - 1 do
  begin
    iSize := DragQueryFile(Msg.wParam, i, nil, 0) + 1;
    pcFileName := StrAlloc(iSize);
    DragQueryFile(Msg.wParam, i, pcFileName, iSize);
//    if FileExists(pcFileName) then  //�ж��Ƿ����
    v_ps := pcFileName;

    StrDispose(pcFileName);
  end;
  DragFinish(Msg.wParam);

  //Delphiȡ��ݷ�ʽ��Ŀ��·��
  if LowerCase(ExtractFileExt(v_ps)) = '.lnk' then //�ж��Ƿ�Ϊ��ݺ�׺�ļ�
    sCutPath := ExeFromLink(v_ps)
  else
    sCutPath := LowerCase(v_ps);
  sCutName := ExtractFilename(sCutPath);
  sqltxt := 'insert into PRO_LIST(PRO_TYPE,PRO_NAME,PRO_PATH) '
          + 'values(''' + sActiveBtn + ''', ''' + copy(sCutName, 1, pos(ExtractFileExt(sCutName), sCutName) - 1) + ''', ''' + sCutPath + ''') ';
  Execqry(qryCmd,sqltxt);
  //ʹ������ƶ��¼�ˢ��
  lvPro.Tag := 1;
end;

{****************************************************************
* ��������:  tntmntmDelProClick
* ��������:  ɾ����ݷ�ʽ
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmDelProClick(Sender: TObject);
var sqltxt : string;
begin
  if not Assigned(lvPro.Selected) then
  begin
    Exit;
  end;

  sqltxt := 'delete from PRO_LIST where ID = ' + IntToStr(anID[lvPro.Selected.ImageIndex]) + ' ';
  Execqry(qryCmd,sqltxt);
  //ʹ������ƶ��¼�ˢ��
  lvPro.Tag := 1;
end;

{****************************************************************
* ��������:  FormShow
* ��������:  ���ý�������ʼ״̬
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
* �޸������� 2013.2.1 modified by xzj
*            ��������򿪻�����������˵���ť����������ѡ��
*            2013.2.21 modified by xzj
*            ����������ĳ�ʼ��
*****************************************************************}
procedure TFormUse.FormShow(Sender: TObject);
var
  reg : TRegistry;
  isExist : Boolean;
begin
  ActiveControl := abtnType[1];
  abtnType[1].click;
  tntpgcntrl2.ActivePage := pg3;
  pg3.Caption := sActiveBtn;
  rztrycn1.Hint := 'ǳŵ�����������v1.0';
  GetSystemPath();

  Reg := Tregistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', True);
  isExist := reg.ValueExists('ǳŵ�����������v1.0');
  if isExist = True then
  begin
    tntmntmAutoOpen.Checked := True;
  end
  else
  begin
    tntmntmAutoOpen.Checked := False;
  end;

  lblName.Font.Size := 20;
  AddInitForm();
  //skndt1.LoadFromCollection(sknstr1,4);
  //skndt1.Active := True;
end;

{****************************************************************
* ��������:  tntmntmEditClick
* ��������:  ��ʾ�޸ķ����
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmEditClick(Sender: TObject);
begin
  tntpgcntrl1.visible := True;
  pg2.Visible := True;
  tntpgcntrl1.activepage := pg2;
  pg1.Visible := False;
  edtnow.Text := sActiveBtn;
  edtEdt.SetFocus;
end;

{****************************************************************
* ��������:  tntmntmdeleteClick
* ��������:  ɾ����ѡ�з���
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmdeleteClick(Sender: TObject);
var sqltxt : string;
begin
  if Application.MessageBox(System.Pchar('�Ƿ�Ҫɾ��' + sActiveBtn + '?'), 'ѯ��', 1 + 32) = id_OK then
  begin
    sqltxt := 'delete from PRO_TYPE where PRO_TYPE = ''' + sActiveBtn + ''' ';

    with qryCmd do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from PRO_LIST where PRO_TYPE = ''' + sActiveBtn + ''' ');
      Open;

      if IsEmpty then
      begin
        Close;
        SQL.Clear;
        SQL.Add(sqltxt);
        ExecSQL;
      end
      else
      begin
        ShowMessagePos('Ҫɾ����������г��򣬲���ɾ����',(Self.Left + 250),(Self.Top + 300));
      end;
    end;
    QNLoadType;
    ActiveControl := abtnType[1];
    abtnType[1].Click;
    pg3.Caption := abtnType[1].Caption;
  end;
end;

{****************************************************************
* ��������:  tntmntmhideClick
* ��������:  ��ʾ�����ط���
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmhideClick(Sender: TObject);
var sqltxt : string;
begin
  if tntmntmhide.Checked = True then
  begin
    tntmntmhide.Checked := False;
    tntscrlbxType.Visible := True;
    sqltxt := 'update PRO_SET set SHOW_TYPE = True where ID = 1 ';
  end
  else
  begin
    tntmntmhide.Checked := True;
    tntscrlbxType.Visible := False;
    sqltxt := 'update PRO_SET set SHOW_TYPE = False where ID = 1 ';
  end;
  Execqry(qryCmd,sqltxt);
  if tntmntmTail.Checked = True then
  begin
    tntmntmList.Click;
    tntmntmTail.Click;
  end
  else if tntmntmList.Checked = True then
  begin
    tntmntmTail.Click;
    tntmntmList.Click;
  end
  else
  begin
    tntmntmList.Click;
    tntmntmdefault.Click;
  end;
end;

{****************************************************************
* ��������:  lvProMouseMove
* ��������:  ��ʾ�����������޸Ŀ�ݷ�ʽ��ˢ��
* ����˵��:  Sender: TObject; Shift: TShiftState; X,Y: Integer
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.31 created by xzj
* �޸�����:  2013.2.21 modified by xzj
*            ��������϶�����Ч��
*****************************************************************}
procedure TFormUse.lvProMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var i : Integer;
begin
  if isEditing = False then
  begin
    lvPro.Hint := '˫��ͼ��ɴ��ļ�';
  end
  else
  begin
    lvPro.Hint := '����ݷ�ʽ���뱾�򼴿�����';


    //�޸Ŀ�ݷ�ʽ��ˢ��
    if(lvPro.Tag = 1) then
    begin
        for i := 1 to 49 do
        begin
          if abtnType[i] <> nil then
          begin
            if abtnType[i].Caption = sActiveBtn then
            begin
              ActiveControl := abtnType[i];
              abtnType[i].Click;
              Break;
            end;
          end;
        end;
        lvPro.Tag := 0;
    end;
    
  end;
    lvPro.ShowHint := True;
    {
  //��ȡ��ǰ���뷨
  hInNow := GetKeyboardLayout(0);
  for i := 0 to Screen.Imes.Count - 1 do
  begin
    if HKL(Screen.Imes.Objects[i]) = hInNow then
    begin
      //ShowMessage(Screen.Imes.Strings[i]);
      Break;
    end;
  end;
  }
  //�϶�����
  if (ssleft in Shift) then
  begin
    ReleaseCapture;
    Perform(WM_syscommand, $F012, 0);
  end;
end;

{****************************************************************
* ��������:  tntmntmdelallClick
* ��������:  ɾ�����еĿ�ݷ�ʽ������ʼ�����ݿ��
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.31 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmdelallClick(Sender: TObject);
var sqltxt : string;
begin
  if Application.MessageBox(System.Pchar('�Ƿ�Ҫɾ�����г���?'), 'ѯ��', 1 + 32) = id_OK then
  begin
    sqltxt := 'delete from PRO_LIST';
    Execqry(qryCmd,sqltxt);
    sqltxt := 'Alter table[PRO_LIST] Alter column[ID] counter(1,1) ';
    Execqry(qryCmd,sqltxt);
    lvPro.Clear;
  end;
end;

{****************************************************************
* ��������:  tntmntmdelalltypeClick
* ��������:  ɾ�����еķ��飬����ʼ�����ݿ��
* ����˵��:  Sender: TObject
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.31 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmdelalltypeClick(Sender: TObject);
var sqltxt : string;
begin
  if Application.MessageBox(System.Pchar('�Ƿ�Ҫɾ�����з���?'), 'ѯ��', 1 + 32) = id_OK then
  begin
    sqltxt := 'select * from PRO_LIST';
    Openqry(qryCmd, sqltxt);
    if qryCmd.IsEmpty then
    begin
      sqltxt := 'delete from PRO_TYPE';
      Execqry(qryCmd,sqltxt);
      sqltxt := 'Alter table[PRO_TYPE] Alter column[ID] counter(1,1) ';
      Execqry(qryCmd,sqltxt);
      lvPro.Clear;
    end
    else
    begin
      ShowMessagePos('���п�ݷ�ʽ����������ɾ�����С�����',(Self.Left + 250),(Self.Top + 300));
    end;
  end;
  QNLoadType;
  ActiveControl := abtnType[1];
  abtnType[1].Click;
  pg3.Caption := abtnType[1].Caption;
end;

{****************************************************************
* ��������:  lvProEdited
* ��������:  �޸Ŀ�ݷ�ʽ����
* ����˵��:  Sender: TObject; Item: TTntListItem;var S: WideString
*            ����S�����޸ĺ������
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.31 created by xzj
*****************************************************************}
procedure TFormUse.lvProEdited(Sender: TObject; Item: TTntListItem;
  var S: WideString);
  var sActiveID,sqltxt : string;
begin
  //lvPro.Tag := 1;
  sActiveID := IntToStr(anID[lvPro.Selected.ImageIndex]);
  sqltxt := 'update PRO_LIST set PRO_NAME = ''' + S + ''' where ID = ' + sActiveID + ' ';
  Execqry(qryCmd,sqltxt);
end;

{****************************************************************
* ��������:  Get_HZPY_First
* ��������:  ��ȡ����ƴ������ĸ
* ����˵��:  hz : string
* �� �� ֵ:  Char
* ��ʷ��¼:  2013.1.31 created by xzj
*****************************************************************}
function Get_HZPY_First(hz : string) : Char;
begin
  case WORD(hz[1])shl 8 + WORD(hz[2]) of
    $B0A1..$B0C4 : Result := 'a';
    $B0C5..$B2C0 : Result := 'b';
    $B2C1..$B4ED : Result := 'c';
    $B4EE..$B6E9 : Result := 'd';
    $B6EA..$B7A1 : Result := 'e';
    $B7A2..$B8C0 : Result := 'f';
    $B8C1..$B9FD : Result := 'g';
    $B9FE..$BBF6 : Result := 'h';
    $BBF7..$BFA5 : Result := 'j';
    $BFA6..$C0AB : Result := 'k';
    $C0AC..$C2E7 : Result := 'l';
    $C2E8..$C4C2 : Result := 'm';
    $C4C3..$C5B5 : Result := 'n';
    $C5B6..$C5BD : Result := 'o';
    $C5BE..$C6D9 : Result := 'p';
    $C6DA..$C8BA : Result := 'q';
    $C8BB..$C8F5 : Result := 'r';
    $C8F6..$CBF9 : Result := 's';
    $CBFA..$CDD9 : Result := 't';
    $CDDA..$CEF3 : Result := 'w';
    $CEF4..$D1B8 : Result := 'x';
    $D1B9..$D4D0 : Result := 'y';
    $D4D1..$D7F9 : Result := 'z';
  else
    //�����Ϊ���ֻ���ĸ��ԭ������
    Result := hz[1];
  end;
end;

{****************************************************************
* ��������:  lvProKeyPress
* ��������:  ����֮�����
* ����˵��:  Sender: TObject; var Key: Char
* �� �� ֵ:  ��
* ��ʷ��¼:  2013.1.31 created by xzj
*****************************************************************}
procedure TFormUse.lvProKeyPress(Sender: TObject; var Key: Char);
var sActiveName,sSelect : string;
    i,j : Integer;
    nIsReg : Boolean;    //�Ա��Ƿ����
begin
  if isEditing = True then
  begin
    Exit;
  end;
  nIsReg := False;
  keyValue := keyValue + Key;
  //�س������г���
  if Key = #13 then
  begin
    lvProDblClick(Sender);
  end
  else
  begin
    tmrRe.Enabled := True;  //�򿪼�ʱ��
    
    for i := 0 to lvPro.Items.Count - 1 do
    begin
      for j := 0 to Length(lvPro.Items.Item[i].Caption) do
      begin
        sActiveName := Copy(lvPro.Items.Item[i].Caption,j + 1,1);
        if(sActiveName = '') then
        begin
          Break;
        end;
        sSelect := sSelect + LowerCase(Get_HZPY_First(sActiveName));
        if(sSelect = keyValue) then
        begin
          nIsReg := True;
          lvPro.Items.Item[i].Selected := True;
          Break;
        end;
        //���ȳ������������ĸ��ֱ���˳�ѭ�����Ż�
        if(Length(sSelect) > Length(keyValue)) then
        begin
          Break;
        end;
      end;
      if(sSelect <> KeyValue) then
      begin
        sSelect := '';
      end;
      if nIsReg then
      begin
        break;
      end;
    end;
  end;
  
  if nIsReg = False then
  begin
    keyValue := '';
  end;
end;

{****************************************************************
* ��������: CreateLink
* ��������: ���������ݷ�ʽ
* ����˵��: programPath��Ŀ���ļ�ȫ·��  programArg��Ŀ���ļ�����
*           LinkPath����ݷ�ʽȫ·��     Descr:��ݷ�ʽ����
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.1 created by xzj
****************************************************************}
procedure TFormUse.CreateLink(programPath,programArg,LinkPath,Descr : string);
var
  AnObj : IUnknown;
  ShellLink : IShellLink;
  AFile : IPersistFile;
  FileName : WideString;
begin
  if UpperCase(ExtractFileExt(LinkPath)) <> '.LNK' then
  begin
    raise Exception.Create('��ݷ�ʽ��Ч��');
  end;
  try
    OleInitialize(nil);
    AnObj := CreateComObject(CLSID_ShellLink);
    ShellLink := AnObj as IShellLink;
    AFile := AnObj as IPersistFile;
    ShellLink.SetPath(PChar(programPath));
    ShellLink.SetArguments(PChar(programArg));
    ShellLink.SetWorkingDirectory(PChar(ExtractFilePath(programPath)));
    ShellLink.SetDescription(PChar(Descr));
    FileName := LinkPath;
    AFile.Save(PWChar(FileName),True);
  finally
    OleUninitialize;
  end;
end;

{****************************************************************
* ��������: tntmntmSendLinkClick
* ��������: ���������ݷ�ʽ��Ӧ
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.1 created by xzj
****************************************************************}
procedure TFormUse.tntmntmSendLinkClick(Sender: TObject);
var
  tmp : array[0..MAX_PATH] of Char;
  pitem : PITEMIDLIST;
  DeskDir : string;
  sSelectID : string;
  sqltxt : string;
begin
  //��ȡ����·��
  SHGetSpecialFolderLocation(Handle,CSIDL_DESKTOP,pitem);
  SHGetPathFromIDList(pitem,tmp);
  DeskDir := string(tmp);
  if Length(DeskDir) > 3 then
  begin
    DeskDir := DeskDir + '\';
  end;
  if not Assigned(lvPro.Selected) then
  begin
    CreateLink(ParamStr(0),'',DeskDir + Application.Title + '.lnk','');
  end
  else
  begin
    //��ȡ��ǰ�񽹵Ŀ�ݷ�ʽID
    sSelectID := IntToStr(anID[lvPro.Selected.ImageIndex]);
    //��ȡ��ǰ�񽹵Ŀ�ݷ�ʽ����
    sqltxt := 'select * from PRO_LIST where ID = ' + sSelectID + ' ';
    Openqry(qryCmd, sqltxt);
    //���������ݷ�ʽ
    CreateLink(qryCmd.fieldbyname('PRO_PATH').AsString,'',DeskDir + lvPro.Selected.Caption + '.lnk','');
  end;
end;

{****************************************************************
* ��������: tntmntmSendAllClick
* ��������: ���͵�ǰ�����µ����������ݷ�ʽ������
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.2 created by xzj
****************************************************************}
procedure TFormUse.tntmntmSendAllClick(Sender: TObject);
var
  tmp : array[0..MAX_PATH] of Char;
  pitem : PITEMIDLIST;
  DeskDir : string;
  sqltxt : string;
  i : Integer;
begin
  //��ȡ����·��
  SHGetSpecialFolderLocation(Handle,CSIDL_DESKTOP,pitem);
  SHGetPathFromIDList(pitem,tmp);
  DeskDir := string(tmp);
  if Length(DeskDir) > 3 then
  begin
    DeskDir := DeskDir + '\';
  end;
  if sActiveBtn = '���г���' then
  begin
    sqltxt := 'select * from PRO_LIST order by ID';
  end
  else
  begin
    sqltxt := 'select * from PRO_LIST where PRO_TYPE = ''' + sActiveBtn + ''' order by ID ';
  end;
  Openqry(qryCmd,sqltxt);
  qryCmd.First;
  for i := 0 to qryCmd.RecordCount - 1 do
  begin
    //���������ݷ�ʽ
    CreateLink(qryCmd.fieldbyname('PRO_PATH').AsString,'',DeskDir + qryCmd.fieldbyname('PRO_NAME').AsString + '.lnk','');
    qryCmd.Next;
  end;
end;

{****************************************************************
* ��������: GetSystemPath
* ��������: ����ϵͳ�̷�
* ����˵��: ��
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.1 created by xzj
****************************************************************}
procedure TFormUse.GetSystemPath();
var
  i : Integer;
  nRand : Integer;
  newMenu : TMenuItem;
  str : string;
  nRes : Integer;
begin
  Randomize;
  for i := 65 to 90 do
  begin
    nRes := GetDriveType(PChar(Chr(i) + ':\'));
    if(nRes = 2) or (nRes = 3)  then
    begin
      nRand := Random(97) + 1;
      str := Char(i);
      newMenu := TMenuItem.Create(self);
      newMenu.Caption := str + '��';
      newMenu.Bitmap.LoadFromFile('emotions\' + IntToStr(nRand) + 'fixed.bmp');
      newMenu.Name := str;
      newMenu.OnClick := MenuBtnOnClick;
      tntpmnPC.Items.Add(newMenu);
    end;
  end;
end;

{****************************************************************
* ��������: MenuBtnOnClick
* ��������: �̷���ť��Ӧ�¼�
* ����˵��: ��
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.1 created by xzj
****************************************************************}
procedure TFormUse.MenuBtnOnClick(Sender : TObject);
var
  nClickBtn : string;
begin
     nClickBtn := TMenuItem(Sender).Caption;
     nClickBtn := Copy(nClickBtn,1,1);
     nClickBtn := nClickBtn + ':\';

    //��ָ��·��
    ShellExecute(handle, 'open', pchar(nClickBtn), nil, nil, SW_SHOWNORMAL);
    //���г�������ش���
    if (HIDE_DIRECTION = '��������') then          
    begin
      Top := 0 - Height + 2;
    end
    else if (HIDE_DIRECTION = '��������') then
    begin
      Top := Screen.Height - 2;
    end
    else if (HIDE_DIRECTION = '��������') then
    begin
      Left := 0 - Self.Width + 2;
      Top := 0;
    end
    else
    begin
      Left := Screen.Width - 2;
      Top := 0;
    end;
    //�������غ�ʱ���ر�
    Tmr1.Enabled := False;
end;

{****************************************************************
* ��������: btn1Click
* ��������: �رռ����
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.1 created by xzj
****************************************************************}
procedure TFormUse.btn1Click(Sender: TObject);
begin
  if Application.MessageBox(System.Pchar('�رռ����?'), 'ѯ��', 1 + 32) = id_OK then
  begin
    ShellExecute(Handle,'open','shutdown.exe','-f -s -t 0', nil, SW_HIDE);
  end;
end;

{****************************************************************
* ��������: tntmntmCloseClick
* ��������: �رճ���
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.1 created by xzj
****************************************************************}
procedure TFormUse.tntmntmCloseClick(Sender: TObject);
begin
  close;
end;

{****************************************************************
* ��������: tmr2Timer
* ��������: ��ǩ��ɫ����������
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.1 created by xzj
****************************************************************}
{
procedure TFormUse.tmr2Timer(Sender: TObject);
var
  sColor : array[1..10] of Tcolor;
  i : Integer;
begin
  Randomize;
  sColor[1] := clYellow;
  sColor[2] := clLime;
  sColor[3] := clPurple;
  sColor[4] := clMaroon;
  sColor[5] := clGreen;
  sColor[6] := clAqua;
  sColor[7] := clWhite;
  sColor[8] := clBlue;
  sColor[9] := clInactiveCaption;
  sColor[10] := clRed;
  i := Random(10) + 1;
  lblName.Font.Color := sColor[i];
  i := Random(10) + 1;
  lbl1.Font.Color := sColor[i];
  btn1.Font.Color := sColor[i];
  i := Random(10) + 1;
  lbl2.Font.Color := sColor[i];
  btnPC.Font.Color := sColor[i];

  //i := Random(10) + 1;
  //if (i = 7) or (sActiveBtn = '���г���') then
  //  Exit;
  //lvPro.Font.Color := clRed;
  //tntscrlbxType.Font.Color := clRed;

end;
}
{****************************************************************
* ��������: tntmntmAutoOpenClick
* ��������: ����������
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.1 created by xzj
****************************************************************}
procedure TFormUse.tntmntmAutoOpenClick(Sender: TObject);
var
  reg: tregistry;
begin
//�ѳ���д�뵽ע�����������
  if not tntmntmAutoOpen.Checked then
  begin
    Reg := Tregistry.Create;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    try

      reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', True);
      Reg.WriteString('ǳŵ�����������v1.0', ExtractFilePath(Application.ExeName) + 'QnDeskMng.exe');
      tntmntmAutoOpen.Checked := True;
    finally
      Reg.closekey;
      reg.Free;
    end;
  end
  else
  begin
    Reg := Tregistry.Create;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    try
      reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', True);
      Reg.DeleteValue('ǳŵ�����������v1.0');
      tntmntmAutoOpen.Checked := False;
    finally
      Reg.closekey;
      reg.Free;
    end;
  end;
end;

{****************************************************************
* ��������: tmr3Timer
* ��������: ��ʾ��ǰʱ��
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.2 created by xzj
****************************************************************}
procedure TFormUse.tmr3Timer(Sender: TObject);
begin
  edtTime.Text := FormatDateTime('yyyy��mm��dd��hhʱnn��ss��',Now());
end;

{****************************************************************
* ��������: tmrReTimer
* ��������: ˢ�µ�ǰ��ֵ
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.2 created by xzj �����������ѯ�ļ�ֵ�������⣩
****************************************************************}
procedure TFormUse.tmrReTimer(Sender: TObject);
begin
  keyValue := '';

  //�رռ�ʱ��
  tmrRe.Enabled := False;
end;

{****************************************************************
* ��������: tmrsxTimer
* ��������: ����ʾ������ͼ�꣬û��ѡ�п�ݷ�ʽ���÷��������ݷ�ʽ
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.2 created by xzj
* �޸ļ�¼: 2013.2.17 modified by xzj
*           ����������״̬ʱ�������Ƶ���ǰ
****************************************************************}
procedure TFormUse.tmrsxTimer(Sender: TObject);
begin
    //������ʾ������
  ShowWindow(Application.Handle,SW_HIDE);
  
  //û��ѡ�п�ݷ�ʽ���÷��������ݷ�ʽ
  if not Assigned(lvPro.Selected) then
  begin
    tntmntmSendLink.Enabled := False;
  end
  else
  begin
    tntmntmSendLink.Enabled := True;
  end;

  //��ʾ��ǰѡ�еĿ�ݷ�ʽ
  if Assigned(lvPro.Selected) then
    edtKeyNow.Text := lvPro.Selected.Caption
  else
    edtKeyNow.Text := '��';

  //����������״̬ʱ�������Ƶ���ǰ
  if(Top = 0 - Height + 2) or ( Top = Screen.Height - 2) or (Left = 0 - Self.Width + 2) or (Left = Screen.Width - 2) then
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //�������Ƶ���ǰ
end;

{****************************************************************
* ��������: cbbFCChange
* ��������: �޸Ĵ�����ɫ
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.6 created by xzj 
****************************************************************}
procedure TFormUse.cbbFCChange(Sender: TObject);
var
  sqltxt : string;
begin
  sqltxt := 'update PRO_SET set FORM_COLOR = ''' + ColorToString(cbbFC.SelectedColor) + ''' where ID = 1 ';
  Execqry(qrySet,sqltxt);
  Self.Color := cbbFC.SelectedColor;
  SYS_COLOR := cbbFC.SelectedColor;
end;

{****************************************************************
* ��������: cbbFONTCChange
* ��������: �޸�������ɫ
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.6 created by xzj
****************************************************************}
procedure TFormUse.cbbFONTCChange(Sender: TObject);
var
  sqltxt : string;
begin
  sqltxt := 'update PRO_SET set FONT_COLOR = ''' + ColorToString(cbbFONTC.SelectedColor) + ''' where ID = 1 ';
  Execqry(qrySet,sqltxt);
  Self.Font.Color := cbbFONTC.SelectedColor;
  FONT_COLOR := cbbFONTC.SelectedColor;
  lblName.ParentFont := True;
  lblName.Font.Size := 20;
end;

{****************************************************************
* ��������: cbbGCChange
* ��������: �޸�ѡ�з����������ɫ
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.6 created by xzj
****************************************************************}
procedure TFormUse.cbbGCChange(Sender: TObject);
var
  sqltxt : string;
begin
  sqltxt := 'update PRO_SET set GROUP_COLOR = ''' + ColorToString(cbbGC.SelectedColor) + ''' where ID = 1 ';
  Execqry(qrySet,sqltxt);
  GROUP_COLOR := cbbGC.SelectedColor;
end;

{****************************************************************
* ��������: cbbECChange
* ��������: �޸ı༭״̬ʱ�������ɫ
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.6 created by xzj
****************************************************************}
procedure TFormUse.cbbECChange(Sender: TObject);
var
  sqltxt : string;
begin
  sqltxt := 'update PRO_SET set EDITING_COLOR = ''' + ColorToString(cbbEC.SelectedColor) + ''' where ID = 1 ';
  Execqry(qrySet,sqltxt);
  EDITING_COLOR := cbbEC.SelectedColor;
end;

{****************************************************************
* ��������: cbbFTChange
* ��������: �޸Ĵ�������
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.6 created by xzj
****************************************************************}
procedure TFormUse.cbbFTChange(Sender: TObject);
var
  //sFormStyle : string;
  sqltxt : string;
begin
  sqltxt := 'update PRO_SET set FORM_STYLE = ''' + cbbFT.Text + ''' where ID = 1 ';
  Execqry(qrySet,sqltxt);
  ShowMessagePos('��������Ч��',(Self.Left + 250),(Self.Top + 300));
  {
  sFormStyle := cbbFT.Text;
  if sFormStyle = 'bsNone' then
    Self.BorderStyle := bsNone
  else if sFormStyle = 'bsDialog' then
    Self.BorderStyle := bsDialog
  else if sFormStyle = 'bsSingle' then
    Self.BorderStyle := bsSingle
  else if sFormStyle = 'bsSizeable' then
    Self.BorderStyle := bsSizeable
  else if sFormStyle = 'bsSizeToolWin' then
    Self.BorderStyle := bsSizeToolWin
  else
    Self.BorderStyle := bsToolWindow;
  }
end;

{****************************************************************
* ��������: cbbHDChange
* ��������: �޸Ĵ������ط���
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.6 created by xzj
****************************************************************}
procedure TFormUse.cbbHDChange(Sender: TObject);
var
  sqltxt : string;
begin
  sqltxt := 'update PRO_SET set HIDE_DIRECTION = ''' + cbbHD.Text + ''' where ID = 1 ';
  Execqry(qrySet,sqltxt);
  HIDE_DIRECTION := cbbHD.Text;
end;

{****************************************************************
* ��������: cbbSHChange
* ��������: �����Ƿ���ʾ����
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.6 created by xzj
****************************************************************}
procedure TFormUse.cbbSHChange(Sender: TObject);
var
  sqltxt : string;
begin
  if Trim(cbbSH.Text) = '��' then
  begin
    sqltxt := 'update PRO_SET set SHOW_HELP = true where ID = 1 ';
    pg4.TabVisible := True;
  end
  else
  begin
    sqltxt := 'update PRO_SET set SHOW_HELP = False where ID = 1 ';
    pg4.TabVisible := False;
  end;
  Execqry(qrySet,sqltxt);
end;

{****************************************************************
* ��������: InitForm
* ��������: ��ʼ������
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.6 created by xzj
****************************************************************}
procedure TFormUse.InitForm();
var
  sFormStyle : string;
begin
  Openqry(qryInit,'select * from PRO_SET where ID = 1');
  SYS_COLOR := StringToColor(qryInit.fieldbyname('FORM_COLOR').AsString);
  self.Color := SYS_COLOR;
  FONT_COLOR := StringToColor(qryInit.fieldbyname('FONT_COLOR').AsString);
  Self.Font.Color := FONT_COLOR;
  EDITING_COLOR := StringToColor(qryInit.fieldbyname('EDITING_COLOR').AsString);
  GROUP_COLOR := StringToColor(qryInit.fieldbyname('GROUP_COLOR').AsString);
  if(qryInit.fieldbyname('SHOW_HELP').AsString = 'True') then
  begin
    pg4.TabVisible := True;
    cbbSH.Value := '��';
  end
  else
  begin
    pg4.TabVisible := False;
    cbbSH.Value := '��';
  end;



  sFormStyle := qryInit.fieldbyname('FORM_STYLE').AsString;
  if sFormStyle = 'bsNone' then
    Self.BorderStyle := bsNone
  else if sFormStyle = 'bsDialog' then
    Self.BorderStyle := bsDialog
  else if sFormStyle = 'bsSingle' then
    Self.BorderStyle := bsSingle
  else if sFormStyle = 'bsSizeable' then
    Self.BorderStyle := bsSizeable
  else if sFormStyle = 'bsSizeToolWin' then
    Self.BorderStyle := bsSizeToolWin
  else
    Self.BorderStyle := bsToolWindow;

  HIDE_DIRECTION := qryInit.fieldbyname('HIDE_DIRECTION').AsString;
  
  cbbFC.SelectedColor := SYS_COLOR;
  cbbFONTC.SelectedColor := FONT_COLOR;
  cbbGC.SelectedColor := GROUP_COLOR;
  cbbEC.SelectedColor := EDITING_COLOR;
  cbbFT.Value := sFormStyle;
  cbbHD.Value := HIDE_DIRECTION;
end;

{****************************************************************
* ��������: tntmntmexitClick
* ��������: �˳�����
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.18 created by xzj
****************************************************************}
procedure TFormUse.tntmntmexitClick(Sender: TObject);
begin
  close;
end;

{****************************************************************
* ��������: tntmntmHideZTClick
* ��������: ����״̬��
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.tntmntmHideZTClick(Sender: TObject);
var sqltxt : string;
begin
  if tntmntmHideZT.Checked = True then
  begin
    tntmntmHideZT.Checked := False;
    tntcntrlbr1.Visible := True;
    sqltxt := 'update PRO_SET set SHOW_TOOL = True where ID = 1 ';
  end
  else
  begin
    tntmntmHideZT.Checked := True;
    tntcntrlbr1.Visible := False;
    sqltxt := 'update PRO_SET set SHOW_TOOL = False where ID = 1 ';
  end;
  Execqry(qryCmd,sqltxt);
  if tntmntmTail.Checked = True then
  begin
    tntmntmList.Click;
    tntmntmTail.Click;
  end
  else if tntmntmList.Checked = True then
  begin
    tntmntmTail.Click;
    tntmntmList.Click;
  end
  else
  begin
    tntmntmList.Click;
    tntmntmdefault.Click;
  end;
end;

{****************************************************************
* ��������: tntmntmHideZTClick
* ��������: ���ذ汾��Ϣ
* ����˵��: Sender: TObject
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.tntmntmHideVClick(Sender: TObject);
var sqltxt : string;
begin
  if tntmntmHideV.Checked = True then
  begin
    tntmntmHideV.Checked := False;
    imglogo.Visible := True;
    grp1.Visible := True;
    sqltxt := 'update PRO_SET set SHOW_LOGO = True where ID = 1 ';
  end
  else
  begin
    tntmntmHideV.Checked := True;
    imglogo.Visible := False;
    grp1.Visible := False;
    sqltxt := 'update PRO_SET set SHOW_LOGO = False where ID = 1 ';
  end;
  Execqry(qryCmd,sqltxt);
  if tntmntmTail.Checked = True then
  begin
    tntmntmList.Click;
    tntmntmTail.Click;
  end
  else if tntmntmList.Checked = True then
  begin
    tntmntmTail.Click;
    tntmntmList.Click;
  end
  else
  begin
    tntmntmList.Click;
    tntmntmdefault.Click;
  end;
end;

{****************************************************************
* ��������: AddInitForm
* ��������: �汾��Ϣ�����顢״̬��������״����ʼ��
* ����˵��: ��
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.AddInitForm();
begin
  if(qryInit.FieldByName('SHOW_TYPE').AsString = 'True') then
  begin
    tntscrlbxType.Visible := True;
    tntmntmhide.Checked := False;
  end
  else
  begin
    tntscrlbxType.Visible := False;
    tntmntmhide.Checked := True;
  end;

  if(qryInit.FieldByName('SHOW_TOOL').AsString = 'True') then
  begin
    tntcntrlbr1.Visible := True;
    tntmntmHideZT.Checked := False;
  end
  else
  begin
    tntcntrlbr1.Visible := False;
    tntmntmHideZT.Checked := True;
  end;

  if(qryInit.FieldByName('SHOW_LOGO').AsString = 'True') then
  begin
    imglogo.Visible := True;
    tntmntmHideV.Checked := False;
    grp1.Visible := True;
  end
  else
  begin
    imglogo.Visible := False;
    tntmntmHideV.Checked := True;
    grp1.Visible := False;
  end;

  //��ʼ������͸����
  self.AlphaBlendValue := qryInit.fieldbyname('FORM_ABV').AsInteger;
  rztrckbr1.Position := qryInit.fieldbyname('FORM_ABV').AsInteger;

  //��ʼ����ݷ�ʽ������
  lvPro.Font.Charset := qryInit.fieldbyname('LV_FONT_CHARSET').AsInteger;
  lvPro.Font.Color := StringToColor(qryInit.fieldbyname('LV_FONT_COLOR').AsString);
  lvPro.Font.Name := qryInit.fieldbyname('LV_FONT_NAME').AsString;
  lvPro.Font.Size := qryInit.fieldbyname('LV_FONT_SIZE').AsInteger;
  lvPro.Font.Style := [];
  if qryInit.FieldByName('LV_FSB').AsBoolean = True then
  begin
    lvPro.Font.Style := lvPro.Font.Style + [fsBold];
  end;
  if qryInit.FieldByName('LV_FSI').AsBoolean = True then
  begin
    lvPro.Font.Style := lvPro.Font.Style + [fsItalic];
  end;
  if qryInit.FieldByName('LV_FSU').AsBoolean = True then
  begin
    lvPro.Font.Style := lvPro.Font.Style + [fsUnderline];
  end;
  btn2.Text := qryInit.fieldbyname('LV_FONT_NAME').AsString + ','
             + qryInit.fieldbyname('LV_FONT_SIZE').AsString + ','
             + qryInit.fieldbyname('LV_FONT_COLOR').AsString;
end;

{****************************************************************
* ��������: rztrckbr1Change
* ��������: ���ô���͸����
* ����˵��: Sender
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.rztrckbr1Change(Sender: TObject);
var sqltxt : string;
begin
  sqltxt := 'update PRO_SET set FORM_ABV = ' + IntToStr(rztrckbr1.Position);
  self.AlphaBlendValue := rztrckbr1.Position;
  Execqry(qryCmd,sqltxt);
end;

{****************************************************************
* ��������: FormMouseMove
* ��������: �����϶�
* ����˵��: Sender: TObject; Shift: TShiftState; X,Y: Integer
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (ssleft in Shift) then
  begin
    ReleaseCapture;
    Perform(WM_syscommand, $F012, 0);
  end;
end;

{****************************************************************
* ��������: imglogoMouseMove
* ��������: �����϶�
* ����˵��: Sender: TObject; Shift: TShiftState; X,Y: Integer
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.imglogoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  FormMouseMove(Sender,Shift,X,Y);
end;

{****************************************************************
* ��������: tntpnl1MouseMove
* ��������: �����϶�
* ����˵��: Sender: TObject; Shift: TShiftState; X,Y: Integer
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.tntpnl1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  FormMouseMove(Sender,Shift,X,Y);
end;

{****************************************************************
* ��������: grp2MouseMove
* ��������: �����϶�
* ����˵��: Sender: TObject; Shift: TShiftState; X,Y: Integer
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.grp2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  FormMouseMove(Sender,Shift,X,Y);
end;

{****************************************************************
* ��������: tntpgcntrl2Change
* ��������: ����������
* ����˵��: Sender
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.tntpgcntrl2Change(Sender: TObject);
begin
  if tntpgcntrl2.ActivePage = pg5 then
  begin
    grp2.Top := tntpnl1.Top + (tntpnl1.Height - grp2.Height) div 2;
    grp2.Left := tntpnl1.Left + (tntpnl1.Width - grp2.Width) div 2;
  end;
end;

{****************************************************************
* ��������: btn2ButtonClick
* ��������: ���ÿ�ݷ�ʽ������
* ����˵��: Sender
* �� �� ֵ: ��
* ��ʷ��¼: 2013.2.24 created by xzj
****************************************************************}
procedure TFormUse.btn2ButtonClick(Sender: TObject);
var sqltxt : string;
begin
  isEditing := True;
  //self.Left := (screen.Width - Self.Width) div 2;
  with dlgFont1 do
  begin
    Font := lvPro.Font;
    if Execute then
      lvPro.Font := Font;
  end;
  isEditing := False;
  btn2.Text := lvPro.Font.Name + ',' + IntToStr(lvPro.Font.Size) + ',' + ColorToString(lvPro.Font.Color);
  sqltxt := 'update PRO_SET set LV_FONT_CHARSET = ' + IntToStr(lvPro.Font.charset) + ', '
          + 'LV_FONT_COLOR = ''' + colortostring(lvPro.Font.Color) + ''', '
          + 'LV_FONT_NAME = ''' + lvpro.font.name + ''', '
          + 'LV_FONT_SIZE = ' + IntToStr(lvPro.Font.size) + ' ';
  if lvPro.Font.Style = [] then
  begin
     sqltxt := sqltxt + ', LV_FSB = False, LV_FSI = False, LV_FSU = False ';
  end
  else if lvPro.Font.Style = [fsBold] then
  begin
    sqltxt := sqltxt + ', LV_FSB = True, LV_FSI = False, LV_FSU = False ';
  end
  else if lvPro.Font.Style = [fsItalic] then
  begin
    sqltxt := sqltxt + ', LV_FSB = False, LV_FSI = True, LV_FSU = False ';
  end
  else if lvPro.Font.Style = [fsUnderline] then
  begin
    sqltxt := sqltxt + ', LV_FSB = False, LV_FSI = False, LV_FSU = True ';
  end
  else if lvPro.Font.Style = [fsBold] + [fsItalic] then
  begin
    sqltxt := sqltxt + ', LV_FSB = True, LV_FSI = True, LV_FSU = False ';
  end
  else if lvPro.Font.Style = [fsBold] + [fsUnderline] then
  begin
    sqltxt := sqltxt + ', LV_FSB = True, LV_FSI = False, LV_FSU = True ';
  end
  else if lvPro.Font.Style = [fsItalic] + [fsUnderline] then
  begin
    sqltxt := sqltxt + ', LV_FSB = False, LV_FSI = True, LV_FSU = True ';
  end
  else
  begin
    sqltxt := sqltxt + ', LV_FSB = True, LV_FSI = True, LV_FSU = True ';
  end;
  Execqry(qryCmd,sqltxt);
end;

end.