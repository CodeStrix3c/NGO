<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exportPdf.aspx.cs" Inherits="Secure_exportPdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
                var printWindow = window.open('', '', 'height=400,width=800');
                printWindow.document.write('<html><head><title>Application</title>');
                printWindow.document.write('</head><body >');
                printWindow.document.write(panel.innerHTML);
                printWindow.document.write('</body></html>');
                printWindow.document.close();
                setTimeout(function () {
                    printWindow.print();
                }, 500);
                return false;
            }
    </script>
    <form id="form1" runat="server">
        <div>
            <h3>Registrations</h3>
            <fieldset>
                <legend>List below:</legend>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                <asp:Button ID="btnPrintDate" runat="server" Text="Print" OnClientClick="return PrintPanel();" />
                &nbsp;&nbsp;
               <%-- <asp:Button ID="btnExportPDF" runat="server" Text="ExportToPDF" OnClick="btnExportPDF_Click" />--%>

                <asp:Panel ID="pnlContents" runat="server">
                    <asp:GridView ID="Grid" runat="server" AllowPaging="True" PageSize="25" AutoGenerateColumns="False"
                        DataKeyNames="ID" ShowFooter="True" AllowSorting="True" OnPageIndexChanging="Grid_PageIndexChanging"
                        CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Applicant Details">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td style="width: 700px">
                                                <br />
                                                <b>
                                                    <asp:Label ID="lblName" runat="server" Font-Size="14px" Text='<%# Bind("Name") %>'></asp:Label></b><br />

                                                <b>Job Location :-  </b>
                                                <asp:Label ID="Label65" runat="server" Font-Size="14px" Text='<%# Bind("PreferenceDistOne") %>'></asp:Label>,
                                                         <asp:Label ID="Label66" runat="server" Font-Size="14px" Text='<%# Bind("PreferenceDistTwo") %>'></asp:Label>,
                                                         <asp:Label ID="Label67" runat="server" Font-Size="14px" Text='<%# Bind("PreferenceDistThree") %>'></asp:Label>
                                                <br />

                                                <b>Post Name:</b>
                                                <asp:Label ID="lblPostName" runat="server" Font-Size="14px" Text='<%# Bind("PostName") %>'></asp:Label><br />
                                                <b>Date:</b>
                                                <asp:Label ID="lblDate" runat="server" ForeColor="Blue" Font-Size="12px" Text='<%# Bind("CreatedDate" ,"{0:D}") %>'></asp:Label><br />
                                                <b>Gender:</b>
                                                <asp:Label ID="Label1" runat="server" Font-Size="14px" Text='<%# Bind("Gender") %>'></asp:Label>
                                                <b>, Marital Status:</b>
                                                <asp:Label ID="Label2" runat="server" Font-Size="14px" Text='<%# Bind("MaritalStatus") %>'></asp:Label><br />
                                                <b>DOB:</b>
                                                <asp:Label ID="Label3" runat="server" Font-Size="14px" Text='<%# Bind("DOB") %>'></asp:Label><br />
                                                <b>Parentage/Husband's Name:</b>
                                                <asp:Label ID="Label4" runat="server" Font-Size="14px" Text='<%# Bind("Parentage") %>'></asp:Label><br />
                                                <b>Email:</b>
                                                <asp:Label ID="Label5" runat="server" Font-Size="14px" Text='<%# Bind("Email") %>'></asp:Label><br />
                                                <b>Mobile No:</b>
                                                <asp:Label ID="Label6" runat="server" Font-Size="14px" Text='<%# Bind("MobileNo") %>'></asp:Label><br />
                                                <b>Alternate Contact:</b>
                                                <asp:Label ID="Label7" runat="server" Font-Size="14px" Text='<%# Bind("AlternateNo") %>'></asp:Label><br />

                                                <h3>Permanent Address</h3>
                                                <b>Address :</b>
                                                <asp:Label ID="Label8" runat="server" Font-Size="14px" Text='<%# Bind("Address") %>'></asp:Label><br />
                                                <b>District :</b>
                                                <asp:Label ID="Label9" runat="server" Font-Size="14px" Text='<%# Bind("District") %>'></asp:Label><br />
                                                <b>State :</b>
                                                <asp:Label ID="Label10" runat="server" Font-Size="14px" Text='<%# Bind("State") %>'></asp:Label><br />
                                                <b>PinCode :</b>
                                                <asp:Label ID="Label11" runat="server" Font-Size="14px" Text='<%# Bind("PinCode") %>'></asp:Label><br />

                                                <h3>Present Address</h3>
                                                <b>Address :</b>
                                                <asp:Label ID="Label19" runat="server" Font-Size="14px" Text='<%# Bind("PAddress") %>'></asp:Label><br />
                                                <b>District :</b>
                                                <asp:Label ID="Label20" runat="server" Font-Size="14px" Text='<%# Bind("PDistrict") %>'></asp:Label><br />
                                                <b>State :</b>
                                                <asp:Label ID="Label21" runat="server" Font-Size="14px" Text='<%# Bind("PState") %>'></asp:Label><br />
                                                <b>PinCode :</b>
                                                <asp:Label ID="Label22" runat="server" Font-Size="14px" Text='<%# Bind("PPinCode") %>'></asp:Label><br />

                                            </td>
                                            <td style="width: 200px">

                                                <img alt="" src="../Upload/<%#(Eval("FileUrl"))%>" style="width: 200px; padding-left: 100px; padding-right: 10px" />
                                                <img alt="" src="../Upload/<%#(Eval("SigUrl"))%>" style="width: 200px; padding-left: 100px; padding-right: 10px" />

                                            </td>
                                        </tr>
                                    </table>
                                    <h3>Education Details: </h3>
                                    <table>
                                        <tr>
                                            <td style="width: 130px; border: 1px solid #000;">
                                                <b>Examination Passed</b>
                                            </td>
                                            <td style="width: 150px; border: 1px solid #000;">
                                                <b>Subject</b>
                                            </td>
                                            <td style="width: 100px; border: 1px solid #000;">
                                                <b>Year Of Passing</b>
                                            </td>
                                            <td style="width: 70px; border: 1px solid #000;">
                                                <b>Max. Marks</b>
                                            </td>
                                            <td style="width: 100px; border: 1px solid #000;">
                                                <b>Marks Obtained</b>
                                            </td>
                                            <td style="width: 30px; border: 1px solid #000;">
                                                <b>%</b>
                                            </td>
                                            <td style="width: 150px; border: 1px solid #000;">
                                                <b>University/Board</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label12" runat="server" Font-Size="14px" Text='<%# Bind("ExamPassed") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label13" runat="server" Font-Size="14px" Text='<%# Bind("Subject") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label14" runat="server" Font-Size="14px" Text='<%# Bind("PassingYear") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label15" runat="server" Font-Size="14px" Text='<%# Bind("MaxMarks") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label16" runat="server" Font-Size="14px" Text='<%# Bind("MarksObtained") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label17" runat="server" Font-Size="14px" Text='<%# Bind("Percentage") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label18" runat="server" Font-Size="14px" Text='<%# Bind("UniversityBoard") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label27" runat="server" Font-Size="14px" Text='<%# Bind("ExamPassedOne") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label28" runat="server" Font-Size="14px" Text='<%# Bind("SubjectOne") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label29" runat="server" Font-Size="14px" Text='<%# Bind("PassingYearOne") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label30" runat="server" Font-Size="14px" Text='<%# Bind("MaxMarksOne") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label51" runat="server" Font-Size="14px" Text='<%# Bind("MarksObtainedOne") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label52" runat="server" Font-Size="14px" Text='<%# Bind("PercentageOne") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label53" runat="server" Font-Size="14px" Text='<%# Bind("UniversityBoardOne") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label23" runat="server" Font-Size="14px" Text='<%# Bind("ExamPassedTwo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label24" runat="server" Font-Size="14px" Text='<%# Bind("SubjectTwo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label25" runat="server" Font-Size="14px" Text='<%# Bind("PassingYearTwo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label26" runat="server" Font-Size="14px" Text='<%# Bind("MaxMarksTwo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label31" runat="server" Font-Size="14px" Text='<%# Bind("MarksObtainedTwo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label32" runat="server" Font-Size="14px" Text='<%# Bind("PercentageTwo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label33" runat="server" Font-Size="14px" Text='<%# Bind("UniversityBoardTwo") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label34" runat="server" Font-Size="14px" Text='<%# Bind("ExamPassedThree") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label35" runat="server" Font-Size="14px" Text='<%# Bind("SubjectThree") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label36" runat="server" Font-Size="14px" Text='<%# Bind("PassingYearThree") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label37" runat="server" Font-Size="14px" Text='<%# Bind("MaxMarksThree") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label38" runat="server" Font-Size="14px" Text='<%# Bind("MarksObtainedThree") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label54" runat="server" Font-Size="14px" Text='<%# Bind("PercentageThree") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label55" runat="server" Font-Size="14px" Text='<%# Bind("UniversityBoardThree") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label39" runat="server" Font-Size="14px" Text='<%# Bind("ExamPassedFour") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label40" runat="server" Font-Size="14px" Text='<%# Bind("SubjectFour") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label41" runat="server" Font-Size="14px" Text='<%# Bind("PassingYearFour") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label42" runat="server" Font-Size="14px" Text='<%# Bind("MaxMarksFour") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label56" runat="server" Font-Size="14px" Text='<%# Bind("MarksObtainedFour") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label57" runat="server" Font-Size="14px" Text='<%# Bind("PercentageFour") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label58" runat="server" Font-Size="14px" Text='<%# Bind("UniversityBoardFour") %>'></asp:Label></td>
                                        </tr>
                                    </table>
                                    <h3>Experience Details: </h3>
                                    <table>
                                        <tr>
                                            <td style="width: 130px; border: 1px solid #000;">
                                                <b>Position Held</b>
                                            </td>
                                            <td style="width: 70px; border: 1px solid #000;">
                                                <b>Period From</b>
                                            </td>
                                            <td style="width: 70px; border: 1px solid #000;">
                                                <b>Period To</b>
                                            </td>
                                            <td style="width: 70px; border: 1px solid #000;">
                                                <b>Gross Salary</b>
                                            </td>
                                            <td style="width: 160px; border: 1px solid #000;">
                                                <b>Responsibilities</b>
                                            </td>
                                            <td style="width: 140px; border: 1px solid #000;">
                                                <b>Reasons for leaving the job</b>
                                            </td>
                                            <td style="width: 80px; border: 1px solid #000;">
                                                <b>Total Experience</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label121" runat="server" Font-Size="14px" Text='<%# Bind("Position") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label131" runat="server" Font-Size="14px" Text='<%# Bind("PFrom") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label141" runat="server" Font-Size="14px" Text='<%# Bind("PTo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label151" runat="server" Font-Size="14px" Text='<%# Bind("GSalary") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label161" runat="server" Font-Size="14px" Text='<%# Bind("Responsibilities") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label171" runat="server" Font-Size="14px" Text='<%# Bind("Reasons") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label181" runat="server" Font-Size="14px" Text='<%# Bind("Experience") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label43" runat="server" Font-Size="14px" Text='<%# Bind("PositionOne") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label44" runat="server" Font-Size="14px" Text='<%# Bind("PFromOne") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label45" runat="server" Font-Size="14px" Text='<%# Bind("PToOne") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label46" runat="server" Font-Size="14px" Text='<%# Bind("GSalaryOne") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label47" runat="server" Font-Size="14px" Text='<%# Bind("ResponsibilitiesOne") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label48" runat="server" Font-Size="14px" Text='<%# Bind("ReasonsOne") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label49" runat="server" Font-Size="14px" Text='<%# Bind("ExperienceOne") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label50" runat="server" Font-Size="14px" Text='<%# Bind("PositionTwo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label59" runat="server" Font-Size="14px" Text='<%# Bind("PFromTwo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label60" runat="server" Font-Size="14px" Text='<%# Bind("PToTwo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label61" runat="server" Font-Size="14px" Text='<%# Bind("GSalaryTwo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label62" runat="server" Font-Size="14px" Text='<%# Bind("ResponsibilitiesTwo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label63" runat="server" Font-Size="14px" Text='<%# Bind("ReasonsTwo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label64" runat="server" Font-Size="14px" Text='<%# Bind("ExperienceTwo") %>'></asp:Label></td>
                                        </tr>
                                    </table>
                                    <h3>Drivers  Details: </h3>
                                    <table>
                                        <tr>
                                            <td style="width: 130px; border: 1px solid #000;">
                                                <b>Driving License No</b>
                                            </td>
                                            <td style="width: 150px; border: 1px solid #000;">
                                                <b>License Validity</b>
                                            </td>
                                            <td style="width: 150px; border: 1px solid #000;">
                                                <b>Period To</b>
                                            </td>
                                            <td style="width: 150px; border: 1px solid #000;">
                                                <b>Driving License Class</b>
                                            </td>
                                            <td style="width: 160px; border: 1px solid #000;">
                                                <b>License Issuing authority</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label122" runat="server" Font-Size="14px" Text='<%# Bind("LicenseNo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label132" runat="server" Font-Size="14px" Text='<%# Bind("LicenseValidity") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label142" runat="server" Font-Size="14px" Text='<%# Bind("LicensePeriodTo") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label152" runat="server" Font-Size="14px" Text='<%# Bind("LicenseClass") %>'></asp:Label></td>
                                            <td style="border: 1px solid #ddd;">
                                                <asp:Label ID="Label162" runat="server" Font-Size="14px" Text='<%# Bind("LicenseAuthority") %>'></asp:Label></td>
                                        </tr>

                                    </table>

                                </ItemTemplate>
                            </asp:TemplateField>


                            <%--    <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:ImageButton ID="imgBtnDel" runat="server" CausesValidation="False" CommandName="Delete"
                                           ImageUrl="../AlbumImages/im_delete.jpg" AlternateText="Delete"  OnClientClick = "return confirm('Do you want to delete?')"></asp:ImageButton>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                        <EditRowStyle BackColor="#999999" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Left" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Left" />
                    </asp:GridView>
                </asp:Panel>

                <table cellpadding="0" cellspacing="0" border="0" width="100%" id="tblExportPDF" runat="server">
                    <tbody>
                        <tr>
                            <td align="left" valign="top">
                                <asp:Literal ID="ltrDetails" runat="server"></asp:Literal>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </fieldset>

        </div>
    </form>
</body>

</html>

