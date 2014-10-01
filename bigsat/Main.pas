unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Math, Mask, jpeg, ComCtrls, Series,
  TeEngine, TeeProcs, Chart, TeeFunci, Grids, GanttCh;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image1: TImage;
    Image2: TImage;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    Chart2: TChart;
    Series2: TLineSeries;
    TeeFunction1: TAverageTeeFunction;
    LineSeries1: TLineSeries;
    Series3: TLineSeries;
    TeeFunction2: TAverageTeeFunction;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label25: TLabel;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    ComboBox2: TComboBox;
    Edit11: TEdit;
    Edit12: TEdit;
    UpDown2: TUpDown;
    Edit16: TEdit;
    UpDown1: TUpDown;
    GroupBox2: TGroupBox;
    Label24: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Edit15: TEdit;
    Edit14: TEdit;
    Edit13: TEdit;
    Panel2: TPanel;
    BigEarthPic: TImage;
    Image3: TImage;
    Panel3: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    TabSheet6: TTabSheet;
    Panel4: TPanel;
    Chart3: TChart;
    ComboBox3: TComboBox;
    PASeries: TLineSeries;
    PBSeries: TLineSeries;
    PCSeries: TLineSeries;
    AvgPA: TLineSeries;
    TeeFunction3: TAverageTeeFunction;
    AvgPB: TLineSeries;
    TeeFunction4: TAverageTeeFunction;
    AvgPC: TLineSeries;
    TeeFunction5: TAverageTeeFunction;
    Label31: TLabel;
    CheckBox1: TCheckBox;
    ProgressBar1: TProgressBar;
    TabSheet5: TTabSheet;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Button1: TButton;
    TabSheet8: TTabSheet;
    Chart4: TChart;
    Bevel1: TBevel;
    Label33: TLabel;
    Edit22: TEdit;
    Label37: TLabel;
    Edit23: TEdit;
    Label38: TLabel;
    Edit24: TEdit;
    Label26: TLabel;
    Edit17: TEdit;
    Label27: TLabel;
    Edit18: TEdit;
    Label28: TLabel;
    Edit19: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Edit20: TEdit;
    Label35: TLabel;
    Edit21: TEdit;
    Label36: TLabel;
    Label39: TLabel;
    GroupBox5: TGroupBox;
    Edit25: TEdit;
    Label40: TLabel;
    UpDown3: TUpDown;
    Button4: TButton;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Label41: TLabel;
    Edit26: TEdit;
    Label42: TLabel;
    CheckBox5: TCheckBox;
    Edit27: TEdit;
    UpDown4: TUpDown;
    Label43: TLabel;
    TabSheet7: TTabSheet;
    StringGrid1: TStringGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure UpDown7Changing(Sender: TObject; var AllowChange: Boolean);
    procedure CheckBox6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Calculate;
    procedure PlotElevation(Lo, La, a, time: double; First: Bool; Step: integer);
    procedure PlotPoint(Lo, La: double; PlanNum: integer);
    procedure PlotOrbit(Lo, La: double; PlanNum: integer; Semi, Altitude: double);
    function FindE(MM, EE: double) : double;
    procedure FindP(E, Minute: double; S: integer; AddNew: Bool);
    function BesselI0(x: double): double;
    procedure RepaintEarth(alt, ecc: double);
    FUNCTION func(z : real) : real;
    FUNCTION func2(x : real) : real;
    FUNCTION fB(x : real) : real;
    PROCEDURE trapzd(a,b: real; VAR s1: real; n: integer);
    PROCEDURE trapzd2(a,b: real; VAR s2: real; n: integer);
  end;

var
  Form1: TForm1;

const
  GM = 3.984E+14;
  Pi = 3.14159265;
  Re = 6378;
  v0 = 0;
  ST0 = 0;
  SiderealDaySec = 86164;
  Emin = 8.2;
  BigEarth = 12000;
  OmegaPrSec = (360.9856/86400);

var
  Test, Test2: TControlCanvas;
  nmax, nmax1,glit, glit2 : integer;
  a1,b1,s1 : real;
  a2,b2,s2 : real;
  xxx: real;
  prA, prB, prC: double;
  m : real;
  rho: real;
  pA, pB, pC: real;
implementation

{$R *.DFM}

procedure TForm1.SpeedButton1Click(Sender: TObject);
var OrbitTime, h, a, e: double;
begin
h := StrToFloat(Edit3.Text)-Re;
a := StrToFloat(Edit3.Text);
e := StrToFloat(Edit11.Text);
OrbitTime := 2*Pi*Sqrt((1 / GM) * Power((Re + h)*1000, 3)) / 60;
Edit8.Text := FloatToStrF(OrbitTime, ffFixed, 6, 2);
if not CheckBox1.Checked then Edit10.Text := Edit8.Text;
Label20.Caption := 'Altitude perigee: '+IntToStr(Round(a-a*e)-Re)+' km';
Label21.Caption := 'Altitude apogee: '+IntToStr(Round(a+a*e)-Re)+' km';
RepaintEarth(a, e);
end;

