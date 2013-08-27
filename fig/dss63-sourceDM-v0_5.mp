input metauml;

beginfig(1);
Class.antennaconfig("antennaconfig") (
  "id: int(11)",
  "Antennas_id: int(11)",
  "Scans_id: int(11)",
  "Subscans_id: int(11)",
  "azimuth: double",
  "elevation: double",
  "Tsys: double",
  "comments: longtext"
)()();

Class.antennas("antennas") (
  "id: int(11)",
  "name: varchar(255)",
  "longitude: double",
  "latitude: double"
)()();

Class.backends("backends") (
  "id: int(11)",
  "BackendsNames_id: int(11)",
  "Receivers_id: int(11)",
  "resolution: double",
  "bandwidth: double",
  "spb_temp: double",
  "spb_pwr: double")()();

Class.backendsnames("backendsnames") (
  "id: int(11)",
  "name: varchar(255)",
  "description: longtext")()();

Class.calibrationsettings("calibrationsettings") (
  "id: int(11)",
  "Scans_id: int(11)",
  "Receivers_id: int(11)")()();

Class.expfiles("expfiles") (
  "id: int(11)",
  "logFiles_id: int(11)",
  "filename: varchar(255)",
  "year: smallint(6)")()();

Class.flux("flux") (
  "id: int(11)",
  "Scans_id: int(11)",
  "FluxUnits_id: int(11)",
  "Flux_max: double",
  "Flux_min: double",
  "Flux_integrated: double")()();

Class.fluxunits("fluxunits") (
  "id: int(11)",
  "name: varchar(255)",
  "description: longtext")()();

Class.focussettings("focussettings") (
  "id: int(11)",
  "Scans_id: int(11)")()();

Class.frequencyswitching("frequencyswitching") (
  "id: int(11)",
  "SwitchingValues_id: int(11)",
  "Receivers_id: int(11)",
  "frequencyThrow: double")()();


Class.logfiles("logfiles") (
  "id: int(11)",
  "filename: varchar(255)",
  "year: smallint(6)")()();

Class.logs("logs") (
  "id: int(11)",
  "timeStamp: datetime",
  "T_lna: double",
  "T_fo_assumed: double",
  "ND_coupling_correction: double",
  "T_ambient_load: double",
  "Azimuth: double",
  "Elevation: double",
  "Frequency: double")()();

Class.logsexp("logsexp") (
  "id: int(11)",
  "timeStamp: datetime",
  "gain: double",
  "linear_corr: double",
  "quadratic_corr: double",
  "T_noise_diode: double",
  "non_linearity: double")()();

Class.logst("logst") (
  "id: int(11)",
  "SourceLogs_id: int(11)",
  "LogsExp_id: int(11)",
  "powermeter: double",
  "T_linear: double",
  "T_corrected: double")()();

Class.observingmodes("observingmodes") (
  "id: int(11)",
  "name: varchar(255)",
  "description: longtext")()();

Class.onoffsettings("onoffsettings") (
  "id: int(11)",
  "Scans_id: int(11)",
  "SystemNames_id: int(11)",
  "xOffset: double",
  "yOffset: double")()();

Class.otfmapsettings("otfmapsettings") (
  "id: int(11)",
  "xStart: double",
  "yStart: double",
  "xEnd: double",
  "yEnd: double",
  "xStep: double",
  "yStep: double",
  "speedStart: double",
  "speedEnd: double",
  "timePerOtf: double")()();

Class.otfoffsets("otfoffsets") (
  "id: int(11)",
  "Scans_id: int(11)",
  "OTFMapSettings_id: int(11)",
  "SystemNames_id: int(11)",
  "xOffset: double",
  "yOffset: double")()();

Class.pointingsettings("pointingsettings") (
  "id: int(11)",
  "Scans_id: int(11)")()();

Class.projects("projects") (
  "id: int(11)",
  "PI_id: int(11)",
  "title: varchar(255)",
  "priority: smallint(6)",
  "allocatedTime: double",
  "usedTime: double",
  "comments: longtext",
  "description: longtext",
  "is_public: tinyint(1)")()();

Class.rawfiles("rawfiles") (
  "id: int(11)",
  "logFiles_id: int(11)",
  "filename: varchar(255)",
  "year: smallint(6)")()();

Class.receivers("receivers") (
  "id: int(11)",
  "ReceiversNames_id: int(11)",
  "Scans_id: int(11)")()();

