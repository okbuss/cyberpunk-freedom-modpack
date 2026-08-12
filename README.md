# Cyberpunk Freedom Modpack

> Beta: back up saves before installing.

A progression-focused Cyberpunk 2077 2.31 modpack for the base game. It removes
level, attribute, cyberware, weapon-mod, hacking, ownership, appearance, and
New Game Plus restrictions without bundling cosmetic payloads, free-item
menus, companions, photo tools, or unrelated content.

The release ZIP contains only mods authored and published by `okbuss`, plus
portable configuration presets. Third-party Nexus files are not redistributed;
their tested source pages are listed in [DEPENDENCIES.md](DEPENDENCIES.md).

## Included Custom Mods

- [Cyberware Stacking v0.2.0-beta.3](https://github.com/okbuss/cyberware-stacking/releases/tag/v0.2.0-beta.3)
- [Cyberware Slot Freedom v0.1.0-beta.2](https://github.com/okbuss/cyberware-slot-freedom/releases/tag/v0.1.0-beta.2)
- [Weapon Mod Freedom v1.0.0](https://github.com/okbuss/weapon-mod-freedom/releases/tag/v1.0.0)
- [Ten Weapon Slots v0.1.0-beta.1](https://github.com/okbuss/ten-weapon-slots/releases/tag/v0.1.0-beta.1)
- [Weapon Mod Slot Pager v1.0.0](https://github.com/okbuss/weapon-mod-slot-pager/releases/tag/v1.0.0)
- [Freedom Overdrive v1.1.0-beta.1](https://github.com/okbuss/freedom-overdrive/releases/tag/v1.1.0-beta.1)
- [Vehicle Quickhack Freedom v1.0.0](https://github.com/okbuss/vehicle-quickhack-freedom/releases/tag/v1.0.0)
- [Underwater Vehicle Freedom v1.0.0](https://github.com/okbuss/underwater-vehicle-freedom/releases/tag/v1.0.0)
- [Full Auto All Weapons v1.3.1](https://github.com/okbuss/full-auto-all-weapons/releases/tag/v1.3.1)
- [Fortress Legs Freedom v1.1.0](https://github.com/okbuss/fortress-legs-freedom/releases/tag/v1.1.0) (optional Black Chrome integration)

## Installation

1. Back up the saves you intend to use.
2. Close Cyberpunk 2077.
3. Install the required third-party stack in `DEPENDENCIES.md` first.
4. Remove the old Nexus Weapon Mod Overdrive CET folder if present:
   `bin\x64\plugins\cyber_engine_tweaks\mods\overdrive`.
5. Reinstall pristine Cyberware-EX 1.5.6 and More Weapon Mod Slots 1.3 if
   either mod was manually edited by an older version of this setup.
6. Do not install Cyberware-EX X13 or another
   `CyberwareEx.Customization.reds`; this pack supplies its own configuration.
7. Extract the release ZIP into the Cyberpunk 2077 root folder, one level above
   `bin` and `r6`, and merge folders.
8. Run `VERIFY_FREEDOM_PACK.cmd` from the game folder.
9. Start the game and wait for REDscript compilation to complete.

Do not drag the included `r6` folder into the game's existing `r6` folder. The
correct operation is to drag `bin` and `r6` onto the Cyberpunk 2077 root.

## Presets

- Beyond60 maximum level: 300, normal health/armor scaling, and one extra perk
  point per post-60 level. Save-derived counters start at zero.
- Enhanced Cyberware Capacity: +1000 flat capacity and +6.65 per level.
- Cyberware-EX: 20 purchasable slots in every configured area, free expansion,
  combined abilities, and no destructive slot reset.
- Full Auto All Weapons: current tested input timing with Minus as the dedicated
  heavy/charge key.
- Weapon layouts: ten modification slots plus four-row UI paging.

## Compatibility Architecture

The pack keeps Cyberware-EX and More Weapon Mod Slots pristine. Their freedom
changes are supplied by Cyberware Slot Freedom and Ten Weapon Slots as separate
add-ons. Freedom Overdrive independently configures native iconic modifier
records and replaces the previously edited Nexus Overdrive installation. Its
explosive iconic modifiers carry their terminal explosion to ranged and melee
hosts, including scenery impacts, without recursively triggering themselves.

Universal Cyberdeck Targeting and Vehicle Quickhack Freedom are complementary:
the former handles active NPCs and crowds, while the latter handles vehicles.

## Known Risks

Cyberware Stacking remains beta. Equipped implants can appear visually
duplicated, and identical Jenkins Tendons packages are stack-enabled even
though the HUD collapses them to one icon. Jenkins movement stacks now pass
through both the stat and native ground-speed ceilings. Fortress Legs Freedom
keeps Black Chrome's stateful defense package single-instance but separates its
speed bonus into a safe stackable package. Freedom Overdrive and Ten Weapon
Slots are also beta components. Keep a pre-install save and do not repeatedly
add and remove these components on one save.

## Scope

No body, skin, clothing pack, lingerie, pose, PhotoMode, Virtual Atelier store,
Flying Tank, Arasaka Security, Pink Mist, FreeFly, cheat command, save,
diagnostic probe, cache, log, or personal keybind database is included.

See [MANIFEST.md](MANIFEST.md) for the exact payload.
