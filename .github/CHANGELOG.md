[![Support Server](https://img.shields.io/discord/862736286774198322.svg?label=Discord&logo=Discord&colorB=7289da&style=for-the-badge)](https://discord.gg/K44VsQsKnx)
![Image](https://img.shields.io/github/downloads/Joe91/fun-bots/total?style=for-the-badge)
![Image](https://img.shields.io/github/stars/Joe91/fun-bots?style=for-the-badge)

## 🥳 Welcome to the changelogs for release **V2.2.0** 🥳


This is the changelog for the unreleased version. Don't forget to [join us on Discord](https://discord.gg/K44VsQsKnx)

## Changelog
This release contains a lot of small bug fixes and more QoL updates.

### ⚠️ Minimum requirements change
Version 2.2.0 of fun-bots now requires the dependency `VeniceEXT` version 1.1.0 or higher.

### New or improved mpas
- Firestorm CQ-Large-Vehicles (thanks to Gemini899)
- Damavand Peak CQ-Large with vehicles (thanks to Gemini899)
- Caspian Border CQ-Large-Vehicles (thanks to Gemini899)
- Strike at Karkhand CQ-Assault-Small Vehicles (thanks to Gemini899)
- Alborz Mountains CQ-Small (thanks to DuTcHrEaGaN)
- Azadi Palace CQ-Small (thanks to DuTcHrEaGaN)
- Sharqi Peninsula CQ-Large (thanks to xILENT)

### ⚙️ Exciting new features
- [#134](https://github.com/Joe91/fun-bots/pull/134) Added configuration option for `AimForHeadSupport` and `BotSupportAimWorsening`<br>
- [#132](https://github.com/Joe91/fun-bots/pull/132) Added extra notes to the configuration file<br>
- [#113](https://github.com/Joe91/fun-bots/issues/113) Bots can now respawn on other bots on the same squad<br>
- Experimental (only partly completed) Bots can enter your vehicle if you hit Q on them<br>
- UI Settings working again and some rework on the UI<br>
- Lots of performance improvement in the Waypoint-editor
- Spawn-Point view in Waypoint-Editor (press "T" to teleport)
- AA-aiming and vehicle-usage
- Bots teleport if stuck. Let me know what you think about this ;-)

#### 🧪 Experimental: Bots entering vehicles
With this release bots can now enter your vehicle! Any driver or passenger can request nearby bots to enter your vehicle if you press the `Q` button. This is still an experimental feature, please report any issues or feedback.

### 📝 Changes and enhancements
- [#141](https://github.com/Joe91/fun-bots/pull/141) Don't spawn at stuck squad-mates<br>
- [#139](https://github.com/Joe91/fun-bots/pull/139) Update checker is now async<br>
- [#137](https://github.com/Joe91/fun-bots/pull/137) Auto updater now follows a better release cycle<br>
- [#136](https://github.com/Joe91/fun-bots/pull/136) Randomized BotWorseningSkill range and added assault aimForHead<br>
- The `mod.json` is updated<br>
- more randomness in spawning
- Minor changes and enhancements<br>
- Fixed saving settings in the `F12` settings menu<br>
- [#143](https://github.com/Joe91/fun-bots/pull/143) Bots ignored players<br>
- massive rework of vehicle aiming and driving and support for anti-air...

### 🐛 Minor bug fixes
- [#129](https://github.com/Joe91/fun-bots/pull/129) Fixed typo `BotWeapons.Priamry` in `BotSpawner.lua`<br>
- [#126](https://github.com/Joe91/fun-bots/pull/126) Fixed bot pistols not being randomized when configuration option `UseRandomWeapon` is true<br>
- [#124](https://github.com/Joe91/fun-bots/pull/124) Fixed varous typos in WeaponListe<br>
- Fixed a bug where the pitch of bots aren't reset after a round ends or resets
- Cleaned up unused code
- Minor stability and performance fixes

### 📖 Documentation update
- [#135](https://github.com/Joe91/fun-bots/pull/135) Updated Github issue forms to ask for more information depending on the request

