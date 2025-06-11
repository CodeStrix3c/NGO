<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userlogin.aspx.cs" Inherits="userlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                    <div id="divmesg" runat="server" style="background-color:silver; padding:20px; width:300px">
                                          <asp:Label runat="server" id="lblmessage" Text="" style="color:red"></asp:Label>
                                    </div>
						            <div class="sf-steps-content" style="padding-top:30px">
							             Sign in 
                                       
						            </div>
					            </div>                
					            <div class="sf-steps-form sf-radius"> 
						
						            <ul class="sf-content"> <!-- form step one --> 
							             <li>
                                                <input type="text" placeholder="Email"  name="lemail" style="width:32%" data-required="true">
									            
							             </li>
                                         <li>
                                                <input type="password" placeholder="Password" name="lpassword" style="width:32%" data-required="true">
                                         </li>
                                             
						            </ul>

					            </div>
					
					            <div>
						            <span id="sf-msg" class="sf-msg-error"></span>
						           <%-- <button id="sf-prev" type="button" class="sf-button">Previous</button>--%>
						          <%--  <button id="sf-next" type="button" class="sf-button">Next</button>--%>
                                     <asp:Button ID="btnSubmit" runat="server" class="sf-button" Text="Submit" OnClick="btnSubmit_Click"></asp:Button>
                       
					            </div>
                     
				            </form>
                            
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

