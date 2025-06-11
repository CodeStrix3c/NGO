function Albums()
{
    var theForm=aspnetForm;
    var cnt=0;
    if(theForm.ctl00$CPH$FormView1$txtCaption.value=="")
    {
        alert("Caption field Cannot Be Empty");
        theForm.ctl00$CPH$FormView1$txtCaption.focus();
        cnt++;
        return false;
    }
    else
    {
         return true;
    }
}
function News()
{
    var theForm=aspnetForm;
    var cnt = 0;
    if (theForm.ctl00$CPH$Ofile.value == "") {
        alert("Image File Is Required");
        theForm.ctl00$CPH$Ofile.focus();
        cnt++;
        return false;
    }
    else {
        if (endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(), ".JPG")) {

        }
        else if (endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(), ".JPEG"))
        { }
        else if (endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(), ".GIF"))
        { }
        else if (endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(), ".PNG"))
        { }
        else if (endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(), ".BMP"))
        { }
        else {
            alert("Invalid Image format");
            theForm.ctl00$CPH$Ofile.focus();
            cnt++;
            return false;
        }
    }

    if(theForm.ctl00_CPH_txtTitle.value=="")
    {
        alert("Title field Cannot Be Empty");
        theForm.ctl00_CPH_txtTitle.focus();
        cnt++;
        return false;
    }

    else
    {
         return true;
    }
}
function Audios()
{
    var theForm=aspnetForm;
    var cnt=0;
   
   if(theForm.ctl00_CPH_AddAudio.value=="")
   {
        alert("Audio File Is Required");
        theForm.ctl00_CPH_AddAudio.focus();
        cnt++;
        return false;
    }
    else
    {
        if(endsWith(theForm.ctl00_CPH_AddAudio.value.toUpperCase(),".MP3"))
        {

        }
        
        else
        {
        alert("Invalid Audio Format. You Can Uplaod Only MP3 File");
        theForm.ctl00_CPH_AddAudio.focus();
        cnt++;
        return false;
        }
    
    }
    if(theForm.ctl00_CPH_txtTitle.value=="")
    {
        alert("Title Field Cannot Be Empty");
        theForm.ctl00_CPH_txtTitle.focus();
        cnt++;
        return false;
    }
   
    if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }
    
}
function Writer()
{
    var theForm=aspnetForm;
    var cnt=0;
   
   if(theForm.ctl00$CPH$Ofile.value=="")
   {
        alert("Image File Is Required");
        theForm.ctl00$CPH$Ofile.focus();
        cnt++;
        return false;
    }
    else
    {
        if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".JPG"))
        {

        }
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".JPEG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".GIF"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".PNG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".BMP"))
        {}
        else
        {
        alert("Invalid Image format");
        theForm.ctl00$CPH$Ofile.focus();
        cnt++;
        return false;
        }
    
    }
    if(theForm.ctl00$CPH$txtName.value=="")
    {
        alert("Writer Name Field Cannot Be Empty");
        theForm.ctl00$CPH$txtName.focus();
        cnt++;
        return false;
    }
   
    if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }
    
}
function Articles()
{
    var theForm=aspnetForm;
    var cnt=0;
    if(theForm.ctl00$CPH$txtTitle.value=="")
    {
        alert("Title Field Cannot Be Empty");
        theForm.ctl00$CPH$txtTitle.focus();
        cnt++;
        return false;
    }
    if(theForm.ctl00$CPH$txtAuthor.value=="")
    {
        alert("Enter Author Name");
        theForm.ctl00$CPH$txtAuthor.focus();
        cnt++;
        return false;
    }
   
    if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }
    
}
function Poem()
{
    var theForm=aspnetForm;
    var cnt=0;
    if(theForm.ctl00$CPH$txtTitle.value=="")
    {
        alert("Title Field Cannot Be Empty");
        theForm.ctl00$CPH$txtTitle.focus();
        cnt++;
        return false;
    }
      if(theForm.ctl00$CPH$txtAuthor.value=="")
    {
        alert("Author Field Cannot Be Empty");
        theForm.ctl00$CPH$txtAuthor.focus();
        cnt++;
        return false;
    }
   if(theForm.ctl00$CPH$UploadAttachment.value=="")
   {
        alert("Attachment Field Is Required");
        theForm.ctl00$CPH$UploadAttachment.focus();
        cnt++;
        return false;
    }
    
      else
    {
        if(endsWith(theForm.ctl00$CPH$UploadAttachment.value.toUpperCase(),".JPG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$UploadAttachment.value.toUpperCase(),".JPEG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$UploadAttachment.value.toUpperCase(),".GIF"))
        {}
        else if(endsWith(theForm.ctl00$CPH$UploadAttachment.value.toUpperCase(),".PNG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$UploadAttachment.value.toUpperCase(),".BMP"))
        {}
        else if(endsWith(theForm.ctl00$CPH$UploadAttachment.value.toUpperCase(),".DOC"))
        {}
        else if(endsWith(theForm.ctl00$CPH$UploadAttachment.value.toUpperCase(),".TXT"))
        {}
        else if(endsWith(theForm.ctl00$CPH$UploadAttachment.value.toUpperCase(),".PDF"))
        {}
         else if(endsWith(theForm.ctl00$CPH$UploadAttachment.value.toUpperCase(),".DOCX"))
        {}
        else
        {
        alert("Invalid File format");
        theForm.ctl00$CPH$UploadAttachment.focus();
        cnt++;
        return false;
        }
    
    }
       
    if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }
    
}
function Photos()
{
    var theForm=aspnetForm;
    var cnt=0;
   
   if(theForm.ctl00$CPH$Ofile.value=="")
   {
        alert("Image File Is Required");
        theForm.ctl00$CPH$Ofile.focus();
        cnt++;
        return false;
    }
    else
    {
        if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".JPG"))
        {

        }
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".JPEG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".GIF"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".PNG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".BMP"))
        {}
        else
        {
        alert("Invalid Image format");
        theForm.ctl00$CPH$Ofile.focus();
        cnt++;
        return false;
        }
    
    }
    if(theForm.ctl00$CPH$caption.value=="")
    {
        alert("Caption field Cannot Be Empty");
        theForm.ctl00$CPH$caption.focus();
        cnt++;
        return false;
    }
    if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }
    
}

