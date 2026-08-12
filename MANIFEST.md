# Release Manifest

## Bundled Code

| Component | Version | Stability |
| --- | --- | --- |
| Cyberware Stacking | 0.2.0-beta.3 | Beta |
| Cyberware Slot Freedom | 0.1.0-beta.2 | Beta |
| Weapon Mod Freedom | 1.0.0 | Stable |
| Ten Weapon Slots | 0.1.0-beta.1 | Beta |
| Weapon Mod Slot Pager | 1.0.0 | Stable |
| Freedom Overdrive | 1.1.0-beta.1 | Beta |
| Vehicle Quickhack Freedom | 1.0.0 | Stable |
| Underwater Vehicle Freedom | 1.0.0 | Stable |
| Full Auto All Weapons | 1.3.1 | Stable |
| Fortress Legs Freedom | 1.1.0 | Stable; dormant without Black Chrome |

## Bundled Presets

- `Beyond60/settings.json`: level 300, scaling enabled, clean counters.
- `Enhanced Cyberware Capacity/config.json`: flat 1000, multiplier 6.65.
- `FullAutoAllWeapons/settings.json`: tested hold, charge, and timing controls.
- `CyberwareEx.Customization.reds`: 20 slots per area, zero expansion price,
  combined abilities.
- `CyberwareSlotFreedom/init.lua`: blocks Cyberware-EX slot resets at the
  underlying manager method without editing Cyberware-EX.

## Excluded

- All third-party executables, DLLs, scripts, archives, and content payloads.
- Weapon Mod Overdrive source or assets.
- Black Chrome content. Fortress Legs Freedom is included, but its source
  cyberware records and assets are not.
- Cosmetic items, stores, bodies, skins, poses, and photo tools.
- Companion, tank, noclip, pink-mist, cheat, and arcade-score mods.
- Saves, logs, caches, diagnostic probes, settings databases, and keybind data.

## Linked Freedom Dependency

- Universal Cyberdeck Targeting 1.0.1 is linked rather than redistributed. It
  provides NPC and crowd quickhacking; Vehicle Quickhack Freedom covers
  vehicles separately.
