CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `Characters_mains_employment_history_view` AS with employment_history as (
select
    row_number() over ( partition by `seat`.`character_corporation_histories`.`character_id`
order by
    `seat`.`character_corporation_histories`.`record_id`) AS `row_num`,
    `seat`.`character_corporation_histories`.`character_id` AS `character_id`,
    `seat`.`character_corporation_histories`.`start_date` AS `start_date`,
    `seat`.`character_corporation_histories`.`corporation_id` AS `corporation_id`
from
    `seat`.`character_corporation_histories`
order by
    `seat`.`character_corporation_histories`.`character_id`,
    row_number() over ( partition by `seat`.`character_corporation_histories`.`character_id`
order by
    `seat`.`character_corporation_histories`.`record_id`)
)select
    `eh`.`row_num` AS `row_num`,
    `eh`.`row_num` + 1 AS `row_inc`,
    `eh`.`character_id` AS `characterID`,
    `seat`.`users`.`name` AS `characterName`,
    `us`.`value` AS `main_characterID`,
    (
    select
        `seat`.`users`.`name`
    from
        `seat`.`users`
    where
        `seat`.`users`.`id` = `main_characterID`) AS `main_characterName`,
    `eh`.`corporation_id` AS `corporation_id`,
    (
    select
        `seat`.`corporation_infos`.`ticker`
    from
        `seat`.`corporation_infos`
    where
        `seat`.`corporation_infos`.`corporation_id` = `eh`.`corporation_id`) AS `ticker`,
    `eh`.`start_date` AS `start_date`,
    if((
    select
        `employment_history`.`row_num`
    from
        (
        select
            row_number() over ( partition by `seat`.`character_corporation_histories`.`character_id`
        order by
            `seat`.`character_corporation_histories`.`record_id`) AS `row_num`,
            `seat`.`character_corporation_histories`.`character_id` AS `character_id`,
            `seat`.`character_corporation_histories`.`start_date` AS `start_date`,
            `seat`.`character_corporation_histories`.`corporation_id` AS `corporation_id`
        from
            `seat`.`character_corporation_histories`
        order by
            `seat`.`character_corporation_histories`.`character_id`,
            row_number() over ( partition by `seat`.`character_corporation_histories`.`character_id`
        order by
            `seat`.`character_corporation_histories`.`record_id`)) `employment_history`
    where
        `employment_history`.`character_id` = `characterID`
        and `employment_history`.`row_num` = `row_inc`) > 0,
    (
    select
        `employment_history`.`start_date`
    from
        (
        select
            row_number() over ( partition by `seat`.`character_corporation_histories`.`character_id`
        order by
            `seat`.`character_corporation_histories`.`record_id`) AS `row_num`,
            `seat`.`character_corporation_histories`.`character_id` AS `character_id`,
            `seat`.`character_corporation_histories`.`start_date` AS `start_date`,
            `seat`.`character_corporation_histories`.`corporation_id` AS `corporation_id`
        from
            `seat`.`character_corporation_histories`
        order by
            `seat`.`character_corporation_histories`.`character_id`,
            row_number() over ( partition by `seat`.`character_corporation_histories`.`character_id`
        order by
            `seat`.`character_corporation_histories`.`record_id`)) `employment_history`
    where
        `employment_history`.`character_id` = `characterID`
        and `employment_history`.`row_num` = `row_inc`),
    NULL) AS `end_date`
from
    ((`employment_history` `eh`
join `seat`.`users` on
    (`eh`.`character_id` = `seat`.`users`.`id`))
join `seat`.`user_settings` `us` on
    (`seat`.`users`.`group_id` = `us`.`group_id`))
where
    `us`.`name` = 'main_character_id'
    and `us`.`value` <> 'null'
order by
    `eh`.`character_id`,
    `eh`.`row_num`