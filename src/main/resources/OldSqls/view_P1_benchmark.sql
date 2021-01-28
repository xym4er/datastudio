CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `view_P1_benchmark` AS
select
    `invTypes`.`typeID` AS `typeID`,
    `invTypes`.`typeName` AS `typeName`,
    `bench`.`value` AS `value`
from
    (`custom_item_benchmark` `bench`
join `invTypes` on
    (`invTypes`.`typeID` = `bench`.`typeID`))
where
    `invTypes`.`groupID` = 1042