unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_BarC, FR_Class, FR_DSet, FR_DBSet, Db, dxmdaset, Buttons, StdCtrls,
  dxCntner, dxEditor, dxEdLib, ExtCtrls, DBarImage, MemTable, Menus,
  FR_DCtrl, DBTables, FR_Desgn, Grids, DBGrids;

type
  TForm1 = class(TForm)
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frBarCodeObject1: TfrBarCodeObject;
    dxEdit1: TdxEdit;
    Label1: TLabel;
    Label2: TLabel;
    dxEdit2: TdxEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    dxEdit3: TdxEdit;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    dxEdit4: TdxEdit;
    dxEdit5: TdxEdit;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    Shape1: TShape;
    Label6: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Shape4: TShape;
    DuckBarCodeImage1: TDuckBarCodeImage;
    PopupMenu1: TPopupMenu;
    Printaj1: TMenuItem;
    Dizajn1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    DataSource1: TDataSource;
    frDesigner1: TfrDesigner;
    Label9: TLabel;
    Label10: TLabel;
    SpeedButton4: TSpeedButton;
    Shape5: TShape;
    Label11: TLabel;
    Label12: TLabel;
    dxEdit6: TdxEdit;
    dxEdit7: TdxEdit;
    PopupMenu4: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Shape6: TShape;
    procedure dxEdit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Nalja3;
    procedure dxEdit5Exit(Sender: TObject);
    procedure DajNalju(ime:string; design:Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Dizajn1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure SpeedButton3DblClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TStavke: TMemoryTable;
  ExePath: String;
  a: integer;

implementation

{$R *.DFM}

procedure TForm1.dxEdit1Exit(Sender: TObject);
begin
     Label6.Caption:=dxEdit1.Text;
     Label7.Caption:=dxEdit2.Text;

     Label8.Caption:=dxEdit3.Text;

     DuckBarCodeImage1.Text:=dxEdit4.Text;
     dxEdit5.Text:=IntToStr(StrToInt(dxEdit4.Text)+65);

     Label12.Caption:=dxEdit6.Text;
     Label11.Caption:=dxEdit7.Text;
end;

procedure TForm1.dxEdit5Exit(Sender: TObject);
begin
     if dxEdit4.Text>dxEdit5.Text then dxEdit5.Text:=IntToStr(StrToInt(dxEdit4.Text)+64);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     ExePath:=ExtractFilePath(Application.ExeName);
     frLocale.LoadDll(ExePath+'FR_Eng.dll'); // load english resources 4 FastReport
//     Nalja3;
end;

procedure TForm1.Nalja3;
var  a: TFieldDefs;
     i,j,k: Integer;
begin
     try TStavke.Destroy; except end;
     Tstavke := TMemoryTable.Create(self);
//     Tstavke.DataBaseName := 'DB';
     Tstavke.TableName := 'Temp';
     Tstavke.SessionName := 'Default';
     Tstavke.Name := 'Tstavke';
     Tstavke.Close;

     a := Tstavke.FieldDefs;
     a.Add('barcode',ftString, 7, False);
     Tstavke.Open;
     DataSource1.DataSet := Tstavke;

     j:=StrToInt(dxEdit4.Text);
     k:=StrToInt(dxEdit5.Text);

     if j>k then begin i:=j; j:=k; k:=i; end;

     while j<k do
     begin
          TStavke.Append;
          TStavke.FieldByName('barcode').Value:=IntToStr(j);
          TStavke.Post;
          Inc(j);
     end;
end;

procedure TForm1.DajNalju(ime:string; design:Boolean);
begin
     if not frReport1.LoadFromFile(ime) then ShowMessage('Greška kod uèitavanja '+ime)
     else
     begin
          frReport1.PrepareReport;
          if design then
               frReport1.DesignReport
          else
               frReport1.ShowPreparedReport;
     end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
     frReport1.Dataset:=nil;
     if not frReport1.LoadFromFile(ExePath+'Naljepnica1.frf') then
          ShowMessage('Greška kod uèitavanja '+ExePath+'Naljepnica1.frf')
     else
     begin
          frReport1.FindObject('Memo1').Memo.Text:=dxEdit1.Text;
          frReport1.FindObject('Memo2').Memo.Text:=dxEdit2.Text;
          frReport1.PrepareReport;
          frReport1.ShowPreparedReport;
     end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
     frReport1.Dataset:=nil;

     if not frReport1.LoadFromFile(ExePath+'Naljepnica2.frf') then
          ShowMessage('Greška kod uèitavanja '+ExePath+'Naljepnica2.frf')
     else
     begin
          frReport1.FindObject('Memo1').Memo.Text:=dxEdit3.Text;
          frReport1.PrepareReport;
          frReport1.ShowPreparedReport;
     end;
end;

procedure TForm1.Dizajn1Click(Sender: TObject);
begin
     frReport1.Dataset:=nil;
     if not frReport1.LoadFromFile(ExePath+'Naljepnica1.frf') then
          ShowMessage('Greška kod uèitavanja '+ExePath+'Naljepnica1.frf')
     else
     begin
          frReport1.FindObject('Memo1').Memo.Text:=dxEdit1.Text;
          frReport1.FindObject('Memo2').Memo.Text:=dxEdit2.Text;
          frReport1.PrepareReport;
          if (Sender as TMenuItem).Tag=1 then frReport1.ShowPreparedReport
          else if (Sender as TMenuItem).Tag=2 then frReport1.DesignReport;
     end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
     frReport1.Dataset:=nil;
     if not frReport1.LoadFromFile(ExePath+'Naljepnica2.frf') then
          ShowMessage('Greška kod uèitavanja '+ExePath+'Naljepnica2.frf')
     else
     begin
          frReport1.FindObject('Memo1').Memo.Text:=dxEdit3.Text;
          frReport1.PrepareReport;
          if (Sender as TMenuItem).Tag=1 then frReport1.ShowPreparedReport
          else if (Sender as TMenuItem).Tag=2 then frReport1.DesignReport;
     end;
end;

procedure TForm1.SpeedButton3DblClick(Sender: TObject);
begin
     Nalja3;
     frReport1.Dataset:=frDBDataSet1;
     DajNalju(ExePath+'Naljepnica3.frf',False);
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
     Nalja3;
     frReport1.Dataset:=frDBDataSet1;
     if (Sender as TMenuItem).Tag=1 then
          DajNalju(ExePath+'Naljepnica3.frf',False)
     else if (Sender as TMenuItem).Tag=2 then
          DajNalju(ExePath+'Naljepnica3.frf',True);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
     if not frReport1.LoadFromFile(ExePath+'Naljepnica4.frf') then
          ShowMessage('Greška kod uèitavanja '+ExePath+'Naljepnica4.frf')
     else
     begin
          frReport1.FindObject('Memo1').Memo.Text:=dxEdit6.Text;
          frReport1.FindObject('Memo2').Memo.Text:=dxEdit7.Text;
          frReport1.PrepareReport;
          frReport1.ShowPreparedReport;
     end;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
     frReport1.Dataset:=nil;
     if not frReport1.LoadFromFile(ExePath+'Naljepnica4.frf') then
          ShowMessage('Greška kod uèitavanja '+ExePath+'Naljepnica4.frf')
     else
     begin
          frReport1.FindObject('Memo1').Memo.Text:=dxEdit6.Text;
          frReport1.FindObject('Memo2').Memo.Text:=dxEdit7.Text;
          frReport1.PrepareReport;
          if (Sender as TMenuItem).Tag=1 then frReport1.ShowPreparedReport
          else if (Sender as TMenuItem).Tag=2 then frReport1.DesignReport;
     end;
end;

end.
