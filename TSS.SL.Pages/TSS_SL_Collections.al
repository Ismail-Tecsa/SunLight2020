page 50050 "Collections"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Lists;
    AutoSplitKey = true;
    PromotedActionCategories = 'New,Processing';
    SourceTable = "Gen. Journal Line";
    Caption = 'Collections';

    // add over due other fees for non rental fees like settlement,
    //can select from the lines which booking entry for other fees
    //add function to create lines based on date, amount, days.
    //when post update booking entries.

    layout
    {

        area(Content)
        {

            group(Driver)
            {

                Field(CurrDriver; CurrDriver)
                {
                    ApplicationArea = all;
                    Caption = 'Driver No.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        DriverList: page "Driver List";
                        DriverRec: Record customer;
                    begin
                        clear(DriverList);
                        clear(DriverName);
                        driverrec.reset;
                        DriverList.SetRecord(DriverRec);
                        DriverList.SetTableView(DriverRec);
                        DriverList.LookupMode := true;
                        if driverlist.RunModal() = action::LookupOK then begin
                            DriverList.GetRecord(DriverRec);
                            DriverName := driverrec.Name;
                            CurrDriver := DriverRec."No.";
                            customer.get(driverrec."No.");
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        customer.get(CurrDriver);
                        DriverName := customer.Name;
                    end;
                }

                field(DriverName; DriverName)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Caption = 'Name';
                }
            }
            group(Contract)
            {
                field(CurrContract; CurrContract)
                {
                    ApplicationArea = all;
                    Caption = 'Contract No.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ContractList: page "Service Contract List";
                        ContractRec: Record "Service Contract Header";
                        SearchContract: record "Service Contract Header";
                    begin
                        clear(ContractList);
                        clear(TaxiID);
                        contractrec.reset;
                        searchcontract.reset;
                        SearchContract.setrange("Customer No.", customer."No.");
                        if searchcontract.findfirst then
                            repeat
                                contractrec.get(SearchContract."Contract Type", SearchContract."Contract No.");
                                contractrec.Mark(true);
                            until SearchContract.next = 0;

                        SearchContract.setrange("Driver 1", Customer."No.");
                        if searchcontract.findfirst then
                            repeat
                                if SearchContract."Customer No." <> SearchContract."Driver 1" then begin
                                    contractrec.get(SearchContract."Contract Type", SearchContract."Contract No.");
                                    contractrec.Mark(true);
                                end;
                            until SearchContract.next = 0;
                        SearchContract.setrange("Driver 2", customer."No.");
                        if searchcontract.findfirst then
                            repeat
                                if SearchContract."Customer No." <> SearchContract."Driver 2" then begin
                                    contractrec.get(SearchContract."Contract Type", SearchContract."Contract No.");
                                    contractrec.Mark(true);
                                end;
                            until SearchContract.next = 0;

                        ContractRec.MarkedOnly(true);
                        ContractList.SetRecord(ContractRec);
                        ContractList.SetTableView(ContractRec);
                        ContractList.LookupMode := true;
                        if Contractlist.RunModal() = action::LookupOK then begin
                            contractList.GetRecord(contractRec);
                            CurrContract := contractRec."contract No.";
                            ServContHead.get(ContractRec."Contract Type", ContractRec."Contract No.");
                            ServContLine.reset;
                            ServContLine.SetRange("Contract No.", ServContHead."Contract No.");
                            ServContLine.findfirst;
                            taxis.get(ServContLine."Taxi ID");
                            TaxiID := taxis."Taxi ID";
                            SETRANGE("Journal Template Name", 'CASHRCPT');
                            setrange("Journal Batch Name", CurrContract);
                            if count <> 0 then begin
                                AllowEdit := true;
                                CalcTotals();
                            end;

                        end;

                    end;

                    trigger OnValidate()
                    var
                        ContractRec: Record "Service Contract Header";
                    begin
                        if CurrContract = '' then begin
                            AllowEdit := false;
                            exit;
                        end;

                        ServContHead.get(ContractRec."Contract Type", ContractRec."Contract No.");
                        ServContLine.reset;
                        ServContLine.SetRange("Contract No.", ServContHead."Contract No.");
                        ServContLine.findfirst;
                        taxis.get(ServContLine."Taxi ID");
                        TaxiID := taxis."Taxi ID";
                        SETRANGE("Journal Template Name", 'CASHRCPT');
                        setrange("Journal Batch Name", CurrContract);
                        if count <> 0 then begin
                            AllowEdit := true;
                            CalcTotals();
                        end;

                    end;

                }
                field(TAXID; TaxiID)
                {
                    ApplicationArea = all;
                    Caption = 'Taxi';
                    Editable = false;
                }
            }

            group(Payment)
            {
                Caption = 'Payment Calculation Criteria';
                Field(PDays; PayDay)
                {
                    ApplicationArea = all;
                    Caption = 'No. of Days';
                    trigger OnValidate()

                    begin
                        if PayDay <> 0 then begin
                            PayDate := 0D;
                            PayAmount := 0;
                        end;
                    end;
                }
                field(PDate; PayDate)
                {
                    ApplicationArea = all;
                    Caption = 'Up to Date';
                    trigger OnValidate()

                    begin
                        if PayDate <> 0D then begin
                            PayDay := 0;
                            PayAmount := 0;
                        end;
                    end;
                }

                field(PAmount; PayAmount)
                {
                    ApplicationArea = all;
                    Caption = 'Amount';
                    trigger OnValidate()

                    begin
                        if PayAmount <> 0 then begin
                            PayDate := 0D;
                            Payday := 0;
                        end;
                    end;
                }

            }
            repeater(General)
            {

                Editable = AllowEdit;
                Visible = allowedit;

                field("Journal Template Name"; "Journal Template Name")
                {
                    ApplicationArea = all;
                    Visible = false;

                }
                field("Journal Batch Name"; "Journal Batch Name")
                {
                    ApplicationArea = all;
                    Visible = false;

                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = all;
                }
                field("Taxi No."; "Taxi No.")
                {
                    ApplicationArea = all;
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Payment Method Code';

                    Width = 10;
                    trigger OnValidate()
                    begin
                        PayMeth := "Payment Method Code";
                        VALIDATE("Document Type", "Document Type"::Payment);
                        VALIDATE("Account Type", "Account Type"::Customer);
                        VALIDATE("Account No.", CustNo);
                        "Applies-to Ext. Doc. No." := CurrentJnlBatchName;
                        "Payment Method Code" := PayMeth;
                        if PaymentMethod.get("Payment Method Code") then begin
                            IF PaymentMethod."Bal. Account Type" = PaymentMethod."Bal. Account Type"::"Bank Account" THEN
                                VALIDATE("Bal. Account Type", "Bal. Account Type"::"Bank Account")
                            ELSE
                                VALIDATE("Bal. Account Type", "Bal. Account Type"::"G/L Account");

                            "Bal. Account No." := PaymentMethod."Bal. Account No.";
                        end;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        CLEAR(PayMethPage);

                        PaymentMethod.RESET;

                        PayMethPage.LOOKUPMODE := TRUE;
                        PayMethPage.SETTABLEVIEW(PaymentMethod);

                        IF PayMethPage.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            PayMethPage.GETRECORD(PaymentMethod);
                            Text := FORMAT(PaymentMethod.Code);
                            EXIT(TRUE);
                            //  VALIDATE("Payment Method Code",PaymentMethod.Code);
                        END;
                    end;

                }
                field("External Document No."; "External Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'External Document No.';
                    width = 10;

                }
                field("Amount"; "Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Amount';
                    width = 6;
                    trigger OnValidate();
                    begin


                    end;
                }

            }

            group("Details")
            {
                ShowCaption = false;
                group("Total Days")
                {
                    ShowCaption = false;
                    field(TotalDays; TotalDays)
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = false;
                        Caption = 'Total Days';
                        ToolTip = 'Specifies total days';
                    }
                }

                group("Total Amount")
                {
                    ShowCaption = false;
                    field(TotalAmount; TotalAmount)
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = false;
                        Caption = 'Total Amount';

                        ToolTip = 'Amount';
                    }
                }

            }
        }

        area(FactBoxes)
        {
            part(OwnerFactbox; "Owner Details FactBox")
            {
                ApplicationArea = all;
                SubPageLink = "Taxi ID" = field("Taxi No.");

            }

            part("Taxi Details"; "Taxi Details FactBox")
            {
                ApplicationArea = all;
                SubPageLink = "Taxi ID" = field("Taxi No.");

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Calculate")
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;

                trigger OnAction()
                begin

                    GetBatchNo(CurrContract);
                    SubCabMgmt.CalculatePayment(g_BatchName, CurrContract, PayAmount, payday, PayDate);
                    AllowEdit := true;
                    CalcTotals();
                end;
            }
        }

    }

    trigger OnOpenPage();
    begin
        usersetup.get(userid);
        AllowEdit := false;
        setrange("Journal Template Name", 'CASHRCPT');
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        UpdateBalance();
        EnableApplyEntriesAction();
        SetUpNewLine(xRec, Balance, BelowxRec);
        CLEAR(ShortcutDimCode);
        "Document No." := COPYSTR(USERID, 1, 20);
    end;

    local procedure UpdateBalance();
    begin
        CalcTotals();
        GenJnlManagement.CalcBalance(
        Rec, xRec, Balance, TotalBalance, ShowBalance, ShowTotalBalance);
        BalanceVisible := ShowBalance;
        TotalBalanceVisible := ShowTotalBalance;
    end;

    trigger OnClosePage()
    var
        SH: Record "Sales Header";
        CLE: Record "Cust. Ledger Entry";
    begin
        if (FINDSET()) and ("Applies-to Ext. Doc. No." <> '') then begin
            g_BatchName := "Applies-to Ext. Doc. No.";
            "Posting Date" := WORKDATE();
            if "Document No." = '' then
                "Document No." := COPYSTR(USERID, 1, 20);
            MODIFY();
            //  _DocNo := "Document No.";
            CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", Rec);
            //  SH.GET(SH."Document Type"::Order,g_BatchName);
            SH.RESET();
            SH.SETRANGE("Document Type", SH."Document Type"::Order);
            SH.SETRANGE("No.", g_BatchName);
            SH.FINDFIRST();
            CLE.RESET();
            cle.SetCurrentKey("Entry No.");
            CLE.SETRANGE("Customer No.", SH."Bill-to Customer No.");
            CLE.SETRANGE("Applies-to Ext. Doc. No.", SH."No.");
            //  CLE.SETRANGE("Document No.",_DocNo);
            if CLE.FINDLAST() then begin
                cle.setrange("Document no.", cle."Document No.");
                cle.findfirst();

                //    REPORT.RUNMODAL(50006,TRUE,FALSE,CLE);
                //     IF CONFIRM('Do you wish to print the receipt?',TRUE) THEN
                REPORT.RUNMODAL(50006, true, false, CLE);
            end;
        end;
    end;

    local procedure EnableApplyEntriesAction();
    begin
        ApplyEntriesActionEnabled :=
          ("Account Type" in ["Account Type"::Customer, "Account Type"::Vendor]) or
          ("Bal. Account Type" in ["Bal. Account Type"::Customer, "Bal. Account Type"::Vendor]);
    end;

    procedure GetBatchNo(_BatchName: Code[10])
    begin

        if not GenJnlBatch.GET('CASHRCPT', _BatchName) then begin
            GenJnlBatch."Journal Template Name" := 'CASHRCPT';
            GenJnlBatch.Name := _BatchName;
            GenJnlBatch."Bal. Account Type" := GenJnlBatch."Bal. Account Type"::"Bank Account";
            GenJnlBatch."Posting No. Series" := 'GJNL-PCR';
            GenJnlBatch."No. Series" := '';//'GJNL-RCPT';
            GenJnlBatch.INSERT();
            commit;
        end;

        RESET();
        g_BatchName := _BatchName;
        CurrentJnlBatchName := g_BatchName;//"Journal Batch Name";
        SETRANGE("Journal Template Name", 'CASHRCPT');
        setrange("Journal Batch Name", g_BatchName);
        if count <> 0 then begin
            if confirm('Do you wish to recalculate and remove the existing lines?') then begin
                deleteall;
            end;
        end;
        CurrPage.Update();
        GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
        //        SetControlAppearanceFromBatch();
    end;

    local procedure CalcTotals();
    var
        l_GJL: Record "Gen. Journal Line";
    begin
        l_gjl.reset;
        l_gjl.setrange("Journal Template Name", 'CASHRCPT');
        l_gjl.SetRange("Journal Batch Name", CurrContract);
        l_gjl.CalcSums(amount);
        Totalamount := l_gjl.Amount;
        TotalDays := l_gjl.count;
        CurrPage.update;
    end;

    local procedure SetControlAppearanceFromBatch();
    var
        GenJournalBatch: Record "Gen. Journal Batch";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
        CanRequestFlowApprovalForAllLines: Boolean;
    begin
        if ("Journal Template Name" <> '') and ("Journal Batch Name" <> '') then
            GenJournalBatch.GET("Journal Template Name", "Journal Batch Name")
        else
            if not GenJournalBatch.GET(GETRANGEMAX("Journal Template Name"), CurrentJnlBatchName) then
                exit;

        CheckOpenApprovalEntries(GenJournalBatch.RECORDID);

        CanCancelApprovalForJnlBatch := ApprovalsMgmt.CanCancelApprovalForRecord(GenJournalBatch.RECORDID);

        WorkflowWebhookManagement.GetCanRequestAndCanCancelJournalBatch(
          GenJournalBatch, CanRequestFlowApprovalForBatch, CanCancelFlowApprovalForBatch, CanRequestFlowApprovalForAllLines);
        CanRequestFlowApprovalForBatchAndAllLines := CanRequestFlowApprovalForBatch and CanRequestFlowApprovalForAllLines;
    end;

    local procedure CheckOpenApprovalEntries(BatchRecordId: RecordID);
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUserBatch := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(BatchRecordId);

        OpenApprovalEntriesOnJnlBatchExist := ApprovalsMgmt.HasOpenApprovalEntries(BatchRecordId);

        OpenApprovalEntriesOnBatchOrAnyJnlLineExist :=
          OpenApprovalEntriesOnJnlBatchExist or
          ApprovalsMgmt.HasAnyOpenJournalLineApprovalEntries("Journal Template Name", "Journal Batch Name");
    end;


    var
        PaymentMethod: Record "Payment Method";
        PayDay: Integer;
        AllowEdit: Boolean;
        PayDate: Date;
        PayAmount: Decimal;
        DriverName: text[50];
        TaxiID: code[10];
        taxis: record taxis;
        ServContHead: record "Service Contract Header";
        ServContLine: record "Service COntract Line";
        SubCabMgmt: codeunit "SunCab Journal Management";

        CurrDriver: code[20];
        Customer: record customer;
        CurrContract: code[10];
        PayMethPage: Page "Payment Methods";
        UserSetup: record "User Setup";
        GenJnlBatch: Record "Gen. Journal Batch";
        GenJnlManagement: Codeunit GenJnlManagement;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ChangeExchangeRate: Page "Change Exchange Rate";
        PayMeth: Code[20];
        CanCancelApprovalForJnlBatch: Boolean;
        CanRequestFlowApprovalForBatch: Boolean;
        CanRequestFlowApprovalForBatchAndAllLines: Boolean;
        CanRequestFlowApprovalForBatchAndCurrentLine: Boolean;
        CanCancelFlowApprovalForBatch: Boolean;
        OpenApprovalEntriesExistForCurrUserBatch: Boolean;
        OpenApprovalEntriesOnJnlBatchExist: Boolean;
        OpenApprovalEntriesOnBatchOrAnyJnlLineExist: Boolean;
        OpenApprovalEntriesOnJnlLineExist: Boolean;
        g_BatchName: Code[20];
        OverDueDays: Integer;
        TotalDays: Integer;
        OverDueAmount: decimal;
        Totalamount: decimal;
        AccName: Text[100];
        BalAccName: Text[100];
        Balance: Decimal;
        CustNo: Code[20];
        ShortcutDimCode: array[8] of Code[20];
        CurrentJnlBatchName: Code[20];
        ApplyEntriesActionEnabled: Boolean;
        TotalBalance: Decimal;
        ShowBalance: Boolean;
        ShowTotalBalance: Boolean;
        BalanceVisible: Boolean;
        TotalBalanceVisible: Boolean;
}