procedure TForm1.Button2Click(Sender: TObject);
var Teller: integer;
    NS, EW: string[1];
    MinE, MaxE, AvgE, MinD, MaxD, AvgD: double;
begin
if not CheckBox1.Checked then
   begin
   Series1.Clear;
   LineSeries1.Clear;
   PASeries.Clear;
   PCSeries.Clear;
   end;
PBSeries.Clear;

Calculate;
if CheckBox1.Enabled = False then CHeckBox1.Enabled := True;
if LineSeries1.XValues.Count < 1 then CheckBox1.Enabled := False;
LineSeries1.RefreshSeries;
LineSeries1.YValues.RecalcMinMax;
Series1.RefreshSeries;
Series1.YValues.RecalcMinMax;
Series3.RefreshSeries;
Series3.YValues.RecalcMinMax;
Series2.RefreshSeries;
Series2.YValues.RecalcMinMax;

MinE := Series1.MinYValue;
MaxE := Series1.MaxYValue;
AvgE := Series3.MaxYValue;
MinD := LineSeries1.MinYValue;
MaxD := LineSeries1.MaxYValue;
AvgD := Series2.MaxYValue;

if StrToFloat(Edit13.Text) >= 0 then EW := 'E' else EW := 'W';
if StrToFloat(Edit14.Text) >= 0 then NS := 'N' else NS := 'S';

with Chart2.LeftAxis do
 begin
 AutomaticMaximum := False;
 Maximum := MaxD + MaxD/10;
 end;
with Chart2.Title.Text do
 begin
  Clear;
  Add('Diversity for ' + ComboBox1.Text + ' at  '+FloatToStr(Abs(StrToFloat(Edit14.Text)))+' '+NS+'  '+FloatToStr(Abs(StrToFloat(Edit13.Text)))+' '+EW+
                 '   Avg = '+FloatToStrF(AvgD, ffFixed, 4, 4)+
                 ', Min = '+FloatToStrF(MinD, ffFixed, 4, 2)+
                 ', Max = '+FloatToStrF(MaxD, ffFixed, 4, 2));
 end;
 Chart2.Repaint;
with Chart1.Title.Text do
 begin
  Clear;
  Add('Elevation angle for ' + ComboBox1.Text + ' at '+FloatToStr(Abs(StrToFloat(Edit14.Text)))+NS+' '+IntToStr(Abs(StrToInt(Edit13.Text)))+EW+
                 '   Avg = '+FloatToStrF(AvgE, ffFixed, 4, 2)+
                 ', Min = '+FloatToStrF(MinE, ffFixed, 4, 2)+
                 ', Max = '+FloatToStrF(MaxE, ffFixed, 4, 2));
  end;
 Chart1.Repaint;

for Teller := 0 to PASeries.YValues.Count - 1 do
    begin
    PASeries.YValues[Teller] := 1 - PASeries.YValues[Teller];
    PBSeries.AddXY(PASeries.XValues[Teller],1 - PASeries.YValues[Teller] - PCSeries.YValues[Teller], '', clGreen);
    end;
PASeries.RefreshSeries;
PBSeries.RefreshSeries;
PCSeries.RefreshSeries;
AvgPA.RefreshSeries;
AvgPA.YValues.RecalcMinMax;
AvgPB.RefreshSeries;
AvgPB.YValues.RecalcMinMax;
AvgPC.RefreshSeries;
AvgPC.YValues.RecalcMinMax;

Edit22.Text := FloatToStrF(AvgPA.MaxYValue, ffFixed, 8, 4);
Edit23.Text := FloatToStrF(AvgPB.MaxYValue, ffFixed, 8, 4);
Edit24.Text := FloatToStrF(AvgPC.MaxYValue, ffFixed, 8, 4);
with Chart3.Title.Text do
 begin
  Clear;
  Add(ComboBox3.Text+'  -  Prob. for ' + ComboBox1.Text + ' at '+FloatToStr(Abs(StrToFloat(Edit14.Text)))+NS+' '+IntToStr(Abs(StrToInt(Edit13.Text)))+EW+
                 '   pA,div = '+FloatToStrF(AvgPA.MaxYValue, ffFixed, 8, 4)+
                 ', pB,div = '+FloatToStrF(AvgPB.MaxYValue, ffFixed, 8, 4)+
                 ', pC,div = '+FloatToStrF(AvgPC.MaxYValue, ffFixed, 8, 4));
  end;
