CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `view_MaxLinesPerCharacter` AS
select
    `view_ch_skills`.`character_id` AS `id`,
    if((
    select
        `view_ch_skills`.`active_skill_level`
    from
        `view_ch_skills`
    where
        `view_ch_skills`.`character_id` = `id`
        and `view_ch_skills`.`typeName` = 'Mass Production') is null,
    0,
    (
    select
        `view_ch_skills`.`active_skill_level`
    from
        `view_ch_skills`
    where
        `view_ch_skills`.`character_id` = `id`
        and `view_ch_skills`.`typeName` = 'Mass Production')) + if((
    select
        `view_ch_skills`.`active_skill_level`
    from
        `view_ch_skills`
    where
        `view_ch_skills`.`character_id` = `id`
        and `view_ch_skills`.`typeName` = 'Advanced Mass Production') is null,
    0,
    (
    select
        `view_ch_skills`.`active_skill_level`
    from
        `view_ch_skills`
    where
        `view_ch_skills`.`character_id` = `id`
        and `view_ch_skills`.`typeName` = 'Advanced Mass Production')) + 1 AS `max_Production`,
    if((
    select
        `view_ch_skills`.`active_skill_level`
    from
        `view_ch_skills`
    where
        `view_ch_skills`.`character_id` = `id`
        and `view_ch_skills`.`typeName` = 'Laboratory Operation') is null,
    0,
    (
    select
        `view_ch_skills`.`active_skill_level`
    from
        `view_ch_skills`
    where
        `view_ch_skills`.`character_id` = `id`
        and `view_ch_skills`.`typeName` = 'Laboratory Operation')) + if((
    select
        `view_ch_skills`.`active_skill_level`
    from
        `view_ch_skills`
    where
        `view_ch_skills`.`character_id` = `id`
        and `view_ch_skills`.`typeName` = 'Advanced Laboratory Operation') is null,
    0,
    (
    select
        `view_ch_skills`.`active_skill_level`
    from
        `view_ch_skills`
    where
        `view_ch_skills`.`character_id` = `id`
        and `view_ch_skills`.`typeName` = 'Advanced Laboratory Operation')) + 1 AS `max_Laboratory`,
    if((
    select
        `view_ch_skills`.`active_skill_level`
    from
        `view_ch_skills`
    where
        `view_ch_skills`.`character_id` = `id`
        and `view_ch_skills`.`typeName` = 'Mass Reactions') is null,
    0,
    (
    select
        `view_ch_skills`.`active_skill_level`
    from
        `view_ch_skills`
    where
        `view_ch_skills`.`character_id` = `id`
        and `view_ch_skills`.`typeName` = 'Mass Reactions')) + if((
    select
        `view_ch_skills`.`active_skill_level`
    from
        `view_ch_skills`
    where
        `view_ch_skills`.`character_id` = `id`
        and `view_ch_skills`.`typeName` = 'Advanced Mass Reactions') is null,
    0,
    (
    select
        `view_ch_skills`.`active_skill_level`
    from
        `view_ch_skills`
    where
        `view_ch_skills`.`character_id` = `id`
        and `view_ch_skills`.`typeName` = 'Advanced Mass Reactions')) + 1 AS `max_Reactions`
from
    `view_ch_skills`