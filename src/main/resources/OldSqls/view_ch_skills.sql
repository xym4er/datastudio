CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `view_ch_skills` AS
select
    `cs`.`character_id` AS `character_id`,
    `invTypes`.`typeName` AS `typeName`,
    `cs`.`active_skill_level` AS `active_skill_level`
from
    ((`character_skills` `cs`
join `invTypes` on
    (`cs`.`skill_id` = `invTypes`.`typeID`))
join `invGroups` on
    (`invTypes`.`groupID` = `invGroups`.`groupID`
    and `invGroups`.`categoryID` = 16))