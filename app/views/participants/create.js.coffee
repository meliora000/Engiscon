#When user pressed participant button
ename = "<%= @participant.user.ename %>"
alert("Welcome " + ename + " 예치금 입금은 -> 이요셉 신한 110-206-271454 로 해주세요")
$("#participant-false").append("<li>"  + ename + "</li>")
$("#participant_form").addClass("animated fadeOutUp")
$("#participant-false li").last().addClass("animated fadeInUp")