Chart3.Repaint;
end;

procedure TForm1.PlotPoint(Lo, La: double; PlanNum: integer);
var x, y, W, XtraWidth: integer;
    Cl : array[0..5] of TColor;
begin
PlanNum := PlanNum mod 6;
Cl[0] := clFuchsia;
Cl[1] := clRed;
Cl[2] := clBlue;
Cl[3] := clLime;
Cl[5] := clYellow;
Cl[4] := clSilver;
x := Round(Image1.Width/2 + 2*Lo);
y := Round(Image1.Height/2 - 2*La);
W := UpDown1.Position div 2;
XtraWidth := UpDown1.Position mod 2;
     Test.brush.color := Cl[PlanNum];
     Test.brush.style := bsSolid;
     Test.pen.style := psClear;
     Test.Ellipse(x-W, y-W, x+W+XtraWidth, y+W+XtraWidth);
{Image2.Canvas.brush.color := Cl[PlanNum];
Image2.Canvas.brush.style := bsSolid;
Image2.Canvas.pen.style := psClear;
Image2.Canvas.Ellipse(x-W, y-W, x+W+XtraWidth, y+W+XtraWidth);}
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var Alt, NoSat, NoOfPlane, F, Step, ArgPer, RiAsc: array[1..9] of integer;
    I, Ecc: array[1..9] of double;
begin
if ComboBox1.ItemIndex = 0
   then ComboBox2.ItemIndex := 1
   else
   ComboBox2.ItemIndex := 0;
Alt[1] := 780;
Alt[2] := 1414;
Alt[3] := 2000;
Alt[4] := 10355;
Alt[5] := 35786;
Alt[6] := 10497-Re;
Alt[7] := 8040;
Alt[8] := 26556-Re;
Alt[9] := 42164-Re;

NoSat[1] := 11;
NoSat[2] := 6;
NoSat[3] := 11;
NoSat[4] := 5;
NoSat[5] := 3;
NoSat[6] := 5;
NoSat[7] := 6;
NoSat[8] := 1;
NoSat[9] := 1;

NoOfPlane[1] := 6;
NoOfPlane[2] := 8;
NoOfPlane[3] := 1;
NoOfPlane[4] := 2;
NoOfPlane[5] := 1;
NoOfPlane[6] := 2;
NoOfPlane[7] := 1;
NoOfPlane[8] := 1;
NoOfPlane[9] := 1;

F[1] := 3;
F[2] := 1;
F[3] := 0;
F[4] := 0;
F[5] := 0;
F[6] := 1;
F[7] := 0;
F[8] := 0;
F[9] := 0;

I[1] := 86.4;
I[2] := 52;
I[3] := 0;
I[4] := 45;
I[5] := 0;
I[6] := 116.5;
I[7] := 0;
I[8] := 63.4;
I[9] := 63.4;

Step[1] := 30;
Step[2] := 60;
Step[3] := 120;
Step[4] := 100;
Step[5] := 400;
Step[6] := 60;
Step[7] := 60;
Step[8] := 200;
Step[9] := 200;

Ecc[1] := 0;
Ecc[2] := 0;
Ecc[3] := 0;
Ecc[4] := 0;
Ecc[5] := 0;
Ecc[6] := 0.332095;
Ecc[7] := 0;
Ecc[8] := 0.6;
Ecc[9] := 0.1;

ArgPer[1] := 0;
ArgPer[2] := 0;
ArgPer[3] := 0;
ArgPer[4] := 0;
ArgPer[5] := 0;
ArgPer[6] := 270;
ArgPer[7] := 0;
ArgPer[8] := 270;
ArgPer[9] := 270;

RiAsc[1] := 0;
RiAsc[2] := 0;
RiAsc[3] := 0;
RiAsc[4] := 0;
RiAsc[5] := 0;
RiAsc[6] := 0;
RiAsc[7] := 0;
RiAsc[8] := 90;
RiAsc[9] := 90;

Edit3.Text := IntToStr(Alt[ComboBox1.ItemIndex + 1]+Re);
Edit5.Text := IntToStr(NoSat[ComboBox1.ItemIndex + 1]);
Edit7.Text := IntToStr(NoOfPlane[ComboBox1.ItemIndex + 1]);
Edit6.Text := IntToStr(F[ComboBox1.ItemIndex + 1]);
Edit9.Text := FloatToStrF(I[ComboBox1.ItemIndex + 1], ffGeneral, 4, 4);
if not CheckBox1.Checked then Edit4.Text := IntToStr(Step[ComboBox1.ItemIndex + 1]);
Edit12.Text := IntToStr(ArgPer[ComboBox1.ItemIndex + 1]);
Edit11.Text := FloatToStrF(Ecc[ComboBox1.ItemIndex + 1], ffGeneral, 4, 4);
Edit1.Text := IntToStr(RiAsc[ComboBox1.ItemIndex + 1]);

