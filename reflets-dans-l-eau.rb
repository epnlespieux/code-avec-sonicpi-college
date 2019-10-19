#
# Créer un morceau avec une structure
# Reflets dans l'eau - NLB
# 

# L'idée est ici de créer des fonctions par partie avec l'instruction define et in_thread
# ensuite on appelle les fonctions

# Reflets dans l'eau

# on fixe le tempo à 80 beats per minute 80 battements par minute
use_bpm 80

# on crée une méthode qui inclut du code pour pouvoir utiliser ce code plusieurs fois sans avoir à le saisir à nouveau

define :drums do
  in_thread do
    
    sleep 4
    
    8.times do
      sample :drum_bass_soft
      sleep 1
      sample :drum_snare_soft
      sleep 1
      sample :drum_bass_soft
      sleep 1
      sample :drum_snare_soft
      sleep 0.75
      sample :drum_snare_soft, amp: 0.5, pan: -1
      sleep 0.125
      sample :drum_snare_soft, amp: 0.8, pan: 1
      sleep 0.125
    end
    
  end
end

define :hats do
  in_thread do
    
    8.times do
      
      sample :drum_cymbal_open, amp:0.8
      sleep 0.5
      
      5.times do
        sample :drum_cymbal_closed, amp:0.5
        sleep 0.5
      end
      
      1.times do
        sample :drum_cymbal_open, amp:0.25, attack: 0.05
        sleep 0.5
      end
      sample :drum_cymbal_closed, amp:0.5
      sleep 0.5
    end
  end
end


define :eleve_01 do
  in_thread do
    use_synth :piano
    
    use_synth_defaults attack:0 , delay: 0.25, sustain: 0.5, release: 0.25, env_curve: 1, cutoff: 80, res: 0.9, amp: 1.5
    
    sleep 3
    play :e4
    sleep 1
    
    
    play :g4
    sleep 3
    play :f4
    sleep 1
    
    play :a4
    sleep 3
    play :g4
    sleep 1
    
    play :b4
    sleep 3
    play :g4
    sleep 1
    
    play :c5 # changement d'octave pensez à passer à 5
    sleep 3
    play :e4
    sleep 1
    
    #####
    
    play :g4
    sleep 3
    play :f4
    sleep 1
    
    play :a4
    sleep 3
    play :g4
    sleep 1
    
    play :b4
    sleep 3
    play :g4
    sleep 1
    
    play :c5 # changement d'octave on passe à 5
    sleep 4
    
  end
end


define :eleve_02 do
  in_thread do
    use_synth :piano
    use_octave -2 # permet de jouer deux octaves plus graves
    use_synth_defaults sustain: 1, amp: 0.5 # A voir les bon paramètres
    
    sleep 4
    
    # la basse se répète donc on peut utiliser 2.times
    2.times do
      sleep 1
      play :e4
      sleep 1
      play :c4
      sleep 2
      
      sleep 1
      play :f4
      sleep 1
      play :c4
      sleep 2
      
      sleep 1
      play :g4
      sleep 1
      play :d4
      sleep 2
      
      sleep 1
      play :e4
      sleep 1
      play :c4
      sleep 2
    end
    
    
  end
end




define :accords do
  #stop
  # assez complexe me semble t'il mais introduction du principe des tableaux et d'un indice pour le parcourir
  
  progression = [ chord(:c4,"major"),
                  chord(:f4,"major"),
                  chord(:g4, '5'),
                  chord(:c5, 'major')
                  ]
  
  in_thread do
    
    use_synth :piano
    use_synth_defaults attack: 0, release: 2
    
    sleep 4 # intro silence
    
    2.times do
      
      i = 0
      4.times do
        accord_actuel = progression[i]
        4.times do
          with_fx :echo, mix: 0.4 do
            sleep 0.5 # reggae man :-)
            play accord_actuel
            sleep 0.5
          end
        end
        i = i+1
      end
    end
  end
  
end


# ON JOUE LES DIFFERENTES PARTIES EN LES APPELANT



eleve_01
eleve_02
drums
hats
accords
