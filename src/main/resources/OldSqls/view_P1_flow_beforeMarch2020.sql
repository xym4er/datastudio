CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `view_P1_flow_beforeMarch2020` AS
select
    (
    select
        `seat`.`users`.`name`
    from
        `seat`.`users`
    where
        `seat`.`users`.`id` = `chm`.`ch_main`) AS `Name`,
    sum(`ci`.`quantity`) AS `P1_Qty`,
    case
        when `cd`.`date_issued` < '2019-12-31 23:59:59'
        and `cd`.`title` in ('ДОСТАВКААА',
        'ДОСТАВКА',
        'DELIEVERY',
        'DELIVERY',
        'DELYVERY',
        'CORPORATE DELIEVERY',
        'PlaceHolder1 Contracts from players',
        'PlaceHolder3 Other')
        or `cd`.`date_issued` >= '2019-12-31 23:59:59'
        and `cd`.`title` = 'DELIVERY' then 'Purchased'
        when `cd`.`date_issued` < '2019-12-31 23:59:59'
        and `cd`.`title` not in ('ДОСТАВКААА',
        'ДОСТАВКА',
        'DELIEVERY',
        'DELIVERY',
        'DELYVERY',
        'CORPORATE DELIEVERY',
        'PlaceHolder1 Contracts from players',
        'PlaceHolder3 Other')
        or `cd`.`date_issued` >= '2019-12-31 23:59:59'
        and `cd`.`title` = 'pl in' then 'Player'
    end AS `Source`,
    `cd`.`date_issued` AS `date_issued`
from
    ((((`seat`.`contract_details` `cd`
join `seat`.`contract_items` `ci` on
    (`cd`.`contract_id` = `ci`.`contract_id`))
join `seat`.`invTypes` `inv` on
    (`ci`.`type_id` = `inv`.`typeID`))
join `seat`.`users` `us` on
    (`us`.`id` = `cd`.`issuer_id`))
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
    (`cd`.`issuer_id` = `chm`.`id`))
where
    `cd`.`assignee_id` in (
    select
        `seat`.`users`.`id`
    from
        `seat`.`users`
    where
        `seat`.`users`.`name` in ('imbus',
        'el phantomo'))
    and `cd`.`type` = 'item_exchange'
    and `inv`.`groupID` = 1042
    and `cd`.`date_issued` < '2020-03-01'
group by
    `chm`.`ch_main`,
    `cd`.`date_issued`
order by
    `cd`.`date_issued`