SpeedButton1Click(nil);
end;

procedure TForm1.Button3Click(Sender: TObject);
var Bitmap: TBitmap;
begin
Bitmap := TBitmap.Create;
if PageControl1.ActivePage = TabSheet1 then
   begin
   Bitmap.Width := Image2.Width;
   Bitmap.Height := Image2.Height;
   Image2.Picture.Graphic := Bitmap;
   end;
if PageControl1.ActivePage = TabSheet4 then
   begin
   Bitmap.Width := Image3.Width;
   Bitmap.Height := Image3.Height;
   Image3.Picture.Graphic := Bitmap;
   end;
Bitmap.Free;
if Sender = BigEarthPic then Exit;
if not CheckBox1.Checked then
 begin
 CheckBox1.Enabled := False;
 Series1.Clear;
 LineSeries1.Clear;
 PASeries.Clear;
 PBSeries.Clear;
 PCSeries.Clear;
 Series4.Clear;
 Series5.Clear;
 Edit22.Text := '<N/A>';
 Edit23.Text := '<N/A>';
 Edit24.Text := '<N/A>';
 end;
with Chart2.Title.Text do
 begin
  Clear;
  Add('Diversity vs time');
 end;
 Chart2.Repaint;
with Chart1.Title.Text do
 begin
  Clear;
  Add('Elevation angle vs time');
  end;
 Chart1.Repaint;

end;

procedure TForm1.Edit3Exit(Sender: TObject);
begin
if (StrToFloat(Edit3.Text) > 0) and
   (StrToFloat(Edit11.Text) >= 0) and
   (StrToFloat(Edit11.Text) < 1) then SpeedButton1Click(nil);
end;

function TForm1.FindE(MM, EE: double) : double;
var x: integer;
    EA, Error: double;
label 99;
begin
EA := MM;
   for x := 1 to 20 do
    begin
    Error := (EA - EE*sin(EA) - MM)
                / (1 - EE*cos(EA));
    EA := EA - Error;
    if Abs(Error) < 0.00001 then goto 99;
    end;

    EA := 0;
    while (EA - EE*Sin(EA) - MM) < 0 do
          EA := EA + 0.01;

99: Result := EA;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
Test:= TControlCanvas.Create;
Test.Control := Image2;
Test2 := TControlCanvas.Create;
Test2.Control := Image3;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
Test.Free;
Test2.Free;
end;

procedure TForm1.PlotOrbit(Lo, La: double; PlanNum: integer; Semi, Altitude: double);
var x, y, W, XtraWidth, Earth: integer;
    AltFactor, z: double;
    Cl : array[0..5] of TColor;
begin
Earth := BigEarthPic.Width div 2;

PlanNum := PlanNum mod 6;
Cl[0] := clFuchsia;
Cl[1] := clRed;
Cl[2] := clBlue;
Cl[3] := clLime;
Cl[5] := clYellow;
Cl[4] := clSilver;

Lo := DegToRad(Lo);
La := DegToRad(La);

Lo := Lo - Pi/2;
La := La + Pi/2;

AltFactor := Altitude/Re;

x := Image3.Width div 2 + Round(Earth*AltFactor*Cos(Lo)*Sin(La));
y := Image3.Height div 2 + Round(Earth*AltFactor*Cos(La));
z := Sin(Lo)*Sin(La);
W := UpDown1.Position div 2;
XtraWidth := UpDown1.Position mod 2;
     Test2.brush.color := Cl[PlanNum];
     Test2.brush.style := bsSolid;
     Test2.pen.style := psClear;
     if not ((z > 0) and (Sqrt(Sqr(AltFactor*Cos(Lo)*Sin(La)) + Sqr(AltFactor*Cos(La))) < 1)) then
     Test2.Ellipse(x-W, y-W, x+W+XtraWidth, y+W+XtraWidth);

end;

procedure TForm1.PlotElevation(Lo, La, a, time: double; First: Bool; Step: integer);
var UserLong, UserLat, Beta, Elev, EminUser: double;
    Visible: integer;
begin
time := time/60;
UserLong := DegToRad(StrToFloat(Edit13.Text));
UserLat := StrToFloat(Edit14.Text);
if UserLat = 90 then UserLat := 89.99;
UserLat := DegToRad(UserLat);

