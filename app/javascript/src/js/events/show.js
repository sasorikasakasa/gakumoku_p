

function judgeShowApplyLink(){
  let deadline_time = document.querySelector(".deadline_time").innerHTML;
  let rest_time = new Date(deadline_time) - new Date();
  if (rest_time <= 0){
    document.querySelector(".apply_link").remove();
    document.querySelector(".zoom_url").hidden = false;
  }
}

setInterval(judgeShowApplyLink,10000);
