[CmdletBinding()]
param([Parameter(Position = 0)][string]$GameRoot)

$ErrorActionPreference = "Stop"
$report = New-Object System.Collections.Generic.List[string]
$failures = 0

function Add-Result([string]$Status, [string]$Message) {
    if ($Status -eq "FAIL") {
        $script:failures += 1
    }
    $line = "[{0}] {1}" -f $Status, $Message
    [void]$script:report.Add($line)
    Write-Host $line
}

function Find-GameRoot {
    if (Test-Path -LiteralPath (Join-Path $PSScriptRoot "bin\x64\Cyberpunk2077.exe")) {
        return $PSScriptRoot
    }
    foreach ($drive in Get-PSDrive -PSProvider FileSystem) {
        foreach ($relative in @(
            "SteamLibrary\steamapps\common\Cyberpunk 2077",
            "Program Files (x86)\Steam\steamapps\common\Cyberpunk 2077",
            "Program Files\Steam\steamapps\common\Cyberpunk 2077"
        )) {
            $candidate = Join-Path $drive.Root $relative
            if (Test-Path -LiteralPath (Join-Path $candidate "bin\x64\Cyberpunk2077.exe")) {
                return $candidate
            }
        }
    }
    return $null
}

if (!$GameRoot) {
    $GameRoot = Find-GameRoot
}
if (!$GameRoot) {
    $GameRoot = (Read-Host "Paste the Cyberpunk 2077 root folder").Trim().Trim('"')
}

$gameExe = Join-Path $GameRoot "bin\x64\Cyberpunk2077.exe"
if (!(Test-Path -LiteralPath $gameExe -PathType Leaf)) {
    Write-Host "[FAIL] Not a Cyberpunk 2077 root folder: $GameRoot"
    exit 1
}

$GameRoot = (Resolve-Path -LiteralPath $GameRoot).Path
Add-Result "INFO" "Game folder: $GameRoot"
Add-Result "INFO" "Game version: $((Get-Item -LiteralPath $gameExe).VersionInfo.ProductVersion)"

$customFiles = @(
    "r6\scripts\CyberwareStacker\CyberwareStacker.reds",
    "r6\scripts\CyberwareStacker\CyberwareStackerEffects.reds",
    "r6\scripts\CyberwareSlotFreedom\CyberwareSlotFreedom.reds",
    "r6\scripts\FreedomOverdrive\FreedomOverdrive.reds",
    "r6\scripts\FreedomOverdrive\FreedomOverdriveExplosives.reds",
    "r6\scripts\FreedomOverdrive\FreedomOverdriveTooltips.reds",
    "r6\scripts\FullAutoAllWeapons\FullAutoAllWeapons.reds",
    "r6\scripts\TenWeaponSlots\TenWeaponSlots.reds",
    "r6\scripts\WeaponModSlotPager\WeaponModSlotPager.reds",
    "r6\scripts\VehicleQuickhackFreedom\VehicleQuickhackFreedom.reds",
    "r6\scripts\UnderwaterVehicleFreedom\UnderwaterVehicleFreedom.reds",
    "r6\tweaks\Weapon Mod Freedom\Weapon Mod Freedom.yaml",
    "r6\tweaks\Ten Weapon Slots\Ten Weapon Slots.yaml",
    "r6\tweaks\FreedomOverdrive\ExplosiveImpactTransfers.yaml",
    "r6\tweaks\UnderwaterVehicleFreedom.yaml",
    "bin\x64\plugins\cyber_engine_tweaks\mods\CyberwareSlotFreedom\init.lua",
    "bin\x64\plugins\cyber_engine_tweaks\mods\FreedomOverdrive\init.lua",
    "bin\x64\plugins\cyber_engine_tweaks\mods\FullAutoAllWeapons\init.lua"
)

$requiredFiles = @(
    "bin\x64\version.dll",
    "red4ext\red4ext.dll",
    "red4ext\plugins\TweakXL\TweakXL.dll",
    "red4ext\plugins\Codeware\Codeware.dll",
    "engine\tools\scc.exe",
    "r6\scripts\CyberwareEx\CyberwareEx.reds",
    "r6\scripts\CyberwareEx\CyberwareEx.Global.reds",
    "r6\scripts\Slots Slots Slots - More Weapon Mod Slots.reds",
    "bin\x64\plugins\cyber_engine_tweaks\mods\nativeSettings\init.lua",
    "bin\x64\plugins\cyber_engine_tweaks\mods\Beyond60\init.lua",
    "bin\x64\plugins\cyber_engine_tweaks\mods\Enhanced Cyberware Capacity\init.lua"
)

$freedomFiles = @(
    "r6\scripts\Attributes_Uncapped\attributes_uncapped.reds",
    "r6\tweaks\00NoCharacterCreationAttributeRestrictions\00NoCharacterCreationAttributeRestrictions.tweak",
    "r6\scripts\appearanceChangeUnlocker\mirrorUnlocker.reds",
    "r6\scripts\Depeche Mods\DepecheMods.reds",
    "bin\x64\plugins\cyber_engine_tweaks\mods\UnlockedAttachmentsCET\init.lua",
    "r6\tweaks\Cyberware Arms With Mod Slot.yaml",
    "r6\scripts\EquipmentEx\EquipmentEx.reds",
    "red4ext\plugins\ArchiveXL\ArchiveXL.dll",
    "red4ext\plugins\NewGamePlus\NewGamePlus.dll",
    "bin\x64\plugins\cyber_engine_tweaks\mods\ClaimOrSellVehicles\init.lua",
    "bin\x64\plugins\cyber_engine_tweaks\mods\open_sesame\init.lua",
    "r6\scripts\UniversalCyberdeckTargeting\UniversalCyberdeckTargeting.reds",
    "r6\tweaks\UniversalCyberdeckTargeting\UniversalCyberdeckTargeting.yaml"
)

