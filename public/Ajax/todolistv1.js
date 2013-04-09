/*

Author: Lu,Yen-Chi

*/

//	Variable Declartions

var xmlhttp;

//the xml  province document
var x;
var province_dropdown

var city_dropdown;
var city_option;
var city_div;
var city_nodes;

function loadXML() {
	xmlhttp = null;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	xmlhttp.open("GET", "weathernew.xml", true);
	xmlhttp.send();

};

function writeOutput(city_data) 
{


	city_div = document.getElementById("cityWeather");

	//clear

	city_div.innerHTML = "";

	for (var j = 0; j < city_data.childNodes.length; j++) {
		if (city_data.childNodes[j].nodeValue == null) {

			var p_element = document.createElement("p");

			var b_element = document.createElement("b");
			b_element.innerHTML = city_data.childNodes[j].tagName + ": ";

			p_element.appendChild(b_element);

			p_element.innerHTML += city_data.childNodes[j].firstChild.nodeValue;
            p_element.setAttribute('class',"listitem");

			city_div.appendChild(p_element);

		} // end of if

	} // end of for loop to get indivisual data

};

function cityChange() {

	if (this.selectedIndex != 0) {
		var city_dropdown = document.getElementById("citydd");
		var city_selected = city_dropdown.options[city_dropdown.selectedIndex].innerHTML;

		city_nodes = xmlDoc.getElementsByTagName("name");
		for (var i = 0; i < city_nodes.length; i++) {

			if (city_nodes[i].childNodes[0].nodeValue == city_selected) {

				var city_data = city_nodes[i].parentNode;
				//console.dirxml(city_data);

				//output
				writeOutput(city_data);

			};// end if*/

		};
	}

}

function ProvinceChange() {

	var province_selected = this.options[this.selectedIndex].value;

	for ( i = 0; i < x.length; i++) {

		if (x[i].childNodes[0].nodeValue == province_selected) {

			var city_name = x[i].getElementsByTagName("name");

			city_dropdown = document.getElementById("citydd");
			//clear city elements
			city_dropdown.length = 1;
			city_option = document.getElementById("city_option1")

			city_option.innerHTML = "- Select a city -";

			for (var j = 0; j < city_name.length; j++) {
				var city_option_element = document.createElement("option");
				var cname = city_name[j].childNodes[0].nodeValue;
				city_option_element.innerHTML = cname;
				//
				city_dropdown.appendChild(city_option_element);

			}//end of inner for
			var first_city = x[i].getElementsByTagName("city")[0];

			writeOutput(first_city);

		} //end if find province

	};//end of for loop
    
    //add city dropdown event listener
	city_dropdown.addEventListener('change', cityChange, false);

};


// Add event listeners 
function load() {

	loadXML();

	if (xmlhttp != null) {
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				xmlDoc = xmlhttp.responseXML;
				var txt = "";

				x = xmlDoc.getElementsByTagName("province");

				province_dropdown = document.getElementById("provincedd");

				province_dropdown.addEventListener('change', ProvinceChange, false);




				for ( i = 0; i < x.length; i++) {

					var option_element = document.createElement("option");
					var pname = x[i].childNodes[0].nodeValue;
					option_element.setAttribute("value", pname);
					option_element.innerHTML = pname;
					province_dropdown.appendChild(option_element);
				}

			}
		}
	} else {
		alert("Your browser does not support XMLHTTP.");
	}
}

document.addEventListener("DOMContentLoaded", load, false)
