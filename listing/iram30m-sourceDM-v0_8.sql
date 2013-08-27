-- phpMyAdmin SQL Dump
-- version 2.9.1.1-Debian-3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Aug 17, 2007 at 12:51 PM
-- Server version: 5.0.32
-- PHP Version: 4.4.4-8+etch4
-- 
-- Database: `archiveDB_Django`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `Antenna`
-- 

CREATE TABLE `Antenna` (
  `id` int(11) NOT NULL auto_increment,
  `scan_id` int(11) NOT NULL,
  `actualAz` double default NULL,
  `actualEl` double default NULL,
  `trackAz` double default NULL,
  `trackEl` double default NULL,
  `p2` double default NULL,
  `p4` double default NULL,
  `p5` double default NULL,
  `p7` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `Antenna_scan_id` (`scan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Antenna`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `Backends`
-- 

CREATE TABLE `Backends` (
  `id` int(11) NOT NULL auto_increment,
  `bkName_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `receiver2_id` int(11) default NULL,
  `nPart` int(11) default NULL,
  `resolution` double default NULL,
  `bandwith` double default NULL,
  `fShift` double default NULL,
  `mode` varchar(36) NOT NULL,
  `percentage` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `Backends_bkName_id` (`bkName_id`),
  KEY `Backends_receiver_id` (`receiver_id`),
  KEY `Backends_receiver2_id` (`receiver2_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Backends`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `Basebands`
-- 

CREATE TABLE `Basebands` (
  `id` int(11) NOT NULL auto_increment,
  `backend_id` int(11) NOT NULL,
  `fSkyStart` double default NULL,
  `resolutionFrecuency` double default NULL,
  `nChannels` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `Basebands_backend_id` (`backend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Basebands`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `CalibrationSettings`
-- 

CREATE TABLE `CalibrationSettings` (
  `id` int(11) NOT NULL auto_increment,
  `scan_id` int(11) NOT NULL,
  `doAmbient` tinyint(1) default NULL,
  `doCold` tinyint(1) default NULL,
  `doSky` tinyint(1) default NULL,
  `skyOffset_id` int(11) default NULL,
  `gainimagerx` int(11) default NULL,
  `doGrid` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `CalibrationSettings_scan_id` (`scan_id`),
  KEY `CalibrationSettings_skyOffset_id` (`skyOffset_id`),
  KEY `CalibrationSettings_gainimagerx` (`gainimagerx`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `CalibrationSettings`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `FocusSettings`
-- 

CREATE TABLE `FocusSettings` (
  `id` int(11) NOT NULL auto_increment,
  `scan_id` int(11) NOT NULL,
  `len` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `FocusSettings_scan_id` (`scan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `FocusSettings`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `FrequencySwitching`
-- 

CREATE TABLE `FrequencySwitching` (
  `id` int(11) NOT NULL auto_increment,
  `receiver_id` int(11) NOT NULL,
  `switchingCfg_id` int(11) NOT NULL,
  `frequencyThrow` double default NULL,
  `frequencyOffset1` double default NULL,
  `frequencyOffset2` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `FrequencySwitching_receiver_id` (`receiver_id`),
  KEY `FrequencySwitching_switchingCfg_id` (`switchingCfg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `FrequencySwitching`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `MetadataAttributes`
-- 

CREATE TABLE `MetadataAttributes` (
  `id` int(11) NOT NULL auto_increment,
  `metadataEntity_id` int(11) NOT NULL,
  `attributeName` varchar(45) NOT NULL,
  `UCD` varchar(255) NOT NULL,
  `UType` varchar(255) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `readType` varchar(21) NOT NULL,
  `readFrom` varchar(255) NOT NULL,
  `readWhere` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `MetadataAttributes_metadataEntity_id` (`metadataEntity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `MetadataAttributes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `MetadataEntities`
-- 

CREATE TABLE `MetadataEntities` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `MetadataEntities`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `OTFMapSettings`
-- 

CREATE TABLE `OTFMapSettings` (
  `id` int(11) NOT NULL auto_increment,
  `scan_id` int(11) NOT NULL,
  `xStart` double default NULL,
  `yStart` double default NULL,
  `xEnd` double default NULL,
  `yEnd` double default NULL,
  `reference_id` int(11) default NULL,
  `croLoop` varchar(255) NOT NULL,
  `xStep` double default NULL,
  `yStep` double default NULL,
  `alternativeSpeedTotf` varchar(45) NOT NULL,
  `speedStart` double default NULL,
  `speedEnd` double default NULL,
  `timePerOtf` double default NULL,
  `timePerReference` double default NULL,
  `doZigzag` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `OTFMapSettings_scan_id` (`scan_id`),
  KEY `OTFMapSettings_reference_id` (`reference_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `OTFMapSettings`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `ObservedSources`
-- 

CREATE TABLE `ObservedSources` (
  `id` int(11) NOT NULL auto_increment,
  `sourceRadialVelocity_id` int(11) NOT NULL,
  `scan_id` int(11) NOT NULL,
  `sourceName` varchar(255) NOT NULL,
  `basisSystem` varchar(45) NOT NULL,
  `equinoxSystem` varchar(20) NOT NULL,
  `equinoxYear` double default NULL,
  `lambda` double NOT NULL,
  `beta` double NOT NULL,
  `descriptiveSystem` varchar(45) NOT NULL,
  `alphaD` double default NULL,
  `betaD` double default NULL,
  `gammaD` double default NULL,
  `projection` varchar(45) NOT NULL,
  `lambdaProjection` double default NULL,
  `betaProjection` double default NULL,
  `kappaProjection` double default NULL,
  `topology` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ObservedSources_sourceRadialVelocity_id` (`sourceRadialVelocity_id`),
  KEY `ObservedSources_scan_id` (`scan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `ObservedSources`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `Offsets`
-- 

CREATE TABLE `Offsets` (
  `id` int(11) NOT NULL auto_increment,
  `system_id` int(11) NOT NULL,
  `xOffset` double default NULL,
  `yOffset` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `Offsets_system_id` (`system_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Offsets`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `OnOffSettings`
-- 

CREATE TABLE `OnOffSettings` (
  `id` int(11) NOT NULL auto_increment,
  `scan_id` int(11) NOT NULL,
  `xOffset` double default NULL,
  `yOffset` double default NULL,
  `reference_id` int(11) default NULL,
  `doSymmetric` tinyint(1) default NULL,
  `doSwWobbler` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `OnOffSettings_scan_id` (`scan_id`),
  KEY `OnOffSettings_reference_id` (`reference_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `OnOffSettings`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `PointingSettings`
-- 

CREATE TABLE `PointingSettings` (
  `id` int(11) NOT NULL auto_increment,
  `scan_id` int(11) NOT NULL,
  `len` double default NULL,
  `doDoubleBeam` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `PointingSettings_scan_id` (`scan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `PointingSettings`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `Pools`
-- 

CREATE TABLE `Pools` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Pools`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `Pools_has_Projects`
-- 

CREATE TABLE `Pools_has_Projects` (
  `id` int(11) NOT NULL auto_increment,
  `pools_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pools_id` (`pools_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Pools_has_Projects`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `PredefinedReceivers`
-- 

CREATE TABLE `PredefinedReceivers` (
  `id` int(11) NOT NULL auto_increment,
  `project_id` int(11) NOT NULL,
  `rxName_id` int(11) NOT NULL,
  `commentReceiver` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `PredefinedReceivers_project_id` (`project_id`),
  KEY `PredefinedReceivers_rxName_id` (`rxName_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `PredefinedReceivers`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `PredefinedSources`
-- 

CREATE TABLE `PredefinedSources` (
  `id` int(11) NOT NULL auto_increment,
  `project_id` int(11) NOT NULL,
  `sourceRadialVelocity_id` int(11) NOT NULL,
  `sourceName` varchar(255) NOT NULL,
  `basisSystem` varchar(45) NOT NULL,
  `equinoxSystem` varchar(20) NOT NULL,
  `equinoxYear` double default NULL,
  `lambda` double NOT NULL,
  `beta` double NOT NULL,
  `priority` double NOT NULL,
  `aimedRMS` double NOT NULL,
  `actualRMS` double default NULL,
  `flux` double default NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `PredefinedSources_project_id` (`project_id`),
  KEY `PredefinedSources_sourceRadialVelocity_id` (`sourceRadialVelocity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `PredefinedSources`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `Projects`
-- 

CREATE TABLE `Projects` (
  `id` int(11) NOT NULL auto_increment,
  `observer_id` int(11) NOT NULL,
  `pi_id` int(11) NOT NULL,
  `projectId` int(11) default NULL,
  `title` varchar(255) NOT NULL,
  `priority` int(11) default NULL,
  `ranking` int(11) default NULL,
  `allocatedTime` double default NULL,
  `usedTime` double default NULL,
  `comment` longtext NOT NULL,
  `requiredOpacity` double default NULL,
  `requiredSkynoise` varchar(18) NOT NULL,
  `weatherComment` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `Projects_observer_id` (`observer_id`),
  KEY `Projects_pi_id` (`pi_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Projects`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `Projects_has_stProjectModes`
-- 

CREATE TABLE `Projects_has_stProjectModes` (
  `id` int(11) NOT NULL auto_increment,
  `project_id` int(11) NOT NULL,
  `stprojectmodes_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `project_id` (`project_id`,`stprojectmodes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Projects_has_stProjectModes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `Receivers`
-- 

CREATE TABLE `Receivers` (
  `id` int(11) NOT NULL auto_increment,
  `rxName_id` int(11) NOT NULL,
  `scan_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `Receivers_rxName_id` (`rxName_id`),
  KEY `Receivers_scan_id` (`scan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Receivers`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `RxBolometerCfg`
-- 

CREATE TABLE `RxBolometerCfg` (
  `id` int(11) NOT NULL auto_increment,
  `receiver_id` int(11) NOT NULL,
  `nChannels` int(11) default NULL,
  `channel` int(11) default NULL,
  `gainBolometer` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `RxBolometerCfg_receiver_id` (`receiver_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `RxBolometerCfg`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `RxReceiversCfg`
-- 

CREATE TABLE `RxReceiversCfg` (
  `id` int(11) NOT NULL auto_increment,
  `receiver_id` int(11) NOT NULL,
  `lineName` varchar(45) NOT NULL,
  `frequency` double default NULL,
  `sideBand` varchar(20) NOT NULL,
  `doppler` varchar(20) NOT NULL,
  `width` varchar(20) NOT NULL,
  `gainImage` double default NULL,
  `tempCold` double default NULL,
  `tempAmbient` double default NULL,
  `effForward` double default NULL,
  `effBeam` double default NULL,
  `scale` varchar(20) NOT NULL,
  `iPixel` int(11) default NULL,
  `nPixels` int(11) default NULL,
  `centerIF` double default NULL,
  `bandwidth` double default NULL,
  `distributionBoxInput` int(11) default NULL,
  `IF2` double default NULL,
  `isFlippingIF2` tinyint(1) default NULL,
  `polarization` varchar(20) NOT NULL,
  `useSpecialLO` tinyint(1) default NULL,
  `derotatorAngle` double default NULL,
  `derotatorSystem` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `RxReceiversCfg_receiver_id` (`receiver_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `RxReceiversCfg`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `ScanComments`
-- 

CREATE TABLE `ScanComments` (
  `id` int(11) NOT NULL auto_increment,
  `scan_id` int(11) NOT NULL,
  `predefinedComment_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `extraComment` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ScanComments_scan_id` (`scan_id`),
  KEY `ScanComments_predefinedComment_id` (`predefinedComment_id`),
  KEY `ScanComments_User_id` (`User_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `ScanComments`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `Scans`
-- 

CREATE TABLE `Scans` (
  `id` int(11) NOT NULL auto_increment,
  `system_id` int(11) default NULL,
  `observingMode_id` int(11) NOT NULL,
  `pointingModel_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `ncsId` int(11) default NULL,
  `startTime` datetime default NULL,
  `endTime` datetime default NULL,
  `LST` double default NULL,
  `MJD` double default NULL,
  `nSubscans` int(11) default NULL,
  `tSubscans` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `Scans_system_id` (`system_id`),
  KEY `Scans_observingMode_id` (`observingMode_id`),
  KEY `Scans_pointingModel_id` (`pointingModel_id`),
  KEY `Scans_project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Scans`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `Scans_has_Offsets`
-- 

CREATE TABLE `Scans_has_Offsets` (
  `id` int(11) NOT NULL auto_increment,
  `scan_id` int(11) NOT NULL,
  `offset_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `scan_id` (`scan_id`,`offset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Scans_has_Offsets`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `Secondary`
-- 

CREATE TABLE `Secondary` (
  `id` int(11) NOT NULL auto_increment,
  `scan_id` int(11) NOT NULL,
  `focusCorrectionX` double default NULL,
  `focusCorrectionY` double default NULL,
  `focusCorrectionZ` double default NULL,
  `rotationAngle` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `Secondary_scan_id` (`scan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Secondary`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `SourceRadialVelocities`
-- 

CREATE TABLE `SourceRadialVelocities` (
  `id` int(11) NOT NULL auto_increment,
  `referenceFrame` varchar(45) NOT NULL,
  `convention` varchar(45) NOT NULL,
  `velocity` double default NULL,
  `xOffsetDoppler` double default NULL,
  `yOffsetDoppler` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `SourceRadialVelocities`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `Subscans`
-- 

CREATE TABLE `Subscans` (
  `id` int(11) NOT NULL auto_increment,
  `scan_id` int(11) NOT NULL,
  `timePerSubscan` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `Subscans_scan_id` (`scan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `Subscans`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `SwitchingValues`
-- 

CREATE TABLE `SwitchingValues` (
  `id` int(11) NOT NULL auto_increment,
  `mode_id` int(11) NOT NULL,
  `scan_id` int(11) NOT NULL,
  `nCycles` int(11) default NULL,
  `nPhases` int(11) default NULL,
  `timePerPhase` double default NULL,
  `timePerSecond` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `SwitchingValues_mode_id` (`mode_id`),
  KEY `SwitchingValues_scan_id` (`scan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `SwitchingValues`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `TelescopeStatus`
-- 

CREATE TABLE `TelescopeStatus` (
  `id` int(11) NOT NULL auto_increment,
  `telescopeState_id` int(11) NOT NULL,
  `timeStamp` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `TelescopeStatus_telescopeState_id` (`telescopeState_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `TelescopeStatus`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `TipSettings`
-- 

CREATE TABLE `TipSettings` (
  `id` int(11) NOT NULL auto_increment,
  `scan_id` int(11) NOT NULL,
  `tipFrom` double default NULL,
  `tipTo` double default NULL,
  `tipBy` double default NULL,
  `doSlew` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `TipSettings_scan_id` (`scan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `TipSettings`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `UsersProfiles`
-- 

CREATE TABLE `UsersProfiles` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `institute` varchar(255) NOT NULL,
  `country` varchar(180) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `UsersProfiles_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `UsersProfiles`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `WeatherStation`
-- 

CREATE TABLE `WeatherStation` (
  `id` int(11) NOT NULL auto_increment,
  `timeStamp` datetime NOT NULL,
  `electricalField` double default NULL,
  `windVel` double default NULL,
  `windVelMax` double default NULL,
  `windDir` double default NULL,
  `humidity` double default NULL,
  `pressure` double default NULL,
  `temperature` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `WeatherStation`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `WeatherTau`
-- 

CREATE TABLE `WeatherTau` (
  `id` int(11) NOT NULL auto_increment,
  `timeStamp` datetime default NULL,
  `tau` double default NULL,
  `sigma` double default NULL,
  `fit` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `WeatherTau`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `stBkNames`
-- 

CREATE TABLE `stBkNames` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `stBkNames`
-- 

INSERT INTO `stBkNames` (`id`, `name`, `description`) VALUES 
(1, 'Continuum', 'Continuum backend 1 channel per receiver.'),
(2, '4MHz', 'Physically, there are a total of 9 4MHz filterbanks, each with a fixed resolution of 4MHz and bandwidth of 1024 MHz.'),
(3, '1MHz', 'The 1MHz filterbank can be used with 1, 2, 3, or 4 parts with 256, 512, 768, or 1024 MHz bandwidth; but the total number of 1MHz channels is limited to 1024.'),
(4, '100kHz', 'The 100kHz filterbank can be used in one part with 25.3 MHz bandwidth, or in 2 parts each with 12.8 MHz bandwidth.'),
(5, 'WILMA', 'WILMA has a fixed resolution of 2 MHz and bandwidth of 1024 MHz (theoretical), of which about 930 MHz are practically usable. 2 WILMA parts (times 9) can be connected to HERA1 and/or HERA2.'),
(6, 'VESPA', 'VESPA allows many different resolutions and bandwidths, depending the "mode" used. For details see the VESPA user''s guide.'),
(7, 'ABBA', 'Backend ABBA (Adc Bolometer BAckend) for the Mambo and Mambo2 photometers data acquisition from the Max-Planck-Institut fur Radioastronomie.');

-- --------------------------------------------------------

-- 
-- Table structure for table `stFileLocations`
-- 

CREATE TABLE `stFileLocations` (
  `id` int(11) NOT NULL auto_increment,
  `locationname` varchar(45) NOT NULL,
  `hostname` varchar(45) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `stFileLocations`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `stObservingModes`
-- 

CREATE TABLE `stObservingModes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- 
-- Dumping data for table `stObservingModes`
-- 

INSERT INTO `stObservingModes` (`id`, `name`, `description`) VALUES 
(1, 'calibrate', 'A CALIBRATION needs to be done for any heterodyne observation in order to get data with a calibrated intensity scale. It is normally done before the target observations. It must always be done after changing receiver and/or backend setups. It should also be done when changing sources and often enough to follow any variation of the athmosphere, about every 15 minutes. In a standard calibration for heterodyne receivers, we observe 3 subscans: on a sky position, an ambient temperature load (a.k.a., "hot" load), and a "cold" load at about the temperature of liquid nitrogen.'),
(2, 'pointing', 'POINTING observations are done to optimize the positioning of the telescope in Azimuth and Elevation. This is normally done by continuum observations of a cross scan in Azimuth and Elevation on a point source (or at least a small source) near the intended target source.'),
(3, 'focus', 'FOCUS measurements are done to optimize the position of the subreflector (secondary) along the telescope axis by maximizing the intensity of the radiation focussed into the receiver(s). It is best done on a strong point source, e.g., on a planet if or when it''s angular diameter is less than the beam width at the frequency to be observed. It is strongly recommended to do a POINTING on the same source before a FOCUS.'),
(4, 'tip', 'TIP (antenna tipping or "skydip") observations are done to measure the transmission of the Earth''s athmosphere, by taking data at several points with the same Azimuth but different Elevations, spaced by equal steps in "air mass".'),
(5, 'onOff', 'Subscans are taken alternating between a position that''s considered to be "ON-source" and a reference position that''s normally assumed to be"OFF-source", i.e., free of emission.'),
(6, 'onTheFlyMap', 'In OTFMAP (on-the-fly) observations, the antenna moves relative to the source while recording its position and taking data a high rate, thus performing "scans" in the strict sense of the word. This is a very fast mode for mapping extended regions.'),
(7, 'track', 'The TRACK observing mode simply tracks one position that is fixed relative to the source. It is normally used with Frequency Switching.'),
(8, 'VLBI', 'VLBI is a special observing mode to track the source position specified with SOURCE during VLBI scans.');

-- --------------------------------------------------------

-- 
-- Table structure for table `stPointingModels`
-- 

CREATE TABLE `stPointingModels` (
  `id` int(11) NOT NULL auto_increment,
  `p1` double default NULL,
  `p2` double default NULL,
  `p3` double default NULL,
  `p4` double default NULL,
  `p5` double default NULL,
  `p7` double default NULL,
  `p8` double default NULL,
  `p9` double default NULL,
  `rxho` double default NULL,
  `rxve` double default NULL,
  `refract3` double default NULL,
  `subref_rotationzero` double default NULL,
  `subref_rotationphi0` double default NULL,
  `subref_rotationradius` double default NULL,
  `encoder_sincol` double default NULL,
  `encoder_coscol` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `stPointingModels`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `stPredefinedComments`
-- 

CREATE TABLE `stPredefinedComments` (
  `id` int(11) NOT NULL auto_increment,
  `comment_text` longtext NOT NULL,
  `technical` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `stPredefinedComments`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `stProjectModes`
-- 

CREATE TABLE `stProjectModes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `stProjectModes`
-- 

INSERT INTO `stProjectModes` (`id`, `name`, `description`) VALUES 
(1, 'BoloMap', 'OTF maps with the bolometer for the project.'),
(2, 'BoloOnOff', 'On-Off integration on a point source with the bolometer for the project.'),
(3, 'SIS', 'Integration with heterodyne receivers for the project.'),
(4, 'HERA', 'Integration with the HERA receiver for the project.');

-- --------------------------------------------------------

-- 
-- Table structure for table `stRxNames`
-- 

CREATE TABLE `stRxNames` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

-- 
-- Dumping data for table `stRxNames`
-- 

INSERT INTO `stRxNames` (`id`, `name`, `description`) VALUES 
(1, 'A100', '3mm heterodyne receiver tunable between 80 and 115.5 GHz.'),
(2, 'A230', '1mm heterodyne receiver tunable between 197 and 266 GHz.'),
(3, 'B100', '3mm heterodyne receiver tunable between 81 and 115.5 GHz.'),
(4, 'B230', '1mm heterodyne receiver tunable between 197 and 266 GHz.'),
(5, 'C150', '2mm heterodyne receiver tunable between 130 and 183 GHz.'),
(6, 'C270', '1mm heterodyne receiver tunable between 241 and 281 GHz.'),
(7, 'D150', '2mm heterodyne receiver tunable between 130 and 183 GHz.'),
(8, 'D270', '1mm heterodyne receiver tunable between 241 and 281 GHz.'),
(9, 'MAMBO1', '37 bolometer array at 1mm from the MPIfR.'),
(10, 'MAMBO2', '117 bolometer array at 1mm from the MPIfR.'),
(11, 'HERA1pix1', 'Pixel 1 of the HEterodyne Receivers Array (HERA). Vertical component, tunable between 215 and 241 GHz.'),
(12, 'HERA1pix2', 'Pixel 2 of the HEterodyne Receivers Array (HERA). Vertical component, tunable between 215 and 241 GHz.'),
(13, 'HERA1pix3', ' '),
(14, 'HERA1pix4', ' '),
(15, 'HERA1pix5', ' '),
(16, 'HERA1pix6', ' '),
(17, 'HERA1pix7', ' '),
(18, 'HERA1pix8', ' '),
(19, 'HERA1pix9', ' '),
(20, 'HERA2pix1', 'Pixel 1 of the HEterodyne Receivers Array (HERA). Horizontal component, tunable between 215 and 272 GHz.'),
(21, 'HERA2pix2', 'Pixel 2 of the HEterodyne Receivers Array (HERA). Horizontal component, tunable between 215 and 272 GHz.'),
(22, 'HERA2pix3', ' '),
(23, 'HERA2pix4', ' '),
(24, 'HERA2pix5', ' '),
(25, 'HERA2pix6', ' '),
(26, 'HERA2pix7', ' '),
(27, 'HERA2pix8', ' '),
(28, 'HERA2pix9', ' ');

-- --------------------------------------------------------

-- 
-- Table structure for table `stSoftwareVersions`
-- 

CREATE TABLE `stSoftwareVersions` (
  `id` int(11) NOT NULL auto_increment,
  `software` varchar(45) NOT NULL,
  `version` varchar(20) NOT NULL,
  `date` datetime default NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `software` (`software`),
  UNIQUE KEY `version` (`version`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `stSoftwareVersions`
-- 

INSERT INTO `stSoftwareVersions` (`id`, `software`, `version`, `date`, `description`) VALUES 
(1, 'PaKo', '1.0.6.3', '2007-02-22 00:00:00', 'Software for setting/running the observations at the IRAM-30m');

-- --------------------------------------------------------

-- 
-- Table structure for table `stSoftwareVersions_usedin_Scans`
-- 

CREATE TABLE `stSoftwareVersions_usedin_Scans` (
  `id` int(11) NOT NULL auto_increment,
  `scan_id` int(11) NOT NULL,
  `stsoftwareversions_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `scan_id` (`scan_id`,`stsoftwareversions_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `stSoftwareVersions_usedin_Scans`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `stSwitchingModes`
-- 

CREATE TABLE `stSwitchingModes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `stSwitchingModes`
-- 

INSERT INTO `stSwitchingModes` (`id`, `name`, `description`) VALUES 
(1, 'totalPower', 'Refers simply to data acquisition without any of the other 3 fast Switching Modes. Normally, when using Total Power one or several positions "ON" the source are observed alternating with one or several "OFF"-source reference positions, and the signal is calculated as the difference between "ON" and "OFF".'),
(2, 'beamSwitching', 'Is done through a rotating chopper wheel in the receiver cabin, which during each rotation (= switching cycle) moves 2 reflecting blades into the beam path in front of the 4th mirror. The offset, rotation period, and blanking times are fixed.Beam Switching is normally only used for POINTING and FOCUS. The source signal is calculated as difference between the direct and offset phases.'),
(3, 'wobblerSwitching', 'During this switching mode, the wobbling secondary mirror is switched between 2 positions, which are offset from the telescope axis by a fixed amount. Wobbler Switching is normally used with ONOFF or, for bolometer continuum mapping, with OTFMAP.'),
(4, 'frequencySwitching', 'Switches between 2 different frequencies, so that there are 2 phases. The (source) signal is calculated as the difference between these 2 phases. Frequency Switching is normally used with TRACK or OTFMAP.');

-- --------------------------------------------------------

-- 
-- Table structure for table `stSystemNames`
-- 

CREATE TABLE `stSystemNames` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `stSystemNames`
-- 

INSERT INTO `stSystemNames` (`id`, `name`, `description`) VALUES 
(1, 'projection', 'The standard simple "radio" projection offsets in the chosen coordinate system. This is normally the astronomical system of offsets in which point-by-point (TRACK, ONOFF) or on-the-fly (OTFMAP) maps are made.'),
(2, 'horizontalTrue', 'The horizontal system with a factor 1/cos(elevation) applied to the azimuth offset. This is the system in which OTF maps with Wobbler switching and the bolometer are normally done.'),
(3, 'nasmyth', 'System with the special offsets in the Nasmyth reference to point an off-center pixel of a focal-plane array receiver (bolometer, HERA) to the commanded astronomical position, e.g., to use an off-center pixel for pointing, focus, ONOFF.');

-- --------------------------------------------------------

-- 
-- Table structure for table `stTelescopeStates`
-- 

CREATE TABLE `stTelescopeStates` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `stTelescopeStates`
-- 

INSERT INTO `stTelescopeStates` (`id`, `name`, `description`) VALUES 
(1, 'Hera', 'Observing with the Hera receiver.'),
(2, 'Bolometer', 'Observing with bolometer.'),
(3, 'Heterodyne', 'Observing with the heterodyne receivers.'),
(4, 'Technical Problem', 'Telescope stopped due to a technical problem.'),
(5, 'Bad weather', 'Telescope stopped due to bad weather.'),
(6, 'Maintenance', 'Maintenance of the IRAM-30m.');
