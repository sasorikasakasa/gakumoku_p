// 締切時刻と現在時刻を引いてそれをカウントダウンする



function countDownTimer(deadline_time){
  let rest_time = new Date(deadline_time) - new Date();
  if (rest_time > 0 ){
    let sec = Math.floor(rest_time/1000)%60;
    let min = Math.floor(rest_time/1000/60)%60;
    let hour= Math.floor(rest_time/1000/60/60)%24;
    let day = Math.floor(rest_time/1000/60/60/24);
    let rest_time_message = day + "日" + hour + "時間" + min + "分" + sec + "秒";
    return rest_time_message
  }else{
    let rest_time_message = "---締切---";
    return rest_time_message
  }
}

function showCountDown(){
  let deadline_times = document.querySelectorAll(".deadline_time");
  let rest_times = document.querySelectorAll(".rest_time");
  for (let i = 0, len = deadline_times.length; i < len; i++) {
    rest_times[i].innerHTML = countDownTimer(deadline_times[i].innerHTML);
  }
}

window.onload = showCountDown();


setInterval(showCountDown,1000);