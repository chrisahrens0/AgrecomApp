BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "site" (
	"siteId"	INTEGER,
	"siteName"	TEXT,
	"siteAddress"	TEXT,
	"siteDesc"	TEXT,
	PRIMARY KEY("siteId" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "bait" (
	"baitId"	INTEGER,
	"baitName"	TEXT,
	"baitType"	TEXT,
	PRIMARY KEY("baitId" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "reports" (
	"reportID"	INTEGER,
	"siteID"	INTEGER,
	"reportContent"	INTEGER,
	"reportDate"	INTEGER,
	PRIMARY KEY("reportID" AUTOINCREMENT)
);
INSERT INTO "site" VALUES (1,'SampleSite','sampleAddress','Sample site for testing purposes');
INSERT INTO "site" VALUES (2,'Agrecom','411 West Ave, Merced, CA 95341','Agrecom offices');
INSERT INTO "bait" VALUES (1,'None',NULL);
INSERT INTO "bait" VALUES (2,'Other',NULL);
INSERT INTO "bait" VALUES (3,'Contrac',NULL);
INSERT INTO "bait" VALUES (4,'Final',NULL);
INSERT INTO "bait" VALUES (5,'Liqua Tox',NULL);
INSERT INTO "bait" VALUES (6,'Tempo SC Ultra',NULL);
INSERT INTO "bait" VALUES (7,'Terad',NULL);
INSERT INTO "bait" VALUES (8,'Hawk',NULL);
INSERT INTO "bait" VALUES (9,'Jaguar',NULL);
INSERT INTO "reports" VALUES (0,0,'{
	"reportDesc" : "REPORT NOT FOUND",
}',NULL);
COMMIT;
