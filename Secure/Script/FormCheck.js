/*
Copyright   : Amir Kochak.
Date        : 22/DEC/2008

USAGE :

1. formobj          = Id of the form;
2. fieldRequired    = Array consisting of Ids of the control to be validated.
3. fieldDescription = Array consisting of the error descriptions which will be displayed.
4. fieldType        = Array consisting of types of the respective control.

Types
1. Text             -- Validation of text fields        e.g FirstName ,..
2. Date             -- Validation of date fields        e.g DOB ,..
3. Contact          -- Validation of contact fields     e.g TelephoneNo and MobileNo
4. Email            -- Validation of email fields       e.g Email ,..
5. WholeNumber      -- Validation of number fields      e.g Salary ,..
6. Decimal          -- Validation of number fields      e.g Salary upto 3 decimal places ,..
7. 2 Place Number   -- Validation of number fields      e.g Amount 2 decimal places ,..
8. 3 Place Number   -- Validation of number fields      e.g Price 3 decimal places,..
9. SelectOne        -- Validation of drop down lists    e.g Sex ,..


More and more general types can be added
*/

function formCheck(formobj,fieldRequired,fieldDescription,fieldType)
{
	// dialog message 
	var alertMsg = "Please complete the following fields:\n";
	var l_Msg = alertMsg.length;
	
	var j = 1;
	for (var i = 0; i < fieldRequired.length; i++)
	{
		var obj = formobj.elements[fieldRequired[i]];
		if (obj)
		{
	        switch(fieldType[i])
	        {
	            case "Text": //Mandatory
	                if(obj.value == "" || obj.value == null)
	                {
	                    alertMsg += j + " - " + fieldDescription[i] + "\n";
	                    j++;
	                }
	                break;
                case "Date": //Mandatory
                    if(obj.value == "" || obj.value == null)
	                {
	                    alertMsg += j + " - " + fieldDescription[i] + "\n";
	                    j++;
	                }
	                else
	                {
	                    if(checkDate(obj.value)==false)
	                    {
	                       obj.value = "";
	                       alertMsg += j + " - Invalid " + fieldDescription[i] + " \n";
	                       j++;
	                    }
	                }
	                break;
                case "Contact" : //Optional
                	if(obj.value != "")
	                {
	                    if(checkWholeNumber(obj.value)==false)
	                    {
	                       alertMsg += j + " - Invalid " + fieldDescription[i] + " \n";
	                       j++;
	                    }
	                }
	                break;
                case "Email" : //Optional
                    if(obj.value != "") 
	                {
	                    if(checkEmail(obj.value)==false)
	                    {
	                       alertMsg += j + " - Invalid email\n";
	                       j++;
	                    }
	                }
	                break;
	             case "WholeNumber" : //Mandatory
                	if(obj.value == "" || obj.value == null)
	                {
	                    alertMsg += j + " - " + fieldDescription[i] + "\n";
	                    j++;
	                }
                	else
                	{
	                    if(checkWholeNumber(obj.value)==false)
	                    {
	                       obj.value = "";
	                       alertMsg += j + " - Invalid " + fieldDescription[i] + "\n";
	                       j++;
	                    }
	                }
	                break;
	             case "Decimal" : //Mandatory
                	if(obj.value == "" || obj.value == null)
	                {
	                    alertMsg += j + " - " + fieldDescription[i] + "\n";
	                    j++;
	                }
                	else
                	{
	                    if(checkDecimalNumber(obj.value)==false)
	                    {
	                       obj.value = "";
	                       alertMsg += j + " - Invalid " + fieldDescription[i] + ". Only upto to 3 deciaml places are allowed\n";
	                       j++;
	                    }
	                }
	                break;   
	             case "2PlaceNumber" : //Mandatory
	                if(obj.value == "" || obj.value == null)
	                {
	                    alertMsg += j + " - " + fieldDescription[i] + "\n";
	                    j++;
	                }
                	else
                	{
	                    if(checkWholeNumber(obj.value) == true)
	                    { }  
	                    else
	                    {
                            if(check2DecimalNumber(obj.value) == false)
                            {
                               obj.value = "";
                               alertMsg += j + " - Invalid " + fieldDescription[i] + ". Only 2 deciaml places are allowed\n";
                               j++;
                            }
	                    }
	                }
	                break;
	            case "3PlaceNumber" : //Mandatory
	                if(obj.value == "" || obj.value == null)
	                {
	                    alertMsg += j + " - " + fieldDescription[i] + "\n";
	                    j++;
	                }
                	else
                	{
	                    if(checkWholeNumber(obj.value) == true)
	                    { }
	                    else
	                    {
	                        if(check3DecimalNumber(obj.value)==false)
	                        {
	                           obj.value = "";
	                           alertMsg += j + " - Invalid " + fieldDescription[i] + ". Only 3 deciaml places are allowed\n";
	                           j++;
	                        }
	                    }
	                }
	                break;
	             case "SelectOne" : //Mandatory
                    {
                        if(obj.value == "-1")
                        {
                            alertMsg += j + " - " + fieldDescription[i] + "\n";
	                        j++;
                        }
                    }         		                		                			                
	             default:   
	        } //End of Switch
		}//End of if
	}//End of for loop
	if (alertMsg.length == l_Msg)
	{
		return true;
	}
	else
	{
		alert(alertMsg);
		for (var i = 0; i < fieldRequired.length; i++)
	    {
	        var obj = formobj.elements[fieldRequired[i]];
            if (fieldType[i] == "Text" || fieldType[i] == "Date")
            {
                if (obj.value == "")
                {
                    obj.focus();
                    break;
                }    
            }
            else if ( fieldType[i] == "Contact")
            {
                if (obj.value != "")
                {
                    if(checkWholeNumber(obj.value) == false)
                    {
                        obj.focus();
                        break;
                    }    
                }
            }
            else if (fieldType[i] == "WholeNumber" || fieldType[i] == "Decimal" || fieldType[i] == "2PlaceNumber" || fieldType[i] == "3PlaceNumber" )
            {
                if(obj.value == "")
                {
                    obj.focus();
                    break;
                 }   
            }
            else if (fieldType[i] == "Email")
            {
                if (obj.value != "")
                {
                    if(checkEmail(obj.value) == false)
                    {
                        obj.focus();
                        break;
                    }    
                }
            }
            else if (fieldType[i] == "SelectOne")
            {
                if (obj.value == "-1")
                {
                    obj.focus();
                    break;
                }
            }
            else
            {
                
            }
	    }
		return false;
	}
}
//-----------------------------------------End of formcheck function-------------------------------------------------
/*
Copyright   : Amir Kochak.
Date        : 23/DEC/2008

USAGE :

1. formobj                          = Id of the form;
2. fieldRequiredOnFocusOut          = Array consisting of Ids of the control to be validated.
3. fieldDescriptionOnFocusOut       = Array consisting of the error descriptions which will be displayed.
4. fieldTypeOnFocusOut              = Array consisting of types of the respective control.
5. fieldRequiredOnFocusOutLength    = 
Types
1. WholeNumber      -- Validation of number fields      e.g Salary ,..
2. Decimal          -- Validation of number fields      e.g Salary upto 3 decimal places ,..
3. 2 Place Number   -- Validation of number fields      e.g Amount 2 decimal places ,..
4. 3 Place Number   -- Validation of number fields      e.g Price 3 decimal places,..

More and more general types can be added
*/

