# seance 03 - Nicolas Le Bellier pour le centre multimédia des Pieux
# Canon pour 3 violons et une basse
# Pachelbel 1653-1706
# Version pour montrer la structure en canon.
# Utilisation de 4 instruments pour bien différencier les 4 voix.


# nouvelles notions et instructions abordées
# notion de variable mémoriser des valeurs.
# play_pattern_timed
# use_synth pour choisir un instrument par voix.


# exemples d'utilisation de variables

# on nomme la variable toto et on lui affecte (on lui donne) 60 comme valeur
toto = 60

play toto # joue la valeur mémorisée dans la variable toto donc 60
sleep 1

play toto + 1 # joue la note suivante 60 + 1 = 61
sleep 1

melodie = [ toto, 65, toto + 12]
play_pattern_timed melodie, 1

## POUR LE CANON ####

# fixe le tempo à 120 battements par minute - beat per minute
# normalement 56 mais pour tester 120 pour gagner du temps.
use_bpm 120


# Mémorisation des notes dans une variable pour réutiliser facilement
# à différents moments du morceau

# Notes de l'Ostinato dans une variable ostinato_notes

ostinato_notes =  [:d3, :a2, :b2, :fs2, :g2, :d2, :g2, :a2]

# Notes du thème A dans une variable theme_A_notes
theme_A_notes = [:fs5, :e5, :d5, :cs5, :b4, :a4, :b4, :cs5,
                 :d5, :cs5,:b4, :a4, :g4, :fs4, :g4, :e4]


# use-synth permet de choisir parmie les synthétiseurs proposés de choisir un instrument fourni avec Sonic Pi
use_synth :piano

# joue les notes de l'ostinato
play_pattern_timed ostinato_notes, 1

# on change d'instrument
use_synth :pretty_bell
# joue le thème A
play_pattern_timed theme_A_notes, 1


#### DECLENCHER A UN MOMENT DONNE ####

# l ostinato est joué tout le temps
# il dure 8 temps (8 notes noires) et commence sur le 1er temps
at [1, 9, 17, 25, 33] do
  use_synth :blade
  play_pattern_timed ostinato_notes, 1
end


# le violon 1 commence au neuvième temps donc at 9

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