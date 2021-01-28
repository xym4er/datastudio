CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `PI_MarketSold_view` AS
select
    `chm`.`main_characterName` AS `main_characterName`,
    `chm`.`characterName` AS `charactername`,
    `inv`.`typeName` AS `typename`,
    date_format(`wt`.`date`, '%Y-%m-%d') AS `date`,
    `wt`.`unit_price` AS `unit_price`,
    `mp`.`average_price` AS `ave_market`,
    `wt`.`is_personal` AS `is_personal`,
    `wt`.`quantity` AS `quantity`,
    if(`inv`.`groupID` = 1042,
    `wt`.`quantity`,
    0) AS `P1`,
    if(`inv`.`groupID` = 1034,
    `wt`.`quantity`,
    0) AS `P2`,
    if(`inv`.`groupID` = 1040,
    `wt`.`quantity`,
    0) AS `P3`,
    if(`inv`.`groupID` = 1041,
    `wt`.`quantity`,
    0) AS `P4`
from
    (((`seat`.`character_wallet_transactions` `wt`
join `seat`.`invTypes` `inv` on
    (`inv`.`typeID` = `wt`.`type_id`))
join `seat`.`Filtered_ch_mains_employment_history_view` `chm` on
    (`wt`.`character_id` = `chm`.`characterID`))
join `seat`.`market_prices` `mp` on
    (`inv`.`typeID` = `mp`.`type_id`))
where
    if(`chm`.`end_date` is null,
    `chm`.`start_date` < `wt`.`date`,
    `wt`.`date` between `chm`.`start_date` and `chm`.`end_date`)
    and `wt`.`unit_price` = 0.01
    and `wt`.`is_buy` = 0
    and `inv`.`groupID` in (1042,
    1034,
    1040,
    1041)