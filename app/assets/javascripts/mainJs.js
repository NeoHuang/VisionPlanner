
function filterPatient(text)
{
  /*if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  }
  else
  {// code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function()
  {
    if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
  $(".patient-card").remove();
      $("#patientList").html(xmlhttp.responseText);
    }
  }
  xmlhttp.open("GET","/search/patient/" + text,true);
  xmlhttp.send();*/
  $(".patient-card").each(function(index){
    var name = $(".patient-name", this).text();
    if (text.length == 0)
  {
    $(this).show();
  }
    else
  {

    if (name.toUpperCase().indexOf(text.toUpperCase()) >= 0)
  {
    $(this).show();
  }
    else
  {
    $(this).hide();
  }
  }

  });


}
