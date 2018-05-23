#!/bin/bash

mysql -u root <create.sql
mysql -u root <trigger.sql
mysql -u root <insert.sql
mysql -u root <upiti.sql

