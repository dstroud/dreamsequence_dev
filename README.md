# dreamsequence_dev

### Changelog:

2024-03-20
- Reverted to v1.2 Crow input mapping: IN 1 is CV and IN 2 is trigger. Syncing to Crow clock is unsupported.

- Added Chromatic Notes param option.

- Improved events to show formatted min/max limits rather than index.

- Swing events

- Fixed issue with handing notes prior to transport starting.

- Fixed incorrect MIDI Harmonizer note durations


2024-02-21
- REQUIRES NORNS 240221

**New features**

- Swing settings for Chord, Seq, CV harmonizer, and Crow clock out.

- Seq ‘Accent’ param applies a positive or negative dynamics offset to swing steps. Coming to CV harmonizer eventually.

- "Step" duration setting adjusts note duration to always match the step length (Chord and Seq) or Trigger division (CV harmonizer).

- Pressing a Grid pattern key when transport is stopped will play that chord or note (feels okay but LMK if you want a way to turn this off).

------------------------------------

**Important transport changes** (depending on clock source)

- Internal clock source (preferred)
  - Pressing K2 will immediately pause Dreamsequence and send a stop message out to synced devices.

  - New `MIDI CLOCK OUT` settings are available for each MIDI clock port via `K3>>PARAMETERS>>EDIT>>PREFERENCES` and determine behavior when continuing after pausing. 
    - The “song” option will send out MIDI Song Position Pointer (SPP) and ‘continue’ messages which should work well for things like DAWs.
    - The “pattern” setting will cause Dreamsequence to continue playback and then send a ’start’ message at the beginning of the next measure. This works well for devices that don’t support SPP: drum machines, loopers, Ableton live’s “Session” view, etc…
    - In order for ‘pattern’ mode to work as expected, you must set a time signature via GLOBAL>>Beats per bar/Beat length (time signature numerator and denominator). Changing the time signature requires a stop and restart, I think.


- Link clock source (WIP)
  - The good news: the issue with starting Link from Norns is addressed in update [240221](/t/norns-update-240221/66241)!

  - The bad news: the way the Link issue is being addressed prevents pause/continue from working at all. I’ve raised an [issue](https://github.com/monome/norns/issues/1756) about this and hopefully a solution can be found. For now, K2 or a stop message from a synced device will result in a full stop.

- MIDI clock source (barely tested)
  - K2/K3 are disabled.

  - No pause/continue (full stop).

- Crow (not supportes)

------------------------------------

**Other changes**

- Chord preload setting is disabled. I’m not sure how necessary this feature was (it was intended to allow jamming on a keyboard into the MIDI/CV harmonizers, even if the notes were hit a little before the chord change). I never really used it and it’s a bit complicated to implement with Lattice so I’m just turning it off for now. LMK if you need this and I can look into bringing it back.

- MIDI device names may be shortened to fit (acronym-based) and, somewhat confusingly, will appear alphabetically as if they have an invisible prefix of "MIDI". The numbers at the end are the assigned MIDI port in `system>>devices` and voice instance (always 1 until I can figure out a way to enable more instances).

- Chord division change events will fire before the chord step is processed

------------------------------------

**Known issues**

- Harmonizer input before transport is started will result in hanging notes until transport is started once.
- At the end of a 1-shot arrangement, a MIDI/Link stop message is sent. This technically occurs at the start of the next measure which may cause synced devices to stop late (Link in particular as there's no latency compensation).
- Live time signature changes probably will break something, IDK.

- 
2023-11-24
- REQUIRES NORNS 231114
- 60fps screen refresh
- NB MIDI "port.voice" suffix
- Fix for NBout crashing script
- Minor screen redraw/Grid refresh optimizations

***Things to know about NB:***
1. The script comes with built-in support for MIDI and Crow voices, but you'll have to install other voices yourself. See the [official NB post](https://llllllll.co/t/60374) for info. I highly recommend you also grab [Doubledecker](https://llllllll.co/t/doubledecker/61525) while you're at it.

2. Voice parameters are no longer stored at the source level (Chord/Seq/harmonizers). Instead, each voice maintains its own parameters, irrespective of the source. To edit voice parameters, navigate to the VOICES section of the system params menu (short tap of K1 then PARAMETERS>>Edit>>VOICES. It sounds clunky but once you've done this once, you can quickly switch back and forth between the script and voice params with a quick tap of K1.

3. Voice parameters are not (yet) available as arranger Events.

4. It's pretty easy to overload the CPU and get audio crackles (or worse) by sending too many notes to a pseudo-engine like Emplaitress. Shorter note duration/envelope helps.

***Things to know about Crow:***

1. *Default* Crow out have changed: 
- Out 1: CV
- Out 2: Env
- Out 3: Events
- Out 4: Clock

2. The GLOBAL menu now has settings for configuring Crow's outputs which will result in various CV or CV/Env pair options appearing in Voice parameters. All outs can send CV, Env, and Events while out 4 can send also send a Clock pulse when transport is running. There's no option for outputting Chord to multiple outs (yet).

3. A new "Trigger" param in CV harmonizer provides options for triggering the harmonizer voltage sampling on a schedule or when a trigger is received at Crow in 2 (default). The former works best for continuous or random voltage sources and might not produce expected results with clock-synced modules that produced stepped voltage changes right on the beat (sequencers, for instance). Scheduled sampling may occur before the round trip of Crow clock out>>pitch change>>sampling can occur.

***Misc:***
1. Crow events have been moved from Global into their own categories for each out, 1-4. There's also a new event "5v 8-steps" event for driving my sequential switch (Vice Virga) that maybe works with similar devices (0.31v, 0.94v, 1.56v, 2.19v, 2.81v, 3.44v, 4.06v, 4.69v). I'd like to have more configurable events along these lines but it'll take some work so take-it-or-leave-it.

2. Crow clock out is improved but please do let me know if you see anything weird. I've had issues in the past with Marbles flipping out and deciding the clock is like a million BPM which spams Norns until it locks up. So maybe this will help.

3. Grid (and Screen) redraws have been limited so hopefully this addresses the issue reported where Grid's LEDs stop responding. Please let me know if you see any issues.
