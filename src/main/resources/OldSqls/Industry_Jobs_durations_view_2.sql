CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `Industry_Jobs_durations_view_2` AS
select
    `a`.`Date` AS `Date`,
    `cj`.`characterID` AS `characterID`,
    `cj`.`characterName` AS `characterName`,
    `cj`.`main_characterID` AS `main_characterID`,
    `cj`.`main_characterName` AS `main_characterName`,
    `cj`.`job_id` AS `job_id`,
    `cj`.`duration` AS `duration_sec`,
    `cj`.`end_date` AS `endDate`,
    `cj`.`start_date` AS `startDate`,
    `cj`.`activity_id` AS `activity_id`,
    case
        when `a`.`Date` = date_format(`cj`.`start_date`, '%Y-%m-%d') then abs(timestampdiff(SECOND, `cj`.`start_date`, `a`.`Date` + interval 24 hour))
        when `a`.`Date` = date_format(`cj`.`end_date`, '%Y-%m-%d') then abs(timestampdiff(SECOND, `a`.`Date`, `cj`.`end_date`))
        else 86400
    end AS `duration_that_day`
from
    (((
    select
        curdate() - interval `a`.`a` + 10 * `b`.`a` + 100 * `c`.`a` + 1000 * `d`.`a` day AS `Date`
    from
        (((((
        select
            0 AS `a`)
union all
    select
        1 AS `1`
union all
    select
        2 AS `2`
union all
    select
        3 AS `3`
union all
    select
        4 AS `4`
union all
    select
        5 AS `5`
union all
    select
        6 AS `6`
union all
    select
        7 AS `7`
union all
    select
        8 AS `8`
union all
    select
        9 AS `9`) `a`
    join (
        select
            0 AS `a`
    union all
        select
            1 AS `1`
    union all
        select
            2 AS `2`
    union all
        select
            3 AS `3`
    union all
        select
            4 AS `4`
    union all
        select
            5 AS `5`
    union all
        select
            6 AS `6`
    union all
        select
            7 AS `7`
    union all
        select
            8 AS `8`
    union all
        select
            9 AS `9`) `b`)
    join (
        select
            0 AS `a`
    union all
        select
            1 AS `1`
    union all
        select
            2 AS `2`
    union all
        select
            3 AS `3`
    union all
        select
            4 AS `4`
    union all
        select
            5 AS `5`
    union all
        select
            6 AS `6`
    union all
        select
            7 AS `7`
    union all
        select
            8 AS `8`
    union all
        select
            9 AS `9`) `c`)
    join (
        select
            0 AS `a`
    union all
        select
            1 AS `1`
    union all
        select
            2 AS `2`
    union all
        select
            3 AS `3`
    union all
        select
            4 AS `4`
    union all
        select
            5 AS `5`
    union all
        select
            6 AS `6`
    union all
        select
            7 AS `7`
    union all
        select
            8 AS `8`
    union all
        select
            9 AS `9`) `d`))
union all
select
    curdate() + interval `a`.`a` + 10 * `b`.`a` + 100 * `c`.`a` + 1000 * `d`.`a` day AS `Date`
from
    (((((
    select
        0 AS `a`)
union all
select
    1 AS `1`
union all
select
    2 AS `2`
union all
select
    3 AS `3`
union all
select
    4 AS `4`
union all
select
    5 AS `5`
union all
select
    6 AS `6`
union all
select
    7 AS `7`
union all
select
    8 AS `8`
union all
select
    9 AS `9`) `a`
join (
    select
        0 AS `a`
union all
    select
        1 AS `1`
union all
    select
        2 AS `2`
union all
    select
        3 AS `3`
union all
    select
        4 AS `4`
union all
    select
        5 AS `5`
union all
    select
        6 AS `6`
union all
    select
        7 AS `7`
union all
    select
        8 AS `8`
union all
    select
        9 AS `9`) `b`)
join (
    select
        0 AS `a`
union all
    select
        1 AS `1`
union all
    select
        2 AS `2`
union all
    select
        3 AS `3`
union all
    select
        4 AS `4`
union all
    select
        5 AS `5`
union all
    select
        6 AS `6`
union all
    select
        7 AS `7`
union all
    select
        8 AS `8`
union all
    select
        9 AS `9`) `c`)
join (
    select
        0 AS `a`
union all
    select
        1 AS `1`
union all
    select
        2 AS `2`
union all
    select
        3 AS `3`
union all
    select
        4 AS `4`
union all
    select
        5 AS `5`
union all
    select
        6 AS `6`
union all
    select
        7 AS `7`
union all
    select
        8 AS `8`
union all
    select
        9 AS `9`) `d`)) `a`
join (
    select
        `chm`.`characterID` AS `characterID`,
        `chm`.`characterName` AS `characterName`,
        `chm`.`main_characterID` AS `main_characterID`,
        `chm`.`main_characterName` AS `main_characterName`,
        `cc`.`job_id` AS `job_id`,
        `cc`.`duration` AS `duration`,
        `cc`.`end_date` AS `end_date`,
        `cc`.`start_date` AS `start_date`,
        `cc`.`activity_id` AS `activity_id`
    from
        (`seat`.`corporation_industry_jobs` `cc`
    join `seat`.`Filtered_ch_mains_employment_history_view` `chm` on
        (`cc`.`installer_id` = `chm`.`characterID`))
    where
        `cc`.`end_date` > `chm`.`start_date`
        and if(`chm`.`end_date` is null,
        1,
        `cc`.`end_date` < `chm`.`end_date`)
        and `cc`.`status` <> 'cancelled') `cj`)
where
    `a`.`Date` between date_format(`cj`.`start_date`, '%Y-%m-%d') and date_format(`cj`.`end_date`, '%Y-%m-%d')