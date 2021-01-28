CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `view_P1_flow_byName_beforeMarch2020` AS
select
    `inv`.`typeID` AS `typeID`,
    `inv`.`typeName` AS `typeName`,
    sum(`ci`.`quantity`) AS `p1_qty`,
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
        and `cd`.`title` = 'Pl in' then 'Player'
    end AS `source`,
    `cd`.`date_issued` AS `date_issued`
from
    ((`contract_details` `cd`
join `contract_items` `ci` on
    (`cd`.`contract_id` = `ci`.`contract_id`))
join `invTypes` `inv` on
    (`ci`.`type_id` = `inv`.`typeID`))
where
    `cd`.`assignee_id` in (
    select
        `users`.`id`
    from
        `users`
    where
        `users`.`name` in ('imbus',
        'el phantomo'))
    and `cd`.`type` = 'item_exchange'
    and `inv`.`groupID` = 1042
    and `cd`.`date_issued` < '2020-03-01'
group by
    `inv`.`typeID`,
    `cd`.`date_issued`
order by
    `cd`.`date_issued`