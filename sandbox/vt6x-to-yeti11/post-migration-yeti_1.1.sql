SET foreign_key_checks = 0;

CREATE TABLE IF NOT EXISTS `vtiger_max_search_result`
(
`value`  int  NULL
)
;

ALTER TABLE `vtiger_osssoldservices` DROP PRIMARY KEY
;
ALTER TABLE `vtiger_osssoldservices` MODIFY `contact`  int  NULL 
;

ALTER TABLE `vtiger_invoiceaddress` DROP FOREIGN KEY vtiger_invoiceaddress_ibfk_1
;
ALTER TABLE `vtiger_purchaseorderaddress` DROP FOREIGN KEY vtiger_purchaseorderaddress_ibfk_1
;
DROP INDEX activityid ON `vtiger_activity`
;
ALTER TABLE `vtiger_loginhistory` ADD `browser`  varchar  (25)  COLLATE utf8_general_ci NULL 
;
ALTER TABLE `vtiger_loginhistory` ADD `unblock`  tinyint  NULL DEFAULT '0'
;
ALTER TABLE `vtiger_osssoldservices` DROP PRIMARY KEY
;
DROP INDEX potentail_sales_stage_amount_idx ON `vtiger_potential`
;
ALTER TABLE `vtiger_calendar_default_activitytypes` MODIFY `module`  varchar  (50)  COLLATE utf8_general_ci NULL 
;
ALTER TABLE `vtiger_calendar_default_activitytypes` MODIFY `fieldname`  varchar  (50)  COLLATE utf8_general_ci NULL 
;
ALTER TABLE `vtiger_calendar_default_activitytypes` MODIFY `defaultcolor`  varchar  (50)  COLLATE utf8_general_ci NULL 
;
ALTER TABLE `vtiger_modcomments` MODIFY `modcommentsid`  int  NOT NULL 
;
ALTER TABLE `vtiger_modcomments` MODIFY `parent_comments`  int  NULL 
;
ALTER TABLE `vtiger_modcomments` MODIFY `userid`  int  NULL 
;
ALTER TABLE `vtiger_osssoldservices` DROP PRIMARY KEY
;
ALTER TABLE `vtiger_osssoldservices` MODIFY `contact`  int  NULL 
;
ALTER TABLE `vtiger_users` MODIFY `defaulteventstatus`  varchar  (50)  COLLATE utf8_general_ci NULL DEFAULT 'Planned'
;
ALTER TABLE `vtiger_calendar_user_activitytypes` MODIFY `color`  varchar  (50)  COLLATE utf8_general_ci NULL 
;
ALTER TABLE `vtiger_potential` MODIFY `sum_time`  decimal  (13,2)  NULL DEFAULT '0.00'
;
ALTER TABLE `vtiger_potential` MODIFY `sum_time_so`  decimal  (13,2)  NULL DEFAULT '0.00'
;
ALTER TABLE `vtiger_potential` MODIFY `sum_time_q`  decimal  (13,2)  NULL DEFAULT '0.00'
;
ALTER TABLE `vtiger_potential` MODIFY `sum_time_all`  decimal  (13,2)  NULL DEFAULT '0.00'
;
ALTER TABLE `vtiger_potential` MODIFY `sum_time_k`  decimal  (13,2)  NULL DEFAULT '0.00'
;
ALTER TABLE `vtiger_potential` MODIFY `sum_quotes`  decimal  (25,8)  NULL DEFAULT '0.00000000'
;
ALTER TABLE `vtiger_potential` MODIFY `sum_salesorders`  decimal  (25,8)  NULL DEFAULT '0.00000000'
;
ALTER TABLE `vtiger_potential` MODIFY `sum_invoices`  decimal  (25,8)  NULL DEFAULT '0.00000000'
;
ALTER TABLE `vtiger_potential` MODIFY `sum_calculations`  decimal  (25,8)  NULL DEFAULT '0.00000000'
;
DROP INDEX productid ON `vtiger_products`
;
ALTER TABLE `vtiger_projectmilestone` DROP PRIMARY KEY
;
ALTER TABLE `vtiger_projectmilestone` MODIFY `projectid`  int  NULL 
;
ALTER TABLE `vtiger_shareduserinfo` MODIFY `color`  varchar  (50)  COLLATE utf8_general_ci NULL 
;
ALTER TABLE `vtiger_webforms` MODIFY `roundrobin_userid`  varchar  (256)  COLLATE utf8_general_ci NULL 
;
DROP INDEX fk_1_vtiger_webforms_field ON `vtiger_webforms_field`
;
ALTER TABLE `vtiger_webforms_field` ADD `sequence`  int  NULL 
;
ALTER TABLE `vtiger_webforms_field` ADD `hidden`  int  NULL 
;
ALTER TABLE `vtiger_contactaddress` ADD CONSTRAINT fk_1_vtiger_contactaddress FOREIGN KEY 
(
contactaddressid
) 
REFERENCES vtiger_contactdetails 
(
contactid
)
;

