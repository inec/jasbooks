/*
   To Do list: an application to keep track of task;


   Author: Lu,Yen-Chi
   Version:1.0
   Date Created:26.10.2012
   Last Updated:

*/

//	Variable Declartions

// Keep track of the number of items in the list
// This value is incremented when a new item is added,
// add decremented when an item is removied
var xmlhttp=null;
function city_change(x)
{

};

// Add event listeners to button objects
function load(){
/*	// Get object references and add event listeners
	var aboutButton = document.getElementById("aboutButton");
	aboutButton.addEventListener("click", about, false);

	var addButton=document.getElementById("addButton");
	addButton.addEventListener("click",addItem,false);

	var removeButton=document.getElementById("removeButton");
	 removeButton.addEventListener("click", removeItems, false);

    // check for local storage item and add them if nesseary
    if(localStorage.getItem("todoData") && localStorage.getItem("listItemCount")){
    	list.innerHTML=localStorage.getItem("todoData");
    	itemCount - localStorage.getItem("listItemCount");

    	//Check off input element for list item that  were check on the last save
    	var checkedInput = document.getElementsByClassName("selected");
    	//for each selected list item,set the first child node's 
    	//checked property to true
    	for (var i=0;i<checkedInput.length;i++){
    		checkedInput[i].childNodes[0].checkedInput=true;
    	}
    }*/

     xmlhttp=null;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
if (xmlhttp!=null)
  {
  xmlhttp.onreadystatechange=function()
    {
    if (xmlhttp.readyState==4 && xmlhttp.status==200)
      {
      xmlDoc=xmlhttp.responseXML;
      var txt="";

	  var province_dropdown=document.getElementById("provincedd");
	  
	  //province_dropdown.addEventListener('change', province_change, false);
	  province_dropdown.addEventListener('change', function()
	  {
	 
	 var province_selected = this.options[this.selectedIndex].value;

	 	for (i=0;i<x.length;i++)
        {
		
        
		if (x[i].childNodes[0].nodeValue==province_selected){

		var city_name= x[i].getElementsByTagName("name");

		
        
				var city_dropdown=document.getElementById("citydd");
//clear city elements
          city_dropdown.length=1;
          var city_option=document.getElementById("city_option1");
           city_option.innerHTML="- Select a city -";
     
						 	for (var j=0;j<city_name.length;j++)
			{
			var city_option_element = document.createElement("option");
			var cname=city_name[j].childNodes[0].nodeValue;
		    city_option_element.innerHTML=cname;
		  //  
			city_dropdown.appendChild(city_option_element);
		

		
		} //end of inner for
		      var first_city=x[i].getElementsByTagName("city")[0];


           //    console.dirxml(first_city);
	 	var city_div=document.getElementById("cityWeather");
                     

                         //clear from previous selction

						city_div.innerHTML="";
 
                      for (var j=0;j<first_city.childNodes.length;j++)

                      {
                      	if (first_city.childNodes[j].nodeValue == null)
                      	{

                      		var p_element = document.createElement("p");

                      		var b_element = document.createElement("b");
                      		b_element.innerHTML=first_city.childNodes[j].tagName+": ";



							p_element.appendChild(b_element);

							p_element.innerHTML+=first_city.childNodes[j].firstChild.nodeValue;


			 		 	    city_div.appendChild(p_element);

                       } // end of if

                      } // end of for loop to get indivisual data

		
		
		} //end if find province
		
		}; //end of for loop
	 
		
	city_dropdown.addEventListener('change', function() {

if (this.selectedIndex != 0) {	
	  var city_dropdown=document.getElementById("citydd");
	 var city_selected = city_dropdown.options[city_dropdown.selectedIndex].innerHTML;

var city_nodes=xmlDoc.getElementsByTagName("name");
	for (var i=0;i<city_nodes.length;i++)
			 	{

	 		if(city_nodes[i].childNodes[0].nodeValue==city_selected)
			 		{

			 			var city_data=city_nodes[i].parentNode;
			 			//console.dirxml(city_data);
                         
                         var city_div=document.getElementById("cityWeather");

                       
                       //clear

                       city_div.innerHTML="";

                      for (var j=0;j<city_data.childNodes.length;j++)

                      {
                      	if (city_data.childNodes[j].nodeValue == null)
                      	{

                      		var p_element = document.createElement("p");

                      		var b_element = document.createElement("b");
                      		b_element.innerHTML=city_data.childNodes[j].tagName+": ";



							p_element.appendChild(b_element);

							p_element.innerHTML+=city_data.childNodes[j].firstChild.nodeValue;


			 		 	    city_div.appendChild(p_element);

                       } // end of if

                      } // end of for loop to get indivisual data


			 			
			 	


			 		};// end if*/


			 	};
}



}, false);
		} // end of anonymous function
		, false);
		
		
		
		
		
     var x=xmlDoc.getElementsByTagName("province");
	  
      for (i=0;i<x.length;i++)
        {
		

		var option_element = document.createElement("option");
		var pname=x[i].childNodes[0].nodeValue;
		option_element.setAttribute("value", pname);
		option_element.innerHTML=pname;
		province_dropdown.appendChild(option_element);
        }

        }
      }
  xmlhttp.open("GET","weathernew.xml",true);
  xmlhttp.send();
  
  
 

  
  
  }
else
  {
  alert("Your browser does not support XMLHTTP.");
  }
}
document.addEventListener("DOMContentLoaded", load,false)
