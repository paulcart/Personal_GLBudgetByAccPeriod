pageextension 50360 "G/L Budget Names by Acc. P." extends "G/L Budget Names"
{
    actions
    {
        modify(EditBudget)
        {
            Visible = false;
        }
        addbefore(EditBudget)
        {
            action(EditBudgetByAccPeriod)
            {
                ApplicationArea = Suite;
                Caption = 'Edit Budget';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ShortCutKey = 'Return';
                ToolTip = 'Specify budgets that you can create in the general ledger application area. If you need several different budgets, you can create several budget names.';

                trigger OnAction()
                var
                    Budget: Page "Budget by Acc. Period";
                begin
                    Budget.SetBudgetName(Name);
                    Budget.Run;
                end;
            }
        }
    }
}