CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `Items_in_contracts_for_last_x_days_view` AS
select
    `it`.`typeID` AS `typeID`,
    `it`.`typeName` AS `typename`,
    sum(`ci`.`quantity`) AS `qty`
from
    ((`contract_details` `cc`
join `contract_items` `ci` on
    (`cc`.`contract_id` = `ci`.`contract_id`))
join `invTypes` `it` on
    (`ci`.`type_id` = `it`.`typeID`))
where
    `cc`.`for_corporation` = 1
    and `cc`.`issuer_corporation_id` = 98615601
    and `cc`.`status` = 'finished'
    and `cc`.`date_issued` > curdate() - interval 40 day
group by
    `it`.`typeID`