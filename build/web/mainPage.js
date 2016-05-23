
            $(document).ready(function(){
               $("#btn1").click(function(){
                    
                    windowshow();
                });
                
                $("#btn2").click(function(){
                    createFolder();
                });
               
            });
            function windowshow()
            {
                $("#window").fadeIn();
                $("#window").css({"visibility":"visible","display":"block"});
               
            }
            
            function createFolder()
            {
                $("#folder").fadeIn();
                $("#folder").css({"visibility":"visible","display":"block"});
            }
            
       
            function loadContactRecordByName()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                var fName = document.getElementById('fName').value.trim();
                xmlhttp.open("POST","SearchList.jsp?fName="+fName,true);
                xmlhttp.send();
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState===4 && xmlhttp.status===200)
                    {
                        document.getElementById("ContactView").innerHTML = xmlhttp.responseText;
                    }
                };
            }

            var people, asc1 = 1,
            asc2 = 1,
            asc3 = 1;
            window.onload = function () {
            people = document.getElementById("people");
            }

            function sort_table(tbody, col, asc) {
                var rows = tbody.rows,
                rlen = rows.length,
                arr = new Array(),
                i, j, cells, clen;
    // fill the array with values from the table
                for (i = 0; i < rlen; i++) {
                cells = rows[i].cells;
                clen = cells.length;
                arr[i] = new Array();
                for (j = 0; j < clen; j++) {
                arr[i][j] = cells[j].innerHTML;
                }
            }
    // sort the array by the specified column number (col) and order (asc)
            arr.sort(function (a, b) {
            return (a[col] == b[col]) ? 0 : ((a[col] > b[col]) ? asc : -1 * asc);
            });
    // replace existing rows with new rows created from the sorted array
            for (i = 0; i < rlen; i++) {
            rows[i].innerHTML = "<td>" + arr[i].join("</td><td>") + "</td>";
            }
        }
//    jQuery("#folder").click(function(){ return false; });
//jQuery(document).("click", function() { jQuery("#folder").fadeOut(); });

function sendDeleteRequest(selectedCheckboxIds){
               
                $.ajax({
                    url: 'Ajax_servlet',
                    type: 'POST',
                    data: {id: selectedCheckboxIds}
                })
                .done(function(data) {
                    $("#view").html("Selected IDs:" + data.toString());
//                    alert("IDs:" + data.toString());
//                   
                     window.location.reload();
                })
                .fail(function() {
                    console.log("error");
                });
            }


 document.getElementById("delete-list").addEventListener("click", function(){
                // select only checked inputs
                $("#view").html(" Waiting for result..");
                 
                var checkboxElems = document.querySelectorAll("input.delete-checkbox:checked");

                // selected ID array
                var selectedCheckboxIds = [];

                if(checkboxElems.length === 0){
                    document.getElementById("view").innerHTML ="No checkbox selected";
                    return false;
                }
                // pushing the selected IDs into selectedCheckboxIds array
                for (i = 0; i < checkboxElems.length; i++) {
                    var item = checkboxElems[i];
                    selectedCheckboxIds.push(item.value);
                }

                // sending the data to servlet
                // local server need to run for sending the data to servlet
                sendDeleteRequest(selectedCheckboxIds);
            });     
            
     function sendRequest(selectedCheckboxIds){
               
                $.ajax({
                    url: 'MultiImportant',
                    type: 'POST',
                    data: {id: selectedCheckboxIds}
                })
                .done(function(data) {
                    $("#view").html("Selected IDs:" + data.toString());
//                    alert("IDs:" + data.toString());
//                   
                     window.location.reload();
                      
                })
                .fail(function() {
                    console.log("error");
                });
            }


 document.getElementById("starred").addEventListener("click", function(){
                // select only checked inputs
                $("#view").html("Move to Important files.. Waiting for result..");
                 
                var checkboxElems = document.querySelectorAll("input.delete-checkbox:checked");

                // selected ID array
                var selectedCheckboxIds = [];

                if(checkboxElems.length === 0){
                    document.getElementById("view").innerHTML ="No checkbox selected";
                    return false;
                }
                // pushing the selected IDs into selectedCheckboxIds array
                for (i = 0; i < checkboxElems.length; i++) {
                    var item = checkboxElems[i];
                    selectedCheckboxIds.push(item.value);
//                    pic();
                }
               
                // sending the data to servlet
                // local server need to run for sending the data to servlet
                sendRequest(selectedCheckboxIds);
            });       

//                    drop down menu
function dropbutton() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
