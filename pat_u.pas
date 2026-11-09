unit pat_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Menus;

type
  TfrmMonexa = class(TForm)
    pgcMain: TPageControl;
    tsUserLogin: TTabSheet;
    tsAdminLogin: TTabSheet;
    edtPassword: TEdit;
    edtUsername: TEdit;
    pnlUserLogin: TPanel;
    lblOr: TLabel;
    lblLoginAsAdmin: TLabel;
    lblHeading: TLabel;
    pnlAdminLogin: TPanel;
    lblOr2: TLabel;
    lblLoginAsUser: TLabel;
    lblHeadingAdmin: TLabel;
    edtAdminUser: TEdit;
    edtAdminPassword: TEdit;
    tsUserDashboard: TTabSheet;
    lblWelcomeUser: TLabel;
    pnlSidebar: TPanel;
    pnlIncome: TPanel;
    pnlExpense: TPanel;
    pnlRemBal: TPanel;
    pnlQuickAdd: TPanel;
    pnlTransHistory: TPanel;
    imgMonexaLogo: TImage;
    pnlDashboard: TPanel;
    pnlAddTransactions: TPanel;
    pnlHistory: TPanel;
    tsTransactions: TTabSheet;
    tsHistory: TTabSheet;
    pnlSideBar_History: TPanel;
    imgMonexa_History: TImage;
    pnlDashboard_History: TPanel;
    pnlTransactions_History: TPanel;
    pnlHistory_History: TPanel;
    redOut: TRichEdit;
    pnlSidebar_Transactions: TPanel;
    imgMonexa_Transactions: TImage;
    pnlDashboard_Transactions: TPanel;
    pnlTransactions_Transactions: TPanel;
    pnlHistory_Transactions: TPanel;
    pnlTransactionHolder: TPanel;
    pnlBackground: TPanel;
    pnlLoginBtn: TPanel;
    pnlBackgroundAdmin: TPanel;
    pnlAdminLoginBtn: TPanel;
    pnlBackgroundDashboard: TPanel;
    imgLoginLogo: TImage;
    Image1: TImage;
    tsAdminDashboard: TTabSheet;
    pnlBackgroundHistory: TPanel;
    lblTransactionHistory_Heading: TLabel;
    lblUserDashboard_Heading: TLabel;
    lblIncome: TLabel;
    imgIncomeArrow: TImage;
    imgExpenseArrow: TImage;
    lblExpense: TLabel;
    imgWallet: TImage;
    lblRemBal: TLabel;
    lblIncomeAmt: TLabel;
    lblExpenseAmt: TLabel;
    lblRemBalAmt: TLabel;
    redTransHistory_Dashboard: TRichEdit;
    bbLoad: TBitBtn;
    bbFilter: TBitBtn;
    pnlBackgroundTransaction: TPanel;
    lblTransactions_Heading: TLabel;
    cmbTransactionType: TComboBox;
    lblIncomeOrExpense: TLabel;
    lblCategory: TLabel;
    cmbCategory_Unselected: TComboBox;
    dtpTransactionDate: TDateTimePicker;
    lblDate: TLabel;
    lblDescription: TLabel;
    edtDescription: TEdit;
    lblAmount: TLabel;
    edtAmount: TEdit;
    pnlSaveButton: TPanel;
    lblUnderHeading: TLabel;
    lblHistoryUnderHeading: TLabel;
    cmbCategory_Income: TComboBox;
    cmbCategory_Expense: TComboBox;
    lblOptionaSubHeading: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lblLoginAsUserClick(Sender: TObject);
    procedure lblLoginAsAdminClick(Sender: TObject);
    procedure pnlLoginBtnClick(Sender: TObject);
    procedure pnlAdminLoginBtnClick(Sender: TObject);
    procedure pnlSaveButtonClick(Sender: TObject);
    procedure cmbTransactionTypeChange(Sender: TObject);
    procedure bbLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMonexa: TfrmMonexa;
  //Custom colours
  clEmeraldGreen : TColor;
  clMantis : TColor;
  clGrey : TColor;
  clBlack : TColor;

  //Globals
  iTransID : Integer;
  arrType: array[1..1000] of String;
  arrCategory: array[1..1000] of String;
  arrDate: array[1..1000] of String;
  arrDescription: array[1..1000] of String;
  arrAmount: array[1..1000] of Real;
  mainFile : TextFile;
  configFile : TextFile;
  rTotalInc, rTotalExp, rTotalRemBal : Real;


implementation

{$R *.dfm}

