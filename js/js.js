$(document).ready(function () {
	var list = "uncommodious johnnycake wallachian figwort dimer shallot matronhood kingwana auxilytic norma minstrel nonguilt hypothecating fairyfloss overspecialized ineluctability catharpin templed chaudfroid siber antiaggressive cryingly phagolysis entomology noncrystalline coxalgia prevaricated leviable aurangzeb protonema vitae porte phalanstery prebelieving proxies satiability subrectangular nonconsolidation unaugmentative hemiacetal lisle enclitic unpacific hexastichon unmirrored cancerousness gaius amphogeny phellogen parenthesise groan anopisthographically vanishingly tenotomist dissyllabic catface coprophilism pelvises marica reopposed fugio intituling isanomal retreatingness fricasseeing logion camorrism omnivorously hakenkreuzler pectinate dismissal maxime bop semicylinder offsetting overgrateful beadiest chemotherapist outlearn nondescript artaud aspirating nongenerating chiastolite preconceding discomposure blackmail unthawing champaign gossipry epiglottidean glary embarkment gift ineloquence antitypically trailless barracouta unconceded";
	var words = list.split(" ");

	$(words).each(function(index, word) {
		console.log("A");
		if(index == 0)
		{
			$(".text").append("<div class='word active'>"+word+"</div>");
		}
		else
		{
			$(".text").append("<div class='word'>"+word+"</div>");
		}
	});
var correct = 0, wrong = 0;
	$('.type').keyup(function (e) {
		var code = e.keyCode || e.which;
		if(code == 32){
			if($(".active").text() == $(this).val().slice(0, -1))
			{

				$(".active").removeClass("wrong");
				correct++;
				$(".score").text($correct);
			}
			else
			{
				$(".active").addClass("wrong");
				wrong++;
			}
				var current = $(".active");


				$(current).removeClass("active");
				$(current).next().addClass("active");
				$(".type").val("");
		}
		else
		{
			var sofar = $(this).val();
			var len = sofar.length;

			var currentword = $(".active").text();

			if(sofar != currentword.slice(0, len))
			{
				$(".active").addClass("wrong");
			}
			else
			{
				$(".active").removeClass("wrong");
			}


		}
		console.log($(this).val());
	});

});