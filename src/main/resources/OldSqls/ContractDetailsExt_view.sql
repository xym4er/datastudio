CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `ContractDetailsExt_view` AS
select
    `inv`.`typeName` AS `typeName`,
    `inv`.`groupID` AS `GroupId`,
    `ct`.`type_id` AS `type_id`,
    `ct`.`quantity` AS `quantity`,
    `cd`.`contract_id` AS `contract_id`,
    `cd`.`issuer_id` AS `issuer_id`,
    `cd`.`issuer_corporation_id` AS `issuer_corporation_id`,
    `cd`.`assignee_id` AS `assignee_id`,
    `cd`.`acceptor_id` AS `acceptor_id`,
    `cd`.`start_location_id` AS `start_location_id`,
    `cd`.`end_location_id` AS `end_location_id`,
    `cd`.`type` AS `type`,
    `cd`.`status` AS `status`,
    `cd`.`title` AS `title`,
    `cd`.`for_corporation` AS `for_corporation`,
    `cd`.`availability` AS `availability`,
    `cd`.`date_issued` AS `date_issued`,
    `cd`.`date_expired` AS `date_expired`,
    `cd`.`date_accepted` AS `date_accepted`,
    `cd`.`days_to_complete` AS `days_to_complete`,
    `cd`.`date_completed` AS `date_completed`,
    `cd`.`price` AS `price`,
    `cd`.`reward` AS `reward`,
    `cd`.`collateral` AS `collateral`,
    `cd`.`buyout` AS `buyout`,
    `cd`.`volume` AS `volume`,
    `cd`.`created_at` AS `created_at`,
    `cd`.`updated_at` AS `updated_at`
from
    ((`contract_items` `ct`
join `invTypes` `inv` on
    (`inv`.`typeID` = `ct`.`type_id`))
join `contract_details` `cd` on
    (`cd`.`contract_id` = `ct`.`contract_id`))