EminUser := StrToFloat(Edit15.Text);
Lo := DegToRad(Lo);
La := DegToRad(La);
Beta := ArcCos(Sin(UserLat)*Sin(La)+Cos(UserLat)*Cos(La)*Cos(UserLong-Lo));
if Sin(Beta) = 0 then Beta := Beta + 1E-10;
Elev := RadToDeg(ArcTan((a*Cos(Beta)-Re)/(a*Sin(Beta))));
if Elev <= 0 then Elev := 0;
if Elev > EminUser then Visible := 1 else Visible := 0;
if CheckBox1.Checked then
   begin
   if Elev > Series1.YValues[Step]then
      Series1.YValues[Step] := Elev;
   if Visible = 1 then Chart2.LeftAxis.Maximum := Chart2.LeftAxis.Maximum + 1;
   LineSeries1.YValues[Step] := LineSeries1.YValues[Step] + Visible;
   end
   else
   begin
   if First then Series1.AddXY(Time, 0, '', clBlue);
   if Elev > Series1.YValues[Step]then
      Series1.YValues[Step] := Elev;

   if First then LineSeries1.AddXY(Time, 0, '', clBlue);
   LineSeries1.YValues[Step] := LineSeries1.YValues[Step] + Visible;
   end;
FindP(Elev, Time, Step, First);
end;

procedure TForm1.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if (X > 720) or (Y > 360) then Exit;
Edit13.Text := IntToStr(Round(X/2-180));
Edit14.Text := IntToStr(Round(90-(Y/2)));

end;

procedure TForm1.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
if (Button = btPrev) and (StrToInt(Edit4.Text) > 5) then
   Edit4.Text := IntToStr(StrToInt(Edit4.Text)- 5);
if Button = btNext then
   Edit4.Text := IntToStr(StrToInt(Edit4.Text)+ 5);

end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
Edit10.Enabled := not CheckBox1.Checked;
Edit4.Enabled := not CheckBox1.Checked;
end;

procedure TForm1.Calculate;
var Sat, Orb, Dt, OrbitTime, TimeSpan,
    t, tSat, SatPrPlane, P, F: integer;
    Alt, Omega, DeltaLong, DeltaLongPhased, DLong1, DLong2, DLongOrb, Phi, Eps,
    Long, Lat, Long0, LongOrbitPlot, I, e, w, M0, E0, Et, Mt,
    vt, a: double;
    FirstSat: Bool;
begin
a := StrToFloat(Edit3.Text);
e := StrToFloat(Edit11.Text);
I := StrToFloat(Edit9.Text);
w := StrToFloat(Edit12.Text);
SatPrPlane := StrToInt(Edit5.Text);
P := StrToInt(Edit7.Text);
F := StrToInt(Edit6.Text);
Omega := StrToFloat(Edit1.Text);
OrbitTime := Round(60*StrToFloat(Edit8.Text));
TimeSpan := Round(60*StrToFloat(Edit10.Text));
Dt := Round(StrToFloat(Edit4.Text));

if (a <= 0) or (e < 0) or (e >= 1) or (P < 1) or
   (F < 0) or (SatPrPlane < 1) then Exit;

if I = 0 then I := 0.00001;
if (Abs(I) > 89.95) and (Abs(I) < 90.05) then I := 89.95;

Omega := DegToRad(Omega);
I := DegToRad(I);
w := DegToRad(w);

{Eccentric and Mean anomaly at t = t0}
M0 := 0;
E0 := 0;

if (PageControl1.ActivePage = TabSheet4) and CheckBox4.Checked then
   TimeSpan := 1;
ProgressBar1.Max := TimeSpan div Dt + 1;

