CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `character_minings_view` AS
select
    `character_minings`.`character_id` AS `character_id`,
    `character_minings`.`date` AS `date`,
    `character_minings`.`time` AS `time`,
    `character_minings`.`year` AS `year`,
    `character_minings`.`month` AS `month`,
    `character_minings`.`solar_system_id` AS `solar_system_id`,
    `character_minings`.`type_id` AS `type_id`,
    `character_minings`.`quantity` AS `quantity`,
    `character_minings`.`created_at` AS `created_at`,
    `character_minings`.`updated_at` AS `updated_at`,
    case
        when `character_minings`.`type_id` in (
        select
            `invTypes`.`typeID`
        from
            `invTypes`
        where
            `invTypes`.`groupID` in (
            select
                `invTypes`.`groupID`
            from
                `invTypes`
            where
                `invTypes`.`typeName` in ('Veldspar',
                'Scordite',
                'Pyroxeres',
                'Plagioclase',
                'Omber',
                'Kernite',
                'Jaspet',
                'Hemorphite',
                'Hedbergite',
                'Gneiss',
                'Dark Ochre',
                'Spodumain',
                'Crokite',
                'Arkonor',
                'Bistot')
            group by
                `invTypes`.`typeName`)) then 1
        when `character_minings`.`type_id` in (
        select
            `invTypes`.`typeID`
        from
            `invTypes`
        where
            `invTypes`.`groupID` in (
            select
                `invTypes`.`groupID`
            from
                `invTypes`
            where
                `invTypes`.`typeName` = 'Blue Ice')) then 2
        when `character_minings`.`type_id` in (
        select
            `invTypes`.`typeID`
        from
            `invTypes`
        where
            `invTypes`.`groupID` in (
            select
                `invTypes`.`groupID`
            from
                `invTypes`
            where
                `invTypes`.`typeName` in ('Bitumens',
                'Carnotite',
                'Chromite',
                'Cinnabar',
                'Cobaltite',
                'Coesite',
                'Euxenite',
                'Loparite',
                'Monazite',
                'Otavite',
                'Pollucite',
                'Scheelite',
                'Sperrylite',
                'Sylvite',
                'Titanite',
                'Vanadinite',
                'Xenotime',
                'Ytterbite',
                'Zeolites',
                'Zircon')
            group by
                `invTypes`.`typeName`)) then 3
        when `character_minings`.`type_id` in (
        select
            `invTypes`.`typeID`
        from
            `invTypes`
        where
            `invTypes`.`groupID` in (
            select
                `invTypes`.`groupID`
            from
                `invTypes`
            where
                `invTypes`.`typeName` = 'Fullerite-C540')) then 4
        when `character_minings`.`type_id` in (
        select
            `invTypes`.`typeID`
        from
            `invTypes`
        where
            `invTypes`.`groupID` in (
            select
                `invTypes`.`groupID`
            from
                `invTypes`
            where
                `invTypes`.`typeName` = 'Mercoxit'
            group by
                `invTypes`.`typeName`)) then 5
        else 0
    end AS `resourceType`
from
    `character_minings`CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `character_minings_view` AS
select
    `character_minings`.`character_id` AS `character_id`,
    `character_minings`.`date` AS `date`,
    `character_minings`.`time` AS `time`,
    `character_minings`.`year` AS `year`,
    `character_minings`.`month` AS `month`,
    `character_minings`.`solar_system_id` AS `solar_system_id`,
    `character_minings`.`type_id` AS `type_id`,
    `character_minings`.`quantity` AS `quantity`,
    `character_minings`.`created_at` AS `created_at`,
    `character_minings`.`updated_at` AS `updated_at`,
    case
        when `character_minings`.`type_id` in (
        select
            `invTypes`.`typeID`
        from
            `invTypes`
        where
            `invTypes`.`groupID` in (
            select
                `invTypes`.`groupID`
            from
                `invTypes`
            where
                `invTypes`.`typeName` in ('Veldspar',
                'Scordite',
                'Pyroxeres',
                'Plagioclase',
                'Omber',
                'Kernite',
                'Jaspet',
                'Hemorphite',
                'Hedbergite',
                'Gneiss',
                'Dark Ochre',
                'Spodumain',
                'Crokite',
                'Arkonor',
                'Bistot')
            group by
                `invTypes`.`typeName`)) then 1
        when `character_minings`.`type_id` in (
        select
            `invTypes`.`typeID`
        from
            `invTypes`
        where
            `invTypes`.`groupID` in (
            select
                `invTypes`.`groupID`
            from
                `invTypes`
            where
                `invTypes`.`typeName` = 'Blue Ice')) then 2
        when `character_minings`.`type_id` in (
        select
            `invTypes`.`typeID`
        from
            `invTypes`
        where
            `invTypes`.`groupID` in (
            select
                `invTypes`.`groupID`
            from
                `invTypes`
            where
                `invTypes`.`typeName` in ('Bitumens',
                'Carnotite',
                'Chromite',
                'Cinnabar',
                'Cobaltite',
                'Coesite',
                'Euxenite',
                'Loparite',
                'Monazite',
                'Otavite',
                'Pollucite',
                'Scheelite',
                'Sperrylite',
                'Sylvite',
                'Titanite',
                'Vanadinite',
                'Xenotime',
                'Ytterbite',
                'Zeolites',
                'Zircon')
            group by
                `invTypes`.`typeName`)) then 3
        when `character_minings`.`type_id` in (
        select
            `invTypes`.`typeID`
        from
            `invTypes`
        where
            `invTypes`.`groupID` in (
            select
                `invTypes`.`groupID`
            from
                `invTypes`
            where
                `invTypes`.`typeName` = 'Fullerite-C540')) then 4
        when `character_minings`.`type_id` in (
        select
            `invTypes`.`typeID`
        from
            `invTypes`
        where
            `invTypes`.`groupID` in (
            select
                `invTypes`.`groupID`
            from
                `invTypes`
            where
                `invTypes`.`typeName` = 'Mercoxit'
            group by
                `invTypes`.`typeName`)) then 5
        else 0
    end AS `resourceType`
from
    `character_minings`