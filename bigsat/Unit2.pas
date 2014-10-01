unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, TeeProcs, TeEngine, Chart, Series, ComCtrls;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    TabSheet2: TTabSheet;
    Chart2: TChart;
    Series2: TLineSeries;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses Main;

{$R *.DFM}

procedure TForm2.FormResize(Sender: TObject);
begin
if not Chart1.Visible then
 begin
 Form1.Button3Click(Form2);
 Form1.Button2Click(Form2);
 end;
end;
end.