{Here starts the Lat and Long finding loops}
for t := 0 to (TimeSpan div Dt) do
   begin
   ProgressBar1.StepIt;
   Orb := 1;
   while Orb <= P do
     begin
     Sat := 1;
     while Sat <= SatPrPlane do
        begin
        if (ComboBox1.ItemIndex = 5) and (CheckBox2.Checked) then
           if Orb = 1 then w := DegToRad(260) else
              w:= DegToRad(280);

        {This is where we add the time differences and
         angular difference depending on which orbit and
         satellite we are calculating}
        tSat := Round(Dt*(t + (Sat - 1)*(OrbitTime/(Dt*SatPrPlane)) + F*(Orb-1)*OrbitTime/(Dt*SatPrPlane*P)));
        DeltaLong := ((Orb-1)*360/P) + OmegaPrSec*(Sat-1)*(OrbitTime * P / (SatPrPlane*P));
        DLongOrb := ((Orb-1)*360/P);
        DeltaLongPhased := OmegaPrSec*F*(Orb-1)*(OrbitTime/(SatPrPlane*P));

        {If the orbit is Beste-type, we calculate the
         angular difference like this}
        if ComboBox2.ItemIndex = 1 then
           begin
           Phi := RadToDeg( ArcCos(Re*Cos(DegToRad(Emin))/a) ) - Emin;
           Eps := (180 - (P-1)*Phi)/(P + 1);
           DLong2 := 2*Eps;
           DLong1 := Phi + Eps;
           if Orb = P then
              DeltaLong := 180 - DLong2 + OmegaPrSec*(Sat-1)*(OrbitTime * P / (SatPrPlane*P))
              else
              DeltaLong := (Orb-1)*DLong1+ OmegaPrSec*(Sat-1)*(OrbitTime * P / (SatPrPlane*P));
           DLongOrb := DeltaLong - OmegaPrSec*(Sat-1)*(OrbitTime * P / (SatPrPlane*P));
           end;

        {Mean and Eccentric Anomaly}
        Mt := Frac((M0+2*Pi*tSat/OrbitTime)/(2*Pi))*2*Pi;
        Et := FindE(Mt, e);

        {True anomaly}
        if Et > Pi then
           vt := -ArcCos((Cos(Et)-e)/(1-e*Cos(Et)))+2*pi
           else
           vt := ArcCos((Cos(Et)-e)/(1-e*Cos(Et)));

        {Latitude}
        Lat := ArcSin((Sin(I)*Sin(w + vt)));

        {Initial Longitude}
        Long0 := -ArcCos(Cos(vt+w)/Cos(Lat));

        if ((I > Pi/2) and (Lat < 0)) or ((I < PI/2) and (Lat > 0)) then
           Long0 := -Long0;
        Lat := RadToDeg(Lat);

        {Longitude with correct angular difference depending
        on satellite and orbit}
        Long := DeltaLong + DeltaLongPhased
                + RadToDeg( Frac((Long0+Omega-ST0)/(2*Pi))*2*Pi )
                - OmegaPrSec*((tSat) mod (SiderealDaySec));
        LongOrbitPlot := DLongOrb + RadToDeg( Frac((Long0+Omega-ST0)/(2*Pi))*2*Pi );

        {Instant altitude}
        Alt := a*(1-e*e)/(1+e*Cos(vt));

        while Long < -180 do Long := Long + 360;
        while Long > 180 do Long := Long - 360;

        {Plot the different orbits, according to
        which page is visible in the program i.e. if
        the page with the globe is visible, plot only the
        orbit around the globe (less time consuming)}
        if PageControl1.ActivePage = TabSheet1 then
           PlotPoint(Long, Lat, Orb);
        if PageControl1.ActivePage = TabSheet4 then
           PlotOrbit(LongOrbitPlot, Lat, Orb, a, Alt);


        if (Sat = 1) and (Orb = 1) then
           FirstSat := True
           else
           FirstSat := False;

        {Plot Elevation angle}
        PlotElevation(Long, Lat, Alt, t*Dt, FirstSat, t);
        Inc(Sat);
        end;
     Inc(Orb);
   end;
end;
ProgressBar1.Position := 0;
end;

procedure TForm1.FindP(E, Minute: double; S: integer; AddNew: Bool);
var pA, pC: double;
begin
{Probability finding}
case ComboBox3.ItemIndex of
     1: begin
        pA := 1 - Sqr(90 - E)/16600;  {Suburban}
        pC := (1 - pA)/5;
        end;
     2: begin
        pA := 0.9;    {Rural}
        pC := 0.01;
        end;
     else
      begin
      pA := 1 - Sqr(90 - E)/7000;    {Urban}
      pC := 4*(1 - pA)/5;
      end;
     end;
if (E < StrToFloat(Edit15.Text)) or (E < 10) then
   begin
   pA := 0.0;
   pC := 1.0;
   end;
if CheckBox1.Checked then
   begin
    if AddNew then PASeries.YValues[S] := 1 - PASeries.YValues[S];
    PASeries.YValues[S] := PASeries.YValues[S] * (1 - pA);
    PCSeries.YValues[S] := PCSeries.YValues[S] * pC ;
   end
   else
   begin
    if AddNew then PASeries.AddXY(Minute, 1.0, '', clRed);
    PASeries.YValues[S] := PASeries.YValues[S] * (1 - pA);
    if AddNew then PCSeries.AddXY(Minute, 1.0, '', clBlue);
    PCSeries.YValues[S] := PCSeries.YValues[S] * pC ;
   end;
end;

function TForm1.BesselI0(x: double): double;
var ax, y, ans: double;
begin
   if (abs(x) < 3.75) then
      begin
      y := Sqr(x/3.75);
      ans := 1.0+y*(3.5156229+y*(3.0899424+y*(1.2067492+y*
      (0.2659732+y*(0.360768e-1+y*0.45813e-2)))))
      end
      else
      begin
      ax := Abs(x);  y := 3.75/ax;
      ans := (exp(ax)/sqrt(ax))*(0.39894228+y*(0.1328592e-1
         +y*(0.225319e-2+y*(-0.157565e-2+y*(0.916281e-2
         +y*(-0.2057706e-1+y*(0.2635537e-1+y*(-0.1647633e-1
         +y*0.392377e-2))))))));
      end;
