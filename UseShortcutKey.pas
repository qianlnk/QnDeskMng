{*****************************************************************************
* 版本信息:
*     浅诺桌面管理工具v1.0
* 文件名称:
*     UseShortcutKey.pas
* 内容摘要:
*     桌面快捷方式管理（分类及运行）
* 历史记录:
*     2013.1.28 created by xzj
* 大型修改:
*     2013.2.5 modified by xzj
*     快捷方式名称不显示快捷方式ID,相关功能做相应的修改，将ID存放在数组naID中
*
* 程序为作者原创，修改请保留作者信息，改后程序可发至作者邮箱共同参考、共同进步，
* 谢谢支持。
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
    abtnType: array[1..50] of TRzBitBtn;  //分组按钮
    anID : array[0..500] of Integer;
    sActiveBtn : string;                //当前活动的按钮
    SYS_COLOR : TColor;      //窗体颜色
    FONT_COLOR : TColor;     //字体颜色
    GROUP_COLOR : TColor;    //被选中的分组字体颜色
    EDITING_COLOR : TColor;  //修改时界面颜色
    HIDE_DIRECTION : string; //窗体隐藏方向
    sTypeLoadFlag : string;  //类型加载标识（用于不重复加载）
    procedure WMMouseEnter(var Msg: TMessage); message WM_MouseEnter;
    procedure QNLoadType();
  public
    { Public declarations }
  end;

var
  FormUse: TFormUse;
  sPath: string;
  sType: string;
  hInNow : HKL;       //当前输入法
  keyValue : string;  //按键查询
  isEditing : Boolean; //是否是编辑状态
  RWindowProc: TWndMethod;
  LWindowProc: TWndMethod;
  OldBtn : TRzBitBtn;
implementation
uses registry, shlobj, ActiveX, ComObj, ShellAPI;
{$R *.dfm}

{****************************************************************
* 过程名称:  Openqry
* 功能描述:  数据库查询
* 参数说明:  TADOQuery，string
* 返 回 值:  无
* 历史记录:  2013.1.28 created by xzj
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
* 过程名称:  Execqry
* 功能描述:  数据库操作
* 参数说明:  TADOQuery，string
* 返 回 值:  无
* 历史记录:  2013.1.28 created by xzj
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
* 过程名称:  WMMouseEnter
* 功能描述:  鼠标碰到隐藏的窗体，窗体下拉
* 参数说明:  TMessage
* 返 回 值:  无
* 历史记录:  2013.1.28 created by xzj
*****************************************************************}
procedure TFormUse.WMMouseEnter(var Msg: TMessage);
var iIndex : Integer;
begin
  if (Top < 0) and (HIDE_DIRECTION = '向上隐藏') then
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
    //为保证下拉窗体后呈现在最前面
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //将窗体推到最前
    //发现不取消效果更好
    SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //然后取消窗体最前
  end
  else if (Left < 0) and (HIDE_DIRECTION = '向左隐藏') then
  begin
    Left := 0;
    //为保证下拉窗体后呈现在最前面
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //将窗体推到最前
    //发现不取消效果更好
    SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //然后取消窗体最前
  end
  else if ((Left + Self.Width) > screen.Width) and (HIDE_DIRECTION = '向右隐藏') then
  begin
    Left := Screen.Width - Self.Width;
    //为保证下拉窗体后呈现在最前面
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //将窗体推到最前
    //发现不取消效果更好
    SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //然后取消窗体最前
  end
  else if ((Top + Self.Height) > Screen.Height) and (HIDE_DIRECTION = '向下隐藏') then
  begin
    Top := Screen.Height - Self.Height;
    //为保证下拉窗体后呈现在最前面
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //将窗体推到最前
    //发现不取消效果更好
    SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //然后取消窗体最前
  end;
  Tmr1.Enabled := True;
end;

{****************************************************************
* 过程名称:  GetTempDirectory
* 功能描述:  取系统临时路径
* 参数说明:  无
* 返 回 值:  string 路径
* 历史记录:  2013.1.28 created by xzj
*****************************************************************}
function GetTempDirectory: string; 
var
  TempDir: array[0..255] of Char;
begin
  GetTempPath(255, @TempDir);
  Result := StrPas(TempDir);

end;

{****************************************************************
* 过程名称:  QNLoadType
* 功能描述:  加载类型选择按钮
* 参数说明:  无
* 返 回 值:  无
* 历史记录:  2013.1.28 created by xzj
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
  //加载前释放所有内存，防止内存冲突
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
  //默认让第一个按钮为‘所有程序’
  abtnType[1] := TRzBitBtn.Create(Self);
  abtnType[1].Height := 30;
  abtnType[1].Width := tntscrlbxType.Width - 5;
  abtnType[1].Top := 1;
  abtnType[1].Left := tntscrlbxType.Left;
  abtnType[1].Name := 'btn_0';
  abtnType[1].Parent := tntscrlbxType;
  abtnType[1].Caption := '所有程序';
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
* 过程名称:  LoadShortcutKey
* 功能描述:  加载快捷方式
* 参数说明:  Sender : TObject
* 返 回 值:  无
* 历史记录:  2013.1.28 created by xzj
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

   //读取程序图标
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
* 过程名称:  BtnTypeClick
* 功能描述:  类型按钮响应
* 参数说明:  Sender : TObject
* 返 回 值:  无
* 历史记录:  2013.1.28 created by xzj
* 修改描述： 2013.2.3 modified by xzj
*            添加按钮颜色改变功能，当前分组变为绿色
*            2013.2.17 modified by xzj
*            如果类型选择与先前一样则不重复加载快捷方式
*            2013.2.18 modified by xzj
*            修改2.17所修改的不重复加载，编辑后刷新问题
*****************************************************************}
procedure TFormUse.BtnTypeClick(Sender : TObject);
var sqltxt : string;
begin
  keyValue := '';   //按钮直接查询要用的初始化
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
  //按钮颜色改变
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
* 过程名称:  FormCreate
* 功能描述:  数据库连接，加载分组
* 参数说明:  Sender : TObject
* 返 回 值:  无
* 历史记录:  2013.1.29 created by xzj
*****************************************************************}
procedure TFormUse.FormCreate(Sender: TObject);
var
  sDir, connTmp: string;
