# seance 02
# Canon pour 3 violons et une basse
# Pachelbel 1653-1706
# Version pour montrer la structure en canon.
# Utilisation de 4 instruments pour bien différencier les 4 voix.
#
#
# nouvelles notions et instructions abordées
# use_bpm,
# ring,
# play_pattern_timed
# use_synth pour choisir un instrument par voix.


# pour décommenter remplacer comment par uncomment
comment do
  
  use_bpm 120
  
  # au lieu de taper tout ce code
  play :c4
  sleep 1 # duree du c4 = 1 temps = 1 noire
  play :E4
  sleep 1
  play :G4
  sleep 1
  play :c5
  sleep 1
  
  # on peut utiliser play_pattern_timed permet de jouer un "motif" (pattern en anglais) avec une durée de notes pour chaque note
  
  play_pattern_timed [:c4, :E4, :G4, :c5], 1
  
  
  # Notons que du sustain est ajouté automatiquement avec play_pattern_timed. La note est soutenue,
  
end



use_bpm 56 # fixe le tempo 56 batttements par minutes - beat per minute


# on utilise deux anneaux ring pour ne pas répéter la saisie
# un ring pour les notes du theme_A
# un ring pour la durée
# le ring contient des éléments


theme_A_notes = ( ring
                  :fs5, :e5, :d5, :cs5, :b4, :a4, :b4, :cs5,
                  :d5, :cs5,:b4, :a4, :g4, :fs4, :g4, :e4)

theme_A_durees = ( ring
                   1 )



## Pour chaque voix on choisit un instrument différent avec l'instruction use_synth

## basse l'instruction "at" permet de déclarer à quel temps déclencher
at [1, 9, 17, 25, 33] do
  use_synth :piano
  play_pattern_timed [:d3, :a2, :b2, :fs2, :g2, :d2, :g2, :a2], 1
end



## violon 1
at 9 do
  use_synth :pretty_bell # choix de l'instrument pretty_bell
  play_pattern_timed theme_A_notes, theme_A_durees
end


## violon 2 commence au 17 ème temps
at 17 do
  
  use_synth :prophet
  play_pattern_timed theme_A_notes, theme_A_durees
  
end


## violon 3 commence au 25ème temps
at 25 do
  use_synth :sine
  play_pattern_timed theme_A_notes, theme_A_durees
end