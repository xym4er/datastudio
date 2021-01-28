CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `MaxIndustryLines_view` AS
select
    sum(if(`seat`.`character_skills_columns_view`.`mass_prod` + `seat`.`character_skills_columns_view`.`adv_mass_prod` = 0, 0, `seat`.`character_skills_columns_view`.`mass_prod` + `seat`.`character_skills_columns_view`.`adv_mass_prod` + 1)) AS `max_prod`,
    sum(if(`seat`.`character_skills_columns_view`.`mass_lab` + `seat`.`character_skills_columns_view`.`adv_mass_lab` = 0, 0, `seat`.`character_skills_columns_view`.`mass_lab` + `seat`.`character_skills_columns_view`.`adv_mass_lab` + 1)) AS `max_lab`,
    sum(if(`seat`.`character_skills_columns_view`.`mass_react` + `seat`.`character_skills_columns_view`.`adv_mass_react` = 0, 0, `seat`.`character_skills_columns_view`.`mass_react` + `seat`.`character_skills_columns_view`.`adv_mass_react` + 1)) AS `max_react`
from
    `seat`.`character_skills_columns_view`CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `MaxIndustryLines_view` AS
select
    sum(if(`seat`.`character_skills_columns_view`.`mass_prod` + `seat`.`character_skills_columns_view`.`adv_mass_prod` = 0, 0, `seat`.`character_skills_columns_view`.`mass_prod` + `seat`.`character_skills_columns_view`.`adv_mass_prod` + 1)) AS `max_prod`,
    sum(if(`seat`.`character_skills_columns_view`.`mass_lab` + `seat`.`character_skills_columns_view`.`adv_mass_lab` = 0, 0, `seat`.`character_skills_columns_view`.`mass_lab` + `seat`.`character_skills_columns_view`.`adv_mass_lab` + 1)) AS `max_lab`,
    sum(if(`seat`.`character_skills_columns_view`.`mass_react` + `seat`.`character_skills_columns_view`.`adv_mass_react` = 0, 0, `seat`.`character_skills_columns_view`.`mass_react` + `seat`.`character_skills_columns_view`.`adv_mass_react` + 1)) AS `max_react`
from
    `seat`.`character_skills_columns_view`