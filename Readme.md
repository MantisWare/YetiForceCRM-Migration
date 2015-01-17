
### Scripts to migrate vTiger 6.x to YetiForce 1.1


#### You follow these steps to migrate a vTiger 6.1 system, that was upgraded from version 6.0, to YetiForce 1.1.


1. Make a backup of your existing system, both files and database!!!!!!!  **ONCE STARTED THERE IS NO WAY BACK!!**

2. Enable all standard modules

3. Install the PBXManager module from '[vt61 web_dir]/packages/vtiger/mandatory'

4. Copy the YetiForce 1.1 files into an empty web folder

5. Copy files 'pre-migration-yeti_1.1.sql', 'VT610_to_YT100_update.sql', 'post-migration-yeti_1.1.sql', 'VT610_to_YT100.php' into folder = [yeti web dir]/install/migrate_schema

4. Prepare VT 6.1 database for migration using command = mysql -f -u _[username]_ -p[password] [database]_ < pre-migration-yeti_1.1.sql 
   Note: Ignore error messages

5. Apply Yeti 1.1 DB schema changes using command = mysql -f -u _[username]_ -p[password] _[database]_ < VT610_to_YT100_update.sql
   Important: You'll need to take care of any errors before continue with next step

6. Run YetiForce 1.1 web based migration process

5. Correct DB schema  = mysql -f -u _[username]_ -p[password] _[database]_ < post-migration-yeti_1.1.sql
   Note: Ignore error messages


**Tip: At first login to YetiForce 1.1 you may get a page showing html code with an error message of 'invalid object'. In order to overcome this problem, install a clean YetiForce 1.1 instance and then switch the database to the migrated one.**