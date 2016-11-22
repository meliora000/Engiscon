$("#participantid_<%= @participant.id %>").addClass("animated fadeOutUp")
$("#participant-true").append("<li class='animated fadeInUp'><%= @participant.user.ename %></li>")