procedure TfrmMonexa.bbLoadClick(Sender: TObject);
  var
    i : Integer;
    sOutput : String;

  begin

    for i := 1 to iTransID do
      AssignFile(mainFile, 'save.txt');
      Reset(mainFile);


      redOut.Clear;

      while not EOF(mainFile) do
      begin
        ReadLn(mainFile, sOutput);
        redOut.Lines.Add(sOutput);
      end;

      CloseFile(mainFile);

  end;

procedure TfrmMonexa.cmbTransactionTypeChange(Sender: TObject);
  begin

    //If income is selected, bring income combobox to the front
    if cmbTransactionType.Text = 'Income' then
    begin

      cmbCategory_Income.BringToFront;

    end
    else
    begin

      cmbCategory_Expense.BringToFront;

    end;


  end;

procedure TfrmMonexa.FormCreate(Sender: TObject);
  var
    sID, sTotalInc, sTotalExp, sTotalRemBal : String;

  begin

    //Create custom colours
    clEmeraldGreen := rgb(32, 211, 116);
    clMantis := rgb(109, 191, 90);
    clGrey := rgb(38, 38, 38);
    clBlack := rgb(20, 20, 20);

    //Init
    AssignFile(configFile, 'config.txt');
    Reset(configFile);
    ReadLn(configFile, sID);
    ReadLn(configFile, sTotalInc);
    ReadLn(configFile, sTotalExp);
    ReadLn(configFile, sTotalRemBal);

    if Trim(sID) = '' then
      iTransID := 1
    else
      iTransID := StrToInt(sID);

    if Trim(sTotalInc) = '' then
      rTotalInc := 0
    else
      rTotalInc := StrToFloat(sTotalInc);

    if Trim(sTotalExp) = '' then
      rTotalExp := 0
    else
      rTotalExp := StrToFloat(sTotalExp);

    if Trim(sTotalRemBal) = '' then
      rTotalRemBal := 0
    else
      rTotalRemBal := StrToFloat(sTotalRemBal);

    CloseFile(configFile);

    lblIncomeAmt.Caption := FloatToStrF(rTotalInc, ffCurrency, 8, 2);
    lblExpenseAmt.Caption := FloatToStrF(rTotalExp, ffCurrency, 8, 2);
    lblRemBalAmt.Caption := FloatToStrF(rTotalRemBal, ffCurrency, 8, 2);

    //Spacing
    redOut.Paragraph.TabCount := 6;
    redOut.Paragraph.Tab[0] := 40;
    redOut.Paragraph.Tab[1] := 105;
    redOut.Paragraph.Tab[2] := 190;
    redOut.Paragraph.Tab[3] := 265;
    redOut.Paragraph.Tab[4] := 470;
    redOut.Paragraph.Tab[5] := 570;

    //Hide admin panels
    tsAdminLogin.TabVisible := False;
    tsAdminDashboard.TabVisible := False;

    //Change dtp
    dtpTransactionDate.Date := Date();

    //Bring unselected cmb to front
    cmbCategory_Unselected.BringToFront;

    //Change colours
      //User login
      pnlBackground.Color := clBlack;
      pnlUserLogin.Color := clGrey;
      pnlLoginBtn.Color := clMantis;

      //Admin login
      pnlAdminLogin.Color := clGrey;
      pnlAdminLoginBtn.Color := clMantis;

      //Dashboard
      pnlBackgroundDashboard.Color := clBlack;
      pnlIncome.Color := clGrey;
      pnlExpense.Color := clGrey;
      pnlRemBal.Color := clGrey;
      pnlTransHistory.Color := clGrey;
      pnlQuickAdd.Color := clGrey;
      lblIncomeAmt.Font.Color := clMantis;
      //Sidebar
      pnlSidebar.Color := clGrey;
      pnlDashboard.Color := clMantis;
      pnlAddTransactions.Color := clMantis;
      pnlHistory.Color := clMantis;

      //Transactions
      pnlSidebar_Transactions.Color := clGrey;
      pnlDashboard_Transactions.Color := clMantis;
      pnlTransactions_Transactions.Color := clMantis;
      pnlHistory_Transactions.Color := clMantis;
      pnlTransactionHolder.Color := clGrey;
      pnlBackgroundTransaction.Color := clBlack;

      //History
      pnlBackgroundHistory.Color := clBlack;
      redOut.Color := clGrey;
      pnlSaveButton.Color := clMantis;
      //Sidebar
      pnlSidebar_History.Color := clGrey;
      pnlDashboard_History.Color := clMantis;
      pnlTransactions_History.Color := clMantis;
      pnlHistory_History.Color := clMantis;

  end;

