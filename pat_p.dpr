program pat_p;

uses
  Vcl.Forms,
  pat_u in 'pat_u.pas' {frmMonexa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMonexa, frmMonexa);
  Application.Run;
end.