ALTER TABLE `vtiger_contactscf` ADD CONSTRAINT fk_1_vtiger_contactscf FOREIGN KEY 
(
contactid
) 
REFERENCES vtiger_contactdetails 
(
contactid
)
;

ALTER TABLE `vtiger_invoiceaddress` ADD CONSTRAINT vtiger_invoiceaddress_ibfk_1 FOREIGN KEY 
(
invoiceaddressid
) 
REFERENCES vtiger_crmentity 
(
crmid
)
;

ALTER TABLE `vtiger_leadaddress` ADD CONSTRAINT fk_1_vtiger_leadaddress FOREIGN KEY 
(
leadaddressid
) 
REFERENCES vtiger_leaddetails 
(
leadid
)
;

ALTER TABLE `vtiger_leadscf` ADD CONSTRAINT fk_1_vtiger_leadscf FOREIGN KEY 
(
leadid
) 
REFERENCES vtiger_leaddetails 
(
leadid
)
;

ALTER TABLE `vtiger_leadsubdetails` ADD CONSTRAINT fk_1_vtiger_leadsubdetails FOREIGN KEY 
(
leadsubscriptionid
) 
REFERENCES vtiger_leaddetails 
(
leadid
)
;

CREATE INDEX linkid
ON `vtiger_links`
(
linkid, 
tabid, 
linktype, 
linklabel
)
;
CREATE INDEX linklabel
ON `vtiger_links`
(
linklabel
)
;

CREATE INDEX user_name
ON `vtiger_loginhistory`
(
user_name
)
;

CREATE INDEX modcommentsid
ON `vtiger_modcomments`
(
modcommentsid
)
;
CREATE INDEX parent_comments
ON `vtiger_modcomments`
(
parent_comments
)
;
ALTER TABLE `vtiger_modcomments` ADD 
PRIMARY KEY 
(
`modcommentsid`
)
;
CREATE INDEX related_to
ON `vtiger_modcomments`
(
related_to, 
parent_comments
)
;

CREATE INDEX userid
ON `vtiger_modcomments`
(
userid
)
;

ALTER TABLE `vtiger_modcomments` ADD CONSTRAINT vtiger_modcomments_ibfk_1 FOREIGN KEY 
(
related_to
) 
REFERENCES vtiger_crmentity 
(
crmid
)
;

ALTER TABLE `vtiger_modcommentscf` ADD CONSTRAINT vtiger_modcommentscf_ibfk_1 FOREIGN KEY 
(
modcommentsid
) 
REFERENCES vtiger_modcomments 
(
modcommentsid
)
;

CREATE INDEX crmid
ON `vtiger_modtracker_basic`
(
crmid, 
changedon
)
;
CREATE INDEX id
ON `vtiger_modtracker_basic`
(
id, 
module, 
changedon
)
;

ALTER TABLE `vtiger_notes` ADD CONSTRAINT fk_1_vtiger_notes FOREIGN KEY 
(
notesid
) 
REFERENCES vtiger_crmentity 
(
crmid
)
;

ALTER TABLE `vtiger_notescf` ADD CONSTRAINT vtiger_notescf_ibfk_1 FOREIGN KEY 
(
notesid
) 
REFERENCES vtiger_notes 
(
notesid
)
;

ALTER TABLE `vtiger_org_share_action2tab` ADD CONSTRAINT fk_2_vtiger_org_share_action2tab FOREIGN KEY 
(
tabid
) 
REFERENCES vtiger_tab 
(
tabid
)
;

