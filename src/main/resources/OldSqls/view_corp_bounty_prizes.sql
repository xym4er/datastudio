CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `view_corp_bounty_prizes` AS
select
    (
    select
        `seat`.`users`.`name`
    from
        `seat`.`users`
    where
        `seat`.`users`.`id` = `chm`.`ch_main`) AS `ch_main`,
    round(`wj`.`amount`, 0) AS `amount`,
    `wj`.`date` AS `date`
from
    (`seat`.`corporation_wallet_journals` `wj`
join (
    select
        `us`.`value` AS `ch_main`,
        `u`.`id` AS `id`,
        `u`.`name` AS `name`,
        `seat`.`corporation_infos`.`ticker` AS `ticker`
    from
        (((`seat`.`user_settings` `us`
    join `seat`.`users` `u` on
        (`u`.`group_id` = `us`.`group_id`))
    join `seat`.`corporation_members` on
        (`seat`.`corporation_members`.`character_id` = `u`.`id`))
    join `seat`.`corporation_infos` on
        (`seat`.`corporation_members`.`corporation_id` = `seat`.`corporation_infos`.`corporation_id`))
    where
        `us`.`name` = 'main_character_id'
        and `us`.`value` <> 'null'
        and `seat`.`corporation_infos`.`ticker` = 'RI4') `chm` on
    (`wj`.`second_party_id` = `chm`.`id`))
where
    `wj`.`ref_type` = 'bounty_prizes'