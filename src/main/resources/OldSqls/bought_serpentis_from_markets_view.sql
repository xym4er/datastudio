CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `bought_serpentis_from_markets_view` AS
select
    '1' AS `stupid_datastudio`,
    sum(`corporation_wallet_transactions`.`quantity`) AS `qty`,
    min(`corporation_wallet_transactions`.`unit_price`) AS `min_price`,
    max(`corporation_wallet_transactions`.`unit_price`) AS `max_price`,
    round(sum(`corporation_wallet_transactions`.`quantity` * `corporation_wallet_transactions`.`unit_price`) / sum(`corporation_wallet_transactions`.`quantity`), 0) AS `ave_price`,
    sum(`corporation_wallet_transactions`.`quantity` * `corporation_wallet_transactions`.`unit_price`) AS `total_isk`
from
    `corporation_wallet_transactions`
where
    `corporation_wallet_transactions`.`type_id` = 42226
    and `corporation_wallet_transactions`.`date` > '2020-05-01'