CREATE INDEX campaignid
ON `vtiger_potential`
(
campaignid
)
;
CREATE INDEX potentail_sales_stage_amount_idx
ON `vtiger_potential`
(
sales_stage
)
;
CREATE INDEX productid
ON `vtiger_potential`
(
productid
)
;
CREATE INDEX sum_calculations
ON `vtiger_potential`
(
sum_calculations
);

CREATE INDEX sum_invoices
ON `vtiger_potential`
(
sum_invoices
)
;
CREATE INDEX sum_quotes
ON `vtiger_potential`
(
sum_quotes
)
;
CREATE INDEX sum_salesorders
ON `vtiger_potential`
(
sum_salesorders
)
;

ALTER TABLE `vtiger_potential` ADD CONSTRAINT fk_1_vtiger_potential FOREIGN KEY 
(
potentialid
) 
REFERENCES vtiger_crmentity 
(
crmid
)
;

ALTER TABLE `vtiger_potentialscf` ADD CONSTRAINT fk_1_vtiger_potentialscf FOREIGN KEY 
(
potentialid
) 
REFERENCES vtiger_potential 
(
potentialid
)
;

ALTER TABLE `vtiger_potstagehistory` ADD CONSTRAINT fk_1_vtiger_potstagehistory FOREIGN KEY 
(
potentialid
) 
REFERENCES vtiger_potential 
(
potentialid
)
;

ALTER TABLE `vtiger_pricebook` ADD CONSTRAINT fk_1_vtiger_pricebook FOREIGN KEY 
(
pricebookid
) 
REFERENCES vtiger_crmentity 
(
crmid
)
;

ALTER TABLE `vtiger_pricebookcf` ADD CONSTRAINT fk_1_vtiger_pricebookcf FOREIGN KEY 
(
pricebookid
) 
REFERENCES vtiger_pricebook 
(
pricebookid
)
;

ALTER TABLE `vtiger_pricebookproductrel` ADD CONSTRAINT fk_1_vtiger_pricebookproductrel FOREIGN KEY 
(
pricebookid
) 
REFERENCES vtiger_pricebook 
(
pricebookid
)
;

ALTER TABLE `vtiger_productcf` ADD CONSTRAINT fk_1_vtiger_productcf FOREIGN KEY 
(
productid
) 
REFERENCES vtiger_products 
(
productid
)
;

CREATE INDEX productid
ON `vtiger_productcurrencyrel`
(
productid
)
;

ALTER TABLE `vtiger_profile2field` ADD CONSTRAINT vtiger_profile2field_ibfk_1 FOREIGN KEY 
(
profileid
) 
REFERENCES vtiger_profile 
(
profileid
)
;

ALTER TABLE `vtiger_profile2globalpermissions` ADD CONSTRAINT fk_1_vtiger_profile2globalpermissions FOREIGN KEY 
(
profileid
) 
REFERENCES vtiger_profile 
(
profileid
)
;

ALTER TABLE `vtiger_profile2tab` ADD CONSTRAINT vtiger_profile2tab_ibfk_1 FOREIGN KEY 
(
profileid
) 
REFERENCES vtiger_profile 
(
profileid
)
;

ALTER TABLE `vtiger_profile2utility` ADD CONSTRAINT vtiger_profile2utility_ibfk_1 FOREIGN KEY 
(
profileid
) 
REFERENCES vtiger_profile 
(
profileid
)
;

ALTER TABLE `vtiger_projectmilestone` ADD 
PRIMARY KEY 
(
`projectmilestoneid`
)
;
CREATE INDEX projectid
ON `vtiger_projectmilestone`
(
projectid
)
;

ALTER TABLE `vtiger_projectmilestone` ADD CONSTRAINT vtiger_projectmilestone_ibfk_1 FOREIGN KEY 
(
projectmilestoneid
) 
REFERENCES vtiger_crmentity 
(
crmid
)
;

ALTER TABLE `vtiger_projectmilestonecf` ADD CONSTRAINT vtiger_projectmilestonecf_ibfk_1 FOREIGN KEY 
(
projectmilestoneid
) 
REFERENCES vtiger_projectmilestone 
(
projectmilestoneid
)
;

