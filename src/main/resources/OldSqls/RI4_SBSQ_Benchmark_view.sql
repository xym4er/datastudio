CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `RI4_SBSQ_Benchmark_view` AS
select
    `it`.`typeName` AS `typeName`,
    count(`ci`.`quantity`) AS `qty`,
    if(`benchmark`.`qty` is null,
    0,
    `benchmark`.`qty`) AS `benchmark`
from
    (((`seat`.`contract_items` `ci`
join `seat`.`contract_details` `cc` on
    (`cc`.`contract_id` = `ci`.`contract_id`))
join (
    select
        `seat`.`invTypes`.`typeID` AS `typeID`,
        `seat`.`invTypes`.`typeName` AS `typeName`
    from
        `seat`.`invTypes`
    where
        `seat`.`invTypes`.`groupID` in (
        select
            `seat`.`invGroups`.`groupID`
        from
            `seat`.`invGroups`
        where
            `seat`.`invGroups`.`categoryID` = 6)
        and `seat`.`invTypes`.`published` = 1
        and `seat`.`invTypes`.`marketGroupID` is not null) `it` on
    (`it`.`typeID` = `ci`.`type_id`))
left join `seat`.`_RI4_SBSQ_Benchmark` `benchmark` on
    (`it`.`typeName` = `benchmark`.`typeName`))
where
    `cc`.`for_corporation` = 1
    and `cc`.`type` = 'item_exchange'
    and `cc`.`issuer_corporation_id` = 98615601
    and `cc`.`assignee_id` = 99007203
    and `cc`.`start_location_id` = 1028798730588
    and `cc`.`status` <> 'deleted'
    and `cc`.`date_accepted` is null
    and `cc`.`date_expired` > curdate()
group by
    `it`.`typeName`