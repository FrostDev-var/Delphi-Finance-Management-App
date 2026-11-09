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
    imgAdminMonexaLogo: TImage;
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
    pnlAdmin_Background: TPanel;
    pnlTotalExpenses: TPanel;
    lblTotalExpenseHead: TLabel;
    lblTotalExpenseAmt: TLabel;
    pnlTotalIncomes: TPanel;
    lblTotalIncomeHead: TLabel;
    lblTotalIncomeAmt: TLabel;
    pnlTotalTransactions: TPanel;
    lblTotalTransHead: TLabel;
    lblTotallTransAmt: TLabel;
    pnlFilter: TPanel;
    cmbTypeOfTrans: TComboBox;
    lblType: TLabel;
    cmbFilterCategory_Unselected: TComboBox;
    lblCategoryFilter: TLabel;
    bbClose: TBitBtn;
    bbApply: TBitBtn;
    cmbFilterCategory_IncomeSel: TComboBox;
    cmbFilterCategory_ExpenseSel: TComboBox;
    pnlLogout: TPanel;
    lblLogout: TLabel;
    bbAdminLogout: TBitBtn;
    redAdminRecent: TRichEdit;
    bbAdminLoad: TBitBtn;
    bbUserLogout: TBitBtn;
    bbLoginAsAdmin: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure lblLoginAsUserClick(Sender: TObject);
    procedure lblLoginAsAdminClick(Sender: TObject);
    procedure pnlLoginBtnClick(Sender: TObject);
    procedure pnlAdminLoginBtnClick(Sender: TObject);
    procedure pnlSaveButtonClick(Sender: TObject);
    procedure cmbTransactionTypeChange(Sender: TObject);
    procedure bbLoadClick(Sender: TObject);
    procedure pnlDashboardClick(Sender: TObject);
    procedure pnlAddTransactionsClick(Sender: TObject);
    procedure pnlHistoryClick(Sender: TObject);
    procedure pnlDashboard_TransactionsClick(Sender: TObject);
    procedure pnlTransactions_TransactionsClick(Sender: TObject);
    procedure pnlHistory_TransactionsClick(Sender: TObject);
    procedure pnlDashboard_HistoryClick(Sender: TObject);
    procedure pnlTransactions_HistoryClick(Sender: TObject);
    procedure pnlHistory_HistoryClick(Sender: TObject);
    procedure bbFilterClick(Sender: TObject);
    procedure bbCloseClick(Sender: TObject);
    procedure cmbTypeOfTransChange(Sender: TObject);
    procedure bbApplyClick(Sender: TObject);
    procedure bbAdminLogoutClick(Sender: TObject);
    procedure bbAdminLoadClick(Sender: TObject);
    procedure bbLoginAsAdminClick(Sender: TObject);
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

