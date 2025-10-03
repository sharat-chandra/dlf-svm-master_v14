$(function(){
  $("#smilein").click(function(){

   $('#LoadingModal').modal({
     keyboard : false,
     backdrop : "static"
   });

   $('#LoadingModal').modal('show');

 
   // initializing data  
   var mydata = [
    {V1 : document.getElementById("smiles_container_b").value.toString()}
   ];
 
   // calling dlf main function to get result (active/inactive)
   var req = ocpu.rpc("dlf",{mol : mydata}, function(output){
     $.each(output, function(index, value){
       document.getElementById("fingerprintout").value = value.toString();
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

 // calling zscore main function to get result score
   var req = ocpu.rpc("zscore",{mol : mydata}, function(output){
     $.each(output, function(index, value){
       document.getElementById("fingerprintoutScore").value = value.toString();
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // rcdkplot
   var req = ocpu.rpc("rcdkplot",{mol : mydata}, function(output){
     $.each(output, function(index, value){
        $("#structimage").attr("src","../../../../"+value.toString()).load(function(){
   		$('#LoadingModal').modal('hide');
	});
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // smiformula
   var req = ocpu.rpc("smiformula",{mol : mydata}, function(output){
     $.each(output, function(index, value){
	document.getElementById("smiformula").innerHTML = value.toString();
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // bonds
   var req = ocpu.rpc("bonds",{mol : mydata}, function(output){
     $.each(output, function(index, value){
	if (value)
		document.getElementById("bonds").innerHTML = value.toString();
	else
		document.getElementById("bonds").innerHTML = "NULL";
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // algop
   var req = ocpu.rpc("getalogp",{mol : mydata}, function(output){
     $.each(output, function(index, value){
	if (value)
		document.getElementById("algop").innerHTML = value.toString();
	else
		document.getElementById("algop").innerHTML = "NULL";
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // hbondAcceptor
   var req = ocpu.rpc("gethbondAcceptor",{mol : mydata}, function(output){
     $.each(output, function(index, value){
	document.getElementById("hbondAcceptor").innerHTML = value.toString();
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // hbondDonor
   var req = ocpu.rpc("gethbondDonor",{mol : mydata}, function(output){
     $.each(output, function(index, value){
	document.getElementById("hbondDonor").innerHTML = value.toString();
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // heavyAtom
   var req = ocpu.rpc("getheavyatom",{mol : mydata}, function(output){
     $.each(output, function(index, value){
	document.getElementById("heavyAtom").innerHTML = value.toString();
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // ring
   var req = ocpu.rpc("getring",{mol : mydata}, function(output){
     $.each(output, function(index, value){
	document.getElementById("ring").innerHTML = value.toString();
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // rotbond
   var req = ocpu.rpc("getrotbond",{mol : mydata}, function(output){
     $.each(output, function(index, value){
	document.getElementById("rotbond").innerHTML = value.toString();
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // tpsa
   var req = ocpu.rpc("gettpsa",{mol : mydata}, function(output){
     $.each(output, function(index, value){
	document.getElementById("tpsa").innerHTML = value.toString();
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // weight
   var req = ocpu.rpc("getweight",{mol : mydata}, function(output){
     $.each(output, function(index, value){
	document.getElementById("weight").innerHTML = value.toString();
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // xlogp
   var req = ocpu.rpc("getxlogp",{mol : mydata}, function(output){
     $.each(output, function(index, value){
	document.getElementById("xlogp").innerHTML = value.toString();
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });

   // totalcharge
   var req = ocpu.rpc("totalcharge",{mol : mydata}, function(output){
     $.each(output, function(index, value){
	document.getElementById("totalcharge").innerHTML = value.toString();
     });
   }).fail(function(){
     alert("R returned an error: " + req.responseText); 
   });


 });
});
