<%@ Page Title="Registration Details" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="RegistrationDetails.aspx.cs" Inherits="Secure_RegistrationDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" Runat="Server">
        <script type = "text/javascript">
            function PrintPanel() {
                var panel = document.getElementById("<%=pnlContents.ClientID %>");
             var printWindow = window.open('', '', 'height=400,width=800');
             printWindow.document.write('<html><head><title>Registration Details</title>');
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

     <h3>Registration Deatils</h3>
    <fieldset>
        <legend>List below:</legend>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tbody>
                <tr>
                    <td align="left" valign="top">
                        <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick = "return PrintPanel();" />
                          <asp:Panel id="pnlContents" runat = "server">
                        <asp:GridView ID="Grid" runat="server"  AutoGenerateColumns="False"
                            DataKeyNames="ID" ShowFooter="True"  CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="Registration Deatils">
                                    <ItemStyle VerticalAlign="Top" />
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
                                            <tr>
                                                <td style="padding-top: 10px; padding-bottom: 10px">
                                                    <asp:Label ID="Label1" Font-Bold="true" ForeColor="Red" runat="server" Text="Personal Details"></asp:Label><br />
                                                    <b>Full Name : </b>
                                                    <asp:Label ID="lblWriterName" runat="server" Text='<%# Bind("firstName") %>'></asp:Label> 
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("middleName") %>'></asp:Label>
                                                    <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Surname") %>'></asp:Label><br />
                                                    <hr style="width: 350px" />
                                                    <b>Gender : </b>
                                                    <asp:Label ID="lblMessage" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                                    <b>Marital Status : </b>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MaritalStatus") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />
                                                    <b>DOB : </b>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DOB") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />
                                                    <asp:Label ID="Label16" Font-Bold="true" runat="server" Text="Parent's Details"></asp:Label><br />
                                                    <b>Father Name : </b>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("pfirstName") %>'></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("pmiddleName") %>'></asp:Label>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("pSurname") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                     <asp:Label ID="Label17" Font-Bold="true" runat="server" Text="Address"></asp:Label><br />
                                                    <b>H. No/Street Name : </b>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("jform_Street_Name") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                    <b>Village/Town : </b>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("jform_Village") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                    <b>City : </b>
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("jform_City") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                    <b>District : </b>
                                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("jform_District") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                    <b>State : </b>
                                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("jform_State") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />


                                                    <b>Pin Code : </b>
                                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("jform_PinCode") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                    <b>Police Station : </b>
                                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("jform_PoliceStation") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                    <b>Aadhar No : </b>
                                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("jform_AadharNo") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                       <b>Voter ID No : </b>
                                                    <asp:Label ID="Label18" runat="server" Text='<%# Bind("jform_VoterIDNo") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                     <asp:Label ID="Label41" Font-Bold="true" ForeColor="Red" runat="server" Text="Correspondence Address"></asp:Label><br />
                                                    <b>H. No/Street Name : </b>
                                                    <asp:Label ID="Label44" runat="server" Text='<%# Bind("jform_CStreet_Name") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                    <b>Village/Town : </b>
                                                    <asp:Label ID="Label45" runat="server" Text='<%# Bind("jform_CVillage") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                    <b>City : </b>
                                                    <asp:Label ID="Label46" runat="server" Text='<%# Bind("jform_CCity") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                    <b>District : </b>
                                                    <asp:Label ID="Label47" runat="server" Text='<%# Bind("jform_CDistrict") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />

                                                    <b>State : </b>
                                                    <asp:Label ID="Label48" runat="server" Text='<%# Bind("jform_CState") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />


                                                    <b>Pin Code : </b>
                                                    <asp:Label ID="Label49" runat="server" Text='<%# Bind("jform_CPinCode") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />


                                                    

                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Photo">
                                    <ItemTemplate>
                                         <img alt="" src="../Upload/<%#(Eval("Photograph"))%>"  />
                                        <table>
                                            <tr>
                                                <td>
                                                     <asp:Label ID="Label20" Font-Bold="true" ForeColor="Red" runat="server" Text="Contact Details"></asp:Label><br />
                                                       <b>Email : </b>
                                                    <asp:Label ID="Label19" runat="server" Text='<%# Bind("jform_Email") %>'></asp:Label><br />
                                                    <hr style="width: 300px" />
                                                     <b>Mobile : </b>
                                                    <asp:Label ID="Label21" runat="server" Text='<%# Bind("jform_Mobile") %>'></asp:Label>
                                                     <b>Alternate No : </b>
                                                    <asp:Label ID="Label22" runat="server" Text='<%# Bind("jform_AlternateContact") %>'></asp:Label>
                                                     <hr style="width: 200px" />
                                                     <asp:Label ID="Label23" Font-Bold="true" runat="server" Text="Education Details"></asp:Label><br />
                                                     <asp:Label ID="Label25" Font-Bold="true" ForeColor="Red" runat="server" Text="Post Graduation"></asp:Label><br />
                                                     <b>University : </b>
                                                    <asp:Label ID="Label24" runat="server" Text='<%# Bind("jform_PGUniversity") %>'></asp:Label><br />
                                                    <b>Year : </b>
                                                     <asp:Label ID="Label26" runat="server" Text='<%# Bind("jform_PGYear") %>'></asp:Label><br />
                                                    <b>Max. Marks : </b>
                                                     <asp:Label ID="Label27" runat="server" Text='<%# Bind("jform_PGMaxMarks") %>'></asp:Label><br />
                                                    <b>Marks Obtained : </b>
                                                     <asp:Label ID="Label28" runat="server" Text='<%# Bind("jform_PGMarksObtained") %>'></asp:Label><br />
                                                    <b>Grade/Award : </b>
                                                     <asp:Label ID="Label29" runat="server" Text='<%# Bind("jform_PGGrade") %>'></asp:Label><br />
                                                    <hr style="width: 200px" />

                                                    <asp:Label ID="Label30" Font-Bold="true" ForeColor="Red" runat="server" Text="Graduation"></asp:Label><br />
                                                      <b>University : </b>
                                                    <asp:Label ID="Label31" runat="server" Text='<%# Bind("jform_GUniversity") %>'></asp:Label><br />
                                                    <b>Year : </b>
                                                     <asp:Label ID="Label32" runat="server" Text='<%# Bind("jform_GYear") %>'></asp:Label><br />
                                                    <b>Max. Marks : </b>
                                                     <asp:Label ID="Label33" runat="server" Text='<%# Bind("jform_GMaxMarks") %>'></asp:Label><br />
                                                    <b>Marks Obtained : </b>
                                                     <asp:Label ID="Label34" runat="server" Text='<%# Bind("jform_GMarksObtained") %>'></asp:Label><br />
                                                    <b>Grade/Award : </b>
                                                     <asp:Label ID="Label35" runat="server" Text='<%# Bind("jform_GGrade") %>'></asp:Label><br />
                                                    <hr style="width: 200px" />

                                                    
                                                      <asp:Label ID="Label36" Font-Bold="true" ForeColor="Red" runat="server" Text="Other Information:"></asp:Label><br />
                                                     <b>Have you ever appeared in any Bank Exam?  : </b>
                                                     <asp:Label ID="Label37" runat="server" Text='<%# Bind("any_Bank_Exam") %>'></asp:Label><br />
                                                     <asp:Label ID="Label38" runat="server" Text='<%# Bind("BankExam") %>'></asp:Label><br />
                                                     <hr style="width: 200px" />
                                                     <b>Have you been selected by any Bank earlier? : </b>
                                                     <asp:Label ID="Label39" runat="server" Text='<%# Bind("any_Bank_Earlier") %>'></asp:Label><br />
                                                     <asp:Label ID="Label40" runat="server" Text='<%# Bind("Bank_Earlier") %>'></asp:Label><br />
                                                     <hr style="width: 200px" />
                                                     <b>Name the bank examinations you look forward to applying for : </b>
                                                     <asp:Label ID="Label42" runat="server" Text='<%# Bind("jform_applying") %>'></asp:Label><br />
                                                     <hr style="width: 200px" />

                                                </td>

                                            </tr>
                                        </table>
                                         <b>Marks Card</b>
                                         <a href="../Upload/<%#(Eval("MarksCard"))%>" target="_blank">
                                          <img alt="" src="Images/service3_a.png" style="width:30px" />
                                         </a>
                                        <br />
                                         <b>Aadhar / Voter ID Card </b>
                                         <a href="../Upload/<%#(Eval("AadharNo"))%>" target="_blank">
                                         <img alt="" src="Images/service3_a.png" style="width:30px"/>
                                         </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
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
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>
</asp:Content>