ALTER TABLE `vtiger_projecttaskcf` ADD CONSTRAINT vtiger_projecttaskcf_ibfk_1 FOREIGN KEY 
(
projecttaskid
) 
REFERENCES vtiger_projecttask 
(
projecttaskid
)
;

ALTER TABLE `vtiger_purchaseorderaddress` ADD CONSTRAINT vtiger_purchaseorderaddress_ibfk_1 FOREIGN KEY 
(
purchaseorderaddressid
) 
REFERENCES vtiger_crmentity 
(
crmid
)
;

ALTER TABLE `vtiger_purchaseordercf` ADD CONSTRAINT fk_1_vtiger_purchaseordercf FOREIGN KEY 
(
purchaseorderid
) 
REFERENCES vtiger_purchaseorder 
(
purchaseorderid
)
;

ALTER TABLE `vtiger_quotescf` ADD CONSTRAINT fk_1_vtiger_quotescf FOREIGN KEY 
(
quoteid
) 
REFERENCES vtiger_quotes 
(
quoteid
)
;

ALTER TABLE `vtiger_quotestagehistory` ADD CONSTRAINT fk_1_vtiger_quotestagehistory FOREIGN KEY 
(
quoteid
) 
REFERENCES vtiger_quotes 
(
quoteid
)
;

ALTER TABLE `vtiger_recurringevents` ADD CONSTRAINT fk_1_vtiger_recurringevents FOREIGN KEY 
(
activityid
) 
REFERENCES vtiger_activity 
(
activityid
)
;

CREATE INDEX related_tabid
ON `vtiger_relatedlists`
(
related_tabid
)
;
CREATE INDEX tabid
ON `vtiger_relatedlists`
(
tabid
)
;
CREATE INDEX tabid_2
ON `vtiger_relatedlists`
(
tabid, 
related_tabid
)
;
CREATE INDEX tabid_3
ON `vtiger_relatedlists`
(
tabid, 
related_tabid, 
label
)
;
CREATE INDEX tabid_4
ON `vtiger_relatedlists`
(
tabid, 
related_tabid, 
presence
)
;

ALTER TABLE `vtiger_relcriteria` ADD CONSTRAINT fk_1_vtiger_relcriteria FOREIGN KEY 
(
queryid
) 
REFERENCES vtiger_selectquery 
(
queryid
)
;

CREATE INDEX queryid
ON `vtiger_relcriteria_grouping`
(
queryid
)
;

ALTER TABLE `vtiger_relcriteria_grouping` ADD CONSTRAINT vtiger_relcriteria_grouping_ibfk_1 FOREIGN KEY 
(
queryid
) 
REFERENCES vtiger_relcriteria 
(
queryid
)
;

ALTER TABLE `vtiger_report` ADD CONSTRAINT fk_2_vtiger_report FOREIGN KEY 
(
queryid
) 
REFERENCES vtiger_selectquery 
(
queryid
)
;

ALTER TABLE `vtiger_reportdatefilter` ADD CONSTRAINT fk_1_vtiger_reportdatefilter FOREIGN KEY 
(
datefilterid
) 
REFERENCES vtiger_report 
(
reportid
)
;

ALTER TABLE `vtiger_users` ADD 
CONSTRAINT email1 UNIQUE 
(
`email1`
)
;

ALTER TABLE `vtiger_webforms_field` ADD CONSTRAINT fk_1_vtiger_webforms_field FOREIGN KEY 
(
webformid
) 
REFERENCES vtiger_webforms 
(
id
)
;
ALTER TABLE `vtiger_webforms_field` ADD CONSTRAINT fk_3_vtiger_webforms_field FOREIGN KEY 
(
fieldname
) 
REFERENCES vtiger_field 
(
fieldname
)
;
CREATE INDEX related_to
ON `vtiger_modcomments`
(
related_to, 
parent_comments
)
;
CREATE INDEX userid
ON `vtiger_modcomments`
(
userid
)
;

CREATE INDEX potentail_sales_stage_amount_idx
ON `vtiger_potential`
(
sales_stage
)
;

ALTER TABLE `vtiger_projectmilestone` ADD 
PRIMARY KEY 
(
`projectmilestoneid`
)
;
CREATE INDEX projectid
ON `vtiger_projectmilestone`
(
projectid
)
;

SET foreign_key_checks = 1;

