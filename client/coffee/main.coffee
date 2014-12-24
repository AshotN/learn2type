#http://stackoverflow.com/a/1192001
Countdown = (options) ->
  decrementCounter = ->
    updateStatus seconds
    if seconds is 0
      counterEnd()
      instance.stop()
    seconds--
    return
  timer = undefined
  instance = this
  seconds = options.seconds or 10
  running = false
  updateStatus = options.onUpdateStatus or ->

  counterEnd = options.onCounterEnd or ->

  @start = ->
    console.log "started"
    running = true
    clearInterval timer
    timer = 0
    seconds = options.seconds
    timer = setInterval(decrementCounter, 1000)
    return

  @stop = ->
    clearInterval timer
    return

  @running = ->
    return running

  return

myCounter = new Countdown(
  seconds: 59 # number of seconds to count down
  onUpdateStatus: (sec) -> # callback for each second
    $(".countdown").text sec
    return

  onCounterEnd: -> # final action
    $('.type').val "Time's Up"
    $('.type').attr 'disabled', true
    return
)
$(document).ready ->
  $.getJSON "/getwords", (words) ->

    $(words).each (index, word) ->
      if index is 0
        return $('.text').append "<div class='word active'>" + word + '</div>'
      else
        return $('.text').append "<div class='word'>" + word + '</div>'
      

    correct = 0
    wrong = 0
    $('.type').keyup (e) ->
      console.log e.key
      #Ignore irrelevant keys
      if e.key?
        if(e.key.length > 1 && (e.key.toLowerCase() != "del" && e.key.toLowerCase() != "backspace" && e.key.toLowerCase() != "delete") )
          return
      console.log 1, myCounter.running()
      if not myCounter.running()
        myCounter.start()
      code = e.keyCode or e.which
      if code is 32
        if $('.active').text() is $(this).val().slice(0, -1)
          $('.active').removeClass 'wrong'
          $('.active').addClass 'correct'
          correct++
          $('.scorenum').text correct
        else
          $('.active').addClass 'wrong'
          wrong++
          $('.incorrectnum').text wrong
        current = $('.active')
        $(current).removeClass 'active' 
   
        if($(current).next().length == 0)
          $('.type').val 'Finished'
          $('.type').attr 'disabled', true
          return

        $(current).next().addClass 'active'
        $('.type').val ''

        if current.position().top != $('.active').position().top
            $('.correct, .wrong').remove();
      else
        sofar = $(this).val().replace(' ','')
        len = sofar.length
        currentword = $('.active').text()
        unless sofar is currentword.slice(0, len)
          $('.active').addClass 'wrong'
        else
          $('.active').removeClass 'wrong'
