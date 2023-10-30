# dreamsequence_dev


***Things to know about NB:***
1. The script comes with built-in support for MIDI and Crow voices, but you'll have to install other voices yourself. See the [official NB post](https://llllllll.co/t/60374) for info. I highly recommend you also grab [Doubledecker](https://llllllll.co/t/doubledecker/61525) while you're at it.

2. Voice parameters are no longer stored at the source level (Chord/Seq/harmonizers). Instead, each voice maintains its own parameters, irrespective of the source. To edit voice parameters, navigate to the VOICES section of the system params menu (short tap of K1 then PARAMETERS>>Edit>>VOICES. It sounds clunky but once you've done this once, you can quickly switch back and forth between the script and voice params with a quick tap of K1.

3. Voice parameters are not (yet) available as arranger Events.

4. It's pretty easy to overload the CPU and get audio crackles (or worse) by sending too many notes to a pseudo-engine like Emplaitress. Shorter note duration/envelope helps.

***Things to know about Crow:***
1. Inputs for the CV harmonizer have been flipped. For now, Crow input 1 is now trigger and Crow input 2 is CV. The restriction of using Crow as a clock source has been lifted and works in conjunction with CV harmonizer.

2. *Default* Crow out have changed: 
- Out 1: CV
- Out 2: Env
- Out 3: Events
- Out 4: Clock

3. The GLOBAL menu now has settings for configuring Crow's outputs which will result in various CV or CV/Env pair options appearing in Voice parameters. All outs can send CV, Env, and Events while out 4 can send also send a Clock pulse when transport is running. There's no option for outputting Chord to multiple outs (yet).

4. A new "Trigger" param in CV harmonizer provides options for triggering the harmonizer voltage sampling on a schedule or when a trigger is received at Crow in 1 (default). The former works best for continuous or random voltage sources and might not produce expected results with clock-synced modules that produced stepped voltage changes right on the beat (sequencers, for instance). Scheduled sampling may occur before the round trip of Crow clock out>>pitch change>>sampling can occur.

***Misc:***
1. Crow events have been moved from Global into their own categories for each out, 1-4. There's also a new event "5v 8-steps" event for driving my sequential switch (Vice Virga) that maybe works with similar devices (0.31v, 0.94v, 1.56v, 2.19v, 2.81v, 3.44v, 4.06v, 4.69v). I'd like to have more configurable events along these lines but it'll take some work so take-it-or-leave-it.

2. Crow clock out is improved but please do let me know if you see anything weird. I've had issues in the past with Marbles flipping out and deciding the clock is like a million BPM which spams Norns until it locks up. So maybe this will help.

3. Grid (and Screen) redraws have been limited so hopefully this addresses the issue reported where Grid's LEDs stop responding. Please let me know if you see any issues.
