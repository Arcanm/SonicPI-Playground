use_bpm 125

with_fx :reverb, room: 0.2, mix: 0.1 do
  
  live_loop :kick do
    # MODIFY AMP FOR MORE KICK
    sample :bd_pure, amp: 2
    sleep 1
  end
  
  live_loop :sub_bass, sync: :kick do
    use_synth :sine
    play :c2, attack: 0.05, release: 0.6, amp: 0.8
    sleep 1
  end
  
  live_loop :click, sync: :kick do
    sleep 0.5
    sample :elec_filt_snare, amp: 0.5, rate: 3, finish: 0.01
    sleep 0.5
  end
  
  live_loop :minimal_glitch, sync: :kick do
    use_synth :pretty_bell
    with_fx :echo, phase: 0.75, decay: 4, mix: 0.3 do
      
      notes = (ring :c4, :g3, :ds4, :f3, :c4, :as3).shuffle
      
      8.times do
        n = notes.tick
        if one_in(3)
          play n, release: 0.1, amp: 0.3, cutoff: 90
        end
        sleep 0.25
      end
    end
  end
  
  live_loop :clean_hats, sync: :kick do
    sample :elec_triangle, amp: 0.2, rate: 4, finish: 0.005 if one_in(2)
    sleep 0.125
  end
end