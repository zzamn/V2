-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: test1
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authenticate`
--

DROP TABLE IF EXISTS `authenticate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticate` (
  `email` varchar(255) NOT NULL,
  `code` char(6) NOT NULL,
  `expiry_time` datetime NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticate`
--

LOCK TABLES `authenticate` WRITE;
/*!40000 ALTER TABLE `authenticate` DISABLE KEYS */;
/*!40000 ALTER TABLE `authenticate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map0Input`
--

DROP TABLE IF EXISTS `map0Input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map0Input` (
  `mapNo` int NOT NULL,
  `haiku` text,
  `title` varchar(255) DEFAULT NULL,
  `lore` longtext,
  `available` tinyint(1) DEFAULT '1',
  `poem` text,
  `username` varchar(13) DEFAULT NULL,
  `reservedBy` varchar(13) DEFAULT NULL,
  `expiry` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mapNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map0Input`
--

LOCK TABLES `map0Input` WRITE;
/*!40000 ALTER TABLE `map0Input` DISABLE KEYS */;
INSERT INTO `map0Input` VALUES (1,NULL,NULL,NULL,1,'In lands where the sun\'s fierce embrace never wanes,  \nWhere the earth\'s breath is a furnace, a dance of flame,  \nThere lies a realm of endless, searing plains,  \nWhere shadows flee and the sky\'s wrath has no name.  \n\nBeneath the molten gaze of a relentless eye,  \nA slumbering titan stirs in the depths below,  \nIts vast form a whisper in the blistering sigh,  \nA creature of the deep, where ancient currents flow.  \n\nIn the heart of this blazing expanse, a call resounds,  \nA plea to the heavens, a cry for mercy\'s grace,  \nAs the land trembles, the air with power abounds,  \nAnd the world holds its breath in this sacred place.  \n\nFor here, where the earth and sky in fury meet,  \nThe echoes of a celestial judgment ring,  \nA reckoning divine, where fire and spirit greet,  \nAnd the song of creation anew begins to sing.  ',NULL,NULL,NULL),(2,NULL,NULL,NULL,1,'In lands where the sun\'s fierce embrace never wanes,  \nWhere the earth\'s breath is a whisper of heat,  \nThere lies a realm where shadows dance in the blaze,  \nAnd the air shimmers with the sighs of the scorched.\n\nYet beyond the horizon, where the chill holds sway,  \nA realm of silence, where the world is hushed,  \nStands a sentinel of stone, with eyes of ancient lore,  \nGuarding the secrets of the frostbound expanse.\n\nIn the heart of the ice, where the winds weave tales,  \nA solitary figure roams, a giant of the snows,  \nWith a gaze that pierces the veil of the storm,  \nA keeper of peace in the land of eternal white.\n\nThus, the realms of fire and frost entwine,  \nA dance of extremes, a song of balance,  \nWhere the fierce and the gentle find their place,  \nIn the tapestry of worlds, forever intertwined.',NULL,NULL,NULL),(3,NULL,NULL,NULL,1,'In the realm where silver waters lie, beneath the night\'s embrace,  \nA mirror of the heavens\' glow, a tranquil, gleaming face.  \nYet beneath the calm, a fervor stirs, a passion fierce and bright,  \nA yearning that the stars themselves would envy in their light.  \n\nOnce, the land was lush and green, with life in every breath,  \nBut now the earth is parched and dry, a whispering of death.  \nA shadow walks the shores alone, with burdened heart and soul,  \nA wanderer of fate\'s cruel jest, where once the waters stole.  \n\nThe moonlit lake, a silent witness, to tales of joy and woe,  \nReflects the curse of endless thirst, where zealous dreams once flowed.  \nYet still it holds the sky\'s embrace, a promise in its gleam,  \nThat even in the darkest night, hope dances in a dream.  ',NULL,NULL,NULL),(4,NULL,NULL,NULL,1,'In lands where the twilight lingers long,  \nWhere the sun\'s farewell is a gentle sigh,  \nThere roam the beasts of silent song,  \nWith eyes that pierce the veiling sky.  \nTheir forms are but whispers in the gloam,  \nChasing dreams that never cease to roam.\n\nBeneath the earth, a restless heart,  \nIts pulse a tremor, a deep, low moan,  \nAs if the world itself would part,  \nTo reveal secrets in stone.  \nYet in the quake\'s embrace, a dance,  \nOf ancient runes and forgotten chance.\n\nIn the air, a shimmer, a fleeting trace,  \nOf mysteries woven in the night,  \nWhere the stars themselves seem to lace,  \nA tapestry of hidden light.  \nHere, the arcane breathes and sighs,  \nIn the land where wistful shadows rise.',NULL,NULL,NULL),(5,NULL,NULL,NULL,1,'In lands where the sun\'s first breath meets the twilight\'s sigh,  \nWhere the earth\'s pulse dances beneath a canopy of emerald dreams,  \nThere, the air hums with a jubilant secret, a song of the unseen,  \nAs if the very soil remembers a time when stars sang in chorus.  \n\nBeneath the shadowed boughs, where echoes of the end murmur soft,  \nA spectral presence weaves through the mist, a memory of what was,  \nIts touch a gentle tremor, a ripple in the fabric of the world,  \nAwakening the slumbering essence, a tide of life unbound.  \n\nIn this realm of whispered wonders, where the heart of magic beats,  \nThe sky shivers with a vibrant force, a cascade of ethereal light,  \nAnd the land, in its silent exultation, rises to greet the dawn,  \nA tapestry of forgotten dreams, woven anew with each breath.  ',NULL,NULL,NULL),(6,NULL,NULL,NULL,1,'In the realm where the whispering pines stand tall,  \nBeneath the cloak of endless twilight\'s shroud,  \nA land of shadows where the frost spirits call,  \nAnd the earth\'s deep sighs are never loud.  \nThere, the ancient woods weave tales of old,  \nOf a chasm\'s breath, where the world once broke,  \nVeins of crimson beneath the ice unfold,  \nA hidden stream where the silent dreams awoke.  \n\nThe sky, a tapestry of secrets spun,  \nVeils the stars with its gossamer embrace,  \nWhile the ground trembles, undone,  \nBy the echoes of a forgotten race.  \nIn the heart of the forest, where the cold winds weep,  \nA sanguine river flows, a scarlet thread,  \nBinding the past in its eternal sweep,  \nA song of life where the lost are led.  \n\nThrough the mist, the whispers of the land,  \nSpeak of the rift where the world did sway,  \nA place where time\'s gentle hand,  \nGuides the weary traveler astray.  \nIn this realm of frost and shadowed grace,  \nWhere the night holds sway and the dawn is rare,  \nThe heart of the wild beats a steady pace,  \nIn the dance of the veiled and the fair.  ',NULL,NULL,NULL),(7,NULL,NULL,NULL,1,'In the land where the earth\'s breath dances wild,  \nWhere the sky\'s wrath spins in a frenzied waltz,  \nThere, the air is a whisper of chaos,  \nA tempest\'s child, with a heart untamed.\n\nBeneath the heavens\' tumultuous embrace,  \nThe ground stands firm with a somber grace,  \nIts spirit unyielding, a silent vow,  \nTo weather the storm\'s relentless embrace.\n\nIn this realm of swirling, untamed might,  \nWhere the horizon blurs in a restless flight,  \nThe world holds its breath, a moment\'s pause,  \nBefore the storm\'s fury finds its cause.',NULL,NULL,NULL),(8,NULL,NULL,NULL,1,'In the shadowed vale where echoes dwell,  \nBeneath the mountain\'s ancient sigh,  \nThere lies a scar upon the earth,  \nWhere stone and spirit intertwine.  \nThe chisel\'s song, a mournful dirge,  \nCarves secrets from the granite\'s heart,  \nWhile silent watchers, dark as night,  \nStand guard with eyes of molten glass.\n\nIn caverns deep, where whispers fade,  \nA hunger stirs, unseen, profound,  \nIt drinks the light, the warmth, the breath,  \nA shadow cast upon the soul.  \nYet in the gloom, a titan stirs,  \nBorn of the earth\'s unyielding will,  \nIts form a fortress, cold and vast,  \nA sentinel of midnight\'s hue.\n\nThe quarry\'s breath, a ghostly wail,  \nSpeaks of the past, of dreams undone,  \nWhere once the earth was whole and pure,  \nNow lies a realm of stone and shade.  \nAnd in this place, where time stands still,  \nThe echoes of a world unknown,  \nResound within the hollowed halls,  \nA song of stone, of night, of bone.',NULL,NULL,NULL),(9,NULL,NULL,NULL,1,'In lands where the earth\'s breath trembles and sighs,  \nWhere the ground beneath dances to a silent, unseen tune,  \nThere lies a realm where shadows weave their own tales,  \nAnd the air hums with secrets, a melody of the end\'s loom.\n\nThe sky, a tapestry of fractured light and dark,  \nHolds a portal where the horizon bleeds into night,  \nA maw of fire and forgotten dreams, yawning wide,  \nAs the world listens to the murmurs of its own undoing.\n\nIn the heart of this place, where silence is a spell,  \nThe very stones seem to sing of ancient, arcane lore,  \nA song of beginnings and endings, entwined as one,  \nIn a dance of echoes, where the past and future soar.',NULL,NULL,NULL),(10,NULL,NULL,NULL,1,'In lands where shadows stretch and sigh,  \nBeneath a sky of fractured light,  \nThe air is thick with murmured cries,  \nA realm where echoes take their flight.  \nHere, the earth\'s breath is a sacred hymn,  \nA song of life and death entwined,  \nWhere whispers dance on zephyrs\' whim,  \nAnd time itself seems undefined.\n\nAmidst the groves of silvered leaves,  \nWhere moonlight weaves its gentle shroud,  \nThe soil remembers what it grieves,  \nYet holds its secrets, proud and loud.  \nIn this place of hallowed ground,  \nWhere spirits linger, unconfined,  \nThe past and present, tightly wound,  \nIn whispered tales of fate resigned.\n\nA land where healing and decay,  \nIn solemn balance, find their grace,  \nWhere every breath, a silent pray,  \nTo cleanse the soul, to find its place.  \nHere, the heart\'s truth is laid bare,  \nIn the quiet of the night,  \nA world where dreams and shadows share,  \nTheir stories in the fading light.',NULL,NULL,NULL),(11,NULL,NULL,NULL,1,'In the land where shadows stretch and sigh,  \nBeneath a sky of iron tears,  \nThe breath of winter whispers nigh,  \nA chill that gnaws at ancient fears.  \nThe world is veiled in silver shroud,  \nWhere echoes of the lost resound,  \nAnd in the heart of this frozen crowd,  \nA hunger stirs beneath the ground.  \n\nThe air is thick with whispered dread,  \nAs phantoms dance on icy breeze,  \nTheir touch a theft of warmth and red,  \nA feast upon the soul\'s unease.  \nThe heavens crack with frozen ire,  \nScattering shards of crystal pain,  \nWhile in the dark, a single fire  \nConsumes the light, leaves naught but stain.  \n\nIn this realm of endless night,  \nWhere hope is but a fleeting dream,  \nThe heart must guard its flickering light,  \nAgainst the maw of shadows\' scheme.  \nFor here, where silence reigns supreme,  \nAnd frost devours the weary breath,  \nThe soul must weave its fragile seam,  \nTo stand against the dance of death.  ',NULL,NULL,NULL),(12,NULL,NULL,NULL,1,'In the realm where the heavens and earth entwine,  \nWhere the stars weave tapestries of silver and gold,  \nA dance of light and shadow, eternal and divine,  \nThe sky\'s embrace, a story of ages untold.  \n\nBeneath the astral glow, where silence softly sings,  \nThe void\'s children wander, shadows in their wake,  \nTheir whispers, a gentle breeze on gossamer wings,  \nConsuming the light, leaving dreams in their quake.  \n\nIn this land of twilight, where the sun\'s touch fades,  \nThe night blooms eternal, a garden of the unseen,  \nWhere the heart of the cosmos in quietude wades,  \nAnd the soul of the world is a whisper between.  ',NULL,NULL,NULL),(13,NULL,NULL,NULL,1,'In the realm where the ice breathes its ancient sigh,  \nWhere the world is cloaked in a shroud of white,  \nThere stands a sentinel, carved from the whispers of time,  \nGuarding secrets etched in the language of stars.  \nBeneath the frozen veil, the earth hums with power,  \nA pulse of forgotten chants, a hymn of the deep.\n\nThe sky, a tapestry of celestial wrath,  \nUnfurls its fury in a dance of light and shadow,  \nAs the heavens weave their judgment upon the land.  \nIn this crucible of frost and fire,  \nThe air shimmers with the echoes of creation,  \nA surge of life, unseen yet felt,  \nBinding the world in threads of unseen force.\n\nHere, where the cold and the cosmos entwine,  \nThe heart of the world beats with a rhythm divine,  \nA song of balance, of endings and beginnings,  \nIn the land where the ice breathes its ancient sigh.',NULL,NULL,NULL),(14,NULL,NULL,NULL,1,'In the realm where mist and verdant whispers dwell,  \nWhere the earth\'s breath clings to leaf and vine,  \nA canopy of dreams, where shadows softly swell,  \nAnd the air is thick with secrets, arcane and divine.  \n\nBeneath the emerald shroud, where light dances in play,  \nGlimmers of the unseen weave through the tangled green,  \nA world aglow with mysteries that never fade away,  \nWhere the veil of the known is forever torn, unseen.  \n\nIn this twilight kingdom, where the heart of silence beats,  \nThe unseen forces stir, their presence felt, not shown,  \nA place where the hidden paths and the unknown meets,  \nAnd the soul of the forest sings in a tongue all its own.  ',NULL,NULL,NULL),(15,NULL,NULL,NULL,1,'In the realm where the heavens whisper their secrets,  \nAmidst the towering spires of evergreen sentinels,  \nA silver mirror lies cradled in the earth\'s embrace,  \nIts surface a tapestry of night’s gentle glow.  \nHere, the breath of the world is a chill that sings,  \nA melody woven through the needles and boughs,  \nWhere shadows dance to the rhythm of the celestial orb.\n\nBeneath the watchful gaze of the eternal night,  \nA specter of forgotten fires stirs from the dust,  \nIts form a memory of flame, now but a ghostly wisp.  \nIt wanders the paths where the stars dare not tread,  \nSeeking solace in the echoes of its own silent lament.  \nThe air hums with the weight of ancient judgments,  \nAs the sky\'s tears fall upon the land, a gentle benediction.\n\nIn this place where the earth and sky entwine,  \nThe heart of the world beats with a timeless grace,  \nAnd the spirits of the past whisper their tales,  \nOf a reckoning that binds the living and the lost.  \nHere, the soul finds its reflection in the still waters,  \nAnd the night cradles all in its tender embrace,  \nA lullaby of shadows and light, eternal and serene.',NULL,NULL,NULL),(16,NULL,NULL,NULL,1,'In the realm where silence weaves its shroud,  \nA land of endless white breathes beneath the stars,  \nWhere the sky\'s lanterns flicker in solemn dance,  \nAnd the earth\'s chill whispers secrets to the night.\n\nThere, the heavens\' tears freeze mid-fall,  \nSuspended in a tapestry of celestial dreams,  \nWhile the ground, a sacred canvas, lies untouched,  \nIts purity unmarred by time\'s relentless march.\n\nBeneath the watchful gaze of the eternal night,  \nThe world slumbers in a hallowed stillness,  \nWhere the soul finds solace in the astral glow,  \nAnd the heart beats in rhythm with the cosmic hymn.',NULL,NULL,NULL);
/*!40000 ALTER TABLE `map0Input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-31 15:18:17
