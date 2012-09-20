-- MySQL dump 10.13  Distrib 5.5.24, for Linux (x86_64)
--
-- Host: test.liquidpub.org    Database: phdcourse
-- ------------------------------------------------------
-- Server version	5.0.51a-24+lenny5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `country_ID` int(11) NOT NULL auto_increment,
  `name` varchar(255) character set latin1 NOT NULL default 'UNKNOWN',
  `region` varchar(200) character set latin1 NOT NULL default 'UNKNOWN',
  `citizenship` varchar(255) character set latin1 NOT NULL default 'UNKNOWN',
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`country_ID`),
  UNIQUE KEY `name_countries_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Italy','Europe','Italian',0),(2,'USA','North America','American',0);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_ID` int(11) NOT NULL auto_increment,
  `notes` text character set latin1,
  `actual_start_date` date default NULL,
  `institution` varchar(255) character set latin1 NOT NULL default 'UNKNOWN',
  `place` varchar(255) character set latin1 NOT NULL default 'UNKNOWN',
  `credits` int(11) default '0',
  `course_name` varchar(200) character set latin1 NOT NULL default 'UNKNOWN',
  `academic_year` int(11) NOT NULL default '0',
  `is_in_manifesto` tinyint(1) NOT NULL default '0',
  `is_by_UNITN` tinyint(1) NOT NULL default '0',
  `is_paid` tinyint(1) default NULL,
  `budgeted_cost` int(11) NOT NULL default '0',
  `actual_cost` int(11) NOT NULL default '0',
  `planned_course_period` varchar(255) character set latin1 NOT NULL default 'UNKNOWN' COMMENT 'EG summer 2013',
  `are_all_marks_defined` tinyint(1) NOT NULL default '0' COMMENT 'have all students been graded?',
  `url` varchar(255) character set latin1 NOT NULL default 'UNKNOWN',
  `is_payment_completed` tinyint(1) NOT NULL default '0' COMMENT 'did the guy get the money?',
  `deleted` tinyint(1) NOT NULL default '0',
  `professor` int(11) default NULL,
  PRIMARY KEY  (`course_ID`),
  KEY `Professor` (`professor`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`professor`) REFERENCES `supervisors` (`supervisor_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=147243 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--


--
-- Table structure for table `courses_enrollments`
--

DROP TABLE IF EXISTS `courses_enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_enrollments` (
  `enrollment_ID` int(11) NOT NULL auto_increment,
  `qualification` varchar(30) character set latin1 NOT NULL default 'UNKNOWN',
  `is_finished` tinyint(1) default NULL,
  `credits` int(11) default NULL,
  `enrolled_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `course` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  `approved_at` datetime default NULL,
  PRIMARY KEY  (`enrollment_ID`),
  KEY `index_courses_users_on_course_id` (`qualification`),
  KEY `index_courses_users_on_user_id` (`is_finished`),
  KEY `index_courses_users_on_course_id_and_user_id` (`qualification`,`is_finished`),
  KEY `fk_courses_enrollments_courses1` (`course`),
  KEY `fk_courses_enrollments_students1` (`student`),
  CONSTRAINT `fk_courses_enrollments_courses1` FOREIGN KEY (`course`) REFERENCES `courses` (`course_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_enrollments_students1` FOREIGN KEY (`student`) REFERENCES `students` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `funding_institutions`
--

DROP TABLE IF EXISTS `funding_institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_institutions` (
  `funding_institution_ID` int(11) NOT NULL auto_increment,
  `name` varchar(200) character set latin1 NOT NULL default 'UNKNOWN' COMMENT 'Who pays their scholarship',
  `deleted` tinyint(1) NOT NULL default '0',
  `type` varchar(20) character set latin1 NOT NULL default 'UNKNOWN',
  PRIMARY KEY  (`funding_institution_ID`),
  UNIQUE KEY `funding_institution_name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funding_institutions`
--

LOCK TABLES `funding_institutions` WRITE;
/*!40000 ALTER TABLE `funding_institutions` DISABLE KEYS */;
INSERT INTO `funding_institutions` VALUES (1,'DISI',0,'internal');
/*!40000 ALTER TABLE `funding_institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `user_ID` int(11) NOT NULL auto_increment,
  `first_name` varchar(120) character set latin1 NOT NULL default 'UNKNOWN' COMMENT 'First and middle name',
  `last_name` varchar(300) character set latin1 NOT NULL default 'UNKNOWN' COMMENT 'family name',
  `full_name` varchar(500) character set latin1 NOT NULL default 'UNKNOWN' COMMENT 'name as we want it displayed',
  `phd_cycle` varchar(10) character set latin1 NOT NULL default 'UNKNOWN',
  `is_suspended` tinyint(1) NOT NULL default '0',
  `course_year` int(3) NOT NULL default '0' COMMENT '1,2,3,4,5',
  `admitted_conditionally` tinyint(1) NOT NULL default '0',
  `legal_residence` varchar(500) character set latin1 NOT NULL default 'UNKNOWN',
  `current_domicile` varchar(500) character set latin1 NOT NULL default 'UNKNOWN',
  `date_of_birth` date default NULL,
  `place_of_birth` varchar(300) character set latin1 NOT NULL default 'UNKNOWN',
  `office_phone` varchar(100) character set latin1 NOT NULL default 'UNKNOWN',
  `mobile_phone` varchar(100) character set latin1 NOT NULL default 'UNKNOWN',
  `office_working_place` varchar(200) character set latin1 NOT NULL default 'UNKNOWN' COMMENT 'P1-S5-14 (Pvo1 - Open space 5 - desk 14)',
  `locker_number` varchar(60) character set latin1 NOT NULL default 'UNKNOWN',
  `phd_scholarship` tinyint(1) default NULL,
  `scholarship_type` varchar(500) character set latin1 NOT NULL default 'UNKNOWN' COMMENT 'Specify name of the grant + fund number',
  `yearly_fee_to_center` int(6) NOT NULL default '0',
  `yearly_fee_to_school` int(6) NOT NULL default '0',
  `has_pc_rights` tinyint(1) NOT NULL default '0' COMMENT 'Has the right to receive a pc?',
  `pre_doctoral_scholarship` varchar(500) character set latin1 default NULL COMMENT 'Specify name fund + fund number ',
  `months_predoc_scholarship` int(2) NOT NULL default '0' COMMENT 'Nr. months of predoc scholarship - maximum 6 months',
  `year_extension_scholarship` varchar(100) character set latin1 NOT NULL default '0' COMMENT 'Specify name fund + fund number',
  `months` int(2) NOT NULL default '0' COMMENT 'maximum 12 months',
  `personal_funds_available` int(10) NOT NULL default '0' COMMENT '750 granted at registration, other 750 when admitted to the second yr',
  `is_graduated` tinyint(1) NOT NULL default '0',
  `graduation_date` date default NULL,
  `commitee_members` varchar(20) character set latin1 NOT NULL default 'UNKNOWN' COMMENT 'Commitee members separated by comma',
  `email` varchar(200) character set latin1 NOT NULL default 'UNKNOWN',
  `deleted` tinyint(1) NOT NULL default '0',
  `funding_institution` int(11) NOT NULL COMMENT 'DISI, UNITN, Fbk...ecc',
  `university` int(11) NOT NULL,
  `country_of_provenance` int(11) NOT NULL,
  `university_of_provenance` int(11) NOT NULL,
  `citizenship` int(11) NOT NULL,
  `current_advisor` int(11) NOT NULL,
  `tutor` int(11) NOT NULL,
  `funds_owner` int(11) NOT NULL,
  `Italian_Taxpayer_Code` int(11) default NULL,
  `photo_profile` varchar(255) default NULL,
  `is_plan_approved` tinyint(1) default NULL,
  PRIMARY KEY  (`user_ID`),
  KEY `fk_students_universities` (`university`),
  KEY `fk_funding_institution` (`funding_institution`),
  KEY `fk_students_countries1` (`country_of_provenance`),
  KEY `fk_student_university_provenance` (`university_of_provenance`),
  KEY `fk_student_citizenship` (`citizenship`),
  KEY `fk_students_supervisors1` (`current_advisor`),
  KEY `fk_students_supervisors2` (`tutor`),
  KEY `fk_students_supervisors3` (`funds_owner`),
  CONSTRAINT `fk_students_supervisors1` FOREIGN KEY (`current_advisor`) REFERENCES `supervisors` (`supervisor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_supervisors2` FOREIGN KEY (`tutor`) REFERENCES `supervisors` (`supervisor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_supervisors3` FOREIGN KEY (`funds_owner`) REFERENCES `supervisors` (`supervisor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_citizenship` FOREIGN KEY (`citizenship`) REFERENCES `countries` (`country_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_country` FOREIGN KEY (`country_of_provenance`) REFERENCES `countries` (`country_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_funding_institution` FOREIGN KEY (`funding_institution`) REFERENCES `funding_institutions` (`funding_institution_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_university` FOREIGN KEY (`university`) REFERENCES `universities` (`university_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_university_provenance` FOREIGN KEY (`university_of_provenance`) REFERENCES `universities` (`university_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `supervisors`
--

DROP TABLE IF EXISTS `supervisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisors` (
  `supervisor_ID` int(11) NOT NULL auto_increment,
  `first_name` varchar(200) character set latin1 NOT NULL default 'UNKNOWN',
  `last_name` varchar(200) character set latin1 NOT NULL default 'UNKNOWN',
  `can_be_advisor` tinyint(1) NOT NULL default '0',
  `is_active` tinyint(1) NOT NULL default '0',
  `is_internal` tinyint(1) NOT NULL default '0',
  `email` varchar(200) character set latin1 NOT NULL default 'UNKNOWN',
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`supervisor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisors`
--

LOCK TABLES `supervisors` WRITE;
/*!40000 ALTER TABLE `supervisors` DISABLE KEYS */;
INSERT INTO `supervisors` VALUES (1,'Joe','Doe',1,1,1,'joe.doe@gmail.com',0);
/*!40000 ALTER TABLE `supervisors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trips` (
  `trip_ID` int(11) NOT NULL auto_increment,
  `academic_year_id` int(11) default NULL,
  `Date_of_request` date default NULL,
  `Planned_start_date` date NOT NULL,
  `Planned_Reason_for_Travel` varchar(255) character set latin1 default NULL,
  `status` varchar(255) character set latin1 NOT NULL default 'UNKNOWN',
  `Planned_end_date` date NOT NULL,
  `Planned_destination` varchar(255) character set latin1 default NULL,
  `Planned_means_of_transport` varchar(255) character set latin1 default NULL,
  `is_stopover_requested` tinyint(1) default NULL,
  `Reason_for_extraordinary_transport` varchar(255) character set latin1 default NULL,
  `Reason_for_stopover` varchar(255) character set latin1 default NULL,
  `type_of_transportation` varchar(20) character set latin1 default NULL COMMENT 'ORDINARY or EXTRAORDINARY',
  `is_approved` tinyint(1) default NULL,
  `are_personal_funds_used` tinyint(1) default NULL COMMENT 'if used, date of request must be before oct 31st of the 3rd year',
  `personal_funds_amount` int(11) default NULL,
  `alternative_fund_1_name` varchar(100) character set latin1 default NULL,
  `alternative_fund_1_manager` int(11) default NULL,
  `alternative_fund_1_amount` int(11) default NULL,
  `alternative_fund_2_name` varchar(100) character set latin1 default NULL,
  `alternative_fund_2_amount` int(11) default NULL,
  `alternative_fund_2_manager` int(11) default NULL,
  `has_advisor_approved` tinyint(1) NOT NULL,
  `foreseen_meals_cost` float default NULL,
  `foreseen_lodging_cost` float default NULL,
  `foreseen_transportation_cost` float default NULL,
  `expenses_sustained_before_trip` float default NULL COMMENT 'eg flight ticket is bought before',
  `is_advance_payment_requested` tinyint(1) default NULL,
  `actual_begin_date_time` datetime default NULL,
  `actual_end_date_time` datetime default NULL,
  `departure_border_cross_datetime` datetime default NULL,
  `arrival_border_cross_datetime` datetime default NULL,
  `actual_destination` varchar(255) character set latin1 default NULL,
  `current_address` varchar(255) character set latin1 NOT NULL default 'UNKNOWN',
  `advance_payment_received` float default NULL,
  `requested_payment_method` varchar(100) character set latin1 default NULL COMMENT 'ENUM. almost always is BANK ACCOUNT',
  `self_declaration_missing_recepits` text character set latin1,
  `other_declarations` text character set latin1,
  `Travel_tickets` text character set latin1,
  `personal_veichle_KM_travelled` int(11) default NULL,
  `personal_veichle_colleagues` varchar(255) character set latin1 default NULL,
  `highway_toll_fees` float default NULL,
  `total_transport_expenses` float default '0',
  `total_lodging_expenses` float default '0',
  `number_of_nights` int(11) default NULL,
  `num_lodging_receipts` int(11) default NULL,
  `num_meals_invoices` int(11) default NULL,
  `num_days_of_meals` int(11) default NULL,
  `total_meal_expenses` float default NULL,
  `registration_fee` float default NULL,
  `other_costs_amount` float default '0',
  `other_costs_description` varchar(255) default NULL,
  `total_expenses` float default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `reimb_transport_expenses` float default '0',
  `date_reim_request_submitted` date default NULL,
  `reimb_lodging_expenses` float default '0',
  `reimb_extra_costs` float default '0',
  `deleted` tinyint(1) NOT NULL default '0',
  `student` int(11) NOT NULL,
  `has_coord_approved` tinyint(1) NOT NULL,
  `has_fund_1_mgr_approved` tinyint(1) NOT NULL default '0',
  `has_fund_2_mgr_approved` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`trip_ID`),
  KEY `index_travels_on_academic_year_id` (`academic_year_id`),
  KEY `index_travels_on_status` (`status`),
  KEY `index_travels_on_begin_date` (`actual_begin_date_time`),
  KEY `index_travels_on_end_date` (`actual_end_date_time`),
  KEY `index_travels_on_total_expenses` (`total_expenses`),
  KEY `index_travels_on_approved` (`is_approved`),
  KEY `fk_travels_users1` (`student`),
  CONSTRAINT `fk_travels_users1` FOREIGN KEY (`student`) REFERENCES `students` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `universities`
--

DROP TABLE IF EXISTS `universities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universities` (
  `university_ID` int(11) NOT NULL auto_increment,
  `name_university` varchar(255) character set latin1 NOT NULL default 'UNKNOWN',
  `location` varchar(255) character set latin1 NOT NULL default 'UNKNOWN',
  `deleted` tinyint(1) NOT NULL default '0',
  `country` int(11) default NULL,
  PRIMARY KEY  (`university_ID`),
  UNIQUE KEY `name_university_UNIQUE` (`name_university`),
  KEY `fk_university_country` (`country`),
  CONSTRAINT `fk_university_country` FOREIGN KEY (`country`) REFERENCES `countries` (`country_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universities`
--

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
INSERT INTO `universities` VALUES (1,'UNITN','Trento',0,1);
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_credentials`
--

DROP TABLE IF EXISTS `users_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_credentials` (
  `user_credential_ID` int(11) NOT NULL auto_increment,
  `user_name` varchar(200) character set latin1 NOT NULL default 'UNKNOWN',
  `password` varchar(500) character set latin1 NOT NULL default 'UNKNOWN',
  `user_rol` int(11) NOT NULL,
  `user` int(11) default NULL,
  `user_supervisor` int(11) default NULL,
  PRIMARY KEY  (`user_credential_ID`),
  KEY `fk_users_credentials_users_roles1` (`user_rol`),
  KEY `fk_users_credentials_users1` (`user`),
  KEY `fk_users_credentials_user_supervisor` (`user_supervisor`),
  CONSTRAINT `fk_users_credentials_user_supervisor` FOREIGN KEY (`user_supervisor`) REFERENCES `supervisors` (`supervisor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_credentials_users1` FOREIGN KEY (`user`) REFERENCES `students` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_credentials_users_roles1` FOREIGN KEY (`user_rol`) REFERENCES `users_roles` (`user_rol_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=654325 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_rol_ID` int(11) NOT NULL auto_increment,
  `role` varchar(100) character set latin1 NOT NULL default 'UNKNOWN',
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY  (`user_rol_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-05-29  9:15:55