Class.receiverscfg("receiverscfg") (
  "id: int(11)",
  "Receivers_id: int(11)",
  "linename: varchar(255)",
  "frequency: double",
  "polarization: varchar(255)")()();

Class.receiversnames("receiversnames") (
  "id: int(11)",
  "name: varchar(255)",
  "description: longtext")()();

Class.reducedfiles("reducedfiles") (
  "id: int(11)",
  "logFiles_id: int(11)",
  "filename: varchar(255)",
  "year: smallint(6)")()();

Class.scans("scans") (
  "id: int(11)",
  "scanID: varchar(255)",
  "Projects_id: int(11)",
  "Users_id: int(11)",
  "Sources_id: int(11)",
  "ObservingModes_id: int(11)",
  "ScansQuality_id: int(11)",
  "nSubscans: smallint(6)",
  "startTime: datetime",
  "endTime: datetime",
  "observedTime: smallint(6)",
  "dateObservation: date",
  "dateReduction: date",
  "LST: time",
  "UT: time",
  "comments: longtext")()();

Class.scansquality("scansquality") (
  "id: int(11)",
  "name: varchar(255)",
  "description: longtext")()();

Class.softwareversions("softwareversions") (
  "id: int(11)",
  "software: varchar(255)",
  "version: varchar(255)",
  "date: date",
  "description: longtext")()();

Class.softwareversions_used_in_scans("softwareversions_used_in_scans") (
  "id: int(11)",
  "scans_id: int(11)",
  "softwareversions_id: int(11)")()();

Class.sourcelogs("sourcelogs") (
  "id: int(11)",
  "name: varchar(255)")()();

Class.sources("sources") (
  "id: int(11)",
  "object: varchar(255)",
  "name: varchar(255)",
  "ra: double",
  "dec: double",
  "epoch: varchar(20)",
  "deltav: double",
  "velo_lsr: double",
  "comments: longtext")()();

Class.subscans("subscans") (
  "id: int(11)",
  "subscanID: varchar(255)",
  "Scans_id: int(11)",
  "dateObservation: date",
  "startTime: datetime",
  "endTime: datetime",
  "exposure: double",
  "is_source: tinyint(1)",
  "is_reference: tinyint(1)")()();

Class.switchingmodes("switchingmodes") (
  "id: int(11)",
  "name: varchar(255)",
  "description: longtext")()();

Class.switchingvalues("switchingvalues") (
  "id: int(11)",
  "SwitchingModes_id: int(11)",
  "Scans_id: int(11)")()();

Class.systemnames("systemnames") (
  "id: int(11)",
  "name: varchar(255)",
  "description: longtext")()();

Class.weatherstation("weatherstation") (
  "id: int(11)",
  "timeStamp: datetime",
  "electricalField: double",
  "windVel: double",
  "windVelMax: double",
  "windDir: double",
  "humidity: double",
  "pressure: double",
  "temperature: double")()();

Class.weathertau("weathertau") (
  "id: int(11)",
  "timeStamp: datetime",
  "tau: double",
  "sigma: double",
  "fit: double")()();

Class.auth_group("auth_group") (
  "id: int(11)",
  "name: varchar(80)")()();

Class.auth_group_permissions("auth_group_permissions") (
  "id: int(11)",
  "group_id: int(11)",
  "permission_id: int(11)")()();

Class.auth_message("auth_message") (
  "id: int(11)",
  "user_id: int(11)",
  "message: longtext")()();

Class.auth_permission("auth_permission") (
  "id: int(11)",
  "name: varchar(50)",
  "content_type_id: int(11)",
  "codename: varchar(100)")()();

Class.auth_user("auth_user") (
  "id: int(11)",
  "username: varchar(30)",
  "first_name: varchar(30)",
  "last_name: varchar(30)",
  "email: varchar(75)",
  "password: varchar(128)",
  "is_staff: tinyint(1)",
  "is_active: tinyint(1)",
  "is_superuser: tinyint(1)",
  "last_login: datetime",
  "date_joined: datetime")()();

Class.auth_user_groups("auth_user_groups") (
  "id: int(11)",
  "user_id: int(11)",
  "group_id: int(11)")()();

Class.auth_user_user_permissions("auth_user_user_permissions") (
  "id: int(11)",
  "user_id: int(11)",
  "permission_id: int(11)")()();

endfig;