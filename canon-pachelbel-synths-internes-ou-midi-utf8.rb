### CANON PACHELBEL version dans sonicpi ou avec midi coupl�s � des synth�s midi
### 11-02-2020
### Utilisation de qsynth 0.5.5 sous windows 10 : https://github.com/JoshuaPrzyborowski/Qsynth-Windows-Builds
### pour charger une banque de son au format soundfont pour la version midi
### utilisation du logiciel loopmidi https://www.tobias-erichsen.de/software/loopmidi.html
### Akai orchestral

## encodage pour les accents en fran�ais
"encoding: UTF-8"

use_bpm 96

# choix du piano en version non midi
use_synth :piano
##| use_synth_defaults sustain: 1, amp: 1.2, release: 1, attack: 0.01



#############
# true or false
versionMidi = false

# fonction pour envoyer des notes avec leurs durees le port midi et un canal

define :midi_player do | n , l , p, c |
  
  ##| use_midi_defaults port: port, channel: canal
  
  ##| puts n
  ##| puts l
  ##| puts p
  ##| puts c
  
  
  n.length.times do
    midi n.tick('foo_notes'), port: p, channel: c
    sleep l.tick('foo_durees')
  end
end


# THEMES ET DUREES #

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

theme_B_notes = ( ring
                  :d4, :fs4, :a4, :g4, :fs4, :d4, :fs4, :e4,
                  :d4, :b3, :d4, :a4, :g4, :b4, :a4, :g4,
                  :fs4, :d4, :e4,:cs5, :d5, :fs5, :a5, :a4,
                  :b4, :g4, :a4, :fs4, :d4, :d5, :d5, :cs5
                  )

theme_B_durees = ( ring
                   0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                   0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                   0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                   0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.75, 0.25
                   )


theme_C_notes = ( ring
                  :d5, :cs5, :d5, :d4, :cs4, :a4, :e4, :fs4,
                  :d4, :d5, :cs5, :b4, :cs5, :fs5, :a5, :b5,
                  
                  :g5, :fs5, :e5, :g5, :fs5, :e5, :d5, :cs5,
                  :b4, :a4, :g4, :fs4, :e4, :g4, :fs4, :e4,
                  
                  :d4, :e4, :fs4, :g4, :a4, :e4, :a4, :g4,
                  :fs4, :b4, :a4, :g4, :a4, :g4, :fs4, :e4,
                  
                  :d4, :b3, :b4, :cs5, :d5, :cs5, :b4, :a4,
                  :g4, :fs4, :e4, :b4, :a4, :b4, :a4, :g4
                  )

theme_C_durees = ( ring
                   0.25)



# STRUCTURE


# basse l'instruction "at" permet de d�clarer � quel temps d�clencher
at [1, 9, 17, 25, 33,41, 49, 57, 65, 73] do
  
  if versionMidi
    
    canal = 12
    midi_player ostinato_notes, ostinato_durees, 'loopmidi-01', canal
    
  else
    
    use_synth :dsaw
    play_pattern_timed ostinato_notes, ostinato_durees, amp:1, sustain: 0.5, cutoff: 60
  end
end



#######################################
## violon 1 commence � 9
#######################################
at 9 do
  if versionMidi
    canal = 1
    midi_player theme_A_notes, theme_A_durees, 'loopmidi-01', canal
    midi_player theme_B_notes, theme_B_durees, 'loopmidi-01', canal
    midi_player theme_C_notes, theme_C_durees, 'loopmidi-01', canal
    
    
  else
    
    use_synth :piano
    use_synth_defaults sustain: 1.2, release: 0.5, cutoff: 80, amp: 1.3
    play_pattern_timed theme_A_notes, theme_A_durees
    play_pattern_timed theme_B_notes, theme_B_durees
    play_pattern_timed theme_C_notes, theme_C_durees
    
  end
end


#######################################
## violon 2 commence au 17 �me temps
#######################################

at 17 do
  if versionMidi
    canal = 2
    midi_player theme_A_notes, theme_A_durees, 'loopmidi-01', canal
    midi_player theme_B_notes, theme_B_durees, 'loopmidi-01', canal
    midi_player theme_C_notes, theme_C_durees, 'loopmidi-01', canal
    
    
  else
    
    use_synth :piano
    with_fx :band_eq do
      use_synth_defaults sustain: 0.5, release: 0.5, cutoff: 80, amp: 1.5
      play_pattern_timed theme_A_notes, theme_A_durees
      play_pattern_timed theme_B_notes, theme_B_durees
      play_pattern_timed theme_C_notes, theme_C_durees
    end
    
  end
end

#######################################
## violon 3 commence au 25�me temps
#######################################


at 25 do
  if versionMidi
    canal = 3
    midi_player theme_A_notes, theme_A_durees, 'loopmidi-01', 4
    midi_player theme_B_notes, theme_B_durees, 'loopmidi-01', 4
    midi_player theme_C_notes, theme_C_durees, 'loopmidi-01', 4
    
  else
    
    # on choisit un instrument diff�rent pour bien distinguer l'entr�e de chaque instrument
    use_synth :pretty_bell
    use_synth_defaults amp:1.2, sustain: 0.1, release: 0.5, cutoff: 72
    play_pattern_timed theme_A_notes, theme_A_durees
    play_pattern_timed theme_B_notes, theme_B_durees
    play_pattern_timed theme_C_notes, theme_C_durees
    
  end
end
