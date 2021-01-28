CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `mining_ledger_view` AS
select
    `chm`.`characterID` AS `characterID`,
    `chm`.`characterName` AS `characterName`,
    `chm`.`main_characterID` AS `main_characterID`,
    `chm`.`main_characterName` AS `main_characterName`,
    `cm`.`quantity` AS `mined_quantity`,
    round(`cm`.`quantity` * `inv`.`volume`, 0) AS `mined_volume_m3`,
    concat(`cm`.`date`, ' ', `cm`.`time`) AS `date`,
    if(`cm`.`resourceType` = 1,
    `cm`.`quantity`,
    0) AS `ore_qty`,
    round(if(`cm`.`resourceType` = 1, `cm`.`quantity`, 0) * `inv`.`volume`, 0) AS `ore_volume_m3`,
    if(`cm`.`resourceType` = 5,
    `cm`.`quantity`,
    0) AS `merc_qty`,
    round(if(`cm`.`resourceType` = 5, `cm`.`quantity`, 0) * `inv`.`volume`, 0) AS `merc_volume_m3`,
    if(`cm`.`resourceType` = 2,
    `cm`.`quantity`,
    0) AS `ice_qty`,
    round(if(`cm`.`resourceType` = 2, `cm`.`quantity`, 0) * `inv`.`volume`, 0) AS `ice_volume_m3`,
    if(`cm`.`resourceType` = 3,
    `cm`.`quantity`,
    0) AS `moon_ore_qty`,
    round(if(`cm`.`resourceType` = 3, `cm`.`quantity`, 0) * `inv`.`volume`, 0) AS `moon_ore_volume_m3`,
    if(`cm`.`resourceType` = 4,
    `cm`.`quantity`,
    0) AS `gas_qty`,
    round(if(`cm`.`resourceType` = 4, `cm`.`quantity`, 0) * `inv`.`volume`, 0) AS `gas_volume_m3`
from
    ((`seat`.`character_minings_view` `cm`
join `seat`.`invTypes` `inv` on
    (`cm`.`type_id` = `inv`.`typeID`))
join `seat`.`Filtered_ch_mains_employment_history_view` `chm` on
    (`cm`.`character_id` = `chm`.`characterID`))
where
    concat(`cm`.`date`, ' ', `cm`.`time`) > `chm`.`start_date`
    and if(`chm`.`end_date` is null,
    1,
    concat(`cm`.`date`, ' ', `cm`.`time`) < `chm`.`end_date`)