function News_Events()
{
    var theForm=aspnetForm;
    var cnt=0;
   
   if(theForm.ctl00$CPH$Ofile.value!="")
   {
       
        if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".JPG"))
        {
        }
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".JPEG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".GIF"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".PNG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".BMP"))
        {}
        else
        {
        alert("Invalid Image format");
        theForm.ctl00$CPH$Ofile.focus();
        cnt++;
        return false;
        }
    
    }
//   if(theForm.ctl00$CPH$Ofile2.value!="")
//   {
//       
//        if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".JPG"))
//        {
//        }
//        else if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".JPEG"))
//        {}
//        else if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".GIF"))
//        {}
//        else if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".PNG"))
//        {}
//        else if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".BMP"))
//        {}
//        else
//        {
//        alert("Invalid Image format");
//        theForm.ctl00$CPH$Ofile2.focus();
//        cnt++;
//        return false;
//        }
//    
//    }
//   if(theForm.ctl00$CPH$Ofile3.value!="")
//   {
//       
//        if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".JPG"))
//        {
//        }
//        else if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".JPEG"))
//        {}
//        else if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".GIF"))
//        {}
//        else if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".PNG"))
//        {}
//        else if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".BMP"))
//        {}
//        else
//        {
//        alert("Invalid Image format");
//        theForm.ctl00$CPH$Ofile3.focus();
//        cnt++;
//        return false;
//        }
//    
//    }
//    if(theForm.ctl00$CPH$txtTitle.value=="")
//    {
//        alert("Title field Cannot Be Empty");
//        theForm.ctl00$CPH$txtTitle.focus();
//        cnt++;
//        return false;
//    }
////    if(theForm.ctl00$CPH$txtDescription.value=="")
////    {
////        alert("Description field Cannot Be Empty");
////        theForm.ctl00$CPH$txtDescription.focus();
////        cnt++;
////        return false;
////    }
//   
    if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }
//    
}

function Groups()
{
   var theForm=aspnetForm;
   var cnt=0;
   if(theForm.ctl00$CPH$ddlGroup.value =="-1")
   {
        alert("Group Slection Is Required!");
        cnt++;
        return false;
   }
   if(theForm.ctl00$CPH$Ofile.value!="")
   {
       
        if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".JPG"))
        {
        }
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".JPEG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".GIF"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".PNG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".BMP"))
        {}
        else
        {
        alert("Invalid Image format");
        theForm.ctl00$CPH$Ofile.focus();
        cnt++;
        return false;
        }
    
    }
   if(theForm.ctl00$CPH$Ofile2.value!="")
   {
       
        if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".JPG"))
        {
        }
        else if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".JPEG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".GIF"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".PNG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".BMP"))
        {}
        else
        {
        alert("Invalid Image format");
        theForm.ctl00$CPH$Ofile2.focus();
        cnt++;
        return false;
        }
    
    }
   if(theForm.ctl00$CPH$Ofile3.value!="")
   {
       
        if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".JPG"))
        {
        }
        else if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".JPEG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".GIF"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".PNG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".BMP"))
        {}
        else
        {
        alert("Invalid Image format");
        theForm.ctl00$CPH$Ofile3.focus();
        cnt++;
        return false;
        }
    
    }
    if(theForm.ctl00$CPH$txtTitle.value=="")
    {
        alert("Title field Cannot Be Empty");
        theForm.ctl00$CPH$txtTitle.focus();
        cnt++;
        return false;
    }