function formCheckOnFocusOut(formobj,fieldRequiredOnFocusOut,fieldDescriptionOnFocusOut,fieldTypeOnFocusOut,fieldRequiredOnFocusOutLength)
{
    var alertMsg = "Please complete the following fields:\n";
	var l_Msg = alertMsg.length;
	
	var j = 1;
	if(fieldRequiredOnFocusOutLength == 1)
	{
	    var obj = formobj.elements[fieldRequiredOnFocusOut[0]];
	    if(obj.value == "")
	    {
	        obj.focus();
	    }
	    else
	    {
	        for (var i = 1; i < fieldRequiredOnFocusOut.length; i++)
	        {
		        var obj = formobj.elements[fieldRequiredOnFocusOut[i]];
		        if (obj)
		        {
		            switch(fieldTypeOnFocusOut[i])
	                {
	                    case "WholeNumber" : //Mandatory
                	        if(obj.value == "" || obj.value == null)
	                        {
	                            alertMsg += j + " - " + fieldDescription[i] + "\n";
	                            j++;
	                        }
                	        else
                	        {
	                            if(checkWholeNumber(obj.value)==false)
	                            {
	                               obj.value = "";
	                               alertMsg += j + " - Invalid " + fieldDescription[i] + "\n";
	                               j++;
	                            }
	                        }
	                        break;
	                    case "2PlaceNumber" : //Mandatory
	                        if(obj.value == "" || obj.value == null)
	                        {
	                            alertMsg += j + " - " + fieldDescriptionOnFocusOut[i] + "\n";
	                            j++;
	                        }
                	        else
                	        {
	                            if(checkWholeNumber(obj.value) == true)
	                            {
	                                var objValue = parseFloat(obj.value);
	                                obj.value = objValue.toFixed(2);
	                            }
	                            else
	                            {
                                    if(check1DecimalNumber(obj.value) == true)
                                    {
                                        var objValue = parseFloat(obj.value);
                                        obj.value = objValue.toFixed(2);
                                    }
                                    else
                                    {
                                       if(check2DecimalNumber(obj.value) == false)
                                       {
                                            obj.value = "";
                                            alertMsg += j + " - Invalid " + fieldDescriptionOnFocusOut[i] + ". Only 2 deciaml places are allowed\n";
                                            j++;
                                       }
                                    }
	                            }
	                        }
	                        break;
	                    case "3PlaceNumber" : //Mandatory
	                        if(obj.value == "" || obj.value == null)
	                        {
	                            alertMsg += j + " - " + fieldDescriptionOnFocusOut[i] + "\n";
	                            j++;
	                        }
                	        else
                	        {
	                            if(checkWholeNumber(obj.value) == true)
	                            {
	                                var objValue = parseFloat(obj.value);
	                                obj.value = objValue.toFixed(3);
	                            }
	                            else
	                            {
                                    if(check1DecimalNumber(obj.value) == true)
                                    {
                                        var objValue = parseFloat(obj.value);
                                        obj.value = objValue.toFixed(3);
                                    }
                                    else
                                    {
                                       if(check2DecimalNumber(obj.value) == true)
                                       {
                                            var objValue = parseFloat(obj.value);
                                            obj.value = objValue.toFixed(3); 
                                       }
                                       else
                                       {
                                            if(check3DecimalNumber(obj.value) == false)
                                            {
                                                obj.value = "";
                                                alertMsg += j + " - Invalid " + fieldDescriptionOnFocusOut[i] + ". 3 decimal place required\n";
                                                j++;
                                            }    
                                       }
                                    }
	                            }
	                        }
	                        break;    
                        default:	            
	                }
		        }
	        }
	        if (alertMsg.length == l_Msg)
	        {
		        return true;
	        }
	        else
	        {
		        alert(alertMsg);
		        for (var i = 0; i < fieldRequiredOnFocusOut.length; i++)
	            {
	                var obj = formobj.elements[fieldRequiredOnFocusOut[i]];
                    if (fieldTypeOnFocusOut[i] == "WholeNumber" || fieldTypeOnFocusOut[i] == "Decimal" || fieldTypeOnFocusOut[i] == "2PlaceNumber" || fieldTypeOnFocusOut[i] == "3PlaceNumber" )
                    {
                        if(obj.value == "")
                        {
                            obj.focus();
                            break;
                         }   
                    }
                    else
                    {
                        
                    }
	            }
		        return false;
	        }	
	    }    
	}
	else
	{
	    for (var i = 0; i < fieldRequiredOnFocusOut.length; i++)
	    {
		    var obj = formobj.elements[fieldRequiredOnFocusOut[i]];
		    if (obj)
		    {
		        switch(fieldTypeOnFocusOut[i])
	            {
	                case "WholeNumber" : //Mandatory
                	    if(obj.value == "" || obj.value == null)
	                    {
	                        alertMsg += j + " - " + fieldDescription[i] + "\n";
	                        j++;
	                    }
                	    else
                	    {
	                        if(checkWholeNumber(obj.value)==false)
	                        {
	                           obj.value = "";
	                           alertMsg += j + " - Invalid " + fieldDescription[i] + "\n";
	                           j++;
	                        }
	                    }
	                    break;
	                case "2PlaceNumber" : //Mandatory
	                    if(obj.value == "" || obj.value == null)
	                    {
	                        alertMsg += j + " - " + fieldDescriptionOnFocusOut[i] + "\n";
	                        j++;
	                    }
                	    else
                	    {
	                        if(checkWholeNumber(obj.value) == true)
	                        {
	                            var objValue = parseFloat(obj.value);
	                            obj.value = objValue.toFixed(2);
	                        }
	                        else
	                        {
                                if(check1DecimalNumber(obj.value) == true)
                                {
                                    var objValue = parseFloat(obj.value);
                                    obj.value = objValue.toFixed(2);
                                }
                                else
                                {
                                   if(check2DecimalNumber(obj.value) == false)
                                   {
                                        obj.value = "";
                                        alertMsg += j + " - Invalid " + fieldDescriptionOnFocusOut[i] + ". Only 2 deciaml places are allowed\n";
                                        j++;
                                   }
                                }
	                        }
	                    }
	                    break;
	                case "3PlaceNumber" : //Mandatory
	                    if(obj.value == "" || obj.value == null)
	                    {
	                        alertMsg += j + " - " + fieldDescriptionOnFocusOut[i] + "\n";
	                        j++;
	                    }
                	    else
                	    {
	                        if(checkWholeNumber(obj.value) == true)
	                        {
	                            var objValue = parseFloat(obj.value);
	                            obj.value = objValue.toFixed(3);
	                        }
	                        else
	                        {
                                if(check1DecimalNumber(obj.value) == true)
                                {
                                    var objValue = parseFloat(obj.value);
                                    obj.value = objValue.toFixed(3);
                                }
                                else
                                {
                                   if(check2DecimalNumber(obj.value) == true)
                                   {
                                        var objValue = parseFloat(obj.value);
                                        obj.value = objValue.toFixed(3); 
                                   }
                                   else
                                   {
                                        if(check3DecimalNumber(obj.value) == false)
                                        {
                                            obj.value = "";
                                            alertMsg += j + " - Invalid " + fieldDescriptionOnFocusOut[i] + ". 3 decimal place required\n";
                                            j++;
                                        }    
                                   }
                                }
	                        }
	                    }
	                    break;    
                    default:	            
	            }
		    }
	    }
	    if (alertMsg.length == l_Msg)
	    {
		    return true;
	    }
	    else
	    {
		    alert(alertMsg);
		    for (var i = 0; i < fieldRequiredOnFocusOut.length; i++)
	        {
	            var obj = formobj.elements[fieldRequiredOnFocusOut[i]];
                if (fieldTypeOnFocusOut[i] == "WholeNumber" || fieldTypeOnFocusOut[i] == "Decimal" || fieldTypeOnFocusOut[i] == "2PlaceNumber" || fieldTypeOnFocusOut[i] == "3PlaceNumber" )
                {
                    if(obj.value == "")
                    {
                        obj.focus();
                        break;
                     }   
                }
                else
                {
                    
                }
	        }
		    return false;
	    }	
	
	}//end of main else
}
//----------------------------------End Of formCheckOnFocusOut-------------------------------------------------------

