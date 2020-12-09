pageextension 50004 "Pay. Jnl. Line Extension" extends "Payment Journal"
{
  layout
  {
    addafter("Account No.")
    {
      field("Contract No.";"Contract No.")
      {
        ApplicationArea = all;
      }
      field("Taxi No.";"Taxi No.")
      {
        ApplicationArea = all;
      }
      field("Driver No.";"Driver No.")
      {
        ApplicationArea = all;
      }
      field("TIP Step";"TIP Step")
      {
        ApplicationArea = all;
      }
      field("Taxi Company";"Taxi Company")
      {
        ApplicationArea = all;
      }
    }
  }
}