//    if(theForm.ctl00$CPH$txtDescription.value=="")
//    {
//        alert("Description field Cannot Be Empty");
//        theForm.ctl00$CPH$txtDescription.focus();
//        cnt++;
//        return false;
//    }
   
    if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }
    
}

function Enquiry()
{

    var theForm=aspnetForm;
    var cnt=0;
   if(theForm.ctl00_ContentPlaceHolder1_txtFullName.value=="")
   {
        alert("Full Name  Is Required");
        theForm.ctl00_ContentPlaceHolder1_txtFullName.focus();
        cnt++;
        return false;
    }
   if(theForm.ctl00_ContentPlaceHolder1_txtAddress.value=="")
   {
        alert("Address Is Required");
        theForm.ctl00_ContentPlaceHolder1_txtAddress.focus();
        cnt++;
        return false;
    }
  if(theForm.ctl00_ContentPlaceHolder1_txtPhone.value !="")
   {
        if(!checkWholeNumber(theForm.ctl00_ContentPlaceHolder1_txtPhone.value))
        {
            alert("Invalid Contact No");
            theForm.ctl00_ContentPlaceHolder1_txtPhone.focus();
            cnt++;
            return false;
        }
    }
  if(theForm.ctl00_ContentPlaceHolder1_txtEmail.value=="")
   {
        alert("Email Is Required");
        theForm.ctl00_ContentPlaceHolder1_txtEmail.focus();
        cnt++;
        return false;
    }
    else
    {
        if(!checkEmail(theForm.ctl00_ContentPlaceHolder1_txtEmail.value))
            {
                alert("Invalid Email ID");
                theForm.ctl00_ContentPlaceHolder1_txtEmail.focus();
                cnt++;
                return false;
            }
    }
  if(theForm.ctl00_ContentPlaceHolder1_txtComments.value=="")
   {
        alert("Comment Is Required");
        theForm.ctl00_ContentPlaceHolder1_txtComments.focus();
        cnt++;
        return false;
    }
    if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }
}
function Register()
{
    var cnt=0;
   if(document.form1.txtFullName.value=="")
   {
        alert("Full Name  Is Required");
        document.form1.txtFullName.focus();
        cnt++;
        return false;
    }
  if(document.form1.txtContact.value !="")
   {
        if(!checkWholeNumber(document.form1.txtContact.value))
        {
            alert("Invalid Contact No");
            document.form1.txtContact.focus();
            cnt++;
            return false;
        }
    }
   if(document.form1.txtEmailID.value !="")
   {
        if(!checkEmail(document.form1.txtEmailID.value))
            {
                alert("Invalid Email ID");
                document.form1.txtEmail.focus();
                cnt++;
                return false;
            }
    }
  if(document.form1.txtDesignation.value=="")
   {
        alert("Designation Is Required");
        document.form1.txtDesignation.focus();
        cnt++;
        return false;
    }
   if(document.form1.txtAddress.value=="")
   {
        alert("Address Is Required");
        document.form1.txtAddress.focus();
        cnt++;
        return false;
    }
    if(document.form1.txtUserName.value=="")
   {
        alert("Username Is Required");
        document.form1.txtUserName.focus();
        cnt++;
        return false;
    }
    if(document.form1.txtPassword.value=="")
   {
        alert("Password Is Required");
        document.form1.txtPassword.focus();
        cnt++;
        return false;
    }
    if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }
}

function chkOfile()
{
   var theForm=aspnetForm;
   var cnt=0;
   
   if(theForm.ctl00$CPH$Ofile.value!="")
   {
       
        if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".JPG"))
        {
        }
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".JPEG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".GIF"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".PNG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile.value.toUpperCase(),".BMP"))
        {}
        else
        {
            alert("Invalid Image format");
            theForm.ctl00$CPH$Ofile.focus();
            cnt++;
            return false;
        }
    
    }
    if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }

}

