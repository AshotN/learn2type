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
