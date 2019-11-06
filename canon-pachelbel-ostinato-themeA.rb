# Canon pour 3 violons et une basse
# Pachelbel 1653-1706
# version pour montrer la structure en canon.
# utilisation de 4 instruments pour bien diff�rencier les 4 voix.
# utilisation des param�tres pour les synth�tiseurs.


use_bpm 56

ostinato_notes = ( ring
                   :d3, :a2, :b2, :fs2,
                   :g2, :d2, :g2, :a2)

ostinato_durees = ( ring
                    1 )


theme_A_notes = ( ring
                  :fs5, :e5, :d5, :cs5, :b4, :a4, :b4, :cs5,
                  :d5, :cs5,:b4, :a4, :g4, :fs4, :g4, :e4)

theme_A_durees = ( ring
                   1 )


## basse l'instruction "at" permet de d�clarer � quel temps d�clencher
at [1, 9, 17, 25, 33] do
  use_synth :piano
  play_pattern_timed ostinato_notes, ostinato_durees, sustain:1.1
end


## violon 1
at 9 do
  use_synth :pretty_bell
  play_pattern_timed theme_A_notes, theme_A_durees, pan: 1
  
end


## violon 2 commence au 17 �me temps
at 17 do
  
  use_synth :prophet
  
  play_pattern_timed theme_A_notes, theme_A_durees, pan: -1, attack: 0.1, cutoff: 80
  
end


## violon 3 commence au 25�me temps
at 25 do
  use_synth :sine
  play_pattern_timed theme_A_notes, theme_A_durees  
  
end