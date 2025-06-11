<%@ Page Title="Registration" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

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
			            <p><i class="muted">Before filling up the application form, read the <a href="images/ELIGIBILITY_CRITERIA.pdf" target="_blank"> Eligibility Criteria </a> for Regional Rural Bank Examinations.</i></p>
                        <h5><asp:Label ID="lblmessage" ForeColor="Red" runat="server" Text=""></asp:Label></h5>
			            <div class="clearfix"></div>
                        <h4>Name:</h4>
                        <div class="row-fluid">
				            <div class="span4">
					            <label id="Label1" for="jform_firstName" class="hasTooltip required" title="" data-original-title="<strong>First Name</strong><br />Enter Your Name">
	                            First  Name<span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_firstName" id="jform_firstName" value="" class="required" size="30" required="required" aria-required="true">
                                </div>
				            </div>
				            <div class="span4">
					            <label id="Label2" for="jform_middleName" class="hasTooltip required" title="" data-original-title="<strong>Middle Name</strong><br />Enter your Middle Name">
	                             Middle Name<span class="star">&nbsp;</span></label>	
                                <div class="controls">
                                   <input type="text" name="jform_middleName"  id="jform_middleName" value="" size="30">
                                 </div>
				            </div>
				            <div class="span4">
					            <label id="Label3" for="jform_Surname" class="hasTooltip required" title="" data-original-title="<strong>Surname</strong><br />Enter your Surname">
	                             Surname<span class="star">&nbsp;</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_Surname" id="jform_Surname" value="" class="required" size="60" required="required">
                                </div>
				            </div>
			            </div>
			            <div class="row-fluid">
				            <div class="span4">
					            <label id="jform_Gender" for="jform_Gender" class="hasTooltip required" title="" data-original-title="<strong>Gender</strong><br />Select Gender">
	                             Gender<span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                   
                                    <select name="Gender" id="Gender">
						              <option value="Male" >Male</option>	
						              <option value="Female" >Female</option>	
						              <option value="Transgender" >Transgender</option>	
					                </select>  

                                </div>
				            </div>
				            <div class="span4">
					            <label id="jform_Marital_Status" for="jform_Marital_Status" class="hasTooltip required" title="" data-original-title="<strong>Marital Status</strong><br />Select Marital Status">
	                             Marital Status<span class="star">&nbsp;*</span></label>	
                                <div class="controls">
                                  
                                    <select name="MaritalStatus" id="MaritalStatus">
						              <option value="Single" >Single</option>	
						              <option value="Married" >Married</option>	
						              <option value="Divorced" >Divorced</option>	
                                      <option value="widow/widower" >Widow/Widower</option>	
					                </select>  

                                 </div>
				            </div>
				            <div class="span4">
					            <label id="jform_Date_of_Birth " for="jform_contact_emailmsg" class="hasTooltip required" title="" data-original-title="<strong>Date of Birth </strong><br />Enter your Date of Birth here .">
	                             Date of Birth<span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                        <input type="date" name="jform_Date_of_Birth" id="jform_DOB" value="">
                                           
	                                    <script type="text/javascript">
	                                        $(function () {
	                                            $('*[name=jform_Date]').appendDtpicker();
	                                        });
	                                    </script>
                                               <script>
                                                   $(function () {
                                                       var element = document.getElementById('enddate');
                                                       element.style.display = 'none';

                                                      var elemdiff = document.getElementById('diff');
                                                       elemdiff.style.display = 'none';
                                                   });
                                             </script>
                                          
                                              <script type="text/javascript" language="javascript">
                                                  function calcAge(dtFrom, dtTo) {
                                                      var a = dtTo.getDate() + (dtTo.getMonth() + (dtTo.getFullYear() - 1700) * 16) * 32;
                                                      var b = dtFrom.getDate() + (dtFrom.getMonth() + (dtFrom.getFullYear() - 1700) * 16) * 32;
                                                      var x = Math.floor((a - b) / 32 / 16);
                                                      return x < 0 ? null : x;
                                                  }
                                                  function calc() {
                                                      var dtTo = new Date(document.getElementById('enddate').value);
                                                      var dtFrom = new Date(document.getElementById('jform_DOB').value);
                                                      document.getElementById('diff').value = calcAge(dtFrom, dtTo);
                                                      var dif = calcAge(dtFrom, dtTo);
                                                          if (dif <= 35) {
                                                              // alert("hello");
                                                          } else {
                                                              alert("Sorry Your are not eligible! your age is more than 35 Years");
                                                          }
                                                      //alert(dif);
                                                      return false;
                                                  }
                                            </script>

                                             <input type='text' name="jform_Date" id='enddate'/>
                                             <input type='text' name="dobDiffrence" id='diff' value=''/>
                                           <%-- <input type='button' id="btncal" onclick='javascript: calc();' value='Calculate'/>--%>


                                </div>
				            </div>
			            </div>
                        <h4>Parentage:</h4>
                        <div class="row-fluid">
				            <div class="span4">
					            <label id="Label4" for="jform_PfirstName" class="hasTooltip required" title="" data-original-title="<strong>First Name</strong><br />Enter Your Name">
	                            First  Name<span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_PfirstName" id="Text1" value="" class="required" size="30" required="required" aria-required="true">
                                </div>
				            </div>
				            <div class="span4">
					            <label id="Label5" for="jform_PmiddleName" class="hasTooltip required" title="" data-original-title="<strong>Middle Name</strong><br />Enter your Middle Name">
	                             Middle Name<span class="star">&nbsp;</span></label>	
                                <div class="controls">
                                   <input type="text" name="jform_PmiddleName" id="middleName" value="" size="30">
                                 </div>
				            </div>
				            <div class="span4">
					            <label id="Label6" for="jform_PSurname" class="hasTooltip required" title="" data-original-title="<strong>Surname</strong><br />Enter your Surname">
	                             Surname<span class="star">&nbsp; </span></label>
                                <div class="controls">
                                    <input type="text" name="jform_PSurname" id="Text2" value="" class="required" size="60">
                                </div>
				            </div>
			            </div>

                         <h4>Permanent Address: </h4>
                        <div class="row-fluid">
				            <div class="span4">
					            <label id="Label7" for="jform_Street_Name" class="hasTooltip required" title="" data-original-title="<strong>Address</strong><br />Enter H. No/Street Name">
	                            H. No/Street Name<span class="star">&nbsp;</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_Street_Name" id="Text3" value="" class="required" size="30" required="required" aria-required="true">
                                </div>
				            </div>
				            <div class="span4">
					            <label id="Label8" for="jform_Village" class="hasTooltip required" title="" data-original-title="<strong>Village/Town</strong><br />Enter Village/Town">
	                             Village/Town:<span class="star">&nbsp;</span></label>	
                                <div class="controls">
                                   <input type="text" name="jform_Village" class="required" id="jform_Village" value="" size="30" required="required" aria-required="true">
                                 </div>
				            </div>
				            <div class="span4">
					            <label id="Label9" for="jform_City" class="hasTooltip required" title="" data-original-title="<strong>City</strong><br />Enter your City">
	                             City: <span class="star">&nbsp;</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_City" id="jform_City" value="" class="required" size="60" required="required" aria-required="true">
                                </div>
				            </div>
			            </div>
                        <div class="row-fluid">
				            <div class="span4">
					            <label id="Label10" for="jform_District" class="hasTooltip required" title="" data-original-title="<strong>District</strong><br />Enter District">
	                            District:<span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                     <select name="jform_District" id="Select4" style="width:58%; height:32px">
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
                                         <option value="Kargil" >Kargil</option>
                                         <option value="Leh" >Leh</option>
                                         <option value="Pulwama" >Pulwama</option>
                                         <option value="Poonch" >Poonch</option>
                                         <option value="Rajouri" >Rajouri</option>
                                         <option value="Ramban" >Ramban</option>
                                         <option value="Reasi" >Reasi</option>
                                         <option value="Samba" >Samba</option>
                                         <option value="Srinagar" >Srinagar</option>
                                         <option value="Shopian" >Shopian</option>
                                         <option value="Udhampur" >Udhampur</option>
					                </select>  
                                </div>
				            </div>
				            <div class="span4">
					            <label id="Label11" for="jform_State" class="hasTooltip required" title="" data-original-title="<strong>State</strong><br />Enter State">
	                            State:<span class="star">&nbsp;</span></label>	
                                <div class="controls">
                                    <select name="jform_State" id="Select3" style="width:58%; height:32px">
                                      <option value="J&K" >Jammu & Kashmir</option>
					                </select>   
                                 </div>
				            </div>
				            <div class="span4">
					            <label id="Label12" for="jform_PinCode" class="hasTooltip required" title="" data-original-title="<strong>Pin Code</strong><br />Enter your Pin Code">
	                             Pin Code: <span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_PinCode" id="Text5" value="" class="required" size="60" required="required" aria-required="true">
                                </div>
				            </div>
			            </div>
                        <div class="row-fluid">
				            <div class="span4">
					            <label id="Label13" for="jform_PoliceStation:" class="hasTooltip required" title="" data-original-title="<strong>Police Station:</strong><br />Enter Police Station">
	                            Police Station:<span class="star">&nbsp;</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_PoliceStation" id="Text6" value="" class="required" size="30" required="required" aria-required="true">
                                </div>
				            </div>
				            <div class="span4">
					            <label id="Label14" for="jform_AadharNo" class="hasTooltip required" title="" data-original-title="<strong>Aadhar No</strong><br />Enter Aadhar No (if available)">
	                            Aadhar No:<span class="star">&nbsp;</span></label>	
                                <div class="controls">
                                   <input type="text" name="jform_AadharNo" id="jform_AadharNo" value="" size="30" >
                                 </div>
				            </div>
				            <div class="span4">
					            <label id="Label15" for="jform_VoterIDNo" class="hasTooltip required" title="" data-original-title="<strong>Voter ID No</strong><br />Enter your Voter ID No (if available)">
	                             Voter ID No: <span class="star">&nbsp;</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_VoterIDNo" id="jform_VoterIDNo" value="" size="60">
                                </div>
				            </div>
			            </div>

                        <h4>Address for correspondence: (if different from PA): </h4>
                        <div class="row-fluid">
				            <div class="span4">
					            <label id="Label23" for="jform_CStreet_Name" class="hasTooltip required" title="" data-original-title="<strong>Address</strong><br />Enter H. No/Street Name">
	                            H. No/Street Name<span class="star">&nbsp;</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_CStreet_Name" id="Text19" value=""  size="30" >
                                </div>
				            </div>
				            <div class="span4">
					            <label id="Label24" for="jform_CVillage" class="hasTooltip required" title="" data-original-title="<strong>Village/Town</strong><br />Enter Village/Town">
	                             Village/Town:<span class="star">&nbsp;</span></label>	
                                <div class="controls">
                                   <input type="text" name="jform_CVillage" id="Text21" value="" size="30" >
                                 </div>
				            </div>
				            <div class="span4">
					            <label id="Label25" for="jform_CCity" class="hasTooltip required" title="" data-original-title="<strong>City</strong><br />Enter your City">
	                             City: <span class="star">&nbsp;</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_CCity" id="Text22" value=""  size="60">
                                </div>
				            </div>
			            </div>
                        <div class="row-fluid">
				            <div class="span4">
					            <label id="Label26" for="jform_CDistrict" class="hasTooltip required" title="" data-original-title="<strong>District</strong><br />Enter District">
	                            District:<span class="star">&nbsp;</span></label>
                                <div class="controls">
                                    <select name="jform_CDistrict" id="Select5" style="width:58%; height:32px">
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
                                         <option value="Kargil" >Kargil</option>
                                         <option value="Leh" >Leh</option>
                                         <option value="Pulwama" >Pulwama</option>
                                         <option value="Poonch" >Poonch</option>
                                         <option value="Rajouri" >Rajouri</option>
                                         <option value="Ramban" >Ramban</option>
                                         <option value="Reasi" >Reasi</option>
                                         <option value="Samba" >Samba</option>
                                         <option value="Srinagar" >Srinagar</option>
                                         <option value="Shopian" >Shopian</option>
                                         <option value="Udhampur" >Udhampur</option>
					                </select>
                                </div>
				            </div>
				            <div class="span4">
					            <label id="Label27" for="jform_CState" class="hasTooltip required" title="" data-original-title="<strong>State</strong><br />Enter State">
	                            State:<span class="star">&nbsp;</span></label>	
                                <div class="controls">
                                     <select name="jform_CState" id="Select1" style="width:58%; height:32px">
                                      <option value="J&K" >Jammu & Kashmir</option>
					                </select>   

                                 </div>
				            </div>
				            <div class="span4">
					            <label id="Label28" for="jform_CPinCode" class="hasTooltip required" title="" data-original-title="<strong>Pin Code</strong><br />Enter your Pin Code">
	                             Pin Code: <span class="star">&nbsp;</span></label>
                                <div class="controls">
                                    <input type="text" name="jform_CPinCode" id="Text25" value="" size="60">
                                </div>
				            </div>
			            </div>

                        <h4>Contact Details </h4>
                      	<div class="row-fluid">
				            <div class="span4">
					            <label id="jform_Email" for="jform_Email" class="hasTooltip required" title="" data-original-title="<strong>Email</strong><br />Email for contact">
	                             Email<span class="star">&nbsp;*</span></label>	
                                <div class="controls">
                                     <input type="email" name="jform_Email" class="required" id="Text7" value="" size="30" required="required" aria-required="true">
                                 </div>
				            </div>
				            <div class="span4">
					            <label id="jform_Mobile" for="jform_contact_emailmsg" class="hasTooltip required" title="" data-original-title="<strong>Mobile No.</strong><br />Enter your mobile no. here .">
	                             Mobile<span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                     <input type="text" name="jform_Mobile" class="required" id="jform_Mob" value="" size="30" required="required" aria-required="true">
                                </div>
				            </div>
                                 <div class="span4">
					            <label id="Label16" for="jform_AlternateContact" class="hasTooltip required" title="" data-original-title="<strong>Mobile No.</strong><br />Enter your mobile no. here .">
	                             Alternate  Contact<span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                     <input type="text" name="jform_AlternateContact"  id="Text8" value="" size="30" required="required" aria-required="true">
                                </div>
				            </div>
			            </div>

                        <h4> Education Details:</h4>
                        <div class="row-fluid">
                            
                                <div class="controls" style="padding-left:35px">
                                <table style="width:100%;">

                                    <tr>

                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed">Educational Qualification</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed"> University & Course</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed">Year</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed">Max. Marks</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed">Marks Obtained</td>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed">Grade/Award</td>

                                    </tr>
                                    <tr>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed">Post Graduation</td>
                                        <td><input type="text" name="jform_PGUniversity" class="required" id="Text13" value="" size="30" ></td>
                                        <td><input type="text" name="jform_PGYear" class="required" id="Text9" value="" size="30" ></td>
                                        <td><input type="text" name="jform_PGMaxMarks" class="required" id="Text10" value="" size="30" ></td>
                                        <td><input type="text" name="jform_PGMarksObtained" class="required" id="Text11" value="" size="30" ></td>
                                        <td><input type="text" name="jform_PGGrade" class="required" id="Text12" value="" size="30" ></td>

                                    </tr>
                                    <tr>
                                        <td style="background-color:#22ADD6; padding-top:5px; padding-bottom:5px; padding-right:5px; padding-left:5px; color:white; border:dashed">Graduation </td>
                                        <td><input type="text" name="jform_GUniversity" class="required" id="Text14" value="" size="30" required="required" aria-required="true" ></td>
                                        <td><input type="text" name="jform_GYear" class="required" id="Text15" value="" size="30" required="required" aria-required="true"></td>
                                        <td><input type="text" name="jform_GMaxMarks" class="required" id="Text16" value="" size="30" required="required" aria-required="true"></td>
                                        <td><input type="text" name="jform_GMarksObtained" class="required" id="Text17" value="" size="30" required="required" aria-required="true"></td>
                                        <td><input type="text" name="jform_GGrade" class="required" id="Text18" value="" size="30" required="required" aria-required="true"></td>

                                    </tr>

                                </table>
                                 </div>
                             
			            </div>

                        <h4> Other Information:</h4>
                        <div class="row-fluid">
				            <div class="span4">
					            <label id="Label17" for="jform_Email" class="hasTooltip required" title="" data-original-title="<strong>Exam</strong><br />Have you ever appeared in any Bank Exam?">
	                                Have you ever appeared in any Bank Exam?  
                                    <select name="any_Bank_Exam" id="any_Bank_Exam" style="width:16%; height:28px" onchange="disable_Bank_Exam(this)">
                                      <option value="No" >No</option>
						              <option value="Yes" >Yes</option>	
					                </select>   
                                    <span class="star">&nbsp;*</span></label>	
                                    <div class="controls">
                                      <input type="text" name="BankExam" id="BankExamval" placeholder="Name of Examination & Year" value="" size="30" disabled="false">
                                    </div>
                                    <script>
                                        function disable_Bank_Exam(v) {
                                            if (v.value == 'No') {
                                                BankExamval.disabled = true;
                                                BankExamval.value = "";
                                            }
                                            else {
                                                BankExamval.disabled = false;
                                            }
                                        }
                                    </script>
      
                            
				            </div>
				            <div class="span4">
					            <label id="Label18" for="jform_contact_emailmsg" class="hasTooltip required" title="" data-original-title="<strong></strong><br />Have you been selected by any Bank earlier? ">
	                            Have you been selected by any Bank earlier? 
                                     <select name="any_Bank_Earlier" id="Select2" style="width:16%; height:28px" onchange="disableBank_Earlier(this)">
						              <option value="No" >No</option>
                                      <option value="Yes" >Yes</option>		
					                </select> <span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                     <input type="text" name="Bank_Earlier"  id="Bank_Earlier2" placeholder="Name of the Position & Year" value="" size="30"  disabled="false">
                                </div>
                                 <script>
                                     function disableBank_Earlier(v) {
                                         if (v.value == 'No') {
                                             Bank_Earlier2.disabled = true;
                                             Bank_Earlier2.value = "";
                                         }
                                         else {
                                             Bank_Earlier2.disabled = false;
                                         }
                                     }
                                    </script>
				            </div>
                                 <div class="span4">
					            <label id="Label19" for="jform_AlternateContact" class="hasTooltip required" title="" data-original-title="<strong>Mobile No.</strong><br />Enter your mobile no. here .">
	                            Name the bank examinations you look forward to applying for <span class="star">&nbsp;*</span></label>
                                <div class="controls">
                                     <input type="text" name="jform_applying"  id="Text20" value="" size="30" aria-required="true">
                                </div>
				            </div>
			            </div>

                        <h4> Upload Documents: </h4>
			             <div class="row-fluid">
				                <div class="span4">
					                <label id="Label20" for="jform_Email" class="hasTooltip required" title="" data-original-title="<strong>Upload</strong><br />Marks certificate (last examination qualified) ">
	                                   Marks certificate (last examination qualified) 
                                       <span class="star">&nbsp;*</span></label>	
                                        <div class="controls">
                                            <asp:FileUpload ID="uploadMarksCard" runat="server"></asp:FileUpload>
                                              <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" ControlToValidate="uploadMarksCard" ErrorMessage="Upload file" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="RequiredFieldValidator" 
                                                runat="server" Text="Uplaod PDF file"  ErrorMessage="Uplaod PDF  file!" ToolTip="Uplaod PDF file!"
                                                ValidationExpression="^.*\.(pdf|PDF)$"
                                                ControlToValidate="uploadMarksCard" Display="Dynamic" ValidationGroup="Writer"
                                                Width="277px"></asp:RegularExpressionValidator>
                                        </div>
				                </div>
				                <div class="span4">
					                <label id="Label21" for="jform_contact_emailmsg" class="hasTooltip required" title="" data-original-title="<strong>Upload</strong><br />Aadhar/voter ID card">
	                                  Aadhar/voter ID card
                                        <span class="star">&nbsp;*</span></label>
                                    <div class="controls">
                                          <asp:FileUpload ID="uploadAadhar" runat="server"></asp:FileUpload>
                                          <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ControlToValidate="uploadAadhar" ErrorMessage="Upload file" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="uploadAadhar" Display="Dynamic" ErrorMessage="Invalid file formate" ValidationExpression="^.+(.jpg|.pdf|.PDF|.png|.JPG|.PNG)$" ValidationGroup="Writer"></asp:RegularExpressionValidator>

                                    </div>
				                </div>
                                     <div class="span4">
					                <label id="Label22" for="jform_AlternateContact" class="hasTooltip required" title="" data-original-title="<strong>Photograph</strong><br /> (200X250 px resolution) ">
	                                 Photograph (200X250 px resolution) <span class="star">&nbsp;*</span></label>
                                    <div class="controls">
                                         <asp:FileUpload ID="uploadPhotograph" runat="server"></asp:FileUpload>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" ControlToValidate="uploadPhotograph" ErrorMessage="Upload file" Display="Dynamic" ValidationGroup="Writer"></asp:RequiredFieldValidator>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="uploadPhotograph" Display="Dynamic" ErrorMessage="Invalid file formate. upload jpg or png formate" ValidationExpression="^.+(.jpg|.png|.JPG|.PNG)$" ValidationGroup="Writer"></asp:RegularExpressionValidator>
                                    </div>
				                </div>
			                </div>

			            <div class="controls">
				            <div class="contact_email-copy pull-right">
                            <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" OnClientClick='javascript: calc();' ValidationGroup="Writer"></asp:Button> 
                                                
				            </div>
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

