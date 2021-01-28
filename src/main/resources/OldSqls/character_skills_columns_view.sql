CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `character_skills_columns_view` AS
select
    distinct `cs`.`character_id` AS `id`,
    ifnull((select `seat`.`character_skills_view`.`active_skill_level` from `seat`.`character_skills_view` where `seat`.`character_skills_view`.`character_id` = `id` and `seat`.`character_skills_view`.`typeName` = 'Mass Production'), 0) AS `mass_prod`,
    ifnull((select `seat`.`character_skills_view`.`active_skill_level` from `seat`.`character_skills_view` where `seat`.`character_skills_view`.`character_id` = `id` and `seat`.`character_skills_view`.`typeName` = 'Advanced Mass Production'), 0) AS `adv_mass_prod`,
    ifnull((select `seat`.`character_skills_view`.`active_skill_level` from `seat`.`character_skills_view` where `seat`.`character_skills_view`.`character_id` = `id` and `seat`.`character_skills_view`.`typeName` = 'Laboratory Operation'), 0) AS `mass_lab`,
    ifnull((select `seat`.`character_skills_view`.`active_skill_level` from `seat`.`character_skills_view` where `seat`.`character_skills_view`.`character_id` = `id` and `seat`.`character_skills_view`.`typeName` = 'Advanced Laboratory Operation'), 0) AS `adv_mass_lab`,
    ifnull((select `seat`.`character_skills_view`.`active_skill_level` from `seat`.`character_skills_view` where `seat`.`character_skills_view`.`character_id` = `id` and `seat`.`character_skills_view`.`typeName` = 'Mass Reactions'), 0) AS `mass_react`,
    ifnull((select `seat`.`character_skills_view`.`active_skill_level` from `seat`.`character_skills_view` where `seat`.`character_skills_view`.`character_id` = `id` and `seat`.`character_skills_view`.`typeName` = 'Advanced Mass Reactions'), 0) AS `adv_mass_react`
from
    (`seat`.`character_skills_view` `cs`
join `seat`.`Filtered_ch_mains_employment_history_view` `chm` on
    (`cs`.`character_id` = `chm`.`characterID`
    and `chm`.`end_date` is null
    and `chm`.`ticker` = 'RI4'))