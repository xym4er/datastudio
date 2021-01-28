CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `view_RI4_members_with_mains` AS
select
    `us`.`value` AS `ch_id`,
    (
    select
        `users`.`name`
    from
        `users`
    where
        `users`.`id` = `ch_id`) AS `ch_name`,
    `u`.`id` AS `id`,
    `u`.`name` AS `name`,
    `corporation_infos`.`ticker` AS `ticker`
from
    (((`user_settings` `us`
join `users` `u` on
    (`u`.`group_id` = `us`.`group_id`))
join `corporation_members` on
    (`seat`.`corporation_members`.`character_id` = `u`.`id`))
join `corporation_infos` on
    (`seat`.`corporation_members`.`corporation_id` = `seat`.`corporation_infos`.`corporation_id`))
where
    `us`.`name` = 'main_character_id'
    and `us`.`value` <> 'null'
    and `corporation_infos`.`ticker` = 'RI4'