foreach ($relative in $customFiles) {
    if (Test-Path -LiteralPath (Join-Path $GameRoot $relative) -PathType Leaf) {
        Add-Result "PASS" "Custom: $relative"
    } else {
        Add-Result "FAIL" "Missing custom file: $relative"
    }
}

foreach ($relative in $requiredFiles) {
    if (Test-Path -LiteralPath (Join-Path $GameRoot $relative) -PathType Leaf) {
        Add-Result "PASS" "Dependency: $relative"
    } else {
        Add-Result "FAIL" "Missing dependency: $relative"
    }
}

foreach ($relative in $freedomFiles) {
    if (Test-Path -LiteralPath (Join-Path $GameRoot $relative) -PathType Leaf) {
        Add-Result "PASS" "Freedom extension: $relative"
    } else {
        Add-Result "FAIL" "Missing freedom extension: $relative"
    }
}

$legacyOverdrive = "bin\x64\plugins\cyber_engine_tweaks\mods\overdrive\init.lua"
if (Test-Path -LiteralPath (Join-Path $GameRoot $legacyOverdrive) -PathType Leaf) {
    Add-Result "FAIL" "Legacy Nexus Overdrive is still installed: $legacyOverdrive"
} else {
    Add-Result "PASS" "Legacy Nexus Overdrive is not installed."
}

$cyberwareExMain = Join-Path $GameRoot "r6\scripts\CyberwareEx\CyberwareEx.reds"
$cyberwareExGlobal = Join-Path $GameRoot "r6\scripts\CyberwareEx\CyberwareEx.Global.reds"
$legacyCyberwareEx = $false
if (Test-Path -LiteralPath $cyberwareExMain -PathType Leaf) {
    $legacyCyberwareEx = $legacyCyberwareEx -or [bool](Select-String -LiteralPath $cyberwareExMain -SimpleMatch "overrideState.canBuyReset = false" -Quiet)
}
if (Test-Path -LiteralPath $cyberwareExGlobal -PathType Leaf) {
    $legacyCyberwareEx = $legacyCyberwareEx -or [bool](Select-String -LiteralPath $cyberwareExGlobal -SimpleMatch "overrideState.currentSlots != overrideState.defaultSlots && overrideState.canBuyReset" -Quiet)
}
if ($legacyCyberwareEx) {
    Add-Result "FAIL" "Legacy direct Cyberware-EX reset patch detected. Reinstall pristine Cyberware-EX 1.5.6."
} else {
    Add-Result "PASS" "No legacy direct Cyberware-EX reset patch detected."
}

$weaponSlotsBase = Join-Path $GameRoot "r6\scripts\Slots Slots Slots - More Weapon Mod Slots.reds"
if ((Test-Path -LiteralPath $weaponSlotsBase -PathType Leaf) -and
    (Select-String -LiteralPath $weaponSlotsBase -SimpleMatch "AttachmentSlots.Power_AR_SMG_LMG_WeaponMod7" -Quiet)) {
    Add-Result "FAIL" "Legacy direct More Weapon Mod Slots extension detected. Reinstall pristine version 1.3."
} else {
    Add-Result "PASS" "No legacy direct More Weapon Mod Slots extension detected."
}

if (Test-Path -LiteralPath (Join-Path $GameRoot "r6\r6")) {
    Add-Result "FAIL" "Nested r6\r6 folder detected. The archive was extracted one level too deep."
}

$log = Join-Path $GameRoot "r6\logs\redscript_rCURRENT.log"
if (Test-Path -LiteralPath $log -PathType Leaf) {
    $errors = @(Select-String -LiteralPath $log -Pattern '\[ERROR|error:' -CaseSensitive:$false)
    if ($errors.Count -gt 0) {
        Add-Result "FAIL" "Current REDscript log contains $($errors.Count) error line(s)."
        [void]$report.Add("")
        [void]$report.Add("REDscript errors:")
        foreach ($errorLine in $errors | Select-Object -First 40) {
            [void]$report.Add($errorLine.Line)
        }
    } else {
        Add-Result "PASS" "Current REDscript log has no error lines."
    }
} else {
    Add-Result "INFO" "No current REDscript log yet. Launch and close the game once, then rerun."
}

[void]$report.Insert(0, "Cyberpunk Freedom Modpack v1.0.0-beta.3 diagnostic")
[void]$report.Insert(1, "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss K')")
[void]$report.Insert(2, "")
[void]$report.Add("")
[void]$report.Add("Summary: $failures failure(s)")
$reportPath = Join-Path $GameRoot "FreedomModpack-Diagnostic.txt"
$report | Set-Content -LiteralPath $reportPath -Encoding UTF8
Write-Host ""
Write-Host "Diagnostic written to: $reportPath"
Write-Host "Summary: $failures failure(s)"
if ($failures -gt 0) { exit 1 }
