var coupon_name=""
var price_input=0;
var remain_price=document.getElementById("remainprice").innerHTML;
var changeprice=0;
var point=0;
remainEvent();
function eventFunction(obj) {
    var hide = obj.nextElementSibling;
    // console.log(hide);
    if(hide.style.display == 'none'){
        hide.style.display = 'block';
    }else if(hide.style.display == 'block'){
        hide.style.display = 'none';
    }
    else{
        hide.style.display = 'block';
    }    
}
function couponEvent(obj){
    price_input = obj;
    var price = document.getElementById("jsprice");
    var left = document.getElementById("b1_left1");
    var right = document.getElementById("b1_right1");
    if(coupon_name!=""&&price_input!=0){
        price.innerHTML = price_input + " 원";
        left.innerHTML = coupon_name;
        right.innerHTML = price_input + " 점"
        remainEvent();
    }
}
function onblurEvent(obj){
    coupon_name = obj.value;
    couponEvent(price_input);
}
function pointEvent(obj){
    point = obj.value;
    var right = document.getElementById("b1_right2");
    if(point!=""){
        right.innerHTML = point + " 점"
        remainEvent();
    }
}
function remainEvent(){
    changeprice = Number(price_input) + Number(point);
    var right = document.getElementById("b2_right");
    var total = document.getElementById("remainprice");
    total.innerHTML = remain_price - changeprice;
    right.innerHTML = (remain_price - changeprice)+ " 원";
}