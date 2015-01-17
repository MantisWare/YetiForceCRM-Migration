/*This Script is changing an upgraded vTiger 6.1 database to a format accepted by YetiForce 1.1 migration*/

/* List existing forign keys
SELECT constraint_name, table_name FROM information_schema.table_constraints WHERE constraint_type =  'FOREIGN KEY'
AND table_schema =  'mig_bc'
ORDER BY constraint_name
*/

SET foreign_key_checks = 0;	

CREATE TABLE IF NOT EXISTS `vtiger_userscf` (
  `usersid` int(11) NOT NULL,
  PRIMARY KEY (`usersid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `vtiger_servicecontracts` (
  `servicecontractsid` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `sc_related_to` int(11) DEFAULT NULL,
  `tracking_unit` varchar(100) DEFAULT NULL,
  `total_units` decimal(5,2) DEFAULT NULL,
  `used_units` decimal(5,2) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `planned_duration` varchar(256) DEFAULT NULL,
  `actual_duration` varchar(256) DEFAULT NULL,
  `contract_status` varchar(200) DEFAULT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `contract_type` varchar(200) DEFAULT NULL,
  `progress` decimal(5,2) DEFAULT NULL,
  `contract_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `vtiger_servicecontractscf` (
  `servicecontractsid` int(11) NOT NULL,
  PRIMARY KEY (`servicecontractsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `vtiger_service` 
	ADD CONSTRAINT `fk_1_vtiger_service` 
	FOREIGN KEY (`serviceid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ;

ALTER TABLE `vtiger_assets` DROP FOREIGN KEY fk_1_vtiger_assets;

ALTER TABLE `vtiger_assets` 
	ADD CONSTRAINT `fk_1_vtiger_assets` 
	FOREIGN KEY (`assetsid`) REFERENCES `vtiger_crmentity` (`crmid`) ON DELETE CASCADE ;

ALTER TABLE `vtiger_contactdetails` 
	ADD KEY `contactdetails_accountid_idx`(`parentid`) ;

ALTER TABLE `vtiger_account` DROP FOREIGN KEY fk_1_vtiger_account
;
ALTER TABLE `vtiger_accountbillads` DROP FOREIGN KEY fk_1_vtiger_accountbillads
;
ALTER TABLE `vtiger_accountscf` DROP FOREIGN KEY fk_1_vtiger_accountscf
;
ALTER TABLE `vtiger_accountshipads` DROP FOREIGN KEY fk_1_vtiger_accountshipads
;
ALTER TABLE `vtiger_activity` DROP FOREIGN KEY fk_1_vtiger_activity
;
ALTER TABLE `vtiger_activityproductrel` DROP FOREIGN KEY fk_2_vtiger_activityproductrel
;
ALTER TABLE `vtiger_attachments` DROP FOREIGN KEY fk_1_vtiger_attachments
;
ALTER TABLE `vtiger_blocks` DROP FOREIGN KEY fk_1_vtiger_blocks
;
ALTER TABLE `vtiger_campaigncontrel` DROP FOREIGN KEY fk_2_vtiger_campaigncontrel
;
ALTER TABLE `vtiger_campaignleadrel` DROP FOREIGN KEY fk_2_vtiger_campaignleadrel
;
ALTER TABLE `vtiger_campaignscf` DROP FOREIGN KEY fk_1_vtiger_campaignscf
;
ALTER TABLE `vtiger_cntactivityrel` DROP FOREIGN KEY fk_2_vtiger_cntactivityrel
;
ALTER TABLE `vtiger_contactaddress` DROP FOREIGN KEY fk_1_vtiger_contactaddress
;
ALTER TABLE `vtiger_contactdetails` DROP FOREIGN KEY fk_1_vtiger_contactdetails
;
ALTER TABLE `vtiger_contactscf` DROP FOREIGN KEY fk_1_vtiger_contactscf
;
ALTER TABLE `vtiger_contactsubdetails` DROP FOREIGN KEY fk_1_vtiger_contactsubdetails
;
ALTER TABLE `vtiger_contpotentialrel` DROP FOREIGN KEY fk_2_vtiger_contpotentialrel
;
ALTER TABLE `vtiger_customaction` DROP FOREIGN KEY fk_1_vtiger_customaction
;
ALTER TABLE `vtiger_customerdetails` DROP FOREIGN KEY fk_1_vtiger_customerdetails
;
ALTER TABLE `vtiger_customview` DROP FOREIGN KEY fk_1_vtiger_customview
;
ALTER TABLE `vtiger_cvadvfilter` DROP FOREIGN KEY fk_1_vtiger_cvadvfilter
;
ALTER TABLE `vtiger_cvcolumnlist` DROP FOREIGN KEY fk_1_vtiger_cvcolumnlist
;
ALTER TABLE `vtiger_cvstdfilter` DROP FOREIGN KEY fk_1_vtiger_cvstdfilter
;
ALTER TABLE `vtiger_datashare_grp2grp` DROP FOREIGN KEY fk_3_vtiger_datashare_grp2grp
;
ALTER TABLE `vtiger_datashare_grp2role` DROP FOREIGN KEY fk_3_vtiger_datashare_grp2role
;
ALTER TABLE `vtiger_datashare_grp2rs` DROP FOREIGN KEY fk_3_vtiger_datashare_grp2rs
;
ALTER TABLE `vtiger_datashare_module_rel` DROP FOREIGN KEY fk_1_vtiger_datashare_module_rel
;
ALTER TABLE `vtiger_datashare_relatedmodules` DROP FOREIGN KEY fk_2_vtiger_datashare_relatedmodules
;
ALTER TABLE `vtiger_datashare_role2group` DROP FOREIGN KEY fk_3_vtiger_datashare_role2group
;
ALTER TABLE `vtiger_datashare_role2role` DROP FOREIGN KEY fk_3_vtiger_datashare_role2role
;
ALTER TABLE `vtiger_datashare_role2rs` DROP FOREIGN KEY fk_3_vtiger_datashare_role2rs
;
ALTER TABLE `vtiger_datashare_rs2grp` DROP FOREIGN KEY fk_3_vtiger_datashare_rs2grp
;
ALTER TABLE `vtiger_datashare_rs2role` DROP FOREIGN KEY fk_3_vtiger_datashare_rs2role
;
ALTER TABLE `vtiger_datashare_rs2rs` DROP FOREIGN KEY fk_3_vtiger_datashare_rs2rs
;
ALTER TABLE `vtiger_def_org_share` DROP FOREIGN KEY fk_1_vtiger_def_org_share
;
ALTER TABLE `vtiger_defaultcv` DROP FOREIGN KEY fk_1_vtiger_defaultcv
;
ALTER TABLE `vtiger_entityname` DROP FOREIGN KEY fk_1_vtiger_entityname
;
ALTER TABLE `vtiger_faq` DROP FOREIGN KEY fk_1_vtiger_faq
;
ALTER TABLE `vtiger_faqcf` DROP FOREIGN KEY fk_1_vtiger_faqcf
;
ALTER TABLE `vtiger_faqcomments` DROP FOREIGN KEY fk_1_vtiger_faqcomments
;
ALTER TABLE `vtiger_field` DROP FOREIGN KEY fk_1_vtiger_field
;
ALTER TABLE `vtiger_group2grouprel` DROP FOREIGN KEY fk_2_vtiger_group2grouprel
;
ALTER TABLE `vtiger_group2role` DROP FOREIGN KEY fk_2_vtiger_group2role
;
ALTER TABLE `vtiger_group2rs` DROP FOREIGN KEY fk_2_vtiger_group2rs
;
ALTER TABLE `vtiger_homedashbd` DROP FOREIGN KEY fk_1_vtiger_homedashbd
;
ALTER TABLE `vtiger_homedefault` DROP FOREIGN KEY fk_1_vtiger_homedefault
;
ALTER TABLE `vtiger_homemodule` DROP FOREIGN KEY fk_1_vtiger_homemodule
;
ALTER TABLE `vtiger_homemoduleflds` DROP FOREIGN KEY fk_1_vtiger_homemoduleflds
;
ALTER TABLE `vtiger_homerss` DROP FOREIGN KEY fk_1_vtiger_homerss
;
ALTER TABLE `vtiger_homestuff` DROP FOREIGN KEY fk_1_vtiger_homestuff
;
ALTER TABLE `vtiger_invoice` DROP FOREIGN KEY fk_2_vtiger_invoice
;
ALTER TABLE `vtiger_invoicebillads` DROP FOREIGN KEY fk_1_vtiger_invoicebillads
;
ALTER TABLE `vtiger_invoicecf` DROP FOREIGN KEY fk_1_vtiger_invoicecf
;
ALTER TABLE `vtiger_invoiceshipads` DROP FOREIGN KEY fk_1_vtiger_invoiceshipads
;
ALTER TABLE `vtiger_invoicestatushistory` DROP FOREIGN KEY fk_1_vtiger_invoicestatushistory
;
ALTER TABLE `vtiger_leadaddress` DROP FOREIGN KEY fk_1_vtiger_leadaddress
;
ALTER TABLE `vtiger_leaddetails` DROP FOREIGN KEY fk_1_vtiger_leaddetails
;
ALTER TABLE `vtiger_leadscf` DROP FOREIGN KEY fk_1_vtiger_leadscf
;
ALTER TABLE `vtiger_leadsubdetails` DROP FOREIGN KEY fk_1_vtiger_leadsubdetails
;
ALTER TABLE `vtiger_notes` DROP FOREIGN KEY fk_1_vtiger_notes
;
ALTER TABLE `vtiger_org_share_action2tab` DROP FOREIGN KEY fk_2_vtiger_org_share_action2tab
;
ALTER TABLE `vtiger_parenttabrel` DROP FOREIGN KEY fk_1_vtiger_parenttabrel
;
ALTER TABLE `vtiger_parenttabrel` DROP FOREIGN KEY fk_2_vtiger_parenttabrel
;
ALTER TABLE `vtiger_pobillads` DROP FOREIGN KEY fk_1_vtiger_pobillads
;
ALTER TABLE `vtiger_portalinfo` DROP FOREIGN KEY fk_1_vtiger_portalinfo
;
ALTER TABLE `vtiger_poshipads` DROP FOREIGN KEY fk_1_vtiger_poshipads
;
ALTER TABLE `vtiger_postatushistory` DROP FOREIGN KEY fk_1_vtiger_postatushistory
;
ALTER TABLE `vtiger_potential` DROP FOREIGN KEY fk_1_vtiger_potential
;
ALTER TABLE `vtiger_potentialscf` DROP FOREIGN KEY fk_1_vtiger_potentialscf
;
ALTER TABLE `vtiger_potstagehistory` DROP FOREIGN KEY fk_1_vtiger_potstagehistory
;
ALTER TABLE `vtiger_pricebook` DROP FOREIGN KEY fk_1_vtiger_pricebook
;
ALTER TABLE `vtiger_pricebookcf` DROP FOREIGN KEY fk_1_vtiger_pricebookcf
;
ALTER TABLE `vtiger_pricebookproductrel` DROP FOREIGN KEY fk_1_vtiger_pricebookproductrel
;
ALTER TABLE `vtiger_productcf` DROP FOREIGN KEY fk_1_vtiger_productcf
;
ALTER TABLE `vtiger_products` DROP FOREIGN KEY fk_1_vtiger_products
;
ALTER TABLE `vtiger_profile2globalpermissions` DROP FOREIGN KEY fk_1_vtiger_profile2globalpermissions
;
ALTER TABLE `vtiger_purchaseorder` DROP FOREIGN KEY fk_4_vtiger_purchaseorder
;
ALTER TABLE `vtiger_purchaseordercf` DROP FOREIGN KEY fk_1_vtiger_purchaseordercf
;
ALTER TABLE `vtiger_quotes` DROP FOREIGN KEY fk_3_vtiger_quotes
;
ALTER TABLE `vtiger_quotesbillads` DROP FOREIGN KEY fk_1_vtiger_quotesbillads
;
ALTER TABLE `vtiger_quotescf` DROP FOREIGN KEY fk_1_vtiger_quotescf
;
ALTER TABLE `vtiger_quotesshipads` DROP FOREIGN KEY fk_1_vtiger_quotesshipads
;
ALTER TABLE `vtiger_quotestagehistory` DROP FOREIGN KEY fk_1_vtiger_quotestagehistory
;
ALTER TABLE `vtiger_recurringevents` DROP FOREIGN KEY fk_1_vtiger_recurringevents
;
ALTER TABLE `vtiger_relcriteria` DROP FOREIGN KEY fk_1_vtiger_relcriteria
;
ALTER TABLE `vtiger_report` DROP FOREIGN KEY fk_2_vtiger_report
;
ALTER TABLE `vtiger_reportdatefilter` DROP FOREIGN KEY fk_1_vtiger_reportdatefilter
;
ALTER TABLE `vtiger_reportgroupbycolumn` DROP FOREIGN KEY fk_1_vtiger_reportgroupbycolumn
;
ALTER TABLE `vtiger_reportmodules` DROP FOREIGN KEY fk_1_vtiger_reportmodules
;
ALTER TABLE `vtiger_reportsortcol` DROP FOREIGN KEY fk_1_vtiger_reportsortcol
;
ALTER TABLE `vtiger_reportsummary` DROP FOREIGN KEY fk_1_vtiger_reportsummary
;
ALTER TABLE `vtiger_reporttype` DROP FOREIGN KEY fk_1_vtiger_reporttype
;
ALTER TABLE `vtiger_role2picklist` DROP FOREIGN KEY fk_1_vtiger_role2picklist
;
ALTER TABLE `vtiger_role2picklist` DROP FOREIGN KEY fk_2_vtiger_role2picklist
;
ALTER TABLE `vtiger_salesmanactivityrel` DROP FOREIGN KEY fk_2_vtiger_salesmanactivityrel
;
ALTER TABLE `vtiger_salesmanattachmentsrel` DROP FOREIGN KEY fk_2_vtiger_salesmanattachmentsrel
;
ALTER TABLE `vtiger_salesmanticketrel` DROP FOREIGN KEY fk_2_vtiger_salesmanticketrel
;
ALTER TABLE `vtiger_salesorder` DROP FOREIGN KEY fk_3_vtiger_salesorder
;
ALTER TABLE `vtiger_salesordercf` DROP FOREIGN KEY fk_1_vtiger_salesordercf
;
ALTER TABLE `vtiger_seactivityrel` DROP FOREIGN KEY fk_2_vtiger_seactivityrel
;
ALTER TABLE `vtiger_seattachmentsrel` DROP FOREIGN KEY fk_2_vtiger_seattachmentsrel
;
ALTER TABLE `vtiger_selectcolumn` DROP FOREIGN KEY fk_1_vtiger_selectcolumn
;
ALTER TABLE `vtiger_senotesrel` DROP FOREIGN KEY fk_2_vtiger_senotesrel
;
ALTER TABLE `vtiger_seproductsrel` DROP FOREIGN KEY fk_2_vtiger_seproductsrel
;
ALTER TABLE `vtiger_seticketsrel` DROP FOREIGN KEY fk_2_vtiger_seticketsrel
;
ALTER TABLE `vtiger_settings_field` DROP FOREIGN KEY fk_1_vtiger_settings_field
;
ALTER TABLE `vtiger_sobillads` DROP FOREIGN KEY fk_1_vtiger_sobillads
;
ALTER TABLE `vtiger_soshipads` DROP FOREIGN KEY fk_1_vtiger_soshipads
;
ALTER TABLE `vtiger_sostatushistory` DROP FOREIGN KEY fk_1_vtiger_sostatushistory
;
ALTER TABLE `vtiger_tab_info` DROP FOREIGN KEY fk_1_vtiger_tab_info
;
ALTER TABLE `vtiger_ticketcf` DROP FOREIGN KEY fk_1_vtiger_ticketcf
;
ALTER TABLE `vtiger_ticketcomments` DROP FOREIGN KEY fk_1_vtiger_ticketcomments
;
ALTER TABLE `vtiger_tmp_read_group_rel_sharing_per` DROP FOREIGN KEY fk_4_vtiger_tmp_read_group_rel_sharing_per
;
ALTER TABLE `vtiger_tmp_read_group_sharing_per` DROP FOREIGN KEY fk_3_vtiger_tmp_read_group_sharing_per
;
ALTER TABLE `vtiger_tmp_read_user_rel_sharing_per` DROP FOREIGN KEY fk_4_vtiger_tmp_read_user_rel_sharing_per
;
ALTER TABLE `vtiger_tmp_read_user_sharing_per` DROP FOREIGN KEY fk_3_vtiger_tmp_read_user_sharing_per
;
ALTER TABLE `vtiger_tmp_write_group_rel_sharing_per` DROP FOREIGN KEY fk_4_vtiger_tmp_write_group_rel_sharing_per
;
ALTER TABLE `vtiger_tmp_write_group_sharing_per` DROP FOREIGN KEY fk_3_vtiger_tmp_write_group_sharing_per
;
ALTER TABLE `vtiger_tmp_write_user_rel_sharing_per` DROP FOREIGN KEY fk_4_vtiger_tmp_write_user_rel_sharing_per
;
ALTER TABLE `vtiger_tmp_write_user_sharing_per` DROP FOREIGN KEY fk_3_vtiger_tmp_write_user_sharing_per
;
ALTER TABLE `vtiger_troubletickets` DROP FOREIGN KEY fk_1_vtiger_troubletickets
;
ALTER TABLE `vtiger_user_module_preferences` DROP FOREIGN KEY fk_2_vtiger_user_module_preferences
;
ALTER TABLE `vtiger_user2role` DROP FOREIGN KEY fk_2_vtiger_user2role
;
ALTER TABLE `vtiger_users2group` DROP FOREIGN KEY fk_2_vtiger_users2group
;
ALTER TABLE `vtiger_vendor` DROP FOREIGN KEY fk_1_vtiger_vendor
;
ALTER TABLE `vtiger_vendorcf` DROP FOREIGN KEY fk_1_vtiger_vendorcf
;
ALTER TABLE `vtiger_vendorcontactrel` DROP FOREIGN KEY fk_2_vtiger_vendorcontactrel
;
ALTER TABLE `vtiger_ws_entity_referencetype` DROP FOREIGN KEY vtiger_fk_1_actors_referencetype
;
ALTER TABLE `vtiger_ws_entity_tables` DROP FOREIGN KEY fk_1_vtiger_ws_actor_tables
;
ALTER TABLE `vtiger_ws_referencetype` DROP FOREIGN KEY fk_1_vtiger_referencetype
;

ALTER TABLE `com_vtiger_workflows` MODIFY `schtime`  varchar  (50)  COLLATE utf8_general_ci NULL 
;

ALTER TABLE `vtiger_calendar_default_activitytypes` MODIFY `id`  int  NOT NULL 
;
ALTER TABLE `vtiger_org_share_action2tab` DROP FOREIGN KEY `fk_2_vtiger_org_share_action2tab`
;
ALTER TABLE `vtiger_recurringevents` DROP FOREIGN KEY `fk_1_vtiger_recurringevents`
;
ALTER TABLE `vtiger_recurringevents` DROP FOREIGN KEY `fk_1_vtiger_reportgroupbycolumn`
;

ALTER TABLE `vtiger_calendar_user_activitytypes` MODIFY `id`  int  NOT NULL 
;

ALTER TABLE `vtiger_feedback` MODIFY `dontshow`  varchar  (19)  COLLATE utf8_general_ci NULL DEFAULT 'false'
;


ALTER TABLE `vtiger_field` MODIFY `summaryfield`  int  NOT NULL DEFAULT '0'
;


ALTER TABLE `vtiger_reporttype` MODIFY `reportid`  int  NOT NULL 
;
ALTER TABLE `vtiger_reporttype` MODIFY `data`  text  COLLATE utf8_general_ci NULL 
;

ALTER TABLE `vtiger_webforms` ADD `captcha`  int  NOT NULL DEFAULT 0
;
ALTER TABLE `vtiger_webforms` ADD `roundrobin`  int  NOT NULL DEFAULT 0
;
ALTER TABLE `vtiger_webforms` ADD `roundrobin_userid`  varchar  (256)  COLLATE utf8_general_ci NULL
;
ALTER TABLE `vtiger_webforms` ADD `roundrobin_logic`  int  NOT NULL DEFAULT 0
;

ALTER TABLE `vtiger_calendar_default_activitytypes` ADD 
PRIMARY KEY 
(
`id`
)
;

ALTER TABLE `vtiger_calendar_user_activitytypes` ADD 
PRIMARY KEY 
(
`id`
)
;

DROP INDEX fk_1_vtiger_def_org_share ON `vtiger_def_org_share`
;
DROP INDEX fk_2_vtiger_group2role ON `vtiger_group2role`
;
DROP INDEX fk_2_vtiger_group2rs ON `vtiger_group2rs`
;
DROP INDEX fk_1_vtiger_homestuff ON `vtiger_homestuff`
;
DROP INDEX fk_2_vtiger_invoice ON `vtiger_invoice`
;
DROP INDEX fk_2_vtiger_org_share_action2tab ON `vtiger_org_share_action2tab`
;
DROP INDEX fk_2_vtiger_parenttabrel ON `vtiger_parenttabrel`
;
DROP INDEX fk_1_vtiger_recurringevents ON `vtiger_recurringevents`
;
DROP INDEX fk_1_vtiger_reportgroupbycolumn ON `vtiger_reportgroupbycolumn`
;
DROP INDEX fk_1_vtiger_reportsortcol ON `vtiger_reportsortcol`
;
DROP INDEX fk_2_vtiger_role2picklist ON `vtiger_role2picklist`
;
DROP INDEX fk_1_vtiger_settings_field ON `vtiger_settings_field`
;
DROP INDEX fk_1_vtiger_tab_info ON `vtiger_tab_info`
;
DROP INDEX fk_2_vtiger_user_module_preferences ON `vtiger_user_module_preferences`
;
DROP INDEX fk_2_vtiger_users2group ON `vtiger_users2group`
;

ALTER TABLE `vtiger_activity` ADD INDEX `activityid` (`activityid`);
ALTER TABLE `vtiger_products` ADD INDEX `productid` (`productid`);

/*  delete table data that prevent the creation of foreign keys  */

DELETE `vtiger_activity_reminder` 
FROM   `vtiger_activity_reminder`
       LEFT JOIN `vtiger_activity` 
              ON `vtiger_activity`.`activityid` = `vtiger_activity_reminder`.`activity_id` 
WHERE  `vtiger_activity`.`activityid` IS NULL; 

DELETE `vtiger_activity_reminder_popup` 
FROM   `vtiger_activity_reminder_popup`
       LEFT JOIN `vtiger_activity` 
              ON `vtiger_activity`.`activityid` = `vtiger_activity_reminder_popup`.`recordid` 
WHERE  `vtiger_activity`.`activityid` IS NULL; 

DELETE `vtiger_activitycf` 
FROM   `vtiger_activitycf`
       LEFT JOIN `vtiger_activity` 
              ON `vtiger_activity`.`activityid` = `vtiger_activitycf`.`activityid` 
WHERE  `vtiger_activity`.`activityid` IS NULL; 

DELETE `vtiger_activityproductrel` 
FROM   `vtiger_activityproductrel`
       LEFT JOIN `vtiger_products`
              ON `vtiger_products`.`productid` = `vtiger_activityproductrel`.`productid`
WHERE  `vtiger_products`.`productid` IS NULL; 

DROP TABLE IF EXISTS `vtiger_ossmailscanner_config`, `vtiger_ossmailscanner_folders_uid`, `vtiger_ossmailscanner_log_cron`, `vtiger_ossmailscanner_log_scan`, `vtiger_ossmailview`, `vtiger_ossmailviewcf`, `vtiger_ossmailview_files`, `vtiger_ossmailview_sendtype`, `vtiger_ossmailview_sendtype_seq`, `vtiger_partnercf`, `vtiger_partner` ;
DROP TABLE IF EXISTS `roundcube_cache`, `roundcube_cache_index`, `roundcube_cache_messages`, `roundcube_cache_shared`, `roundcube_cache_thread`, `roundcube_contactgroupmembers`, `roundcube_contactgroups`, `roundcube_contacts`, `roundcube_dictionary`, `roundcube_identities`, `roundcube_searches`, `roundcube_session`, `roundcube_system`, `roundcube_users`;

/* Not needed when system was used before
DROP TABLE IF EXISTS `vtiger_parenttabrel` ;

CREATE TABLE IF NOT EXISTS `vtiger_parenttabrel` (
  `parenttabid` int(19) NOT NULL,
  `tabid` int(19) NOT NULL,
  `sequence` int(3) NOT NULL,
  KEY `parenttabrel_tabid_parenttabid_idx` (`tabid`,`parenttabid`),
  KEY `fk_2_vtiger_parenttabrel` (`parenttabid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

TRUNCATE TABLE `vtiger_parenttab`;
TRUNCATE TABLE `vtiger_tab`;

--
-- Constraints for table `vtiger_parenttabrel`
--
ALTER TABLE `vtiger_parenttabrel`
  ADD CONSTRAINT `fk_2_vtiger_parenttabrel` FOREIGN KEY (`parenttabid`) REFERENCES `vtiger_parenttab` (`parenttabid`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_1_vtiger_parenttabrel` FOREIGN KEY (`tabid`) REFERENCES `vtiger_tab` (`tabid`) ON DELETE CASCADE;

--
-- Dumping data for table `vtiger_parenttabrel`
--

INSERT INTO `vtiger_parenttabrel` (`parenttabid`, `tabid`, `sequence`) VALUES
(1, 9, 2),
(1, 28, 4),
(1, 3, 1),
(3, 7, 1),
(3, 6, 2),
(3, 4, 3),
(3, 2, 4),
(3, 20, 5),
(3, 22, 6),
(3, 23, 7),
(3, 19, 8),
(3, 8, 9),
(4, 13, 1),
(4, 15, 2),
(4, 6, 3),
(4, 4, 4),
(4, 8, 5),
(5, 1, 2),
(5, 25, 1),
(6, 14, 1),
(6, 18, 2),
(6, 19, 3),
(6, 21, 4),
(6, 22, 5),
(6, 20, 6),
(6, 23, 7),
(7, 24, 1),
(7, 27, 2),
(7, 8, 3),
(2, 26, 1),
(2, 6, 2),
(2, 4, 3),
(2, 28, 4),
(4, 28, 7),
(2, 7, 5),
(2, 9, 6),
(4, 9, 8),
(2, 8, 8),
(3, 9, 11),
(4, 32, 9),
(6, 33, 8),
(7, 34, 4),
(7, 37, 5),
(7, 39, 6),
(7, 40, 7),
(4, 42, 10),
(4, 43, 11),
(4, 44, 12),
(7, 46, 8),
(6, 47, 9),
(8, 48, 1),
(8, 48, 2),
(7, 49, 9),
(7, 49, 10);
*/

SET foreign_key_checks = 1;	
	