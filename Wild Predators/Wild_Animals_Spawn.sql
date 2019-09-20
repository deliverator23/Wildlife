CREATE TABLE IF NOT EXISTS UnitSpawnContinents
(
  UnitType      TEXT    NOT NULL,
  ContinentType TEXT    NOT NULL,
  RandomSize    INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS UnitSpawnFeatures
(
  UnitType    TEXT NOT NULL,
  FeatureType TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS UnitSpawnTerrains
(
  UnitType    TEXT NOT NULL,
  TerrainType TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS UnitSpawnEras
(
  UnitType    TEXT NOT NULL,
  MinEraType  TEXT NOT NULL,
  MaxEraType  TEXT NOT NULL
);

INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_LION', 'CONTINENT_AFRICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_LEOPARD', 'CONTINENT_AFRICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_CHEETAH', 'CONTINENT_AFRICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_JACKAL', 'CONTINENT_AFRICA', 20);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_RHINOCEROS', 'CONTINENT_AFRICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_HIPPO', 'CONTINENT_AFRICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_NILE_CROCODILE', 'CONTINENT_AFRICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_GORILLA', 'CONTINENT_AFRICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_HYENA', 'CONTINENT_AFRICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_PANTHER', 'CONTINENT_AFRICA', 40);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_WOLF', 'CONTINENT_EUROPE', 20);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_GRIZZLYBEAR', 'CONTINENT_EUROPE', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_LION', 'CONTINENT_EUROPE', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_POLARBEAR', 'CONTINENT_EUROPE', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_TIGER', 'CONTINENT_ASIA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_WHITE_TIGER', 'CONTINENT_ASIA', 40);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_WOLF', 'CONTINENT_ASIA', 20);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_LEOPARD', 'CONTINENT_ASIA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_SNOW_LEOPARD', 'CONTINENT_ASIA', 40);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_GRIZZLYBEAR', 'CONTINENT_ASIA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_POLARBEAR', 'CONTINENT_ASIA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_PANDA', 'CONTINENT_ASIA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_RHINOCEROS', 'CONTINENT_ASIA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_PANTHER', 'CONTINENT_ASIA', 40);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_WOLF', 'CONTINENT_NORTH_AMERICA', 20);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_PUMA', 'CONTINENT_NORTH_AMERICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_GRIZZLYBEAR', 'CONTINENT_NORTH_AMERICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_BLACKBEAR', 'CONTINENT_NORTH_AMERICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_AMERICANCROCODILE', 'CONTINENT_NORTH_AMERICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_POLARBEAR', 'CONTINENT_NORTH_AMERICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_JAGUAR', 'CONTINENT_SOUTH_AMERICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_PANTHER', 'CONTINENT_SOUTH_AMERICA', 40);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_BLACKCAIMAN', 'CONTINENT_SOUTH_AMERICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_MANEDWOLF', 'CONTINENT_SOUTH_AMERICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_SPECTACLEDBEAR', 'CONTINENT_SOUTH_AMERICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_PUMA', 'CONTINENT_SOUTH_AMERICA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_LEOPARD', 'CONTINENT_OCEANIA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_BIGCATS_PANTHER', 'CONTINENT_OCEANIA', 40);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_DINGO', 'CONTINENT_OCEANIA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_TASMANIANWOLF', 'CONTINENT_OCEANIA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_FRESHWATER_CROCODILE', 'CONTINENT_OCEANIA', 33);
INSERT INTO UnitSpawnContinents VALUES ('UNIT_ANIMAL_TASMANIANWOLF', 'CONTINENT_ZEALANDIA', 33);

INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_BLACKBEAR', 'TERRAIN_TUNDRA');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_CHEETAH', 'TERRAIN_PLAINS');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_DINGO', 'TERRAIN_PLAINS');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_DINGO', 'TERRAIN_DESERT');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_GRIZZLYBEAR', 'TERRAIN_SNOW');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_GRIZZLYBEAR', 'TERRAIN_TUNDRA');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_HYENA', 'TERRAIN_PLAINS');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_JACKAL', 'TERRAIN_PLAINS');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_JACKAL', 'TERRAIN_DESERT');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_POLARBEAR', 'TERRAIN_SNOW');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_PUMA', 'TERRAIN_TUNDRA_HILLS');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_PUMA', 'TERRAIN_GRASS_HILLS');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_PUMA', 'TERRAIN_PLAINS_HILLS');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_RHINOCEROS', 'TERRAIN_PLAINS');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_TASMANIANWOLF', 'TERRAIN_PLAINS');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_TASMANIANWOLF', 'TERRAIN_DESERT');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_WOLF', 'TERRAIN_SNOW');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_WOLF', 'TERRAIN_TUNDRA');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_BIGCATS_LION', 'TERRAIN_PLAINS');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_BIGCATS_SNOW_LEOPARD', 'TERRAIN_TUNDRA_HILLS');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_BIGCATS_SNOW_LEOPARD', 'TERRAIN_SNOW_HILLS');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_MANTA', 'TERRAIN_OCEAN');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_KRAKEN', 'TERRAIN_OCEAN');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_HUMPBACK_WHALE', 'TERRAIN_OCEAN');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_ORCA', 'TERRAIN_OCEAN');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_TIGERSHARK', 'TERRAIN_OCEAN');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_BULLSHARK', 'TERRAIN_OCEAN');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_HAMMERHEAD', 'TERRAIN_OCEAN');
INSERT INTO UnitSpawnTerrains VALUES ('UNIT_ANIMAL_WHITESHARK', 'TERRAIN_OCEAN');

INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_AMERICANCROCODILE', 'FEATURE_FLOODPLAINS');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_AMERICANCROCODILE', 'FEATURE_MARSH');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_BLACKBEAR', 'FEATURE_FOREST');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_BLACKCAIMAN', 'FEATURE_FLOODPLAINS');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_BLACKCAIMAN', 'FEATURE_MARSH');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_FRESHWATER_CROCODILE', 'FEATURE_FLOODPLAINS');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_FRESHWATER_CROCODILE', 'FEATURE_MARSH');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_GORILLA', 'FEATURE_JUNGLE');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_GRIZZLYBEAR', 'FEATURE_FOREST');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_HIPPO', 'FEATURE_FLOODPLAINS');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_HIPPO', 'FEATURE_MARSH');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_MANEDWOLF', 'FEATURE_FOREST');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_NILE_CROCODILE', 'FEATURE_FLOODPLAINS');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_NILE_CROCODILE', 'FEATURE_MARSH');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_PANDA', 'FEATURE_JUNGLE');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_PANDA', 'FEATURE_FOREST');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_SPECTACLEDBEAR', 'FEATURE_FOREST');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_ANIMAL_WOLF', 'FEATURE_FOREST');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_BIGCATS_JAGUAR', 'FEATURE_JUNGLE');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_BIGCATS_LEOPARD', 'FEATURE_JUNGLE');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_BIGCATS_PANTHER', 'FEATURE_JUNGLE');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_BIGCATS_TIGER', 'FEATURE_JUNGLE');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_BIGCATS_TIGER', 'FEATURE_FOREST');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_BIGCATS_WHITE_TIGER', 'FEATURE_JUNGLE');
INSERT INTO UnitSpawnFeatures VALUES ('UNIT_BIGCATS_WHITE_TIGER', 'FEATURE_FOREST');

INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_AMERICANCROCODILE','ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_BLACKBEAR','ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_BLACKCAIMAN', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_CHEETAH', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_DINGO','ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_FRESHWATER_CROCODILE','ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_GORILLA', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_GRIZZLYBEAR', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_HIPPO', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_HYENA','ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_JACKAL', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_MANEDWOLF', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_NILE_CROCODILE', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_PANDA', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_POLARBEAR', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_PUMA', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_RHINOCEROS', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_SPECTACLEDBEAR', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_TASMANIANWOLF', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_ANIMAL_WOLF', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_BIGCATS_JAGUAR', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_BIGCATS_LEOPARD', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_BIGCATS_LION', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_BIGCATS_PANTHER', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_BIGCATS_SNOW_LEOPARD', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_BIGCATS_TIGER', 'ERA_ANCIENT','ERA_FUTURE');
INSERT INTO UnitSpawnEras VALUES ('UNIT_BIGCATS_WHITE_TIGER', 'ERA_ANCIENT','ERA_FUTURE');