function chkOfile2()
{
    var theForm=aspnetForm;
    var cnt=0;
   if(theForm.ctl00$CPH$Ofile2.value!="")
   {
       
        if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".JPG"))
        {
        }
        else if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".JPEG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".GIF"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".PNG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile2.value.toUpperCase(),".BMP"))
        {}
        else
        {
        alert("Invalid Image format");
        theForm.ctl00$CPH$Ofile2.focus();
        cnt++;
        return false;
        }
    
    }
    
     if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }
}
function chkOfile3()
{
    var theForm=aspnetForm;
    var cnt=0;
   if(theForm.ctl00$CPH$Ofile3.value!="")
   {
       
        if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".JPG"))
        {
        }
        else if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".JPEG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".GIF"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".PNG"))
        {}
        else if(endsWith(theForm.ctl00$CPH$Ofile3.value.toUpperCase(),".BMP"))
        {}
        else
        {
        alert("Invalid Image format");
        theForm.ctl00$CPH$Ofile3.focus();
        cnt++;
        return false;
        }
    
    }
    
     if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }
}
function Contact()
{  
    var theForm=aspnetForm;
    var cnt=0;
   if(theForm.ctl00$CPH$txtTitle.value=="")
    {
        alert("Title field Cannot Be Empty");
        theForm.ctl00$CPH$txtTitle.focus();
        cnt++;
        return false;
    }
//    if(theForm.ctl00$CPH$txtBodyText.value == "")
//    {
//        alert("Address field Cannot Be Empty");
//        theForm.ctl00$CPH$txtBodyText.focus();
//        cnt++;
//        return false;
//    }
    if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }


}

function Package()
{  
    var theForm=aspnetForm;
    var cnt=0;
   if(theForm.ctl00$CPH$txtTitle.value=="")
    {
        alert("Title field Cannot Be Empty");
        theForm.ctl00$CPH$txtTitle.focus();
        cnt++;
        return false;
    }
//    if(theForm.ctl00$CPH$txtBodyText.value == "")
//    {
//        alert("Address field Cannot Be Empty");
//        theForm.ctl00$CPH$txtBodyText.focus();
//        cnt++;
//        return false;
//    }
    if(cnt>0)
    {
        return false;
    }
    else
    {
        return true;
    }


}

//////////////Helping Functions...................
function checkWholeNumber(value)//This function is used to check the whole numbers
{
    var anum=/(^\d+$)/
    if(anum.test(value))
        return true;
    else
        return false;
}
function checkDecimalNumber(value)
{
    //          (Whole)|(1 place deci)|(2 place deci)|(3 place deci)           
    var anum = /(^\d+$)|(^\d+\.\d{1}$)|(^\d+\.\d{2}$)|(^\d+\.\d{3}$)/ 
    //| (^\d+\.\d{1}$) | (^\d+\.\d{2}$) | (^\d+\.\d{3}$) /
    if(anum.test(value))
        return true;
    else
        return false;
}
function check1DecimalNumber(value)
{
    var anum=/(^\d+\.\d{1}$)/
	if(anum.test(value))
		return true;
	else
		return false;
}
function check2DecimalNumber(value)
{
    var anum=/(^\d+\.\d{2}$)/
	if(anum.test(value))
		return true;
	else
		return false;
}
function check3DecimalNumber(value)
{
    var anum=/(^\d+\.\d{3}$)/
	if(anum.test(value))
		return true;
	else
		return false;
}
function checkEmail(value) //This function is used to check the valid Email Address
{
    var str=value;
    var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
    if (filter.test(str))
        return true
    else
    {
        return false;
    }
}
function checkDate(input) //This function is used to check the valid date
{
	var validFormat=/(^\d{2}\/\d{2}\/\d{4}$)|(^\d{1}\/\d{2}\/\d{4}$)|(^\d{2}\/\d{1}\/\d{4}$)|(^\d{1}\/\d{1}\/\d{4}$)/ //Basic check for format validity
	if(!validFormat.test(input))
	{
		//alert("Invalid Date Format. Please correct and submit again.")
		return false;
	}
	else
	{
		var monthfield = input.split("/")[0];
		var dayfield = input.split("/")[1];
		var yearfield=input.split("/")[2]
		var dayobj = new Date(yearfield, monthfield-1, dayfield)
		if ((dayobj.getMonth()+1!=monthfield)||(dayobj.getDate()!=dayfield)||(dayobj.getFullYear()!=yearfield))
		{
			//alert("Invalid Day, Month, or Year range detected. Please correct and submit again.")
			return false;
		}	
		else
			return true;
	}
}
function openCalendar(objRef) 
{
  var calendar_window=window.open(objRef,'calendar_window','width=138,height=158,top=490,left=400');
  calendar_window.focus();
}
function endsWith(str, s){
var reg = new RegExp (s + "$");
return reg.test(str);
}