/* The variable http will hold our new XMLHttpRequest object. */
var http = createRequestObject(); 
// thisPage keeps track of which page ssonline.php is currently showing.
var thisPage = 1;
// VarPriceClass is the price of a classified ad per 5 words
var VarPriceClass = 1.40;
// minPriceClass is the minimum charge for a classified ad
var minPriceClass = 2.80;
// VarPriceDisp is the price per square inch for a display ad.
var VarPriceDisp = 2.20;
// reqPriceDisp is the price per square inch for a display ad on a requested page
var reqPriceDisp=2.56;


// The function ChangeValues is called by toCheckOut.php upon clicking the "Check Out" button.
// It inserts the values into the "ssl_merchant_id" and "ssl_pin"
// These values are necessary to interact with Viaklix.
// ChangeValues returns true, indicating that upon pushing the button, the next page loads.
// These values can be changed on Viaklix. Information on how to do this is located in Maria's
// Stuff folder in the hard drive (backed up on My Book).
function changeValues()
{
	alert("You are about to enter the Viaklix secure site. This site processes credit card transactions for the Swap Sheet through a secure connection.");
	document.getElementById("ssl_merchant_id").value = "413704";
	document.getElementById("ssl_pin").value = "1W2CHJ";
	
	return true;
}

// The function calculateClassified is called by prices.php on clicking the "Calculate" button.
// It tells you how much a classified ad will cost based on the number of words being typed.
// It returns "false," meaning that when you push the "calculate" button, the page does not 
// reload.

function calculateClassified(){
	// The number of words that will be in the ad.
	var wordsClass = document.getElementById("Words").value;
	// The price, which will be calculated throughout the process.
	// Math.ceil tells you the upper limit of the number of words divided by 5.
	// This is then multiplied by the current price per 5 words.
	var priceClass = (Math.ceil(wordsClass/5))*VarPriceClass;
	
	// This function should eliminate any remainder after 2 decimal places.
	priceClass=Math.round(priceClass*100)/100
	
	// If the ad is bolded, automatically add $2 into it.
	if (document.getElementById("boldClass").checked) {
		priceClass = priceClass + 2;
	}
	
	// because any ad 10 words or less is the same price, we need to include this option.
 	if (wordsClass < 11) 
	{
  		if (document.getElementById("boldClass").checked){
			document.getElementById("resultClass").innerHTML = 2+(minPriceClass)/1;
		}
		else
		{
			document.getElementById("resultClass").innerHTML = minPriceClass;
		}
	}
  	else 
	// otherwise, the price entered into "resultClass" is the number of words * the price 
	//per 5 words
		document.getElementById("resultClass").innerHTML = "$" + priceClass;
  return false;
}

// priceDisplay is called on the placeDisplay.php page upon hitting either the "calculate" or
// the "Submit for review" button.
// It calculates the price of the display ad based solely on the dimensions provided.
// It returns "false," indicating that this function will not cause the next page to load,
// but the "hiddenPrice" field will display the price of the ad.
function priceDisplay(){
	var widthDisplay = document.getElementById("widthDisp").value;
	
	var heightDisplay = document.getElementById("heightDisp").value;
	
	var timesRunning = document.getElementById("timesToRun").value * document.getElementById("weeksRun").value;
		priceDisp = widthDisplay*heightDisplay*VarPriceDisp*timesRunning;
		priceDisp=Math.round(priceDisp*100)/100;
		document.getElementById("resultDisp").innerHTML = "$" + priceDisp;
		// the "hiddenPrice" field on the form allows the calculated price to be passed 
		// to the next page.
		document.getElementById("hiddenPrice").value = priceDisp;
  return false;
}

// calculateDisplay is called by the prices.php when you hit the "calculate" button.
// It calculates the price of a display ad, including a display ad placed on a requested page.
// The requested page variable differs it from the previous function.
// It returns "false," meaning that it will not load a new page when submitted, but the value 
// of the "resultDisp" field will change to display the correct price.
function calculateDisplay(){
	
	var widthDisplay = document.getElementById("placeDisp").widthDisp.value;
	var heightDisplay = document.getElementById("placeDisp").heightDisp.value;
	var priceDisp = 0;
	if (document.getElementById("reqPage").checked) 
	{	
		priceDisp = widthDisplay*heightDisplay*reqPriceDisp;
	}
	else
	{
		priceDisp = widthDisplay*heightDisplay*VarPriceDisp;
	}

		priceDisp=Math.round(priceDisp*100)/100;
		document.getElementById("resultDisp").innerHTML = "$" + priceDisp;
  return false;
}

