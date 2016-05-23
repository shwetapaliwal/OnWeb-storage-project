
function sendDeleteRequest(selectedCheckboxIds){

    var http = new XMLHttpRequest();
    // url of the servlet that will handle the delete operation
    var url = "/delete-items";

    http.open("POST", url);
    http.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    http.onreadystatechange = function() {//Call a function when the state changes.
        if(http.readyState == 4 && http.status == 200) {
            alert(http.responseText);
        }
    };

    http.send(JSON.stringify({Ids: selectedCheckboxIds}));

}

document.getElementById("delete-items").addEventListener("click", function(){
    // select only checked inputs
    var checkboxElems = document.querySelectorAll("input.delete-checkbox:checked");

    // selected ID array
    var selectedCheckboxIds = [];

    if(checkboxElems.length === 0){
        document.getElementById("output-ctn").innerHTML ="No checkbox selected";
        return false;
    }
    // pushing the selected IDs into selectedCheckboxIds array
    for (i = 0; i < checkboxElems.length; i++) {
        var item = checkboxElems[i];
        selectedCheckboxIds.push(item.value);
    }

    // displaying the result on screen
    document.getElementById("output-ctn").innerHTML = "Selected IDs: " + selectedCheckboxIds.toString();
    console.log(selectedCheckboxIds); 

    // sending the data to servlet
    // local server need to run for sending the data to servlet
    sendDeleteRequest(selectedCheckboxIds);

});