# seance 02
# Canon pour 3 violons et une basse
# Pachelbel 1653-1706
# Version pour montrer la structure en canon.
# Utilisation de 4 instruments pour bien différencier les 4 voix.


# nouvelles notions et instructions abordées
# use_bpm,
# play_pattern_timed
# use_synth pour choisir un instrument par voix.



use_bpm 56 # fixe le tempo 56 battements par minute - beat per minute


# thème A
use_synth :pretty_bell # choix de l'instrument pretty_bell
play_pattern_timed [:fs5, :e5, :d5, :cs5, :b4, :a4, :b4, :cs5,
                    :d5, :cs5,:b4, :a4, :g4, :fs4, :g4, :e4], 1


# Ostinato
use_synth :piano
play_pattern_timed [:d3, :a2, :b2, :fs2, :g2, :d2, :g2, :a2], 1


# mémorisation du thème A dans une variable pour réutiliser facilement

theme_A_notes = [:fs5, :e5, :d5, :cs5, :b4, :a4, :b4, :cs5,
                 :d5, :cs5,:b4, :a4, :g4, :fs4, :g4, :e4]

theme_A_durees = [1]


use_synth :blade
play_pattern_timed theme_A_notes, theme_A_durees

use_synth :piano
play_pattern_timed theme_A_notes, theme_A_durees