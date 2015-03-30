# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

time = 0
tableRef = null


$ ->
  t = setInterval timeManager, 1
  $("#user_username").val("")
  $("#user_rhythm").val("")
  keys = []
  times = []
  tableRef = document.getElementById('rhythmValues').getElementsByTagName('tbody')[0];
  $("#user_rhythm").on 'keypress', (e) ->
      newRow = tableRef.insertRow(tableRef.rows.length);
      keyCell = newRow.insertCell(0);
      timeCell = newRow.insertCell(1);
      keyText = document.createTextNode(e.key)
      timeText = document.createTextNode(time)
      keyCell.appendChild(keyText)
      timeCell.appendChild(timeText)
      keys.push(e.key)
      times.push(time)
  $(':submit').on 'click', ->
    if keys.length is 0 or times.length is 0
      null
    else
      $.ajax
       type: "POST",
       data: {keys:keys, times:times},
       url: "create",


stopTimer = ->
  time = 0
  tableRef.innerHTML = ""
  $('.timer').html(time)

  keys = []
  times = []

startTimer = ->
  time++
  $('.timer').html(time)

timeManager = ->
  if $("#user_rhythm").val() is ""
    stopTimer()
  else
    startTimer()
