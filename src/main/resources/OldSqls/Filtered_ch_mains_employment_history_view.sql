CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `Filtered_ch_mains_employment_history_view` AS
select
    `Characters_mains_employment_history_view`.`row_num` AS `row_num`,
    `Characters_mains_employment_history_view`.`row_inc` AS `row_inc`,
    `Characters_mains_employment_history_view`.`characterID` AS `characterID`,
    `Characters_mains_employment_history_view`.`characterName` AS `characterName`,
    `Characters_mains_employment_history_view`.`main_characterID` AS `main_characterID`,
    `Characters_mains_employment_history_view`.`main_characterName` AS `main_characterName`,
    `Characters_mains_employment_history_view`.`corporation_id` AS `corporation_id`,
    `Characters_mains_employment_history_view`.`ticker` AS `ticker`,
    `Characters_mains_employment_history_view`.`start_date` AS `start_date`,
    `Characters_mains_employment_history_view`.`end_date` AS `end_date`
from
    `seat`.`Characters_mains_employment_history_view`
where
    `Characters_mains_employment_history_view`.`ticker` in ('RI4',
    'R ST',
    'RI 5')