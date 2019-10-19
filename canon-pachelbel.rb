# Canon pour 3 violons et une basse
# Pachelbel 1653-1706
#

instruments = ['piano', 'pretty_bell', 'prophet', 'blade', 'square']

define :albert do | num: 1, a: 0, d: 0.5, s:0.5, r:0.5, amp: 1, c:80 |
  use_synth instruments[num-1]
  use_synth_defaults attack: a, decay: d, sustain: s, release: r, amp: amp, cutoff: c
end


use_bpm 56

theme_A_notes = ( ring
                  :d3, :a2, :b2, :fs2,
                  :g2, :d2, :g2, :a2)

theme_A_durees = ( ring
                   1 )


theme_B_notes = ( ring
                  :fs5, :e5, :d5, :cs5, :b4, :a4, :b4, :cs5,
                  :d5, :cs5,:b4, :a4, :g4, :fs4, :g4, :e4)

theme_B_durees = ( ring
                   1 )

theme_C_notes = ( ring
                  :d4, :fs4, :a4, :g4, :fs4, :d4, :fs4, :e4,
                  :d4, :b3, :d4, :a4, :g4, :b4, :a4, :g4,
                  :fs4, :d4, :e4,:cs5, :d5, :fs5, :a5, :a4,
                  :b4, :g4, :a4, :fs4, :d4, :d5, :d5, :cs5
                  )

theme_C_durees = ( ring
                   0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                   0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                   0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                   0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.25
                   )


theme_D_notes = ( ring
                  :d5, :cs5, :d5, :d4, :cs4, :a4, :e4, :fs4,
                  :d4, :d5, :cs5, :b4, :cs5, :fs5, :a5, :b5,
                  
                  :g5, :fs5, :e5, :g5, :fs5, :e5, :d5, :cs5,
                  :b4, :a4, :g4, :fs4, :e4, :g4, :fs4, :e4,
                  
                  :d4, :e4, :fs4, :g4, :a4, :e4, :a4, :g4,
                  :fs4, :b4, :a4, :g4, :a4, :g4, :fs4, :e4,
                  
                  :d4, :b3, :b4, :cs5, :d5, :cs5, :b4, :a4,
                  :g4, :fs4, :e4, :b4, :a4, :b4, :a4, :g4
                  )

theme_D_durees = ( ring
                   0.25)


## violon 1
at 9 do
  albert num:1
  play_pattern_timed theme_B_notes, theme_B_durees, pan: 1
  play_pattern_timed theme_C_notes, theme_C_durees, pan: 1
  play_pattern_timed theme_D_notes, theme_D_durees, pan: 1
end


## violon 2 commence au 17 ème temps
at 17 do
  albert num:1, amp: 1.1, s: 0.15
  #use_octave -1
  play_pattern_timed theme_B_notes, theme_B_durees, pan: -1
  play_pattern_timed theme_C_notes, theme_C_durees, pan: -1
  play_pattern_timed theme_D_notes, theme_D_durees, pan: -1
end


## violon 3 commence au 25ème temps
at 25 do
  albert num: 5, d:0.1, s:0.1, r:0.15, amp:0.75
  play_pattern_timed theme_B_notes, theme_B_durees
  play_pattern_timed theme_C_notes, theme_C_durees
  play_pattern_timed theme_D_notes, theme_D_durees
  
end


## basse l'instruction "at" permet de déclarer à quelle temps déclencher
at [1, 9, 17, 25, 33,41, 49, 57, 65, 73] do
  albert num: 3, a: 0, d:0.75, s: 0.25, r: 0.5, amp:1.1, c: 50
  play_pattern_timed theme_A_notes, theme_A_durees
end