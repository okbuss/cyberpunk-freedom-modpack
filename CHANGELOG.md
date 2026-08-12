# Changelog

## 1.0.0-beta.4 - 2026-08-12

- Upgrade Cyberware Stacking to 0.2.0-beta.3.
- Lift the two `MaxSpeed` stat ceilings and both native ground-locomotion
  ceilings so stacked Jenkins Tendons produce real speed above `15 m/s`.
- Bundle Fortress Legs Freedom 1.1.0 as an optional Black Chrome integration.
- Split each Fortress Legs speed modifier into a safe stackable package while
  preserving Black Chrome's stateful defense package as single-instance.

## 1.0.0-beta.3 - 2026-08-12

- Upgrade Freedom Overdrive to 1.1.0-beta.1.
- Transfer 15 iconic terminal explosions with their removable modifiers across
  ranged and melee hosts, including scenery impacts and stacked modifiers.
- Add explicit generated-explosion recursion protection and live tooltip text.
- Extend the verifier to require the new REDscript resolver and TweakXL mapping.
- Clarify that Jenkins packages are stack-enabled behind one deduplicated HUD
  icon while stateful third-party leg packages such as Fortress Legs remain
  single-instance.

## 1.0.0-beta.2 - 2026-08-10

- Upgrade Cyberware Slot Freedom to 0.1.0-beta.2 with underlying reset-method
  protection through CET.
- Restore Universal Cyberdeck Targeting 1.0.1 to the reviewed freedom setup;
  it handles NPCs and crowds while Vehicle Quickhack Freedom handles vehicles.
- Document the pristine-upstream plus add-on compatibility architecture.
- Extend the verifier to check the complete freedom dependency set and reject
  legacy Cyberware-EX, More Weapon Mod Slots, and Nexus Overdrive edits.

## 1.0.0-beta.1 - 2026-08-09

- Initial progression-focused beta release.