BesselI0 := ans;
end;

procedure TForm1.RepaintEarth(alt, ecc: double);
begin
if not (CheckBox1.Checked or (not CheckBox3.Checked)) then
 begin
 BigEarthPic.Height := Round(Re/(alt+alt*ecc) * (Image3.Height));
 BigEarthPic.Width := Round(Re/(alt+alt*ecc) * (Image3.Height));
 BigEarthPic.Left := Image3.Width div 2 - BigEarthPic.Width div 2;
 BigEarthPic.Top := Image3.Height div 2 - BigEarthPic.Height div 2;
 Button3Click(BigEarthPic);
 end;
end;

procedure TForm1.FormResize(Sender: TObject);
var a, e: double;
begin
a := StrToFloat(Edit3.Text);
e := StrToFloat(Edit11.Text);
if a <= 0 then a := 7000;
RepaintEarth(a, e);
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
if PageControl1.ActivePage = TabSheet1 then Image2.Align := alClient;
if PageControl1.ActivePage = TabSheet4 then Image3.Align := alClient;
if PageControl1.ActivePage = TabSheet6 then Chart3.Align := alClient;
if (PageControl1.ActivePage = TabSheet2) or
   (PageControl1.ActivePage = TabSheet3) or
   (PageControl1.ActivePage = TabSheet6) then
      Button1.Enabled := True
      else
      Button1.Enabled := False;

if PageControl1.ActivePage = TabSheet8 then
   begin
   Button4.Default := True;
   Button4.SetFocus;
   Button2.Default := False;
   end
   else
   begin
   Button4.Default := False;
   Button2.Default := True;
   Button2.SetFocus;
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if PageControl1.ActivePage = TabSheet2 then
   Chart1.CopyToClipboardBitmap;
if PageControl1.ActivePage = TabSheet3 then
   Chart2.CopyToClipboardBitmap;
if PageControl1.ActivePage = TabSheet6 then
   Chart3.CopyToClipboardBitmap;
if PageControl1.ActivePage = TabSheet8 then
   Chart4.CopyToClipboardBitmap;
if PageControl1.ActivePage = TabSheet7 then
   Chart5.CopyToClipboardBitmap;
end;

procedure TForm1.Button4Click(Sender: TObject);
var i: integer;
    StepdB: real;
    NS, EW: string[1];
begin
if (Edit22.Text = '<N/A>') or
   (Edit23.Text = '<N/A>') or
   (Edit24.Text = '<N/A>') then Exit;
if (ComboBox3.ItemIndex = 0) or (ComboBox3.ItemIndex = -1)
   then Series4.Clear else Series5. Clear;
if ComboBox3.ItemIndex = 2 then
   Series5.Title := 'Rural';
if ComboBox3.ItemIndex = 1 then
   Series5.Title := 'Suburban';

Series4.Pointer.Visible := CheckBox5.Checked;
Series5.Pointer.Visible := CheckBox5.Checked;
Series4.Pointer.HorizSize := UpDown4.Position;
Series5.Pointer.HorizSize := UpDown4.Position;
Series4.Pointer.VertSize := UpDown4.Position;
Series5.Pointer.VertSize := UpDown4.Position;

pA := StrToFloat(Edit22.Text);
pB := StrToFloat(Edit23.Text);
pC := StrToFloat(Edit24.Text);
prA := Power(10, StrToFloat(Edit17.Text)/10);
prB := Power(10, StrToFloat(Edit18.Text)/10);
prC := Power(10, StrToFloat(Edit19.Text)/10);
m := StrToFloat(Edit20.Text);
rho := StrToFloat(Edit21.Text);
nmax1 := 7;
nmax := StrToInt(Edit25.Text);
StepdB := StrToFloat(Edit26.Text);
a1 := 0.001;
b1 := 1.8;
b2 := 1.79999;
a2 := 0.001;

ProgressBar1.Max := Round(32/StepdB);
while a2 < b2 do
     begin
       for i := 1 to nmax do
           trapzd2(a2,b2,s2,i);
       ProgressBar1.StepIt;
       if ComboBox3.ItemIndex <= 0 then
       Series4.AddXY(Log10(a2)*10,s2*100, '', clBlue)
       else
       Series5.AddXY(Log10(a2)*10,s2*100, '', clRed);
       a2 := Power(10, (Log10(a2)*10 + StepdB)/10);
     end;
ProgressBar1.Position := 0;

if StrToFloat(Edit13.Text) >= 0 then EW := 'E' else EW := 'W';
if StrToFloat(Edit14.Text) >= 0 then NS := 'N' else NS := 'S';

