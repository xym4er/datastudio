CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `Industry_Jobs_durations_view` AS
select
    `chm`.`characterID` AS `characterID`,
    `chm`.`characterName` AS `characterName`,
    `chm`.`main_characterID` AS `main_characterID`,
    `chm`.`main_characterName` AS `main_characterName`,
    `cc`.`duration` AS `duration_sec`,
    `cc`.`end_date` AS `endDate`,
    `cc`.`start_date` AS `startDate`,
    `cc`.`activity_id` AS `activity_id`,
    `csk`.`mass_prod` AS `mass_prod`,
    `csk`.`adv_mass_prod` AS `adv_mass_prod`,
    `csk`.`mass_lab` AS `mass_lab`,
    `csk`.`adv_mass_lab` AS `adv_mass_lab`,
    `csk`.`mass_react` AS `mass_react`,
    `csk`.`adv_mass_react` AS `adv_mass_react`
from
    ((`seat`.`corporation_industry_jobs` `cc`
join `seat`.`Filtered_ch_mains_employment_history_view` `chm` on
    (`cc`.`installer_id` = `chm`.`characterID`))
join `seat`.`character_skills_columns_view` `csk` on
    (`csk`.`id` = `chm`.`characterID`))
where
    `cc`.`end_date` > `chm`.`start_date`
    and if(`chm`.`end_date` is null,
    1,
    `cc`.`end_date` < `chm`.`end_date`)
    and `cc`.`status` <> 'cancelled'