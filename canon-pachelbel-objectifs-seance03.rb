# seance 03 - Nicolas Le Bellier pour le centre multimédia des Pieux
# Canon pour 3 violons et une basse
# Pachelbel 1653-1706
# Version pour montrer la structure en canon.
# Utilisation de 4 instruments pour bien différencier les 4 voix.


# nouvelles notions et instructions abordées
# AT pour déclencher à un moment particulier "at five i drink tea"
# notion de bloc avec do et end 
# use_synth pour choisir un instrument par voix.


# exemples d'utilisation de variables


# fixe le tempo 56 battements par minute - beat per minute
# 120 pour les tests
use_bpm 120


# Mémorisation des notes dans une variable pour réutiliser facilement
# à différents moments du morceau

# Notes de l'Ostinato dans une variable ostinato_notes

ostinato_notes =  [:d3, :a2, :b2, :fs2, :g2, :d2, :g2, :a2]

# Notes du thème A dans une variable theme_A_notes
theme_A_notes = [:fs5, :e5, :d5, :cs5, :b4, :a4, :b4, :cs5,
                 :d5, :cs5,:b4, :a4, :g4, :fs4, :g4, :e4]




#### DECLENCHER A UN MOMENT DONNE ####

# l ostinato est joué tout le temps
# il dure 8 temps (8 notes noires) et commence sur le 1er temps
# ensuite l'ostinato est rejoué au 9ème temps et ainsi de suite tous les 8 temps
# correspondant à sa durée
at [1, 9, 17, 25, 33] do
  use_synth :blade
  play_pattern_timed ostinato_notes, 1
end


# le violon 1 commence au neuvième temps donc at 9
# voir la structure du morceau colorisée

at 9 do
  use_synth :sine
  play_pattern_timed theme_A_notes, 1
end

# le violon 2 commence au 17 temps
at 17 do
  use_synth :piano
  play_pattern_timed theme_A_notes, 1
end

# le violon 3 commence au 25 ème temps
at 25 do
  use_synth :pretty_bell
  play_pattern_timed theme_A_notes, 1
end