<!-- Original version of the following function was written by:  Shawn Seley -->
<!-- A similiar script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com -->
// priceClassified is called by placeClass.php when you click on the "submit for Review" button.
// It takes the entire string found in the bodyClass field in your form.
// This it splits into single words, and counts the words, then calculates the price of the 
// words.
// It returns "false," meaning a new page will not load from this function alone, but it will
// modify the values of "hiddenPrice" and "calculatePrice."
function priceClassified(){
// the number of characters (letters, numbers, spaces, etc.) in the class. 
var char_count = document.getElementById("bodyClass").value.length;
// the actual string containing the value of the text.
var fullStr = document.getElementById("bodyClass").value;
// the following lines take out certain undesireable items from the string.
// For more detailed information on the symbols before the /gi and /g,
// look up "regular expressions javascript" on Google.
var initial_whitespace_rExp = /\s/gi;
var left_trimmedStr = fullStr.replace(initial_whitespace_rExp, " ");
var non_alphanumerics_rExp = rExp =/^\s/gi;
var cleanedStr = left_trimmedStr.replace(non_alphanumerics_rExp, " ");
// the following cleanedStr.replace eliminates as many double and triple spaces as possible. 
cleanedStr = cleanedStr.replace(/  /g," ");
cleanedStr = cleanedStr.replace(/  /g," ");
cleanedStr = cleanedStr.replace(/  /g," ");
cleanedStr = cleanedStr.replace(/--/g," ");
cleanedStr = cleanedStr.replace(/\//g," ");
var splitString = cleanedStr.split(" ");
var word_count = splitString.length;

// occasionally people will try to be sneaky and get their ad for cheaper by putting no spaces
// between any of their words (instead using periods or commas). The following if statement
// exists to try to catch this practice. If the average length of a word is longer than 
// 7 characters with a 5-word cushion, it charges the client differently.
if ((char_count/7 - word_count) > 5)
{
	cleanedStr = cleanedStr.replace(/,/g," ");
	cleanedStr = cleanedStr.replace(/-/g," ");
	cleanedStr = cleanedStr.replace(/\./g," ");
	cleanedStr = cleanedStr.replace(/  /g," ");
	splitString = cleanedStr.split(" ");
	alert (splitString);
	word_count = splitString.length-1;
	alert(word_count);
}
// The actual method for calculating ad prices.
if (word_count > 0)
{
	var priceClass = (Math.ceil(word_count/5))*VarPriceClass;
	priceClass=Math.round(priceClass*100)/100;
	if (priceClass < minPriceClass)
	{
		priceClass = minPriceClass;
	}

	var timesRun = document.getElementById("timesToRun").value * document.priceClass.weeksRun.value;
	if (document.getElementById("boldClass").checked)
	{
		priceClass = priceClass + 2;
	}
	priceClass = Math.round(priceClass * timesRun*100)/100
}
else
{
	// if the body of the ad is empty, there is an error.
	priceClass = 0;
	alert("Price must be greater than $0 to submit.");
}
document.getElementById("calculatePrice").innerHTML = "$" + (priceClass);
document.getElementById("hiddenPrice").value = priceClass;
  return false;
}

// checkPrice is called by placeClass.php upon hitting the "Submit for Review" button.
// It verifies that there is a value in the "hiddenPrice" field, and that it is greater than 0
function checkPrice(){
	return (document.getElementById("hiddenPrice").value > 0);
}

// the following function was called by placeDisplay.php, but it has never been used.
// Verify that it isn't still being called in placeDisplay.php and then delete it.
function checkFields(){
	
	if (document.getElementByID("hiddenSizes").value > 1000)
	{
		alert("We can not accept more than 1MB of attachments. Please e-mail us what can not be submitted")
		return false;
	}
	else
	{
		return true;
	}
}

/* The following function creates an XMLHttpRequest object... */

function createRequestObject(){
	var request_o; //declare the variable to hold the object.
	var browser = navigator.appName; //find the browser name
	if(browser == "Microsoft Internet Explorer"){
		/* Create the object using MSIE's method */
		request_o = new ActiveXObject("Microsoft.XMLHTTP");
	}else{
		/* Create the object using other browser's method */
		request_o = new XMLHttpRequest();
	}
	return request_o; //return the object
}

/* You can get more specific with version information by using 
	parseInt(navigator.appVersion)
	Which will extract an integer value containing the version 
	of the browser being used.
*/



// getPage is called by ssonline.php to change the page currently displayed
function getPage(pageNum)
{
	thisPage = pageNum;
	http.open('get', 'content_request.php?action=get_page&page=' + pageNum);
	http.onreadystatechange = handleContent;
	http.send(null);
}

// getPrevious gets the page on ssonline.php before the one currently displayed by 
// decrementing thisPage by 1
function getPrevious()
{
	if(thisPage != 1){
		getPage(thisPage-1);
	}
}

// getNext gets the next page on ssonline.php by increasing thisPage by 1.
function getNext(highPage)
{
	if(thisPage != highPage){
		getPage(thisPage+1);
	}
}

function handleContent()
{
	if(http.readyState == 4)
	{
		var response = http.responseText;
		var responseArray = 
		document.getElementById('image').innerHTML = response;
	}
}

function handleMenu()
{
	if(http.readyState == 4)
	{
		var response = http.responseText;
		var responseArray = 
		document.getElementById('pageMenu').innerHTML = response;
	}
}

var sfMenuLoad = function() {
	http.open('get', 'content_request.php?action=get_pageMenu');
	http.onreadystatechange = handleContent;
	http.send(null);
}