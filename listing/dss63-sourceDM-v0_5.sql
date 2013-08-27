CREATE DATABASE  `dss63` ;

USE `dss63`;

CREATE TABLE  `antennaconfig` (
  `id` int(11) NOT NULL auto_increment,
  `Antennas_id` int(11) NOT NULL,
  `Scans_id` int(11) default NULL,
  `Subscans_id` int(11) default NULL,
  `azimuth` double default NULL,
  `elevation` double default NULL,
  `Tsys` double default NULL,
  `comments` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `AntennaConfig_Antennas_id` (`Antennas_id`),
  KEY `AntennaConfig_Scans_id` (`Scans_id`),
  KEY `AntennaConfig_Subscans_id` (`Subscans_id`)
);

CREATE TABLE  `antennas` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `longitude` double default NULL,
  `latitude` double default NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE  `backends` (
  `id` int(11) NOT NULL auto_increment,
  `BackendsNames_id` int(11) NOT NULL,
  `Receivers_id` int(11) NOT NULL,
  `resolution` double default NULL,
  `bandwidth` double default NULL,
  `spb_temp` double default NULL,
  `spb_pwr` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `Backends_BackendsNames_id` (`BackendsNames_id`),
  KEY `Backends_Receivers_id` (`Receivers_id`)
);

CREATE TABLE  `backendsnames` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE  `calibrationsettings` (
  `id` int(11) NOT NULL auto_increment,
  `Scans_id` int(11) NOT NULL,
  `Receivers_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `CalibrationSettings_Scans_id` (`Scans_id`),
  KEY `CalibrationSettings_Receivers_id` (`Receivers_id`)
);

CREATE TABLE  `expfiles` (
  `id` int(11) NOT NULL auto_increment,
  `logFiles_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `year` smallint(6) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `expFiles_Unique` (`filename`),
  KEY `expFiles_logFiles_id` (`logFiles_id`)
);

CREATE TABLE  `flux` (
  `id` int(11) NOT NULL auto_increment,
  `Scans_id` int(11) NOT NULL,
  `FluxUnits_id` int(11) NOT NULL,
  `Flux_max` double default NULL,
  `Flux_min` double default NULL,
  `Flux_integrated` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `Flux_Scans_id` (`Scans_id`),
  KEY `Flux_FluxUnits_id` (`FluxUnits_id`)
);

CREATE TABLE  `fluxunits` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE  `focussettings` (
  `id` int(11) NOT NULL auto_increment,
  `Scans_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FocusSettings_Scans_id` (`Scans_id`)
);

CREATE TABLE  `frequencyswitching` (
  `id` int(11) NOT NULL auto_increment,
  `SwitchingValues_id` int(11) NOT NULL,
  `Receivers_id` int(11) NOT NULL,
  `frequencyThrow` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `FrequencySwitching_SwitchingValues_id` (`SwitchingValues_id`),
  KEY `FrequencySwitching_Receivers_id` (`Receivers_id`)
);


CREATE TABLE  `logfiles` (
  `id` int(11) NOT NULL auto_increment,
  `filename` varchar(255) NOT NULL,
  `year` smallint(6) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `logFiles_Unique` (`filename`)
);

CREATE TABLE  `logs` (
  `id` int(11) NOT NULL auto_increment,
  `timeStamp` datetime NOT NULL,
  `T_lna` double default NULL,
  `T_fo_assumed` double default NULL,
  `ND_coupling_correction` double default NULL,
  `T_ambient_load` double default NULL,
  `Azimuth` double default NULL,
  `Elevation` double default NULL,
  `Frequency` double default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `timeStamp` (`timeStamp`)
);

CREATE TABLE  `logsexp` (
  `id` int(11) NOT NULL auto_increment,
  `timeStamp` datetime NOT NULL,
  `gain` double default NULL,
  `linear_corr` double default NULL,
  `quadratic_corr` double default NULL,
  `T_noise_diode` double default NULL,
  `non_linearity` double default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `timeStamp` (`timeStamp`)
);

CREATE TABLE  `logst` (
  `id` int(11) NOT NULL auto_increment,
  `SourceLogs_id` int(11) NOT NULL,
  `LogsExp_id` int(11) NOT NULL,
  `powermeter` double default NULL,
  `T_linear` double default NULL,
  `T_corrected` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `LogsT_SourceLogs_id` (`SourceLogs_id`),
  KEY `LogsT_LogsExp_id` (`LogsExp_id`)
);

CREATE TABLE  `observingmodes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE  `onoffsettings` (
  `id` int(11) NOT NULL auto_increment,
  `Scans_id` int(11) NOT NULL,
  `SystemNames_id` int(11) NOT NULL,
  `xOffset` double default NULL,
  `yOffset` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `OnOffSettings_Scans_id` (`Scans_id`),
  KEY `OnOffSettings_SystemNames_id` (`SystemNames_id`)
);

CREATE TABLE  `otfmapsettings` (
  `id` int(11) NOT NULL auto_increment,
  `xStart` double default NULL,
  `yStart` double default NULL,
  `xEnd` double default NULL,
  `yEnd` double default NULL,
  `xStep` double default NULL,
  `yStep` double default NULL,
  `speedStart` double default NULL,
  `speedEnd` double default NULL,
  `timePerOtf` double default NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE  `otfoffsets` (
  `id` int(11) NOT NULL auto_increment,
  `Scans_id` int(11) NOT NULL,
  `OTFMapSettings_id` int(11) NOT NULL,
  `SystemNames_id` int(11) NOT NULL,
  `xOffset` double default NULL,
  `yOffset` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `OTFOffsets_Scans_id` (`Scans_id`),
  KEY `OTFOffsets_OTFMapSettings_id` (`OTFMapSettings_id`),
  KEY `OTFOffsets_SystemNames_id` (`SystemNames_id`)
);

CREATE TABLE  `pointingsettings` (
  `id` int(11) NOT NULL auto_increment,
  `Scans_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `PointingSettings_Scans_id` (`Scans_id`)
);