begin
  getdir(0, sPath);
  sDir := ExtractFilePath(Application.ExeName);
  chDir(sDir); // 设置工作目录为程序目录。
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
  QNLoadType; //加载类型按钮
end;

{****************************************************************
* 过程名称:  tmr1Timer
* 功能描述:  鼠标不在软件界面时自动隐藏界面
* 参数说明:  Sender : TObject
* 返 回 值:  无
* 历史记录:  2013.1.29 created by xzj
* 修改描述:  2013.2.1 modified by xzj
*            添加发送桌面快捷方式控制
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
  GetWindowRect(self.Handle, rc);         //取窗体的矩形区域
  GetCursorPos(pt);                       //取得当前鼠标所在位置
  if (not PtInRect(rc, pt)) then          //如果鼠标不在窗体范围内
  begin
    if (HIDE_DIRECTION = '向上隐藏') then          //如果目前窗体正吸附在屏幕上沿，则上移隐藏窗体
    begin
      Top := 0 - Height + 2;
    end
    else if (HIDE_DIRECTION = '向下隐藏') then
    begin
      Top := Screen.Height - 2;
    end
    else if (HIDE_DIRECTION = '向左隐藏') then
    begin
      Left := 0 - Self.Width + 2;
      Top := 0;
    end
    else
    begin
      Left := Screen.Width - 2;
      Top := 0;
    end;
    Tmr1.Enabled := False;      //窗体隐藏后定时器关闭
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //将窗体推到最前
  end;
end;

{****************************************************************
* 过程名称:  edtAddKeyPress
* 功能描述:  添加新分组，使用回车键按钮事件来修改数据库内容
* 参数说明:  Sender: TObject; var Key: Char
* 返 回 值:  无
* 历史记录:  2013.1.29 created by xzj
* 修改描述:  2013.2.1 modified by xzj
*            控制分组名不为空
*****************************************************************}
procedure TFormUse.edtAddKeyPress(Sender: TObject; var Key: Char);
var sqltxt : string;
begin
  if Key = #13 then
  begin
    if edtAdd.Text = '' then
    begin
      ShowMessagePos('类名不能为空',(Self.Left + 250),(Self.Top + 300));
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
      ShowMessagePos('已存在名为' + edtAdd.Text + '的类别！',(Self.Left + 250),(Self.Top + 300));
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
    edtAdd.Text := '按回车键确认';
    QNLoadType;   //重新加载分组
  end;
end;

{****************************************************************
* 过程名称:  tntmntmAddClick
* 功能描述:  添加新分组，显示输入框
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.29 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmAddClick(Sender: TObject);
begin
  tntpgcntrl1.visible := True;
  tntpgcntrl1.activepage := pg1;
  edtAdd.SetFocus;
end;

{****************************************************************
* 过程名称:  edtEdtKeyPress
* 功能描述:  修改分组，使用回车键按钮事件来修改数据库内容
* 参数说明:  Sender: TObject; var Key: Char
* 返 回 值:  无
* 历史记录:  2013.1.29 created by xzj
*****************************************************************}
procedure TFormUse.edtEdtKeyPress(Sender: TObject; var Key: Char);
var sqltxt,sqlEdtType,sqlEdtList : string;
begin
  if sActiveBtn = '' then
  begin
    ShowMessagePos('请选中要修改的类别！',(Self.Left + 250),(Self.Top + 300));
    exit;
  end;
  sqlEdtType := 'update PRO_TYPE set PRO_TYPE = ''' + edtEdt.Text +''' where PRO_TYPE = ''' + sActiveBtn + ''' ';
  sqlEdtList := 'update PRO_LIST set PRO_TYPE = ''' + edtEdt.Text +''' where PRO_TYPE = ''' + sActiveBtn + ''' ';
  if Key = #13 then
  begin
    if edtEdt.Text = '' then
    begin
      ShowMessagePos('类名不能为空',(Self.Left + 250),(Self.Top + 300));
      exit;
    end;
    sqltxt := 'select * from PRO_TYPE where PRO_TYPE = ''' + edtEdt.Text + ''' ';
    Openqry(qrycmd,sqltxt);
    if(qryCmd.RecordCount > 0) then
    begin
      ShowMessagePos('已存在名为' + edtEdt.Text + '的类别！',(Self.Left + 250),(Self.Top + 300));
      exit;
    end
    else
    begin
      Execqry(qryCmd,sqlEdtType);
      Execqry(qrycmd,sqlEdtList);
    end;
    edtAdd.Text := '按回车键确认';
    QNLoadType;  //重新加载分组
  end;
end;

{****************************************************************
* 过程名称:  tntmntmqxClick
* 功能描述:  取消操作，隐藏添加和修改的page
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.29 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmqxClick(Sender: TObject);
begin
  tntpgcntrl1.visible := False;
end;

{****************************************************************
* 过程名称:  lvProDblClick
* 功能描述:  双击快捷方式运行相应的程序
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
* 修改描述:
*            2013.1.31 modified by xzj
*            处于编辑状态不让运行程序
*****************************************************************}
procedure TFormUse.lvProDblClick(Sender: TObject);
var sActive,sqltxt : string;
begin

  if not Assigned(lvPro.Selected) then  //没有选中快捷方式，运行无效
  begin
    Exit;
  end
  else if isEditing = True then
  begin
    ShowMessagePos('现在处于编辑状态，请退出编辑',(Self.Left + 250),(Self.Top + 300));
    exit;
  end
  else
  begin
    //获取被选中的快捷方式在数据库中对应的ID
    sActive := IntToStr(anID[lvPro.Selected.ImageIndex]);
    //查询对应的快捷方式记录
    sqltxt := 'select * from PRO_LIST where ID = ' + sActive + '';
    Openqry(qryCmd,sqltxt);
    //找到记录中的快捷方式路径，打开.exe文件
    ShellExecute(handle, 'open', pchar(Trim(qryCmd.FieldByName('PRO_PATH').Value)), nil, nil, SW_SHOWNORMAL);

    //运行程序后隐藏窗体
    if (HIDE_DIRECTION = '向上隐藏') then          
    begin
      Top := 0 - Height + 2;
    end
    else if (HIDE_DIRECTION = '向下隐藏') then
    begin
      Top := Screen.Height - 2;
    end
    else if (HIDE_DIRECTION = '向左隐藏') then
    begin
      Left := 0 - Self.Width + 2;
      Top := 0;
    end
    else
    begin
      Left := Screen.Width - 2;
      Top := 0;
    end;
    //窗体隐藏后定时器关闭
    Tmr1.Enabled := False;
  end;
end;

{****************************************************************
* 过程名称:  tntmntmTailClick
* 功能描述:  修改查看方式为‘详情’
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmTailClick(Sender: TObject);
begin
  lvPro.ViewStyle := vsSmallIcon;
  tntmntmTail.Checked := True;
  tntmntmList.Checked := False;
  tntmntmdefault.Checked := False;
end;

{****************************************************************
* 过程名称:  tntmntmListClick
* 功能描述:  修改查看方式为‘列表’
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmListClick(Sender: TObject);
begin
  lvPro.ViewStyle := vsList;
  tntmntmTail.Checked := False;
  tntmntmList.Checked := True;
  tntmntmdefault.Checked := False;
end;

{****************************************************************
* 过程名称:  tntmntmdefaultClick
* 功能描述:  修改查看方式为‘默认’
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmdefaultClick(Sender: TObject);
begin
  lvPro.ViewStyle := vsIcon;
  tntmntmTail.Checked := False;
  tntmntmList.Checked := False;
  tntmntmdefault.Checked := True;
end;

{****************************************************************
* 过程名称:  tntmntmEdtProClick
* 功能描述:  进入编辑状态，做好编辑准备
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmEdtProClick(Sender: TObject);
begin
  //防止用户多次点击编辑按钮
  if isEditing = True then
  begin
    Exit;
  end;
  tntmntmEdtPro.Checked := True;
  //标示进入编辑状态
  isEditing := True;
  //界面变色，提示用户现在是编辑状态
  lvPro.Color := EDITING_COLOR;
  if  tntmntmEdtPro.Checked = True then
  begin
    //快捷方式进入可编辑状态
    lvPro.ReadOnly := False;
    //添加快捷方式时使用拖曳方式
    LWindowProc := lvPro.WindowProc;
    lvPro.WindowProc := LBWindowProc;
    DragAcceptFiles(lvPro.Handle, True);
    //删除按钮可用
    tntmntmDelPro.Enabled := True;
    //完成按钮可用
    tntmntmWc.Enabled := True;
    //删除所有按钮可用
    tntmntmdelall.Enabled := True;
  end;
  if tntmntmhide.Checked = True then
    tntmntmhide.Click;
  tntmntmhide.Enabled := False;
end;

{****************************************************************
* 过程名称:  tntmntmWcClick
* 功能描述:  编辑完成，做的与进入编辑状态相反
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
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
  //关闭拖曳
  lvPro.WindowProc := LWindowProc;
  DragAcceptFiles(lvPro.Handle, False);
end;

{****************************************************************
* 过程名称:  tntmntmEdtProClick
* 功能描述:  取快捷链接的目标文件
* 参数说明:  const linkname: string
* 返 回 值:  string
* 历史记录:  2013.1.30 created by xzj
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
  Result := '无效的快捷方式！快捷链接已失效！';
  if Succeeded(storage.Load(@widepath[1], STGM_READ)) then
    if Succeeded(link.Resolve(GetActiveWindow, SLR_NOUPDATE)) then
      if Succeeded(link.GetPath(buf, sizeof(buf), filedata, SLGP_UNCPRIORITY)) then
        Result := buf;
  storage := nil;
  link := nil;
end;

{****************************************************************
* 过程名称:  LBWindowProc
* 功能描述:  辅助拖曳
* 参数说明:  Message: TMessage
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.LBWindowProc(var Message: TMessage);
begin
  if Message.Msg = WM_DROPFILES then
    WMDROPFILES_l(Message);
  LWindowProc(Message);
end;

{****************************************************************
* 过程名称:  WMDROPFILES_L
* 功能描述:  添加快捷方式
* 参数说明:  Message: TMessage
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
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
//    if FileExists(pcFileName) then  //判断是否存在
    v_ps := pcFileName;

    StrDispose(pcFileName);
  end;
  DragFinish(Msg.wParam);

  //Delphi取快捷方式的目标路径
  if LowerCase(ExtractFileExt(v_ps)) = '.lnk' then //判断是否为快捷后缀文件
    sCutPath := ExeFromLink(v_ps)
  else
    sCutPath := LowerCase(v_ps);
  sCutName := ExtractFilename(sCutPath);
  sqltxt := 'insert into PRO_LIST(PRO_TYPE,PRO_NAME,PRO_PATH) '
          + 'values(''' + sActiveBtn + ''', ''' + copy(sCutName, 1, pos(ExtractFileExt(sCutName), sCutName) - 1) + ''', ''' + sCutPath + ''') ';
  Execqry(qryCmd,sqltxt);
  //使用鼠标移动事件刷新
  lvPro.Tag := 1;
end;

{****************************************************************
* 过程名称:  tntmntmDelProClick
* 功能描述:  删除快捷方式
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
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
  //使用鼠标移动事件刷新
  lvPro.Tag := 1;
end;

{****************************************************************
* 过程名称:  FormShow
* 功能描述:  布置进入界面初始状态
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
* 修改描述： 2013.2.1 modified by xzj
*            如果本程序开机自启动，则菜单按钮开机自启动选中
*            2013.2.21 modified by xzj
*            添加隐藏项的初始化
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
  rztrycn1.Hint := '浅诺桌面管理工具v1.0';
  GetSystemPath();

  Reg := Tregistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', True);
  isExist := reg.ValueExists('浅诺桌面管理工具v1.0');
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
* 过程名称:  tntmntmEditClick
* 功能描述:  显示修改分组框
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
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
* 过程名称:  tntmntmdeleteClick
* 功能描述:  删除已选中分组
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmdeleteClick(Sender: TObject);
var sqltxt : string;
begin
  if Application.MessageBox(System.Pchar('是否要删除' + sActiveBtn + '?'), '询问', 1 + 32) = id_OK then
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
        ShowMessagePos('要删除的类别下有程序，不可删除！',(Self.Left + 250),(Self.Top + 300));
      end;
    end;
    QNLoadType;
    ActiveControl := abtnType[1];
    abtnType[1].Click;
    pg3.Caption := abtnType[1].Caption;
  end;
end;

{****************************************************************
* 过程名称:  tntmntmhideClick
* 功能描述:  显示和隐藏分组
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.30 created by xzj
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
* 过程名称:  lvProMouseMove
* 功能描述:  显示操作帮助，修改快捷方式后刷新
* 参数说明:  Sender: TObject; Shift: TShiftState; X,Y: Integer
* 返 回 值:  无
* 历史记录:  2013.1.31 created by xzj
* 修改描述:  2013.2.21 modified by xzj
*            添加鼠标拖动窗体效果
*****************************************************************}
procedure TFormUse.lvProMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var i : Integer;
begin
  if isEditing = False then
  begin
    lvPro.Hint := '双击图标可打开文件';
  end
  else
  begin
    lvPro.Hint := '将快捷方式拖入本框即可添加';


    //修改快捷方式后刷新
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
  //获取当前输入法
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
  //拖动窗体
  if (ssleft in Shift) then
  begin
    ReleaseCapture;
    Perform(WM_syscommand, $F012, 0);
  end;
end;

{****************************************************************
* 过程名称:  tntmntmdelallClick
* 功能描述:  删除所有的快捷方式，并初始化数据库表
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.31 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmdelallClick(Sender: TObject);
var sqltxt : string;
begin
  if Application.MessageBox(System.Pchar('是否要删除所有程序?'), '询问', 1 + 32) = id_OK then
  begin
    sqltxt := 'delete from PRO_LIST';
    Execqry(qryCmd,sqltxt);
    sqltxt := 'Alter table[PRO_LIST] Alter column[ID] counter(1,1) ';
    Execqry(qryCmd,sqltxt);
    lvPro.Clear;
  end;
end;

{****************************************************************
* 过程名称:  tntmntmdelalltypeClick
* 功能描述:  删除所有的分组，并初始化数据库表
* 参数说明:  Sender: TObject
* 返 回 值:  无
* 历史记录:  2013.1.31 created by xzj
*****************************************************************}
procedure TFormUse.tntmntmdelalltypeClick(Sender: TObject);
var sqltxt : string;
begin
  if Application.MessageBox(System.Pchar('是否要删除所有分组?'), '询问', 1 + 32) = id_OK then
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
      ShowMessagePos('还有快捷方式，不可做‘删除所有’操作',(Self.Left + 250),(Self.Top + 300));
    end;
  end;
  QNLoadType;
  ActiveControl := abtnType[1];
  abtnType[1].Click;
  pg3.Caption := abtnType[1].Caption;
end;

{****************************************************************
* 过程名称:  lvProEdited
* 功能描述:  修改快捷方式名称
* 参数说明:  Sender: TObject; Item: TTntListItem;var S: WideString
*            其中S就是修改后的名称
* 返 回 值:  无
* 历史记录:  2013.1.31 created by xzj
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
* 过程名称:  Get_HZPY_First
* 功能描述:  获取汉字拼音首字母
* 参数说明:  hz : string
* 返 回 值:  Char
* 历史记录:  2013.1.31 created by xzj
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
    //传入的为数字或字母则原样返回
    Result := hz[1];
  end;
end;

{****************************************************************
* 过程名称:  lvProKeyPress
* 功能描述:  按键之间查找
* 参数说明:  Sender: TObject; var Key: Char
* 返 回 值:  无
* 历史记录:  2013.1.31 created by xzj
*****************************************************************}
procedure TFormUse.lvProKeyPress(Sender: TObject; var Key: Char);
var sActiveName,sSelect : string;
    i,j : Integer;
    nIsReg : Boolean;    //对比是否相等
begin
  if isEditing = True then
  begin
    Exit;
  end;
  nIsReg := False;
  keyValue := keyValue + Key;
  //回车键运行程序
  if Key = #13 then
  begin
    lvProDblClick(Sender);
  end
  else
  begin
    tmrRe.Enabled := True;  //打开计时器
    
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
        //长度超出所输入的字母，直接退出循环，优化
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
* 过程名称: CreateLink
* 功能描述: 创建桌面快捷方式
* 参数说明: programPath：目标文件全路径  programArg：目标文件参数
*           LinkPath：快捷方式全路径     Descr:快捷方式描述
* 返 回 值: 无
* 历史记录: 2013.2.1 created by xzj
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
    raise Exception.Create('快捷方式无效！');
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
* 过程名称: tntmntmSendLinkClick
* 功能描述: 发送桌面快捷方式响应
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.1 created by xzj
****************************************************************}
procedure TFormUse.tntmntmSendLinkClick(Sender: TObject);
var
  tmp : array[0..MAX_PATH] of Char;
  pitem : PITEMIDLIST;
  DeskDir : string;
  sSelectID : string;
  sqltxt : string;
begin
  //获取桌面路径
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
    //获取当前获焦的快捷方式ID
    sSelectID := IntToStr(anID[lvPro.Selected.ImageIndex]);
    //获取当前获焦的快捷方式名称
    sqltxt := 'select * from PRO_LIST where ID = ' + sSelectID + ' ';
    Openqry(qryCmd, sqltxt);
    //发送桌面快捷方式
    CreateLink(qryCmd.fieldbyname('PRO_PATH').AsString,'',DeskDir + lvPro.Selected.Caption + '.lnk','');
  end;
end;

{****************************************************************
* 过程名称: tntmntmSendAllClick
* 功能描述: 发送当前分组下的所有桌面快捷方式到桌面
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.2 created by xzj
****************************************************************}
procedure TFormUse.tntmntmSendAllClick(Sender: TObject);
var
  tmp : array[0..MAX_PATH] of Char;
  pitem : PITEMIDLIST;
  DeskDir : string;
  sqltxt : string;
  i : Integer;
begin
  //获取桌面路径
  SHGetSpecialFolderLocation(Handle,CSIDL_DESKTOP,pitem);
  SHGetPathFromIDList(pitem,tmp);
  DeskDir := string(tmp);
  if Length(DeskDir) > 3 then
  begin
    DeskDir := DeskDir + '\';
  end;
  if sActiveBtn = '所有程序' then
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
    //发送桌面快捷方式
    CreateLink(qryCmd.fieldbyname('PRO_PATH').AsString,'',DeskDir + qryCmd.fieldbyname('PRO_NAME').AsString + '.lnk','');
    qryCmd.Next;
  end;
end;

{****************************************************************
* 过程名称: GetSystemPath
* 功能描述: 加载系统盘符
* 参数说明: 无
* 返 回 值: 无
* 历史记录: 2013.2.1 created by xzj
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
      newMenu.Caption := str + '盘';
      newMenu.Bitmap.LoadFromFile('emotions\' + IntToStr(nRand) + 'fixed.bmp');
      newMenu.Name := str;
      newMenu.OnClick := MenuBtnOnClick;
      tntpmnPC.Items.Add(newMenu);
    end;
  end;
end;

{****************************************************************
* 过程名称: MenuBtnOnClick
* 功能描述: 盘符按钮响应事件
* 参数说明: 无
* 返 回 值: 无
* 历史记录: 2013.2.1 created by xzj
****************************************************************}
procedure TFormUse.MenuBtnOnClick(Sender : TObject);
var
  nClickBtn : string;
begin
     nClickBtn := TMenuItem(Sender).Caption;
     nClickBtn := Copy(nClickBtn,1,1);
     nClickBtn := nClickBtn + ':\';

    //打开指定路径
    ShellExecute(handle, 'open', pchar(nClickBtn), nil, nil, SW_SHOWNORMAL);
    //运行程序后隐藏窗体
    if (HIDE_DIRECTION = '向上隐藏') then          
    begin
      Top := 0 - Height + 2;
    end
    else if (HIDE_DIRECTION = '向下隐藏') then
    begin
      Top := Screen.Height - 2;
    end
    else if (HIDE_DIRECTION = '向左隐藏') then
    begin
      Left := 0 - Self.Width + 2;
      Top := 0;
    end
    else
    begin
      Left := Screen.Width - 2;
      Top := 0;
    end;
    //窗体隐藏后定时器关闭
    Tmr1.Enabled := False;
end;

{****************************************************************
* 过程名称: btn1Click
* 功能描述: 关闭计算机
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.1 created by xzj
****************************************************************}
procedure TFormUse.btn1Click(Sender: TObject);
begin
  if Application.MessageBox(System.Pchar('关闭计算机?'), '询问', 1 + 32) = id_OK then
  begin
    ShellExecute(Handle,'open','shutdown.exe','-f -s -t 0', nil, SW_HIDE);
  end;
end;

{****************************************************************
* 过程名称: tntmntmCloseClick
* 功能描述: 关闭程序
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.1 created by xzj
****************************************************************}
procedure TFormUse.tntmntmCloseClick(Sender: TObject);
begin
  close;
end;

{****************************************************************
* 过程名称: tmr2Timer
* 功能描述: 标签变色，美化界面
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.1 created by xzj
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
  //if (i = 7) or (sActiveBtn = '所有程序') then
  //  Exit;
  //lvPro.Font.Color := clRed;
  //tntscrlbxType.Font.Color := clRed;

end;
}
{****************************************************************
* 过程名称: tntmntmAutoOpenClick
* 功能描述: 开机自启动
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.1 created by xzj
****************************************************************}
procedure TFormUse.tntmntmAutoOpenClick(Sender: TObject);
var
  reg: tregistry;
begin
//把程序写入到注册表的启动中
  if not tntmntmAutoOpen.Checked then
  begin
    Reg := Tregistry.Create;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    try

      reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', True);
      Reg.WriteString('浅诺桌面管理工具v1.0', ExtractFilePath(Application.ExeName) + 'QnDeskMng.exe');
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
      Reg.DeleteValue('浅诺桌面管理工具v1.0');
      tntmntmAutoOpen.Checked := False;
    finally
      Reg.closekey;
      reg.Free;
    end;
  end;
end;

{****************************************************************
* 过程名称: tmr3Timer
* 功能描述: 显示当前时间
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.2 created by xzj
****************************************************************}
procedure TFormUse.tmr3Timer(Sender: TObject);
begin
  edtTime.Text := FormatDateTime('yyyy年mm月dd日hh时nn分ss秒',Now());
end;

{****************************************************************
* 过程名称: tmrReTimer
* 功能描述: 刷新当前键值
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.2 created by xzj （解决按键查询的键值更新问题）
****************************************************************}
procedure TFormUse.tmrReTimer(Sender: TObject);
begin
  keyValue := '';

  //关闭计时器
  tmrRe.Enabled := False;
end;

{****************************************************************
* 过程名称: tmrsxTimer
* 功能描述: 不显示任务栏图标，没有选中快捷方式不让发送桌面快捷方式
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.2 created by xzj
* 修改记录: 2013.2.17 modified by xzj
*           窗体在隐藏状态时将窗体推到最前
****************************************************************}
procedure TFormUse.tmrsxTimer(Sender: TObject);
begin
    //程序不显示任务栏
  ShowWindow(Application.Handle,SW_HIDE);
  
  //没有选中快捷方式不让发送桌面快捷方式
  if not Assigned(lvPro.Selected) then
  begin
    tntmntmSendLink.Enabled := False;
  end
  else
  begin
    tntmntmSendLink.Enabled := True;
  end;

  //显示当前选中的快捷方式
  if Assigned(lvPro.Selected) then
    edtKeyNow.Text := lvPro.Selected.Caption
  else
    edtKeyNow.Text := '无';

  //窗体在隐藏状态时将窗体推到最前
  if(Top = 0 - Height + 2) or ( Top = Screen.Height - 2) or (Left = 0 - Self.Width + 2) or (Left = Screen.Width - 2) then
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE); //将窗体推到最前
end;

{****************************************************************
* 过程名称: cbbFCChange
* 功能描述: 修改窗体颜色
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.6 created by xzj 
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
* 过程名称: cbbFONTCChange
* 功能描述: 修改字体颜色
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.6 created by xzj
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
* 过程名称: cbbGCChange
* 功能描述: 修改选中分组字体的颜色
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.6 created by xzj
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
* 过程名称: cbbECChange
* 功能描述: 修改编辑状态时区域的颜色
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.6 created by xzj
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
* 过程名称: cbbFTChange
* 功能描述: 修改窗体类型
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.6 created by xzj
****************************************************************}
procedure TFormUse.cbbFTChange(Sender: TObject);
var
  //sFormStyle : string;
  sqltxt : string;
begin
  sqltxt := 'update PRO_SET set FORM_STYLE = ''' + cbbFT.Text + ''' where ID = 1 ';
  Execqry(qrySet,sqltxt);
  ShowMessagePos('重启后有效！',(Self.Left + 250),(Self.Top + 300));
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
* 过程名称: cbbHDChange
* 功能描述: 修改窗体隐藏方向
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.6 created by xzj
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
* 过程名称: cbbSHChange
* 功能描述: 设置是否显示帮助
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.6 created by xzj
****************************************************************}
procedure TFormUse.cbbSHChange(Sender: TObject);
var
  sqltxt : string;
begin
  if Trim(cbbSH.Text) = '是' then
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
* 过程名称: InitForm
* 功能描述: 初始化窗体
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.6 created by xzj
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
    cbbSH.Value := '是';
  end
  else
  begin
    pg4.TabVisible := False;
    cbbSH.Value := '否';
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
* 过程名称: tntmntmexitClick
* 功能描述: 退出窗体
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.18 created by xzj
****************************************************************}
procedure TFormUse.tntmntmexitClick(Sender: TObject);
begin
  close;
end;

{****************************************************************
* 过程名称: tntmntmHideZTClick
* 功能描述: 隐藏状态栏
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.21 created by xzj
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
* 过程名称: tntmntmHideZTClick
* 功能描述: 隐藏版本信息
* 参数说明: Sender: TObject
* 返 回 值: 无
* 历史记录: 2013.2.21 created by xzj
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
* 过程名称: AddInitForm
* 功能描述: 版本信息、分组、状态栏的隐藏状况初始化
* 参数说明: 无
* 返 回 值: 无
* 历史记录: 2013.2.21 created by xzj
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

  //初始化窗体透明度
  self.AlphaBlendValue := qryInit.fieldbyname('FORM_ABV').AsInteger;
  rztrckbr1.Position := qryInit.fieldbyname('FORM_ABV').AsInteger;

  //初始化快捷方式的字体
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
* 过程名称: rztrckbr1Change
* 功能描述: 设置窗体透明度
* 参数说明: Sender
* 返 回 值: 无
* 历史记录: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.rztrckbr1Change(Sender: TObject);
var sqltxt : string;
begin
  sqltxt := 'update PRO_SET set FORM_ABV = ' + IntToStr(rztrckbr1.Position);
  self.AlphaBlendValue := rztrckbr1.Position;
  Execqry(qryCmd,sqltxt);
end;

{****************************************************************
* 过程名称: FormMouseMove
* 功能描述: 窗体拖动
* 参数说明: Sender: TObject; Shift: TShiftState; X,Y: Integer
* 返 回 值: 无
* 历史记录: 2013.2.21 created by xzj
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
* 过程名称: imglogoMouseMove
* 功能描述: 窗体拖动
* 参数说明: Sender: TObject; Shift: TShiftState; X,Y: Integer
* 返 回 值: 无
* 历史记录: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.imglogoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  FormMouseMove(Sender,Shift,X,Y);
end;

{****************************************************************
* 过程名称: tntpnl1MouseMove
* 功能描述: 窗体拖动
* 参数说明: Sender: TObject; Shift: TShiftState; X,Y: Integer
* 返 回 值: 无
* 历史记录: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.tntpnl1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  FormMouseMove(Sender,Shift,X,Y);
end;

{****************************************************************
* 过程名称: grp2MouseMove
* 功能描述: 窗体拖动
* 参数说明: Sender: TObject; Shift: TShiftState; X,Y: Integer
* 返 回 值: 无
* 历史记录: 2013.2.21 created by xzj
****************************************************************}
procedure TFormUse.grp2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  FormMouseMove(Sender,Shift,X,Y);
end;

{****************************************************************
* 过程名称: tntpgcntrl2Change
* 功能描述: 设置项置中
* 参数说明: Sender
* 返 回 值: 无
* 历史记录: 2013.2.21 created by xzj
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
* 过程名称: btn2ButtonClick
* 功能描述: 设置快捷方式的字体
* 参数说明: Sender
* 返 回 值: 无
* 历史记录: 2013.2.24 created by xzj
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