with Chart4.Title.Text do
 begin
  Clear;
  Add('Cumulative Distribution Function for ' + ComboBox1.Text +
      ' at '+FloatToStr(Abs(StrToFloat(Edit14.Text)))+NS+' '+
      IntToStr(Abs(StrToInt(Edit13.Text)))+EW);
 end;
 Chart4.Repaint;
end;


FUNCTION TForm1.func(z : real) : real;
BEGIN
Result := 1/z*Exp(-Sqr(20*Log10(z)-m)/(2*Sqr(rho))-
       (Sqr(xxx)+Sqr(z))/prB)*BesselI0(2*z*xxx/prB);
END;

FUNCTION TForm1.func2(x : real) : real;
BEGIN
Result := (pA*2*x/prA * Exp(-(1+Sqr(x))/prA)*BesselI0(2*x/prA))
          +pB*6.93*x/(rho*prB)*fB(x)
          +pC*2*x/prC * Exp(-Sqr(x)/prC);
END;

FUNCTION TForm1.fB(x : real) : real;
var t: integer;
BEGIN
   xxx := x;
   for t := 1 to nmax1 do
   trapzd(a1,b1,s1,t);
   Result := s1;
END;

PROCEDURE TForm1.trapzd(a,b: real; VAR s1: real; n: integer);
VAR
   k: integer;
   q,tnm1,sum1,del1: real;
BEGIN
   IF (n = 1) THEN BEGIN
      s1 := 0.5*(b-a)*(func(a)+func(b));
      glit := 1
   END
   ELSE BEGIN
      tnm1 := glit;
      del1 := (b-a)/tnm1;
      q := a+0.5*del1;
      sum1 := 0.0;
      FOR k := 1 TO glit DO BEGIN
         sum1 := sum1+func(q);
         q := q+del1
      END;
      s1 := 0.5*(s1+(b-a)*sum1/tnm1);
      glit := 2*glit
   END
END;

PROCEDURE TForm1.trapzd2(a,b: real; VAR s2: real; n: integer);
VAR
   j: integer;
   x,tnm,sum,del: real;
BEGIN
   IF (n = 1) THEN BEGIN
      s2 := 0.5*(b-a)*(func2(a)+func2(b));
      glit2 := 1
   END
   ELSE BEGIN
      tnm := glit2;
      del := (b-a)/tnm;
      x := a+0.5*del;
      sum := 0.0;
      FOR j := 1 TO glit2 DO BEGIN
         sum := sum+func2(x);
         x := x+del
      END;
      s2 := 0.5*(s2+(b-a)*sum/tnm);
      glit2 := 2*glit2
   END
END;



procedure TForm1.CheckBox5Click(Sender: TObject);
begin
Edit27.Enabled := CheckBox5.Checked;
end;

procedure TForm1.UpDown7Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
Series6.Pointer.Visible := CheckBox6.Checked;
Series7.Pointer.Visible := CheckBox6.Checked;
Series8.Pointer.Visible := CheckBox6.Checked;
Series9.Pointer.Visible := CheckBox6.Checked;
Series10.Pointer.Visible := CheckBox6.Checked;

Series6.Pointer.HorizSize := UpDown7.Position;
Series7.Pointer.HorizSize := UpDown7.Position;
Series8.Pointer.HorizSize := UpDown7.Position;
Series9.Pointer.HorizSize := UpDown7.Position;
Series10.Pointer.HorizSize := UpDown7.Position;

Series6.Pointer.VertSize := UpDown7.Position;
Series7.Pointer.VertSize := UpDown7.Position;
Series8.Pointer.VertSize := UpDown7.Position;
Series9.Pointer.VertSize := UpDown7.Position;
Series10.Pointer.VertSize := UpDown7.Position;

end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
Series6.Pointer.Visible := CheckBox6.Checked;
Series7.Pointer.Visible := CheckBox6.Checked;
Series8.Pointer.Visible := CheckBox6.Checked;
Series9.Pointer.Visible := CheckBox6.Checked;
Series10.Pointer.Visible := CheckBox6.Checked;

Series6.Pointer.HorizSize := UpDown7.Position;
Series7.Pointer.HorizSize := UpDown7.Position;
Series8.Pointer.HorizSize := UpDown7.Position;
Series9.Pointer.HorizSize := UpDown7.Position;
Series10.Pointer.HorizSize := UpDown7.Position;

Series6.Pointer.VertSize := UpDown7.Position;
Series7.Pointer.VertSize := UpDown7.Position;
Series8.Pointer.VertSize := UpDown7.Position;
Series9.Pointer.VertSize := UpDown7.Position;
Series10.Pointer.VertSize := UpDown7.Position;
end;

end.