CREATE TABLE  `projects` (
  `id` int(11) NOT NULL auto_increment,
  `PI_id` int(11) default NULL,
  `title` varchar(255) NOT NULL,
  `priority` smallint(6) default NULL,
  `allocatedTime` double default NULL,
  `usedTime` double default NULL,
  `comments` longtext NOT NULL,
  `description` longtext NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `Projects_PI_id` (`PI_id`)
);

CREATE TABLE  `rawfiles` (
  `id` int(11) NOT NULL auto_increment,
  `logFiles_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `year` smallint(6) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `rawFiles_Unique` (`filename`),
  KEY `rawFiles_logFiles_id` (`logFiles_id`)
);

CREATE TABLE  `receivers` (
  `id` int(11) NOT NULL auto_increment,
  `ReceiversNames_id` int(11) NOT NULL,
  `Scans_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `Receivers_ReceiversNames_id` (`ReceiversNames_id`),
  KEY `Receivers_Scans_id` (`Scans_id`)
);

CREATE TABLE  `receiverscfg` (
  `id` int(11) NOT NULL auto_increment,
  `Receivers_id` int(11) NOT NULL,
  `linename` varchar(255) NOT NULL,
  `frequency` double default NULL,
  `polarization` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ReceiversCfg_Receivers_id` (`Receivers_id`)
);

CREATE TABLE  `receiversnames` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE  `reducedfiles` (
  `id` int(11) NOT NULL auto_increment,
  `logFiles_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `year` smallint(6) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `reducedFiles_Unique` (`filename`),
  KEY `reducedFiles_logFiles_id` (`logFiles_id`)
);

CREATE TABLE  `scans` (
  `id` int(11) NOT NULL auto_increment,
  `scanID` varchar(255) NOT NULL,
  `Projects_id` int(11) NOT NULL,
  `Users_id` int(11) default NULL,
  `Sources_id` int(11) NOT NULL,
  `ObservingModes_id` int(11) default NULL,
  `ScansQuality_id` int(11) NOT NULL,
  `nSubscans` smallint(6) default NULL,
  `startTime` datetime default NULL,
  `endTime` datetime default NULL,
  `observedTime` smallint(6) default NULL,
  `dateObservation` date default NULL,
  `dateReduction` date default NULL,
  `LST` time default NULL,
  `UT` time default NULL,
  `comments` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `scanID` (`scanID`),
  KEY `Scans_Projects_id` (`Projects_id`),
  KEY `Scans_Users_id` (`Users_id`),
  KEY `Scans_Sources_id` (`Sources_id`),
  KEY `Scans_ObservingModes_id` (`ObservingModes_id`),
  KEY `Scans_ScansQuality_id` (`ScansQuality_id`)
);

CREATE TABLE  `scansquality` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE  `softwareversions` (
  `id` int(11) NOT NULL auto_increment,
  `software` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `date` date default NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE  `softwareversions_used_in_scans` (
  `id` int(11) NOT NULL auto_increment,
  `scans_id` int(11) NOT NULL,
  `softwareversions_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `scans_id` (`scans_id`,`softwareversions_id`),
  KEY `softwareversions_id_refs_id_54a1d90c` (`softwareversions_id`)
);

CREATE TABLE  `sourcelogs` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE  `sources` (
  `id` int(11) NOT NULL auto_increment,
  `object` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ra` double default NULL,
  `dec` double default NULL,
  `epoch` varchar(20) NOT NULL,
  `deltav` double default NULL,
  `velo_lsr` double default NULL,
  `comments` longtext NOT NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE  `subscans` (
  `id` int(11) NOT NULL auto_increment,
  `subscanID` varchar(255) NOT NULL,
  `Scans_id` int(11) NOT NULL,
  `dateObservation` date default NULL,
  `startTime` datetime default NULL,
  `endTime` datetime default NULL,
  `exposure` double default NULL,
  `is_source` tinyint(1) default NULL,
  `is_reference` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `subscanID` (`subscanID`),
  KEY `Subscans_Scans_id` (`Scans_id`)
);

CREATE TABLE  `switchingmodes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE  `switchingvalues` (
  `id` int(11) NOT NULL auto_increment,
  `SwitchingModes_id` int(11) NOT NULL,
  `Scans_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `SwitchingValues_SwitchingModes_id` (`SwitchingModes_id`),
  KEY `SwitchingValues_Scans_id` (`Scans_id`)
);

CREATE TABLE  `systemnames` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE  `weatherstation` (
  `id` int(11) NOT NULL auto_increment,
  `timeStamp` datetime NOT NULL,
  `electricalField` double default NULL,
  `windVel` double default NULL,
  `windVelMax` double default NULL,
  `windDir` double default NULL,
  `humidity` double default NULL,
  `pressure` double default NULL,
  `temperature` double default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `timeStamp` (`timeStamp`)
);

CREATE TABLE  `weathertau` (
  `id` int(11) NOT NULL auto_increment,
  `timeStamp` datetime NOT NULL,
  `tau` double default NULL,
  `sigma` double default NULL,
  `fit` double default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `timeStamp` (`timeStamp`)
);

CREATE TABLE  `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
);

CREATE TABLE  `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_5886d21f` (`permission_id`)
);

CREATE TABLE  `auth_message` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `auth_message_user_id` (`user_id`)
);

CREATE TABLE  `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id` (`content_type_id`)
);

CREATE TABLE  `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
);

CREATE TABLE  `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f116770` (`group_id`)
);

CREATE TABLE  `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`)
);

