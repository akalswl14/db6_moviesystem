var arr = new Array();
var adult = Number(document.getElementById("adult").value);
var kid = Number(document.getElementById("kid").value);
var banner_seat = document.getElementById("seatchoice");
var banner_price = document.getElementById("totalprice");

function numchoice(obj){
    var tem_adult = Number(document.getElementById("adult").value);
    var tem_kid = Number(document.getElementById("kid").value);
    var len = document.getElementsByClassName("seat_val_num_selected").length;
    if(tem_adult+tem_kid>8){
        alert("인원을 초과하였습니다.최대인원은 8명 입니다.");
        obj.value="00";
        if(obj.id == "adult"){
            tem_adult = 0;
        }else{
            tem_kid=0;
        }
    }
    adult = tem_adult;
    kid = tem_kid;
    for(var i=0;i<len;i++){
        document.getElementsByClassName("seat_val_num_selected")[0].className = "seat_val_num";
    }
    arr = new Array();
    banner_seat.innerHTML = arr.toString();
    banner_price.innerHTML = adult*8000+kid*7000;
}
function seatchoice(obj){
    var seat = obj.id;
    var idx = arr.indexOf(seat);
    banner_seat = document.getElementById("seatchoice");
    banner_price = document.getElementById("totalprice");
    adult = Number(document.getElementById("adult").value);
    kid = Number(document.getElementById("kid").value);
    if(idx == -1){
        if(adult+kid<=arr.length){
            alert("인원을 초과하였습니다.");
        }else{
            arr.push(seat);
            obj.className= "seat_val_num_selected";
        }
    }else{
        arr.splice(idx,1);
        obj.className= "seat_val_num";
    }
    banner_seat.innerHTML = arr.toString();
    banner_price.innerHTML = adult*8000+kid*7000;
}