<%@ Page Title="Registration" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="regis.aspx.cs" Inherits="regis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        /*body {
            background-color: #f1f1f1;
        }*/

        /*#regForm {
            background-color: #ffffff;
            margin: 100px auto;
            font-family: Raleway;
            padding: 40px;
            width: 70%;
            min-width: 300px;
        }*/

        h1 {
            text-align: center;
        }

        input {
            box-sizing: border-box;
            padding: 10px;
            width: 100%;
            font-size: 17px;
            font-family: Raleway;
            border: 1px solid #aaaaaa;
        }

            /* Mark input boxes that gets an error on validation: */
            input.invalid {
                background-color: #ffdddd;
            }

        /* Hide all steps by default: */
        .tab {
            display: none;
        }

        button {
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 17px;
            font-family: Raleway;
            cursor: pointer;
        }

            button:hover {
                opacity: 0.8;
            }

        #prevBtn {
            background-color: #bbbbbb;
        }

        /* Make circles that indicate the steps of the form: */
        .step {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbbbbb;
            border: none;
            border-radius: 50%;
            display: inline-block;
            opacity: 0.5;
        }

            .step.active {
                opacity: 1;
            }

            /* Mark the steps that are finished and valid: */
            .step.finish {
                background-color: #4CAF50;
            }
    </style>
    <div id="content-row">
        <div class="row-container">
          <div class="container">
            <div class="content-inner row">   

                <div class="main">
		            <div class="content">
			            <div class="stepsForm">
				            <form method="post">
					            <div class="sf-steps">
						            <div class="sf-steps-content">
							            <div>
								            <span></span> Profile
							            </div>
						            </div>
					            </div>                
					            <div class="sf-steps-form sf-radius"> 
						
						            <ul class="sf-content"> <!-- form step one --> 
							             <li>
                                                <input type="text" placeholder="First name*" title="Enter first name"  name="fname" style="width:32%" required>
									            <input type="text" placeholder="Middle name..." name="mname" style="width:32%">
                                                <input type="text" placeholder="Last name*"  title="Enter last name" name="lname" style="width:32%" required>
							             </li>
							             <li>
                                                <input type="email" placeholder="Email*" name="email" data-email="true" style="width:32%" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$"  title="Enter valid email address"  required>
                                                <input type="text" placeholder="Contact No (10 digits only)*"  pattern="[1-9]{1}[0-9]{9}" title="Enter 10 digit mobile number"  name="contactNo" style="width:32%" required>
                                                <input type="text" placeholder="Alternate No (10 digits only)" pattern="[1-9]{1}[0-9]{9}" title="Enter 10 digit mobile number" name="alternateNo" style="width:32%" data-number="true">
							            </li>
                                        <li>

                                              <input type="password" placeholder="Password*"  title="Enter Password" name="password" style="width:32%" required>
                                               <select name="occupation" id="occupation"  style="width:32%" OnChange="showDiv(this)" required>
                                                  <option value="" >Your occupation</option>	
						                          <option value="Student" >Student</option>	
						                          <option value="Government Employee" >Government Employee</option>	
						                          <option value="Employed by Private Sector" >Employed by Private Sector</option>	
                                                  <option value="Self Employed" >Self Employed</option>
					                            </select>  
                                 
                                               <select name="bwt" id="bwt"  style="width:32%" data-required="true" required>
						                          <option value="" >How you came to know about BtW?</option>	
						                          <option value="One who has attended the BtW">One who has attended the BtW</option>	
						                          <option value="Local Newspaper Ad">Local Newspaper Ad</option>	
                                                  <option value="Socila Media">Socila Media</option>	
                                                  <option value="Website">Website</option>	
                                                  <option value="Friend of mine">Friend of mine</option>	
                                                  <option value="Family member">Family member</option>
					                            </select>  
                                        </li> 

						           
                                         <h3>
                                              Address*
                                         </h3> 
							             <li>
								             <input type="text"  placeholder="House/Villa" name="shouse" style="width:32%">
                                             <input type="text"  placeholder="Street/Village*" name="street" style="width:32%" required>
                                             <input type="text"  placeholder="Tehsil/Town*"  name="stehsil" style="width:32%" data-required="true">
							             </li>
							             <li>
								              <input type="text" placeholder="City" name="sCity" style="width:32%">
                                              <input type="text" placeholder="District*" name="sDistrict" style="width:32%" required>
                                              <input type="text" placeholder="Pin Code*"  name="sPinCode" style="width:32%" required>
							             </li>
							             <li>
								              <input type="text" placeholder="Land Mark*" name="sLandMark" style="width:97%" required>
							             </li>
                                         <h3>
                                             Corrospondance Address*
                                         </h3> 
                                         <li>
                                            <input type="text"  placeholder="House/Villa" name="Cshouse" style="width:32%">
                                            <input type="text"  placeholder="Street/Village*" name="Cstreet" style="width:32%" required>
                                            <input  type="text"  placeholder="Tehsil/Town*" name="Ctehsil" style="width:32%" required>
                                        </li>
                                         <li>
                                            <input type="text"  placeholder="City" name="CCity" style="width:32%">
                                            <input type="text"  placeholder="District*" name="CDistrict" style="width:32%" required>
                                            <input type="text"  placeholder="Pin Code*"  name="CPinCode" style="width:32%" required>
                                         </li>
                                         <li>
                                             <input type="text" placeholder="Land Mark*" name="CLandMark" style="width:97%" required>
                                         </li>
                                      
                                         <%-- student education details start here--%>
                                          <div id="dvstudent">
                                          <h3>
                                             Education
                                          </h3>
                                         <li>

                                           <asp:DropDownList ID="ddlsqualification" runat="server" style="width:32%">
                                               <asp:ListItem Value="0">Your highest qualification</asp:ListItem>
                                               <asp:ListItem>Graduate</asp:ListItem>
                                               <asp:ListItem>Post Graduate</asp:ListItem>
                                               <asp:ListItem>M Phill</asp:ListItem>
                                               <asp:ListItem>PhD</asp:ListItem>
                                           </asp:DropDownList>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlsqualification" InitialValue="0" ValidationGroup="student"></asp:RequiredFieldValidator>
                                          
                                              <asp:DropDownList ID="ddlsCourse" runat="server" style="width:32%">
                                               <asp:ListItem Value="0">Course</asp:ListItem>
                                               <asp:ListItem>Medicine</asp:ListItem>
                                               <asp:ListItem>Law</asp:ListItem>
                                               <asp:ListItem>Humanities</asp:ListItem>
                                               <asp:ListItem>Social Sciences</asp:ListItem>
                                               <asp:ListItem>Engineering</asp:ListItem>
                                               <asp:ListItem>Business Administration</asp:ListItem>
                                               <asp:ListItem>Tourism and hospitality</asp:ListItem>
                                               <asp:ListItem>Others</asp:ListItem>
                                           </asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlsCourse" InitialValue="0" ValidationGroup="student"></asp:RequiredFieldValidator>
                                          
                                            <asp:TextBox ID="txtsYear" placeholder="Year" runat="server" style="width:32%"></asp:TextBox>
                                            <asp:RegularExpressionValidator id="RegularExpressionValidator1" 
                                             ControlToValidate="txtsYear"
                                             ValidationExpression="^\d+"
                                             ErrorMessage="*"
                                             runat="server" ValidationGroup="student"></asp:RegularExpressionValidator>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtsYear" ValidationGroup="student"></asp:RequiredFieldValidator>
                                         </li> 

                                         <li>
                                            <asp:DropDownList ID="ddlspersuingdegree" runat="server" style="width:32%">
                                               <asp:ListItem Value="0">Are you persuing a degree?</asp:ListItem>
                                               <asp:ListItem>Post Graduate</asp:ListItem>
                                               <asp:ListItem>M Phill</asp:ListItem>
                                               <asp:ListItem>PhD</asp:ListItem>
                                            </asp:DropDownList>
                                          
                                            <asp:DropDownList ID="ddlspersuingCourse" runat="server" style="width:32%">
                                               <asp:ListItem Value="0">Course</asp:ListItem>
                                               <asp:ListItem>Medicine</asp:ListItem>
                                               <asp:ListItem>Law</asp:ListItem>
                                               <asp:ListItem>Humanities</asp:ListItem>
                                               <asp:ListItem>Social Sciences</asp:ListItem>
                                               <asp:ListItem>Engineering</asp:ListItem>
                                               <asp:ListItem>Business Administration</asp:ListItem>
                                               <asp:ListItem>Tourism and hospitality</asp:ListItem>
                                               <asp:ListItem>Others</asp:ListItem>
                                           </asp:DropDownList>
                                          
                                           <input type="text" placeholder="for the period(From: yyyy)"  name="spFrom" style="width:16%">
                                           <input type="text" placeholder="for the period(To: yyyy)"  name="spTo" style="width:16%">
                                         </li>   
                                         <h3>Academic/Other Achievements</h3>      
                                        <li>
                                          <select name="sGraduationScore" id="Select5"  style="width:32%">
                                                  <option value="" >Graduation Score</option>	
						                          <option value="90% and above" >90% and above</option>	
						                          <option value="75% to 89%" >75% to 89%</option>	
						                          <option value="55% to 74%" >55% to 74%</option>	
                                                 <option value="Below 55%" >Below 55%</option>
					                            </select>  

                                          <select name="sPostGraduationScore" id="Select6"  style="width:32%">
						                          <option value="">Post Graduation Score</option>	
						                          <option value="90% and above" >90% and above</option>	
						                          <option value="75% to 89%" >75% to 89%</option>	
						                          <option value="55% to 74%" >55% to 74%</option>	
                                                  <option value="Below 55%" >Below 55%</option>
					                            </select>  
                                        
                                          <select name="sotherDegreeScore" id="Select7"  style="width:32%">
						                          <option value="" >Any other degree Score</option>	
						                         <option value="Graduate" >90% and above</option>	
						                          <option value="PostGraduate" >75% to 89%</option>	
						                          <option value="MPhill" >55% to 74%</option>	
                                                 <option value="Below 55%" >Below 55%</option>
					                            </select>  
                                         </li>  
                                         <li>
                                         <select name="sSkillacquired" id="Select8"  style="width:32%">
                                                  <option value="" >Skill acquired</option>	
						                          <option value="Column writer" >Column writer</option>	
						                          <option value="Blog writer" >Blog writer</option>	
						                          <option value="Orator" >Orator</option>	
                                                  <option value="Storyteller" >Storyteller</option>
                                                   <option value="Theatre Artist" >Theatre Artist</option>
                                                   <option value="Actor" >Actor</option>
                                                   <option value="Poet" >Poet</option>
                                                   <option value="No such skill" >No such skill</option>
					                            </select>  

                                         <select name="sTechSkills" id="Select9"  style="width:32%">
						                          <option value="" >Tech skills </option>	
						                          <option value="Web Designer">Web Designer</option>	
						                          <option value="App Developer">App Developer</option>	
						                          <option value="Programer">Programer</option>	
                                                  <option value="Hacker">Hacker</option>
                                                  <option value="Cyber law expert">Cyber law expert</option>
                                                  <option value="No such skill acquired">No such skill acquired</option>
					                            </select>  

                                         <select name="sSocialMediaActivism" id="Select10"  style="width:32%">
						                          <option value="" >Social Media Activism</option>	
						                          <option value="Facebook">Facebook</option>	
						                          <option value="Twitter">Twitter</option>	
						                          <option value="Instagram">Instagram</option>	
                                                  <option value="Youtube">Youtube</option>
                                                  <option value="Snapchat">Snapchat</option>
                                                  <option value="No One">No One</option>
					                            </select> 
                                        </li>
                                        <li>
                                                <input type="text" placeholder="Internship? Where"  name="sInternship" style="width:32%">
                                                <input type="text" placeholder="on job training? Where"  name="sjobtraining" style="width:32%">
                                                <input type="text" placeholder="Volunteerism? Where"  name="sVolunteerism" style="width:32%">
                                        </li> 
                                        <li>
                                                <input type="text" placeholder="Awards and acomplishments" name="sAwards" style="width:32%">
                                                <input type="text" placeholder="Certificate of Excellence"  name="sCertificate" style="width:32%">
                                                <input type="text" placeholder="Honourary doctorate/citizenship" name="sHonourary" style="width:32%">
                                        </li> 
                                        <h3>Course fees and education expanses</h3>
                                         <li>
                                          <select name="sfellowship" id="Select11"  style="width:32%">
                                                  <option value="" >Do you have a fellowship?</option>	
						                          <option value="Yes" >Yes</option>	
						                          <option value="No" >No</option>	
					                            </select>  
                                            <input type="text" placeholder="if not, how much you pay annualy?"  name="sIfnotpayannualy" style="width:32%">
                                            <input type="text" placeholder="Have you got any scholorship?" name="sanyscholorship" style="width:32%">
                                        </li>
                                        <li>
                                             <select name="smanagefee" id="Select12"  style="width:32%">
                                                  <option value="" >Do you manage your course fee?</option>	
						                          <option value="Yes" >Yes</option>	
						                          <option value="No" >No</option>	
					                            </select>  
                                           <br>
                                           Share with us your CV<br>
                                           <asp:FileUpload ID="uploadStudentCV" runat="server" style="width:32%"></asp:FileUpload>
                                           <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator10" ControlToValidate="uploadStudentCV" ErrorMessage="Upload file" Display="Dynamic" ValidationGroup="student"></asp:RequiredFieldValidator>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="uploadStudentCV" Display="Dynamic" ErrorMessage="Invalid file formate." ValidationExpression="^.+(.pdf|.PDF|.doc|.DOC|.docx|.DOCX)$" ValidationGroup="student"></asp:RegularExpressionValidator>    
                                           <br><br>
                                           We need your PP size Photo<br>
                                           <asp:FileUpload ID="uploadStudentImage" runat="server" style="width:32%"></asp:FileUpload>
                                           <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator9" ControlToValidate="uploadStudentImage" ErrorMessage="Upload file" Display="Dynamic" ValidationGroup="student"></asp:RequiredFieldValidator>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="uploadStudentImage" Display="Dynamic" ErrorMessage="Invalid file formate. upload jpg or png formate" ValidationExpression="^.+(.jpg|.png|.jpeg|.JPEG|.JPG|.PNG)$" ValidationGroup="student"></asp:RegularExpressionValidator>
                                        </li>
                                              <li>
                                                 <h3>Note</h3>
                                                <p>* You are not charged the resource person fee, this workshop is offered by Ehsaase-e-Insaniyat Trust free of such charges. Our resource person normaly charges Rs. 7 to 8 lakhs for THREE DAY workshop.</p>
                                                <p>* You are charged for the food, stationary and some miscelenious costs under Minimum Cost bracket. You may wish to pay more to this organization and support in education of children across the valley.</p>
                                                <h3>Please pay</h3>
                                               <div id="StudentFee">
                                                    <p>
                                                     This is for Students only<br>
                                                     <select name="StudentFee"   style="width:32%">
						                             <option value="500" >500</option>	
						                             <option value="800" >800</option>
                                                     <option value="1000" >1000</option>		
					                                 </select>
                                                    </p>
                                               </div>
                                              </li>

                                               <li>
                                                   <asp:CheckBoxList ID="chkboxstudent" runat="server"><asp:ListItem Text="I accept the terms and conditions" /></asp:CheckBoxList>
                                                   <asp:CustomValidator ID="CustomValidator1"  ErrorMessage="Please select terms and conditions" ForeColor="Red" ClientValidationFunction="ValidateCheckBoxList" runat="server" ValidationGroup="student" />
                                               </li>

                                                <li>
                                              
                                                   <asp:Button ID="btnSubmitForStudent" runat="server" class="sf-button" Text="Submit" OnClick="btnSubmitForStudent_Click" ValidationGroup="student"></asp:Button>
                                                    <script type="text/javascript">
                                                        function ValidateCheckBoxList(sender, args) {
                                                            var checkBoxList = document.getElementById("<%=chkboxstudent.ClientID %>");
                                                                var checkboxes = checkBoxList.getElementsByTagName("input");
                                                                var isValid = false;
                                                                for (var i = 0; i < checkboxes.length; i++) {
                                                                    if (checkboxes[i].checked) {
                                                                        isValid = true;
                                                                        break;
                                                                    }
                                                                }
                                                                args.IsValid = isValid;
                                                            }
                                                        </script>

                                               </li>
                                       </div>
                                          <%-- student education details end here--%>
                            
                                          <%-- Other details start here--%>
                                           <div id="dvother">
                                          <h3>Education</h3>
                                         <li>
                                             
                                           <asp:DropDownList ID="ddloqualification" runat="server" style="width:32%">
                                               <asp:ListItem Value="0">Your highest qualification</asp:ListItem>
                                               <asp:ListItem>Graduate</asp:ListItem>
                                               <asp:ListItem>Post Graduate</asp:ListItem>
                                               <asp:ListItem>M Phill</asp:ListItem>
                                               <asp:ListItem>PhD</asp:ListItem>
                                           </asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="ddloqualification" InitialValue="0" ValidationGroup="other"></asp:RequiredFieldValidator>
                                          
                                           <asp:DropDownList ID="ddloCourse" runat="server" style="width:32%">
                                               <asp:ListItem Value="0">Course</asp:ListItem>
                                               <asp:ListItem>Medicine</asp:ListItem>
                                               <asp:ListItem>Law</asp:ListItem>
                                               <asp:ListItem>Humanities</asp:ListItem>
                                               <asp:ListItem>Social Sciences</asp:ListItem>
                                               <asp:ListItem>Engineering</asp:ListItem>
                                               <asp:ListItem>Business Administration</asp:ListItem>
                                               <asp:ListItem>Tourism and hospitality</asp:ListItem>
                                               <asp:ListItem>Others</asp:ListItem>
                                           </asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="ddloCourse" InitialValue="0" ValidationGroup="other"></asp:RequiredFieldValidator>
                                          
                                              <asp:TextBox ID="txtoYear" placeholder="Year" runat="server" style="width:32%"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtoYear" ValidationGroup="other"></asp:RequiredFieldValidator>
                                        
                                              
                                               
                                        </li>
                                        <li>
                                                <input type="text" placeholder="Skill training/diploma"  name="oSkill" style="width:32%">
                                                <input type="text" placeholder="Certificate course"  name="oCertificate" style="width:32%">
                                                <input type="text" placeholder="Volunteerism"  name="oVolunteerism" style="width:32%">
                                        </li>
                                         <h3>Work Experience (last three the most)</h3>
                                        <li>
                                                <input type="text" placeholder="Organization/Department" oninput="this.className = ''" name="oOrganization1" style="width:32%">
                                                <input type="text" placeholder="Position" oninput="this.className = ''" name="oPosition1" style="width:32%">
                                                <input type="text" placeholder="Period(From: yyyy)" oninput="this.className = ''" name="oPeriodFrom1" style="width:16%">
                                                <input type="text" placeholder="Period(To: yyyy)" oninput="this.className = ''" name="oPeriodTo1" style="width:16%">
                                        </li>
                                        <li>
                                                 <input type="text" placeholder="Organization/Department" oninput="this.className = ''" name="oOrganization2" style="width:32%">
                                                <input type="text" placeholder="Position" oninput="this.className = ''" name="oPosition2" style="width:32%">
                                                <input type="text" placeholder="Period(From: yyyy)" oninput="this.className = ''" name="oPeriodFrom2" style="width:16%">
                                                <input type="text" placeholder="Period(To: yyyy)" oninput="this.className = ''" name="oPeriodTo2" style="width:16%">
                                        </li>
                                        <li>
                                                <input type="text" placeholder="Organization/Department" oninput="this.className = ''" name="oOrganization3" style="width:32%">
                                                <input type="text" placeholder="Position" oninput="this.className = ''" name="oPosition3" style="width:32%">
                                                <input type="text" placeholder="Period(From: yyyy)" oninput="this.className = ''" name="oPeriodFrom3" style="width:16%">
                                                <input type="text" placeholder="Period(To: yyyy)" oninput="this.className = ''" name="oPeriodTo3" style="width:16%">
                                        </li>
                                       <h3>Academic/Other Achievements</h3>
                                        <li>
                                         <select name="OGraduationScore" id="Select15"  style="width:32%">
                                                  <option value="" >Graduation Score</option>	
						                          <option value="90% and above" >90% and above</option>	
						                          <option value="75% to 89%" >75% to 89%</option>	
						                          <option value="55% to 74%" >55% to 74%</option>	
                                                 <option value="Below 55%" >Below 55%</option>
					                            </select>  
                                        <select name="OPostGraduationScore" id="Select16"  style="width:32%">
						                          <option value="" >Post Graduation Score</option>	
						                         <option value="90% and above" >90% and above</option>	
						                          <option value="75% to 89%" >75% to 89%</option>	
						                          <option value="55% to 74%" >55% to 74%</option>	
                                                 <option value="Below 55%" >Below 55%</option>
					                            </select>  
                                        <select name="OotherDegreeScore" id="Select17"  style="width:32%">
						                          <option value="" >Any other degree Score</option>	
						                        <option value="90% and above" >90% and above</option>	
						                          <option value="75% to 89%" >75% to 89%</option>	
						                          <option value="55% to 74%" >55% to 74%</option>	
                                                 <option value="Below 55%" >Below 55%</option>
					                            </select>  
                                        </li>
                                        <li>
                                              <select name="OSkillacquired" id="Select18"  style="width:32%">
                                                  <option value="" >Skill acquired</option>	
						                          <option value="Column writer" >Column writer</option>	
						                          <option value="Blog writer" >Blog writer</option>	
						                          <option value="Orator" >Orator</option>	
                                                  <option value="Storyteller" >Storyteller</option>
                                                   <option value="Theatre Artist" >Theatre Artist</option>
                                                   <option value="Actor" >Actor</option>
                                                   <option value="Poet" >Poet</option>
                                                   <option value="No such skill" >No such skill</option>
					                            </select>  
                                               <select name="oTechSkills" id="Select19"  style="width:32%">
						                          <option value="" >Tech skills </option>	
						                          <option value="Web Designer" >Web Designer</option>	
						                          <option value="App Developer" >App Developer</option>	
						                          <option value="Programmer" >Programmer</option>	
                                                  <option value="Hacker" >Hacker</option>
                                                  <option value="Cyber law expert" >Cyber law expert</option>
                                                  <option value="No such skill acquired" >No such skill acquired</option>
					                            </select>  
                                                <select name="oSocialMediaActivism" id="Select20"  style="width:32%">
						                          <option value="" >Social Media Activism</option>	
						                         <option value="Facebook" >Facebook</option>	
						                          <option value="Twitter" >Twitter</option>	
						                          <option value="Instagram" >Instagram</option>	
                                                 <option value="Youtube" >Youtube</option>
                                                 <option value="Snapchat" >Snapchat</option>
                                                 <option value="No One" >No One</option>
					                            </select>  
                                        </li>
                                        <h3>Budgets</h3>
                                         <li>
                                            <select name="Osatisfied" id="Select21"  style="width:32%">
                                                  <option value="" >Are you satisfied with the earnings?</option>	
						                          <option value="Yes" >Yes</option>	
						                          <option value="No" >No</option>	
					                            </select>  
                                    <select name="OmanageExpenses" id="Select22"  style="width:32%">
						                          <option value="" >Are you able to manage the expenses?</option>	
						                         <option value="Yes" >Yes</option>	
						                          <option value="No" >No</option>		
					                            </select>  
                                    <select name="OExcessearnings" id="Select23"  style="width:32%">
						                          <option value="" >Do you save/invest your excess earnings?</option>	
						                          <option value="Yes" >Yes</option>	
						                          <option value="No" >No</option>	
					                            </select>  
                                        </li>
                                          <li>
                                             <input type="text" placeholder="How old are you?" name="OAge" style="width:32%">
                                             <select name="Omarried" id="Select24"  style="width:32%">
						                          <option value="" >Are you married? </option>	
						                         <option value="Yes" >Yes</option>	
						                          <option value="No" >No</option>		
					                            </select>  

                                             <select name="OOnlyEarnings" id="Select25"  style="width:32%">
						                          <option value="" >Are you the only earning hand in your family?</option>	
						                          <option value="Yes" >Yes</option>	
						                          <option value="No" >No</option>	
					                            </select>  
                                              </li>

                                            <h3>Who is in your family?</h3>
                                         <li>
                                    <select name="oFamilyOne" id="Select26"  style="width:32%">
						                          <option value="" >Spouse</option>	
						                           <option value="One child" >One child</option>
                                                   <option value="Two Children" >Two Children</option>
                                                   <option value="Three Children" >Three Children</option>
                                                   <option value="Brother" >Brother</option>
                                                   <option value="Sister" >Sister</option>
                                                  <option value="Father">Father</option>	
                                                   <option value="No other" >No other</option>
                                                   <option value="and others" >and others</option>	
					                            </select>  
                                    <select name="oFamilyTwo" id="Select27"  style="width:32%">
						                         <option value="" >Spouse</option>	
						                          <option value="One child" >One child</option>
                                                  <option value="Two Children" selected="true" >Two Children</option>
                                                  <option value="Three Children" >Three Children</option>
                                                  <option value="Brother" >Brother</option>
                                                  <option value="Sister" >Sister</option>
                                                  <option value="No other" >No other</option>
                                                  <option value="and others" >and others</option>	
					                            </select>  
                                    <select name="oFamilyThree" id="Select28"  style="width:32%">
						                          <option value="" >Spouse</option>	
						                          <option value="One child" >One child</option>
                                                 <option value="Two Children" >Two Children</option>
                                                 <option value="Three Children" >Three Children</option>
                                                 <option value="Brother"  selected="true">Brother</option>
                                                 <option value="Sister" >Sister</option>
                                                 <option value="No other" >No other</option>
                                                 <option value="and others" >and others</option>	
					                            </select>  
                                    <select name="oFamilyFour" id="Select29"  style="width:32%">
						                          <option value="" >Spouse</option>	
						                          <option value="One child" >One child</option>
                                                 <option value="Two Children" >Two Children</option>
                                                 <option value="Three Children" >Three Children</option>
                                                 <option value="Brother" >Brother</option>
                                                 <option value="Sister" selected="true">Sister</option>
                                                 <option value="No other" >No other</option>
                                                 <option value="and others" >and others</option>	
					                            </select>  
                                    <select name="oFamilyFive" id="Select30"  style="width:32%">
						                         <option value="" >Spouse</option>	
						                          <option value="One child" >One child</option>
                                                 <option value="Two Children" >Two Children</option>
                                                 <option value="Three Children" >Three Children</option>
                                                 <option value="Brother" >Brother</option>
                                                 <option value="Sister" >Sister</option>
                                                 <option value="No other" >No other</option>
                                                 <option value="Mother" selected="true">Mother</option>	
						             
					                            </select>  
                                    <select name="oFamilySix" id="Select31"  style="width:32%">
                                                  <option value="" >Spouse</option>	
						                          <option value="One child" >One child</option>
                                                 <option value="Two Children" >Two Children</option>
                                                 <option value="Three Children" >Three Children</option>
                                                 <option value="Brother" >Brother</option>
                                                 <option value="Sister" >Sister</option>
                                                 <option value="No other" selected="true">No other</option>
                                                 <option value="and others" >and others</option>	
					                            </select>  
                                            </li>
                                            <li>
                                                <select name="OhealthIssue" id="Select32"  style="width:32%">
						                          <option value="" >Do you face any health issue? </option>	
						                          <option value="Yes" >Yes</option>	
						                          <option value="No" >No</option>		
					                            </select>  
                                                 <br>
                                               Share with us your CV<br>
                                               <asp:FileUpload ID="uploadOtherCV" runat="server" style="width:32%"></asp:FileUpload>
                                                <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator8" ControlToValidate="uploadOtherCV" ErrorMessage="Upload file" Display="Dynamic" ValidationGroup="other"></asp:RequiredFieldValidator>
                                               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="uploadOtherCV" Display="Dynamic" ErrorMessage="Invalid file formate." ValidationExpression="^.+(.PDF|.pdf|.doc|.DOC|.docx|.DOCX)$" ValidationGroup="other"></asp:RegularExpressionValidator>
    
                                               <br><br>
                                               We need your PP size Photo<br>
                                               <asp:FileUpload ID="uploadOtherImage" runat="server" style="width:32%"></asp:FileUpload>
                                               <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator7" ControlToValidate="uploadOtherImage" ErrorMessage="Upload file" Display="Dynamic" ValidationGroup="other"></asp:RequiredFieldValidator>
                                               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="uploadOtherImage" Display="Dynamic" ErrorMessage="Invalid file formate. upload jpg or png formate" ValidationExpression="^.+(.jpg|.png|.JPG|.PNG)$" ValidationGroup="other"></asp:RegularExpressionValidator>

                                            </li>
                                            <li>
								                <textarea placeholder="What do you expect from this workshop?" name="oworkshop" style="width:97%; height:50%"></textarea> 
                                           </li>

                                           <li>
								              <h3>Note</h3>
                                                <p>* You are not charged the resource person fee, this workshop is offered by Ehsaase-e-Insaniyat Trust free of such charges. Our resource person normaly charges Rs. 7 to 8 lakhs for THREE DAY workshop.</p>
                                                <p>* You are charged for the food, stationary and some miscelenious costs under Minimum Cost bracket. You may wish to pay more to this organization and support in education of children across the valley.</p>
                                                <h3>Please pay</h3>
                                                <div id="OtherFee">
                                                   <p>
                                                    This is for others<br>
                                                    <select name="OtherFee"   style="width:32%">
						                             <option value="1500" >1500</option>	
						                             <option value="1800" >1800</option>
                                                     <option value="2000" >2000</option>			
					                                </select>   
                                                    </p> 
                                               </div>
                                           </li>

                                                <li>
                                                   <asp:CheckBox ID="chkboxOther" runat="server" /> I accept the terms and conditions
                                                   <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Required" ClientValidationFunction = "ValidateCheckBox" ValidationGroup="other"></asp:CustomValidator>
                                               </li>
                                               
                                        
                                             <li>
                                              <asp:Button ID="btnSubmit" runat="server" class="sf-button" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="other"></asp:Button>
                                                 <script type = "text/javascript">
                                                     function ValidateCheckBox(sender, args) {
                                                         if (document.getElementById("<%=chkboxOther.ClientID %>").checked == true) {
                                                                args.IsValid = true;
                                                            } else {
                                                                args.IsValid = false;
                                                            }
                                                        }
                                                    </script>
							               </li>
                                        
                                        </div> 
                                         <%-- Other details end here--%>

						            </ul>

					            </div>
					
				            </form>

                         
                            <script type = "text/javascript">
                                $(document).ready(function () {
                                    $("#dvother").hide();    // just add this
                                    $("#dvstudent").hide();
                                });
                                function showDiv(occupation) {
                                    var dv1 = document.getElementById("dvstudent");
                                    var dv2 = document.getElementById("dvother");
                                  
                                    if (occupation.value == "Student") {
                                        dv1.style.display = "block";
                                        dv2.style.display = "none";

                                    }
                                    if (occupation.value == "Government Employee") {
                                        dv1.style.display = "none";
                                        dv2.style.display = "block";

                                    }
                                    if (occupation.value == "Employed by Private Sector") {
                                        dv1.style.display = "none";
                                        dv2.style.display = "block";

                                    }
                                    if (occupation.value == "Self Employed") {
                                        dv1.style.display = "none";
                                        dv2.style.display = "block";

                                    }
                                }
                                </script>
				                <script>
				                    $(document).ready(function (e) {
				                        $(".stepsForm").stepsForm({
				                            width: '100%',
				                            active: 0,
				                            errormsg: 'Check faulty fields.',
				                            // sendbtntext: 'Submit & Pay',
				                        });

				                        $(".container .themes>span").click(function (e) {
				                            $(".container .themes>span").removeClass("selectedx");
				                            $(this).addClass("selectedx");
				                            $(".stepsForm").removeClass().addClass("stepsForm");
				                            $(".stepsForm").addClass("sf-theme-" + $(this).attr("data-value"));
				                        });
				                    });
				                </script>

			            </div>

		            </div>
	            </div>

          
    
          </div>
        </div>
      </div>
    </div>
</asp:Content>

