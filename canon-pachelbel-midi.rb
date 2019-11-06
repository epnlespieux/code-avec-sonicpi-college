### CANON PACHELBEL VERSION MIDI






use_debug false

use_bpm 56


use_midi_defaults port: 'loopmidi-01', channel: 1


notes = (ring :c, :g, :gs, :es)
durees = (ring 1, 1,0.5, 2)


# fonction pour envoyer des notes avec leurs durees le port midi et un canal


define :midi_player do | n , l , port, canal |
  
  use_midi_defaults port: port, channel: canal
  
  puts n
  puts l
  puts canal
  puts port
  
  
  n.length.times do
    midi n.tick('goo_notes')
    sleep l.tick('goo_durees')
  end
end


# THEMES ET DUREES #

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





# STRUCTURE


# basse l'instruction "at" permet de déclarer à quel temps déclencher
at [1, 9, 17, 25, 33,41, 49, 57, 65, 73] do
  
  midi_player theme_A_notes, theme_A_durees, 'loopmidi-01', 1
end



## violon 1
at 9 do
  
  
  midi_player theme_B_notes, theme_B_durees, 'loopmidi-02', 2
  midi_player theme_C_notes, theme_C_durees, 'loopmidi-02', 2
  midi_player theme_D_notes, theme_D_durees, 'loopmidi-02', 2
  
  
end


## violon 2 commence au 17 ème temps
at 17 do
  #albert num:1, amp: 1.1, s: 0.15
  #use_octave -1
  midi_player theme_B_notes, theme_B_durees, 'loopmidi-02', 2
  midi_player theme_C_notes, theme_C_durees, 'loopmidi-02', 2
  midi_player theme_D_notes, theme_D_durees, 'loopmidi-02', 2
end


## violon 3 commence au 25ème temps
at 25 do
  
  midi_player theme_B_notes, theme_B_durees, 'loopmidi-02', 2
  midi_player theme_C_notes, theme_C_durees, 'loopmidi-02', 2
  midi_player theme_D_notes, theme_D_durees, 'loopmidi-02', 2
  
  #play_pattern_timed theme_D_notes, theme_D_durees
  
end


stop

at [1, 9] do
  
  midi_player notes, durees, 'loopmidi-01', 1
end


at [9, 17] do
  
  midi_player theme_A_notes, theme_A_durees, 'loopmidi-01', 1
end



stop

4.times do
  
  notes.length.times do
    foo = notes.tick
    midi notes.tick('n'), sustain: 0.5
    midi foo + 24, sustain: 0.5, channel: 2
    sleep durees.tick('d')
  end
  
end


