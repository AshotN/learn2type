$(document).ready ->
  list = "uncommodious johnnycake wallachian figwort dimer shallot matronhood kingwana auxilytic norma minstrel nonguilt hypothecating fairyfloss overspecialized ineluctability catharpin templed chaudfroid siber antiaggressive cryingly phagolysis entomology noncrystalline coxalgia prevaricated leviable aurangzeb protonema vitae porte phalanstery prebelieving proxies satiability subrectangular nonconsolidation unaugmentative hemiacetal lisle enclitic unpacific hexastichon unmirrored cancerousness gaius amphogeny phellogen parenthesise groan anopisthographically vanishingly tenotomist dissyllabic catface coprophilism pelvises marica reopposed fugio intituling isanomal retreatingness fricasseeing logion camorrism omnivorously hakenkreuzler pectinate dismissal maxime bop semicylinder offsetting overgrateful beadiest chemotherapist outlearn nondescript artaud aspirating nongenerating chiastolite preconceding discomposure blackmail unthawing champaign gossipry epiglottidean glary embarkment gift ineloquence antitypically trailless barracouta unconceded"
  words = list.split(" ")
  $(words).each (index, word) ->
    console.log "A"
    if index is 0
      $(".text").append "<div class='word active'>" + word + "</div>"
    else
      $(".text").append "<div class='word'>" + word + "</div>"
    return

  correct = 0
  wrong = 0
  $(".type").keyup (e) ->
    code = e.keyCode or e.which
    if code is 32
      console.log 5
      if $(".active").text() is $(this).val().slice(0, -1)
        $(".active").removeClass "wrong"
        $(".active").addClass "correct"
        correct++
        $(".score").text correct
      else
        $(".active").addClass "wrong"
        wrong++
      current = $(".active")
      $(current).removeClass "active"
      $(current).next().addClass "active"
      $(".type").val ""

      if current.position().top != $(".active").position().top + 5
          $(".correct, .wrong").remove();
    else
      sofar = $(this).val()
      len = sofar.length
      currentword = $(".active").text()
      unless sofar is currentword.slice(0, len)
        $(".active").addClass "wrong"
      else
        $(".active").removeClass "wrong"
    console.log $(this).val()
    return

  return
