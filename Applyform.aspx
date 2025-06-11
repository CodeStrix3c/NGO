<%@ Page Title="Form" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Applyform.aspx.cs" Inherits="Applyform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-row">
        <div class="row-container visible visible-first">
          <div class="container">
            <div class="content-inner row">   
              <main role="main">
              <div id="component" class="span12">
                          
               <style>
                   .lrcounter-horizontal-vertical table {
                       background: none repeat scroll 0 0 transparent !important;
                       border: medium none !important;
                       color: #000000 !important;
                       margin: 0 !important;
                       padding: 0 !important;
                       text-align: left !important;
                   }


                       .lrcounter-horizontal-vertical table tr, .lrcounter-horizontal-vertical table td {
                           background: none repeat scroll 0 0 transparent !important;
                           border: medium none !important;
                           color: #000000 !important;
                           display: inline-table;
                           margin-left: 4px !important;
                           padding: 0 2px !important;
                           text-align: left !important;
                           vertical-align: bottom !important;
                       }

                   iframe, svg {
                       max-width: none !important;
                   }
               </style>
  
                  
              <div class="contact_misc">
	              <h3>Registration form:</h3>
              </div>
              <div class="contact_form">
	            <form id="contact-form"  class="form-validate">
		            <fieldset>
                        <h5><asp:Label ID="lblmessage" ForeColor="Red" runat="server" Text=""></asp:Label></h5>
			            <div class="clearfix"></div>
                       
                         <h4>Job Location Preference : </h4>
                        <div class="row-fluid">
				            <div class="span4A">
					            <label id="Label9" for="jform_Gender" class="hasTooltip required" title="" data-original-title="<strong>Gender</strong><br />Select Gender">
	                             <b> Preference One </b><span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                    <select name="Pdistrictone" id="Select7">
						              <option value="Srinagar" >Srinagar</option>
                                      <option value="Budgam" >Budgam</option>	
                                      <option value="Kupwara" >Kupwara</option>		
					                </select>  
                                </div>
				            </div>

                            <div class="span4A">
					            <label id="Label13" for="jform_Gender" class="hasTooltip required" title="" data-original-title="<strong>Gender</strong><br />Select Gender">
	                             <b> Preference Two </b><span class="star">&nbsp;</span></label>
                                <div class="controls">
                                    <select name="PdistrictTwo" id="Select5">
						              <option value="NotApplicable" >Not Applicable</option>	
						              <option value="Srinagar" >Srinagar</option>
                                      <option value="Budgam" >Budgam</option>	
                                      <option value="Kupwara" >Kupwara</option>		
					                </select>  
                                </div>
				            </div>

                              <div class="span4A">
					            <label id="Label14" for="jform_Marital_Status" class="hasTooltip required" title="" data-original-title="<strong>Marital Status</strong><br />Select Marital Status">
	                             <b> Preference Three </b><span class="star">&nbsp;</span></label>	
                                <div class="controls">
                                  
                                    <select name="PdistrictThree" id="Select6">
						              <option value="NotApplicable" >Not Applicable</option>	
						               <option value="Srinagar" >Srinagar</option>
                                       <option value="Budgam" >Budgam</option>	
                                       <option value="Kupwara" >Kupwara</option>		
					                </select>  

                                 </div>
				            </div>

                             
				           
			            </div>

                         <h4>Personal Details: </h4>
                        <div class="row-fluid">
				            <div class="span4A">
					            <label id="Label1" for="jform_firstName" class="hasTooltip required" title="" data-original-title="<strong>First Name</strong><br />Enter Your Name">
	                            <b>Full  Name </b><span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_firstName" id="jform_firstName" value="" class="required"  required="required" aria-required="true">
                                </div>
				            </div>

                            <div class="span4A">
					            <label id="jform_Gender" for="jform_Gender" class="hasTooltip required" title="" data-original-title="<strong>Gender</strong><br />Select Gender">
	                             <b> Gender </b><span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                    <select name="Gender" id="Gender">
						              <option value="Male" >Male</option>	
						              <option value="Female" >Female</option>	
						              <option value="Transgender" >Transgender</option>	
					                </select>  
                                </div>
				            </div>

                              <div class="span4A">
					            <label id="jform_Marital_Status" for="jform_Marital_Status" class="hasTooltip required" title="" data-original-title="<strong>Marital Status</strong><br />Select Marital Status">
	                             <b> Marital Status </b><span class="star">&nbsp;*</span></label>	
                                <div class="controls">
                                  
                                    <select name="MaritalStatus" id="MaritalStatus">
						              <option value="Single" >Single</option>	
						              <option value="Married" >Married</option>	
						              <option value="Divorced" >Divorced</option>	
                                      <option value="widow/widower" >Widow/Widower</option>	
					                </select>  

                                 </div>
				            </div>

                             <div class="span4A">
					            <label id="jform_Date_of_Birth " for="jform_contact_emailmsg" class="hasTooltip required" title="" data-original-title="<strong>Date of Birth </strong><br />Enter your Date of Birth here .">
	                             <b> Date of Birth </b><span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                        <input type="date" name="jform_Date_of_Birth" id="jform_DOB" value="">

                                </div>
				            </div>
				           
			            </div>
			         
                        <div class="row-fluid">
				            <div class="span4A">
					            <label id="Label4" for="jform_PfirstName" class="hasTooltip required" title="" data-original-title="<strong>First Name</strong><br />Enter Your Name">
	                             <b>Parentage/Husband's Name </b><span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_PfirstName" id="jform_PfirstName" value="" class="required" size="30" required="required" aria-required="true">
                                </div>
				            </div>
				            
                               <div class="span4A">
					            <label id="jform_Email" for="jform_Email" class="hasTooltip required" title="" data-original-title="<strong>Email</strong><br />Email for contact">
	                             Email<span class="star">&nbsp;*</span></label>	
                                <div class="controls">
                                     <input type="email" name="jform_Email" class="required" id="jformEmail"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Please enter valid email address" value="" >
                                 </div>
				            </div>
				            <div class="span4A">
					            <label id="jform_Mobile" for="jform_contact_emailmsg" class="hasTooltip required" title="" data-original-title="<strong>Mobile No.</strong><br />Enter your mobile no. here .">
	                             Mobile<span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                     <input type="text" name="jform_Mobile" class="required" id="jform_Mob" pattern="^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$" title="Enter Valid mobile 10 digit number ex.9811111111" required="required" aria-required="true">
                                </div>
				            </div>
                                 <div class="span4A">
					            <label id="Label16" for="jform_AlternateContact" class="hasTooltip required" title="" data-original-title="<strong>Mobile No.</strong><br />Enter your mobile no. here .">
	                             Alternate  Contact<span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                     <input type="text" name="jform_AlternateContact" pattern="^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$" title="Enter Valid mobile 10 digit number ex.9811111111"  id="Text8">
                                </div>
				            </div>

			            </div>

                         <h4>Permanent Address: </h4>
                        <div class="row-fluid">
				            <div class="span4A">
					            <label id="Label7" for="jform_Street_Name" class="hasTooltip required" title="" data-original-title="<strong>Address</strong><br />Enter H. No/Street Name">
	                             <b>Address </b><span class="star">&nbsp;</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_Street_Name" id="jform_Street_Name" value="" class="required" size="30" required="required" aria-required="true">
                                </div>
				            </div>
			           
				            <div class="span4A">
					            <label id="Label10" for="jform_District" class="hasTooltip required" title="" data-original-title="<strong>District</strong><br />Enter District">
	                            District:<span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                     <select name="jform_District" id="Select4">
                                         <option value="Anantnag" >Anantnag</option>
                                         <option value="Bandipora" >Bandipora</option>
                                         <option value="Baramulla" >Baramulla</option>
                                         <option value="Budgam" >Budgam</option>
                                         <option value="Doda" >Doda</option>
                                         <option value="Ganderbal" >Ganderbal</option>
                                         <option value="Jammu" >Jammu</option>
                                         <option value="Kathua" >Kathua</option>
                                         <option value="Kishtwar" >Kishtwar</option>
                                         <option value="Kulgam" >Kulgam</option>
                                         <option value="Kupwara" >Kupwara</option>
                                         <option value="Pulwama" >Pulwama</option>
                                         <option value="Poonch" >Poonch</option>
                                         <option value="Rajouri" >Rajouri</option>
                                         <option value="Ramban" >Ramban</option>
                                         <option value="Reasi" >Reasi</option>
                                         <option value="Samba" >Samba</option>
                                         <option value="Srinagar" Selected>Srinagar</option>
                                         <option value="Shopian" >Shopian</option>
                                         <option value="Udhampur" >Udhampur</option>
					                </select>  
                                </div>
				            </div>
				            <div class="span4A">
					            <label id="Label11" for="jform_State" class="hasTooltip required" title="" data-original-title="<strong>State</strong><br />Enter State">
	                            State:<span class="star">&nbsp;</span></label>	
                                <div class="controls">
                                    <select name="jform_State" id="Select3">
                                      <option value="J&K" >Jammu & Kashmir</option>
					                </select>   
                                 </div>
				            </div>
				            <div class="span4A">
					            <label id="Label12" for="jform_PinCode" class="hasTooltip required" title="" data-original-title="<strong>Pin Code</strong><br />Enter your Pin Code">
	                             Pin Code: <span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_PinCode" id="Text5" value="" class="required" size="60" required="required" aria-required="true">
                                </div>
				            </div>
			            </div>
                       

                         <h4>Present Address: </h4>
                        <div class="row-fluid">
				            <div class="span4A">
					            <label id="Label2" for="jform_Street_Name" class="hasTooltip required" title="" data-original-title="<strong>Address</strong><br />Enter H. No/Street Name">
	                             <b>Address </b><span class="star">&nbsp;</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_Street_NameOne" id="Text65" value="" class="required" size="30" required="required" aria-required="true">
                                </div>
				            </div>
			           
				            <div class="span4A">
					            <label id="Label3" for="jform_District" class="hasTooltip required" title="" data-original-title="<strong>District</strong><br />Enter District">
	                            District:<span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                     <select name="jform_DistrictOne" id="Select1">
                                         <option value="Anantnag" >Anantnag</option>
                                         <option value="Bandipora" >Bandipora</option>
                                         <option value="Baramulla" >Baramulla</option>
                                         <option value="Budgam" >Budgam</option>
                                         <option value="Doda" >Doda</option>
                                         <option value="Ganderbal" >Ganderbal</option>
                                         <option value="Jammu" >Jammu</option>
                                         <option value="Kathua" >Kathua</option>
                                         <option value="Kishtwar" >Kishtwar</option>
                                         <option value="Kulgam" >Kulgam</option>
                                         <option value="Kupwara" >Kupwara</option>
                                         <option value="Pulwama" >Pulwama</option>
                                         <option value="Poonch" >Poonch</option>
                                         <option value="Rajouri" >Rajouri</option>
                                         <option value="Ramban" >Ramban</option>
                                         <option value="Reasi" >Reasi</option>
                                         <option value="Samba" >Samba</option>
                                         <option value="Srinagar" Selected>Srinagar</option>
                                         <option value="Shopian" >Shopian</option>
                                         <option value="Udhampur" >Udhampur</option>
					                </select>  
                                </div>
				            </div>
				            <div class="span4A">
					            <label id="Label5" for="jform_State" class="hasTooltip required" title="" data-original-title="<strong>State</strong><br />Enter State">
	                            State:<span class="star">&nbsp;</span></label>	
                                <div class="controls">
                                    <select name="jform_StateOne" id="Select2">
                                      <option value="J&K" >Jammu & Kashmir</option>
					                </select>   
                                 </div>
				            </div>
				            <div class="span4A">
					            <label id="Label6" for="jform_PinCode" class="hasTooltip required" title="" data-original-title="<strong>Pin Code</strong><br />Enter your Pin Code">
	                             Pin Code: <span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_PinCodeOne" id="Text66" value="" class="required" size="60" required="required" aria-required="true">
                                </div>
				            </div>
			            </div>

                        <h4> Education Details:</h4>
                        <div class="row-fluid">
                            
                                <div class="controls" style="padding-left:35px">
                                <table style="width:100%;">

                                    <tr>

                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed"> Examination Passed</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed">Subject</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:7%">Year Of Passing</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:7%">Max. Marks</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:7%">Marks Obtained</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:4%">%</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed">University/Board</td>

                                    </tr>
                                    <tr>
                                         <td><input type="text" name="jform_ExaminationPassed" class="required" id="Text2" value="" size="30" style="width:100%" required="required" aria-required="true"></td>
                                        <td><input type="text" name="jform_Subject" class="required" id="Text13" value="" size="30" style="width:100%" required="required" aria-required="true"></td>
                                        <td><input type="text" name="jform_yearOfPassing"  pattern="[0-9.]+" title="Number Only" class="required" id="Text9" value="" size="30" style="width:100%" required="required" aria-required="true"></td>
                                        <td><input type="text" name="jform_PGMaxMarks"  pattern="[0-9.]+" title="Number Only" class="required" id="Text10" value="" size="30"style="width:100%"  required="required" aria-required="true"></td>
                                        <td><input type="text" name="jform_PGMarksObtained"  pattern="[0-9.]+" title="Number Only" class="required" id="Text11" value="" size="30" style="width:100%" required="required" aria-required="true"></td>
                                        <td><input type="text" name="jform_Percent"  pattern="[0-9.]+" title="Number Only" class="required" id="Text12" value="" size="30" style="width:100%" required="required" aria-required="true"></td>
                                         <td><input type="text" name="jform_PGUniversityBoard" class="required" id="Text4" value="" size="30" style="width:100%" required="required" aria-required="true"></td>
                                    </tr>

                                     <tr>
                                         <td><input type="text" name="jform_ExaminationPassedOne" class="required" id="Text1" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_SubjectOne" class="required" id="Text3" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_yearOfPassingOne"  pattern="[0-9.]+" title="Number Only" class="required" id="Text25" value="" size="30" style="width:100%"></td>
                                        <td><input type="text" name="jform_PGMaxMarksOne"  pattern="[0-9.]+" title="Number Only" class="required" id="Text26" value="" size="30"style="width:100%"></td>
                                        <td><input type="text" name="jform_PGMarksObtainedOne"  pattern="[0-9.]+" title="Number Only" class="required" id="Text27" value="" size="30" style="width:100%"></td>
                                        <td><input type="text" name="jform_PercentOne"  pattern="[0-9.]+" title="Number Only" class="required" id="Text28" value="" size="30" style="width:100%"></td>
                                         <td><input type="text" name="jform_PGUniversityBoardOne" class="required" id="Text29" value="" size="30" style="width:100%"></td>
                                    </tr>

                                      <tr>
                                         <td><input type="text" name="jform_ExaminationPassedTwo" class="required" id="Text30" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_SubjectTwo" class="required" id="Text31" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_yearOfPassingTwo"  pattern="[0-9.]+" title="Number Only" class="required" id="Text32" value="" size="30" style="width:100%"></td>
                                        <td><input type="text" name="jform_PGMaxMarksTwo"  pattern="[0-9.]+" title="Number Only" class="required" id="Text33" value="" size="30"style="width:100%"></td>
                                        <td><input type="text" name="jform_PGMarksObtainedTwo"  pattern="[0-9.]+" title="Number Only" class="required" id="Text34" value="" size="30" style="width:100%"></td>
                                        <td><input type="text" name="jform_PercentTwo"  pattern="[0-9.]+" title="Number Only" class="required" id="Text35" value="" size="30" style="width:100%"></td>
                                         <td><input type="text" name="jform_PGUniversityBoardTwo"  class="required" id="Text36" value="" size="30" style="width:100%"></td>
                                    </tr>

                                      <tr>
                                         <td><input type="text" name="jform_ExaminationPassedThree" class="required" id="Text37" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_SubjectThree" class="required" id="Text38" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_yearOfPassingThree"  pattern="[0-9.]+" title="Number Only" class="required" id="Text39" value="" size="30" style="width:100%"></td>
                                        <td><input type="text" name="jform_PGMaxMarksThree"  pattern="[0-9.]+" title="Number Only" class="required" id="Text40" value="" size="30"style="width:100%"></td>
                                        <td><input type="text" name="jform_PGMarksObtainedThree"  pattern="[0-9.]+" title="Number Only" class="required" id="Text41" value="" size="30" style="width:100%"></td>
                                        <td><input type="text" name="jform_PercentThree"  pattern="[0-9.]+" title="Number Only" class="required" id="Text42" value="" size="30" style="width:100%"></td>
                                         <td><input type="text" name="jform_PGUniversityBoardThree" class="required" id="Text43" value="" size="30" style="width:100%"></td>
                                    </tr>

                                      <tr>
                                         <td><input type="text" name="jform_ExaminationPassedFour" class="required" id="Text44" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_SubjectFour" class="required" id="Text45" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_yearOfPassingFour"  pattern="[0-9.]+" title="Number Only" class="required" id="Text46" value="" size="30" style="width:100%"></td>
                                        <td><input type="text" name="jform_PGMaxMarksFour"  pattern="[0-9.]+" title="Number Only" class="required" id="Text47" value="" size="30"style="width:100%"></td>
                                        <td><input type="text" name="jform_PGMarksObtainedFour"  pattern="[0-9.]+" title="Number Only" class="required" id="Text48" value="" size="30" style="width:100%"></td>
                                        <td><input type="text" name="jform_PercentFour"  pattern="[0-9.]+" title="Number Only" class="required" id="Text49" value="" size="30" style="width:100%"></td>
                                         <td><input type="text" name="jform_PGUniversityBoardFour" class="required" id="Text50" value="" size="30" style="width:100%"></td>
                                    </tr>
                                  

                                </table>
                                 </div>
                             
			            </div>


                          <h4>Experience:</h4>
                        <div class="row-fluid">
                            
                                <div class="controls" style="padding-left:35px">
                                <table style="width:100%;">

                                    <tr>

                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed"> Position Held</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:7%">Period From</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:7%">Period To</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:7%">Gross Salary</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:20%">Responsibilities</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:25%">Reasons for leaving the job</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed">Total Experience</td>

                                    </tr>
                                    <tr>
                                        <td><input type="text" name="jform_PositionHeld" class="required" id="Text6" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_PeriodFrom" class="required" id="Text14" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_PeriodTo" class="required" id="Text15" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_GSalary"  pattern="[0-9.]+" title="Number Only" class="required" id="Text16" value="" size="30"style="width:100%"  ></td>
                                        <td><input type="text" name="jform_Responsibilities" class="required" id="Text17" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_Reasons" class="required" id="Text18" value="" size="30" style="width:100%" ></td>
                                         <td><input type="text" name="jform_TExperience"  class="required" id="Text19" value="" size="30" style="width:100%" ></td>
                                    </tr>

                                     <tr>
                                        <td><input type="text" name="jform_PositionHeldOne" class="required" id="Text51" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_PeriodFromOne" class="required" id="Text52" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_PeriodToOne" class="required" id="Text53" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_GSalaryOne"  pattern="[0-9.]+" title="Number Only" class="required" id="Text54" value="" size="30"style="width:100%"  ></td>
                                        <td><input type="text" name="jform_ResponsibilitiesOne" class="required" id="Text55" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_ReasonsOne" class="required" id="Text56" value="" size="30" style="width:100%" ></td>
                                         <td><input type="text" name="jform_TExperienceOne" class="required" id="Text57" value="" size="30" style="width:100%" ></td>
                                    </tr>

                                     <tr>
                                        <td><input type="text" name="jform_PositionHeldTwo" class="required" id="Text58" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_PeriodFromTwo" class="required" id="Text59" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_PeriodToTwo" class="required" id="Text60" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_GSalaryTwo"  pattern="[0-9.]+" title="Number Only" class="required" id="Text61" value="" size="30"style="width:100%"  ></td>
                                        <td><input type="text" name="jform_ResponsibilitiesTwo" class="required" id="Text62" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_ReasonsTwo" class="required" id="Text63" value="" size="30" style="width:100%" ></td>
                                         <td><input type="text" name="jform_TExperienceTwo" class="required" id="Text64" value="" size="30" style="width:100%" ></td>
                                    </tr>
                                  

                                </table>
                                 </div>
                             
			            </div>



                        <%-- <h4>For Drivers Only:</h4>--%>
                       
                        <div class="row-fluid" style="visibility:hidden">
                            
                                <div class="controls" style="padding-left:35px">
                                <table style="width:100%;">

                                    <tr>

                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:20%"> Driving License No.</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:20%">Driving License Validity</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:20%">Period To</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:20%">Driving License Class</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed; width:20%">Driving License Issuing authority</td>

                                    </tr>
                                    <tr>
                                        <td><input type="text" name="jform_LicenseNo" class="required" id="Text20" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_LicenseValidity" class="required" id="Text21" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_LicensePeriodTo" class="required" id="Text22" value="" size="30" style="width:100%" ></td>
                                        <td><input type="text" name="jform_LicenseClass" class="required" id="Text23" value="" size="30"style="width:100%"  ></td>
                                        <td><input type="text" name="jform_LicenseAuthority" class="required" id="Text24" value="" size="30" style="width:100%" ></td>
                                    </tr>
                                  

                                </table>
                                 </div>
                             
			            </div>


                        <h4> Upload Your Photo: </h4>
			             <div class="row-fluid">
                                     <div class="span4">
					                <label id="Label22" for="jform_AlternateContact" class="hasTooltip required" title="" data-original-title="<strong>Photograph</strong><br /> (200X250 px resolution) ">
	                                 Photograph (width:200px & height:250px resolution) <span class="star">&nbsp;*</span></label>
                                    <div class="controls">
                                         <asp:FileUpload ID="uploadPhotograph" runat="server"></asp:FileUpload>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" ControlToValidate="uploadPhotograph" ErrorMessage="Upload Your Photo" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="uploadPhotograph" Display="Dynamic" ErrorMessage="Invalid file formate. upload jpg formate" ValidationExpression="^.+(.jpg|.JPG)$" ValidationGroup="Writer"></asp:RegularExpressionValidator>
                                    </div>
				                </div>

                              <h4> Upload Your Signature: </h4>
                              <div class="span4">
					                <label id="Label8" for="jform_AlternateContact" class="hasTooltip required" title="" data-original-title="<strong>Photograph</strong><br /> (200X250 px resolution) ">
	                                 Photograph (width: 200px & height 100px resolution) <span class="star">&nbsp;*</span></label>
                                    <div class="controls">
                                         <asp:FileUpload ID="uploadSignature" runat="server"></asp:FileUpload>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="uploadSignature" ErrorMessage="Upload Your Signature" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="uploadSignature" Display="Dynamic" ErrorMessage="Invalid file formate. upload jpg formate" ValidationExpression="^.+(.jpg|.JPG)$" ValidationGroup="Writer"></asp:RegularExpressionValidator>
                                    </div>
				                </div>
                           
			                </div>

			            <div class="controls">
				            <div class="contact_email-copy pull-right">
                            <asp:Button class="button" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="Writer"></asp:Button> 
                                                
				            </div>
                              <p>
                                 DECLARATION I hereby declare that the entries made in the above columns are
                                true to the best of my knowledge and belief. In the event of any information
                                found false, incorrect or incomplete, the Foundation shall be at liberty to cancel
                                my candidature / appointment.
                             </p>
			            </div>

		            </fieldset>
	            </form>
             </div>

      
            </div>   
                                  </main>
              </div>        
                          </div>
          </div>
    </div>
</asp:Content>

