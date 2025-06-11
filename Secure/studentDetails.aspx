<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Secure/Secure.master" AutoEventWireup="true" CodeFile="studentDetails.aspx.cs" Inherits="Secure_studentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH" runat="Server">
    <script type="text/javascript">
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
                        <asp:button id="btnPrint" runat="server" text="Print" onclientclick="return PrintPanel();" />
                        <asp:panel id="pnlContents" runat="server">
                        
                                                                                                         <asp:GridView ID="Grid" runat="server"  AutoGenerateColumns="False"
                                                                                                             DataKeyNames="ID" ShowFooter="True"  CellPadding="4" Width="100%" ForeColor="#333333" GridLines="None" OnRowDataBound="Grid_RowDataBound">
                                                                                                             <Columns>
                                                                                                                <asp:TemplateField>
                                                                                                                    <ItemStyle VerticalAlign="Top" />
                                                                                                                    <ItemTemplate>

                                                                                                                        <h3>Paid: 
                                                                                                                        <asp:Label ID="Label83" forecolor="Black" runat="server" Text='<%# Bind("FeePay") %>'></asp:Label>
                                                                                                                        </h3>

                                                                                                                        <div class="accordion-container">

                                                                                                                            <div class="panel">
                                                                                                                                <div class="heading" style="font-size:20px">PROFILE</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> Name: </b>  <br>
                                                                                                                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("firstName") %>'></asp:Label> 
                                                                                                                                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("middleName") %>'></asp:Label>
                                                                                                                                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("lastname") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> Email: </b> <br>
                                                                                                                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("emailid") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> Contact No: </b> <br>
                                                                                                                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("contactNo") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <img alt="" src="../Upload/<%#(Eval("OImageUrl"))%>" style="float:left; padding-right:10px"/> 
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b> Alternate No: </b> <br> <asp:Label ID="Label31" runat="server" Text='<%# Bind("AlternateNo") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b> Occupation: </b><br>
                                                                                                                                              <asp:Label ID="occupation" runat="server" Text='<%# Bind("occupation") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b> How you came to know about BtW?: </b><br>
                                                                                                                                              <asp:Label ID="Label43" runat="server" Text='<%# Bind("btw") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                             <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <a href="../Upload/<%#(Eval("OCVFileUrl"))%>" target="_blank">Your CV</a>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                            <div class="panel">
                                                                                                                                <div class="heading" style="font-size:20px">ADDRESS</div>
                                                                                                                                <div class="content">
                                                                                                                                    <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> House/Villa: </b><br> <asp:Label ID="Label9" runat="server" Text='<%# Bind("jform_house_villa") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> Street/Village: </b><br> <asp:Label ID="Label10" runat="server" Text='<%# Bind("jform_street_Village") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                            <b> Tehsil/Town: </b><br> <asp:Label ID="Label11" runat="server" Text='<%# Bind("jform_tehsil_town") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                            <b> City: </b><br> <asp:Label ID="Label12" runat="server" Text='<%# Bind("jform_City") %>'></asp:Label><br>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <b> District: </b><br><asp:Label ID="Label13" runat="server" Text='<%# Bind("jform_District") %>'></asp:Label><br>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b> Pin Code: </b><br><asp:Label ID="Label14" runat="server" Text='<%# Bind("jform_PinCode") %>'></asp:Label><br>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b> Land Mark: </b> <br><asp:Label ID="Label15" runat="server" Text='<%# Bind("jform_Land_Mark") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                            <div class="panel">
                                                                                                                                <div class="heading" style="font-size:20px">CORROSPONDANCE ADDRESS</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> House/Villa: </b><br><asp:Label ID="Label16" runat="server" Text='<%# Bind("jform_CHouse_Villa") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                            <b> Street/Village: </b><br><asp:Label ID="Label17" runat="server" Text='<%# Bind("jform_CStreet_Village") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <b> Tehsil/Town: </b><br><asp:Label ID="Label18" runat="server" Text='<%# Bind("jform_CTehsil_town") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b> City: </b><br><asp:Label ID="Label19" runat="server" Text='<%# Bind("jform_CCity") %>'></asp:Label><br>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <b> District: </b><br><asp:Label ID="Label20" runat="server" Text='<%# Bind("jform_CDistrict") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <b> Pin Code: </b><br><asp:Label ID="Label21" runat="server" Text='<%# Bind("jform_CPinCode") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <b> Land Mark: </b><br><asp:Label ID="Label22" runat="server" Text='<%# Bind("jform_CLand_Mark") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>
                                          
                                                                                                                            <div class="panel" id="studentEducation" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">EDUCATION</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Your highest qualification</b> <br>
                                                                                                                                                 <asp:Label ID="Label23" runat="server" Text='<%# Bind("jform_SQualification") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Course</b> <br> 
                                                                                                                                             <asp:Label ID="Label24" runat="server" Text='<%# Bind("jform_SCourse") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Year</b> <br> 
                                                                                                                                             <asp:Label ID="Label25" runat="server" Text='<%# Bind("jform_SYear") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Are you persuing a degree</b> <br>
                                                                                                                                             <asp:Label ID="Label26" runat="server" Text='<%# Bind("jform_SPersuing_Degree") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Course</b> <br>
                                                                                                                                                   <asp:Label ID="Label27" runat="server" Text='<%# Bind("jform_SPCourse") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <b>For the period From</b> <br> 
                                                                                                                                                <asp:Label ID="Label28" runat="server" Text='<%# Bind("jform_SPeriodFrom") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <b>To</b> <br> 
                                                                                                                                               <asp:Label ID="Label29" runat="server" Text='<%# Bind("jform_SPeriodTo") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                            <div class="panel" id="studentACHIEVEMENTS" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">ACADEMIC/OTHER ACHIEVEMENTS</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Graduation Score</b> <br> 
                                                                                                                                                  <asp:Label ID="Label8" runat="server" Text='<%# Bind("jform_SGraduationScore") %>'></asp:Label>
                                                      
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Post Graduation Score</b> <br> 
                                                                                                                                             <asp:Label ID="Label30" runat="server" Text='<%# Bind("jform_SPostGraduationScore") %>'></asp:Label>
                                                      
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Any other degree Score</b> <br> 
                                                                                                                                               <asp:Label ID="Label32" runat="server" Text='<%# Bind("jform_SOtherDegreeScore") %>'></asp:Label>
                                                          
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Skill acquired</b> <br>
                                                                                                                                              <asp:Label ID="Label33" runat="server" Text='<%# Bind("jform_SSkillAcquired") %>'></asp:Label>
                                                          
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Tech skills </b> <br>
                                                                                                                                                    <asp:Label ID="Label34" runat="server" Text='<%# Bind("jform_STechSkills") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <b>Social Media Activism</b> <br>
                                                                                                                                                 <asp:Label ID="Label35" runat="server" Text='<%# Bind("jform_SSocialMediaActivism") %>'></asp:Label>
                                                                                                                                            </td>
                                                          
                                                                                                                                       </tr>

                                                                                                                                        <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Internship? Where</b> <br>
                                                                                                                                                   <asp:Label ID="Label36" runat="server" Text='<%# Bind("SInternship") %>'></asp:Label>
                                                            
                                                      
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>On job training? Where</b> <br>
                                                                                                                                             <asp:Label ID="Label37" runat="server" Text='<%# Bind("SjobTraining") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Volunteerism? Where</b> <br>
                                                                                                                                                <asp:Label ID="Label38" runat="server" Text='<%# Bind("SVolunteerism") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>

                                                                                                                                        <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Awards and acomplishments</b> <br>
                                                                                                                                                   <asp:Label ID="Label39" runat="server" Text='<%# Bind("SAwards") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Certificate of Excellence</b> <br>
                                                                                                                                             <asp:Label ID="Label40" runat="server" Text='<%# Bind("SCertificateofExcellence") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Honourary doctorate/citizenship</b> <br>
                                                                                                                                                 <asp:Label ID="Label41" runat="server" Text='<%# Bind("SHonourary") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                            <div class="panel" id="studentEducationExpanses" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">COURSE FEES AND EDUCATION EXPANSES</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <b>Do you have a fellowship</b> <br>
                                                                                                                                               <asp:Label ID="Label6" runat="server" Text='<%# Bind("Sfellowship") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                              <b>if not, how much you pay annualy</b> <br> 
                                                                                                                                              <asp:Label ID="Label42" runat="server" Text='<%# Bind("SPayAnnualy") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <b>Have you got any scholorship</b> <br>
                                                                                                                                               <asp:Label ID="Label44" runat="server" Text='<%# Bind("SScholorship") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <b>Do you manage your course fee</b> <br>
                                                                                                                                               <asp:Label ID="Label45" runat="server" Text='<%# Bind("SManageCourseFee") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                            <div class="panel" id="otherEducation" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">EDUCATION</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Your highest qualification</b> <br> 
                                                                                                                                                 <asp:Label ID="Label46" runat="server" Text='<%# Bind("OHighestQualification") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Course</b> <br> 
                                                                                                                                             <asp:Label ID="Label47" runat="server" Text='<%# Bind("OCourse") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Year</b> <br> 
                                                                                                                                             <asp:Label ID="Label48" runat="server" Text='<%# Bind("OYear") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Skill training/diploma</b> <br>
                                                                                                                                             <asp:Label ID="Label49" runat="server" Text='<%# Bind("OSkillTraining") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Certificate course</b> <br> 
                                                                                                                                                   <asp:Label ID="Label50" runat="server" Text='<%# Bind("OCertificateCourse") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <b>Volunteerism</b> <br> 
                                                                                                                                                <asp:Label ID="Label51" runat="server" Text='<%# Bind("OVolunteerism") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                             <div class="panel" id="otherWorkExperience" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">WORK EXPERIENCE</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Organization/Department</b> <br>
                                                                                                                                                 <asp:Label ID="Label7" runat="server" Text='<%# Bind("ODepartment") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Position</b> <br>
                                                                                                                                             <asp:Label ID="Label52" runat="server" Text='<%# Bind("OPosition") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Period From</b> <br> 
                                                                                                                                             <asp:Label ID="Label53" runat="server" Text='<%# Bind("OPeriodFrom") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Period To</b> <br> 
                                                                                                                                             <asp:Label ID="Label57" runat="server" Text='<%# Bind("OPeriodTo") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <asp:Label ID="Label54" runat="server" Text='<%# Bind("ODepartmentSecond") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                   <asp:Label ID="Label55" runat="server" Text='<%# Bind("OPositionSecond") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <asp:Label ID="Label56" runat="server" Text='<%# Bind("OPeriodFromSecond") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <asp:Label ID="Label58" runat="server" Text='<%# Bind("OPeriodToSecond") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <asp:Label ID="Label59" runat="server" Text='<%# Bind("ODepartmentThird") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                   <asp:Label ID="Label60" runat="server" Text='<%# Bind("OPositionThird") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                           <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <asp:Label ID="Label61" runat="server" Text='<%# Bind("OPeriodFromThird") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <asp:Label ID="Label62" runat="server" Text='<%# Bind("OPeriodToThird") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>
                                        
                                                                                                                            <div class="panel" id="otherAchievements" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">ACADEMIC/OTHER ACHIEVEMENTS</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Graduation Score</b> <br> 
                                                                                                                                                 <asp:Label ID="Label63" runat="server" Text='<%# Bind("OGraduationScore") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Post Graduation Score</b> <br> 
                                                                                                                                             <asp:Label ID="Label64" runat="server" Text='<%# Bind("OPostGraduationScore") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Any other degree Score</b> <br>
                                                                                                                                                <asp:Label ID="Label65" runat="server" Text='<%# Bind("OotherDegreeScore") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Skill acquired</b> <br> 
                                                                                                                                                 <asp:Label ID="Label66" runat="server" Text='<%# Bind("OSkillAcquired") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Tech skills</b> <br> 
                                                                                                                                             <asp:Label ID="Label67" runat="server" Text='<%# Bind("OTechSkills") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Social Media Activism</b> <br>
                                                                                                                                                <asp:Label ID="Label68" runat="server" Text='<%# Bind("OSocialMediaActivism") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                      
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                            <div class="panel" id="otherBudgets" runat="server">
                                                                                                                                <div class="heading" style="font-size:20px">YOUR BUDGETS</div>
                                                                                                                                <div class="content">
                                                                                                                                   <table>
                                                                                                                                       <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Are you satisfied with the earnings?</b> <br> 
                                                                                                                                                 <asp:Label ID="Label69" runat="server" Text='<%# Bind("Oearnings") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Are you able to manage the expenses?</b> <br> 
                                                                                                                                             <asp:Label ID="Label70" runat="server" Text='<%# Bind("Oexpenses") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Do you save/invest your excess earnings?</b> <br>
                                                                                                                                                <asp:Label ID="Label71" runat="server" Text='<%# Bind("OexcessEarnings") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                       </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Age</b> <br> 
                                                                                                                                                 <asp:Label ID="Label72" runat="server" Text='<%# Bind("OAge") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Are you married? </b> <br>
                                                                                                                                             <asp:Label ID="Label73" runat="server" Text='<%# Bind("Omarried") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Are you the only earning hand in your family?</b> <br>
                                                                                                                                                <asp:Label ID="Label74" runat="server" Text='<%# Bind("OEarningHand") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                          </tr>

                                                                                                                                         <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Who is in your family?</b> <br>
                                                                                                                                                 <asp:Label ID="Label75" runat="server" Text='<%# Bind("OFamilyOne") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <asp:Label ID="Label76" runat="server" Text='<%# Bind("OFamilyTwo") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <asp:Label ID="Label77" runat="server" Text='<%# Bind("OFamilyThree") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                          </tr>
                                                                                                                                         <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                               <asp:Label ID="Label78" runat="server" Text='<%# Bind("OFamilyFour") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                             <asp:Label ID="Label79" runat="server" Text='<%# Bind("OFamilyFive") %>'></asp:Label> 
                                                                                                                                            </td>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                <asp:Label ID="Label80" runat="server" Text='<%# Bind("OFamilySix") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                          </tr>
                                                        
                                                                                                                                         <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>Do you face any health issue?</b> <br>
                                                                                                                                                 <asp:Label ID="Label81" runat="server" Text='<%# Bind("OhealthIssue") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                          </tr>

                                                                                                                                          <tr>
                                                                                                                                            <td style="padding-top: 10px; padding-bottom: 10px; width:25%">
                                                                                                                                                 <b>What do you expect from this workshop?</b> <br> 
                                                                                                                                                 <asp:Label ID="Label82" runat="server" Text='<%# Bind("OexpectFromWorkshop") %>'></asp:Label>
                                                                                                                                            </td>
                                                                                                                                          </tr>
                                                        
                                                                                                                                   </table>
                                                                                                                                </div>
                                                                                                                            </div>

                                                                                                                        </div>

                                                                                                                    </ItemTemplate>
                                                                                                                </asp:TemplateField>
                                                                                                            </Columns>
                                                                                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
                                                                                                            <EditRowStyle BackColor="#999999" HorizontalAlign="Left" />
                                                                                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Left" />
                                                                                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Left" />
                                                                                                        </asp:GridView>

                         </asp:panel>
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>
</asp:Content>