/*
Copyright   : Amir Kochak.
Date        : 23/DEC/2008

USAGE :

1. formobj                          = Id of the form;
2. fieldRequiredOnFocusOut          = Array consisting of Ids of the control to be validated.
3. fieldDescriptionOnFocusOut       = Array consisting of the error descriptions which will be displayed.
4. fieldTypeOnFocusOut              = Array consisting of types of the respective control.
5. fieldRequiredOnFocusOutLength    = 0 or 1 [0 if there is only one Id. 1 if there are two ids]
6. fieldOperatorsOnFoucsOut         = Array consisting of Ids, Operator, Type

Types
1. WholeNumber      -- Validation of number fields      e.g Salary ,..
2. Decimal          -- Validation of number fields      e.g Salary upto 3 decimal places ,..
3. 2 Place Number   -- Validation of number fields      e.g Amount 2 decimal places ,..
4. 3 Place Number   -- Validation of number fields      e.g Price 3 decimal places,..

More and more general types can be added
*/

function formCheckOnFocusOutArthimetic(formobj,fieldRequiredOnFocusOut,fieldDescriptionOnFocusOut,fieldTypeOnFocusOut,fieldRequiredOnFocusOutLength,fieldOperatorsOnFoucsOut)
{
    var alertMsg = "Please complete the following fields:\n";
	var l_Msg = alertMsg.length;
	
	var j = 1;
	if(fieldRequiredOnFocusOutLength == 1)
	{
	    var obj = formobj.elements[fieldRequiredOnFocusOut[0]];
	    if(obj.value == "")
	    {
	        obj.focus();
	    }
	    else
	    {
	        for (var i = 1; i < fieldRequiredOnFocusOut.length; i++)
	        {
		        var obj = formobj.elements[fieldRequiredOnFocusOut[i]];
		        if (obj)
		        {
		            switch(fieldTypeOnFocusOut[i])
	                {
	                    case "WholeNumber" : //Mandatory
                	        if(obj.value == "" || obj.value == null)
	                        {
	                            alertMsg += j + " - " + fieldDescription[i] + "\n";
	                            j++;
	                        }
                	        else
                	        {
	                            if(checkWholeNumber(obj.value)==false)
	                            {
	                               obj.value = "";
	                               alertMsg += j + " - Invalid " + fieldDescription[i] + "\n";
	                               j++;
	                            }
	                        }
	                        break;
	                    case "2PlaceNumber" : //Mandatory
	                        if(obj.value == "" || obj.value == null)
	                        {
	                            alertMsg += j + " - " + fieldDescriptionOnFocusOut[i] + "\n";
	                            j++;
	                        }
                	        else
                	        {
	                            if(checkWholeNumber(obj.value) == true)
	                            {
	                                var objValue = parseFloat(obj.value);
	                                obj.value = objValue.toFixed(2);
	                            }
	                            else
	                            {
                                    if(check1DecimalNumber(obj.value) == true)
                                    {
                                        var objValue = parseFloat(obj.value);
                                        obj.value = objValue.toFixed(2);
                                    }
                                    else
                                    {
                                       if(check2DecimalNumber(obj.value) == false)
                                       {
                                            obj.value = "";
                                            alertMsg += j + " - Invalid " + fieldDescriptionOnFocusOut[i] + ". Only 2 deciaml places are allowed\n";
                                            j++;
                                       }
                                    }
	                            }
	                        }
	                        break;
	                    case "3PlaceNumber" : //Mandatory
	                        if(obj.value == "" || obj.value == null)
	                        {
	                            alertMsg += j + " - " + fieldDescriptionOnFocusOut[i] + "\n";
	                            j++;
	                        }
                	        else
                	        {
	                            if(checkWholeNumber(obj.value) == true)
	                            {
	                                var objValue = parseFloat(obj.value);
	                                obj.value = objValue.toFixed(3);
	                            }
	                            else
	                            {
                                    if(check1DecimalNumber(obj.value) == true)
                                    {
                                        var objValue = parseFloat(obj.value);
                                        obj.value = objValue.toFixed(3);
                                    }
                                    else
                                    {
                                       if(check2DecimalNumber(obj.value) == true)
                                       {
                                            var objValue = parseFloat(obj.value);
                                            obj.value = objValue.toFixed(3); 
                                       }
                                       else
                                       {
                                            if(check3DecimalNumber(obj.value) == false)
                                            {
                                                obj.value = "";
                                                alertMsg += j + " - Invalid " + fieldDescriptionOnFocusOut[i] + ". 3 decimal place required\n";
                                                j++;
                                            }    
                                       }
                                    }
	                            }
	                        }
	                        break;    
                        default:	            
	                }
		        }
	        }
	        if (alertMsg.length == l_Msg)
	        {
	            var obj1    = formobj.elements[fieldOperatorsOnFoucsOut[0]];
	            var op      = fieldOperatorsOnFoucsOut[1];
	            var obj2    = formobj.elements[fieldOperatorsOnFoucsOut[2]];
	            var obj3    = formobj.elements[fieldOperatorsOnFoucsOut[3]];
	            var type    = fieldOperatorsOnFoucsOut[4];
	            
	            var objValue;
	            switch(op)
	            {
	                case "+" :
	                    objValue = parseFloat(obj1.value) + parseFloat(obj2.value);
	                    break;
	                case "-" :
	                    objValue = parseFloat(obj1.value) - parseFloat(obj2.value);    
	                    break;
	                case "*" :
	                    objValue = parseFloat(obj1.value) * parseFloat(obj2.value); 
	                    break;   
	                case "/" :
	                    objValue = parseFloat(obj1.value) / parseFloat(obj2.value);    
	                    break;
	            }
	            
	            switch(type)
	            {
	                case "2PlaceDecimal" :
	                    obj3.value = objValue.toFixed(2);
	                    break;
	                case "3PlaceDecimal" :
	                    obj3.value = objValue.toFixed(3);
	                    break;    
	            
	            }
		        return true;
	        }
	        else
	        {
		        alert(alertMsg);
		        for (var i = 0; i < fieldRequiredOnFocusOut.length; i++)
	            {
	                var obj = formobj.elements[fieldRequiredOnFocusOut[i]];
                    if (fieldTypeOnFocusOut[i] == "WholeNumber" || fieldTypeOnFocusOut[i] == "Decimal" || fieldTypeOnFocusOut[i] == "2PlaceNumber" || fieldTypeOnFocusOut[i] == "3PlaceNumber" )
                    {
                        if(obj.value == "")
                        {
                            obj.focus();
                            break;
                         }   
                    }
                    else
                    {
                        
                    }
	            }
		        return false;
	        }	
	    }    
	}
	else
	{
	    for (var i = 0; i < fieldRequiredOnFocusOut.length; i++)
	    {
		    var obj = formobj.elements[fieldRequiredOnFocusOut[i]];
		    if (obj)
		    {
		        switch(fieldTypeOnFocusOut[i])
	            {
	                case "WholeNumber" : //Mandatory
                	    if(obj.value == "" || obj.value == null)
	                    {
	                        alertMsg += j + " - " + fieldDescription[i] + "\n";
	                        j++;
	                    }
                	    else
                	    {
	                        if(checkWholeNumber(obj.value)==false)
	                        {
	                           obj.value = "";
	                           alertMsg += j + " - Invalid " + fieldDescription[i] + "\n";
	                           j++;
	                        }
	                    }
	                    break;
	                case "2PlaceNumber" : //Mandatory
	                    if(obj.value == "" || obj.value == null)
	                    {
	                        alertMsg += j + " - " + fieldDescriptionOnFocusOut[i] + "\n";
	                        j++;
	                    }
                	    else
                	    {
	                        if(checkWholeNumber(obj.value) == true)
	                        {
	                            var objValue = parseFloat(obj.value);
	                            obj.value = objValue.toFixed(2);
	                        }
	                        else
	                        {
                                if(check1DecimalNumber(obj.value) == true)
                                {
                                    var objValue = parseFloat(obj.value);
                                    obj.value = objValue.toFixed(2);
                                }
                                else
                                {
                                   if(check2DecimalNumber(obj.value) == false)
                                   {
                                        obj.value = "";
                                        alertMsg += j + " - Invalid " + fieldDescriptionOnFocusOut[i] + ". Only 2 deciaml places are allowed\n";
                                        j++;
                                   }
                                }
	                        }
	                    }
	                    break;
	                case "3PlaceNumber" : //Mandatory
	                    if(obj.value == "" || obj.value == null)
	                    {
	                        alertMsg += j + " - " + fieldDescriptionOnFocusOut[i] + "\n";
	                        j++;
	                    }
                	    else
                	    {
	                        if(checkWholeNumber(obj.value) == true)
	                        {
	                            var objValue = parseFloat(obj.value);
	                            obj.value = objValue.toFixed(3);
	                        }
	                        else
	                        {
                                if(check1DecimalNumber(obj.value) == true)
                                {
                                    var objValue = parseFloat(obj.value);
                                    obj.value = objValue.toFixed(3);
                                }
                                else
                                {
                                   if(check2DecimalNumber(obj.value) == true)
                                   {
                                        var objValue = parseFloat(obj.value);
                                        obj.value = objValue.toFixed(3); 
                                   }
                                   else
                                   {
                                        if(check3DecimalNumber(obj.value) == false)
                                        {
                                            obj.value = "";
                                            alertMsg += j + " - Invalid " + fieldDescriptionOnFocusOut[i] + ". 3 decimal place required\n";
                                            j++;
                                        }    
                                   }
                                }
	                        }
	                    }
	                    break;    
                    default:	            
	            }
		    }
	    }
	    if (alertMsg.length == l_Msg)
	    {
		    return true;
	    }
	    else
	    {
		    alert(alertMsg);
		    for (var i = 0; i < fieldRequiredOnFocusOut.length; i++)
	        {
	            var obj = formobj.elements[fieldRequiredOnFocusOut[i]];
                if (fieldTypeOnFocusOut[i] == "WholeNumber" || fieldTypeOnFocusOut[i] == "Decimal" || fieldTypeOnFocusOut[i] == "2PlaceNumber" || fieldTypeOnFocusOut[i] == "3PlaceNumber" )
                {
                    if(obj.value == "")
                    {
                        obj.focus();
                        break;
                     }   
                }
                else
                {
                    
                }
	        }
		    return false;
	    }	
	
	}//end of main else
}
//--------------------------------------End of formCheckOnFocusOutArthimetic------------------------------------------



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