procedure TfrmMonexa.bbApplyClick(Sender: TObject);
  var
    sOutput, sType, sCategory : String;
    i : Integer;
    bType, bCat : Boolean;

  begin

    //Init redout
    redOut.Clear;
    redOut.Lines.Add('ID' + #9 + 'Type' + #9 + 'Category' + #9 + 'Date' + #9 + 'Description' + #9 + 'Amount');

    AssignFile(mainFile, 'save.txt');
    Reset(mainFile);

    i := 1;

    //Get type
    sType := cmbTypeOfTrans.Text;
    sCategory := '';

    if sType = 'Income' then
    begin

      sCategory := cmbFilterCategory_IncomeSel.Text;

    end
    else if sType = 'Expense' then
    begin

      sCategory := cmbFilterCategory_ExpenseSel.Text;

    end;

    for i := 1 to iTransID - 1 do
    begin
      //Readlines
      ReadLn(mainFile, sOutput);

      //Check if they match
      bType := (sType = '') or (arrType[i] = sType);
      bCat := (sCategory = '') or (arrCategory[i] = sCategory);

      //Compare
      if bType and bCat then
      begin

        redOut.Lines.Add(sOutput);

      end;

    end;

    CloseFile(mainFile);

    pnlFilter.SendToBack;
    cmbTypeOfTrans.ItemIndex := -1;
    cmbFilterCategory_Unselected.BringToFront;


  end;

procedure TfrmMonexa.bbCloseClick(Sender: TObject);
  begin

    //Hide filter
    pnlFilter.SendToBack;

  end;

procedure TfrmMonexa.bbFilterClick(Sender: TObject);
  begin

    //Show filters
    pnlFilter.BringToFront;

  end;

procedure TfrmMonexa.bbLoadClick(Sender: TObject);
  var
    i : Integer;
    sOutput : String;

  begin

    for i := 1 to iTransID do
      AssignFile(mainFile, 'save.txt');
      Reset(mainFile);

      redOut.Clear;

      redOut.Lines.Add('ID' + #9 + 'Type' + #9 + 'Category' + #9 + 'Date' + #9 + 'Description' + #9 + 'Amount');

      while not EOF(mainFile) do
      begin
        ReadLn(mainFile, sOutput);
        redOut.Lines.Add(sOutput);
        redTransHistory_Dashboard.Lines.Add(sOutput);
      end;

      CloseFile(mainFile);

  end;

procedure TfrmMonexa.bbLoginAsAdminClick(Sender: TObject);
  begin

    tsAdminLogin.TabVisible := True;
    tsUserDashboard.TabVisible := False;

  end;

procedure TfrmMonexa.bbAdminLoadClick(Sender: TObject);
  var
    sOutput : String;
    i : Integer;

  begin

    AssignFile(mainFile, 'save.txt');
    Reset(mainFile);

    //Init redOut
    redAdminRecent.Clear;
    redAdminRecent.Lines.Add('ID' + #9 + 'Type' + #9 + 'Category' + #9 + 'Date' + #9 + 'Description' + #9 + 'Amount');

    for i := 1 to 5 do
    begin

      ReadLn(mainFile, sOutput);

      redAdminRecent.Lines.Add(sOutput);

    end;

    CloseFile(mainFile);

  end;

procedure TfrmMonexa.bbAdminLogoutClick(Sender: TObject);
  begin

    //Return to login
    tsUserLogin.TabVisible := True;
    tsAdminDashboard.TabVisible := False;
    tsUserDashboard.TabVisible := False;

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

procedure TfrmMonexa.cmbTypeOfTransChange(Sender: TObject);
  begin

    if cmbTypeOfTrans.Text = 'Income' then
    begin

      cmbFilterCategory_IncomeSel.BringToFront;

    end
    else
      cmbFilterCategory_ExpenseSel.BringToFront;



  end;

procedure TfrmMonexa.FormCreate(Sender: TObject);
  var
    sID, sTotalInc, sTotalExp, sTotalRemBal, sOutput, sTemp : String;
    iPos, iID : Integer;

  begin

    //Create custom colours
    clEmeraldGreen := rgb(59, 115, 37);
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


    if rTotalRemBal > 0 then
    begin
      lblRemBalAmt.Font.Color := clMantis;
      lblRemBalAmt.Caption := 'R' + FloatToStrF(rTotalRemBal, ffFixed, 8, 2);
    end
    else if rTotalRemBal < 0 then
    begin
      lblRemBalAmt.Font.Color := clRed;
      lblRemBalAmt.Caption := '-R' + FloatToStrF(Abs(rTotalRemBal), ffFixed, 8, 2);
    end;

    lblIncomeAmt.Caption := 'R' + FloatToStrF(rTotalInc, ffFixed, 8, 2);
    lblExpenseAmt.Caption := 'R' + FloatToStrF(rTotalExp, ffFixed, 8, 2);

    // Load transaction information into arrays
    AssignFile(mainFile, 'save.txt');
    Reset(mainFile);

    while not EOF(mainFile) do
    begin
      ReadLn(mainFile, sOutput);
      sTemp := sOutput;

      // Get transaction ID
      iPos := Pos(#9, sTemp);
      iID := StrToInt(Copy(sTemp, 1, iPos - 1));
      Delete(sTemp, 1, iPos);

      // Get transaction type
      iPos := Pos(#9, sTemp);
      arrType[iID] := Copy(sTemp, 1, iPos - 1);
      Delete(sTemp, 1, iPos);

      // Get transaction category
      iPos := Pos(#9, sTemp);
      arrCategory[iID] := Copy(sTemp, 1, iPos - 1);
    end;

    CloseFile(mainFile);

    //Add to admin dashboard
    lblTotalIncomeAmt.Caption := 'R' + FloatToStrF(rTotalInc, ffFixed, 8, 2);
    lblTotalExpenseAmt.Caption := 'R' + FloatToStrF(rTotalExp, ffFixed, 8, 2);
    lblTotallTransAmt.Caption := IntToStr(iTransID - 1);

    //Spacing
    redOut.Paragraph.TabCount := 6;
    redOut.Paragraph.Tab[0] := 40;
    redOut.Paragraph.Tab[1] := 105;
    redOut.Paragraph.Tab[2] := 190;
    redOut.Paragraph.Tab[3] := 265;
    redOut.Paragraph.Tab[4] := 470;
    redOut.Paragraph.Tab[5] := 570;

    //Init redOut
    redOut.Lines.Add('ID' + #9 + 'Type' + #9 + 'Category' + #9 + 'Date' + #9 + 'Description' + #9 + 'Amount');

    //Hide admin panels
    tsAdminLogin.TabVisible := False;
    tsAdminDashboard.TabVisible := False;

    //Hide unnecessary
    tsUserDashboard.TabVisible := False;
    tsTransactions.TabVisible := False;
    tsHistory.TabVisible := False;
    pnlFilter.SendToBack;
    cmbFilterCategory_Unselected.BringToFront;

    //Change dtp
    dtpTransactionDate.Date := Date();

    //Bring unselected cmb to front
    cmbCategory_Unselected.BringToFront;

    //Change colours
      //User login
      pnlBackground.Color := clBlack;
      pnlUserLogin.Color := clGrey;
      pnlLoginBtn.Color := clMantis;
      edtPassword.PasswordChar := '*';

      //Admin login
      pnlAdminLoginBtn.Color := clBlack;
      pnlAdminLogin.Color := clGrey;
      pnlAdminLoginBtn.Color := clMantis;
      edtAdminPassword.PasswordChar := '*';

      //Admin dashboaard
      pnlLogout.Color := clGrey;
      pnlTotalExpenses.Color := clGrey;
      pnlTotalIncomes.Color := clGrey;
      pnlTotalTransactions.Color := clGrey;
      pnlAdmin_Background.Color := clBlack;
      redAdminRecent.Color := clGrey;

      //Dashboard
      pnlBackgroundDashboard.Color := clBlack;
      pnlIncome.Color := clGrey;
      pnlExpense.Color := clGrey;
      pnlRemBal.Color := clGrey;
      pnlTransHistory.Color := clGrey;
      pnlQuickAdd.Color := clGrey;
      lblIncomeAmt.Font.Color := clMantis;
      redTransHistory_Dashboard.Color := clGrey;
      //Sidebar
      pnlSidebar.Color := clGrey;
      pnlDashboard.Color := clEmeraldGreen;
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

procedure TfrmMonexa.pnlAddTransactionsClick(Sender: TObject);
  begin

    tsUserDashboard.TabVisible := False;
    tsTransactions.TabVisible := True;
    tsHistory.TabVisible := False;
    pnlTransactions_Transactions.Color := clEmeraldGreen;

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

        //Clear entries
        edtUsername.Clear;
        edtPassword.Clear;
        edtAdminUser.Clear;
        edtAdminPassword.Clear;

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

procedure TfrmMonexa.pnlDashboardClick(Sender: TObject);
  begin

    tsUserDashboard.TabVisible := True;
    tsTransactions.TabVisible := False;
    tsHistory.TabVisible := False;

  end;

procedure TfrmMonexa.pnlDashboard_HistoryClick(Sender: TObject);
  begin

    tsUserDashboard.TabVisible := True;
    tsTransactions.TabVisible := False;
    tsHistory.TabVisible := False;
    pnlDashboard.Color := clEmeraldGreen;

  end;

procedure TfrmMonexa.pnlDashboard_TransactionsClick(Sender: TObject);
  begin

    tsUserDashboard.TabVisible := True;
    tsTransactions.TabVisible := False;
    tsHistory.TabVisible := False;
    pnlDashboard.Color := clEmeraldGreen;

  end;

procedure TfrmMonexa.pnlHistoryClick(Sender: TObject);
  begin

    tsUserDashboard.TabVisible := False;
    tsTransactions.TabVisible := False;
    tsHistory.TabVisible := True;
    pnlHistory_History.Color := clEmeraldGreen;

  end;

procedure TfrmMonexa.pnlHistory_HistoryClick(Sender: TObject);
  begin

    tsUserDashboard.TabVisible := False;
    tsTransactions.TabVisible := False;
    tsHistory.TabVisible := True;

  end;

procedure TfrmMonexa.pnlHistory_TransactionsClick(Sender: TObject);
  begin

    tsUserDashboard.TabVisible := False;
    tsTransactions.TabVisible := False;
    tsHistory.TabVisible := True;
    pnlHistory_History.Color := clEmeraldGreen;

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

        //Make the user tabsheets visible
        tsUserDashboard.TabVisible := True;

        //Hide the other panels
        tsAdminLogin.TabVisible := False;
        tsAdminDashboard.TabVisible := False;

        tsUserLogin.TabVisible := False;

        //Clear entries
        edtUsername.Clear;
        edtPassword.Clear;
        edtAdminUser.Clear;
        edtAdminPassword.Clear;

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

          ShowMessage('Saved.');

          WriteLn(mainFile,IntToStr(iTransID), #9, arrType[iTransID], #9, arrCategory[iTransID], #9, arrDate[iTransID], #9, arrDescription[iTransID], #9, 'R', FloatToStrF(arrAmount[iTransID], ffFixed, 8, 2));

          //Increment transID
          Inc(iTransID);

          CloseFile(mainFile);

          //Save transaction id to config file
          AssignFile(configFile, 'config.txt');
          Rewrite(configFile);

          WriteLn(configFile, iTransID);
          WriteLn(configFile, rTotalInc);
          WriteLn(configFile, rTotalExp);
          WriteLn(configFile, rTotalRemBal);

          CloseFile(configFile);

          if rTotalRemBal > 0 then
          begin
            lblRemBalAmt.Font.Color := clMantis;
            lblRemBalAmt.Caption := 'R' + FloatToStrF(rTotalRemBal, ffFixed, 8, 2);
          end
          else if rTotalRemBal < 0 then
          begin
            lblRemBalAmt.Font.Color := clRed;
            lblRemBalAmt.Caption := '-R' + FloatToStrF(Abs(rTotalRemBal), ffFixed, 8, 2);
          end;

          lblIncomeAmt.Caption := 'R' + FloatToStrF(rTotalInc, ffFixed, 8, 2);
          lblExpenseAmt.Caption := 'R' + FloatToStrF(rTotalExp, ffFixed, 8, 2);

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

          ShowMessage('Saved.');

          WriteLn(mainFile,IntToStr(iTransID), #9, arrType[iTransID], #9, arrCategory[iTransID], #9, arrDate[iTransID], #9, arrDescription[iTransID], #9, 'R', FloatToStrF(arrAmount[iTransID], ffFixed, 8, 2));

          //Increment transID
          Inc(iTransID);

          CloseFile(mainFile);

          //Save transaction id to config file
          AssignFile(configFile, 'config.txt');
          Rewrite(configFile);

          WriteLn(configFile, iTransID);
          WriteLn(configFile, rTotalInc);
          WriteLn(configFile, rTotalExp);
          WriteLn(configFile, rTotalRemBal);

          CloseFile(configFile);

          if rTotalRemBal > 0 then
          begin
            lblRemBalAmt.Font.Color := clMantis;
            lblRemBalAmt.Caption := 'R' + FloatToStrF(rTotalRemBal, ffFixed, 8, 2);
          end
          else if rTotalRemBal < 0 then
          begin
            lblRemBalAmt.Font.Color := clRed;
            lblRemBalAmt.Caption := '-R' + FloatToStrF(Abs(rTotalRemBal), ffFixed, 8, 2);
          end;

          lblIncomeAmt.Caption := 'R' + FloatToStrF(rTotalInc, ffFixed, 8, 2);
          lblExpenseAmt.Caption := 'R' + FloatToStrF(rTotalExp, ffFixed, 8, 2);

        end

      end
      else
        ShowMessage('The amount must be greater than 0.');

      cmbTransactionType.ItemIndex := -1;
      cmbTransactionType.Text := '';
      cmbCategory_Unselected.BringToFront;
      edtDescription.Clear;
      edtAmount.Clear;

    end

    //If it is not a number, give the user an error
    else
    begin
      ShowMessage('Please enter a number.');
    end;


  end;

procedure TfrmMonexa.pnlTransactions_HistoryClick(Sender: TObject);
  begin

    tsUserDashboard.TabVisible := False;
    tsTransactions.TabVisible := True;
    tsHistory.TabVisible := False;
    pnlTransactions_Transactions.Color := clEmeraldGreen;

  end;

procedure TfrmMonexa.pnlTransactions_TransactionsClick(Sender: TObject);
  begin

    tsUserDashboard.TabVisible := False;
    tsTransactions.TabVisible := True;
    tsHistory.TabVisible := False;

  end;

end.
