function seatchoice(obj){
    var seat = obj.id;
    var banner_seat = document.getElementById("seatchoice");
    banner_seat.innerHTML = seat;
    // 배열에 선택된거 넣어놓고, 선택된거 해제할때는 배열에서 뺴면서 배너로 업데이트 시켜주고, 배열 길이로 좌석수 판단
}