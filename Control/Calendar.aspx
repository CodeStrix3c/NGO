<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calendar.aspx.cs" Inherits="Admin_Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>::Calendar::</title>
</head>
<body style="margin:0 0 0 0 ">
    <form id="Form1" runat="server">
        <asp:Calendar id="Calendar1" runat="server" BackColor="White" FirstDayOfWeek="Monday" BorderColor="#3366CC" ForeColor="#F98C13" 
        Height="120px" Width="30px" Font-Names="Arial" Font-Size="10pt" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" DayNameFormat="Shortest" BorderWidth="1px" CellPadding="1">
            <TitleStyle backcolor="#85C329" forecolor="White" Font-Bold="True"  Height="25px" BorderColor="#3366CC" BorderWidth="1px" />
            <NextPrevStyle forecolor="White" Font-Size="8pt" />
            <OtherMonthDayStyle forecolor="#999999" />
            <SelectedDayStyle BackColor="#014455" ForeColor="White" Font-Bold="True" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <DayHeaderStyle BackColor="#CECECE" ForeColor="WHITE" Height="1px" />
            <SelectorStyle BackColor="#A0A0A0"
                ForeColor="#014455" />
            <WeekendDayStyle BackColor="#CECECE" />
        </asp:Calendar>
        <asp:Literal id="Literal1" runat="server"></asp:Literal>
    </form>
</body>
</html>