procedure TfrmMonexa.lblLoginAsAdminClick(Sender: TObject);
  begin

    //Goto user login
    pgcMain.TabIndex := 1;

    //Hide user panel
    tsUserLogin.TabVisible := False;

    //Show admin panel
    tsAdminLogin.TabVisible := True;

  end;

procedure TfrmMonexa.lblLoginAsUserClick(Sender: TObject);
  begin

    //Goto user login
    pgcMain.TabIndex := 0;

    //Hide admin panel
    tsAdminLogin.TabVisible := False;

    //Show user panel
    tsUserLogin.TabVisible := True;

  end;

procedure TfrmMonexa.pnlAdminLoginBtnClick(Sender: TObject);
  var
    sAdminUsername, sAdminPassword, sEnteredUser, sEnteredPass : String;

  begin

    //Define username and password
    sAdminUsername := 'user';
    sAdminPassword := 'admin';

    //Get inputs, but validate first
    sEnteredUser := edtAdminUser.Text;
    sEnteredPass := edtAdminPassword.Text;

    //First check that the fields are not empty
    if Trim(sEnteredUser) = '' then
      begin

        ShowMessage('The username field cannot be left empty.');
        edtUsername.SetFocus;

      end
    else if Trim(sEnteredPass) = '' then
      begin

        ShowMessage('The password field cannot be left empty.');
        edtPassword.SetFocus;

      end

    //Check if the entered username and password are correct
    else if (Trim(sEnteredUser) = sAdminUsername) and (Trim(sEnteredPass) = sAdminPassword) then
      begin

        //Let the user know they logged in
        tsAdminLogin.TabVisible := False;

        //Show admin panels
        tsAdminDashboard.TabVisible := True;

        //Hide other panels
        tsUserDashboard.TabVisible := False;
        tsTransactions.TabVisible := False;
        tsHistory.TabVisible := False;

      end

    //Check if the entered information is incorrect
    else if Trim(sEnteredUser) <> sAdminUsername then
      begin

        ShowMessage('The entered username does not exist.');

      end
    else if Trim(sEnteredPass) <> sAdminPassword then
      begin

        ShowMessage('The entered password is incorrect.');

      end;
  end;

procedure TfrmMonexa.pnlLoginBtnClick(Sender: TObject);
  var
    sUsername, sPassword, sEnteredUser, sEnteredPass : String;

  begin

    //Define username and password
    sUsername := 'user';
    sPassword := '1234!';

    //Get inputs, but validate first
    sEnteredUser := edtUsername.Text;
    sEnteredPass := edtPassword.Text;

    //First check that the fields are not empty
    if Trim(sEnteredUser) = '' then
      begin

        ShowMessage('The username field cannot be left empty.');
        edtUsername.SetFocus;

      end
    else if Trim(sEnteredPass) = '' then
      begin

        ShowMessage('The password field cannot be left empty.');
        edtPassword.SetFocus;

      end

    //Check if the entered username and password are correct
    else if (Trim(sEnteredUser) = sUsername) and (Trim(sEnteredPass) = sPassword) then
      begin

        //Let the user know they are logged in
        tsUserLogin.TabVisible := False;

        //Make the user tabsheets visible
        tsUserDashboard.TabVisible := True;
        tsTransactions.TabVisible := True;
        tsHistory.TabVisible := True;

        //Hide the other panels
        tsAdminLogin.TabVisible := False;
        tsAdminDashboard.TabVisible := False;

      end

    //Check if the entered information is incorrect
    else if Trim(sEnteredUser) <> sUsername then
      begin

        ShowMessage('The entered username does not exist.');

      end
    else if Trim(sEnteredPass) <> sPassword then
      begin

        ShowMessage('The entered password is incorrect.');

      end;

  end;

procedure TfrmMonexa.pnlSaveButtonClick(Sender: TObject);
  var
    sType : String;
    rEnteredAmt : Double;
    i : Integer;

  begin

    //First check if input is an income or expense
    sType := cmbTransactionType.Text;

    //Init
    rEnteredAmt := 0;

    //Validate the combo boxes
    if cmbTransactionType.ItemIndex = -1 then
    begin
      ShowMessage('Please select a transaction type.');
    end
    else if (cmbTransactionType.Text = 'Income') and (cmbCategory_Income.ItemIndex = -1) then
    begin
      ShowMessage('Please select a category.');
    end
    else if (cmbTransactionType.Text = 'Expense') and (cmbCategory_Expense.ItemIndex = -1) then
    begin
      ShowMessage('Please select a category.');
    end

    //Checks if the amount box is empty
    else if Trim(edtAmount.Text) = '' then
    begin
      ShowMessage('The amount cannot be empty.');
    end

    //Checks if amount is a number, then if the amount is above zero
    else if TryStrToFloat(edtAmount.Text, rEnteredAmt) then
    begin
      if StrToFloat(edtAmount.Text) > 0 then
      begin

        //If all tests pass, go through saving the information into the arrays, then into a text file
        if cmbTransactionType.Text = 'Income' then
        begin

          //Add values to arrays
          arrType[iTransID] := 'Income';
          arrCategory[iTransID] := cmbCategory_Income.Text;
          arrDate[iTransID] := DateToStr(dtpTransactionDate.Date);
          arrDescription[iTransID] := edtDescription.Text;
          arrAmount[iTransID] := rEnteredAmt;

          //Add to totals
          rTotalInc := rTotalInc + rEnteredAmt;
          rTotalRemBal := rTotalInc - rTotalExp;

          //Save to text file
          AssignFile(mainFile, 'save.txt');
          Reset(mainFile);

          //If file is empty, rewrite
          if EOF(mainFile) then
            Rewrite(mainFile)
          else
            Append(mainFile);

          ShowMessage('Saving...');

          WriteLn(mainFile,IntToStr(iTransID), #9, arrType[iTransID], #9, arrCategory[iTransID], #9, arrDate[iTransID], #9, arrDescription[iTransID], #9, FloatToStrF(arrAmount[iTransID], ffCurrency, 8, 2));

          //Increment transID
          iTransID := iTransID + 1;

          CloseFile(mainFile);

          //Save transaction id to config file
          AssignFile(configFile, 'config.txt');
          Rewrite(configFile);

          WriteLn(configFile, iTransID);
          WriteLn(configFile, rTotalInc);
          WriteLn(configFile, rTotalExp);
          WriteLn(configFile, rTotalRemBal);

          CloseFile(configFile);

          lblIncomeAmt.Caption := FloatToStrF(rTotalInc, ffCurrency, 8, 2);
          lblExpenseAmt.Caption := FloatToStrF(rTotalExp, ffCurrency, 8, 2);
          lblRemBalAmt.Caption := FloatToStrF(rTotalRemBal, ffCurrency, 8, 2);

        end
        else if cmbTransactionType.Text = 'Expense' then
        begin

          //Add values to arrays
          arrType[iTransID] := 'Expense';
          arrCategory[iTransID] := cmbCategory_Expense.Text;
          arrDate[iTransID] := DateToStr(dtpTransactionDate.Date);
          arrDescription[iTransID] := edtDescription.Text;
          arrAmount[iTransID] := rEnteredAmt;

          //Add to totals
          rTotalExp := rTotalExp + rEnteredAmt;
          rTotalRemBal := rTotalInc - rTotalExp;

          //Save to text file
          AssignFile(mainFile, 'save.txt');
          Reset(mainFile);

          //If file is empty, rewrite
          if EOF(mainFile) then
            Rewrite(mainFile)
          else
            Append(mainFile);

          ShowMessage('Saving...');

          WriteLn(mainFile,IntToStr(iTransID), #9, arrType[iTransID], #9, arrCategory[iTransID], #9, arrDate[iTransID], #9, arrDescription[iTransID], #9, FloatToStrF(arrAmount[iTransID], ffCurrency, 8, 2));

          //Increment transID
          iTransID := iTransID + 1;

          CloseFile(mainFile);

          //Save transaction id to config file
          AssignFile(configFile, 'config.txt');
          Rewrite(configFile);

          WriteLn(configFile, iTransID);
          WriteLn(configFile, rTotalInc);
          WriteLn(configFile, rTotalExp);
          WriteLn(configFile, rTotalRemBal);

          CloseFile(configFile);

          lblIncomeAmt.Caption := FloatToStrF(rTotalInc, ffCurrency, 8, 2);
          lblExpenseAmt.Caption := FloatToStrF(rTotalExp, ffCurrency, 8, 2);
          lblRemBalAmt.Caption := FloatToStrF(rTotalRemBal, ffCurrency, 8, 2);

        end

      end
      else
        ShowMessage('The amount must be greater than 0.');
    end

    //If it is not a number, give the user an error
    else
    begin
      ShowMessage('Please enter a number.');
    end;


  end;

end.
