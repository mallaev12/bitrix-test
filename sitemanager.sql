-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 10 2022 г., 20:50
-- Версия сервера: 8.0.24
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sitemanager`
--

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify`
--

CREATE TABLE `b_admin_notify` (
  `ID` int NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_admin_notify`
--

INSERT INTO `b_admin_notify` (`ID`, `MODULE_ID`, `TAG`, `MESSAGE`, `ENABLE_CLOSE`, `PUBLIC_SECTION`, `NOTIFY_TYPE`) VALUES
(3, 'MAIN', 'SITE_CHECKER', 'Обнаружены ошибки в работе сайта. <a href=\"/bitrix/admin/site_checker.php?lang=ru&start_test=Y\">Проверить и исправить.</a>', 'Y', 'N', 'M');

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify_lang`
--

CREATE TABLE `b_admin_notify_lang` (
  `ID` int NOT NULL,
  `NOTIFY_ID` int NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_agent`
--

CREATE TABLE `b_agent` (
  `ID` int NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RETRY_COUNT` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_agent`
--

INSERT INTO `b_agent` (`ID`, `MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `LAST_EXEC`, `NEXT_EXEC`, `DATE_CHECK`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`, `RUNNING`, `RETRY_COUNT`) VALUES
(1, 'main', 100, '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2022-07-10 15:23:36', '2022-07-10 15:24:36', NULL, 60, 'N', NULL, 'N', 0),
(2, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2022-07-10 14:52:11', '2022-07-10 15:52:11', NULL, 3600, 'N', NULL, 'N', 0),
(3, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2022-07-10 13:33:14', '2022-07-11 13:33:14', NULL, 86400, 'N', NULL, 'N', 0),
(4, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2022-07-10 13:33:15', '2022-07-11 13:33:15', NULL, 86400, 'N', NULL, 'N', 0),
(5, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2022-07-10 13:33:15', '2022-07-11 13:33:15', NULL, 86400, 'N', NULL, 'N', 0),
(6, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2022-07-10 13:33:15', '2022-07-11 13:33:15', NULL, 86400, 'N', NULL, 'N', 0),
(7, 'main', 100, 'CUserCounter::DeleteOld();', 'Y', '2022-07-10 13:33:15', '2022-07-11 13:33:15', NULL, 86400, 'N', NULL, 'N', 0),
(8, 'main', 100, '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable::deleteOldAgent(22, 20);', 'Y', '2022-07-10 13:33:16', '2022-07-11 13:33:16', NULL, 86400, 'N', NULL, 'N', 0),
(9, 'main', 100, 'CUser::AuthActionsCleanUpAgent();', 'Y', '2022-07-10 13:33:16', '2022-07-11 13:33:16', NULL, 86400, 'N', NULL, 'N', 0),
(10, 'main', 100, 'CUser::CleanUpAgent();', 'Y', '2022-07-10 13:33:16', '2022-07-11 13:33:16', NULL, 86400, 'N', NULL, 'N', 0),
(11, 'main', 100, 'CUser::DeactivateAgent();', 'Y', '2022-07-10 13:33:16', '2022-07-11 13:33:16', NULL, 86400, 'N', NULL, 'N', 0),
(12, 'main', 100, 'CEventLog::CleanUpAgent();', 'Y', '2022-07-10 13:33:16', '2022-07-11 13:33:16', NULL, 86400, 'N', NULL, 'N', 0),
(13, 'clouds', 100, 'CCloudStorage::CleanUp();', 'Y', '2022-07-10 13:33:16', '2022-07-11 13:33:16', NULL, 86400, 'N', NULL, 'N', 0),
(14, 'landing', 100, 'Bitrix\\Landing\\Agent::clearRecycle();', 'Y', '2022-07-10 13:49:01', '2022-07-10 15:49:01', NULL, 7200, 'N', NULL, 'N', 0),
(15, 'landing', 100, 'Bitrix\\Landing\\Agent::clearFiles(30);', 'Y', '2022-07-10 14:52:12', '2022-07-10 15:52:12', NULL, 3600, 'N', NULL, 'N', 0),
(16, 'landing', 100, 'Bitrix\\Landing\\Agent::sendRestStatistic();', 'Y', '2022-07-10 13:33:17', '2022-07-11 13:33:17', NULL, 86400, 'N', NULL, 'N', 0),
(17, 'landing', 100, 'Bitrix\\Landing\\Agent::clearTempFiles();', 'Y', '2022-07-10 13:33:17', '2022-07-11 13:33:17', NULL, 86400, 'N', NULL, 'N', 0),
(18, 'messageservice', 100, '\\Bitrix\\MessageService\\Queue::cleanUpAgent();', 'Y', '2022-07-10 11:48:20', '2022-07-11 00:00:00', NULL, 86400, 'Y', NULL, 'N', 0),
(19, 'rest', 100, 'Bitrix\\Rest\\Marketplace\\Client::getNumUpdates();', 'Y', '2022-07-10 13:33:18', '2022-07-11 13:33:18', NULL, 86400, 'N', NULL, 'N', 0),
(20, 'rest', 100, '\\Bitrix\\Rest\\EventOfflineTable::cleanProcessAgent();', 'Y', '2022-07-10 13:33:18', '2022-07-11 13:33:18', NULL, 86400, 'N', NULL, 'N', 0),
(21, 'rest', 100, '\\Bitrix\\Rest\\LogTable::cleanUpAgent();', 'Y', '2022-07-10 13:33:18', '2022-07-11 13:33:18', NULL, 86400, 'N', NULL, 'N', 0),
(22, 'rest', 100, '\\Bitrix\\Rest\\Configuration\\Helper::sendStatisticAgent();', 'Y', '2022-07-10 13:33:18', '2022-07-11 13:33:18', NULL, 86400, 'N', NULL, 'N', 0),
(23, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::sendAgent();', 'Y', '2022-07-10 14:52:12', '2022-07-10 15:52:12', NULL, 3600, 'N', NULL, 'N', 0),
(24, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::cleanUpAgent();', 'Y', '2022-07-10 14:52:12', '2022-07-10 15:52:12', NULL, 3600, 'N', NULL, 'N', 0),
(25, 'rest', 100, '\\Bitrix\\Rest\\Marketplace\\Notification::checkAgent();', 'Y', '2022-07-10 13:33:18', '2022-07-11 13:33:18', NULL, 86400, 'N', NULL, 'N', 0),
(26, 'rest', 100, '\\Bitrix\\Rest\\Marketplace\\Immune::load();', 'Y', '2022-07-10 13:33:19', '2022-07-11 13:33:19', NULL, 86400, 'N', NULL, 'N', 0),
(27, 'rest', 100, '\\Bitrix\\Rest\\Configuration\\Structure::clearContentAgent();', 'Y', '2022-07-10 13:33:19', '2022-07-11 13:33:19', NULL, 86400, 'N', NULL, 'N', 0),
(28, 'rest', 100, '\\Bitrix\\Rest\\Helper::recoveryAgents();', 'Y', '2022-07-05 22:49:41', '2022-07-12 22:49:41', NULL, 604800, 'N', NULL, 'N', 0),
(29, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2022-07-10 13:33:20', '2022-07-11 13:33:20', NULL, 86400, 'N', NULL, 'N', 0),
(30, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2022-07-10 13:33:20', '2022-07-11 13:33:20', NULL, 86400, 'N', NULL, 'N', 0),
(31, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2022-07-10 14:52:12', '2022-07-10 15:52:12', NULL, 3600, 'N', NULL, 'N', 0),
(32, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2022-07-10 13:33:20', '2022-07-11 13:33:20', NULL, 86400, 'N', NULL, 'N', 0),
(33, 'seo', 100, 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2022-07-10 14:52:12', '2022-07-10 15:52:12', NULL, 3600, 'N', NULL, 'N', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_app_password`
--

CREATE TABLE `b_app_password` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_b24connector_buttons`
--

CREATE TABLE `b_b24connector_buttons` (
  `ID` int NOT NULL,
  `APP_ID` int NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_b24connector_button_site`
--

CREATE TABLE `b_b24connector_button_site` (
  `ID` int NOT NULL,
  `BUTTON_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_bitrixcloud_option`
--

CREATE TABLE `b_bitrixcloud_option` (
  `ID` int NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_bitrixcloud_option`
--

INSERT INTO `b_bitrixcloud_option` (`ID`, `NAME`, `SORT`, `PARAM_KEY`, `PARAM_VALUE`) VALUES
(1, 'backup_quota', 0, '0', '0'),
(2, 'backup_total_size', 0, '0', '0'),
(3, 'backup_last_backup_time', 0, '0', '1657036258'),
(4, 'monitoring_expire_time', 0, '0', '1657443155');

-- --------------------------------------------------------

--
-- Структура таблицы `b_cache_tag`
--

CREATE TABLE `b_cache_tag` (
  `ID` bigint NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_cache_tag`
--

INSERT INTO `b_cache_tag` (`ID`, `SITE_ID`, `CACHE_SALT`, `RELATIVE_PATH`, `TAG`) VALUES
(4, NULL, NULL, '0:1657435602', '**'),
(5, 's1', '/e25', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(7, 's1', '/e25', '/s1/bitrix/menu/345', 'bitrix:menu'),
(8, 's1', '/315', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(9, 's1', '/315', '/s1/bitrix/menu/345', 'bitrix:menu'),
(10, 's1', '/fb5', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(11, 's1', '/fb5', '/s1/bitrix/menu/345', 'bitrix:menu'),
(12, 's1', '/6d1', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(13, 's1', '/6d1', '/s1/bitrix/menu/345', 'bitrix:menu'),
(14, 's1', '/fc1', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(16, 's1', '/fc1', '/s1/bitrix/menu/345', 'bitrix:menu'),
(18, 's1', '/6f8', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(19, 's1', '/6f8', '/s1/bitrix/menu/345', 'bitrix:menu'),
(20, 's1', '/ee0', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(22, 's1', '/ee0', '/s1/bitrix/menu/345', 'bitrix:menu'),
(23, 's1', '/692', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(24, 's1', '/692', '/s1/bitrix/menu/345', 'bitrix:menu'),
(27, 's1', '/ee0', '/s1/bitrix/furniture.vacancies/ee0', 'iblock_id_2'),
(38, 's1', '/e25', '/s1/bitrix/furniture.vacancies/e25', 'iblock_id_2'),
(67, 's1', '/e25', '/s1/bitrix/news.list/e25', 'iblock_id_3'),
(68, 's1', '/e25', '/s1/bitrix/news.list/e25', 'iblock_id_4'),
(69, 's1', '/e25', '/s1/bitrix/news.list/e25', 'iblock_id_5');

-- --------------------------------------------------------

--
-- Структура таблицы `b_captcha`
--

CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_checklist`
--

CREATE TABLE `b_checklist` (
  `ID` int NOT NULL,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int DEFAULT NULL,
  `TOTAL` int DEFAULT NULL,
  `SUCCESS` int DEFAULT NULL,
  `FAILED` int DEFAULT NULL,
  `PENDING` int DEFAULT NULL,
  `SKIP` int DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_copy_queue`
--

CREATE TABLE `b_clouds_copy_queue` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `OP` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SOURCE_BUCKET_ID` int NOT NULL,
  `SOURCE_FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `TARGET_BUCKET_ID` int NOT NULL,
  `TARGET_FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int NOT NULL DEFAULT '-1',
  `FILE_POS` int NOT NULL DEFAULT '0',
  `FAIL_COUNTER` int NOT NULL DEFAULT '0',
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ERROR_MESSAGE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_delete_queue`
--

CREATE TABLE `b_clouds_delete_queue` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `BUCKET_ID` int NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_bucket`
--

CREATE TABLE `b_clouds_file_bucket` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int DEFAULT '0',
  `FILE_SIZE` double DEFAULT '0',
  `LAST_FILE_ID` int DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `FILE_RULES` text COLLATE utf8_unicode_ci,
  `FAILOVER_ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_BUCKET_ID` int DEFAULT NULL,
  `FAILOVER_COPY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE_DELAY` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_hash`
--

CREATE TABLE `b_clouds_file_hash` (
  `ID` int NOT NULL,
  `BUCKET_ID` int NOT NULL,
  `FILE_PATH` varchar(760) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` bigint DEFAULT NULL,
  `FILE_MTIME` datetime DEFAULT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_resize`
--

CREATE TABLE `b_clouds_file_resize` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_save`
--

CREATE TABLE `b_clouds_file_save` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `BUCKET_ID` int NOT NULL,
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_SIZE` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_upload`
--

CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` bigint DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int NOT NULL,
  `PART_SIZE` int NOT NULL,
  `PART_NO` int NOT NULL,
  `PART_FAIL_COUNTER` int NOT NULL,
  `NEXT_STEP` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_component_params`
--

CREATE TABLE `b_component_params` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int NOT NULL,
  `END_CHAR` int NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_component_params`
--

INSERT INTO `b_component_params` (`ID`, `SITE_ID`, `COMPONENT_NAME`, `TEMPLATE_NAME`, `REAL_PATH`, `SEF_MODE`, `SEF_FOLDER`, `START_CHAR`, `END_CHAR`, `PARAMETERS`) VALUES
(3, 's1', 'bitrix:menu', '.default', '/bitrix/templates/10/header.php', 'N', NULL, 2525, 2929, 'a:11:{s:14:\"ROOT_MENU_TYPE\";s:3:\"top\";s:9:\"MAX_LEVEL\";s:1:\"1\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:7:\"USE_EXT\";s:1:\"Y\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:15:\"MENU_CACHE_TYPE\";s:1:\"N\";s:15:\"MENU_CACHE_TIME\";s:4:\"3600\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:19:\"MENU_CACHE_GET_VARS\";N;s:5:\"DELAY\";s:1:\"N\";s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";}'),
(5, 's1', 'bitrix:furniture.vacancies', '.default', '/about/vacancies.php', 'N', NULL, 100, 498, 'a:11:{s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"Y\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:9:\"IBLOCK_ID\";s:1:\"2\";s:11:\"IBLOCK_TYPE\";s:9:\"vacancies\";}'),
(86, 's1', 'bitrix:main.feedback', 'first', '/index.php', 'N', NULL, 105, 451, 'a:6:{s:18:\"COMPONENT_TEMPLATE\";s:5:\"first\";s:8:\"EMAIL_TO\";s:23:\"mallaev.yakov@yandex.ru\";s:16:\"EVENT_MESSAGE_ID\";N;s:7:\"OK_TEXT\";s:59:\"Спасибо, ваше сообщение принято.\";s:15:\"REQUIRED_FIELDS\";a:2:{i:0;s:4:\"NAME\";i:1;s:5:\"EMAIL\";}s:11:\"USE_CAPTCHA\";s:1:\"N\";}'),
(87, 's1', 'bitrix:news.list', 'about', '/index.php', 'N', NULL, 461, 2064, 'a:52:{s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:18:\"COMPONENT_TEMPLATE\";s:5:\"about\";s:10:\"DETAIL_URL\";s:0:\"\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:10:\"FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:11:\"FILTER_NAME\";s:0:\"\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:1:\"3\";s:11:\"IBLOCK_TYPE\";s:11:\"rest_entity\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"Y\";s:19:\"INCLUDE_SUBSECTIONS\";s:1:\"Y\";s:11:\"MESSAGE_404\";s:0:\"\";s:10:\"NEWS_COUNT\";s:2:\"20\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:13:\"PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:17:\"SET_BROWSER_TITLE\";s:1:\"Y\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:20:\"SET_META_DESCRIPTION\";s:1:\"Y\";s:17:\"SET_META_KEYWORDS\";s:1:\"Y\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"Y\";s:8:\"SHOW_404\";s:1:\"N\";s:8:\"SORT_BY1\";s:2:\"ID\";s:8:\"SORT_BY2\";s:0:\"\";s:11:\"SORT_ORDER1\";s:3:\"ASC\";s:11:\"SORT_ORDER2\";s:0:\"\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";}'),
(88, 's1', 'bitrix:main.feedback', 'second', '/index.php', 'N', NULL, 2068, 2383, 'a:6:{s:18:\"COMPONENT_TEMPLATE\";s:6:\"second\";s:11:\"USE_CAPTCHA\";s:1:\"N\";s:7:\"OK_TEXT\";s:59:\"Спасибо, ваше сообщение принято.\";s:8:\"EMAIL_TO\";s:23:\"mallaev.yakov@yandex.ru\";s:15:\"REQUIRED_FIELDS\";N;s:16:\"EVENT_MESSAGE_ID\";N;}'),
(89, 's1', 'bitrix:news.list', 'reviews', '/index.php', 'N', NULL, 2393, 4017, 'a:52:{s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:18:\"COMPONENT_TEMPLATE\";s:7:\"reviews\";s:10:\"DETAIL_URL\";s:0:\"\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"N\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"N\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:10:\"FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:11:\"FILTER_NAME\";s:0:\"\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:1:\"4\";s:11:\"IBLOCK_TYPE\";s:11:\"rest_entity\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"Y\";s:19:\"INCLUDE_SUBSECTIONS\";s:1:\"Y\";s:11:\"MESSAGE_404\";s:0:\"\";s:10:\"NEWS_COUNT\";s:2:\"20\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:13:\"PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:17:\"SET_BROWSER_TITLE\";s:1:\"Y\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:20:\"SET_META_DESCRIPTION\";s:1:\"Y\";s:17:\"SET_META_KEYWORDS\";s:1:\"Y\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"Y\";s:8:\"SHOW_404\";s:1:\"N\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";}'),
(90, 's1', 'bitrix:news.list', 'contact', '/index.php', 'N', NULL, 4027, 5641, 'a:52:{s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:18:\"COMPONENT_TEMPLATE\";s:7:\"contact\";s:10:\"DETAIL_URL\";s:0:\"\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"N\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:10:\"FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:11:\"FILTER_NAME\";s:0:\"\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:1:\"5\";s:11:\"IBLOCK_TYPE\";s:11:\"rest_entity\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"Y\";s:19:\"INCLUDE_SUBSECTIONS\";s:1:\"Y\";s:11:\"MESSAGE_404\";s:0:\"\";s:10:\"NEWS_COUNT\";s:2:\"20\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:13:\"PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:17:\"SET_BROWSER_TITLE\";s:1:\"Y\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:20:\"SET_META_DESCRIPTION\";s:1:\"Y\";s:17:\"SET_META_KEYWORDS\";s:1:\"Y\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"N\";s:8:\"SHOW_404\";s:1:\"N\";s:8:\"SORT_BY1\";s:2:\"ID\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER1\";s:3:\"ASC\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_composite_log`
--

CREATE TABLE `b_composite_log` (
  `ID` int NOT NULL,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `AJAX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USER_ID` int NOT NULL DEFAULT '0',
  `PAGE_ID` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_composite_page`
--

CREATE TABLE `b_composite_page` (
  `ID` int NOT NULL,
  `CACHE_KEY` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int NOT NULL DEFAULT '0',
  `REWRITES` int NOT NULL DEFAULT '0',
  `SIZE` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_agreement`
--

CREATE TABLE `b_consent_agreement` (
  `ID` int NOT NULL,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_URL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_AGREEMENT_TEXT_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_field`
--

CREATE TABLE `b_consent_field` (
  `ID` int NOT NULL,
  `AGREEMENT_ID` int NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_user_consent`
--

CREATE TABLE `b_consent_user_consent` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_user_consent_item`
--

CREATE TABLE `b_consent_user_consent_item` (
  `ID` int NOT NULL,
  `USER_CONSENT_ID` int NOT NULL,
  `VALUE` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_counter_data`
--

CREATE TABLE `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_culture`
--

CREATE TABLE `b_culture` (
  `ID` int NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int DEFAULT '1',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHORT_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'n/j/Y',
  `MEDIUM_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j, Y',
  `LONG_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j, Y',
  `FULL_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j, Y',
  `DAY_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j',
  `DAY_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j',
  `DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j',
  `SHORT_DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'D, F j',
  `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'D, M j',
  `SHORT_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i a',
  `LONG_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i:s a',
  `AM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'am',
  `PM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pm',
  `NUMBER_THOUSANDS_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `NUMBER_DECIMAL_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `NUMBER_DECIMALS` tinyint DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_culture`
--

INSERT INTO `b_culture` (`ID`, `CODE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `SHORT_DATE_FORMAT`, `MEDIUM_DATE_FORMAT`, `LONG_DATE_FORMAT`, `FULL_DATE_FORMAT`, `DAY_MONTH_FORMAT`, `DAY_SHORT_MONTH_FORMAT`, `DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT`, `SHORT_TIME_FORMAT`, `LONG_TIME_FORMAT`, `AM_VALUE`, `PM_VALUE`, `NUMBER_THOUSANDS_SEPARATOR`, `NUMBER_DECIMAL_SEPARATOR`, `NUMBER_DECIMALS`) VALUES
(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y', 'd.m.Y', 'j M Y', 'j F Y', 'l, j F Y', 'j F', 'j M', 'l, j F', 'D, j F', 'D, j M', 'H:i', 'H:i:s', 'am', 'pm', ' ', ',', 2),
(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y', 'n/j/Y', 'M j, Y', 'F j, Y', 'l, F j, Y', 'F j', 'M j', 'l, F j', 'D, F j', 'D, M j', 'g:i a', 'g:i:s a', 'am', 'pm', ',', '.', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `b_entity_usage`
--

CREATE TABLE `b_entity_usage` (
  `USER_ID` int NOT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID_INT` int NOT NULL DEFAULT '0',
  `PREFIX` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LAST_USE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event`
--

CREATE TABLE `b_event` (
  `ID` int NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_attachment`
--

CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_log`
--

CREATE TABLE `b_event_log` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `GUEST_ID` int DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_log`
--

INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
(1, '2022-07-05 16:18:10', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(2, '2022-07-05 16:22:37', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(3, '2022-07-05 16:23:04', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(4, '2022-07-05 16:55:23', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:24:\"include/company_name.php\";}'),
(5, '2022-07-06 14:08:44', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/', 's1', NULL, NULL, ''),
(6, '2022-07-06 14:22:54', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(7, '2022-07-06 14:23:39', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:19:\"about/vacancies.php\";}'),
(8, '2022-07-06 14:23:54', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(9, '2022-07-06 14:27:17', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:26:\"include/company_slogan.php\";}'),
(10, '2022-07-06 14:28:06', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:24:\"include/company_name.php\";}'),
(11, '2022-07-06 14:34:35', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(12, '2022-07-09 06:14:12', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/', 's1', NULL, NULL, ''),
(13, '2022-07-09 06:24:17', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(14, '2022-07-09 07:03:47', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(15, '2022-07-09 07:29:42', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(16, '2022-07-09 07:30:41', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(17, '2022-07-09 08:11:36', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(18, '2022-07-09 08:11:57', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(19, '2022-07-09 08:20:58', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(20, '2022-07-09 08:32:32', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(21, '2022-07-09 08:33:17', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(22, '2022-07-09 08:39:21', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(23, '2022-07-10 06:33:14', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/', 's1', 1, NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message`
--

CREATE TABLE `b_event_message` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_message`
--

INSERT INTO `b_event_message` (`ID`, `TIMESTAMP_X`, `EVENT_NAME`, `LID`, `ACTIVE`, `EMAIL_FROM`, `EMAIL_TO`, `SUBJECT`, `MESSAGE`, `MESSAGE_PHP`, `BODY_TYPE`, `BCC`, `REPLY_TO`, `CC`, `IN_REPLY_TO`, `PRIORITY`, `FIELD1_NAME`, `FIELD1_VALUE`, `FIELD2_NAME`, `FIELD2_VALUE`, `SITE_TEMPLATE_ID`, `ADDITIONAL_FIELD`, `LANGUAGE_ID`) VALUES
(1, '2022-07-05 11:41:32', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(2, '2022-07-05 11:41:32', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(3, '2022-07-05 11:41:32', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(4, '2022-07-05 11:41:32', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(5, '2022-07-05 11:41:32', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(6, '2022-07-05 11:41:32', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(7, '2022-07-05 11:41:32', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(8, '2022-07-05 11:41:32', 'MAIN_MAIL_CONFIRM_CODE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#MESSAGE_SUBJECT#', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_join', NULL, NULL),
(9, '2022-07-05 11:41:32', 'EVENT_LOG_NOTIFICATION', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Оповещение журнала событий: #NAME#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: #AUDIT_TYPE_ID#\nОбъект: #ITEM_ID#\nПользователь: #USER_ID# \nIP-адрес: #REMOTE_ADDR#\nБраузер: #USER_AGENT#\nСтраница: #REQUEST_URI# \n\nКоличество записей: #EVENT_COUNT# \n\n#ADDITIONAL_TEXT#\n\nПерейти в журнал событий:\nhttp://#SERVER_NAME#/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=#AUDIT_TYPE_ID#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: <?=$arParams[\"AUDIT_TYPE_ID\"];?>\n\nОбъект: <?=$arParams[\"ITEM_ID\"];?>\n\nПользователь: <?=$arParams[\"USER_ID\"];?> \nIP-адрес: <?=$arParams[\"REMOTE_ADDR\"];?>\n\nБраузер: <?=$arParams[\"USER_AGENT\"];?>\n\nСтраница: <?=$arParams[\"REQUEST_URI\"];?> \n\nКоличество записей: <?=$arParams[\"EVENT_COUNT\"];?> \n\n<?=$arParams[\"ADDITIONAL_TEXT\"];?>\n\n\nПерейти в журнал событий:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=<?=$arParams[\"AUDIT_TYPE_ID\"];?>', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(10, '2022-07-05 11:41:32', 'USER_CODE_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос кода авторизации', 'Используйте для авторизации код:\n\n#CHECKWORD#\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nЛогин: #LOGIN#\n\nСообщение создано автоматически.', 'Используйте для авторизации код:\n\n<?=$arParams[\"CHECKWORD\"];?>\n\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nЛогин: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение создано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_attachment`
--

CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int NOT NULL,
  `FILE_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_site`
--

CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_message_site`
--

INSERT INTO `b_event_message_site` (`EVENT_MESSAGE_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1'),
(8, 's1'),
(9, 's1'),
(10, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_type`
--

CREATE TABLE `b_event_type` (
  `ID` int NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int NOT NULL DEFAULT '150',
  `EVENT_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_type`
--

INSERT INTO `b_event_type` (`ID`, `LID`, `EVENT_NAME`, `NAME`, `DESCRIPTION`, `SORT`, `EVENT_TYPE`) VALUES
(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1, 'email'),
(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2, 'email'),
(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3, 'email'),
(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4, 'email'),
(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5, 'email'),
(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6, 'email'),
(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7, 'email'),
(8, 'ru', 'MAIN_MAIL_CONFIRM_CODE', 'Подтверждение email-адреса отправителя', '\n\n#EMAIL_TO# - Email-адрес для подтверждения\n#MESSAGE_SUBJECT# - Тема сообщения\n#CONFIRM_CODE# - Код подтверждения', 8, 'email'),
(9, 'ru', 'EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#EMAIL# - Email получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 9, 'email'),
(10, 'ru', 'USER_CODE_REQUEST', 'Запрос кода авторизации', '#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#LOGIN# - Логин\n#CHECKWORD# - Код для авторизации\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - Email пользователя\n', 10, 'email'),
(11, 'ru', 'SMS_USER_CONFIRM_NUMBER', 'Подтверждение номера телефона по СМС', '#USER_PHONE# - номер телефона\n#CODE# - код подтверждения\n', 100, 'sms'),
(12, 'ru', 'SMS_USER_RESTORE_PASSWORD', 'Восстановление пароля через СМС', '#USER_PHONE# - номер телефона\n#CODE# - код для восстановления\n', 100, 'sms'),
(13, 'ru', 'SMS_EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#PHONE_NUMBER# - Номер телефона получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 100, 'sms'),
(14, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1, 'email'),
(15, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2, 'email'),
(16, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3, 'email'),
(17, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4, 'email'),
(18, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5, 'email'),
(19, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6, 'email'),
(20, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', 7, 'email'),
(21, 'en', 'MAIN_MAIL_CONFIRM_CODE', 'Confirm sender\'s email address', '\n\n#EMAIL_TO# - confirmation email address\n#MESSAGE_SUBJECT# - Message subject\n#CONFIRM_CODE# - Confirmation code', 8, 'email'),
(22, 'en', 'EVENT_LOG_NOTIFICATION', 'Event log notification', '#EMAIL# - Recipient email\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 9, 'email'),
(23, 'en', 'USER_CODE_REQUEST', 'Request for verification code', '#USER_ID# - user ID\n#STATUS# - Login status\n#LOGIN# - Login\n#CHECKWORD# - Verification code\n#NAME# - First name\n#LAST_NAME# - Last name\n#EMAIL# - User email\n', 10, 'email'),
(24, 'en', 'SMS_USER_CONFIRM_NUMBER', 'Verify phone number using SMS', '#USER_PHONE# - phone number\n#CODE# - confirmation code', 100, 'sms'),
(25, 'en', 'SMS_USER_RESTORE_PASSWORD', 'Recover password using SMS', '#USER_PHONE# - phone number\n#CODE# - recovery confirmation code', 100, 'sms'),
(26, 'en', 'SMS_EVENT_LOG_NOTIFICATION', 'Event log notification', '#PHONE_NUMBER# - Recipient phone number\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 100, 'sms');

-- --------------------------------------------------------

--
-- Структура таблицы `b_favorite`
--

CREATE TABLE `b_favorite` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int NOT NULL DEFAULT '100',
  `MODIFIED_BY` int DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `CODE_ID` int DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file`
--

CREATE TABLE `b_file` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `WIDTH` int DEFAULT NULL,
  `FILE_SIZE` bigint DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_file`
--

INSERT INTO `b_file` (`ID`, `TIMESTAMP_X`, `MODULE_ID`, `HEIGHT`, `WIDTH`, `FILE_SIZE`, `CONTENT_TYPE`, `SUBDIR`, `FILE_NAME`, `ORIGINAL_NAME`, `DESCRIPTION`, `HANDLER_ID`, `EXTERNAL_ID`) VALUES
(1, '2022-07-06 14:26:35', 'iblock', 69, 70, 2598, 'image/png', 'iblock/be7', 'b63q0nn8nfxftnx5mvqkfj35mifx1msc.png', 'why1.png', '', NULL, '02195cb601a8b8e7753b5c9a4f3c973c'),
(2, '2022-07-09 06:16:29', 'iblock', 43, 70, 2074, 'image/png', 'iblock/955', '4309r8funw9jlpnl0e9yqj2ecnf5co82.png', 'why2.png', '', NULL, 'a3b45aa51c115e94db3b60f8802660de'),
(3, '2022-07-09 06:16:53', 'iblock', 70, 58, 2362, 'image/png', 'iblock/c39', 'bd2n83k9b9amld56d50bubdlz0ekqxzr.png', 'why3.png', '', NULL, '9372f150368432b2bf35faf95e103726'),
(4, '2022-07-09 06:17:20', 'iblock', 65, 70, 2635, 'image/png', 'iblock/98f', 'mlxj5j1imethziaey19g0ex1uhzs3983.png', 'why4.png', '', NULL, '52ad9cdd04d75fc529aa5100ac5560c2'),
(5, '2022-07-09 06:17:38', 'iblock', 70, 53, 2074, 'image/png', 'iblock/507', 'qvuswgyg7hxtzg1o1w816hfc42c4iu01.png', 'why5.png', '', NULL, 'ac4016a98a14aa6739f45d9c68529ac1'),
(6, '2022-07-09 06:21:30', 'iblock', 60, 55, 2151, 'image/png', 'iblock/223', 'duo46nhps0of9xhqarvzoeklcoazyeju.png', 'c1.png', '', NULL, '28d910ec6d94f3d271d684af23fb223d'),
(7, '2022-07-09 06:22:01', 'iblock', 60, 60, 3015, 'image/png', 'iblock/20e', 'mlvsi42offjtd3tc5wn3pnqx5uhipww2.png', 'c2.png', '', NULL, '87e9d8519da2bab3780b97fee4e05da5'),
(8, '2022-07-09 06:22:21', 'iblock', 50, 50, 2071, 'image/png', 'iblock/a56', '5cy98n1bnsyz480e9e3i5bebvfkbv2dw.png', 'c3.png', '', NULL, '1e556734d3f8f458dc0b6e87c3d92a2e'),
(9, '2022-07-09 06:22:37', 'iblock', 45, 61, 2287, 'image/png', 'iblock/898', 'f7m1ryfto2081up07ybxjni0804tq2kh.png', 'c4.png', '', NULL, 'e78a1e48b074cb731865d44601d7b6e3'),
(10, '2022-07-09 06:25:24', 'iblock', 69, 70, 2598, 'image/png', 'iblock/be7', 'b63q0nn8nfxftnx5mvqkfj35mifx1msc.png', 'why1.png', '', NULL, '2d5ba70c4733f0178092fba748ec73de'),
(11, '2022-07-09 07:11:37', 'iblock', 841, 595, 72315, 'image/jpeg', 'iblock/3bb', 'fqkh8hlntv3iyoa9r41m01sabrs78m8a.jpg', 'r1.jpg', '', NULL, '841990094a296b6a390e142e74af52b3'),
(12, '2022-07-09 07:11:52', 'iblock', 1762, 1244, 353659, 'image/jpeg', 'iblock/141', 'z231doalg4sfzoeh1e32z9g8rwd589jq.jpg', 'r2.jpg', '', NULL, 'e2dfde417fc8dc6ec5c4489826d0cb6e'),
(13, '2022-07-09 07:59:19', 'iblock', 267, 189, 5429, 'image/png', 'iblock/f11', '732fd24fu8zjor2sabpp4hgzceei0098.png', 'r1.png', '', NULL, '5a2047afde0d95bff4ab5669001c77b8');

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_duplicate`
--

CREATE TABLE `b_file_duplicate` (
  `DUPLICATE_ID` int NOT NULL,
  `ORIGINAL_ID` int NOT NULL,
  `COUNTER` int NOT NULL DEFAULT '1',
  `ORIGINAL_DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_file_duplicate`
--

INSERT INTO `b_file_duplicate` (`DUPLICATE_ID`, `ORIGINAL_ID`, `COUNTER`, `ORIGINAL_DELETED`) VALUES
(10, 1, 1, 'Y');

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_hash`
--

CREATE TABLE `b_file_hash` (
  `FILE_ID` int NOT NULL,
  `FILE_SIZE` bigint NOT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_file_hash`
--

INSERT INTO `b_file_hash` (`FILE_ID`, `FILE_SIZE`, `FILE_HASH`) VALUES
(8, 2071, 'c69b87660df4ea51c40f11b69a9ff0b9'),
(5, 2074, '3e39528e15d8f88713ed8aebae998820'),
(2, 2074, 'b329929f49ef272975e598cbed711900'),
(6, 2151, 'f72a0b319d1250530ac027e854f922eb'),
(9, 2287, '99397f1a443375e1cb12395ae789f96e'),
(3, 2362, 'd2fab8432497a1a03f273e04f1a9f72b'),
(1, 2598, '3201db89ada47849802e9a689adb45d3'),
(4, 2635, '21dd0bf040267dcbd7c964f784a02c7e'),
(7, 3015, '8a4a80f6b6aa4acf81a835130f4fe91e'),
(13, 5429, 'cb7023e6312d2ed065a751473f0f323f'),
(11, 72315, '5f905ef533b5d118011dff14eced1cc8'),
(12, 353659, '685514477e3dc37ca06cfdea729c1887');

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_preview`
--

CREATE TABLE `b_file_preview` (
  `ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `PREVIEW_ID` int DEFAULT NULL,
  `PREVIEW_IMAGE_ID` int DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL,
  `TOUCHED_AT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_search`
--

CREATE TABLE `b_file_search` (
  `ID` int NOT NULL,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int NOT NULL DEFAULT '0',
  `F_SIZE` int NOT NULL DEFAULT '0',
  `F_TIME` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_filters`
--

CREATE TABLE `b_filters` (
  `ID` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_finder_dest`
--

CREATE TABLE `b_finder_dest` (
  `USER_ID` int NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_geoip_handlers`
--

CREATE TABLE `b_geoip_handlers` (
  `ID` int NOT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_geoip_handlers`
--

INSERT INTO `b_geoip_handlers` (`ID`, `SORT`, `ACTIVE`, `CLASS_NAME`, `CONFIG`) VALUES
(1, 100, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', NULL),
(2, 110, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_group`
--

CREATE TABLE `b_group` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_group`
--

INSERT INTO `b_group` (`ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `ANONYMOUS`, `IS_SYSTEM`, `NAME`, `DESCRIPTION`, `SECURITY_POLICY`, `STRING_ID`) VALUES
(1, NULL, 'Y', 1, 'N', 'Y', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
(2, NULL, 'Y', 2, 'Y', 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
(3, NULL, 'Y', 3, 'N', 'Y', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
(4, NULL, 'Y', 4, 'N', 'Y', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY'),
(5, NULL, 'Y', 300, 'N', 'Y', 'Контент-редакторы', NULL, NULL, 'content_editor');

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_collection_task`
--

CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int NOT NULL,
  `TASK_ID` int NOT NULL,
  `COLLECTION_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_subordinate`
--

CREATE TABLE `b_group_subordinate` (
  `ID` int NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_task`
--

CREATE TABLE `b_group_task` (
  `GROUP_ID` int NOT NULL,
  `TASK_ID` int NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_group_task`
--

INSERT INTO `b_group_task` (`GROUP_ID`, `TASK_ID`, `EXTERNAL_ID`) VALUES
(5, 22, ''),
(5, 50, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity`
--

CREATE TABLE `b_hlblock_entity` (
  `ID` int UNSIGNED NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity_lang`
--

CREATE TABLE `b_hlblock_entity_lang` (
  `ID` int UNSIGNED NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity_rights`
--

CREATE TABLE `b_hlblock_entity_rights` (
  `ID` int UNSIGNED NOT NULL,
  `HL_ID` int UNSIGNED NOT NULL,
  `TASK_ID` int UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys`
--

CREATE TABLE `b_hot_keys` (
  `ID` int NOT NULL,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int NOT NULL,
  `USER_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_hot_keys`
--

INSERT INTO `b_hot_keys` (`ID`, `KEYS_STRING`, `CODE_ID`, `USER_ID`) VALUES
(1, 'Ctrl+Alt+85', 139, 0),
(2, 'Ctrl+Alt+80', 17, 0),
(3, 'Ctrl+Alt+70', 120, 0),
(4, 'Ctrl+Alt+68', 117, 0),
(5, 'Ctrl+Alt+81', 3, 0),
(6, 'Ctrl+Alt+75', 106, 0),
(7, 'Ctrl+Alt+79', 133, 0),
(8, 'Ctrl+Alt+70', 121, 0),
(9, 'Ctrl+Alt+69', 118, 0),
(10, 'Ctrl+Shift+83', 87, 0),
(11, 'Ctrl+Shift+88', 88, 0),
(12, 'Ctrl+Shift+76', 89, 0),
(13, 'Ctrl+Alt+85', 139, 1),
(14, 'Ctrl+Alt+80', 17, 1),
(15, 'Ctrl+Alt+70', 120, 1),
(16, 'Ctrl+Alt+68', 117, 1),
(17, 'Ctrl+Alt+81', 3, 1),
(18, 'Ctrl+Alt+75', 106, 1),
(19, 'Ctrl+Alt+79', 133, 1),
(20, 'Ctrl+Alt+70', 121, 1),
(21, 'Ctrl+Alt+69', 118, 1),
(22, 'Ctrl+Shift+83', 87, 1),
(23, 'Ctrl+Shift+88', 88, 1),
(24, 'Ctrl+Shift+76', 89, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys_code`
--

CREATE TABLE `b_hot_keys_code` (
  `ID` int NOT NULL,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_hot_keys_code`
--

INSERT INTO `b_hot_keys_code` (`ID`, `CLASS_NAME`, `CODE`, `NAME`, `COMMENTS`, `TITLE_OBJ`, `URL`, `IS_CUSTOM`) VALUES
(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
(91, 'top_panel_menu', 'var d=BX(\"bx-panel-menu\"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock`
--

CREATE TABLE `b_iblock` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `API_CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REST_ON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int DEFAULT NULL,
  `RSS_FILE_DAYS` int DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock`
--

INSERT INTO `b_iblock` (`ID`, `TIMESTAMP_X`, `IBLOCK_TYPE_ID`, `LID`, `CODE`, `API_CODE`, `REST_ON`, `NAME`, `ACTIVE`, `SORT`, `LIST_PAGE_URL`, `DETAIL_PAGE_URL`, `SECTION_PAGE_URL`, `CANONICAL_PAGE_URL`, `PICTURE`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `RSS_TTL`, `RSS_ACTIVE`, `RSS_FILE_ACTIVE`, `RSS_FILE_LIMIT`, `RSS_FILE_DAYS`, `RSS_YANDEX_ACTIVE`, `XML_ID`, `TMP_ID`, `INDEX_ELEMENT`, `INDEX_SECTION`, `WORKFLOW`, `BIZPROC`, `SECTION_CHOOSER`, `LIST_MODE`, `RIGHTS_MODE`, `SECTION_PROPERTY`, `PROPERTY_INDEX`, `VERSION`, `LAST_CONV_ELEMENT`, `SOCNET_GROUP_ID`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `SECTIONS_NAME`, `SECTION_NAME`, `ELEMENTS_NAME`, `ELEMENT_NAME`) VALUES
(1, '2022-07-10 05:05:02', 'news', 's1', 'corporate_news_s1', NULL, 'N', '[s1] Новости', 'Y', 500, '#SITE_DIR#/news/', '#SITE_DIR#/news/#ID#/', '#SITE_DIR#/news/list.php?SECTION_ID=#ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', 'corporate_news_s1', '354cf3c8ddaee9ff1bd68c0d85f0c810', 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Новости', 'Новость'),
(2, '2022-07-05 15:58:30', 'vacancies', 's1', 'corp_vacancies_s1', NULL, 'N', 'Вакансии', 'Y', 500, '#SITE_DIR#/about/vacancies', '#SITE_DIR#/about/vacancies.php##ID#', '', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', 'corp_vacancies_s1', '905232eaca70fe7c1bbd93aa93737d4a', 'Y', 'N', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Вакансии', 'Вакансия'),
(3, '2022-07-06 14:17:37', 'rest_entity', 's1', 'about', NULL, 'N', 'Почему выбирают нас', 'Y', 500, '#SITE_DIR#/rest_entity/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/rest_entity/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/rest_entity/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
(4, '2022-07-09 06:18:58', 'rest_entity', 's1', '', NULL, 'N', 'Отзывы и благодарности', 'Y', 500, '#SITE_DIR#/rest_entity/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/rest_entity/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/rest_entity/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
(5, '2022-07-09 06:19:13', 'rest_entity', 's1', '', NULL, 'N', 'Контактная информация', 'Y', 500, '#SITE_DIR#/rest_entity/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/rest_entity/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/rest_entity/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
(6, '2022-07-10 05:55:46', 'news', 's1', 'news2', 'news2', 'N', 'Новости2', 'Y', 500, '#SITE_DIR#/news/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/news/detail.php?ID=#ELEMENT_ID#', NULL, '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'N', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', NULL, NULL, 'Элементы', 'Элемент');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_cache`
--

CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element`
--

CREATE TABLE `b_iblock_element` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `IBLOCK_ID` int NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int DEFAULT NULL,
  `SHOW_COUNTER` int DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_element`
--

INSERT INTO `b_iblock_element` (`ID`, `TIMESTAMP_X`, `MODIFIED_BY`, `DATE_CREATE`, `CREATED_BY`, `IBLOCK_ID`, `IBLOCK_SECTION_ID`, `ACTIVE`, `ACTIVE_FROM`, `ACTIVE_TO`, `SORT`, `NAME`, `PREVIEW_PICTURE`, `PREVIEW_TEXT`, `PREVIEW_TEXT_TYPE`, `DETAIL_PICTURE`, `DETAIL_TEXT`, `DETAIL_TEXT_TYPE`, `SEARCHABLE_CONTENT`, `WF_STATUS_ID`, `WF_PARENT_ELEMENT_ID`, `WF_NEW`, `WF_LOCKED_BY`, `WF_DATE_LOCK`, `WF_COMMENTS`, `IN_SECTIONS`, `XML_ID`, `CODE`, `TAGS`, `TMP_ID`, `WF_LAST_HISTORY_ID`, `SHOW_COUNTER`, `SHOW_COUNTER_START`) VALUES
(1, '2022-07-05 22:50:19', 1, '2022-07-05 22:50:19', 1, 1, NULL, 'Y', '2010-05-28 00:00:00', NULL, 500, 'Банк переносит дату вступления в действие тарифов на услуги в иностранной валюте', NULL, 'Уважаемые клиенты,<br />\nсообщаем Вам, что Банк переносит дату вступления в действие тарифов на услуги для юридических лиц и индивидуальных предпринимателей в иностранной валюте. В связи с этим до даты введения в действие новой редакции тарифов, услуги юридическим лицам и индивидуальным предпринимателям будут оказываться в рамках действующих тарифов. <br />\nИнформация о дате введения новой редакции тарифов будет сообщена дополнительно.', 'html', NULL, 'Уважаемые клиенты,<br />\nсообщаем Вам, что Банк переносит дату вступления в действие тарифов на услуги для юридических лиц и индивидуальных предпринимателей в иностранной валюте. В связи с этим до даты введения в действие новой редакции тарифов, услуги юридическим лицам и индивидуальным предпринимателям будут оказываться в рамках действующих тарифов. <br />\nИнформация о дате введения новой редакции тарифов будет сообщена дополнительно.', 'html', 'БАНК ПЕРЕНОСИТ ДАТУ ВСТУПЛЕНИЯ В ДЕЙСТВИЕ ТАРИФОВ НА УСЛУГИ В ИНОСТРАННОЙ ВАЛЮТЕ\r\nУВАЖАЕМЫЕ КЛИЕНТЫ,\r\nСООБЩАЕМ ВАМ, ЧТО БАНК ПЕРЕНОСИТ ДАТУ ВСТУПЛЕНИЯ \r\nВ ДЕЙСТВИЕ ТАРИФОВ НА УСЛУГИ ДЛЯ ЮРИДИЧЕСКИХ ЛИЦ И ИНДИВИДУАЛЬНЫХ ПРЕДПРИНИМАТЕЛЕЙ В ИНОСТРАННОЙ ВАЛЮТЕ. В СВЯЗИ С ЭТИМ ДО ДАТЫ ВВЕДЕНИЯ В ДЕЙСТВИЕ НОВОЙ РЕДАКЦИИ ТАРИФОВ, УСЛУГИ ЮРИДИЧЕСКИМ ЛИЦАМ И ИНДИВИДУАЛЬНЫМ ПРЕДПРИНИМАТЕЛЯМ БУДУТ ОКАЗЫВАТЬСЯ В РАМКАХ ДЕЙСТВУЮЩИХ ТАРИФОВ. \r\nИНФОРМАЦИЯ О ДАТЕ ВВЕДЕНИЯ НОВОЙ РЕДАКЦИИ \r\nТАРИФОВ БУДЕТ СООБЩЕНА ДОПОЛНИТЕЛЬНО.\r\nУВАЖАЕМЫЕ КЛИЕНТЫ,\r\nСООБЩАЕМ ВАМ, ЧТО БАНК ПЕРЕНОСИТ ДАТУ ВСТУПЛЕНИЯ \r\nВ ДЕЙСТВИЕ ТАРИФОВ НА УСЛУГИ ДЛЯ ЮРИДИЧЕСКИХ ЛИЦ И ИНДИВИДУАЛЬНЫХ ПРЕДПРИНИМАТЕЛЕЙ В ИНОСТРАННОЙ ВАЛЮТЕ. В СВЯЗИ С ЭТИМ ДО ДАТЫ ВВЕДЕНИЯ В ДЕЙСТВИЕ НОВОЙ РЕДАКЦИИ ТАРИФОВ, УСЛУГИ ЮРИДИЧЕСКИМ ЛИЦАМ И ИНДИВИДУАЛЬНЫМ ПРЕДПРИНИМАТЕЛЯМ БУДУТ ОКАЗЫВАТЬСЯ В РАМКАХ ДЕЙСТВУЮЩИХ ТАРИФОВ. \r\nИНФОРМАЦИЯ О ДАТЕ ВВЕДЕНИЯ НОВОЙ РЕДАКЦИИ \r\nТАРИФОВ БУДЕТ СООБЩЕНА ДОПОЛНИТЕЛЬНО.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '1', '', '', '346668823', NULL, 1, '2022-07-05 22:54:07'),
(2, '2022-07-05 22:50:21', 1, '2022-07-05 22:50:19', 1, 1, NULL, 'Y', '2010-05-27 00:00:00', NULL, 500, 'Начать работать с системой «Интернет-Клиент» стало еще проще ', NULL, 'Наш Банк предлагает своим клиентам Мастер Установки «Интернет-Клиент», который существенно упростит начало работы с системой. Теперь достаточно скачать и запустить Мастер Установки, и все настройки будут произведены автоматически. Вам больше не нужно тратить время на изучение объемных инструкций, или звонить в службу техподдержки, чтобы начать работать с системой.', 'html', NULL, 'Наш Банк предлагает своим клиентам Мастер Установки «Интернет-Клиент», который существенно упростит начало работы с системой. Теперь достаточно скачать и запустить Мастер Установки, и все настройки будут произведены автоматически. Вам больше не нужно тратить время на изучение объемных инструкций, или звонить в службу техподдержки, чтобы начать работать с системой.', 'text', 'НАЧАТЬ РАБОТАТЬ С СИСТЕМОЙ «ИНТЕРНЕТ-КЛИЕНТ» СТАЛО ЕЩЕ ПРОЩЕ \r\nНАШ БАНК ПРЕДЛАГАЕТ СВОИМ КЛИЕНТАМ МАСТЕР \r\nУСТАНОВКИ «ИНТЕРНЕТ-КЛИЕНТ», КОТОРЫЙ СУЩЕСТВЕННО УПРОСТИТ НАЧАЛО РАБОТЫ С СИСТЕМОЙ. ТЕПЕРЬ ДОСТАТОЧНО СКАЧАТЬ И ЗАПУСТИТЬ МАСТЕР УСТАНОВКИ, И ВСЕ НАСТРОЙКИ БУДУТ ПРОИЗВЕДЕНЫ АВТОМАТИЧЕСКИ. ВАМ БОЛЬШЕ НЕ НУЖНО ТРАТИТЬ ВРЕМЯ НА ИЗУЧЕНИЕ ОБЪЕМНЫХ ИНСТРУКЦИЙ, ИЛИ ЗВОНИТЬ В СЛУЖБУ ТЕХПОДДЕРЖКИ, ЧТОБЫ НАЧАТЬ РАБОТАТЬ С СИСТЕМОЙ.\r\nНАШ БАНК ПРЕДЛАГАЕТ СВОИМ КЛИЕНТАМ МАСТЕР УСТАНОВКИ «ИНТЕРНЕТ-КЛИЕНТ», КОТОРЫЙ СУЩЕСТВЕННО УПРОСТИТ НАЧАЛО РАБОТЫ С СИСТЕМОЙ. ТЕПЕРЬ ДОСТАТОЧНО СКАЧАТЬ И ЗАПУСТИТЬ МАСТЕР УСТАНОВКИ, И ВСЕ НАСТРОЙКИ БУДУТ ПРОИЗВЕДЕНЫ АВТОМАТИЧЕСКИ. ВАМ БОЛЬШЕ НЕ НУЖНО ТРАТИТЬ ВРЕМЯ НА ИЗУЧЕНИЕ ОБЪЕМНЫХ ИНСТРУКЦИЙ, ИЛИ ЗВОНИТЬ В СЛУЖБУ ТЕХПОДДЕРЖКИ, ЧТОБЫ НАЧАТЬ РАБОТАТЬ С СИСТЕМОЙ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '2', '', '', '847552514', NULL, NULL, NULL),
(3, '2022-07-10 12:06:11', 1, '2022-07-05 22:50:21', 1, 1, NULL, 'Y', '2010-05-24 00:00:00', NULL, 500, 'Реорганизация сети отделений Банка ', NULL, 'В ближайшее время будет значительно расширен продуктовый ряд и перечень предоставляемых банковских услуг, которые Банк сможет предлагать во всех своих дополнительных офисах. Теперь наши клиенты смогут получить полный перечень услуг в любом из отделений Банка. <br />\r\nБыло проведено комплексное всестороннее исследование функционирования региональных офисов на предмет соответствия возросшим требованиям. В результате, принято решение о временном закрытии офисов, не соответствующих высоким стандартам и не приспособленных к требованиям растущего бизнеса. Офисы постепенно будут отремонтированы и переоборудованы, станут современными и удобными. <br />\r\n<br />\r\nПриносим свои извинения за временно доставленные неудобства. ', 'html', NULL, 'В ближайшее время будет значительно расширен продуктовый ряд и перечень предоставляемых банковских услуг, которые Банк сможет предлагать во всех своих дополнительных офисах. Теперь наши клиенты смогут получить полный перечень услуг в любом из отделений Банка. <br />\r\nБыло проведено комплексное всестороннее исследование функционирования региональных офисов на предмет соответствия возросшим требованиям. В результате, принято решение о временном закрытии офисов, не соответствующих высоким стандартам и не приспособленных к требованиям растущего бизнеса. Офисы постепенно будут отремонтированы и переоборудованы, станут современными и удобными. <br />\r\n<br />\r\nПриносим свои извинения за временно доставленные неудобства. ', 'html', 'РЕОРГАНИЗАЦИЯ СЕТИ ОТДЕЛЕНИЙ БАНКА \r\nВ БЛИЖАЙШЕЕ ВРЕМЯ БУДЕТ ЗНАЧИТЕЛЬНО РАСШИРЕН \r\nПРОДУКТОВЫЙ РЯД И ПЕРЕЧЕНЬ ПРЕДОСТАВЛЯЕМЫХ БАНКОВСКИХ УСЛУГ, КОТОРЫЕ БАНК СМОЖЕТ ПРЕДЛАГАТЬ ВО ВСЕХ СВОИХ ДОПОЛНИТЕЛЬНЫХ ОФИСАХ. ТЕПЕРЬ НАШИ КЛИЕНТЫ СМОГУТ ПОЛУЧИТЬ ПОЛНЫЙ ПЕРЕЧЕНЬ УСЛУГ В ЛЮБОМ ИЗ ОТДЕЛЕНИЙ БАНКА. \r\nБЫЛО ПРОВЕДЕНО КОМПЛЕКСНОЕ ВСЕСТОРОННЕЕ \r\nИССЛЕДОВАНИЕ ФУНКЦИОНИРОВАНИЯ РЕГИОНАЛЬНЫХ ОФИСОВ НА ПРЕДМЕТ СООТВЕТСТВИЯ ВОЗРОСШИМ ТРЕБОВАНИЯМ. В РЕЗУЛЬТАТЕ, ПРИНЯТО РЕШЕНИЕ О ВРЕМЕННОМ ЗАКРЫТИИ ОФИСОВ, НЕ СООТВЕТСТВУЮЩИХ ВЫСОКИМ СТАНДАРТАМ И НЕ ПРИСПОСОБЛЕННЫХ К ТРЕБОВАНИЯМ РАСТУЩЕГО БИЗНЕСА. ОФИСЫ ПОСТЕПЕННО БУДУТ ОТРЕМОНТИРОВАНЫ И ПЕРЕОБОРУДОВАНЫ, СТАНУТ СОВРЕМЕННЫМИ И УДОБНЫМИ. \r\n\r\nПРИНОСИМ СВОИ ИЗВИНЕНИЯ ЗА ВРЕМЕННО ДОСТАВЛЕННЫЕ \r\nНЕУДОБСТВА.\r\nВ БЛИЖАЙШЕЕ ВРЕМЯ БУДЕТ ЗНАЧИТЕЛЬНО РАСШИРЕН \r\nПРОДУКТОВЫЙ РЯД И ПЕРЕЧЕНЬ ПРЕДОСТАВЛЯЕМЫХ БАНКОВСКИХ УСЛУГ, КОТОРЫЕ БАНК СМОЖЕТ ПРЕДЛАГАТЬ ВО ВСЕХ СВОИХ ДОПОЛНИТЕЛЬНЫХ ОФИСАХ. ТЕПЕРЬ НАШИ КЛИЕНТЫ СМОГУТ ПОЛУЧИТЬ ПОЛНЫЙ ПЕРЕЧЕНЬ УСЛУГ В ЛЮБОМ ИЗ ОТДЕЛЕНИЙ БАНКА. \r\nБЫЛО ПРОВЕДЕНО КОМПЛЕКСНОЕ ВСЕСТОРОННЕЕ \r\nИССЛЕДОВАНИЕ ФУНКЦИОНИРОВАНИЯ РЕГИОНАЛЬНЫХ ОФИСОВ НА ПРЕДМЕТ СООТВЕТСТВИЯ ВОЗРОСШИМ ТРЕБОВАНИЯМ. В РЕЗУЛЬТАТЕ, ПРИНЯТО РЕШЕНИЕ О ВРЕМЕННОМ ЗАКРЫТИИ ОФИСОВ, НЕ СООТВЕТСТВУЮЩИХ ВЫСОКИМ СТАНДАРТАМ И НЕ ПРИСПОСОБЛЕННЫХ К ТРЕБОВАНИЯМ РАСТУЩЕГО БИЗНЕСА. ОФИСЫ ПОСТЕПЕННО БУДУТ ОТРЕМОНТИРОВАНЫ И ПЕРЕОБОРУДОВАНЫ, СТАНУТ СОВРЕМЕННЫМИ И УДОБНЫМИ. \r\n\r\nПРИНОСИМ СВОИ ИЗВИНЕНИЯ ЗА ВРЕМЕННО ДОСТАВЛЕННЫЕ \r\nНЕУДОБСТВА.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '3', '', '', '0', NULL, NULL, NULL),
(4, '2022-07-05 22:50:42', 1, '2022-07-05 22:50:40', 1, 2, NULL, 'Y', '2010-05-01 00:00:00', NULL, 200, 'Главный специалист Отдела анализа кредитных проектов региональной сети', NULL, '', 'html', NULL, '<b>Требования</b> 						 						 \n<p>Высшее экономическое/финансовое образование, опыт в банках топ-100 не менее 3-х лет в кредитном отделе (анализ заемщиков), желателен опыт работы с кредитными заявками филиалов, знание технологий АФХД предприятий, навыки написания экспертного заключения, знание законодательства (в т.ч. Положение ЦБ № 254-П).</p>\n 						 						<b>Обязанности</b> 						 \n<p>Анализ кредитных проектов филиалов Банка, подготовка предложений по структурированию кредитных проектов, оценка полноты и качества формируемых филиалами заключений, выявление стоп-факторов, доработка заявок филиалов в соответствии со стандартами Банка, подготовка заключения (рекомендаций) на КК по заявкам филиалов в части оценки финансово-экономического состояния заемщика, защита проектов на КК Банка, консультирование и методологическая помощь филиалам Банка в части корпоративного кредитования.</p>\n 						 						<b>Условия</b> 						 \n<p> Место работы: М.Парк Культуры. Графики работы: пятидневная рабочая неделя, с 9:00 до 18:00, пт. до 16:45. Зарплата: 50000 руб. оклад + премии, полный соц. пакет,оформление согласно ТК РФ</p>\n ', 'html', 'ГЛАВНЫЙ СПЕЦИАЛИСТ ОТДЕЛА АНАЛИЗА КРЕДИТНЫХ ПРОЕКТОВ РЕГИОНАЛЬНОЙ СЕТИ\r\n\r\nТРЕБОВАНИЯ \r\n\r\nВЫСШЕЕ ЭКОНОМИЧЕСКОЕ/ФИНАНСОВОЕ ОБРАЗОВАНИЕ, \r\nОПЫТ В БАНКАХ ТОП-100 НЕ МЕНЕЕ 3-Х ЛЕТ В КРЕДИТНОМ ОТДЕЛЕ (АНАЛИЗ ЗАЕМЩИКОВ), ЖЕЛАТЕЛЕН ОПЫТ РАБОТЫ С КРЕДИТНЫМИ ЗАЯВКАМИ ФИЛИАЛОВ, ЗНАНИЕ ТЕХНОЛОГИЙ АФХД ПРЕДПРИЯТИЙ, НАВЫКИ НАПИСАНИЯ ЭКСПЕРТНОГО ЗАКЛЮЧЕНИЯ, ЗНАНИЕ ЗАКОНОДАТЕЛЬСТВА (В Т.Ч. ПОЛОЖЕНИЕ ЦБ № 254-П). ОБЯЗАННОСТИ \r\n\r\nАНАЛИЗ КРЕДИТНЫХ ПРОЕКТОВ ФИЛИАЛОВ БАНКА, \r\nПОДГОТОВКА ПРЕДЛОЖЕНИЙ ПО СТРУКТУРИРОВАНИЮ КРЕДИТНЫХ ПРОЕКТОВ, ОЦЕНКА ПОЛНОТЫ И КАЧЕСТВА ФОРМИРУЕМЫХ ФИЛИАЛАМИ ЗАКЛЮЧЕНИЙ, ВЫЯВЛЕНИЕ СТОП-ФАКТОРОВ, ДОРАБОТКА ЗАЯВОК ФИЛИАЛОВ В СООТВЕТСТВИИ СО СТАНДАРТАМИ БАНКА, ПОДГОТОВКА ЗАКЛЮЧЕНИЯ (РЕКОМЕНДАЦИЙ) НА КК ПО ЗАЯВКАМ ФИЛИАЛОВ В ЧАСТИ ОЦЕНКИ ФИНАНСОВО-ЭКОНОМИЧЕСКОГО СОСТОЯНИЯ ЗАЕМЩИКА, ЗАЩИТА ПРОЕКТОВ НА КК БАНКА, КОНСУЛЬТИРОВАНИЕ И МЕТОДОЛОГИЧЕСКАЯ ПОМОЩЬ ФИЛИАЛАМ БАНКА В ЧАСТИ КОРПОРАТИВНОГО КРЕДИТОВАНИЯ. УСЛОВИЯ \r\n\r\nМЕСТО РАБОТЫ: М.ПАРК КУЛЬТУРЫ. ГРАФИКИ РАБОТЫ: \r\nПЯТИДНЕВНАЯ РАБОЧАЯ НЕДЕЛЯ, С 9:00 ДО 18:00, ПТ. ДО 16:45. ЗАРПЛАТА: 50000 РУБ. ОКЛАД + ПРЕМИИ, ПОЛНЫЙ СОЦ. ПАКЕТ,ОФОРМЛЕНИЕ СОГЛАСНО ТК РФ', 1, NULL, NULL, NULL, NULL, NULL, 'N', '2', '', '', '1535716109', NULL, NULL, NULL),
(5, '2022-07-05 22:50:42', 1, '2022-07-05 22:50:42', 1, 2, NULL, 'Y', '2010-05-01 00:00:00', NULL, 300, 'Специалист по продажам розничных банковских продуктов', NULL, '', 'html', NULL, '<b>Требования</b> 						 						 \n<p>Высшее экономического образования ‚ опыт работы в сфере продаж банковских продуктов‚ опытный пользователь ПК‚ этика делового общения‚ ответственность‚ инициативность‚ активность.</p>\n 						 						<b>Обязанности</b> 						 \n<p>Продажа розничных банковских продуктов, оформление документов.</p>\n 						 						<b>Условия</b> 						 \n<p>Трудоустройство по ТК РФ‚ полный соц. пакет. График работы: пятидневная рабочая неделя. Зарплата: 20000 руб. оклад + премии</p>\n ', 'html', 'СПЕЦИАЛИСТ ПО ПРОДАЖАМ РОЗНИЧНЫХ БАНКОВСКИХ ПРОДУКТОВ\r\n\r\nТРЕБОВАНИЯ \r\n\r\nВЫСШЕЕ ЭКОНОМИЧЕСКОГО ОБРАЗОВАНИЯ ‚ ОПЫТ \r\nРАБОТЫ В СФЕРЕ ПРОДАЖ БАНКОВСКИХ ПРОДУКТОВ‚ ОПЫТНЫЙ ПОЛЬЗОВАТЕЛЬ ПК‚ ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ‚ ОТВЕТСТВЕННОСТЬ‚ ИНИЦИАТИВНОСТЬ‚ АКТИВНОСТЬ. ОБЯЗАННОСТИ \r\n\r\nПРОДАЖА РОЗНИЧНЫХ БАНКОВСКИХ ПРОДУКТОВ, \r\nОФОРМЛЕНИЕ ДОКУМЕНТОВ. УСЛОВИЯ \r\n\r\nТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ. \r\nГРАФИК РАБОТЫ: ПЯТИДНЕВНАЯ РАБОЧАЯ НЕДЕЛЯ. ЗАРПЛАТА: 20000 РУБ. ОКЛАД + ПРЕМИИ', 1, NULL, NULL, NULL, NULL, NULL, 'N', '3', '', '', '925032528', NULL, NULL, NULL),
(6, '2022-07-05 22:50:44', 1, '2022-07-05 22:50:42', 1, 2, NULL, 'Y', '2010-05-01 00:00:00', NULL, 400, 'Специалист Отдела андеррайтинга', NULL, '', 'html', NULL, '<b>Требования</b> 						 						 \n<p>Высшее профессиональное образование, опыт работы от 2 лет в отделе по работе с физическими и юридическими лицами Банков, связанных с анализом платёжеспособности и кредитоспособности физических и юридических лиц.</p>\n 						 						<b>Обязанности</b> 						 \n<p>Проверка соответствия документов, предоставленных клиентами Банка, анализ информации о риске</p>\n 						 						<b>Условия</b> 						 \n<p>Трудоустройство по ТК РФ‚ полный соц. пакет. График работы: пятидневная рабочая неделя. Зарплата: оклад 25000 руб.</p>\n ', 'html', 'СПЕЦИАЛИСТ ОТДЕЛА АНДЕРРАЙТИНГА\r\n\r\nТРЕБОВАНИЯ \r\n\r\nВЫСШЕЕ ПРОФЕССИОНАЛЬНОЕ ОБРАЗОВАНИЕ, ОПЫТ \r\nРАБОТЫ ОТ 2 ЛЕТ В ОТДЕЛЕ ПО РАБОТЕ С ФИЗИЧЕСКИМИ И ЮРИДИЧЕСКИМИ ЛИЦАМИ БАНКОВ, СВЯЗАННЫХ С АНАЛИЗОМ ПЛАТЁЖЕСПОСОБНОСТИ И КРЕДИТОСПОСОБНОСТИ ФИЗИЧЕСКИХ И ЮРИДИЧЕСКИХ ЛИЦ. ОБЯЗАННОСТИ \r\n\r\nПРОВЕРКА СООТВЕТСТВИЯ ДОКУМЕНТОВ, ПРЕДОСТАВЛЕННЫХ \r\nКЛИЕНТАМИ БАНКА, АНАЛИЗ ИНФОРМАЦИИ О РИСКЕ УСЛОВИЯ \r\n\r\nТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ. \r\nГРАФИК РАБОТЫ: ПЯТИДНЕВНАЯ РАБОЧАЯ НЕДЕЛЯ. ЗАРПЛАТА: ОКЛАД 25000 РУБ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '4', '', '', '1177477483', NULL, NULL, NULL),
(7, '2022-07-09 13:25:24', 1, '2022-07-06 21:21:57', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Более 7 лет', 10, 'Работаем одним составом\r\n', 'text', NULL, '', 'text', 'БОЛЕЕ 7 ЛЕТ\r\nРАБОТАЕМ ОДНИМ СОСТАВОМ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '7', '', '', '0', NULL, NULL, NULL),
(8, '2022-07-09 13:16:29', 1, '2022-07-09 13:16:29', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Бесплатный замер', 2, 'Выезд в день обращения, производим расчет сразу на месте', 'text', NULL, '', 'text', 'БЕСПЛАТНЫЙ ЗАМЕР\r\nВЫЕЗД В ДЕНЬ ОБРАЩЕНИЯ, ПРОИЗВОДИМ РАСЧЕТ СРАЗУ НА МЕСТЕ\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '8', '', '', '0', NULL, NULL, NULL),
(9, '2022-07-09 13:16:53', 1, '2022-07-09 13:16:53', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Бесплатно', 3, 'Сервисное обслуживание всех выполненных работ\r\n', 'text', NULL, '', 'text', 'БЕСПЛАТНО\r\nСЕРВИСНОЕ ОБСЛУЖИВАНИЕ ВСЕХ ВЫПОЛНЕННЫХ РАБОТ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '9', '', '', '0', NULL, NULL, NULL),
(10, '2022-07-09 13:17:20', 1, '2022-07-09 13:17:20', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Высокое качество', 4, 'Монтажных работ\r\nи обслуживания', 'text', NULL, '', 'text', 'ВЫСОКОЕ КАЧЕСТВО\r\nМОНТАЖНЫХ РАБОТ\r\nИ ОБСЛУЖИВАНИЯ\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '10', '', '', '0', NULL, NULL, NULL),
(11, '2022-07-09 13:17:38', 1, '2022-07-09 13:17:38', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Гос. заказчики', 5, 'Довольны нашей работой\r\n', 'text', NULL, '', 'text', 'ГОС. ЗАКАЗЧИКИ\r\nДОВОЛЬНЫ НАШЕЙ РАБОТОЙ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '11', '', '', '0', NULL, NULL, NULL),
(12, '2022-07-09 13:21:30', 1, '2022-07-09 13:21:30', 1, 5, NULL, 'Y', NULL, NULL, 500, 'Место', 6, 'г. Новосибирск,\r\nул. Державина д. 49', 'text', NULL, '', 'text', 'МЕСТО\r\nГ. НОВОСИБИРСК,\r\nУЛ. ДЕРЖАВИНА Д. 49\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '12', '', '', '0', NULL, NULL, NULL),
(13, '2022-07-09 13:22:01', 1, '2022-07-09 13:22:01', 1, 5, NULL, 'Y', NULL, NULL, 500, 'Время', 7, '10:00 - 20:00,\r\nбез выходных', 'text', NULL, '', 'text', 'ВРЕМЯ\r\n10:00 - 20:00,\r\nБЕЗ ВЫХОДНЫХ\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '13', '', '', '0', NULL, NULL, NULL),
(14, '2022-07-09 13:22:21', 1, '2022-07-09 13:22:21', 1, 5, NULL, 'Y', NULL, NULL, 500, 'Телефон', 8, '8 (383) 000-00-00\r\n', 'text', NULL, '', 'text', 'ТЕЛЕФОН\r\n8 (383) 000-00-00\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '14', '', '', '0', NULL, NULL, NULL),
(15, '2022-07-09 13:22:37', 1, '2022-07-09 13:22:37', 1, 5, NULL, 'Y', NULL, NULL, 500, 'Почта', 9, 'ampir_nsk@mail.ru', 'text', NULL, '', 'text', 'ПОЧТА\r\nAMPIR_NSK@MAIL.RU\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '15', '', '', '0', NULL, NULL, NULL),
(16, '2022-07-09 14:11:37', 1, '2022-07-09 14:11:37', 1, 4, NULL, 'Y', NULL, NULL, 500, 'Грамота1', 11, '', 'text', NULL, '', 'text', 'ГРАМОТА1\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '16', '', '', '0', NULL, NULL, NULL),
(17, '2022-07-09 14:11:52', 1, '2022-07-09 14:11:52', 1, 4, NULL, 'Y', NULL, NULL, 500, 'Грамота2', 12, '', 'text', NULL, '', 'text', 'ГРАМОТА2\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '17', '', '', '0', NULL, NULL, NULL),
(18, '2022-07-09 14:59:19', 1, '2022-07-09 14:59:19', 1, 4, NULL, 'Y', NULL, NULL, 500, 'Грамота3', 13, '', 'text', NULL, '', 'text', 'ГРАМОТА3\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '18', '', '', '0', NULL, NULL, NULL),
(22, '2022-07-10 15:02:46', 1, '2022-07-10 15:02:46', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Банк переносит дату вступления в действие тарифов на услуги в иностранной валюте', NULL, NULL, 'text', NULL, NULL, 'text', 'БАНК ПЕРЕНОСИТ ДАТУ ВСТУПЛЕНИЯ В ДЕЙСТВИЕ ТАРИФОВ НА УСЛУГИ В ИНОСТРАННОЙ ВАЛЮТЕ', 1, NULL, NULL, NULL, NULL, NULL, 'N', '22', NULL, NULL, NULL, NULL, NULL, NULL),
(23, '2022-07-10 15:02:47', 1, '2022-07-10 15:02:47', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Начать работать с системой «Интернет-Клиент» стало еще проще ', NULL, NULL, 'text', NULL, NULL, 'text', 'НАЧАТЬ РАБОТАТЬ С СИСТЕМОЙ «ИНТЕРНЕТ-КЛИЕНТ» СТАЛО ЕЩЕ ПРОЩЕ ', 1, NULL, NULL, NULL, NULL, NULL, 'N', '23', NULL, NULL, NULL, NULL, NULL, NULL),
(24, '2022-07-10 15:02:48', 1, '2022-07-10 15:02:48', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Реорганизация сети отделений Банка ', NULL, NULL, 'text', NULL, NULL, 'text', 'РЕОРГАНИЗАЦИЯ СЕТИ ОТДЕЛЕНИЙ БАНКА ', 1, NULL, NULL, NULL, NULL, NULL, 'N', '24', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_iprop`
--

CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `ELEMENT_ID` int NOT NULL,
  `IPROP_ID` int NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_lock`
--

CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_property`
--

CREATE TABLE `b_iblock_element_property` (
  `ID` int NOT NULL,
  `IBLOCK_PROPERTY_ID` int NOT NULL,
  `IBLOCK_ELEMENT_ID` int NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_element_property`
--

INSERT INTO `b_iblock_element_property` (`ID`, `IBLOCK_PROPERTY_ID`, `IBLOCK_ELEMENT_ID`, `VALUE`, `VALUE_TYPE`, `VALUE_ENUM`, `VALUE_NUM`, `DESCRIPTION`) VALUES
(1, 1, 3, 'Реорганизация сети отделений Банка', 'text', NULL, '0.0000', ''),
(2, 2, 3, '2022-07-17 12:05:00', 'text', NULL, '2022.0000', ''),
(3, 3, 3, 'a:2:{s:4:\"TEXT\";s:17:\"Тут текст\";s:4:\"TYPE\";s:4:\"HTML\";}', 'text', NULL, '0.0000', ''),
(4, 4, 3, 'Яков', 'text', NULL, '0.0000', ''),
(5, 5, 3, 'Новосибирск', 'text', NULL, '0.0000', ''),
(6, 6, 3, '26,81', 'text', NULL, '26.0000', ''),
(13, 7, 24, 'Реорганизация сети отделений Банка', 'text', NULL, '0.0000', NULL),
(14, 8, 24, '2022-07-17 12:05:00', 'text', NULL, '2022.0000', ''),
(15, 9, 24, 'a:2:{s:4:\"TEXT\";s:17:\"Тут текст\";s:4:\"TYPE\";s:4:\"HTML\";}', 'text', NULL, '0.0000', ''),
(16, 10, 24, 'Яков', 'text', NULL, '0.0000', NULL),
(17, 11, 24, 'Новосибирск', 'text', NULL, '0.0000', NULL),
(18, 12, 24, '26,81', 'text', NULL, '26.0000', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_right`
--

CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `ELEMENT_ID` int NOT NULL,
  `RIGHT_ID` int NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_fields`
--

CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_fields`
--

INSERT INTO `b_iblock_fields` (`IBLOCK_ID`, `FIELD_ID`, `IS_REQUIRED`, `DEFAULT_VALUE`) VALUES
(1, 'ACTIVE', 'Y', 'Y'),
(1, 'ACTIVE_FROM', 'N', '=today'),
(1, 'ACTIVE_TO', 'N', ''),
(1, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:0:\"\";s:11:\"TRANS_SPACE\";s:0:\"\";s:11:\"TRANS_OTHER\";s:0:\"\";s:9:\"TRANS_EAT\";s:1:\"N\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'DETAIL_TEXT', 'N', ''),
(1, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(1, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(1, 'LOG_ELEMENT_ADD', 'N', NULL),
(1, 'LOG_ELEMENT_DELETE', 'N', NULL),
(1, 'LOG_ELEMENT_EDIT', 'N', NULL),
(1, 'LOG_SECTION_ADD', 'N', NULL),
(1, 'LOG_SECTION_DELETE', 'N', NULL),
(1, 'LOG_SECTION_EDIT', 'N', NULL),
(1, 'NAME', 'Y', ''),
(1, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'PREVIEW_TEXT', 'N', ''),
(1, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(1, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'SECTION_DESCRIPTION', 'N', ''),
(1, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(1, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'SECTION_NAME', 'Y', ''),
(1, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'SECTION_XML_ID', 'N', ''),
(1, 'SORT', 'N', '0'),
(1, 'TAGS', 'N', ''),
(1, 'XML_ID', 'Y', ''),
(1, 'XML_IMPORT_START_TIME', 'N', '2022-07-05 18:50:17'),
(2, 'ACTIVE', 'Y', 'Y'),
(2, 'ACTIVE_FROM', 'N', ''),
(2, 'ACTIVE_TO', 'N', ''),
(2, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:0:\"\";s:11:\"TRANS_SPACE\";s:0:\"\";s:11:\"TRANS_OTHER\";s:0:\"\";s:9:\"TRANS_EAT\";s:1:\"N\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(2, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'DETAIL_TEXT', 'N', ''),
(2, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(2, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(2, 'LOG_ELEMENT_ADD', 'N', NULL),
(2, 'LOG_ELEMENT_DELETE', 'N', NULL),
(2, 'LOG_ELEMENT_EDIT', 'N', NULL),
(2, 'LOG_SECTION_ADD', 'N', NULL),
(2, 'LOG_SECTION_DELETE', 'N', NULL),
(2, 'LOG_SECTION_EDIT', 'N', NULL),
(2, 'NAME', 'Y', ''),
(2, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'PREVIEW_TEXT', 'N', ''),
(2, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(2, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(2, 'SECTION_DESCRIPTION', 'N', ''),
(2, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(2, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'SECTION_NAME', 'Y', ''),
(2, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'SECTION_XML_ID', 'N', ''),
(2, 'SORT', 'N', '0'),
(2, 'TAGS', 'N', ''),
(2, 'XML_ID', 'Y', ''),
(2, 'XML_IMPORT_START_TIME', 'N', '2022-07-05 18:50:38'),
(3, 'ACTIVE', 'Y', 'Y'),
(3, 'ACTIVE_FROM', 'N', ''),
(3, 'ACTIVE_TO', 'N', ''),
(3, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(3, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'DETAIL_TEXT', 'N', ''),
(3, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(3, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(3, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(3, 'LOG_ELEMENT_ADD', 'N', NULL),
(3, 'LOG_ELEMENT_DELETE', 'N', NULL),
(3, 'LOG_ELEMENT_EDIT', 'N', NULL),
(3, 'LOG_SECTION_ADD', 'N', NULL),
(3, 'LOG_SECTION_DELETE', 'N', NULL),
(3, 'LOG_SECTION_EDIT', 'N', NULL),
(3, 'NAME', 'Y', ''),
(3, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'PREVIEW_TEXT', 'N', ''),
(3, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(3, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(3, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(3, 'SECTION_DESCRIPTION', 'N', ''),
(3, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(3, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(3, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'SECTION_NAME', 'Y', ''),
(3, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'SECTION_XML_ID', 'N', ''),
(3, 'SORT', 'N', '0'),
(3, 'TAGS', 'N', ''),
(3, 'XML_ID', 'Y', ''),
(3, 'XML_IMPORT_START_TIME', 'N', NULL),
(4, 'ACTIVE', 'Y', 'Y'),
(4, 'ACTIVE_FROM', 'N', ''),
(4, 'ACTIVE_TO', 'N', ''),
(4, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(4, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(4, 'DETAIL_TEXT', 'N', ''),
(4, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(4, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(4, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(4, 'LOG_ELEMENT_ADD', 'N', NULL),
(4, 'LOG_ELEMENT_DELETE', 'N', NULL),
(4, 'LOG_ELEMENT_EDIT', 'N', NULL),
(4, 'LOG_SECTION_ADD', 'N', NULL),
(4, 'LOG_SECTION_DELETE', 'N', NULL),
(4, 'LOG_SECTION_EDIT', 'N', NULL),
(4, 'NAME', 'Y', ''),
(4, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(4, 'PREVIEW_TEXT', 'N', ''),
(4, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(4, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(4, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(4, 'SECTION_DESCRIPTION', 'N', ''),
(4, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(4, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(4, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(4, 'SECTION_NAME', 'Y', ''),
(4, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(4, 'SECTION_XML_ID', 'N', ''),
(4, 'SORT', 'N', '0'),
(4, 'TAGS', 'N', ''),
(4, 'XML_ID', 'Y', ''),
(4, 'XML_IMPORT_START_TIME', 'N', NULL),
(5, 'ACTIVE', 'Y', 'Y'),
(5, 'ACTIVE_FROM', 'N', ''),
(5, 'ACTIVE_TO', 'N', ''),
(5, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(5, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(5, 'DETAIL_TEXT', 'N', ''),
(5, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(5, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(5, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(5, 'LOG_ELEMENT_ADD', 'N', NULL),
(5, 'LOG_ELEMENT_DELETE', 'N', NULL),
(5, 'LOG_ELEMENT_EDIT', 'N', NULL),
(5, 'LOG_SECTION_ADD', 'N', NULL),
(5, 'LOG_SECTION_DELETE', 'N', NULL),
(5, 'LOG_SECTION_EDIT', 'N', NULL),
(5, 'NAME', 'Y', ''),
(5, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(5, 'PREVIEW_TEXT', 'N', ''),
(5, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(5, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(5, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(5, 'SECTION_DESCRIPTION', 'N', ''),
(5, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(5, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(5, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(5, 'SECTION_NAME', 'Y', ''),
(5, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(5, 'SECTION_XML_ID', 'N', ''),
(5, 'SORT', 'N', '0'),
(5, 'TAGS', 'N', ''),
(5, 'XML_ID', 'Y', ''),
(5, 'XML_IMPORT_START_TIME', 'N', NULL),
(6, 'ACTIVE', 'Y', 'Y'),
(6, 'ACTIVE_FROM', 'N', ''),
(6, 'ACTIVE_TO', 'N', ''),
(6, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(6, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(6, 'DETAIL_TEXT', 'N', ''),
(6, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(6, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(6, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(6, 'LOG_ELEMENT_ADD', 'N', NULL),
(6, 'LOG_ELEMENT_DELETE', 'N', NULL),
(6, 'LOG_ELEMENT_EDIT', 'N', NULL),
(6, 'LOG_SECTION_ADD', 'N', NULL),
(6, 'LOG_SECTION_DELETE', 'N', NULL),
(6, 'LOG_SECTION_EDIT', 'N', NULL),
(6, 'NAME', 'Y', ''),
(6, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(6, 'PREVIEW_TEXT', 'N', ''),
(6, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(6, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(6, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(6, 'SECTION_DESCRIPTION', 'N', ''),
(6, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(6, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(6, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(6, 'SECTION_NAME', 'Y', ''),
(6, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(6, 'SECTION_XML_ID', 'N', ''),
(6, 'SORT', 'N', '0'),
(6, 'TAGS', 'N', ''),
(6, 'XML_ID', 'Y', ''),
(6, 'XML_IMPORT_START_TIME', 'N', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_group`
--

CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_group`
--

INSERT INTO `b_iblock_group` (`IBLOCK_ID`, `GROUP_ID`, `PERMISSION`) VALUES
(1, 1, 'X'),
(1, 2, 'R'),
(1, 5, 'W'),
(2, 1, 'X'),
(2, 2, 'R'),
(2, 5, 'W'),
(3, 1, 'X'),
(3, 2, 'R'),
(4, 1, 'X'),
(4, 2, 'R'),
(5, 1, 'X'),
(5, 2, 'R'),
(6, 1, 'X');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_iblock_iprop`
--

CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int NOT NULL,
  `IPROP_ID` int NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_iproperty`
--

CREATE TABLE `b_iblock_iproperty` (
  `ID` int NOT NULL,
  `IBLOCK_ID` int NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_messages`
--

CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_messages`
--

INSERT INTO `b_iblock_messages` (`IBLOCK_ID`, `MESSAGE_ID`, `MESSAGE_TEXT`) VALUES
(1, 'ELEMENT_ADD', 'Добавить новость'),
(1, 'ELEMENT_DELETE', 'Удалить новость'),
(1, 'ELEMENT_EDIT', 'Изменить новость'),
(1, 'ELEMENT_NAME', 'Новость'),
(1, 'ELEMENTS_NAME', 'Новости'),
(1, 'SECTION_ADD', 'Добавить раздел'),
(1, 'SECTION_DELETE', 'Удалить раздел'),
(1, 'SECTION_EDIT', 'Изменить раздел'),
(1, 'SECTION_NAME', 'Раздел'),
(1, 'SECTIONS_NAME', 'Разделы'),
(2, 'ELEMENT_ADD', 'Добавить вакансию'),
(2, 'ELEMENT_DELETE', 'Удалить вакансию'),
(2, 'ELEMENT_EDIT', 'Изменить вакансию'),
(2, 'ELEMENT_NAME', 'Вакансия'),
(2, 'ELEMENTS_NAME', 'Вакансии'),
(2, 'SECTION_ADD', 'Добавить раздел'),
(2, 'SECTION_DELETE', 'Удалить раздел'),
(2, 'SECTION_EDIT', 'Изменить раздел'),
(2, 'SECTION_NAME', 'Раздел'),
(2, 'SECTIONS_NAME', 'Разделы'),
(3, 'ELEMENT_ADD', 'Добавить элемент'),
(3, 'ELEMENT_DELETE', 'Удалить элемент'),
(3, 'ELEMENT_EDIT', 'Изменить элемент'),
(3, 'ELEMENT_NAME', 'Элемент'),
(3, 'ELEMENTS_NAME', 'Элементы'),
(3, 'SECTION_ADD', 'Добавить раздел'),
(3, 'SECTION_DELETE', 'Удалить раздел'),
(3, 'SECTION_EDIT', 'Изменить раздел'),
(3, 'SECTION_NAME', 'Раздел'),
(3, 'SECTIONS_NAME', 'Разделы'),
(4, 'ELEMENT_ADD', 'Добавить элемент'),
(4, 'ELEMENT_DELETE', 'Удалить элемент'),
(4, 'ELEMENT_EDIT', 'Изменить элемент'),
(4, 'ELEMENT_NAME', 'Элемент'),
(4, 'ELEMENTS_NAME', 'Элементы'),
(4, 'SECTION_ADD', 'Добавить раздел'),
(4, 'SECTION_DELETE', 'Удалить раздел'),
(4, 'SECTION_EDIT', 'Изменить раздел'),
(4, 'SECTION_NAME', 'Раздел'),
(4, 'SECTIONS_NAME', 'Разделы'),
(5, 'ELEMENT_ADD', 'Добавить элемент'),
(5, 'ELEMENT_DELETE', 'Удалить элемент'),
(5, 'ELEMENT_EDIT', 'Изменить элемент'),
(5, 'ELEMENT_NAME', 'Элемент'),
(5, 'ELEMENTS_NAME', 'Элементы'),
(5, 'SECTION_ADD', 'Добавить раздел'),
(5, 'SECTION_DELETE', 'Удалить раздел'),
(5, 'SECTION_EDIT', 'Изменить раздел'),
(5, 'SECTION_NAME', 'Раздел'),
(5, 'SECTIONS_NAME', 'Разделы'),
(6, 'ELEMENT_ADD', 'Добавить элемент'),
(6, 'ELEMENT_DELETE', 'Удалить элемент'),
(6, 'ELEMENT_EDIT', 'Изменить элемент'),
(6, 'ELEMENT_NAME', 'Элемент'),
(6, 'ELEMENTS_NAME', 'Элементы');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_offers_tmp`
--

CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int UNSIGNED NOT NULL,
  `PRODUCT_IBLOCK_ID` int UNSIGNED NOT NULL,
  `OFFERS_IBLOCK_ID` int UNSIGNED NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property`
--

CREATE TABLE `b_iblock_property` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int NOT NULL DEFAULT '1',
  `COL_COUNT` int NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_property`
--

INSERT INTO `b_iblock_property` (`ID`, `TIMESTAMP_X`, `IBLOCK_ID`, `NAME`, `ACTIVE`, `SORT`, `CODE`, `DEFAULT_VALUE`, `PROPERTY_TYPE`, `ROW_COUNT`, `COL_COUNT`, `LIST_TYPE`, `MULTIPLE`, `XML_ID`, `FILE_TYPE`, `MULTIPLE_CNT`, `TMP_ID`, `LINK_IBLOCK_ID`, `WITH_DESCRIPTION`, `SEARCHABLE`, `FILTRABLE`, `IS_REQUIRED`, `VERSION`, `USER_TYPE`, `USER_TYPE_SETTINGS`, `HINT`) VALUES
(1, '2022-07-10 05:05:01', 1, 'Название', 'Y', 500, 'pr_name', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(2, '2022-07-10 05:05:01', 1, 'Дата публикаций', 'Y', 500, 'pr_date', NULL, 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, 'DateTime', NULL, ''),
(3, '2022-07-10 05:05:01', 1, 'Анонс', 'Y', 500, 'pr_anons', 'a:2:{s:4:\"TEXT\";s:0:\"\";s:4:\"TYPE\";s:4:\"HTML\";}', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, 'HTML', 'a:1:{s:6:\"height\";i:200;}', ''),
(4, '2022-07-10 05:05:01', 1, 'Ответственный', 'Y', 500, 'pr_otv', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(5, '2022-07-10 05:05:01', 1, 'Адрес', 'Y', 500, 'pr_address', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(6, '2022-07-10 05:05:01', 1, 'Координаты на карте', 'Y', 500, 'pr_map', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(7, '2022-07-10 07:53:14', 6, 'Название', 'Y', 500, 'pr_name', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(8, '2022-07-10 07:53:14', 6, 'Дата публикаций', 'Y', 500, 'pr_date', NULL, 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, 'DateTime', NULL, ''),
(9, '2022-07-10 07:53:14', 6, 'Анонс', 'Y', 500, 'pr_anons', 'a:2:{s:4:\"TEXT\";s:0:\"\";s:4:\"TYPE\";s:4:\"HTML\";}', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, 'HTML', 'a:1:{s:6:\"height\";i:200;}', ''),
(10, '2022-07-10 07:53:14', 6, 'Ответственный', 'Y', 500, 'pr_otv', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(11, '2022-07-10 07:53:14', 6, 'Адрес', 'Y', 500, 'pr_address', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(12, '2022-07-10 07:53:14', 6, 'Координаты на карте', 'Y', 500, 'pr_map', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property_enum`
--

CREATE TABLE `b_iblock_property_enum` (
  `ID` int NOT NULL,
  `PROPERTY_ID` int NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property_feature`
--

CREATE TABLE `b_iblock_property_feature` (
  `ID` int NOT NULL,
  `PROPERTY_ID` int NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FEATURE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `IS_ENABLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_right`
--

CREATE TABLE `b_iblock_right` (
  `ID` int NOT NULL,
  `IBLOCK_ID` int NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_rss`
--

CREATE TABLE `b_iblock_rss` (
  `ID` int NOT NULL,
  `IBLOCK_ID` int NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section`
--

CREATE TABLE `b_iblock_section` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `IBLOCK_ID` int NOT NULL,
  `IBLOCK_SECTION_ID` int DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int DEFAULT NULL,
  `LEFT_MARGIN` int DEFAULT NULL,
  `RIGHT_MARGIN` int DEFAULT NULL,
  `DEPTH_LEVEL` int DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int DEFAULT NULL,
  `SOCNET_GROUP_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_element`
--

CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int NOT NULL,
  `IBLOCK_ELEMENT_ID` int NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_iprop`
--

CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `IPROP_ID` int NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_property`
--

CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `PROPERTY_ID` int NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_right`
--

CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int NOT NULL,
  `SECTION_ID` int NOT NULL,
  `RIGHT_ID` int NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_sequence`
--

CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_site`
--

CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_site`
--

INSERT INTO `b_iblock_site` (`IBLOCK_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_type`
--

CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_type`
--

INSERT INTO `b_iblock_type` (`ID`, `SECTIONS`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `IN_RSS`, `SORT`) VALUES
('news', 'N', NULL, NULL, 'N', 50),
('rest_entity', 'Y', NULL, NULL, 'N', 1000),
('vacancies', 'Y', NULL, NULL, 'N', 150);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_type_lang`
--

CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_type_lang`
--

INSERT INTO `b_iblock_type_lang` (`IBLOCK_TYPE_ID`, `LID`, `NAME`, `SECTION_NAME`, `ELEMENT_NAME`) VALUES
('rest_entity', 'ru', 'Хранилище данных для приложений', 'Разделы', 'Элементы'),
('news', 'ru', 'Новости', '', 'Новости'),
('news', 'en', 'News', '', 'News'),
('vacancies', 'ru', 'Вакансии', 'Разделы', 'Вакансии'),
('vacancies', 'en', 'Job', 'Categories', 'Vacancies');

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing`
--

CREATE TABLE `b_landing` (
  `ID` int NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `VIEWS` int NOT NULL DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TPL_ID` int DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` int NOT NULL,
  `SITEMAP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER_ID` int DEFAULT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `VERSION` int NOT NULL DEFAULT '1',
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  `DATE_PUBLIC` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_binding`
--

CREATE TABLE `b_landing_binding` (
  `ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `BINDING_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BINDING_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_block`
--

CREATE TABLE `b_landing_block` (
  `ID` int NOT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `LID` int NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ORIGINAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ANCHOR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int DEFAULT '500',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESIGNED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACCESS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'X',
  `SOURCE_PARAMS` mediumtext COLLATE utf8_unicode_ci,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `ASSETS` text COLLATE utf8_unicode_ci,
  `FAVORITE_META` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_block_last_used`
--

CREATE TABLE `b_landing_block_last_used` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_chat`
--

CREATE TABLE `b_landing_chat` (
  `ID` int NOT NULL,
  `CHAT_ID` int NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AVATAR` int DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_chat_binding`
--

CREATE TABLE `b_landing_chat_binding` (
  `ID` int NOT NULL,
  `INTERNAL_CHAT_ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_cookies_agreement`
--

CREATE TABLE `b_landing_cookies_agreement` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` int NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_demo`
--

CREATE TABLE `b_landing_demo` (
  `ID` int NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TPL_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW2X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW3X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` mediumtext COLLATE utf8_unicode_ci,
  `LANG` text COLLATE utf8_unicode_ci,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_designer_repo`
--

CREATE TABLE `b_landing_designer_repo` (
  `ID` int NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int DEFAULT '100',
  `HTML` text COLLATE utf8_unicode_ci NOT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_domain`
--

CREATE TABLE `b_landing_domain` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREV_DOMAIN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `PROVIDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FAIL_COUNT` int DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_entity_lock`
--

CREATE TABLE `b_landing_entity_lock` (
  `ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LOCK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_entity_rights`
--

CREATE TABLE `b_landing_entity_rights` (
  `ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_file`
--

CREATE TABLE `b_landing_file` (
  `ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ID` int NOT NULL,
  `TEMP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_filter_block`
--

CREATE TABLE `b_landing_filter_block` (
  `ID` int NOT NULL,
  `FILTER_ID` int NOT NULL,
  `BLOCK_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_filter_entity`
--

CREATE TABLE `b_landing_filter_entity` (
  `ID` int NOT NULL,
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_HASH` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_folder`
--

CREATE TABLE `b_landing_folder` (
  `ID` int NOT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `SITE_ID` int NOT NULL,
  `INDEX_ID` int DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_hook_data`
--

CREATE TABLE `b_landing_hook_data` (
  `ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `HOOK` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_placement`
--

CREATE TABLE `b_landing_placement` (
  `ID` int NOT NULL,
  `APP_ID` int DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_repo`
--

CREATE TABLE `b_landing_repo` (
  `ID` int NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_role`
--

CREATE TABLE `b_landing_role` (
  `ID` int NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODES` text COLLATE utf8_unicode_ci,
  `ADDITIONAL_RIGHTS` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_site`
--

CREATE TABLE `b_landing_site` (
  `ID` int NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PAGE',
  `TPL_ID` int DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_ID` int NOT NULL,
  `SMN_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANDING_ID_INDEX` int DEFAULT NULL,
  `LANDING_ID_404` int DEFAULT NULL,
  `LANDING_ID_503` int DEFAULT NULL,
  `LANG` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SPECIAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `VERSION` int DEFAULT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_syspage`
--

CREATE TABLE `b_landing_syspage` (
  `ID` int NOT NULL,
  `SITE_ID` int NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_template`
--

CREATE TABLE `b_landing_template` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int DEFAULT '100',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `AREA_COUNT` int NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_landing_template`
--

INSERT INTO `b_landing_template` (`ID`, `ACTIVE`, `TITLE`, `SORT`, `XML_ID`, `CONTENT`, `AREA_COUNT`, `CREATED_BY_ID`, `MODIFIED_BY_ID`, `DATE_CREATE`, `DATE_MODIFY`) VALUES
(1, 'Y', '#EMPTY#', 100, 'empty', '#CONTENT#', 0, 1, 1, '2022-07-05 11:45:17', '2022-07-05 11:45:17'),
(2, 'Y', '#SIDEBAR_LEFT#', 200, 'sidebar_left', '<div class=\"landing-layout-flex\">\n								<div class=\"landing-sidebar g-max-width-100x g-overflow-hidden\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>', 1, 1, 1, '2022-07-05 11:45:17', '2022-07-05 11:45:17'),
(3, 'Y', '#SIDEBAR_RIGHT#', 300, 'sidebar_right', '<div class=\"landing-layout-flex sidebar-right\">\n								<div class=\"landing-sidebar g-max-width-100x\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>', 1, 1, 1, '2022-07-05 11:45:17', '2022-07-05 11:45:17'),
(4, 'Y', '#HEADER_ONLY#', 400, 'header_only', '<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div>', 1, 1, 1, '2022-07-05 11:45:17', '2022-07-05 11:45:17'),
(5, 'Y', '#HEADER_FOOTER#', 500, 'header_footer', '<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div> \n							<div class=\"landing-footer\">#AREA_2#</div>', 2, 1, 1, '2022-07-05 11:45:17', '2022-07-05 11:45:17'),
(6, 'Y', '#WITHOUT_LEFT#', 600, 'without_left', '<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex without-left\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>', 3, 1, 1, '2022-07-05 11:45:17', '2022-07-05 11:45:17'),
(7, 'Y', '#WITHOUT_RIGHT#', 700, 'without_right', '<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>', 3, 1, 1, '2022-07-05 11:45:17', '2022-07-05 11:45:17');

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_template_ref`
--

CREATE TABLE `b_landing_template_ref` (
  `ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `AREA` int NOT NULL,
  `LANDING_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_update_block`
--

CREATE TABLE `b_landing_update_block` (
  `ID` int NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_BLOCK_ID` int DEFAULT '0',
  `PARAMS` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_urlchecker_host`
--

CREATE TABLE `b_landing_urlchecker_host` (
  `ID` int NOT NULL,
  `STATUS_ID` int NOT NULL,
  `HOST` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_urlchecker_status`
--

CREATE TABLE `b_landing_urlchecker_status` (
  `ID` int NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HASH` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_urlchecker_whitelist`
--

CREATE TABLE `b_landing_urlchecker_whitelist` (
  `ID` int NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_urlrewrite`
--

CREATE TABLE `b_landing_urlrewrite` (
  `ID` int NOT NULL,
  `SITE_ID` int NOT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int NOT NULL,
  `CREATED_BY_ID` int NOT NULL,
  `MODIFIED_BY_ID` int NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_landing_view`
--

CREATE TABLE `b_landing_view` (
  `ID` int NOT NULL,
  `LID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `VIEWS` int NOT NULL,
  `FIRST_VIEW` datetime NOT NULL,
  `LAST_VIEW` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang`
--

CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_lang`
--

INSERT INTO `b_lang` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `DIR`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `LANGUAGE_ID`, `DOC_ROOT`, `DOMAIN_LIMITED`, `SERVER_NAME`, `SITE_NAME`, `EMAIL`, `CULTURE_ID`) VALUES
('s1', 1, 'Y', 'Y', 'Корпоративный сайт (Сайт по умолчанию)', '/', NULL, NULL, NULL, NULL, NULL, 'ru', '', 'N', '', 'Корпоративный сайт', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_language`
--

CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_language`
--

INSERT INTO `b_language` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `CULTURE_ID`) VALUES
('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2),
('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang_domain`
--

CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_log_notification`
--

CREATE TABLE `b_log_notification` (
  `ID` int UNSIGNED NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECK_INTERVAL` int DEFAULT NULL,
  `ALERT_COUNT` int DEFAULT NULL,
  `DATE_CHECKED` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_log_notification_action`
--

CREATE TABLE `b_log_notification_action` (
  `ID` int UNSIGNED NOT NULL,
  `NOTIFICATION_ID` int UNSIGNED NOT NULL,
  `NOTIFICATION_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `RECIPIENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_TEXT` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_mail_blacklist`
--

CREATE TABLE `b_main_mail_blacklist` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `CATEGORY_ID` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_mail_sender`
--

CREATE TABLE `b_main_mail_sender` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int NOT NULL,
  `IS_CONFIRMED` tinyint NOT NULL DEFAULT '0',
  `IS_PUBLIC` tinyint NOT NULL DEFAULT '0',
  `OPTIONS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_mail_sender_send_counter`
--

CREATE TABLE `b_main_mail_sender_send_counter` (
  `DATE_STAT` date NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection`
--

CREATE TABLE `b_medialib_collection` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int DEFAULT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int DEFAULT NULL,
  `ML_TYPE` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection_item`
--

CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int NOT NULL,
  `ITEM_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_item`
--

CREATE TABLE `b_medialib_item` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_type`
--

CREATE TABLE `b_medialib_type` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_medialib_type`
--

INSERT INTO `b_medialib_type` (`ID`, `NAME`, `CODE`, `EXT`, `SYSTEM`, `DESCRIPTION`) VALUES
(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_message`
--

CREATE TABLE `b_messageservice_message` (
  `ID` int NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `SENDER_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR_ID` int NOT NULL DEFAULT '0',
  `MESSAGE_FROM` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_TO` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_HEADERS` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_BODY` longtext COLLATE utf8_unicode_ci NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EXEC_ERROR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS_ID` int NOT NULL DEFAULT '0',
  `EXTERNAL_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_STATUS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_rest_app`
--

CREATE TABLE `b_messageservice_rest_app` (
  `ID` int NOT NULL,
  `APP_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `HANDLER` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ADD` datetime DEFAULT NULL,
  `AUTHOR_ID` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_messageservice_rest_app_lang`
--

CREATE TABLE `b_messageservice_rest_app_lang` (
  `ID` int NOT NULL,
  `APP_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_module`
--

CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_module`
--

INSERT INTO `b_module` (`ID`, `DATE_ACTIVE`) VALUES
('b24connector', NULL),
('bitrix.sitecorporate', NULL),
('bitrixcloud', NULL),
('clouds', NULL),
('fileman', NULL),
('highloadblock', NULL),
('iblock', NULL),
('landing', NULL),
('main', NULL),
('messageservice', NULL),
('perfmon', NULL),
('rest', NULL),
('search', NULL),
('seo', NULL),
('socialservices', NULL),
('translate', NULL),
('ui', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_group`
--

CREATE TABLE `b_module_group` (
  `ID` int NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_module_group`
--

INSERT INTO `b_module_group` (`ID`, `MODULE_ID`, `GROUP_ID`, `G_ACCESS`, `SITE_ID`) VALUES
(1, 'main', 5, 'Q', NULL),
(2, 'fileman', 5, 'F', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_to_module`
--

CREATE TABLE `b_module_to_module` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int DEFAULT NULL,
  `UNIQUE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_module_to_module`
--

INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`, `UNIQUE_ID`) VALUES
(1, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1, '2b30c309bf87645959b9bfbed51b49c6'),
(2, NULL, 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1, 'f437e170e4daf957766b0b0579f08fb4'),
(3, NULL, 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1, '9211999c5cfc3a4d374e4f957d5079f6'),
(4, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1, '9ef4e969f975b6425c7113444d210a90'),
(5, NULL, 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1, '332179402f77c4d41c6c2e524acde4d0'),
(6, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1, 'e1aae03ea8eb08e7bbb6d8d42cbc2ebe'),
(7, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1, 'a2986b9f6e9a99c0351c2ba858dafc85'),
(8, NULL, 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1, 'f9b70c6a75b6341063b23bde5d32e582'),
(9, NULL, 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1, 'a0aecef95a192ec3dd134f71f0f4f175'),
(10, NULL, 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1, '6476f96ffba6ab2b4a7dbe644f42edf6'),
(11, NULL, 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1, '6122bee2ad083f8f72e35655cee48859'),
(12, NULL, 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1, 'f8f806e33dc35737bdbe6b9bc42626a4'),
(13, NULL, 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1, '9244ca7fd6964757ca191c9407cb1218'),
(14, NULL, 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1, 'd8ae8e1f8889b1fbb6af276fb14c8411'),
(15, NULL, 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1, '129315715250c195ee115002b445a156'),
(16, NULL, 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1, 'bf1f5deaa1532fe9a28acd6d19d23a80'),
(17, NULL, 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1, '298e763431f7f7d6c3af9798663f410d'),
(18, NULL, 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1, '4ecdc4a15e24c49f0fa8f44064bf1511'),
(19, NULL, 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1, '6ac10928b76183004ba0e88ace0a1b5b'),
(20, NULL, 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1, '06769c4f6bbba4fad79c1619a874ee97'),
(21, NULL, 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1, 'ecb9ae0476db69da6c95b06bcb3aebbb'),
(22, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1, '9fe6984fd29b7ab9508ac02c23690094'),
(23, NULL, 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1, '02f2fe70b9068a6b307192321fe74430'),
(24, NULL, 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1, 'ef0f2e4d0ae7bbf59d0798e8078143f9'),
(25, NULL, 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1, 'd3ec9527c0e77709402a05ae4249afca'),
(26, NULL, 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1, '0de6c5b48e9382f6e857d79f76d95f25'),
(27, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1, 'ac0b8b7a5e703131a3bd41b4399bc032'),
(28, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1, '1ddb38ccf35a8a9da5d3b2bc80591ad6'),
(29, NULL, 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1, 'c1f65f88d449e8b8a3b7af9d54ef3f50'),
(30, NULL, 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1, '8af99568465a1ccdb6a84e868cf5aad8'),
(31, NULL, 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1, '09f8200652932044934bd3c522e920c5'),
(32, NULL, 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1, '71ef247b3eb3b07e4bd6940791b89497'),
(33, NULL, 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1, '4fe2008255fe567423cc0c2f080ca741'),
(34, NULL, 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1, '686c0679e60bee52dbcc27f5502277b6'),
(35, NULL, 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1, '7e19b5fc5fc48b1cd317a6ac44d84236'),
(36, NULL, 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1, '4d5e1dd2369089f2db9480549241205f'),
(37, NULL, 155, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeUrl', 'GetUserTypeDescription', '', 1, '79fcd650625b296abf13216cd5af2428'),
(38, NULL, 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1, '67b9a4fbc45240a7887b73e3a246eba0'),
(39, NULL, 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1, 'fbebdb289fe38c1fbfeda4d3d8ee43ef'),
(40, NULL, 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1, '2065f8305645790970bac0b99f127f47'),
(41, NULL, 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1, '65bda5818e3545f1683a3ff5271cc891'),
(42, NULL, 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1, '47e3cf1c280e01dbaed43f9989a6747b'),
(43, NULL, 210, 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', 1, '719d15ee5f60f6348d2bd6a8911aeed1'),
(44, NULL, 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1, 'ff5eb984fe6ce3e8d769bf3ba646b902'),
(45, NULL, 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1, '0782f5a6df6dd52d834caea88c3ba3a7'),
(46, NULL, 100, 'main', 'OnFileDelete', 'main', '', '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable', 'onFileDelete', '', 1, '54c80cd94412db221338aeb59902f059'),
(47, NULL, 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1, '33e603755a0bc07abd51a1f8ed52966e'),
(48, NULL, 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1, '51ee2214895be904a880046f43e84138'),
(49, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'main', '', 'CMpNotifications', 'OnAdminInformerInsertItemsHandlerMP', '', 1, 'c89c0e94ac1110c334a24c70e1773daa'),
(50, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'main', '', '\\Bitrix\\Main\\Rest\\Handlers', 'onRestServiceBuildDescription', '', 1, 'c0b0c358a21b648d4f9c5d29d17a5ab2'),
(51, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeAdd', '', 1, 'e204684efc0764af9431ca94b950619a'),
(52, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onAfterUserTypeAdd', '', 1, '50932fb244caf7af686fac906caf3e73'),
(53, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeDelete', '', 1, 'd22a86deba0ff4bd031d022e331033b4'),
(54, NULL, 100, 'main', 'OnAuthProvidersBuildList', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessAuthProvider', 'getProviders', '', 1, '3a2839dac113bf47bce01812903e768a'),
(55, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionUpdate', '', 1, 'dde505dba68c59bd4661b7680c329485'),
(56, NULL, 100, 'iblock', 'OnBeforeIBlockSectionAdd', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionAdd', '', 1, 'd3a665b1890dabbba32ff01e3e46ec57'),
(57, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionDelete', '', 1, '157add4b02621a60fabf1369c3e7ea9b'),
(58, NULL, 100, 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 2, 'fa4fc3924ff2585e92f8bdabaf287864'),
(59, NULL, 100, 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 2, '6b358bb17b30da91b105fb1451ed9aaa'),
(60, NULL, 100, 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 2, '8f5ca6e1c5136cb4bbf30474f0ff4183'),
(61, NULL, 1000, 'sale', 'onBuildDiscountConditionInterfaceControls', 'main', '', '\\Bitrix\\Main\\Discount\\UserConditionControl', 'onBuildDiscountConditionInterfaceControls', '', 1, '9f0d91c081704e52b52f540b3acaf52e'),
(62, NULL, 100, 'main', 'OnBeforePhpMail', 'main', '', '\\Bitrix\\Main\\Mail\\Sender', 'applyCustomSmtp', '', 2, '10fbf5b8dec05a02d8d7010e594f16ec'),
(63, NULL, 100, 'main', 'OnBuildFilterFactoryMethods', 'main', '', '\\Bitrix\\Main\\Filter\\FactoryMain', 'onBuildFilterFactoryMethods', '', 2, '19f10c2686a955bd8b8116ea1f1ad829'),
(64, NULL, 100, 'main', 'onGetUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onGetUserFieldValues', '', 2, '7f9a5e25d638a6bff29f0bf4666da1a9'),
(65, NULL, 100, 'main', 'onUpdateUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onUpdateUserFieldValues', '', 2, 'd78761f994d74258421d271810f03ebf'),
(66, NULL, 100, 'main', 'onDeleteUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onDeleteUserFieldValues', '', 2, '074b2e25238a00ffc809ad12b609db2c'),
(67, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '37b1b1538fa6a6c5f41c9ce4afbf2789'),
(68, NULL, 100, 'main', 'OnAfterUserTypeUpdate', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '6a53bbd6e85686f4aa8a69d3d75f7e37'),
(69, NULL, 100, 'main', 'OnAfterUserTypeDelete', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '010cc1e3107418a1fd9f9a4cde7d93b9'),
(70, NULL, 100, 'main', 'OnBuildGlobalMenu', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBuildGlobalMenu', '', 1, '9c4452a442bacc2d4d70635962485be1'),
(71, NULL, 100, 'main', 'OnBeforeProlog', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBeforeProlog', '', 1, '641053ff6ee8ff57518d7c30724530e5'),
(72, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1, 'bc7c322534797a9ed3493c40e1b8fdac'),
(73, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1, '5499039afdd0fdb38d4b245c8b886dcb'),
(74, NULL, 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1, '5828a8cdb2cc45e2724ef1c76139df88'),
(75, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1, 'da69722ba95497cf263381b46e24df40'),
(76, NULL, 90, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1, 'f8c39ff182ad873715f10a7091f928a4'),
(77, NULL, 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1, '8ddf4f578e7229a63cba4d2124c7643c'),
(78, NULL, 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1, 'd6d308843a6521ad50bfa230a2fcef8f'),
(79, NULL, 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1, '1e4f94a842d6166359ed1789a6f21245'),
(80, NULL, 100, 'main', 'OnAfterFileSave', 'clouds', '', 'CCloudStorage', 'OnAfterFileSave', '', 1, 'c36bae07a3080f9b5bc5d422ec96933f'),
(81, NULL, 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1, '7ec03b3b7ad3f2f54c1e438a1172e5a8'),
(82, NULL, 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1, '6880b56c76f7d3c5d09f887fca6341ca'),
(83, NULL, 100, 'main', 'OnPhysicalFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1, '3151c487c747a57d7817f68e97fd1c94'),
(84, NULL, 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1, '713ea8a7a25764b1af60f7a1ec3032d5'),
(85, NULL, 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1, '705cd310c52f9c7e8e0c8a0578a22667'),
(86, NULL, 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1, 'a403ad2328227153475df0c478a465cc'),
(87, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObjectInstance', '', 1, 'a4eb7ed1f50b5931474c565f448a4069'),
(88, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObjectInstance', '', 1, '1e559e2225608e8d40eeede5b7526f2a'),
(89, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObjectInstance', '', 1, '5ad09feff5dab28ab571ad034ccdf2ea'),
(90, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObjectInstance', '', 1, 'cc976773610cf809bb56871ac7dd9f01'),
(91, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObjectInstance', '', 1, 'faadad31436e94c420ed787e4424714b'),
(92, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObjectInstance', '', 1, '5e63a8eebed42bd099b4a9ef62e8d52b'),
(93, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_HotBox', 'GetObjectInstance', '', 1, '1913169adcd6d6f3b7fb5f3b70ba1fd8'),
(94, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Yandex', 'GetObjectInstance', '', 1, '12bd1d4f0d145d5b1681955612fe61c8'),
(95, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_S3', 'GetObjectInstance', '', 1, '4af3f0ba1f50ed9be6efcdb55dfbee4e'),
(96, NULL, 100, 'perfmon', 'OnGetTableSchema', 'clouds', '', 'clouds', 'OnGetTableSchema', '', 1, 'd31a1f80f07441976eb1711db4902a71'),
(97, NULL, 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1, 'd10f791d422ba0e7551ab267db50404c'),
(98, NULL, 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1, 'b00a6174fb1763684c299ccf5e054c65'),
(99, NULL, 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1, '58ae853e2b7c230b5cdb51129efd8a05'),
(100, NULL, 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1, '7bdbd354eab11f376fa257a998587277'),
(101, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1, 'd9d06fd05f80b33379359ebd8e36e655'),
(102, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1, '20ca1d02998884b5abec68b32fdb561d'),
(103, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1, '991c32062e05844708a5cf7aba37bf9a'),
(104, NULL, 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1, '41bc5efb49ebf8d165acd4e4d556f60c'),
(105, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1, 'e0a610651ffec1fbddb2f261223fb2e9'),
(106, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1, 'fbfef1ef99530f6eae191da293f9566c'),
(107, NULL, 154, 'main', 'OnUserTypeBuildList', 'fileman', '', '\\Bitrix\\Fileman\\UserField\\Address', 'getUserTypeDescription', '', 1, 'f0583a376e38d3d2675513b1a367ed3c'),
(108, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1, 'f9dcff287cf7753e5c56974d37975507'),
(109, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1, 'd1fa2865e72eca144b964b6fb1eefc15'),
(110, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1, '1bf13707e1a45b8320c2ecd35534cbb4'),
(111, NULL, 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1, '2ac4a2154f4fd85d67b50f412ed5ed48'),
(112, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1, 'a6f7df502db8a04590e43188d7cbfc99'),
(113, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1, 'f2320df213f38adf32364d3169d5b197'),
(114, NULL, 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1, '46aef774958db327c1170a12d3a70ee5'),
(115, NULL, 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1, '861f6ee2ca56bf63c3af07db0553606b'),
(116, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1, '2a6d446893d46f04f2c151f458d2908c'),
(117, NULL, 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1, 'c6c8111f129e0eb19e558106e354e6f6'),
(118, NULL, 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1, '0ae9fc756bfb1273309240cd8f535672'),
(119, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1, '182d19c163e3a5a965bca170c3fb0e83'),
(120, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1, 'f7a182e8d9b204970d111e4703b9f523'),
(121, NULL, 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1, '6da245944e376d586a3fa2aaee02c70b'),
(122, NULL, 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1, '01b3f9984fa07b1dfb4bc35d107d5672'),
(123, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1, '2dbbccdee3f2e7bd86446bec02be1d54'),
(124, NULL, 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1, '78f090ee29030c54788098b0782d28f9'),
(125, NULL, 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1, '4b71a345c136beed338aa7137943d80b'),
(126, NULL, 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1, '3de75587a47352dd3cb6d10866f69385'),
(127, NULL, 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDate', 'GetUserTypeDescription', '', 1, 'fa608e2c397b6793c54ad296619a22e2'),
(128, NULL, 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDateTime', 'GetUserTypeDescription', '', 1, '78554c9e3c38ac383d51f0ee4d013120'),
(129, NULL, 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyXmlID', 'GetUserTypeDescription', '', 1, '952fe5f2ea67493fb9f9b924ce1b992b'),
(130, NULL, 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyFileMan', 'GetUserTypeDescription', '', 1, 'fd688441d5e8203751fb47374931e011'),
(131, NULL, 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyHTML', 'GetUserTypeDescription', '', 1, '27645f81ce5d6d9f19a47cc171860beb'),
(132, NULL, 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementList', 'GetUserTypeDescription', '', 1, 'c53e9314ae43c30267b32310a02d7df4'),
(133, NULL, 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySequence', 'GetUserTypeDescription', '', 1, '3ff9528d1264fc77697248957aafdab5'),
(134, NULL, 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementAutoComplete', 'GetUserTypeDescription', '', 1, '0d233a1e7a0d6a52a52e13df88291024'),
(135, NULL, 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySKU', 'GetUserTypeDescription', '', 1, '8678bc826ced4f66640fba3775b18516'),
(136, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySectionAutoComplete', 'GetUserTypeDescription', '', 1, '26ff6f651cb94a1fe4ce9827566f0730'),
(137, NULL, 100, 'main', 'onVirtualClassBuildList', 'iblock', '', 'Bitrix\\Iblock\\IblockTable', 'compileAllEntities', '', 2, '8a4e85071d25e6ba7f9ed315874c411b'),
(138, NULL, 100, 'crm', 'onAfterCrmCompanyAdd', 'landing', '', '\\Bitrix\\Landing\\Connector\\Crm', 'onAfterCompanyChange', '', 2, '7e8fed841380d8075d45525f328e8940'),
(139, NULL, 100, 'crm', 'onAfterCrmCompanyUpdate', 'landing', '', '\\Bitrix\\Landing\\Connector\\Crm', 'onAfterCompanyChange', '', 2, '688027a0f389137b02ac0a834f0a8495'),
(140, NULL, 100, 'iblock', 'onAfterIBlockSectionDelete', 'landing', '', '\\Bitrix\\Landing\\Connector\\Iblock', 'onAfterIBlockSectionDelete', '', 2, 'ffe8a984ae7ff50064ac74e788a80118'),
(141, NULL, 100, 'intranet', 'onBuildBindingMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\Intranet', 'onBuildBindingMenu', '', 2, 'd5464da9aea2308d3d5f13c2387c4c40'),
(142, NULL, 100, 'landing', 'onBuildSourceList', 'landing', '', '\\Bitrix\\Landing\\Connector\\Landing', 'onSourceBuildHandler', '', 2, 'fc391addc82a816df68510b0ae3363a5'),
(143, NULL, 100, 'main', 'onBeforeSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onBeforeMainSiteDelete', '', 2, '5faa9b5de931dbb101e2e0aef6fc594b'),
(144, NULL, 100, 'main', 'onSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onMainSiteDelete', '', 2, 'af029bceca7ea9cc809515e95bd3a710'),
(145, NULL, 100, 'main', 'onUserConsentProviderList', 'landing', '', '\\Bitrix\\Landing\\Site\\Cookies', 'onUserConsentProviderList', '', 2, 'f59a96e272348f934d62ba5d3ee79f21'),
(146, NULL, 100, 'mobile', 'onMobileMenuStructureBuilt', 'landing', '', '\\Bitrix\\Landing\\Connector\\Mobile', 'onMobileMenuStructureBuilt', '', 2, '01fd8a44b83b5f7fcd2f36a626657ad0'),
(147, NULL, 100, 'rest', 'onRestServiceBuildDescription', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restBase', '', 2, '9af99ddecf2dd8c3c5b14721f23e8fef'),
(148, NULL, 100, 'rest', 'onBeforeApplicationUninstall', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'beforeRestApplicationDelete', '', 2, 'ef1f080a088ad54298a4ba9bf2896313'),
(149, NULL, 100, 'rest', 'onRestAppDelete', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restApplicationDelete', '', 2, '031cfc016e3be91368376a391c351dea'),
(150, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifest', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getManifestList', '', 2, 'b88124aac7c2c8ddecf2ce127a9c6ef8'),
(151, NULL, 100, 'rest', 'onRestApplicationConfigurationExport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventExportController', '', 2, '917b00a9f82e6b8f7899a6e8c3b22236'),
(152, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifestSetting', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onInitManifest', '', 2, '99fa9aa37a23a371cca0153c840c7802'),
(153, NULL, 100, 'rest', 'onRestApplicationConfigurationEntity', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getEntityList', '', 2, '820df699b9abf22ce0356fc9957be794'),
(154, NULL, 100, 'rest', 'onRestApplicationConfigurationImport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventImportController', '', 2, 'e65daaed01b2c52e6098ee47ddb7f07a'),
(155, NULL, 100, 'rest', 'onRestApplicationConfigurationFinish', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onFinish', '', 2, '45343e5617dca2ad06a5d13050232caf'),
(156, NULL, 100, 'seo', 'onExtensionInstall', 'landing', '', '\\Bitrix\\Landing\\Hook\\Page\\PixelFb', 'changeBusinessPixel', '', 2, '27bf01f04349ff82ede423de62df5384'),
(157, NULL, 100, 'socialnetwork', 'onFillSocNetFeaturesList', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetFeaturesList', '', 2, '9825d91c89b53b69655aa98ea4f3a6cf'),
(158, NULL, 100, 'socialnetwork', 'onFillSocNetMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetMenu', '', 2, '14ecfb8fb4fc20f22ddb5ac64783461d'),
(159, NULL, 100, 'socialnetwork', 'onSocNetGroupDelete', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onSocNetGroupDelete', '', 2, '78202f1461a8822a105a19f45502c327'),
(160, NULL, 100, 'main', 'OnAfterEpilog', 'messageservice', '', '\\Bitrix\\MessageService\\Queue', 'run', '', 1, '6bcb21b0ccc5ac89d9531ddf8b94683c'),
(161, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestServiceBuildDescription', '', 1, '7524628243223e572590eea87cc03f73'),
(162, NULL, 100, 'rest', 'OnRestAppDelete', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppDelete', '', 1, '5febc41cd526ecba95dbb4843dd9c134'),
(163, NULL, 100, 'rest', 'OnRestAppUpdate', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppUpdate', '', 1, '7e77b4d550c200a4ec06872af7857ee6'),
(164, NULL, 100, 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', 1, '3a4da255b44f05899b64e66a40c12662'),
(165, NULL, 49, 'main', 'OnBeforeProlog', 'rest', '', 'CRestEventHandlers', 'OnBeforeProlog', '', 2, '395c9c42c3cc9392de1e5887617afe6d'),
(166, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', 'CBitrixRestEntity', 'OnRestServiceBuildDescription', '', 2, 'f63068b1eb62c36219518206e1e2827c'),
(167, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\User', 'onRestServiceBuildDescription', '', 2, 'c9a03e9019564649e55f5409b661e050'),
(168, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Placement', 'onRestServiceBuildDescription', '', 2, '9751a266c2b6f6be5c34b1541bf7c194'),
(169, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Event', 'onRestServiceBuildDescription', '', 2, '842ad63f19aff6d810059c7e56739aae'),
(170, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\UserFieldType', 'onRestServiceBuildDescription', '', 2, '4caf68a5256aabe4abef37f24562e59b'),
(171, NULL, 100, 'rest', 'onFindMethodDescription', 'rest', '', '\\Bitrix\\Rest\\Engine\\RestManager', 'onFindMethodDescription', '', 2, '4d0614f880674af333326dd5ba9b2828'),
(172, NULL, 100, 'main', 'OnApplicationsBuildList', 'main', 'modules/rest/lib/apauth/application.php', '\\Bitrix\\Rest\\APAuth\\Application', 'onApplicationsBuildList', '', 2, '9c39129872987f8dcc8baacc0c446ed7'),
(173, NULL, 100, 'im', 'OnAfterConfirmNotify', 'rest', '', '\\Bitrix\\Rest\\NotifyIm', 'receive', '', 2, '2ac9c19fe69d4e106deaa6f4a7a4371b'),
(174, NULL, 100, 'rest', '\\Bitrix\\Rest\\APAuth\\Password::OnDelete', 'rest', '', '\\Bitrix\\Rest\\APAuth\\PermissionTable', 'onPasswordDelete', '', 2, 'f04447ca635f045ec1a64e593964fc90'),
(175, NULL, 100, 'perfmon', 'OnGetTableSchema', 'rest', '', 'rest', 'OnGetTableSchema', '', 2, '47a76003c8f9f2d8c820f446e084ff39'),
(176, NULL, 100, 'rest', 'OnRestApplicationConfigurationImport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventImportController', '', 2, '3fc1dd7e523b33f9d76c19e54d45c2fb'),
(177, NULL, 100, 'rest', 'OnRestApplicationConfigurationExport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventExportController', '', 2, 'b90a349060c693506b740c4d36f75f5f'),
(178, NULL, 100, 'rest', 'OnRestApplicationConfigurationClear', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventClearController', '', 2, '75dccda637a740c033b2d014a84a8009'),
(179, NULL, 100, 'rest', 'OnRestApplicationConfigurationEntity', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getEntityList', '', 2, '8d83d219eaf2f415d55fb67e221b7c3d'),
(180, NULL, 100, 'rest', 'OnRestApplicationConfigurationGetManifest', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getManifestList', '', 2, '6ba35b1f4b01d1e358e1b3a79ac437d6'),
(181, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\OAuth\\Auth', 'onRestCheckAuth', '', 2, '70e923729089b8cba69bb3b4311da11e'),
(182, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\APAuth\\Auth', 'onRestCheckAuth', '', 2, '3550e6c95772564101770e0c9cb54470'),
(183, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\SessionAuth\\Auth', 'onRestCheckAuth', '', 2, '8e33ae5a47b59d21df7d26f916d19e38'),
(184, NULL, 100, 'main', 'OnAfterRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Engine\\ScopeManager', 'onChangeRegisterModule', '', 2, '900fb8bbf0d59d1924bedae5da1b6eb1'),
(185, NULL, 100, 'main', 'OnAfterUnRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Engine\\ScopeManager', 'onChangeRegisterModule', '', 2, 'e97e569fe3fc7775aa4ece09cdf209bc'),
(186, NULL, 100, 'main', 'OnAfterRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\TagTable', 'onAfterRegisterModule', '', 2, '80afec537db1eeda99462f0676dbb835'),
(187, NULL, 100, 'main', 'OnAfterUnRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\TagTable', 'onAfterUnRegisterModule', '', 2, 'fe9cb5af7e8ca277ca29b4a5423bd08b'),
(188, NULL, 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1, '1c37aedc2ec89f94624291d097fe7adf'),
(189, NULL, 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1, 'd51170fc3433fde7eab8edc1c2b933a0'),
(190, NULL, 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1, '05382d7448b1ba259b89bf9e87e4eb44'),
(191, NULL, 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1, '15ebda82514af5a966b3466cd26992a4'),
(192, NULL, 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1, '9e0cea5039973193afc706ec8978d674'),
(193, NULL, 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1, '524a910f381ba144bf50caa152222ed6'),
(194, NULL, 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1, 'a40ffd36df151e2c0294b5639e81d665'),
(195, NULL, 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1, '9c8df2577e0cb80c68afa2030e193efb'),
(196, NULL, 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1, '6b3591ad78ac2a3ce6ad411f0aff47fe'),
(197, NULL, 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2, '79688b0b4a106b805d09e63ffe88f580'),
(198, NULL, 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2, '7995eac5813e40f6b3e82b146631397e'),
(199, NULL, 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2, '313b34609f1fa34d34cde1c2103c09ff'),
(200, NULL, 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2, 'c61de21b0b0873525fa5c39427324664'),
(201, NULL, 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2, '1b167ab85d6d744bba456e559546f13e'),
(202, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', 2, '148ce014df9dd9f99f17ebfc5d766e8a'),
(203, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', 2, '4b1e9896d9f0aa37a7039a321f25f9a5'),
(204, NULL, 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', 2, 'b699c1c0d6665f9cffe7ff76ab108a24'),
(205, NULL, 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', 2, 'ff3a36654015c53890f4cf2204b030c4'),
(206, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', 2, 'aa5f8c360ed88eb5e2884c57b6f1f2f3'),
(207, NULL, 100, 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', 2, 'a1022e0619263c0e91139fb3f9837085'),
(208, NULL, 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', 2, '27930cffcd40b84666d0a22e1a953c41'),
(209, NULL, 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', 2, 'f0151e07363564774d45acba4100aebe'),
(210, NULL, 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', 2, 'd4d54756116942c9ee0bda9b31e9d0e7'),
(211, NULL, 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', 2, '3e0a8569016a4c941f3eb4aa9fca6e8b'),
(212, NULL, 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', 2, '7f4379c818231561b41589d3de41e36b'),
(213, NULL, 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2, 'c894d167ef03c35375b8eb8f2551a798'),
(214, NULL, 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2, '5fdf8dd9fd70719e442efcb589175bf0'),
(215, NULL, 100, 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', 2, '07d4ab0b1aa0aa130a0cbc06403f6eae'),
(216, NULL, 100, 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', 2, 'cf6298b090e92e955b32c358c1d14b25'),
(217, NULL, 100, 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', 2, '745afed820778e33d5cd3e91cbd622f1'),
(218, NULL, 100, 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', 2, '12861bd5c6c27ffa2abe5cac90ea58d8'),
(219, NULL, 100, 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', 2, 'ead8fb64fece572d1fabd3d6fd27af27'),
(220, NULL, 100, 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', 2, 'b7b9ac4bbf458d433e1cf3835ff4cb6c'),
(221, NULL, 100, 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', 2, 'c19eb7659342fabc34b953f69e8b9eee'),
(222, NULL, 100, 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', 2, '379294eefad289e474bf0c5ce2a281d8'),
(223, NULL, 100, 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '0f4deda4d57adb4389d85a19e5bbcf2b'),
(224, NULL, 100, 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '3d040ae51f0f6a4b2a08be0e6e1494d4'),
(225, NULL, 100, 'bitrix24', 'onDomainChange', 'seo', '', '\\Bitrix\\Seo\\Service', 'changeRegisteredDomain', '', 2, 'fcb2dadb8b7ff1863c0ad86320e9e521'),
(226, NULL, 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1, '1f5b8fc024dfdf83952d6c723466cdf5'),
(227, NULL, 100, 'main', 'OnAfterUserLogout', 'socialservices', '', 'CSocServEventHandlers', 'OnUserLogout', '', 1, '7e4c40a3ff7cd102879cef10653f97ac'),
(228, NULL, 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1, 'a16159f6a90f1b67cb9ec15b0c1bab3a'),
(229, NULL, 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1, '9567feb38890d6581a3204dc5e65e8b6'),
(230, NULL, 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1, 'b728f3cea11d374f7638c29f84e8e15e'),
(231, NULL, 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1, '1ab251d15efc87c5b5cfe6396f5dec1b'),
(232, NULL, 100, 'perfmon', 'OnGetTableSchema', 'socialservices', '', 'socialservices', 'OnGetTableSchema', '', 1, '56107bf1a0dcee0db660c0ec27c31c6c'),
(233, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkOldUser', '', 1, 'c3d7460e4ef694f5bc53b6a6ad902407'),
(234, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkAbandonedUser', '', 1, '331f99f0b265544c33777c299eab16f6'),
(235, NULL, 100, 'main', 'OnPanelCreate', 'translate', '', '\\Bitrix\\Translate\\Ui\\Panel', 'onPanelCreate', '', 1, '88ecb95eac2e28b80f234bfc8c1cd597'),
(236, NULL, 100, 'perfmon', 'OnGetTableSchema', 'translate', '', 'translate', 'onGetTableSchema', '', 1, '00347f45b2f48480b1a521c32036beb5'),
(239, NULL, 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1, 'bbd7b8c1e518a0b3eae815eb91a95c11');

-- --------------------------------------------------------

--
-- Структура таблицы `b_numerator`
--

CREATE TABLE `b_numerator` (
  `ID` int UNSIGNED NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_numerator_sequence`
--

CREATE TABLE `b_numerator_sequence` (
  `NUMERATOR_ID` int NOT NULL DEFAULT '0',
  `KEY` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `TEXT_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NEXT_NUMBER` int DEFAULT NULL,
  `LAST_INVOCATION_TIME` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_operation`
--

CREATE TABLE `b_operation` (
  `ID` int NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_operation`
--

INSERT INTO `b_operation` (`ID`, `NAME`, `MODULE_ID`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'edit_php', 'main', NULL, 'module'),
(2, 'view_own_profile', 'main', NULL, 'module'),
(3, 'edit_own_profile', 'main', NULL, 'module'),
(4, 'view_all_users', 'main', NULL, 'module'),
(5, 'view_groups', 'main', NULL, 'module'),
(6, 'view_tasks', 'main', NULL, 'module'),
(7, 'view_other_settings', 'main', NULL, 'module'),
(8, 'view_subordinate_users', 'main', NULL, 'module'),
(9, 'edit_subordinate_users', 'main', NULL, 'module'),
(10, 'edit_all_users', 'main', NULL, 'module'),
(11, 'edit_groups', 'main', NULL, 'module'),
(12, 'edit_tasks', 'main', NULL, 'module'),
(13, 'edit_other_settings', 'main', NULL, 'module'),
(14, 'cache_control', 'main', NULL, 'module'),
(15, 'lpa_template_edit', 'main', NULL, 'module'),
(16, 'view_event_log', 'main', NULL, 'module'),
(17, 'edit_ratings', 'main', NULL, 'module'),
(18, 'manage_short_uri', 'main', NULL, 'module'),
(19, 'fm_view_permission', 'main', NULL, 'file'),
(20, 'fm_view_file', 'main', NULL, 'file'),
(21, 'fm_view_listing', 'main', NULL, 'file'),
(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
(23, 'fm_create_new_file', 'main', NULL, 'file'),
(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
(25, 'fm_create_new_folder', 'main', NULL, 'file'),
(26, 'fm_delete_file', 'main', NULL, 'file'),
(27, 'fm_delete_folder', 'main', NULL, 'file'),
(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
(29, 'fm_rename_file', 'main', NULL, 'file'),
(30, 'fm_rename_folder', 'main', NULL, 'file'),
(31, 'fm_upload_file', 'main', NULL, 'file'),
(32, 'fm_add_to_menu', 'main', NULL, 'file'),
(33, 'fm_download_file', 'main', NULL, 'file'),
(34, 'fm_lpa', 'main', NULL, 'file'),
(35, 'fm_edit_permission', 'main', NULL, 'file'),
(36, 'bitrixcloud_monitoring', 'bitrixcloud', NULL, 'module'),
(37, 'bitrixcloud_backup', 'bitrixcloud', NULL, 'module'),
(38, 'bitrixcloud_cdn', 'bitrixcloud', NULL, 'module'),
(39, 'clouds_browse', 'clouds', NULL, 'module'),
(40, 'clouds_upload', 'clouds', NULL, 'module'),
(41, 'clouds_config', 'clouds', NULL, 'module'),
(42, 'fileman_view_all_settings', 'fileman', '', 'module'),
(43, 'fileman_edit_menu_types', 'fileman', '', 'module'),
(44, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
(45, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
(46, 'fileman_edit_existent_files', 'fileman', '', 'module'),
(47, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
(48, 'fileman_admin_files', 'fileman', '', 'module'),
(49, 'fileman_admin_folders', 'fileman', '', 'module'),
(50, 'fileman_view_permissions', 'fileman', '', 'module'),
(51, 'fileman_edit_all_settings', 'fileman', '', 'module'),
(52, 'fileman_upload_files', 'fileman', '', 'module'),
(53, 'fileman_view_file_structure', 'fileman', '', 'module'),
(54, 'fileman_install_control', 'fileman', '', 'module'),
(55, 'medialib_view_collection', 'fileman', '', 'medialib'),
(56, 'medialib_new_collection', 'fileman', '', 'medialib'),
(57, 'medialib_edit_collection', 'fileman', '', 'medialib'),
(58, 'medialib_del_collection', 'fileman', '', 'medialib'),
(59, 'medialib_access', 'fileman', '', 'medialib'),
(60, 'medialib_new_item', 'fileman', '', 'medialib'),
(61, 'medialib_edit_item', 'fileman', '', 'medialib'),
(62, 'medialib_del_item', 'fileman', '', 'medialib'),
(63, 'sticker_view', 'fileman', '', 'stickers'),
(64, 'sticker_edit', 'fileman', '', 'stickers'),
(65, 'sticker_new', 'fileman', '', 'stickers'),
(66, 'sticker_del', 'fileman', '', 'stickers'),
(67, 'hl_element_read', 'highloadblock', NULL, 'module'),
(68, 'hl_element_write', 'highloadblock', NULL, 'module'),
(69, 'hl_element_delete', 'highloadblock', NULL, 'module'),
(70, 'section_read', 'iblock', NULL, 'iblock'),
(71, 'element_read', 'iblock', NULL, 'iblock'),
(72, 'section_element_bind', 'iblock', NULL, 'iblock'),
(73, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
(74, 'element_edit', 'iblock', NULL, 'iblock'),
(75, 'element_edit_price', 'iblock', NULL, 'iblock'),
(76, 'element_delete', 'iblock', NULL, 'iblock'),
(77, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
(78, 'section_edit', 'iblock', NULL, 'iblock'),
(79, 'section_delete', 'iblock', NULL, 'iblock'),
(80, 'section_section_bind', 'iblock', NULL, 'iblock'),
(81, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
(82, 'iblock_edit', 'iblock', NULL, 'iblock'),
(83, 'iblock_delete', 'iblock', NULL, 'iblock'),
(84, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
(85, 'iblock_export', 'iblock', NULL, 'iblock'),
(86, 'section_rights_edit', 'iblock', NULL, 'iblock'),
(87, 'element_rights_edit', 'iblock', NULL, 'iblock'),
(88, 'landing_read', 'landing', NULL, 'module'),
(89, 'landing_edit', 'landing', NULL, 'module'),
(90, 'landing_sett', 'landing', NULL, 'module'),
(91, 'landing_public', 'landing', NULL, 'module'),
(92, 'landing_delete', 'landing', NULL, 'module'),
(93, 'seo_settings', 'seo', '', 'module'),
(94, 'seo_tools', 'seo', '', 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_option`
--

CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_option`
--

INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
('fileman', 'different_set', 'Y', NULL, NULL),
('fileman', 'GROUP_DEFAULT_TASK', '18', NULL, NULL),
('fileman', 'stickers_default_access', '27', NULL, NULL),
('fileman', 'stickers_hide_bottom', 'Y', NULL, NULL),
('fileman', 'stickers_start_sizes', '400_250', NULL, NULL),
('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
('fileman', 'use_editor_3', 'Y', NULL, NULL),
('fileman', 'use_pspell', 'N', NULL, NULL),
('iblock', 'use_htmledit', 'Y', NULL, NULL),
('landing', 'pub_path_s1', '/lp/', NULL, NULL),
('main', '~crypto_b_socialservices_user', 'a:2:{s:7:\"OATOKEN\";b:1;s:13:\"REFRESH_TOKEN\";b:1;}', NULL, NULL),
('main', '~crypto_b_user_auth_code', 'a:1:{s:10:\"OTP_SECRET\";b:1;}', NULL, NULL),
('main', '~crypto_b_user_phone_auth', 'a:1:{s:10:\"OTP_SECRET\";b:1;}', NULL, NULL),
('main', '~new_license18_0_sign', 'Y', NULL, NULL),
('main', 'admin_lid', 'ru', NULL, NULL),
('main', 'admin_passwordh', 'FVgQcGYUBgUtCUVcBRcDCgsTAQ==', NULL, NULL),
('main', 'control_file_duplicates', 'Y', NULL, NULL),
('main', 'email_from', 'mallaev.yakov@yandex.ru', NULL, NULL),
('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
('main', 'last_mp_modules_result', 'a:4:{s:10:\"check_date\";i:1657434792;s:13:\"update_module\";a:0:{}s:10:\"end_update\";a:0:{}s:10:\"new_module\";a:0:{}}', NULL, NULL),
('main', 'optimize_css_files', 'Y', NULL, NULL),
('main', 'optimize_js_files', 'Y', NULL, NULL),
('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
('main', 'rating_assign_authority_group', '4', NULL, NULL),
('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
('main', 'rating_assign_rating_group', '3', NULL, NULL),
('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
('main', 'rating_assign_type', 'auto', NULL, NULL),
('main', 'rating_authority_rating', '2', NULL, NULL),
('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
('main', 'rating_community_authority', '30', NULL, NULL),
('main', 'rating_community_last_visit', '90', NULL, NULL),
('main', 'rating_community_size', '1', NULL, NULL),
('main', 'rating_count_vote', '10', NULL, NULL),
('main', 'rating_normalization', '10', NULL, NULL),
('main', 'rating_normalization_type', 'auto', NULL, NULL),
('main', 'rating_self_vote', 'Y', NULL, NULL),
('main', 'rating_start_authority', '3', NULL, NULL),
('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
('main', 'rating_vote_show', 'Y', NULL, NULL),
('main', 'rating_vote_template', 'like', NULL, NULL),
('main', 'rating_vote_type', 'like', NULL, NULL),
('main', 'rating_vote_weight', '10', NULL, NULL),
('main', 'secure_logout', 'Y', NULL, NULL),
('main', 'server_uniq_id', '7f4faebd03ad0513b574b933a8e97cdf', NULL, NULL),
('main', 'signer_default_key', '7969c01c03136ba5b6db1b177a3fd08e8bb44b302314948405ddeb2d03286b740b20d3750f8461db881d9decad6fc5b151d0720037e017f3db47152051b984e3', NULL, NULL),
('main', 'update_site', 'www.1c-bitrix.ru', NULL, NULL),
('main', 'update_site_ns', 'Y', NULL, NULL),
('main', 'vendor', '1c_bitrix', NULL, NULL),
('main', 'wizard_firstcorp_services_s1', 'Y', NULL, NULL),
('messageservice', 'clean_up_period', '14', NULL, NULL),
('rest', 'app_immune', '[\"infoservice.migrator_amocrm\",\"informunity.excel\",\"integrations24ru.pipedrive\",\"integrations24ru.asana\",\"integrations24ru.sugar\",\"bitrix.eshop\",\"bitrix.1cdoc\",\"bitrix.assistant\",\"bitrix.denominationby\",\"bitrix.propertiesbot\",\"bitrix.giphybot\",\"bitrix.1c\",\"bitrix.restapi\",\"bitrix.partnerlandingexport\",\"bitrix.partnerapplication\",\"bitrix.partnerlanding\",\"bitrix.1ctotal\",\"integrations24.pipedrive\",\"integrations24ru.pipedrive\",\"integrations24.zoho\",\"integrations24.asana\",\"integrations24ru.asana\",\"integrations24.sugar\",\"integrations24ru.sugar\",\"integrations24.jira_migration\",\"integrations24.qbinventory\",\"integrations24.zohoinventory\",\"bitrix.khellouin_ru\",\"bitrix.den_zashchitnika_otechestva_2_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_ua\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_ua\",\"bitrix.mezhdunarodnyy_zhenskiy_den_ua\",\"bitrix.den_smekha_ua\",\"bitrix.den_svyatogo_valentina_ua\",\"bitrix.den_vsekh_vlyublyennykh_ua\",\"bitrix.katolicheskaya_paskha_ua\",\"bitrix.novyy_god_ua\",\"bitrix.rozhdestvo_ua\",\"bitrix.valentinov_den_ua\",\"bitrix.pravoslavnaya_paskha_ua\",\"bitrix.chernaya_pyatnitsa_ua\",\"bitrix.khellouin_ua\",\"bitrix.den_zashchitnika_otechestva_3_ru\",\"bitrix.den_zashchitnika_otechestva_ru\",\"bitrix.den_zashchitnika_otechestva_by\",\"bitrix.den_zashchitnika_otechestva_2_by\",\"bitrix.den_zashchitnika_otechestva_3_by\",\"bitrix.den_zashchitnika_otechestva_kz\",\"bitrix.den_zashchitnika_otechestva_2_kz\",\"bitrix.den_zashchitnika_otechestva_3_kz\",\"bitrix.pravoslavnaya_paskha_ru\",\"bitrix.pravoslavnaya_paskha_by\",\"bitrix.pravoslavnaya_paskha_kz\",\"bitrix.den_smekha_ru\",\"bitrix.den_smekha_by\",\"bitrix.den_smekha_kz\",\"bitrix.valentinov_den_ru\",\"bitrix.valentinov_den_by\",\"bitrix.valentinov_den_kz\",\"bitrix.rozhdestvo_ru\",\"bitrix.rozhdestvo_by\",\"bitrix.rozhdestvo_kz\",\"bitrix.novyy_god_ru\",\"bitrix.novyy_god_by\",\"bitrix.novyy_god_kz\",\"bitrix.katolicheskaya_paskha_ru\",\"bitrix.katolicheskaya_paskha_by\",\"bitrix.katolicheskaya_paskha_kz\",\"bitrix.den_vsekh_vlyublyennykh_ru\",\"bitrix.den_vsekh_vlyublyennykh_by\",\"bitrix.den_vsekh_vlyublyennykh_kz\",\"bitrix.den_svyatogo_valentina_ru\",\"bitrix.den_svyatogo_valentina_by\",\"bitrix.den_svyatogo_valentina_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_kz\",\"bitrix.thanksgiving_day_en\",\"bitrix.april_fools_day_en\",\"bitrix.valentine_s_day_en\",\"bitrix.valentine_s_day_2_en\",\"bitrix.valentine_s_day_3_en\",\"bitrix.chernaya_pyatnitsa_ru\",\"bitrix.chernaya_pyatnitsa_by\",\"bitrix.chernaya_pyatnitsa_kz\",\"bitrix.khellouin_by\",\"bitrix.khellouin_kz\",\"bitrix.easter_en\",\"bitrix.halloween_en\",\"bitrix.christmas_en\",\"bitrix.new_year_en\",\"bitrix.black_friday_en\",\"bitrix.kraytvirtualtravel_ru\",\"bitrix.kraytvirtualtravel_by\",\"bitrix.kraytvirtualtravel_kz\",\"bitrix.kraytvirtualtravel_ua\",\"bitrix.kraytnutritionist_ru\",\"bitrix.kraytnutritionist_by\",\"bitrix.delobotcorporatetraining_en\",\"bitrix.delobotblackfriday_en\",\"bitrix.delobotcleaningcompany_en\",\"bitrix.delobotfitness_en\",\"bitrix.delobotfooddelivery_en\",\"bitrix.delobotvisagiste_en\",\"bitrix.delobotpsychologist_en\",\"bitrix.delobotflorist_en\",\"bitrix.delobotdecoration_en\",\"bitrix.delobotcarservice_en\",\"bitrix.kraytagency_en\",\"bitrix.kraytagriculture_en\",\"bitrix.kraytarchitecture_en\",\"bitrix.kraytbusiness_en\",\"bitrix.kraytdelivery_en\",\"bitrix.kraytevents_en\",\"bitrix.kraythalloween_en\",\"bitrix.kraytvetclinic_en\",\"bitrix.kraytmasterforhour_en\",\"bitrix.kraytinstagramcontacts_en\",\"bitrix.kraytinstagramstock_en\",\"bitrix.kraytinstagramtarget_en\",\"bitrix.kraytonlinebabysitter_en\",\"bitrix.kraytpetservice_en\",\"bitrix.kraytsolarenergy_en\",\"bitrix.kraytsportonline_en\",\"bitrix.kraytsummersale_en\",\"bitrix.krayttravelblog_en\",\"bitrix.kraytvebinar_en\",\"bitrix.kraytartificialintelligence_en\",\"bitrix.kraytbakeryproducts_en\",\"bitrix.kraytchildrensschool_en\",\"bitrix.kraytfooddelivery_en\",\"bitrix.kraytfurniture_en\",\"bitrix.kraytvirtualtravel_en\",\"bitrix.kraytyoutubechannel_en\",\"bitrix.kraytknitting_en\",\"bitrix.kraytnutritionist_en\",\"bitrix.kraytnailservice_en\",\"bitrix.kraytmedicine_en\",\"bitrix.kraytprofipage_en\",\"bitrix.kraytsale11_en\",\"bitrix.delobotblackfriday_ua\",\"bitrix.delobotcleaning_ua\",\"bitrix.delobotcorporatetraining_ua\",\"bitrix.delobotfitness_ua\",\"bitrix.delobotfooddelivery_ua\",\"bitrix.delobotvisagiste_ua\",\"bitrix.kraytagency_ua\",\"bitrix.kraytagriculture_ua\",\"bitrix.kraytarchitecture_ua\",\"bitrix.kraytbusiness_ua\",\"bitrix.kraytevents_ua\",\"bitrix.kraythalloween_ua\",\"bitrix.kraytinstagramcontacts_ua\",\"bitrix.kraytinstagramstock_ua\",\"bitrix.kraytinstagramtarget_ua\",\"bitrix.kraytpetservice_ua\",\"bitrix.kraytsolarenergy_ua\",\"bitrix.kraytsummersale_ua\",\"bitrix.krayttravelblog_ua\",\"bitrix.kraytvebinar_ua\",\"bitrix.kraytvetclinic_ua\",\"bitrix.kraytnutritionist_ua\",\"bitrix.kraytnutritionist_kz\",\"bitrix.kraytfurniture_by\",\"bitrix.kraytfurniture_ru\",\"bitrix.kraytfurniture_kz\",\"bitrix.kraytfurniture_ua\",\"bitrix.kraytmedicine_ru\",\"bitrix.kraytmedicine_by\",\"bitrix.kraytmedicine_kz\",\"bitrix.kraytmedicine_ua\",\"bitrix.kraytsale11_ru\",\"bitrix.kraytsale11_by\",\"bitrix.kraytsale11_kz\",\"bitrix.kraytsale11_ua\",\"bitrix.kraytnailservice_ru\",\"bitrix.kraytnailservice_by\",\"bitrix.kraytnailservice_kz\",\"bitrix.kraytnailservice_ua\",\"bitrix.kraytknitting_ru\",\"bitrix.kraytknitting_by\",\"bitrix.kraytknitting_kz\",\"bitrix.kraytknitting_ua\",\"bitrix.kraytfooddelivery_ru\",\"bitrix.kraytfooddelivery_by\",\"bitrix.kraytfooddelivery_kz\",\"bitrix.kraytfooddelivery_ua\",\"bitrix.kraytbakeryproducts_ru\",\"bitrix.kraytbakeryproducts_by\",\"bitrix.kraytbakeryproducts_kz\",\"bitrix.kraytbakeryproducts_ua\",\"bitrix.kraytschoolmusic_ru\",\"bitrix.kraytschoolmusic_by\",\"bitrix.kraytschoolmusic_kz\",\"bitrix.kraytschoolmusic_ua\",\"bitrix.kraytautomechanic_ru\",\"bitrix.kraytautomechanic_by\",\"bitrix.kraytautomechanic_kz\",\"bitrix.kraytautomechanic_ua\",\"bitrix.kraytpresents_ru\",\"bitrix.kraytpresents_by\",\"bitrix.kraytpresents_kz\",\"bitrix.kraytpresents_ua\",\"bitrix.kraytportfoliophotographer_ru\",\"bitrix.kraytportfoliophotographer_by\",\"bitrix.kraytportfoliophotographer_kz\",\"bitrix.kraytportfoliophotographer_ua\",\"bitrix.kraytcrm_ru\",\"bitrix.delobotcleaningcompany_ru\",\"bitrix.delobotblackfriday_ru\",\"bitrix.delobotblackfriday_by\",\"bitrix.delobotblackfriday_kz\",\"bitrix.delobotcleaningcompany_by\",\"bitrix.delobotcleaningcompany_kz\",\"bitrix.delobotcorporatetraining_ru\",\"bitrix.delobotcorporatetraining_by\",\"bitrix.delobotcorporatetraining_kz\",\"bitrix.delobotfitness_ru\",\"bitrix.delobotfitness_by\",\"bitrix.delobotfitness_kz\",\"bitrix.delobotfooddelivery_ru\",\"bitrix.delobotfooddelivery_by\",\"bitrix.delobotfooddelivery_kz\",\"bitrix.delobotvisagiste_ru\",\"bitrix.delobotvisagiste_by\",\"bitrix.delobotvisagiste_kz\",\"bitrix.delobotgiftsforwomensday_ru\",\"bitrix.delobotgiftsforwomensday_by\",\"bitrix.delobotgiftsforwomensday_kz\",\"bitrix.delobotgiftsforwomensday_ua\",\"bitrix.delobotwebdesigner_ru\",\"bitrix.delobotwebdesigner_by\",\"bitrix.delobotwebdesigner_kz\",\"bitrix.delobotwebdesigner_ua\",\"bitrix.delobotatelier_ru\",\"bitrix.delobotatelier_by\",\"bitrix.delobotatelier_kz\",\"bitrix.delobotatelier_ua\",\"bitrix.delobotconstructioncompany_ru\",\"bitrix.delobotconstructioncompany_by\",\"bitrix.delobotconstructioncompany_ua\",\"bitrix.delobotlanguageschool_ru\",\"bitrix.delobotlanguageschool_by\",\"bitrix.delobotlanguageschool_kz\",\"bitrix.delobotlanguageschool_ua\",\"bitrix.delobotcoffee_ru\",\"bitrix.delobotcoffee_by\",\"bitrix.delobotcoffee_kz\",\"bitrix.delobotcoffee_ua\",\"bitrix.kraytcrm_by\",\"bitrix.kraytcrm_kz\",\"bitrix.kraytcrm_ua\",\"bitrix.kraytonlinebabysitter_ru\",\"bitrix.kraytonlinebabysitter_by\",\"bitrix.kraytonlinebabysitter_kz\",\"bitrix.kraytonlinebabysitter_uaa\",\"bitrix.kraytsportonline_ru\",\"bitrix.kraytsportonline_by\",\"bitrix.kraytsportonline_kz\",\"bitrix.kraytsportonline_ua\",\"bitrix.kraytmasterforhour_ru\",\"bitrix.kraytmasterforhour_by\",\"bitrix.kraytmasterforhour_kz\",\"bitrix.kraytmasterforhour_ua\",\"bitrix.kraytdelivery_ru\",\"bitrix.kraytdelivery_by\",\"bitrix.kraytdelivery_kz\",\"bitrix.kraytdelivery_ua\",\"bitrix.kraytrepairservice_ru\",\"bitrix.kraytrepairservice_by\",\"bitrix.kraytrepairservice_kz\",\"bitrix.kraytrepairservice_ua\",\"bitrix.kraytprofipage_ru\",\"bitrix.kraytprofipage_by\",\"bitrix.kraytprofipage_kz\",\"bitrix.kraytprofipage_ua\",\"bitrix.krayttutor_ru\",\"bitrix.krayttutor_by\",\"bitrix.krayttutor_kz\",\"bitrix.krayttutor_ua\",\"bitrix.kraytartificialintelligence_ru\",\"bitrix.kraytartificialintelligence_by\",\"bitrix.kraytartificialintelligence_kz\",\"bitrix.kraytartificialintelligence_ua\",\"bitrix.kraytyoutubechannel_ru\",\"bitrix.kraytyoutubechannel_by\",\"bitrix.kraytyoutubechannel_kz\",\"bitrix.kraytyoutubechannel_ua\",\"bitrix.kraytchildrensschool_ru\",\"bitrix.kraytchildrensschool_by\",\"bitrix.kraytchildrensschool_kz\",\"bitrix.kraytchildrensschool_ua\",\"bitrix.krayttravelagency_ru\",\"bitrix.krayttravelagency_by\",\"bitrix.krayttravelagency_kz\",\"bitrix.krayttravelagency_ua\",\"bitrix.krayttranslator_ru\",\"bitrix.krayttranslator_by\",\"bitrix.krayttranslator_kz\",\"bitrix.krayttranslator_ua\",\"bitrix.kraytstylist_ru\",\"bitrix.kraytstylist_by\",\"bitrix.kraytstylist_kz\",\"bitrix.kraytstylist_ua\",\"bitrix.kraytstretchingstudio_ru\",\"bitrix.kraytstretchingstudio_by\",\"bitrix.kraytstretchingstudio_kz\",\"bitrix.kraytstretchingstudio_ua\",\"bitrix.kraytsportschool_ru\",\"bitrix.kraytsportschool_by\",\"bitrix.kraytsportschool_kz\",\"bitrix.kraytsportschool_ua\",\"bitrix.kraytsitedesigner_ru\",\"bitrix.kraytsitedesigner_by\",\"bitrix.kraytsitedesigner_kz\",\"bitrix.kraytsitedesigner_ua\",\"bitrix.kraytsport_ru\",\"bitrix.kraytsport_by\",\"bitrix.kraytsport_kz\",\"bitrix.kraytsport_ua\",\"bitrix.kraytmobileapp_ru\",\"bitrix.kraytmobileapp_by\",\"bitrix.kraytmobileapp_kz\",\"bitrix.kraytmobileapp_ua\",\"bitrix.kraytrealestate_ru\",\"bitrix.kraytrealestate_by\",\"bitrix.kraytrealestate_kz\",\"bitrix.kraytrealestate_ua\",\"bitrix.delobotnewyearsale_ru\",\"bitrix.delobotnewyearsale_by\",\"bitrix.delobotnewyearsale_kz\",\"bitrix.delobotnewyearsale_ua\",\"bitrix.delobotyoga_ru\",\"bitrix.delobotyoga_by\",\"bitrix.delobotyoga_kz\",\"bitrix.delobotyoga_ua\",\"bitrix.delobotcake_ru\",\"bitrix.delobotcake_by\",\"bitrix.delobotcake_kz\",\"bitrix.delobotcake_ua\",\"bitrix.delobotveterinarian_ru\",\"bitrix.delobotveterinarian_by\",\"bitrix.delobotveterinarian_kz\",\"bitrix.delobotveterinarian_ua\",\"bitrix.delobotpsychologist_ru\",\"bitrix.delobotpsychologist_by\",\"bitrix.delobotpsychologist_kz\",\"bitrix.delobotpsychologist_ua\",\"bitrix.delobotdecoration_ru\",\"bitrix.delobotdecoration_by\",\"bitrix.delobotdecoration_kz\",\"bitrix.delobotdecoration_ua\",\"bitrix.delobotflorist_ru\",\"bitrix.delobotflorist_by\",\"bitrix.delobotflorist_kz\",\"bitrix.delobotflorist_ua\",\"bitrix.delobotcarservice_ru\",\"bitrix.delobotcarservice_by\",\"bitrix.delobotcarservice_kz\",\"bitrix.delobotcarservice_ua\",\"bitrix.delobotcargotransportation_ru\",\"bitrix.delobotcargotransportation_by\",\"bitrix.delobotcargotransportation_kz\",\"bitrix.delobotcargotransportation_ua\",\"bitrix.delobotrealtor_ru\",\"bitrix.delobotrealtor_by\",\"bitrix.delobotrealtor_kz\",\"bitrix.delobotrealtor_ua\",\"bitrix.delobotfurnituremanufacturing_ru\",\"bitrix.delobotfurnituremanufacturing_by\",\"bitrix.delobotfurnituremanufacturing_kz\",\"bitrix.delobotfurnituremanufacturing_ua\",\"bitrix.delobotorganizationofholidays_ru\",\"bitrix.delobotorganizationofholidays_by\",\"bitrix.delobotorganizationofholidays_kz\",\"bitrix.delobotorganizationofholidays_ua\",\"bitrix.delobotconcertannounce_ru\",\"bitrix.delobotconcertannounce_by\",\"bitrix.delobotconcertannounce_kz\",\"bitrix.delobotconcertannounce_ua\",\"bitrix.delobotphotographersservice_ru\",\"bitrix.delobotphotographersservice_by\",\"bitrix.delobotphotographersservice_kz\",\"bitrix.delobotphotographersservice_ua\",\"bitrix.kraytsecurityagency_ru\",\"bitrix.kraytsecurityagency_by\",\"bitrix.kraytsecurityagency_kz\",\"bitrix.kraytsecurityagency_ua\",\"bitrix.kraytrecordingstudio_ru\",\"bitrix.kraytrecordingstudio_by\",\"bitrix.kraytrecordingstudio_kz\",\"bitrix.kraytrecordingstudio_ua\",\"bitrix.kraytrealestateagent_ru\",\"bitrix.kraytrealestateagent_by\",\"bitrix.kraytrealestateagent_kz\",\"bitrix.kraytrealestateagent_ua\",\"bitrix.delobotdecorationhouses_ru\",\"bitrix.delobotdecorationhouses_by\",\"bitrix.delobotdecorationhouses_kz\",\"bitrix.delobotdecorationhouses_ua\",\"bitrix.delobotairconditioners_ru\",\"bitrix.delobotairconditioners_by\",\"bitrix.delobotairconditioners_kz\",\"bitrix.delobotairconditioners_ua\",\"bitrix.delobotdesignworkshop_ru\",\"bitrix.delobotdesignworkshop_by\",\"bitrix.delobotdesignworkshop_kz\",\"bitrix.delobotdesignworkshop_ua\",\"bitrix.delobotcitygreeningproject_ru\",\"bitrix.delobotcitygreeningproject_by\",\"bitrix.delobotcitygreeningproject_kz\",\"bitrix.delobotcitygreeningproject_ua\",\"bitrix.delobotecoproducts_ru\",\"bitrix.delobotecoproducts_by\",\"bitrix.delobotecoproducts_kz\",\"bitrix.delobotecoproducts_ua\",\"bitrix.delobotsoundrecordingservices_ru\",\"bitrix.delobotsoundrecordingservices_by\",\"bitrix.delobotsoundrecordingservices_kz\",\"bitrix.delobotsoundrecordingservices_ua\",\"bitrix.delobotsecurityservice_ru\",\"bitrix.delobotsecurityservice_by\",\"bitrix.delobotsecurityservice_kz\",\"bitrix.delobotsecurityservice_ua\",\"bitrix.delobotsportschool_ru\",\"bitrix.delobotsportschool_by\",\"bitrix.delobotsportschool_kz\",\"bitrix.delobotsportschool_ua\",\"bitrix.delobotfamilyleisure_ru\",\"bitrix.delobotfamilyleisure_by\",\"bitrix.delobotfamilyleisure_kz\",\"bitrix.delobotfamilyleisure_ua\",\"bitrix.delobotdoctortherapist_ru\",\"bitrix.delobotdoctortherapist_by\",\"bitrix.delobotdoctortherapist_kz\",\"bitrix.delobotdoctortherapist_ua\",\"bitrix.kraytagency_ru\",\"bitrix.kraytagency_by\",\"bitrix.kraytagency_kz\",\"bitrix.kraytarchitecture_ru\",\"bitrix.kraytarchitecture_by\",\"bitrix.kraytarchitecture_kz\",\"bitrix.kraytagriculture_ru\",\"bitrix.kraytagriculture_by\",\"bitrix.kraytagriculture_kz\",\"bitrix.kraytbusiness_ru\",\"bitrix.kraytbusiness_by\",\"bitrix.kraytbusiness_kz\",\"bitrix.kraytevents_ru\",\"bitrix.kraytevents_by\",\"bitrix.kraytevents_kz\",\"bitrix.kraythalloween_ru\",\"bitrix.kraythalloween_by\",\"bitrix.kraythalloween_kz\",\"bitrix.kraytinstagramtarget_ru\",\"bitrix.kraytinstagramtarget_by\",\"bitrix.kraytinstagramtarget_kz\",\"bitrix.kraytinstagramcontacts_ru\",\"bitrix.kraytinstagramcontacts_by\",\"bitrix.kraytinstagramcontacts_kz\",\"bitrix.kraytinstagramstock_ru\",\"bitrix.kraytinstagramstock_by\",\"bitrix.kraytinstagramstock_kz\",\"bitrix.kraytpetservice_ru\",\"bitrix.kraytpetservice_by\",\"bitrix.kraytpetservice_kz\",\"bitrix.kraytsolarenergy_ru\",\"bitrix.kraytsolarenergy_by\",\"bitrix.kraytsolarenergy_kz\",\"bitrix.kraytsummersale_ru\",\"bitrix.kraytsummersale_by\",\"bitrix.kraytsummersale_kz\",\"bitrix.krayttravelblog_ru\",\"bitrix.krayttravelblog_by\",\"bitrix.krayttravelblog_kz\",\"bitrix.kraytvebinar_ru\",\"bitrix.kraytvebinar_by\",\"bitrix.kraytvebinar_kz\",\"bitrix.kraytvetclinic_ru\",\"bitrix.kraytvetclinic_by\",\"bitrix.kraytvetclinic_kz\",\"bitrix.kraytrestaurant_ru\",\"bitrix.kraytrestaurant_by\",\"bitrix.kraytrestaurant_kz\",\"bitrix.kraytrestaurant_ua\",\"bitrix.kraytweddingservices_ru\",\"bitrix.kraytweddingservices_by\",\"bitrix.kraytweddingservices_kz\",\"bitrix.kraytweddingservices_ua\",\"bitrix.kraytoptics_ru\",\"bitrix.kraytoptics_by\",\"bitrix.kraytoptics_kz\",\"bitrix.kraytoptics_ua\",\"bitrix.krayt3dprint_ru\",\"bitrix.krayt3dprint_by\",\"bitrix.krayt3dprint_kz\",\"bitrix.krayt3dprint_ua\",\"bitrix.kraytbusinesspremisesdesign_ru\",\"bitrix.kraytbusinesspremisesdesign_by\",\"bitrix.kraytbusinesspremisesdesign_kz\",\"bitrix.kraytbusinesspremisesdesign_ua\",\"bitrix.kraytcentersproject_ru\",\"bitrix.kraytcentersproject_by\",\"bitrix.kraytcentersproject_kz\",\"bitrix.kraytcentersproject_ua\",\"bitrix.kraytcitygreening_ru\",\"bitrix.kraytcitygreening_by\",\"bitrix.kraytcitygreening_kz\",\"bitrix.kraytcitygreening_ua\",\"bitrix.kraytclimatesystems_ru\",\"bitrix.kraytclimatesystems_by\",\"bitrix.kraytclimatesystems_kz\",\"bitrix.kraytclimatesystems_ua\",\"bitrix.kraytclinicmomandbaby_ru\",\"bitrix.kraytclinicmomandbaby_by\",\"bitrix.kraytclinicmomandbaby_kz\",\"bitrix.kraytclinicmomandbaby_ua\",\"bitrix.kraytdesignerclothing_ru\",\"bitrix.kraytdesignerclothing_by\",\"bitrix.kraytdesignerclothing_kz\",\"bitrix.kraytdesignerclothing_ua\",\"bitrix.kraytprivatedoctor_ru\",\"bitrix.kraytprivatedoctor_by\",\"bitrix.kraytprivatedoctor_kz\",\"bitrix.kraytprivatedoctor_ua\",\"bitrix.kraytprintinghouse_ru\",\"bitrix.kraytprintinghouse_by\",\"bitrix.kraytprintinghouse_kz\",\"bitrix.kraytprintinghouse_ua\",\"bitrix.kraytpersonalcoach_ru\",\"bitrix.kraytpersonalcoach_by\",\"bitrix.kraytpersonalcoach_kz\",\"bitrix.kraytpersonalcoach_ua\",\"bitrix.kraytperfumer_ru\",\"bitrix.kraytperfumer_by\",\"bitrix.kraytperfumer_kz\",\"bitrix.kraytperfumer_ua\",\"bitrix.kraytnewsblog_ru\",\"bitrix.kraytnewsblog_by\",\"bitrix.kraytnewsblog_kz\",\"bitrix.kraytnewsblog_ua\",\"bitrix.kraytmakeupstudio_ru\",\"bitrix.kraytmakeupstudio_by\",\"bitrix.kraytmakeupstudio_kz\",\"bitrix.kraytmakeupstudio_ua\",\"bitrix.kraytlawyer_ru\",\"bitrix.kraytlawyer_by\",\"bitrix.kraytlawyer_kz\",\"bitrix.kraytlawyer_ua\",\"bitrix.kraytlandscapedesign_ru\",\"bitrix.kraytlandscapedesign_by\",\"bitrix.kraytlandscapedesign_kz\",\"bitrix.kraytlandscapedesign_ua\",\"bitrix.kraytjewelryrepairshop_ru\",\"bitrix.kraytjewelryrepairshop_by\",\"bitrix.kraytjewelryrepairshop_kz\",\"bitrix.kraytjewelryrepairshop_ua\",\"bitrix.kraytinteriordesign_ru\",\"bitrix.kraytinteriordesign_by\",\"bitrix.kraytinteriordesign_kz\",\"bitrix.kraytinsurancecompany_ru\",\"bitrix.kraytinsurancecompany_kz\",\"bitrix.kraytinsurancecompany_ua\",\"bitrix.kraytillustrator_ru\",\"bitrix.kraytillustrator_by\",\"bitrix.kraytillustrator_kz\",\"bitrix.kraytillustrator_ua\",\"bitrix.kraytgiftsvalentineday_ru\",\"bitrix.kraytgiftsvalentineday_by\",\"bitrix.kraytgiftsvalentineday_kz\",\"bitrix.kraytgiftsvalentineday_ua\",\"bitrix.kraytfebruary23_ru\",\"bitrix.kraytfebruary23_by\",\"bitrix.kraytfebruary23_kz\",\"bitrix.kraytfebruary23_ua\",\"bitrix.kraytequipmentrepair_ru\",\"bitrix.kraytequipmentrepair_by\",\"bitrix.kraytequipmentrepair_kz\",\"bitrix.kraytequipmentrepair_ua\",\"bitrix.kraytdentistry_ru\",\"bitrix.kraytdentistry_by\",\"bitrix.kraytdentistry_kz\",\"bitrix.kraytdentistry_ua\",\"bitrix.kraytdancemarathon_ru\",\"bitrix.kraytdancemarathon_by\",\"bitrix.kraytdancemarathon_kz\",\"bitrix.kraytdancemarathon_ua\",\"bitrix.kraytcourseformothers_ru\",\"bitrix.kraytcourseformothers_by\",\"bitrix.kraytcourseformothers_kz\",\"bitrix.kraytcourseformothers_ua\",\"bitrix.kraytcosmetologist_ru\",\"bitrix.kraytcosmetologist_by\",\"bitrix.kraytcosmetologist_kz\",\"bitrix.kraytcosmetologist_ua\",\"bitrix.kraytconstructionofprivatehouses_ru\",\"bitrix.kraytconstructionofprivatehouses_by\",\"bitrix.kraytconstructionofprivatehouses_kz\",\"bitrix.kraytconstructionofprivatehouses_ua\",\"bitrix.kraytconfectionery_ru\",\"bitrix.kraytconfectionery_by\",\"bitrix.kraytconfectionery_kz\",\"bitrix.kraytconfectionery_ua\",\"bitrix.kraytcoffeehouse_ru\",\"bitrix.kraytcoffeehouse_by\",\"bitrix.kraytcoffeehouse_kz\",\"bitrix.kraytcoffeehouse_ua\",\"bitrix.kraytcleaningservice_ru\",\"bitrix.kraytcleaningservice_by\",\"bitrix.kraytcleaningservice_kz\",\"bitrix.kraytcleaningservice_ua\",\"bitrix.kraytbeautystudio_ru\",\"bitrix.kraytbeautystudio_by\",\"bitrix.kraytbeautystudio_kz\",\"bitrix.kraytbeautystudio_ua\",\"bitrix.kraytbarbershop_ru\",\"bitrix.kraytbarbershop_by\",\"bitrix.kraytartworkshop_by\",\"bitrix.kraytbarbershop_kz\",\"bitrix.kraytbarbershop_ua\",\"bitrix.kraytartworkshop_ru\",\"bitrix.kraytartworkshop_kz\",\"bitrix.kraytartworkshop_ua\",\"bitrix.kraytaprilfoolsdaygifts_ru\",\"bitrix.kraytaprilfoolsdaygifts_by\",\"bitrix.kraytaprilfoolsdaygifts_kz\",\"bitrix.kraytaprilfoolsdaygifts_ua\",\"bitrix.kraytwindowinstallation_ru\",\"bitrix.kraytwindowinstallation_by\",\"bitrix.kraytwindowinstallation_kz\",\"bitrix.kraytwindowinstallation_ua\",\"bitrix.kraytwindowdesign_ru\",\"bitrix.kraytwindowdesign_by\",\"bitrix.kraytwindowdesign_kz\",\"bitrix.kraytwindowdesign_ua\",\"bitrix.krayttelecommunications_ru\",\"bitrix.krayttelecommunications_by\",\"bitrix.krayttelecommunications_kz\",\"bitrix.krayttelecommunications_ua\",\"bitrix.kraytsportsnutritionorder_ru\",\"bitrix.kraytsportsnutritionorder_by\",\"bitrix.kraytsportsnutritionorder_kz\",\"bitrix.kraytsportsnutritionorder_ua\",\"bitrix.kraytreconstructionoffices_ru\",\"bitrix.kraytreconstructionoffices_by\",\"bitrix.kraytreconstructionoffices_kz\",\"bitrix.kraytreconstructionoffices_ua\",\"bitrix.kraytpremisestrade_ru\",\"bitrix.kraytpremisestrade_by\",\"bitrix.kraytpremisestrade_ua\",\"bitrix.kraytinsulationhouses_ru\",\"bitrix.kraytinsulationhouses_by\",\"bitrix.kraytinsulationhouses_kz\",\"bitrix.kraytinsulationhouses_ua\",\"bitrix.kraytinstallsecuritysystems_ru\",\"bitrix.kraytinstallsecuritysystems_by\",\"bitrix.kraytinstallsecuritysystems_kz\",\"bitrix.kraytinstallsecuritysystems_ua\",\"bitrix.kraytinstallbathrooms_ru\",\"bitrix.kraytinstallbathrooms_by\",\"bitrix.kraytinstallbathrooms_kz\",\"bitrix.kraytinstallbathrooms_ua\",\"bitrix.kraythousedesign_ru\",\"bitrix.kraythousedesign_by\",\"bitrix.kraythousedesign_kz\",\"bitrix.kraythousedesign_ua\",\"bitrix.kraythospitalforfamily_ru\",\"bitrix.kraythospitalforfamily_by\",\"bitrix.kraythospitalforfamily_kz\",\"bitrix.kraythospitalforfamily_ua\",\"bitrix.kraythomedecoration_ru\",\"bitrix.kraythomedecoration_by\",\"bitrix.kraythomedecoration_kz\",\"bitrix.kraythomedecoration_ua\",\"bitrix.kraytfurniturettransformer_ru\",\"bitrix.kraytfurniturettransformer_by\",\"bitrix.kraytfurniturettransformer_kz\",\"bitrix.kraytfurniturettransformer_ua\",\"bitrix.kraytfloristics_ru\",\"bitrix.kraytfloristics_by\",\"bitrix.kraytfloristics_kz\",\"bitrix.kraytfloristics_ua\",\"bitrix.kraytfestiveevents_ru\",\"bitrix.kraytfestiveevents_by\",\"bitrix.kraytfestiveevents_kz\",\"bitrix.kraytfestiveevents_ua\",\"bitrix.kraytecogreen_ru\",\"bitrix.kraytecogreen_by\",\"bitrix.kraytecogreen_kz\",\"bitrix.kraytecogreen_ua\",\"bitrix.kraytdoorinstallation_ru\",\"bitrix.kraytdoorinstallation_by\",\"bitrix.kraytdoorinstallation_kz\",\"bitrix.kraytdoorinstallation_ua\",\"bitrix.kraytdoordesign_ru\",\"bitrix.kraytdoordesign_by\",\"bitrix.kraytdoordesign_kz\",\"bitrix.kraytdoordesign_ua\",\"bitrix.kraytdesigningpeopledisabilities_ru\",\"bitrix.kraytdesigningpeopledisabilities_by\",\"bitrix.kraytdesigningpeopledisabilities_kz\",\"bitrix.kraytdesigningpeopledisabilities_ua\",\"bitrix.delobotkindergarten_ru\",\"bitrix.kraytvideostudio_ru\",\"bitrix.kraytlegalservices_ru\",\"bitrix.kraytaccountingservices_ru\",\"bitrix.kraytbookannouncement_ru\",\"bitrix.kraytcharity_ru\",\"bitrix.kraytspa_ru\",\"bitrix.kraythandmadecosmetics_ru\",\"bitrix.delobotmusic_ru\",\"bitrix.kraythotelforanimals_ru\",\"bitrix.kraytcityguide_ru\",\"bitrix.delobotfoodblog_ru\",\"bitrix.delobotgamedeveloper_ru\",\"bitrix.delobotrenovationoffices_ru\",\"bitrix.delobotcourses_ru\",\"bitrix.delobotcityb__beautification_ru\",\"bitrix.delobotaidfund_ru\",\"bitrix.delobotnewsblog_ru\",\"bitrix.delobottransportservices_ru\",\"bitrix.delobotguide_ru\",\"bitrix.delobotnnturalcosmetic_ru\",\"bitrix.delobotboutiqueforsale_ru\",\"bitrix.delobotorganizationweddings_ru\",\"bitrix.delobotbeautyandrecreationcenter_ru\",\"bitrix.delobotwriter_ru\",\"bitrix.kraytotel\",\"bitrix.kraytigrovoyklub\",\"bitrix.kraytbazaotdykha\",\"bitrix.kraytkurspotiktoku\",\"bitrix.kraytkadrovoeagenstvo\",\"bitrix.kraytportfoliomodeli\",\"bitrix.kraytminecraftserver\",\"bitrix.kraytigrovayakompaniya\",\"bitrix.delobotuslugivideoproizvodstva\",\"bitrix.delobotportfolioaktera\",\"bitrix.delobotpub\",\"bitrix.delobotminihotel\",\"bitrix.delobotcamping\",\"bitrix.delobotcafe\",\"bitrix.delobotizgotovlenieduxov\",\"bitrix.delobotbuhgalterskoeobslujivanie\",\"bitrix.delobotarendanedvizimosti\",\"bitrix.delobotalternativnayaenergetika\",\"bitrix.delobotagentstvoponaimy\",\"bitrix.kraytpodarkikjenskomydny\",\"bitrix.kraytinstagramcontacts_ru1\",\"bitrix.kraytinstagramstock_ru1\",\"bitrix.kraytinstagramtarget_ru1\",\"bitrix.kraytkhimchistka\",\"bitrix.krayt_detskaya_odezhda_na_zakaz\",\"bitrix.krayt_retsepty_blyud\",\"bitrix.krayt_detskaya_mebel\",\"bitrix.krayt_biblioteka\",\"bitrix.krayt_pitomnik_rasteniy\",\"bitrix.delobot_lawyer\",\"bitrix.delobot_oformlenie_dverey\",\"bitrix.delobot_montaj_dverey\",\"bitrix.delobot_manicure_and_pedicure\",\"bitrix.delobot_printing_services\",\"bitrix.delobot_plants\",\"bitrix.delobot_nutritionist\",\"bitrix.delobot_designer_tableware\",\"bitrix.delobot_montaj_okon\",\"bitrix.delobot_oformlenie_okon\",\"bitrix.krayt_zhurnalist\",\"bitrix.krayt_tato_salon\",\"bitrix.krayt_massajist\",\"bitrix.krayt_consulting\",\"bitrix.krayt_elektromontazh\",\"bitrix.krayt_rezyume_spetsialista\",\"bitrix.kraytportfoliophotographer\",\"bitrix.kraytbeautystudio_en\",\"bitrix.kraytautomechanic_en\",\"bitrix.kraytequipmentrepair_en\",\"bitrix.delobot_furniture_for_children\",\"bitrix.delobot_architectural_projects\",\"bitrix.delobot_scientists_page\",\"bitrix.delobot_tatoo_studio\",\"bitrix.delobot_journalist_resume\",\"bitrix.delobot_leather_goods\",\"bitrix.delobot_dance_marathon\",\"bitrix.krayt_art_gallery\",\"bitrix.krayt_leather_products\",\"bitrix.krayt_scientific_researcher\",\"bitrix.krayt_bureau_of_architecture\",\"bitrix.krayt_jewelry_designer\",\"bitrix.krayt_food_photographer\",\"bitrix.krayt_acting_studio\",\"bitrix.krayt_farm\",\"bitrix.krayt_fashion_blog\",\"bitrix.krayt_birthday_cakes\",\"bitrix.krayt_plussize_fashion\",\"bitrix.krayt_diving\",\"bitrix.krayt_it_services\",\"bitrix.krayt_beauty_blog\",\"bitrix.krayt_aquarium\",\"bitrix.krayt_sport_blog\",\"bitrix.delobot_online_library\",\"bitrix.delobot_diving_center\",\"bitrix.delobot_designer_jewelry\",\"bitrix.delobot_nail_art_course\",\"bitrix.delobot_art_galery\",\"bitrix.delobot_fashion_for_everyone\",\"bitrix.delobot_handmade_chocolate\",\"bitrix.krayt_chocolate_shop\",\"bitrix.krayt_advertising_agency\",\"bitrix.krayt_asian_food\",\"bitrix.krayt_avtorskiy_master_klass\",\"bitrix.krayt_utilizatsiya_otkhodov\",\"bitrix.krayt_italyanskaya_kukhnya\",\"bitrix.krayt_kurs_po_nogtevomu_servisu\",\"bitrix.krayt_begovoy_klub\",\"bitrix.krayt_gornyy_turizm\",\"bitrix.krayt_biznes_prostranstvo\",\"bitrix.krayt_shkola_iskusstv\",\"bitrix.krayt_onlayn_intensiv_inostrannogo_yazyka\"]', NULL, NULL),
('rest', 'entity_iblock_type', 'rest_entity', NULL, NULL),
('rest', 'server_path', '/rest', NULL, NULL),
('search', 'dbnode_id', 'N', NULL, NULL),
('search', 'dbnode_status', 'ok', NULL, NULL),
('search', 'suggest_save_days', '250', NULL, NULL),
('search', 'use_social_rating', 'Y', NULL, NULL),
('search', 'use_tf_cache', 'Y', NULL, NULL),
('search', 'use_word_distance', 'Y', NULL, NULL),
('search', 'version', 'v2.0', NULL, NULL),
('socialnetwork', 'allow_tooltip', 'N', NULL, NULL),
('socialservices', 'allow_encrypted_tokens', '1', NULL, NULL),
('socialservices', 'auth_services', 'a:12:{s:9:\"VKontakte\";s:1:\"N\";s:8:\"MyMailRu\";s:1:\"N\";s:7:\"Twitter\";s:1:\"N\";s:8:\"Facebook\";s:1:\"N\";s:11:\"Livejournal\";s:1:\"Y\";s:12:\"YandexOpenID\";s:1:\"Y\";s:7:\"Rambler\";s:1:\"Y\";s:12:\"MailRuOpenID\";s:1:\"Y\";s:12:\"Liveinternet\";s:1:\"Y\";s:7:\"Blogger\";s:1:\"Y\";s:6:\"OpenID\";s:1:\"Y\";s:6:\"LiveID\";s:1:\"N\";}', NULL, NULL),
('socialservices', 'bitrix24net_domain', 'http://bitrix', NULL, NULL),
('socialservices', 'bitrix24net_id', 'ext.62c45d444a3a36.05460198', NULL, NULL),
('socialservices', 'bitrix24net_secret', 'iXiqvHAYF9OzxMCMvBhFNbC2RoEFekyjrmCcpO1g1LzSs6Nea5', NULL, NULL),
('socialservices', 'google_api_key', 'AIzaSyA7puwZwGDJgOjcAWsFsY7hQcrioC13A18', NULL, NULL),
('socialservices', 'google_appid', '798910771106.apps.googleusercontent.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_option_site`
--

CREATE TABLE `b_option_site` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_option_site`
--

INSERT INTO `b_option_site` (`MODULE_ID`, `NAME`, `SITE_ID`, `VALUE`) VALUES
('fileman', 'menutypes', 's1', 'a:4:{s:4:\\\"left\\\";s:40:\\\"Левое меню (подуровни)\\\";s:3:\\\"top\\\";s:23:\\\"Верхнее меню\\\";s:6:\\\"bottom\\\";s:21:\\\"Нижнее меню\\\";s:9:\\\"leftfirst\\\";s:49:\\\"Левое меню (первый уровень)\\\";}'),
('fileman', 'num_menu_param', 's1', '2'),
('fileman', 'propstypes', 's1', 'a:4:{s:11:\"description\";s:33:\"Описание страницы\";s:8:\"keywords\";s:27:\"Ключевые слова\";s:5:\"title\";s:44:\"Заголовок окна браузера\";s:14:\"keywords_inner\";s:35:\"Продвигаемые слова\";}'),
('main', 'wizard_corp_services_theme_id', 's1', 'gray'),
('main', 'wizard_site_logo', 's1', '0'),
('main', 'wizard_solution', 's1', 'corp_services'),
('main', 'wizard_template_id', 's1', 'corp_services');

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_cache`
--

CREATE TABLE `b_perf_cache` (
  `ID` int NOT NULL,
  `HIT_ID` int DEFAULT NULL,
  `COMPONENT_ID` int DEFAULT NULL,
  `NN` int DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `BASE_DIR` text COLLATE utf8_unicode_ci,
  `INIT_DIR` text COLLATE utf8_unicode_ci,
  `FILE_NAME` text COLLATE utf8_unicode_ci,
  `FILE_PATH` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_cluster`
--

CREATE TABLE `b_perf_cluster` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `THREADS` int DEFAULT NULL,
  `HITS` int DEFAULT NULL,
  `ERRORS` int DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_component`
--

CREATE TABLE `b_perf_component` (
  `ID` int NOT NULL,
  `HIT_ID` int DEFAULT NULL,
  `NN` int DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int DEFAULT NULL,
  `CACHE_COUNT_R` int DEFAULT NULL,
  `CACHE_COUNT_W` int DEFAULT NULL,
  `CACHE_COUNT_C` int DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_error`
--

CREATE TABLE `b_perf_error` (
  `ID` int NOT NULL,
  `HIT_ID` int DEFAULT NULL,
  `ERRNO` int DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_history`
--

CREATE TABLE `b_perf_history` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_hit`
--

CREATE TABLE `b_perf_hit` (
  `ID` int NOT NULL,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int DEFAULT NULL,
  `CACHE_COUNT_R` int DEFAULT NULL,
  `CACHE_COUNT_W` int DEFAULT NULL,
  `CACHE_COUNT_C` int DEFAULT NULL,
  `QUERIES` int DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_ban`
--

CREATE TABLE `b_perf_index_ban` (
  `ID` int NOT NULL,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_complete`
--

CREATE TABLE `b_perf_index_complete` (
  `ID` int NOT NULL,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_suggest`
--

CREATE TABLE `b_perf_index_suggest` (
  `ID` int NOT NULL,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_suggest_sql`
--

CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int NOT NULL,
  `SQL_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_sql`
--

CREATE TABLE `b_perf_sql` (
  `ID` int NOT NULL,
  `HIT_ID` int DEFAULT NULL,
  `COMPONENT_ID` int DEFAULT NULL,
  `NN` int DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_sql_backtrace`
--

CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int NOT NULL,
  `NN` int NOT NULL,
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_tab_column_stat`
--

CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int NOT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_tab_stat`
--

CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_test`
--

CREATE TABLE `b_perf_test` (
  `ID` int NOT NULL,
  `REFERENCE_ID` int DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating`
--

CREATE TABLE `b_rating` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating`
--

INSERT INTO `b_rating` (`ID`, `ACTIVE`, `NAME`, `ENTITY_ID`, `CALCULATION_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_CALCULATED`, `POSITION`, `AUTHORITY`, `CALCULATED`, `CONFIGS`) VALUES
(1, 'N', 'Рейтинг', 'USER', 'SUM', '2022-07-05 22:41:22', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),
(2, 'N', 'Авторитет', 'USER', 'SUM', '2022-07-05 22:41:22', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component`
--

CREATE TABLE `b_rating_component` (
  `ID` int NOT NULL,
  `RATING_ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component_results`
--

CREATE TABLE `b_rating_component_results` (
  `ID` int NOT NULL,
  `RATING_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_prepare`
--

CREATE TABLE `b_rating_prepare` (
  `ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_results`
--

CREATE TABLE `b_rating_results` (
  `ID` int NOT NULL,
  `RATING_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int DEFAULT '0',
  `PREVIOUS_POSITION` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule`
--

CREATE TABLE `b_rating_rule` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating_rule`
--

INSERT INTO `b_rating_rule` (`ID`, `ACTIVE`, `NAME`, `ENTITY_TYPE_ID`, `CONDITION_NAME`, `CONDITION_MODULE`, `CONDITION_CLASS`, `CONDITION_METHOD`, `CONDITION_CONFIG`, `ACTION_NAME`, `ACTION_CONFIG`, `ACTIVATE`, `ACTIVATE_CLASS`, `ACTIVATE_METHOD`, `DEACTIVATE`, `DEACTIVATE_CLASS`, `DEACTIVATE_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_APPLIED`) VALUES
(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2022-07-05 22:41:22', '2022-07-05 22:41:22', NULL),
(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2022-07-05 22:41:22', '2022-07-05 22:41:22', NULL),
(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2022-07-05 22:41:23', '2022-07-05 22:41:23', NULL),
(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2022-07-05 22:41:23', '2022-07-05 22:41:23', NULL),
(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.1;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.1;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2022-07-05 22:41:23', '2022-07-05 22:41:23', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule_vetting`
--

CREATE TABLE `b_rating_rule_vetting` (
  `ID` int NOT NULL,
  `RULE_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_user`
--

CREATE TABLE `b_rating_user` (
  `ID` int NOT NULL,
  `RATING_ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating_user`
--

INSERT INTO `b_rating_user` (`ID`, `RATING_ID`, `ENTITY_ID`, `BONUS`, `VOTE_WEIGHT`, `VOTE_COUNT`) VALUES
(1, 2, 1, '3.0000', '30.0000', 13);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote`
--

CREATE TABLE `b_rating_vote` (
  `ID` int NOT NULL,
  `RATING_VOTING_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `OWNER_ID` int NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote_group`
--

CREATE TABLE `b_rating_vote_group` (
  `ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating_vote_group`
--

INSERT INTO `b_rating_vote_group` (`ID`, `GROUP_ID`, `TYPE`) VALUES
(5, 1, 'A'),
(1, 1, 'R'),
(3, 1, 'R'),
(2, 3, 'R'),
(4, 3, 'R'),
(6, 4, 'A');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting`
--

CREATE TABLE `b_rating_voting` (
  `ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `OWNER_ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int NOT NULL,
  `TOTAL_POSITIVE_VOTES` int NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting_prepare`
--

CREATE TABLE `b_rating_voting_prepare` (
  `ID` int NOT NULL,
  `RATING_VOTING_ID` int NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int NOT NULL,
  `TOTAL_POSITIVE_VOTES` int NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting_reaction`
--

CREATE TABLE `b_rating_voting_reaction` (
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TOTAL_VOTES` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_weight`
--

CREATE TABLE `b_rating_weight` (
  `ID` int NOT NULL,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating_weight`
--

INSERT INTO `b_rating_weight` (`ID`, `RATING_FROM`, `RATING_TO`, `WEIGHT`, `COUNT`) VALUES
(1, '-1000000.0000', '1000000.0000', '1.0000', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_ap`
--

CREATE TABLE `b_rest_ap` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_app`
--

CREATE TABLE `b_rest_app` (
  `ID` int NOT NULL,
  `CLIENT_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INSTALLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `URL_DEMO` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_INSTALL` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1',
  `SCOPE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'F',
  `DATE_FINISH` date DEFAULT NULL,
  `IS_TRIALED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SHARED_KEY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `MOBILE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `USER_INSTALL` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_app_lang`
--

CREATE TABLE `b_rest_app_lang` (
  `ID` int NOT NULL,
  `APP_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_app_log`
--

CREATE TABLE `b_rest_app_log` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `APP_ID` int NOT NULL,
  `ACTION_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int NOT NULL,
  `USER_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_ap_permission`
--

CREATE TABLE `b_rest_ap_permission` (
  `ID` int NOT NULL,
  `PASSWORD_ID` int NOT NULL,
  `PERM` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_configuration_storage`
--

CREATE TABLE `b_rest_configuration_storage` (
  `ID` int NOT NULL,
  `CREATE_TIME` timestamp NULL DEFAULT NULL,
  `CONTEXT` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_event`
--

CREATE TABLE `b_rest_event` (
  `ID` int NOT NULL,
  `APP_ID` int DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `INTEGRATION_ID` int DEFAULT NULL,
  `OPTIONS` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_event_offline`
--

CREATE TABLE `b_rest_event_offline` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MESSAGE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `APP_ID` int NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_DATA` text COLLATE utf8_unicode_ci,
  `EVENT_ADDITIONAL` text COLLATE utf8_unicode_ci,
  `PROCESS_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ERROR` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_integration`
--

CREATE TABLE `b_rest_integration` (
  `ID` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `ELEMENT_CODE` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD_ID` int DEFAULT NULL,
  `APP_ID` int DEFAULT NULL,
  `SCOPE` text COLLATE utf8_unicode_ci,
  `QUERY` text COLLATE utf8_unicode_ci,
  `OUTGOING_EVENTS` text COLLATE utf8_unicode_ci,
  `OUTGOING_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OUTGOING_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_LIST` text COLLATE utf8_unicode_ci,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_ONLY_API` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BOT_ID` int DEFAULT NULL,
  `BOT_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_log`
--

CREATE TABLE `b_rest_log` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CLIENT_ID` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD_ID` int DEFAULT NULL,
  `SCOPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_AUTH` text COLLATE utf8_unicode_ci,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_STATUS` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_DATA` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_owner_entity`
--

CREATE TABLE `b_rest_owner_entity` (
  `ID` int NOT NULL,
  `OWNER_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER` int NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_placement`
--

CREATE TABLE `b_rest_placement` (
  `ID` int NOT NULL,
  `APP_ID` int DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ICON_ID` int DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `GROUP_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `ADDITIONAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OPTIONS` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_placement_lang`
--

CREATE TABLE `b_rest_placement_lang` (
  `ID` int NOT NULL,
  `PLACEMENT_ID` int NOT NULL,
  `LANGUAGE_ID` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_stat`
--

CREATE TABLE `b_rest_stat` (
  `STAT_DATE` date NOT NULL,
  `APP_ID` int NOT NULL,
  `METHOD_ID` int NOT NULL,
  `HOUR_0` int NOT NULL DEFAULT '0',
  `HOUR_1` int NOT NULL DEFAULT '0',
  `HOUR_2` int NOT NULL DEFAULT '0',
  `HOUR_3` int NOT NULL DEFAULT '0',
  `HOUR_4` int NOT NULL DEFAULT '0',
  `HOUR_5` int NOT NULL DEFAULT '0',
  `HOUR_6` int NOT NULL DEFAULT '0',
  `HOUR_7` int NOT NULL DEFAULT '0',
  `HOUR_8` int NOT NULL DEFAULT '0',
  `HOUR_9` int NOT NULL DEFAULT '0',
  `HOUR_10` int NOT NULL DEFAULT '0',
  `HOUR_11` int NOT NULL DEFAULT '0',
  `HOUR_12` int NOT NULL DEFAULT '0',
  `HOUR_13` int NOT NULL DEFAULT '0',
  `HOUR_14` int NOT NULL DEFAULT '0',
  `HOUR_15` int NOT NULL DEFAULT '0',
  `HOUR_16` int NOT NULL DEFAULT '0',
  `HOUR_17` int NOT NULL DEFAULT '0',
  `HOUR_18` int NOT NULL DEFAULT '0',
  `HOUR_19` int NOT NULL DEFAULT '0',
  `HOUR_20` int NOT NULL DEFAULT '0',
  `HOUR_21` int NOT NULL DEFAULT '0',
  `HOUR_22` int NOT NULL DEFAULT '0',
  `HOUR_23` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_stat_app`
--

CREATE TABLE `b_rest_stat_app` (
  `APP_ID` int NOT NULL,
  `APP_CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_stat_method`
--

CREATE TABLE `b_rest_stat_method` (
  `ID` int NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `METHOD_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_usage_entity`
--

CREATE TABLE `b_rest_usage_entity` (
  `ID` int NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ENTITY_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rest_usage_stat`
--

CREATE TABLE `b_rest_usage_stat` (
  `STAT_DATE` date NOT NULL,
  `ENTITY_ID` int NOT NULL DEFAULT '0',
  `IS_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HOUR_0` int NOT NULL DEFAULT '0',
  `HOUR_1` int NOT NULL DEFAULT '0',
  `HOUR_2` int NOT NULL DEFAULT '0',
  `HOUR_3` int NOT NULL DEFAULT '0',
  `HOUR_4` int NOT NULL DEFAULT '0',
  `HOUR_5` int NOT NULL DEFAULT '0',
  `HOUR_6` int NOT NULL DEFAULT '0',
  `HOUR_7` int NOT NULL DEFAULT '0',
  `HOUR_8` int NOT NULL DEFAULT '0',
  `HOUR_9` int NOT NULL DEFAULT '0',
  `HOUR_10` int NOT NULL DEFAULT '0',
  `HOUR_11` int NOT NULL DEFAULT '0',
  `HOUR_12` int NOT NULL DEFAULT '0',
  `HOUR_13` int NOT NULL DEFAULT '0',
  `HOUR_14` int NOT NULL DEFAULT '0',
  `HOUR_15` int NOT NULL DEFAULT '0',
  `HOUR_16` int NOT NULL DEFAULT '0',
  `HOUR_17` int NOT NULL DEFAULT '0',
  `HOUR_18` int NOT NULL DEFAULT '0',
  `HOUR_19` int NOT NULL DEFAULT '0',
  `HOUR_20` int NOT NULL DEFAULT '0',
  `HOUR_21` int NOT NULL DEFAULT '0',
  `HOUR_22` int NOT NULL DEFAULT '0',
  `HOUR_23` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content`
--

CREATE TABLE `b_search_content` (
  `ID` int NOT NULL,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int NOT NULL DEFAULT '0',
  `USER_ID` int DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` longtext COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content`
--

INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
(1, '2022-07-05 18:49:58', 'main', 's1|/about/history.php', 0, NULL, NULL, NULL, '/about/history.php', 'История компании', 'ЗАО «Банк» основан 18 января 1993 года.\rДо 1996 года Банк развивался как небольшой коммерческий банк.\r1996 год. Открывается первый дополнительный офис по работе с населением. Банк приступает к активному развитию филиальной сети. \r1997 год. Банк начинает выпуск и обслуживание пластиковых карт, использование которых позволяет вынести финансовый сервис за пределы привычных операционных залов банка и филиалов на места фактического востребования услуг.\rЯнварь 1998 года. Банк получает лицензию профессионального участника рынка ценных бумаг. По результатам анализа бухгалтерской и финансовой отчётности Банк относится по критериям ЦБ РФ к первой категории – финансово стабильные банки.\r1999 год. Банк, успешно преодолев кризис, продолжает активное развитие филиальной сети. В этом же году Банк приступает к реализации программы ипотечного кредитования муниципальных служащих.\r2004год. Банк приступает к выпуску карт платёжной системы Visa International. В течение 2004 года банк представил клиентам ряд высокотехнологичных продуктов. В области кредитования физических лиц – систему Интернет-кредитования на приобретение автомобилей, обучение в вузе, отдых и туризм. \r2006 год. Десять лет с начала работы Банка в области предоставления финансовых услуг населению. За это время в банке взяли кредит более 50 000 человек, более 200 000 человек доверили свои деньги, сделав вклады, более 50 000 человек стали держателями пластиковых карт Банка.\r2007 год. Банк получает Главную Всероссийскую Премию «Российский Национальный Олимп» в числе лучших предприятий малого и среднего бизнеса России.\r2008 год. По результатам Международного конкурса \"Золотая медаль \"Европейское качество\", проведенного Международной академией Качества и Маркетинга\" и Ассоциацией качественной продукции Банк становится Лауреатом международной награды \"Золотая Медаль \"Европейское качество\".\r2009 год. Переход на новую автоматизированную банковскую систему iBank System Российской компании «МКТ».\r2010 год. По данным финансовой отчётности на 1 января 2010 года Банк завершает 2009 год с положительными результатами. Размер прибыли за 2009 год составляет 95 149 тыс. рублей. Положительную динамику роста показывают почти все финансовые показатели.Уставный капитал банка увеличивается на 20 % и на данный момент составляет 415 240 тысяч рублей.Размер собственного капитала банка составляет 1 535 522 тысячи рублей, что на 31 % больше чем в прошлом году. \rЧасть дохода за 2009 год Банк направляет на формирование резерва на возможные потери по ссудам, ссудной и приравненной к ней задолженности. Объём такого резерва по состоянию на 1 февраля 2010 года составляет порядка 650 млн. рублей.\rСвое дальнейшее развитие Банк связывает с повышением качества и наращиванием объемов услуг, собственного капитала, внедрением новейших технологий, совершенствованием форм обслуживания клиентов и развитием новых перспективных направлений в работе.', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(2, '2022-07-05 18:49:58', 'main', 's1|/about/index.php', 0, NULL, NULL, NULL, '/about/index.php', 'Информация о компании', '&laquo;Банк&raquo;\r&mdash; один из крупнейших участников российского рынка банковских услуг. Банк работает в России с 1997 года и на сегодняшний день осуществляет все основные виды банковских операций, представленных на рынке финансовых услуг. Сеть банка формируют 490 филиалов и дополнительных офисов в 70 регионах страны. Мы предлагаем клиентам основные банковские продукты, принятые в международной финансовой практике.\nЗАО &laquo;Банк&raquo; занимает 7-е место по размеру активов по результатам 2009 года. Банк находится на 5-м месте в России по объему частных депозитов и на 4-м месте по объему кредитов для частных лиц по результатам 2009 года. 									\r&laquo;Банк&raquo;\rявляется универсальным банком и оказывает полный спектр услуг, включая обслуживание частных и корпоративных клиентов, инвестиционный банковский бизнес, торговое финансирование и управление активами.\rВ числе предоставляемых услуг: 									\nвыпуск банковских карт;\rипотечное и потребительское кредитование;\rавтокредитование;\rуслуги дистанционного управления счетами;\rкредитные карты с льготным периодом;\rсрочные вклады, аренда сейфовых ячеек;\rденежные переводы.\rЧасть услуг доступна нашим клиентам в круглосуточном режиме, для чего используются современные телекоммуникационные технологии.\r&laquo;Банк&raquo;\rявляется одним из самых надежных банков нашей страны. Основными ценностями, которыми мы руководствуемся в своей деятельности являются \rсправедливость\r,\rпрозрачность\r, \rуважение\r, \rсотрудничество\r,\rсвобода\rи\rдоверие\r. Одной из главных задач \r&laquo;Банк&raquo;\rвидит поддержание и совершенствование развитой финансовой системы России.\rВ качестве одного из приоритетных направлений культурно-просветительской деятельности \r&laquo;Банк&raquo;\rосуществляет поддержку национального. При нашем содействии Россию посетили многие всемирно известные зарубежные музыканты, в регионах России ежегодно проходят театральные фестивали, концерты и многочисленные выставки.', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(3, '2022-07-05 18:49:58', 'main', 's1|/about/management/index.php', 0, NULL, NULL, NULL, '/about/management/index.php', 'Руководство', 'Коллегиальный исполнительный орган правления Банка\rДолжность\rОбразование\rПлешков Юрий Григорьевич \rНачальник экономического управления \rВ 1996 году окончил Иркутскую государственную экономическую академию по специальности &laquo;Финансы и кредит&raquo; \rСмирнов Вячеслав Евгеньевич \rЗаместитель Председателя Правления \rВ 1991 году окончил Университет Дружбы народов (Москва). В 2000 году получил степень MBA в бизнес-школе INSEAD. \rКорнева Ирина Станиславовна \rЗаместитель Председателя Правления \rВ 1997 году окончила Московскую государственную юридическую академию по специальности «Банковское дело» \rИгнатьев Вадим Михайлович \rПервый заместитель Председателя Правления \rВ 1988 году окончил Иркутскую государственную экономическую академию по специальности «Экономика и управление производством» \rВолошин Станислав Семенович \rПредседатель Правления \rВ 1986 году окончил Свердловский юридический институт по специальности «Правоведение» и Московский индустриальный институт по специальности «Экономика и управление на предприятии» \rСписок членов Совета директоров банка\rДолжность\rОбразование\rМихайлова Татьяна Васильевна \rДиректор по финансам \rВ 1996 году окончила Российскую экономическую академию им. Г.В. Плеханова по специальности «банковское дело». \rЛях Евгений Викторович \rДиректор по обеспечению банковской деятельности \rВ 1993 году окончил Российскую экономическую академию им. Плеханова, по специальности МВА «стратегический менеджмент». \rКондрусев Роман Александрович \rДиректор казначейства \rВ 1993 году окончил Кемеровский государственный университет по специальности «Правоведение» \rХрамов Анатолий Фёдорович \rДиректор по работе с персоналом \rВ 1996 году окончил Государственный университет управления по специализации «Управление персоналом». В 2002 прошел программу повышения квалификации «Современные технологии управления человеческими ресурсами» \rЖуравлева Ольга Николаевна \rГлавный бухгалтер \rВ 1985 году окончила Санкт-петербургский институт народного хозяйства по специальности «Бухгалтерский учет» \rКалинин Андрей Геннадьевич \rДиректор департамента корпоративного бизнеса \rВ 1998 году закончил Московский государственный институт международных отношений, в 2002 &ndash; Школу Менеджмента Университета Антверпена (UAMS) по специальности MBA.', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(4, '2022-07-05 18:49:58', 'main', 's1|/about/mission.php', 0, NULL, NULL, NULL, '/about/mission.php', 'Миссия', 'Миссия Банка - предоставлять каждому клиенту максимально возможный набор банковских услуг высокого качества и надежности,следуя\rмировым стандартам и принципам корпоративной этики. Наш Банк - это современный высокотехнологичный банк,сочетающий\rв себе новейшие технологии оказания услуг и лучшие традиции банковского сообщества и российского предпринимательства.\rИндивидуальный подход\rНаша цель — предоставление каждому клиенту полного комплекса современных банковских продуктов и услуг с использованием последних достижений и инноваций в сфере финансовых технологий. Индивидуальный подход к ситуации и проблематике каждого клиента и философия партнерства - основы взаимодействия с нашими клиентами.\rУниверсальность\rБанк обеспечивает своим клиентам — частным лицам, крупнейшим отраслевым компаниям, предприятиям среднего и малого бизнеса, государственным структурам — широкий спектр услуг. Чтобы максимально полно обеспечить потребности клиентов, мы активно развиваем филиальную сеть в России и за ее пределами. Это позволяет нашим клиентам всегда и везде получать современные банковские услуги на уровне мировых стандартов.\rБанк — надежный партнер при реализации крупных социально-экономических проектов России и является одним из лидеров на рынке инвестиционного обеспечения региональных программ.\rПартнерство и помощь в развитии бизнеса\rВ своей деятельности мы опираемся на высочайшие стандарты предоставления финансовых услуг и тщательный анализ рынка.\rПредлагая адресные решения и соблюдая конфиденциальность взаимоотношений с партнерами, Банк проявляет гибкий подход к запросам клиентов, как розничных, так и корпоративных. Внедряя передовые технологии и инновационные решения, Банк гарантирует клиентам высокое качество обслуживания и стабильный доход.\rМы честны и открыты по отношению ко всем нашим партнерам и стремимся быть примером надежности и эффективности для всех, кто с нами сотрудничает.\rСоциальная ответственность\rБанк ориентирован на поддержку социально-экономического развития клиентов. Мы вносим вклад в повышение благосостояния общества, предоставляя нашим клиентам первоклассные экономические возможности, а также реализуя экологические программы, образовательные и культурные проекты. Банк оказывает благотворительную помощь социально незащищенным слоям общества, учреждениям медицины, образования и культуры, спортивным и религиозным организациям в регионах России. \rНаш Банк — это банк, работающий на благо общества, cтраны и каждого ее жителя.', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(5, '2022-07-06 17:23:40', 'main', 's1|/about/vacancies.php', 0, NULL, NULL, NULL, '/about/vacancies.php', 'Вакансии', '', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(6, '2022-07-05 18:49:58', 'main', 's1|/auth.php', 0, NULL, NULL, NULL, '/auth.php', 'Авторизация', 'Вы зарегистрированы и успешно авторизовались.\rИспользуйте административную панель в верхней части экрана для быстрого доступа к функциям управления структурой и информационным наполнением сайта. Набор кнопок верхней панели отличается для различных разделов сайта. Так отдельные наборы действий предусмотрены для управления статическим содержимым страниц, динамическими публикациями (новостями, каталогом, фотогалереей) и т.п.\rВернуться на главную страницу', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(7, '2022-07-05 18:49:58', 'main', 's1|/contacts/feedback.php', 0, NULL, NULL, NULL, '/contacts/feedback.php', 'Задать вопрос', '', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(8, '2022-07-05 18:49:58', 'main', 's1|/contacts/index.php', 0, NULL, NULL, NULL, '/contacts/index.php', 'Контактная информация', 'Обратитесь к нашим специалистам и получите профессиональную консультацию по услугам нашего банка.\rВы можете обратиться к нам по телефону, по электронной почте или договориться о встрече в нашем офисе. Будем рады помочь вам и ответить на все ваши вопросы. \rТелефоны\rТелефон/факс: \n(495) 212-85-06\rТелефоны: \n(495) 212-85-07\r(495) 212-85-08\rНаш офис в Москве', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(9, '2022-07-05 18:49:58', 'main', 's1|/contacts/requisites.php', 0, NULL, NULL, NULL, '/contacts/requisites.php', 'Наши реквизиты', 'Наименование Банка\rЗакрытое акционерное общество \"Название банка\"\rСокращенное название\rЗАО \"Название банка\"\rПолное наименование на английском языке\r\"The Name of Bank\"\rОсновной государственный регистрационный номер\r152073950937987\rTelex\r911156 IRS RU\rS.W.I.F.T.\rIISARUMM\rSPRINT\rRU.BANK/BITEX\rЮридический адрес: \r175089, Россия, г. Москва, ул. Большая Дмитровка, д. 15, стр. 1\rКор/счет: \r30102810000000000569\rИНН:\r7860249880\rБИК:\r044591488\rОКПО:\r11806935\rОКОНХ:\r98122\rКПП:\r775021017\rПрочая информация\rБанковский идентификационный код: 0575249000\rПочтовый адрес: 115035, Россия, г. Москва, ул. Балчуг, д. 2\rТелефон: (495) 960-10-12\rФакс: (495) 240-38-12\rE-mail: \rRusBk@mail.rusbank.ru', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(10, '2022-07-05 18:49:58', 'main', 's1|/news/index.php', 0, NULL, NULL, NULL, '/news/index.php', 'Новости компании', '', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(11, '2022-07-05 18:49:59', 'main', 's1|/search/index.php', 0, NULL, NULL, NULL, '/search/index.php', 'Поиск', '', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(12, '2022-07-05 18:49:59', 'main', 's1|/search/map.php', 0, NULL, NULL, NULL, '/search/map.php', 'Карта сайта', '', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(13, '2022-07-05 18:49:59', 'main', 's1|/services/corp/ibank.php', 0, NULL, NULL, NULL, '/services/corp/ibank.php', 'Интернет-банкинг', '\"Интернет-Банк\" — это полнофункциональная, удобная и безопасная система дистанционного банковского обслуживания, с ее помощью вы можете в полном объеме управлять банковскими счетами в режиме реального времени. Понятный для клиента интерфейс позволяет не тратить время на обучение работе с Системой. Система снабжена внутренними подсказками.\r\"Интернет-Банк\" позволяет:\rчерез сайт Банка в Интернете получить доступ к Вашим банковским счетам практически с любого компьютера в любой точке земного шара, где есть доступ в Интернет \rвводить, редактировать и печатать платежные документы \rподписывать каждый платежный документ персонифицированной электронной-цифровой подписью \rнаправлять документы в Банк на исполнение \r«визировать» направляемые в Банк платежные документы уполномоченным лицом \rполучать выписки со всеми приложениями по счетам за определенный период времени \rосуществлять покупку/продажу иностранной валюты, конвертацию валют в режиме on-line по текущему рыночному курсу \rрезервировать на счете временно свободные денежные средства и получать дополнительный доход в виде начисленных процентов \rотслеживать текущее состояние счетов\rполучать актуальную информацию о платежах контрагентов из других банков, которые зачисляются на счет Клиента в момент поступления в Банк \rнаправлять в Банк бухгалтерскую отчетность в электронном виде \rконтролировать состояние ссудных счетов, погашение и уплату процентов \rПодключение к Системе, в том числе генерация ключей для формирования электронно-цифровой подписи, бесплатно. Абонентская плата за обслуживание не взимается.\rТехнические требования\rДля полноценной работы с Системой необходим компьютер с ОС Windows ,не ниже Windows 2000; Программа просмотра Интернет-страниц Internet Explorer версии не ниже 6.0; Приложение Java Runtime Environment (JRE) Version 1.5.0', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(14, '2022-07-05 18:49:59', 'main', 's1|/services/corp/incass.php', 0, NULL, NULL, NULL, '/services/corp/incass.php', 'Инкассация', 'Инкассация\r– доставка ценностей и денежных средств.\rБанк предлагает воспользоваться услугами службы инкассации. Служба инкассации Банка обеспечит:\rинкассацию наличных денежных средств, доставку их на специально оборудованном транспорте в Банк, по согласованному с Клиентом, графику работы;\rсопровождение ценностей и денежных средств Клиента по маршруту, указанному Клиентом; \rдоставку наличных денежных средств Клиенту; \rдоставку Клиенту разменной монеты.\rУслуги предоставляются как собственной службой инкассации, так и через другие специализированные организации.\rНеобходимая документация:\rДоговор на сбор (инкассацию) денежной выручки и доставку разменной монеты;\rЗаявка на инкассацию;\rПредварительная заявка на оказание услуг по доставке денежной наличности;\rДоговор на оказание услуг по доставке наличных денежных средств.\rОбъем инкассируемых денежных средств\rТарифы по ставке процента от объема инкассации\rТарифы от количества выездов\rТарифы с фиксированной стоимостью\rдо 0,5 млн. руб.\r0,45%\rот 120 руб/заезд\rНе менее 2500 руб. в месяц\rот 0,5 до 1,0 млн. руб.\r0,4 - 0,35%\rот 140 руб/заезд\rНе менее 3500 руб. в месяц\rот 1,0 до 1,5 млн. руб.\r0,35 -0,3%\rот 160 руб/заезд\rНе менее 4500 руб. в месяц\rот 1,5 до 2,0 млн. руб.\r0,3 -0,25%\rот 180 руб/заезд\rНе менее 5000 руб. в месяц\rот 2,0 млн до 3,0 млн. руб.\r0,25 - 0,2 %\rот 200 руб/заезд\rНе менее 6000 руб. в месяц\rот 4,0 млн. до 6 млн. руб.\r0,2 -0,15%\rот 220 руб/заезд\rНе менее 7000 руб. в месяц\rот 6,0 млн. до 10 млн. руб.\r0,15 -0,1 %\rот 240 руб/заезд\rНе менее 8000 руб. в месяц\rсвыше 10 млн. руб.\r0,1 - 0,05%\rот 260 руб/заезд\rНе менее 9000 руб. в месяц\rДругие условия\rИнкассация 5-10 торговых точек клиента\rплюс 5 % от тарифной ставки за каждую последующую точку\rИнкассация свыше 10 торговых точек клиента\rплюс 10 % от тарифной ставки за каждую последующую точку\rВремя инкассации устанавливает клиент\rплюс 10 % от тарифной ставки\rНочная инкассация (с 22:00)\rплюс 20% от тарифной ставки\rУтренняя инкассация для зачисления в 1ой половине дня\rбесплатно\rЕсли сдают на одном объекте несколько юридических лиц\rбесплатно\rДоставка разменной монеты\r0,4 % от суммы доставки\rРасходный материал\rбесплатно\rХранение денежных средств в ночное время, праздничные и выходные\rбесплатно\rЗагрузка банкоматов, подкрепление дополнительных офисов\rот 350 руб/час\rДоставка денежных средств из банка Клиенту\r0,5 % от суммы, либо по соглашению сторон', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(15, '2022-07-05 18:49:59', 'main', 's1|/services/corp/index.php', 0, NULL, NULL, NULL, '/services/corp/index.php', 'Корпоративным клиентам', 'Банк является одним из лидеров банковского рынка по обслуживанию корпоративных клиентов. \rКомплексное банковское обслуживание на основе максимального использования конкурентных преимуществ и возможностей Банка позволяет создать устойчивую \rфинансовую платформу для развития бизнеса предприятий и холдингов различных отраслей экономики. Уже более 15 лет Банк работает для своих клиентов, \rявляясь образцом надежности и высокого профессионализма.\rНаш Банк предлагает корпоративным клиентам следующие виды услуг:\rРасчетно-кассовое обслуживание\rИнкассация\rИнтернет-банкинг', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(16, '2022-07-05 18:49:59', 'main', 's1|/services/corp/rko.php', 0, NULL, NULL, NULL, '/services/corp/rko.php', 'Расчетно-кассовое обслуживание', 'Во всех странах мира самой распространенной функцией банков являются расчеты. Большинство оказываемых банком услуг связаны с быстрым и качественным проведением расчетных операций. Каждый клиент, независимо от вида осуществляемых в Банке операций, пользуется переводом средств.\rКорпоративным клиентам Банк оказывает следующие услуги:\rоткрытие и ведение счетов юридических лиц - резидентов и нерезидентов Российской Федерации — в валюте РФ и иностранной валюте; \rвсе виды расчетов в рублях и иностранной валюте; \rкассовое обслуживание в рублях и иностранной валюте; \rускоренные платежи по России по системе межрегиональных электронных платежей; \rплатежи в любую страну мира в кратчайшие сроки \rпроведение конверсионных операций по счетам Клиентов \rинкассация и доставка наличных денег и ценностей \rраспоряжение счетом посредством системы «Интернет-Банк» \rОперационный день в Банке установлен: ежедневно с 09.00 до 16.00, в пятницу и предпраздничные дни с 09.00 до 15.00.\rКассовое обслуживание осуществляется на договорной основе, плата взимается по факту совершения каждой операции в соответствии с утвержденными Банком Тарифами за услуги корпоративным клиентам.', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(17, '2022-07-05 18:49:59', 'main', 's1|/services/financialorg/depservices.php', 0, NULL, NULL, NULL, '/services/financialorg/depservices.php', 'Депозитарные услуги', 'Депозитарий Банка имеет корреспондентские отношения со всеми крупными расчетными и уполномоченными депозитариями. Разветвленная сеть корреспондентских счетов позволяет клиентам депозитария осуществлять операции практически с любыми инструментами фондового рынка.\rУслуги депозитария Банка:\rоткрытие и ведение счетов депо клиентов;\rхранение и учет всех видов ценных бумаг, включая акции, облигации, паи, векселя, международных финансовых инструментов (еврооблигации, АДР, ГДР);\rконсультирование и проведение комплексных структурированных операций с ценными бумагами;\rперерегистрация прав собственности на ценные бумаги, в том числе при выполнении определенного условия;\rоформление и учет залоговых операций с ценными бумагами депонентов;\rпредоставление информации об эмитенте;\rпомощь депонентам в реализации прав, закрепленных за ними как за владельцами ценных бумаг;\rконсультационная поддержка при проведении операций по счетам депо;\rвыполнение функций платежного агента:\rхранение ценных бумаг на основании договоров ответственного хранения;\rпроведение экспертизы ценных бумаг;\rдругие услуги.\rСпособы обмена документов с Депозитарием:\rв бумажном виде с оригинальными подписями и печатями;\rпо факсу (поручения на зачисление ценных бумаг и предоставление выписок) с последующим предоставлением оригинала;\rпо системам S.W.I.F.T. и TELEX.\rТарифы на депозитарное обслуживание\rНаименование услуги\rТариф\rОткрытие счета депо для физических лиц (резидентов и нерезидентов)\n150 руб.\nОткрытие счета депо для юридических лиц – резидентов\n400 руб.\nОткрытие счета депо для юридических лиц – нерезидентов\n1600 руб.\nЗакрытие счета депо\nНе взимается\nВнесение изменения в Анкету Депонента\nНе взимается\nАбонентская плата в месяц за ведение счета депо для юридических лиц - резидентов,\nпри наличии остатка на счете депо\n500 руб.\nАбонентская плата в месяц за ведение счета депо для юридических лиц - нерезидентов,\nпри наличии остатка на счете депо\n2 500 руб.\nАбонентская плата в месяц за ведение счета депо для Депонентов, находящихся на брокерском\nобслуживании, при наличии движения по счету депо\n150 руб.\nФормирование отчета о совершенных по счету депо операциях за период после проведения\nоперации\nНе взимается\nФормирование отчета о совершенных по счету депо операциях за период, выписки о состоянии\nсчета (раздела счета) депо по информационному запросу Депонента\n150 руб.\nЗачисление (списание) бездокументарных ценных бумаг, за одно поручение\n300 руб.\nЗачисление (списание) документарных ценных бумаг, за одну ценную бумагу\n580 руб.\nПеревод (внутри Депозитария) бездокументарных и документарных ценных бумаг, за одно\nпоручение (взимается с Депонента - Инициатора операции)\n300 руб.\nИзменение мест хранения бездокументарных ценных бумаг (за одно поручение) и документарных\nценных бумаг (за одну ценную бумагу)\n580 руб.\nБлокировка (разблокировка), регистрация залога (возврата залога) бездокументарных\nценных бумаг\n870 руб.\nБлокировка (разблокировка), регистрация заклада (возврата заклада) документарных\nценных бумаг\n870 руб.\n*При взимании тарифов дополнительно взимается налог на добавленную стоимость по ставке 18%.\rПлата за иные услуги, не оговоренные в данных Тарифах Депозитария, за исключением услуг, оказываемых при проведении операций Депонента другими депозитариями и Реестродержателями, не взимается.', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(18, '2022-07-05 18:49:59', 'main', 's1|/services/financialorg/docoper.php', 0, NULL, NULL, NULL, '/services/financialorg/docoper.php', 'Документарные операции', 'Наш Банк предлагает широкий спектр банковских услуг по проведению документарных расчетов в области международных торгово-экономических отношений ,в том числе по нестандартным и сложно структурированным схемам.\rБезусловным преимуществом работы с нашим Банком является возможность проводить операции в предельно сжатые сроки по конкурентоспособным тарифам, а также их обширная география: страны СНГ и Балтии, ближнего и дальнего зарубежья.\rСпектр услуг по банковским гарантиям: \rвыдача любых видов гарантий под контргарантии банков-корреспондентов в счет установленных на них документарных лимитов: 									 \nгарантии надлежащего исполнения контрактов;\rгарантии платежа (т.е. выполнения платежных обязательств по контрактам);\rгарантии возврата авансового платежа;\rгарантии в пользу таможенных органов;\rгарантии в пользу налоговых органов;\rтендерные гарантии (т.е. гарантии участия в торгах/конкурсах);\rгарантии возврата кредита;\rгарантии оплаты акций;\rгарантии, предоставляемые в качестве встречного обеспечения судебных исков;\rавизование гарантий иностранных и российских банков-корреспондентов в пользу отечественных и зарубежных бенефициаров;\rпредъявление требования платежа по поручению бенефициаров в счет банковских гарантий;\rзаверка подлинности подписей на гарантиях иностранных и российских банков по просьбе бенефициара;\rв случае необходимости иные виды операций, включая предварительную проработку условий гарантийной сделки.\rПредоставляемые услуги по документарным (в том числе резервным) аккредитивам:\rавизование аккредитивов иностранных и российских банков-корреспондентов в пользу отечественных и зарубежных бенефициаров;\rподтверждение аккредитивов банков-корреспондентов под предоставленное денежное покрытие или в счет документарных лимитов, установленных на банк-эмитент;\rподтверждение экспортных аккредитивов Котнрагента;\rисполнение аккредитивов;\rвыполнение функции рамбурсирующего банка на основании предоставленных полномочий по аккредитивам иностранных и российских банков-корреспондентов (при наличии у банка-эмитента корреспондентского счета ЛОРО в Газпромбанке);\rвыдача безотзывных рамбурсных обязательств по аккредитивам, открытым банками-корреспондентами, в счет документарных лимитов, установленных на банк-эмитент (при наличии у банка-эмитента корреспондентского счета ЛОРО в Газпромбанке);\rоформление трансферации и переуступки выручки по аккредитивам;\rоткрытие аккредитивов/предоставление платежных гарантий в рамках операций торгового финансирования;\rиные виды операций, включая предварительную проработку схемы расчетов и условий аккредитивной сделки.', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(19, '2022-07-05 18:49:59', 'main', 's1|/services/financialorg/index.php', 0, NULL, NULL, NULL, '/services/financialorg/index.php', 'Финансовым организациям', 'Активное сотрудничество на финансовых рынках представляет собой одну из наиболее важных сторон бизнеса и является перспективным направлением деятельности нашего Банка. Политика банка направлена на расширение сотрудничества, увеличение объемов взаимных кредитных линий. Солидная деловая репутация Банка на рынке межбанковских операций способствует налаживанию стабильных и взаимовыгодных партнерских отношений с самыми крупными и надежными банками страны.\rОсобое внимание Банк уделяет развитию взаимоотношений с международными финансовыми институтами. Финансирование долгосрочных и среднесрочных проектов клиентов за счет привлечения средств на международных рынках капитала - одно из приоритетных направлений деятельности Банка. Наш Банк имеет развитую сеть корреспондентских счетов, что позволяет быстро и качественно осуществлять расчеты в различных валютах. Поручения клиентов могут быть исполнены Банком в сжатые сроки.\rВ целях минимизации рисков при поведении операций на финансовых рынках наш Банк максимально требовательно подходит к выбору своих банков-контрагентов. \rВ данном направлении Банк предлагает финансовым организациям следующие услуги:\rУслуги на межбанковском рынке\rДепозитарные услуги\rДокументарные операции', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(20, '2022-07-05 18:49:59', 'main', 's1|/services/financialorg/mbank.php', 0, NULL, NULL, NULL, '/services/financialorg/mbank.php', 'Услуги на межбанковском рынке', 'Межбанковское кредитование\rВид услуги\nОписание\nКредитование под валютный депозит\nКредиты выдаются в рублях на срок от 1 дня до 1 месяца с возможностью дальнейшей\nпролонгации. Тарифные ставки зависят от конкретных условий сделки.\nКредитование под залог ОВГВЗ\nКредиты выдаются в рублях и валюте на срок до 1 месяца с возможной пролонгацией.\nСтавка дисконта составляет 25—30%.\nКредитование под залог государственных ценных бумаг\nВ залог принимаются облигации федерального займа (ОФЗ) любого выпуска. Ставка дисконта:\nОФЗ с датой погашения до 91 дня — 5%;\rОФЗ с датой погашения до 365 дней — 8%;\rОФЗ с датой погашения свыше 365 дней — 13%.\rКредиты выдаются на срок до2 недель.\nКредитование под залог векселей\nДля консультаций по этому виду кредитования обратитесь в Управление вексельного\nобращения и работы с долговыми обязательствами по телефону (495) 978-78-78.\nКонверсионные операции\rНа внутреннем денежном рынке Банк осуществляет:\rБрокерское обслуживание банков по их участию в торгах ЕТС на ММВБ. Ставки комиссионного вознаграждения варьируются в зависимости от объема операций (в пределах 0,147—0,18%).\rКонверсионные операции. Банк предлагает банкам-контрагентам работу на валютном рынке по покупке и продаже иностранной валюты за российские рубли по текущим рыночным ценам. При отсутствии открытых линий при продаже иностранной валюты банк-контрагент производит предоплату по заключенной сделке, возможна работа под кредитовое авизо.\rБанкнотные операции\rпокупка и продажа наличной валюты за безналичную валюту;\rпродажа новых банкнот в упаковке американского банка-эмитента;\rпокупка и продажа банкнот, бывших в употреблении.\rУровень комиссионных зависит от объемов и конкретных условий сделки.\rДокументарные операции\rМеждународные расчеты:\nАккредитив\r- это условное денежное обязательство, принимаемое банком (банком-эмитентом) по поручению плательщика, произвести платежи в пользу получателя средств по предъявлении последним документов, соответствующих условиям аккредитива, или предоставить полномочия другому банку (исполняющему банку) произвести такие платежи.\rИнкассо\r- это расчетная операция, посредством которой банк на основании расчетных документов по поручению клиента получает причитающиеся клиенту денежные средства от плательщика за поступившие в адрес плательщика товары или оказанные ему услуги, после чего эти средства зачисляются на счет клиента в банке.\rОперации с векселями банка\rВексели нашего банка являются простыми векселями.\rПростой вексель — документ установленной законом формы, дающий его держателю (векселедержателю) безусловное право требовать с лица, указанного в данном документе (плательщика), уплаты оговоренной суммы по наступлению некоторого срока. Обязательство по простому векселю возникает с момента его составления и передачи первому векселедержателю.\rПеречень проводимых банком операций с собственными векселями:\nвыпуск векселей;\rпогашение векселей;\rдосрочный учет векселей;\rответственное хранение векселей;\rкредитование под залог векселей;\rвыдача кредитов на приобретение векселей;\rновация и размен векселей;\rпроверка подлинности векселей.', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(21, '2022-07-05 18:49:59', 'main', 's1|/services/fiz/cards.php', 0, NULL, NULL, NULL, '/services/fiz/cards.php', 'Банковские карты', 'Кредитные Карты\rСрок действия Карты\r3 года\rКомиссия за ежегодное осуществление расчетов по операциям с Основной Картой.\r600 руб. / 25 долл. США / 25 евро\rЛьготный период оплаты\rдо 50 календарных дней\rЕжемесячный минимальный платеж \r(в процентах от суммы задолженности по Овердрафтам):\r10% \rДополнительные проценты/штрафы/комиссии/ на сумму неразрешенного Овердрафта\rне взимается (отменена с 1 марта) \rКомиссия за учет Отчетной суммы задолженности, непогашенной на последний календарный день Льготного периода оплаты.\rдля 1-6-го месяцев\rдля 6-го и последующих месяцев\r12% / 15% \r21% / 24% \rв пунктах выдачи наличных или банкоматах \"Банка\" \rв банкоматах банков-партнеров \"Объединенной расчетной системы (ОРС)\" \rв пунктах выдачи наличных или банкоматах иного банка \r0%\r0,5%\r2,5%\rМинимальная сумма комиссии по операциям получения наличных денежных средств в пунктах выдачи наличных или банкоматах иного банка. \r150 рублей\rКомиссия за осуществление конвертации по трансграничным операциям (совершенным за пределами территории РФ). \r0,75% \rРасчетные карты Банка\rВалюта Картсчета\rроссийские рубли / доллары США / евро\rСрок действия карты\r3 года\rКомиссия за осуществление расчетов в течение одного года по операциям с Основной Картой при ее первичном выпуске.\rВзимается перед началом каждого года расчетов по действующей Карте из средств на Картсчете.\r500 рублей/20 долл. США/20 евро\rКомиссия за операцию получения наличных денежных средств:\rдо 300 000 рублей (включительно)\rв пунктах выдачи наличных или банкоматах «Банка»\rв банкоматах банков-партнеров\rв пунктах выдачи наличных или банкоматах иного банка\r0%\r0,5%\r1,5% мин. 90 руб.\rот 300 001 до 10 000 000 рублей (включительно)\r2,5% \rот 10 000 001 рубля и выше\r5%\rМинимальная сумма комиссии по операциям получения наличных денежных средств в пунктах выдачи наличных или банкоматах иного банка. \r90 рублей\rКомиссия за перечисление и конверсию денежных средств в Интернет-банке. \r0%\rКомиссия за остановку операций по Картсчету, совершаемых с использованием Карты, при ее утрате. \r600 рублей/25 долл. США/25 евро\rКомиссия за осуществление конверсии по трансграничным операциям (совершенным за пределами территории РФ).\r0,75%\rВыдача Карточки доступа.\rБесплатно\rКомиссия за оплату услуг в Интернет - банке и в банкоматах Банка. \rБесплатно\rКомиссия за учет перерасхода средств (в процентах годовых от суммы перерасхода). \r36%\rКомиссия за отправку SMS сообщений о суммах проведенных по Карте операций и доступном балансе в течение ее срока действия.\rБесплатно', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(22, '2022-07-05 18:49:59', 'main', 's1|/services/fiz/credit.php', 0, NULL, NULL, NULL, '/services/fiz/credit.php', 'Потребительский кредит', 'Не важно, для чего вам нужны деньги — мы доверяем вам и не тратим время на лишние процедуры.\rТарифы кредитования физических лиц\rВ рублях\rСумма кредита: от 150 000 до 1 500 000 рублей\rСрок кредита: от 6 до 36 месяцев\r% ставка: от 18 до 21,5% годовых\rЕдиновременная комиссия за выдачу кредита: 2% от суммы кредита\rВ долларах США\rСумма кредита: от 5 000 до 50 000 долларов США\rСрок кредита: от 6 до 24 месяцев\r% ставка: от 14,5 до 16,5% годовых\rЕдиновременная комиссия за выдачу кредита: 2% от суммы кредита\rУсловия кредитного договора и применяемый тарифный план и/или тарифы определяются в индивидуальном порядке, в том числе в зависимости от подтвержденного дохода клиента. Изложенная информация не является публичной офертой и не влечет возникновения у ЗАО «Банк Интеза» обязанности предоставить кредит, как на указанных, так и на любых иных условиях.\rМинимальные требования к заемщику\rВы гражданин России.\rВам сейчас больше 23 лет и вам будет меньше 60 (для мужчин) или меньше 55 (для женщин) на момент погашения (то есть полной оплаты) кредита.\rУ вас есть официальное место работы, и вы работаете на нем по найму не менее шести месяцев и прошли испытательный срок.\rВаш общий трудовой стаж составляет не менее двух лет\rВы можете подтвердить свой доход официально при помощи стандартной формы 2НДФЛ или справкой по форме банка.\rВы обратились в отделение банка в том же городе, в котором вы работаете.\rС вами можно связаться по городскому телефону по месту работы.\rТелефон горячей линии: \r8 800 2002 808\r( Звонок по России бесплатный)', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(23, '2022-07-05 18:49:59', 'main', 's1|/services/fiz/index.php', 0, NULL, NULL, NULL, '/services/fiz/index.php', 'Частным лицам', 'Наш Банк предоставляет физическим лицам большое число различных возможностей, связанных с сохранением средств и совершением различных сделок. В частности, банк предлагает своим клиентам широкую линейку разнообразных вкладов, способных удовлетворить как долгосрочные, так и краткосрочные интересы, касающиеся размещения свободных средств по выгодным ставкам. В своей работе Банк активно применяет инновационные технологии динамично развивающейся банковской сферы.\rБанк предлагает своим клиентам качественный универсальный сервис по следующим направлениям:\rБанковские карты\rПотребительский кредит', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(24, '2022-07-05 18:49:59', 'main', 's1|/services/index.php', 0, NULL, NULL, NULL, '/services/index.php', 'Услуги', 'Наш Банк предоставляет физическим лицам большое число различных возможностей, связанных с сохранением средств и совершением различных сделок. В частности, банк предлагает своим клиентам широкую линейку разнообразных вкладов, способных удовлетворить как долгосрочные, так и краткосрочные интересы, касающиеся размещения свободных средств по выгодным ставкам. В своей работе Банк активно применяет инновационные технологии динамично развивающейся банковской сферы.\rБанк предлагает своим клиентам качественный универсальный сервис по следующим направлениям:\rБанковские карты\rПотребительский кредит\rМалому и среднему бизнесу\rРабота с предприятиями малого и среднего бизнеса - одно из стратегически важных направлений деятельности Банка. Наш Банк представляет современные программы обслуживания малого и среднего бизнеса, обеспечивает оптимальные и взаимовыгодные варианты сотрудничества, в основе которых лежит профессионализм сотрудников и высокое качество банковских услуг. Услуги нашего Банка отличаются оперативностью и надежностью, так как ориентированы на деловых людей - на тех, кто ценит свое время и деньги.\rБанк предлагает следующие виды услуг для предприятий малого и среднего бизнеса:\rКредитование\rЛизинг\rДепозиты\rПластиковые карты\rКорпоративным клиентам\rБанк является одним из лидеров банковского рынка по обслуживанию корпоративных клиентов. \rКомплексное банковское обслуживание на основе максимального использования конкурентных преимуществ и возможностей Банка позволяет создать устойчивую \rфинансовую платформу для развития бизнеса предприятий и холдингов различных отраслей экономики. Уже более 15 лет Банк работает для своих клиентов, \rявляясь образцом надежности и высокого профессионализма.\rНаш Банк предлагает корпоративным клиентам следующие виды услуг:\rРасчетно-кассовое обслуживание\rИнкассация\rИнтернет-банкинг\rФинансовым организациям\rАктивное сотрудничество на финансовых рынках представляет собой одну из наиболее важных сторон бизнеса и является перспективным направлением деятельности нашего Банка. Политика банка направлена на расширение сотрудничества, увеличение объемов взаимных кредитных линий. Солидная деловая репутация Банка на рынке межбанковских операций способствует налаживанию стабильных и взаимовыгодных партнерских отношений с самыми крупными и надежными банками страны.\rОсобое внимание Банк уделяет развитию взаимоотношений с международными финансовыми институтами. Финансирование долгосрочных и среднесрочных проектов клиентов за счет привлечения средств на международных рынках капитала - одно из приоритетных направлений деятельности Банка. Наш Банк имеет развитую сеть корреспондентских счетов, что позволяет быстро и качественно осуществлять расчеты в различных валютах. Поручения клиентов могут быть исполнены Банком в сжатые сроки.\rВ целях минимизации рисков при поведении операций на финансовых рынках наш Банк максимально требовательно подходит к выбору своих банков-контрагентов. \rВ данном направлении Банк предлагает финансовым организациям следующие услуги:\rУслуги на межбанковском рынке\rДепозитарные услуги\rДокументарные операции', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(25, '2022-07-05 18:49:59', 'main', 's1|/services/smallbusiness/cards.php', 0, NULL, NULL, NULL, '/services/smallbusiness/cards.php', 'Пластиковые карты', 'Наш Банк проводит операции с пластиковыми картами с 1997 г. Сегодня мы предлагаем пластиковые карты основных международных платёжных систем – Visa и MasterCard; от самых демократичных Еlеctron до элитных Gold и Platinum. В рамках персонального обслуживания В рамках персонального банковского обслуживания Банк дополнительно предлагает эксклюзивные карты Visa Infinite с бриллиантами и платиновым орнаментом.\rЗаказать международную пластиковую карту можно в любом отделении нашего Банка. Ваша карта будет готова уже через 3-5 дней. Наш Банк один из немногих в России, кто выдает карту сроком на два года, как и крупнейшие зарубежные банки.Каждый Пакет услуг Банка включает одну основную и до трех дополнительных пластиковых карт для вас и для членов вашей семьи (включая детей старше 14 лет). Вы сами устанавливаете ограничения: кто и сколько может потратить по карте.\rТеряя пластиковую карту, вы не теряете деньги. Потому что карты нашего Банка надежно защищены от незаконного использования. Просто соблюдайте правила безопасности при обращении со своей картой, а в случае ее пропажи или хищения без промедления обратитесь в Банк.\rПреимущества пластиковых карт Банка\rполучение наличных без комиссии в широкой сети банкоматов;\rсведения об остатке и совершённых операциях по карте приходят по SMS;\rсистема интернет-банкинга позволяет владельцу карты контролировать расходы и управлять средствами на карточных счетах.\rвсем владельцам карт Банка доступны cкидки и бонусные программы.\rВиды пластиковых карт\rДебетовые карты:\rудобство безналичной оплаты товаров и услуг\rбезопасное хранение собственных средств\rначисление процентов на остаток по карте\rконтроль над расходами и управление своими деньгами\rКредитные карты:\rкредитование без процентов до 55 дней\rпользоваться кредитом можно многократно, не обращаясь в Банк\rбезналичная оплата товаров и услуг без комиссий в любой точке мира\rпровоз денег через границу без таможенного оформления\rне нужно покупать валюту для выезда в другие страны\rвсе полезные функции дебетовых карт', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(26, '2022-07-05 18:49:59', 'main', 's1|/services/smallbusiness/credit.php', 0, NULL, NULL, NULL, '/services/smallbusiness/credit.php', 'Кредитование', 'Кредитование малого и среднего бизнеса является одним из стратегических направлений Банка.\rДанное направление включает в себя:\nкредитование юридических лиц\rкредитование индивидуальных предпринимателей\rВ зависимости от пожеланий клиента кредиты для бизнеса предоставляются в разных валютах: в рублях РФ, долларах США и евро. \nПреимущества получения кредита в нашем Банке:\rСрок рассмотрения кредитной заявки от 2-х рабочих дней; \rОтсутствие ежемесячной платы за ведение ссудного счета;\rОтсутствие требований по предоставлению бизнес-плана;\rПринимается к рассмотрению управленческая отчетность;\rВ качестве залога рассматриваются товары в обороте, автотранспорт, оборудование, недвижимость и другое ликвидное имущество; \rГибкие условия погашения кредита. \rДля получения кредита:\rПозвоните нам по телефону +7 (495) 757-57-57, обратитесь в ближайшее к Вам отделение Банка или заполните on-line заявку. \rНаши специалисты помогут Вам выбрать удобные условия кредитования и ответят на интересующие Вас вопросы.\rПодготовьте необходимые для рассмотрения кредитной заявки документы и договоритесь о встрече с кредитным экспертом Банка.\rПокажите кредитному эксперту Ваше предприятие и имущество, предлагаемое в залог.\rПолучите кредит на развитие Вашего бизнеса! \nПрограммы кредитования малого и среднего бизнеса:\rПрограмма\nСумма кредита\nПроцентная ставка\nСрок кредита\n«Овердрафт»\rот 300 000\nдо 5 000 000 рублей\nот 18% годовых\nдо 12 месяцев\n«Миникредит»\rот 150 000\nдо 1 000 000 рублей\nот 24% годовых\nдо 36 месяцев\n«Развитие»\nот 1 000 000\nдо 15 000 000 рублей\nот 17% годовых\nдо 36 месяцев\n«Инвест»\nот 1 000 000\nдо 30 000 000 рублей\nот 15% годовых\nдо 72 месяцев', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(27, '2022-07-05 18:49:59', 'main', 's1|/services/smallbusiness/deposits.php', 0, NULL, NULL, NULL, '/services/smallbusiness/deposits.php', 'Депозиты', 'Наш Банк предлагает вам эффективно разместить свободные деньги на банковском депозите и получить дополнительную прибыль.\rДепозитные продукты\r \rДосрочное расторжение\rПополнение\rЧастичное изъятие\rВыплата процентов\rДепозит с выплатой процентов в конце срока\rНе предусмотрено.\rНе предусмотрено.\rНе предусмотрено.\rВ конце срока.\rДепозит с выплатой процентов ежемесячно\rНе предусмотрено.\rНе предусмотрено.\rНе предусмотрено.\rЕжемесячно.\rДепозит с возможностью пополнения\rНе предусмотрено.\rПрекращается за 2 месяца до окончания срока действия депозита. \rНе предусмотрено \rВ конце срока. \rДепозит с возможностью пополнения и изъятия\rНе предусмотрено.\rПрекращается за 2 месяца до окончания срока действия депозита.\rНе более 40% от первоначальной суммы вклада за весь срок депозита \rВ конце срока. \rДепозит с возможностью досрочного расторжения \rВозможно при размещении на 12 месяцев, но не ранее чем через 6 месяцев.\rНе предусмотрено.\rНе предусмотрено. \rВ конце срока.', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(28, '2022-07-05 18:49:59', 'main', 's1|/services/smallbusiness/index.php', 0, NULL, NULL, NULL, '/services/smallbusiness/index.php', 'Малому и среднему бизнесу', 'Работа с предприятиями малого и среднего бизнеса - одно из стратегически важных направлений деятельности Банка. Наш Банк представляет современные программы обслуживания малого и среднего бизнеса, обеспечивает оптимальные и взаимовыгодные варианты сотрудничества, в основе которых лежит профессионализм сотрудников и высокое качество банковских услуг. Услуги нашего Банка отличаются оперативностью и надежностью, так как ориентированы на деловых людей - на тех, кто ценит свое время и деньги.\rБанк предлагает следующие виды услуг для предприятий малого и среднего бизнеса:\rКредитование\rЛизинг\rДепозиты\rПластиковые карты', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(29, '2022-07-05 18:49:59', 'main', 's1|/services/smallbusiness/leazing.php', 0, NULL, NULL, NULL, '/services/smallbusiness/leazing.php', 'Лизинг', 'Наш Банк оказывает весь спектр услуг по финансовой аренде (лизингу) отечественного и импортного оборудования, транспорта и недвижимости.\rЛизинг оборудования и транспорта\rОсновные условия:\rСрок финансирования:\nоборудование и транспорт - до 5 лет\rж/д подвижной состав - до 10 лет\rВалюта финансирования: рубли, доллары США, евро\rМинимальная сумма финансирования: от 4,5 млн.руб.\rАванс: от 0%\rУдорожание: от 9%\rСрок принятия решения: от 14 дней\rФинансирование импортных поставок\rМы предоставляем предприятиям доступ к льготному финансированию импортных поставок оборудования и транспорта с использованием механизма лизинга при участии экспортных кредитных агентств.\rОсновные условия:\rСрок финансирования: до 7 лет\rВалюта финансирования: рубли, доллары США, евро\rМинимальная сумма финансирования: от 15 млн.руб. \rАванс: от 15% (без учета таможенных пошлин) \rУдорожание: от 5%\rСрок принятия решения: от 14 дней\rЛизинг коммерческой недвижимости\rПозволяет предприятиям приобрести объекты коммерческой недвижимости без единовременного отвлечения значительных средств.\rВ качестве предмета лизинга могут выступать:\rофисные здания;\rторговые, складские и производственные помещения;\rдругие объекты коммерческой недвижимости.\rОсновные условия:\rСрок финансирования: от 5 лет\rВалюта финансирования: рубли, доллары США, евро\rМинимальная сумма финансирования: от 50 млн.руб.* \rАванс: от 0%\rУдорожание: от 7%\rСрок принятия решения: от 14 дней\r* Размер суммы финансирования зависит от региона, в котором находится объект недвижимости.\rОсновным требованием, предъявляемым нашим Банком для рассмотрения заявки на лизинг коммерческой недвижимости, является наличие полного комплекта правоустанавливающих документов на недвижимость и наличие отчета независимого оценщика.', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(30, '2022-07-05 18:49:59', 'main', 's1|/_index.php', 0, NULL, NULL, NULL, '/_index.php', 'Новости банка', '', '', '', '', 'c6e85e5b71a32ccc79450720a85bed33', NULL, NULL),
(31, '2010-05-28 00:00:00', 'iblock', '1', 0, NULL, NULL, NULL, '=ID=1&EXTERNAL_ID=1&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=corporate_news&IBLOCK_EXTERNAL_ID=corporate_news&CODE=', 'Банк переносит дату вступления в действие тарифов на услуги в иностранной валюте', 'Уважаемые клиенты,\rсообщаем Вам, что Банк переносит дату вступления в действие тарифов на услуги для юридических лиц и индивидуальных предпринимателей в иностранной валюте. В связи с этим до даты введения в действие новой редакции тарифов, услуги юридическим лицам и индивидуальным предпринимателям будут оказываться в рамках действующих тарифов. \rИнформация о дате введения новой редакции тарифов будет сообщена дополнительно.\r\nУважаемые клиенты,\rсообщаем Вам, что Банк переносит дату вступления в действие тарифов на услуги для юридических лиц и индивидуальных предпринимателей в иностранной валюте. В связи с этим до даты введения в действие новой редакции тарифов, услуги юридическим лицам и индивидуальным предпринимателям будут оказываться в рамках действующих тарифов. \rИнформация о дате введения новой редакции тарифов будет сообщена дополнительно.', '', 'news', '1', NULL, '2010-05-28 00:00:00', NULL);
INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
(32, '2010-05-27 00:00:00', 'iblock', '2', 0, NULL, NULL, NULL, '=ID=2&EXTERNAL_ID=2&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=corporate_news&IBLOCK_EXTERNAL_ID=corporate_news&CODE=', 'Начать работать с системой «Интернет-Клиент» стало еще проще', 'Наш Банк предлагает своим клиентам Мастер Установки «Интернет-Клиент», который существенно упростит начало работы с системой. Теперь достаточно скачать и запустить Мастер Установки, и все настройки будут произведены автоматически. Вам больше не нужно тратить время на изучение объемных инструкций, или звонить в службу техподдержки, чтобы начать работать с системой.\r\nНаш Банк предлагает своим клиентам Мастер Установки «Интернет-Клиент», который существенно упростит начало работы с системой. Теперь достаточно скачать и запустить Мастер Установки, и все настройки будут произведены автоматически. Вам больше не нужно тратить время на изучение объемных инструкций, или звонить в службу техподдержки, чтобы начать работать с системой.', '', 'news', '1', NULL, '2010-05-27 00:00:00', NULL),
(33, '2010-05-24 00:00:00', 'iblock', '3', 0, NULL, NULL, NULL, '=ID=3&EXTERNAL_ID=3&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=corporate_news_s1&IBLOCK_EXTERNAL_ID=corporate_news_s1&CODE=', 'Реорганизация сети отделений Банка', 'В ближайшее время будет значительно расширен продуктовый ряд и перечень предоставляемых банковских услуг, которые Банк сможет предлагать во всех своих дополнительных офисах. Теперь наши клиенты смогут получить полный перечень услуг в любом из отделений Банка. \rБыло проведено комплексное всестороннее исследование функционирования региональных офисов на предмет соответствия возросшим требованиям. В результате, принято решение о временном закрытии офисов, не соответствующих высоким стандартам и не приспособленных к требованиям растущего бизнеса. Офисы постепенно будут отремонтированы и переоборудованы, станут современными и удобными. \rПриносим свои извинения за временно доставленные неудобства. \r\nВ ближайшее время будет значительно расширен продуктовый ряд и перечень предоставляемых банковских услуг, которые Банк сможет предлагать во всех своих дополнительных офисах. Теперь наши клиенты смогут получить полный перечень услуг в любом из отделений Банка. \rБыло проведено комплексное всестороннее исследование функционирования региональных офисов на предмет соответствия возросшим требованиям. В результате, принято решение о временном закрытии офисов, не соответствующих высоким стандартам и не приспособленных к требованиям растущего бизнеса. Офисы постепенно будут отремонтированы и переоборудованы, станут современными и удобными. \rПриносим свои извинения за временно доставленные неудобства.', '', 'news', '1', NULL, '2010-05-24 00:00:00', NULL),
(34, '2010-05-01 00:00:00', 'iblock', '4', 0, NULL, NULL, NULL, '=ID=4&EXTERNAL_ID=2&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=2&IBLOCK_CODE=corp_vacancies&IBLOCK_EXTERNAL_ID=corp_vacancies&CODE=', 'Главный специалист Отдела анализа кредитных проектов региональной сети', 'Требования\rВысшее экономическое/финансовое образование, опыт в банках топ-100 не менее 3-х лет в кредитном отделе (анализ заемщиков), желателен опыт работы с кредитными заявками филиалов, знание технологий АФХД предприятий, навыки написания экспертного заключения, знание законодательства (в т.ч. Положение ЦБ № 254-П).\rОбязанности\rАнализ кредитных проектов филиалов Банка, подготовка предложений по структурированию кредитных проектов, оценка полноты и качества формируемых филиалами заключений, выявление стоп-факторов, доработка заявок филиалов в соответствии со стандартами Банка, подготовка заключения (рекомендаций) на КК по заявкам филиалов в части оценки финансово-экономического состояния заемщика, защита проектов на КК Банка, консультирование и методологическая помощь филиалам Банка в части корпоративного кредитования.\rУсловия\rМесто работы: М.Парк Культуры. Графики работы: пятидневная рабочая неделя, с 9:00 до 18:00, пт. до 16:45. Зарплата: 50000 руб. оклад + премии, полный соц. пакет,оформление согласно ТК РФ', '', 'vacancies', '2', NULL, '2010-05-01 00:00:00', NULL),
(35, '2010-05-01 00:00:00', 'iblock', '5', 0, NULL, NULL, NULL, '=ID=5&EXTERNAL_ID=3&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=2&IBLOCK_CODE=corp_vacancies&IBLOCK_EXTERNAL_ID=corp_vacancies&CODE=', 'Специалист по продажам розничных банковских продуктов', 'Требования\rВысшее экономического образования ‚ опыт работы в сфере продаж банковских продуктов‚ опытный пользователь ПК‚ этика делового общения‚ ответственность‚ инициативность‚ активность.\rОбязанности\rПродажа розничных банковских продуктов, оформление документов.\rУсловия\rТрудоустройство по ТК РФ‚ полный соц. пакет. График работы: пятидневная рабочая неделя. Зарплата: 20000 руб. оклад + премии', '', 'vacancies', '2', NULL, '2010-05-01 00:00:00', NULL),
(36, '2010-05-01 00:00:00', 'iblock', '6', 0, NULL, NULL, NULL, '=ID=6&EXTERNAL_ID=4&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=2&IBLOCK_CODE=corp_vacancies&IBLOCK_EXTERNAL_ID=corp_vacancies&CODE=', 'Специалист Отдела андеррайтинга', 'Требования\rВысшее профессиональное образование, опыт работы от 2 лет в отделе по работе с физическими и юридическими лицами Банков, связанных с анализом платёжеспособности и кредитоспособности физических и юридических лиц.\rОбязанности\rПроверка соответствия документов, предоставленных клиентами Банка, анализ информации о риске\rУсловия\rТрудоустройство по ТК РФ‚ полный соц. пакет. График работы: пятидневная рабочая неделя. Зарплата: оклад 25000 руб.', '', 'vacancies', '2', NULL, '2010-05-01 00:00:00', NULL),
(37, '2022-07-09 14:05:11', 'main', 's1|/index.php', 0, NULL, NULL, NULL, '/index.php', 'Новости банка', '', '', '', '', NULL, NULL, NULL),
(38, '2022-07-09 13:25:24', 'iblock', '7', 0, NULL, NULL, NULL, '=ID=7&EXTERNAL_ID=7&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=rest_entity&IBLOCK_ID=3&IBLOCK_CODE=about&IBLOCK_EXTERNAL_ID=&CODE=', 'Более 7 лет', 'Работаем одним составом', '', 'rest_entity', '3', NULL, NULL, NULL),
(39, '2022-07-09 13:16:29', 'iblock', '8', 0, NULL, NULL, NULL, '=ID=8&EXTERNAL_ID=8&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=rest_entity&IBLOCK_ID=3&IBLOCK_CODE=about&IBLOCK_EXTERNAL_ID=&CODE=', 'Бесплатный замер', 'Выезд в день обращения, производим расчет сразу на месте', '', 'rest_entity', '3', NULL, NULL, NULL),
(40, '2022-07-09 13:16:53', 'iblock', '9', 0, NULL, NULL, NULL, '=ID=9&EXTERNAL_ID=9&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=rest_entity&IBLOCK_ID=3&IBLOCK_CODE=about&IBLOCK_EXTERNAL_ID=&CODE=', 'Бесплатно', 'Сервисное обслуживание всех выполненных работ', '', 'rest_entity', '3', NULL, NULL, NULL),
(41, '2022-07-09 13:17:20', 'iblock', '10', 0, NULL, NULL, NULL, '=ID=10&EXTERNAL_ID=10&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=rest_entity&IBLOCK_ID=3&IBLOCK_CODE=about&IBLOCK_EXTERNAL_ID=&CODE=', 'Высокое качество', 'Монтажных работ\r\nи обслуживания', '', 'rest_entity', '3', NULL, NULL, NULL),
(42, '2022-07-09 13:17:38', 'iblock', '11', 0, NULL, NULL, NULL, '=ID=11&EXTERNAL_ID=11&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=rest_entity&IBLOCK_ID=3&IBLOCK_CODE=about&IBLOCK_EXTERNAL_ID=&CODE=', 'Гос. заказчики', 'Довольны нашей работой', '', 'rest_entity', '3', NULL, NULL, NULL),
(43, '2022-07-09 13:21:30', 'iblock', '12', 0, NULL, NULL, NULL, '=ID=12&EXTERNAL_ID=12&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=rest_entity&IBLOCK_ID=5&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Место', 'г. Новосибирск,\r\nул. Державина д. 49', '', 'rest_entity', '5', NULL, NULL, NULL),
(44, '2022-07-09 13:22:01', 'iblock', '13', 0, NULL, NULL, NULL, '=ID=13&EXTERNAL_ID=13&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=rest_entity&IBLOCK_ID=5&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Время', '10:00 - 20:00,\r\nбез выходных', '', 'rest_entity', '5', NULL, NULL, NULL),
(45, '2022-07-09 13:22:21', 'iblock', '14', 0, NULL, NULL, NULL, '=ID=14&EXTERNAL_ID=14&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=rest_entity&IBLOCK_ID=5&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Телефон', '8 (383) 000-00-00', '', 'rest_entity', '5', NULL, NULL, NULL),
(46, '2022-07-09 13:22:37', 'iblock', '15', 0, NULL, NULL, NULL, '=ID=15&EXTERNAL_ID=15&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=rest_entity&IBLOCK_ID=5&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Почта', 'ampir_nsk@mail.ru', '', 'rest_entity', '5', NULL, NULL, NULL),
(47, '2022-07-09 14:11:37', 'iblock', '16', 0, NULL, NULL, NULL, '=ID=16&EXTERNAL_ID=16&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=rest_entity&IBLOCK_ID=4&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Грамота1', '', '', 'rest_entity', '4', NULL, NULL, NULL),
(48, '2022-07-09 14:11:52', 'iblock', '17', 0, NULL, NULL, NULL, '=ID=17&EXTERNAL_ID=17&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=rest_entity&IBLOCK_ID=4&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Грамота2', '', '', 'rest_entity', '4', NULL, NULL, NULL),
(49, '2022-07-09 14:59:19', 'iblock', '18', 0, NULL, NULL, NULL, '=ID=18&EXTERNAL_ID=18&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=rest_entity&IBLOCK_ID=4&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Грамота3', '', '', 'rest_entity', '4', NULL, NULL, NULL),
(53, '2022-07-10 15:02:46', 'iblock', '22', 0, NULL, NULL, NULL, '=ID=22&EXTERNAL_ID=22&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=6&IBLOCK_CODE=news2&IBLOCK_EXTERNAL_ID=&CODE=', 'Банк переносит дату вступления в действие тарифов на услуги в иностранной валюте', '', '', 'news', '6', NULL, NULL, NULL),
(54, '2022-07-10 15:02:47', 'iblock', '23', 0, NULL, NULL, NULL, '=ID=23&EXTERNAL_ID=23&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=6&IBLOCK_CODE=news2&IBLOCK_EXTERNAL_ID=&CODE=', 'Начать работать с системой «Интернет-Клиент» стало еще проще', '', '', 'news', '6', NULL, NULL, NULL),
(55, '2022-07-10 15:02:48', 'iblock', '24', 0, NULL, NULL, NULL, '=ID=24&EXTERNAL_ID=24&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=6&IBLOCK_CODE=news2&IBLOCK_EXTERNAL_ID=&CODE=', 'Реорганизация сети отделений Банка', '', '', 'news', '6', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_freq`
--

CREATE TABLE `b_search_content_freq` (
  `STEM` int NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_param`
--

CREATE TABLE `b_search_content_param` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_right`
--

CREATE TABLE `b_search_content_right` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_right`
--

INSERT INTO `b_search_content_right` (`SEARCH_CONTENT_ID`, `GROUP_CODE`) VALUES
(1, 'G2'),
(2, 'G2'),
(3, 'G2'),
(4, 'G2'),
(5, 'G2'),
(6, 'G2'),
(7, 'G2'),
(8, 'G2'),
(9, 'G2'),
(10, 'G2'),
(11, 'G2'),
(12, 'G2'),
(13, 'G2'),
(14, 'G2'),
(15, 'G2'),
(16, 'G2'),
(17, 'G2'),
(18, 'G2'),
(19, 'G2'),
(20, 'G2'),
(21, 'G2'),
(22, 'G2'),
(23, 'G2'),
(24, 'G2'),
(25, 'G2'),
(26, 'G2'),
(27, 'G2'),
(28, 'G2'),
(29, 'G2'),
(30, 'G2'),
(31, 'G2'),
(32, 'G2'),
(33, 'G1'),
(33, 'G2'),
(34, 'G2'),
(35, 'G2'),
(36, 'G2'),
(37, 'G2'),
(38, 'G2'),
(39, 'G2'),
(40, 'G2'),
(41, 'G2'),
(42, 'G2'),
(43, 'G2'),
(44, 'G2'),
(45, 'G2'),
(46, 'G2'),
(47, 'G2'),
(48, 'G2'),
(49, 'G2'),
(53, 'G1'),
(54, 'G1'),
(55, 'G1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_site`
--

CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_site`
--

INSERT INTO `b_search_content_site` (`SEARCH_CONTENT_ID`, `SITE_ID`, `URL`) VALUES
(1, 's1', ''),
(2, 's1', ''),
(3, 's1', ''),
(4, 's1', ''),
(5, 's1', ''),
(6, 's1', ''),
(7, 's1', ''),
(8, 's1', ''),
(9, 's1', ''),
(10, 's1', ''),
(11, 's1', ''),
(12, 's1', ''),
(13, 's1', ''),
(14, 's1', ''),
(15, 's1', ''),
(16, 's1', ''),
(17, 's1', ''),
(18, 's1', ''),
(19, 's1', ''),
(20, 's1', ''),
(21, 's1', ''),
(22, 's1', ''),
(23, 's1', ''),
(24, 's1', ''),
(25, 's1', ''),
(26, 's1', ''),
(27, 's1', ''),
(28, 's1', ''),
(29, 's1', ''),
(30, 's1', ''),
(31, 's1', ''),
(32, 's1', ''),
(33, 's1', ''),
(34, 's1', ''),
(35, 's1', ''),
(36, 's1', ''),
(37, 's1', ''),
(38, 's1', ''),
(39, 's1', ''),
(40, 's1', ''),
(41, 's1', ''),
(42, 's1', ''),
(43, 's1', ''),
(44, 's1', ''),
(45, 's1', ''),
(46, 's1', ''),
(47, 's1', ''),
(48, 's1', ''),
(49, 's1', ''),
(53, 's1', ''),
(54, 's1', ''),
(55, 's1', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_stem`
--

CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_content_stem`
--

INSERT INTO `b_search_content_stem` (`SEARCH_CONTENT_ID`, `LANGUAGE_ID`, `STEM`, `TF`, `PS`) VALUES
(1, 'ru', 1, 0.1192, 1),
(1, 'ru', 2, 0.1889, 191.5),
(1, 'ru', 3, 0.5463, 224.783),
(1, 'ru', 4, 0.1192, 5),
(1, 'ru', 5, 0.1192, 6),
(1, 'ru', 6, 0.2383, 169),
(1, 'ru', 7, 0.1192, 8),
(1, 'ru', 8, 0.515, 268.263),
(1, 'ru', 9, 0.1889, 22.5),
(1, 'ru', 10, 0.1192, 19),
(1, 'ru', 11, 0.1192, 21),
(1, 'ru', 12, 0.1192, 22),
(1, 'ru', 13, 0.1192, 36),
(1, 'ru', 14, 0.1889, 85.5),
(1, 'ru', 15, 0.1192, 38),
(1, 'ru', 16, 0.1192, 39),
(1, 'ru', 17, 0.2383, 287),
(1, 'ru', 18, 0.1889, 150),
(1, 'ru', 19, 0.2383, 136.667),
(1, 'ru', 20, 0.1889, 104),
(1, 'ru', 21, 0.2767, 330),
(1, 'ru', 22, 0.1889, 106),
(1, 'ru', 23, 0.1889, 107),
(1, 'ru', 24, 0.1192, 61),
(1, 'ru', 25, 0.1192, 69),
(1, 'ru', 26, 0.1889, 131),
(1, 'ru', 27, 0.1889, 317),
(1, 'ru', 28, 0.1889, 181),
(1, 'ru', 29, 0.2383, 185.667),
(1, 'ru', 30, 0.1192, 75),
(1, 'ru', 31, 0.1192, 76),
(1, 'ru', 32, 0.1192, 77),
(1, 'ru', 33, 0.1192, 78),
(1, 'ru', 34, 0.3345, 239),
(1, 'ru', 35, 0.1192, 80),
(1, 'ru', 36, 0.1192, 82),
(1, 'ru', 37, 0.1192, 83),
(1, 'ru', 38, 0.1192, 84),
(1, 'ru', 39, 0.1192, 85),
(1, 'ru', 40, 0.1889, 85),
(1, 'ru', 41, 0.1192, 88),
(1, 'ru', 42, 0.1192, 88),
(1, 'ru', 43, 0.1192, 88),
(1, 'ru', 44, 0.1192, 90),
(1, 'ru', 45, 0.1192, 91),
(1, 'ru', 46, 0.1192, 92),
(1, 'ru', 47, 0.2383, 301),
(1, 'ru', 48, 0.1192, 100),
(1, 'ru', 49, 0.1889, 206.5),
(1, 'ru', 50, 0.1192, 109),
(1, 'ru', 51, 0.1192, 110),
(1, 'ru', 52, 0.1192, 111),
(1, 'ru', 53, 0.1192, 112),
(1, 'ru', 54, 0.1192, 113),
(1, 'ru', 55, 0.1192, 114),
(1, 'ru', 56, 0.2383, 288.333),
(1, 'ru', 57, 0.1192, 122),
(1, 'ru', 58, 0.1192, 123),
(1, 'ru', 59, 0.1889, 262),
(1, 'ru', 60, 0.1192, 128),
(1, 'ru', 61, 0.1192, 130),
(1, 'ru', 62, 0.1192, 131),
(1, 'ru', 63, 0.1192, 132),
(1, 'ru', 64, 0.1192, 135),
(1, 'ru', 65, 0.1192, 137),
(1, 'ru', 66, 0.1192, 144),
(1, 'ru', 67, 0.1192, 152),
(1, 'ru', 68, 0.1192, 153),
(1, 'ru', 69, 0.1889, 153),
(1, 'ru', 70, 0.1192, 154),
(1, 'ru', 71, 0.1192, 155),
(1, 'ru', 72, 0.1192, 172),
(1, 'ru', 73, 0.1192, 173),
(1, 'ru', 74, 0.1192, 174),
(1, 'ru', 75, 0.1889, 197.5),
(1, 'ru', 76, 0.1192, 176),
(1, 'ru', 77, 0.1192, 177),
(1, 'ru', 78, 0.1192, 183),
(1, 'ru', 79, 0.1192, 194),
(1, 'ru', 80, 0.1192, 195),
(1, 'ru', 81, 0.1192, 196),
(1, 'ru', 82, 0.1192, 197),
(1, 'ru', 83, 0.1192, 204),
(1, 'ru', 84, 0.1192, 205),
(1, 'ru', 85, 0.1192, 208),
(1, 'ru', 86, 0.2383, 445),
(1, 'ru', 87, 0.1192, 210),
(1, 'ru', 88, 0.1192, 211),
(1, 'ru', 89, 0.1192, 212),
(1, 'ru', 90, 0.1889, 212),
(1, 'ru', 91, 0.1889, 236),
(1, 'ru', 92, 0.1192, 221),
(1, 'ru', 93, 0.1192, 222),
(1, 'ru', 94, 0.1889, 300),
(1, 'ru', 95, 0.1192, 224),
(1, 'ru', 96, 0.1192, 226),
(1, 'ru', 97, 0.1192, 227),
(1, 'ru', 98, 0.1192, 228),
(1, 'ru', 99, 0.1192, 230),
(1, 'ru', 100, 0.1192, 231),
(1, 'ru', 101, 0.1192, 233),
(1, 'ru', 102, 0.1192, 239),
(1, 'ru', 103, 0.1192, 246),
(1, 'ru', 104, 0.1192, 247),
(1, 'ru', 105, 0.1192, 249),
(1, 'ru', 106, 0.1192, 254),
(1, 'ru', 107, 0.1192, 265),
(1, 'ru', 108, 0.1192, 268),
(1, 'ru', 109, 0.1192, 269),
(1, 'ru', 110, 0.2383, 275.667),
(1, 'ru', 111, 0.1889, 277.5),
(1, 'ru', 112, 0.2383, 277.667),
(1, 'ru', 113, 0.2383, 278.667),
(1, 'ru', 114, 0.1192, 275),
(1, 'ru', 115, 0.1192, 278),
(1, 'ru', 116, 0.1192, 280),
(1, 'ru', 117, 0.1192, 281),
(1, 'ru', 118, 0.1192, 282),
(1, 'ru', 119, 0.1192, 287),
(1, 'ru', 120, 0.1192, 288),
(1, 'ru', 121, 0.1192, 297),
(1, 'ru', 122, 0.1192, 306),
(1, 'ru', 123, 0.1192, 307),
(1, 'ru', 124, 0.1192, 308),
(1, 'ru', 125, 0.1889, 344.5),
(1, 'ru', 126, 0.1192, 310),
(1, 'ru', 127, 0.1192, 311),
(1, 'ru', 128, 0.1192, 313),
(1, 'ru', 129, 0.1192, 314),
(1, 'ru', 130, 0.1192, 315),
(1, 'ru', 131, 0.1192, 316),
(1, 'ru', 132, 0.1192, 318),
(1, 'ru', 133, 0.1192, 319),
(1, 'ru', 134, 0.1192, 320),
(1, 'ru', 135, 0.1192, 326),
(1, 'ru', 136, 0.2383, 343.667),
(1, 'ru', 137, 0.1192, 336),
(1, 'ru', 138, 0.1889, 346.5),
(1, 'ru', 139, 0.1889, 347.5),
(1, 'ru', 140, 0.1889, 348.5),
(1, 'ru', 141, 0.2767, 398.25),
(1, 'ru', 142, 0.1192, 341),
(1, 'ru', 143, 0.1192, 343),
(1, 'ru', 144, 0.1192, 346),
(1, 'ru', 145, 0.1192, 348),
(1, 'ru', 146, 0.1192, 349),
(1, 'ru', 147, 0.1192, 350),
(1, 'ru', 148, 0.1192, 352),
(1, 'ru', 149, 0.1192, 353),
(1, 'ru', 150, 0.1192, 355),
(1, 'ru', 151, 0.2767, 421.25),
(1, 'ru', 152, 0.1192, 372),
(1, 'ru', 153, 0.2383, 499.333),
(1, 'ru', 154, 0.1192, 375),
(1, 'ru', 155, 0.1192, 376),
(1, 'ru', 156, 0.1192, 378),
(1, 'ru', 157, 0.1192, 379),
(1, 'ru', 158, 0.1192, 382),
(1, 'ru', 159, 0.2383, 438.667),
(1, 'ru', 160, 0.1889, 426.5),
(1, 'ru', 161, 0.1192, 405),
(1, 'ru', 162, 0.1889, 422.5),
(1, 'ru', 163, 0.1889, 442.5),
(1, 'ru', 164, 0.1192, 417),
(1, 'ru', 165, 0.2767, 470.25),
(1, 'ru', 166, 0.1192, 422),
(1, 'ru', 167, 0.1192, 423),
(1, 'ru', 168, 0.1192, 424),
(1, 'ru', 169, 0.2767, 477),
(1, 'ru', 170, 0.1192, 437),
(1, 'ru', 171, 0.1192, 438),
(1, 'ru', 172, 0.1192, 439),
(1, 'ru', 173, 0.1192, 440),
(1, 'ru', 174, 0.1192, 443),
(1, 'ru', 175, 0.1192, 449),
(1, 'ru', 176, 0.2383, 492.333),
(1, 'ru', 177, 0.1192, 452),
(1, 'ru', 178, 0.1192, 454),
(1, 'ru', 179, 0.1192, 458),
(1, 'ru', 180, 0.1192, 460),
(1, 'ru', 181, 0.1192, 461),
(1, 'ru', 182, 0.1889, 469.5),
(1, 'ru', 183, 0.1889, 512.5),
(1, 'ru', 184, 0.1192, 475),
(1, 'ru', 185, 0.1192, 476),
(1, 'ru', 186, 0.1192, 481),
(1, 'ru', 187, 0.1192, 482),
(1, 'ru', 188, 0.1192, 485),
(1, 'ru', 189, 0.1192, 492),
(1, 'ru', 190, 0.1192, 493),
(1, 'ru', 191, 0.1192, 498),
(1, 'ru', 192, 0.1192, 500),
(1, 'ru', 193, 0.1889, 510.5),
(1, 'ru', 194, 0.1192, 503),
(1, 'ru', 195, 0.1192, 504),
(1, 'ru', 196, 0.1192, 506),
(1, 'ru', 197, 0.1192, 507),
(1, 'ru', 198, 0.1192, 509),
(1, 'ru', 199, 0.1192, 512),
(1, 'ru', 200, 0.1889, 535.5),
(1, 'ru', 201, 0.1192, 522),
(1, 'ru', 202, 0.1192, 525),
(1, 'ru', 203, 0.1192, 529),
(1, 'ru', 204, 0.1192, 530),
(1, 'ru', 205, 0.1192, 531),
(1, 'ru', 206, 0.1192, 544),
(1, 'ru', 207, 0.1192, 547),
(1, 'ru', 208, 0.1192, 549),
(1, 'ru', 209, 0.1192, 552),
(1, 'ru', 210, 0.1192, 553),
(1, 'ru', 211, 0.1192, 553),
(1, 'ru', 212, 0.1192, 557),
(1, 'ru', 213, 0.1192, 559),
(1, 'ru', 214, 0.1192, 560),
(1, 'ru', 215, 0.1192, 561),
(1, 'ru', 216, 0.1192, 563),
(1, 'ru', 217, 0.1192, 567),
(1, 'ru', 218, 0.1192, 568),
(2, 'ru', 2, 0.1307, 3),
(2, 'ru', 3, 0.4837, 136),
(2, 'ru', 8, 0.2614, 77.3333),
(2, 'ru', 15, 0.1307, 51),
(2, 'ru', 16, 0.2072, 52),
(2, 'ru', 21, 0.1307, 249),
(2, 'ru', 23, 0.1307, 45),
(2, 'ru', 24, 0.1307, 23),
(2, 'ru', 26, 0.1307, 157),
(2, 'ru', 27, 0.1307, 135),
(2, 'ru', 29, 0.2072, 164.5),
(2, 'ru', 31, 0.1307, 221),
(2, 'ru', 34, 0.2614, 119.667),
(2, 'ru', 41, 0.1307, 49),
(2, 'ru', 42, 0.1307, 49),
(2, 'ru', 43, 0.1307, 49),
(2, 'ru', 44, 0.2614, 96.6667),
(2, 'ru', 47, 0.3669, 115.333),
(2, 'ru', 52, 0.2072, 8),
(2, 'ru', 53, 0.2072, 23.5),
(2, 'ru', 56, 0.2072, 102),
(2, 'ru', 74, 0.1307, 160),
(2, 'ru', 75, 0.1307, 163),
(2, 'ru', 80, 0.1307, 251),
(2, 'ru', 86, 0.3035, 133),
(2, 'ru', 90, 0.1307, 67),
(2, 'ru', 93, 0.1307, 115),
(2, 'ru', 109, 0.1307, 112),
(2, 'ru', 115, 0.1307, 234),
(2, 'ru', 118, 0.1307, 175),
(2, 'ru', 122, 0.1307, 242),
(2, 'ru', 125, 0.1307, 9),
(2, 'ru', 126, 0.1307, 269),
(2, 'ru', 128, 0.1307, 154),
(2, 'ru', 133, 0.1307, 142),
(2, 'ru', 134, 0.3379, 187.8),
(2, 'ru', 136, 0.1307, 70),
(2, 'ru', 141, 0.1307, 259),
(2, 'ru', 151, 0.2072, 103),
(2, 'ru', 155, 0.3379, 81.8),
(2, 'ru', 163, 0.1307, 84),
(2, 'ru', 189, 0.1307, 186),
(2, 'ru', 200, 0.2072, 107),
(2, 'ru', 213, 0.1307, 199),
(2, 'ru', 214, 0.1307, 248),
(2, 'ru', 216, 0.1307, 139),
(2, 'ru', 218, 0.1307, 263),
(2, 'ru', 219, 0.1307, 1),
(2, 'ru', 220, 0.1307, 5),
(2, 'ru', 221, 0.1307, 7),
(2, 'ru', 222, 0.1307, 8),
(2, 'ru', 223, 0.1307, 19),
(2, 'ru', 224, 0.1307, 27),
(2, 'ru', 225, 0.1307, 28),
(2, 'ru', 226, 0.2072, 148),
(2, 'ru', 227, 0.2614, 105),
(2, 'ru', 228, 0.2072, 138.5),
(2, 'ru', 229, 0.1307, 34),
(2, 'ru', 230, 0.1307, 35),
(2, 'ru', 231, 0.1307, 47),
(2, 'ru', 232, 0.1307, 48),
(2, 'ru', 233, 0.1307, 52),
(2, 'ru', 234, 0.1307, 54),
(2, 'ru', 235, 0.2072, 170.5),
(2, 'ru', 236, 0.2072, 134.5),
(2, 'ru', 237, 0.1307, 63),
(2, 'ru', 238, 0.1307, 68),
(2, 'ru', 239, 0.1307, 72),
(2, 'ru', 240, 0.1307, 80),
(2, 'ru', 241, 0.1307, 81),
(2, 'ru', 242, 0.1307, 85),
(2, 'ru', 243, 0.2072, 116),
(2, 'ru', 244, 0.1307, 85),
(2, 'ru', 245, 0.1307, 96),
(2, 'ru', 246, 0.1307, 98),
(2, 'ru', 247, 0.2614, 118),
(2, 'ru', 248, 0.1307, 105),
(2, 'ru', 249, 0.1307, 105),
(2, 'ru', 250, 0.1307, 105),
(2, 'ru', 251, 0.1307, 108),
(2, 'ru', 252, 0.1307, 112),
(2, 'ru', 253, 0.1307, 112),
(2, 'ru', 254, 0.2614, 186.333),
(2, 'ru', 255, 0.1307, 127),
(2, 'ru', 256, 0.1307, 130),
(2, 'ru', 257, 0.1307, 131),
(2, 'ru', 258, 0.1307, 132),
(2, 'ru', 259, 0.1307, 134),
(2, 'ru', 260, 0.1307, 138),
(2, 'ru', 261, 0.1307, 140),
(2, 'ru', 262, 0.1307, 143),
(2, 'ru', 263, 0.1307, 144),
(2, 'ru', 264, 0.2072, 156.5),
(2, 'ru', 265, 0.1307, 155),
(2, 'ru', 266, 0.1307, 162),
(2, 'ru', 267, 0.1307, 164),
(2, 'ru', 268, 0.1307, 166),
(2, 'ru', 269, 0.1307, 168),
(2, 'ru', 270, 0.1307, 169),
(2, 'ru', 271, 0.1307, 172),
(2, 'ru', 272, 0.1307, 173),
(2, 'ru', 273, 0.1307, 174),
(2, 'ru', 274, 0.1307, 176),
(2, 'ru', 275, 0.1307, 177),
(2, 'ru', 276, 0.1307, 178),
(2, 'ru', 277, 0.1307, 179),
(2, 'ru', 278, 0.1307, 180),
(2, 'ru', 279, 0.1307, 188),
(2, 'ru', 280, 0.2614, 225.667),
(2, 'ru', 281, 0.1307, 192),
(2, 'ru', 282, 0.1307, 193),
(2, 'ru', 283, 0.1307, 196),
(2, 'ru', 284, 0.1307, 197),
(2, 'ru', 285, 0.1307, 198),
(2, 'ru', 286, 0.2614, 235.667),
(2, 'ru', 287, 0.1307, 210),
(2, 'ru', 288, 0.1307, 211),
(2, 'ru', 289, 0.1307, 220),
(2, 'ru', 290, 0.1307, 223),
(2, 'ru', 291, 0.2072, 245.5),
(2, 'ru', 292, 0.1307, 228),
(2, 'ru', 293, 0.1307, 229),
(2, 'ru', 294, 0.1307, 230),
(2, 'ru', 295, 0.1307, 231),
(2, 'ru', 296, 0.1307, 232),
(2, 'ru', 297, 0.1307, 243),
(2, 'ru', 298, 0.1307, 246),
(2, 'ru', 299, 0.1307, 262),
(2, 'ru', 300, 0.1307, 264),
(2, 'ru', 301, 0.1307, 268),
(2, 'ru', 302, 0.1307, 277),
(2, 'ru', 303, 0.1307, 279),
(2, 'ru', 304, 0.1307, 280),
(2, 'ru', 305, 0.1307, 281),
(2, 'ru', 306, 0.1307, 282),
(2, 'ru', 307, 0.1307, 283),
(2, 'ru', 308, 0.1307, 284),
(2, 'ru', 309, 0.1307, 288),
(2, 'ru', 310, 0.1307, 289),
(2, 'ru', 311, 0.1307, 290),
(2, 'ru', 312, 0.1307, 291),
(2, 'ru', 313, 0.1307, 292),
(2, 'ru', 314, 0.1307, 294),
(2, 'ru', 315, 0.1307, 295),
(3, 'ru', 3, 0.2012, 68),
(3, 'ru', 7, 0.2012, 197.5),
(3, 'ru', 8, 0.4698, 140),
(3, 'ru', 9, 0.2539, 128.667),
(3, 'ru', 14, 0.127, 82),
(3, 'ru', 17, 0.127, 226),
(3, 'ru', 24, 0.127, 68),
(3, 'ru', 48, 0.127, 281),
(3, 'ru', 58, 0.127, 271),
(3, 'ru', 73, 0.127, 248),
(3, 'ru', 109, 0.127, 27),
(3, 'ru', 122, 0.127, 259),
(3, 'ru', 125, 0.2012, 164.5),
(3, 'ru', 130, 0.127, 125),
(3, 'ru', 133, 0.127, 279),
(3, 'ru', 136, 0.127, 287),
(3, 'ru', 143, 0.3282, 104.4),
(3, 'ru', 155, 0.2539, 141.333),
(3, 'ru', 208, 0.127, 249),
(3, 'ru', 213, 0.127, 252),
(3, 'ru', 260, 0.127, 278),
(3, 'ru', 264, 0.3564, 160.167),
(3, 'ru', 284, 0.127, 251),
(3, 'ru', 291, 0.127, 181),
(3, 'ru', 316, 0.127, 1),
(3, 'ru', 317, 0.127, 2),
(3, 'ru', 318, 0.127, 3),
(3, 'ru', 319, 0.127, 4),
(3, 'ru', 320, 0.3282, 58.6),
(3, 'ru', 321, 0.2012, 69),
(3, 'ru', 322, 0.2012, 70),
(3, 'ru', 323, 0.127, 9),
(3, 'ru', 324, 0.2012, 9),
(3, 'ru', 325, 0.127, 10),
(3, 'ru', 326, 0.127, 11),
(3, 'ru', 327, 0.127, 12),
(3, 'ru', 328, 0.3282, 91.4),
(3, 'ru', 329, 0.4392, 135.9),
(3, 'ru', 330, 0.2012, 54.5),
(3, 'ru', 331, 0.3564, 152.833),
(3, 'ru', 332, 0.4392, 157.7),
(3, 'ru', 333, 0.2012, 81.5),
(3, 'ru', 334, 0.127, 28),
(3, 'ru', 335, 0.2012, 28),
(3, 'ru', 336, 0.127, 29),
(3, 'ru', 337, 0.127, 30),
(3, 'ru', 338, 0.2539, 59.3333),
(3, 'ru', 339, 0.2948, 71),
(3, 'ru', 340, 0.127, 35),
(3, 'ru', 341, 0.2948, 195.5),
(3, 'ru', 342, 0.127, 39),
(3, 'ru', 343, 0.127, 40),
(3, 'ru', 344, 0.2012, 40),
(3, 'ru', 345, 0.127, 41),
(3, 'ru', 346, 0.127, 48),
(3, 'ru', 347, 0.127, 50),
(3, 'ru', 348, 0.127, 51),
(3, 'ru', 349, 0.2012, 175),
(3, 'ru', 350, 0.127, 54),
(3, 'ru', 351, 0.127, 55),
(3, 'ru', 352, 0.127, 61),
(3, 'ru', 353, 0.127, 61),
(3, 'ru', 354, 0.127, 62),
(3, 'ru', 355, 0.127, 63),
(3, 'ru', 356, 0.2539, 157),
(3, 'ru', 357, 0.2012, 91.5),
(3, 'ru', 358, 0.2012, 123),
(3, 'ru', 359, 0.127, 79),
(3, 'ru', 360, 0.127, 79),
(3, 'ru', 361, 0.127, 79),
(3, 'ru', 362, 0.127, 80),
(3, 'ru', 363, 0.127, 81),
(3, 'ru', 364, 0.127, 87),
(3, 'ru', 365, 0.2012, 108.5),
(3, 'ru', 366, 0.127, 99),
(3, 'ru', 367, 0.127, 100),
(3, 'ru', 368, 0.127, 101),
(3, 'ru', 369, 0.127, 102),
(3, 'ru', 370, 0.127, 106),
(3, 'ru', 371, 0.127, 109),
(3, 'ru', 372, 0.2948, 195.25),
(3, 'ru', 373, 0.2012, 167),
(3, 'ru', 374, 0.127, 117),
(3, 'ru', 375, 0.127, 126),
(3, 'ru', 376, 0.127, 127),
(3, 'ru', 377, 0.2012, 127),
(3, 'ru', 378, 0.127, 128),
(3, 'ru', 379, 0.127, 129),
(3, 'ru', 380, 0.3809, 182.857),
(3, 'ru', 381, 0.127, 133),
(3, 'ru', 382, 0.127, 133),
(3, 'ru', 383, 0.127, 134),
(3, 'ru', 384, 0.127, 135),
(3, 'ru', 385, 0.2012, 179.5),
(3, 'ru', 386, 0.2012, 179.5),
(3, 'ru', 387, 0.127, 174),
(3, 'ru', 388, 0.127, 175),
(3, 'ru', 389, 0.127, 176),
(3, 'ru', 390, 0.127, 179),
(3, 'ru', 391, 0.127, 198),
(3, 'ru', 392, 0.127, 199),
(3, 'ru', 393, 0.2012, 246),
(3, 'ru', 394, 0.127, 206),
(3, 'ru', 395, 0.2012, 206),
(3, 'ru', 396, 0.127, 207),
(3, 'ru', 397, 0.127, 208),
(3, 'ru', 398, 0.127, 210),
(3, 'ru', 399, 0.127, 215),
(3, 'ru', 400, 0.127, 221),
(3, 'ru', 401, 0.2012, 221),
(3, 'ru', 402, 0.127, 222),
(3, 'ru', 403, 0.127, 223),
(3, 'ru', 404, 0.2012, 233.5),
(3, 'ru', 405, 0.127, 237),
(3, 'ru', 406, 0.2012, 268),
(3, 'ru', 407, 0.127, 247),
(3, 'ru', 408, 0.127, 250),
(3, 'ru', 409, 0.127, 254),
(3, 'ru', 410, 0.127, 255),
(3, 'ru', 411, 0.127, 256),
(3, 'ru', 412, 0.127, 256),
(3, 'ru', 413, 0.127, 257),
(3, 'ru', 414, 0.127, 258),
(3, 'ru', 415, 0.127, 260),
(3, 'ru', 416, 0.127, 262),
(3, 'ru', 417, 0.127, 265),
(3, 'ru', 418, 0.127, 267),
(3, 'ru', 419, 0.127, 268),
(3, 'ru', 420, 0.127, 272),
(3, 'ru', 421, 0.127, 273),
(3, 'ru', 422, 0.127, 274),
(3, 'ru', 423, 0.127, 275),
(3, 'ru', 424, 0.127, 277),
(3, 'ru', 425, 0.127, 283),
(3, 'ru', 426, 0.127, 288),
(3, 'ru', 427, 0.127, 291),
(3, 'ru', 428, 0.127, 294),
(3, 'ru', 429, 0.127, 295),
(4, 'ru', 2, 0.1256, 116),
(4, 'ru', 3, 0.4504, 201.454),
(4, 'ru', 10, 0.1256, 140),
(4, 'ru', 20, 0.1256, 139),
(4, 'ru', 21, 0.1991, 254.5),
(4, 'ru', 22, 0.1256, 141),
(4, 'ru', 23, 0.1256, 142),
(4, 'ru', 27, 0.1256, 262),
(4, 'ru', 30, 0.1256, 71),
(4, 'ru', 32, 0.1256, 155),
(4, 'ru', 34, 0.1991, 146),
(4, 'ru', 36, 0.1256, 148),
(4, 'ru', 47, 0.3527, 104.667),
(4, 'ru', 49, 0.1256, 161),
(4, 'ru', 53, 0.1991, 204),
(4, 'ru', 57, 0.1256, 218),
(4, 'ru', 65, 0.1256, 264),
(4, 'ru', 72, 0.1256, 178),
(4, 'ru', 73, 0.1991, 261.5),
(4, 'ru', 86, 0.4908, 177.071),
(4, 'ru', 88, 0.1256, 34),
(4, 'ru', 89, 0.1256, 67),
(4, 'ru', 90, 0.1991, 67),
(4, 'ru', 93, 0.1256, 113),
(4, 'ru', 106, 0.1991, 136.5),
(4, 'ru', 118, 0.1256, 315),
(4, 'ru', 125, 0.1256, 49),
(4, 'ru', 129, 0.1256, 44),
(4, 'ru', 130, 0.1256, 117),
(4, 'ru', 131, 0.1256, 120),
(4, 'ru', 132, 0.1256, 118),
(4, 'ru', 133, 0.1991, 162.5),
(4, 'ru', 134, 0.2513, 228.333),
(4, 'ru', 141, 0.1991, 137.5),
(4, 'ru', 153, 0.1256, 39),
(4, 'ru', 155, 0.2917, 71.5),
(4, 'ru', 190, 0.1256, 265),
(4, 'ru', 194, 0.1991, 167),
(4, 'ru', 208, 0.1256, 317),
(4, 'ru', 213, 0.2513, 124),
(4, 'ru', 216, 0.2513, 228),
(4, 'ru', 221, 0.1991, 146.5),
(4, 'ru', 223, 0.1256, 369),
(4, 'ru', 235, 0.1256, 358),
(4, 'ru', 247, 0.1256, 112),
(4, 'ru', 254, 0.1256, 184),
(4, 'ru', 255, 0.1256, 107),
(4, 'ru', 256, 0.1256, 341),
(4, 'ru', 257, 0.1991, 98.5),
(4, 'ru', 258, 0.1256, 125),
(4, 'ru', 260, 0.1991, 133.5),
(4, 'ru', 261, 0.1256, 190),
(4, 'ru', 265, 0.1256, 5),
(4, 'ru', 280, 0.3769, 186.857),
(4, 'ru', 284, 0.2513, 86.6667),
(4, 'ru', 286, 0.1256, 185),
(4, 'ru', 287, 0.2513, 158.667),
(4, 'ru', 291, 0.1256, 207),
(4, 'ru', 301, 0.1256, 304),
(4, 'ru', 322, 0.1256, 350),
(4, 'ru', 328, 0.1256, 324),
(4, 'ru', 331, 0.1256, 122),
(4, 'ru', 390, 0.1256, 191),
(4, 'ru', 426, 0.1256, 276),
(4, 'ru', 430, 0.1991, 1.5),
(4, 'ru', 431, 0.2917, 133.25),
(4, 'ru', 432, 0.1991, 70.5),
(4, 'ru', 433, 0.1256, 10),
(4, 'ru', 434, 0.1991, 136.5),
(4, 'ru', 435, 0.1256, 17),
(4, 'ru', 436, 0.1991, 92.5),
(4, 'ru', 437, 0.1256, 18),
(4, 'ru', 438, 0.2917, 141.75),
(4, 'ru', 439, 0.1256, 21),
(4, 'ru', 440, 0.1256, 23),
(4, 'ru', 441, 0.1256, 36),
(4, 'ru', 442, 0.1256, 41),
(4, 'ru', 443, 0.1256, 45),
(4, 'ru', 444, 0.1256, 47),
(4, 'ru', 445, 0.1256, 50),
(4, 'ru', 446, 0.1991, 70.5),
(4, 'ru', 447, 0.2513, 126.667),
(4, 'ru', 448, 0.1256, 59),
(4, 'ru', 449, 0.1256, 64),
(4, 'ru', 450, 0.1256, 72),
(4, 'ru', 451, 0.1256, 73),
(4, 'ru', 452, 0.1256, 75),
(4, 'ru', 453, 0.1256, 77),
(4, 'ru', 454, 0.1256, 88),
(4, 'ru', 455, 0.1256, 90),
(4, 'ru', 456, 0.1256, 94),
(4, 'ru', 457, 0.1991, 147),
(4, 'ru', 458, 0.1256, 97),
(4, 'ru', 459, 0.1256, 98),
(4, 'ru', 460, 0.1256, 109),
(4, 'ru', 461, 0.1256, 115),
(4, 'ru', 462, 0.1256, 115),
(4, 'ru', 463, 0.1256, 123),
(4, 'ru', 464, 0.1256, 124),
(4, 'ru', 465, 0.1256, 135),
(4, 'ru', 466, 0.1256, 136),
(4, 'ru', 467, 0.1256, 158),
(4, 'ru', 468, 0.1256, 160),
(4, 'ru', 469, 0.1256, 166),
(4, 'ru', 470, 0.1256, 168),
(4, 'ru', 471, 0.2513, 229.667),
(4, 'ru', 472, 0.1991, 242.5),
(4, 'ru', 473, 0.1256, 181),
(4, 'ru', 474, 0.2513, 232),
(4, 'ru', 475, 0.1256, 187),
(4, 'ru', 476, 0.1991, 187),
(4, 'ru', 477, 0.1256, 192),
(4, 'ru', 478, 0.1991, 272),
(4, 'ru', 479, 0.1256, 209),
(4, 'ru', 480, 0.1256, 211),
(4, 'ru', 481, 0.1256, 217),
(4, 'ru', 482, 0.1256, 225),
(4, 'ru', 483, 0.1256, 226),
(4, 'ru', 484, 0.1991, 241.5),
(4, 'ru', 485, 0.1256, 229),
(4, 'ru', 486, 0.1256, 230),
(4, 'ru', 487, 0.1256, 231),
(4, 'ru', 488, 0.1256, 235),
(4, 'ru', 489, 0.1256, 236),
(4, 'ru', 490, 0.1256, 239),
(4, 'ru', 491, 0.1256, 242),
(4, 'ru', 492, 0.1256, 251),
(4, 'ru', 493, 0.1256, 252),
(4, 'ru', 494, 0.1256, 255),
(4, 'ru', 495, 0.1256, 258),
(4, 'ru', 496, 0.1256, 272),
(4, 'ru', 497, 0.1256, 274),
(4, 'ru', 498, 0.1256, 277),
(4, 'ru', 499, 0.1256, 278),
(4, 'ru', 500, 0.1256, 282),
(4, 'ru', 501, 0.1256, 284),
(4, 'ru', 502, 0.1256, 287),
(4, 'ru', 503, 0.1256, 289),
(4, 'ru', 504, 0.1256, 292),
(4, 'ru', 505, 0.1256, 293),
(4, 'ru', 506, 0.1991, 321.5),
(4, 'ru', 507, 0.1256, 300),
(4, 'ru', 508, 0.1256, 302),
(4, 'ru', 509, 0.1256, 314),
(4, 'ru', 510, 0.1256, 318),
(4, 'ru', 511, 0.2513, 346),
(4, 'ru', 512, 0.1256, 320),
(4, 'ru', 513, 0.1256, 323),
(4, 'ru', 514, 0.1256, 327),
(4, 'ru', 515, 0.1256, 328),
(4, 'ru', 516, 0.1256, 329),
(4, 'ru', 517, 0.1256, 331),
(4, 'ru', 518, 0.1256, 333),
(4, 'ru', 519, 0.1256, 342),
(4, 'ru', 520, 0.1256, 345),
(4, 'ru', 521, 0.1256, 346),
(4, 'ru', 522, 0.1256, 348),
(4, 'ru', 523, 0.1256, 349),
(4, 'ru', 524, 0.1256, 352),
(4, 'ru', 525, 0.1256, 353),
(4, 'ru', 526, 0.1256, 355),
(4, 'ru', 527, 0.1256, 356),
(4, 'ru', 528, 0.1256, 371),
(4, 'ru', 529, 0.1256, 373),
(4, 'ru', 530, 0.1256, 377),
(5, 'ru', 531, 0.2314, 1),
(6, 'ru', 67, 0.1832, 5),
(6, 'ru', 122, 0.1832, 79),
(6, 'ru', 189, 0.1832, 17),
(6, 'ru', 264, 0.2903, 39.5),
(6, 'ru', 283, 0.1832, 12),
(6, 'ru', 433, 0.2903, 43),
(6, 'ru', 463, 0.1832, 25),
(6, 'ru', 532, 0.1832, 1),
(6, 'ru', 533, 0.1832, 3),
(6, 'ru', 534, 0.1832, 6),
(6, 'ru', 535, 0.1832, 13),
(6, 'ru', 536, 0.2903, 26),
(6, 'ru', 537, 0.2903, 26.5),
(6, 'ru', 538, 0.1832, 18),
(6, 'ru', 539, 0.1832, 20),
(6, 'ru', 540, 0.1832, 21),
(6, 'ru', 541, 0.1832, 23),
(6, 'ru', 542, 0.1832, 27),
(6, 'ru', 543, 0.1832, 28),
(6, 'ru', 544, 0.2903, 36),
(6, 'ru', 545, 0.1832, 36),
(6, 'ru', 546, 0.1832, 39),
(6, 'ru', 547, 0.1832, 41),
(6, 'ru', 548, 0.1832, 42),
(6, 'ru', 549, 0.2903, 42),
(6, 'ru', 550, 0.1832, 50),
(6, 'ru', 551, 0.1832, 52),
(6, 'ru', 552, 0.1832, 53),
(6, 'ru', 553, 0.1832, 56),
(6, 'ru', 554, 0.1832, 57),
(6, 'ru', 555, 0.2903, 69),
(6, 'ru', 556, 0.1832, 59),
(6, 'ru', 557, 0.1832, 60),
(6, 'ru', 558, 0.1832, 61),
(6, 'ru', 559, 0.1832, 62),
(6, 'ru', 560, 0.1832, 63),
(6, 'ru', 561, 0.1832, 77),
(7, 'ru', 562, 0.2314, 1),
(7, 'ru', 563, 0.2314, 2),
(8, 'ru', 3, 0.1892, 14),
(8, 'ru', 16, 0.2999, 52),
(8, 'ru', 47, 0.1892, 12),
(8, 'ru', 51, 0.1892, 9),
(8, 'ru', 173, 0.1892, 29),
(8, 'ru', 219, 0.1892, 2),
(8, 'ru', 280, 0.4393, 30),
(8, 'ru', 345, 0.1892, 70),
(8, 'ru', 347, 0.1892, 8),
(8, 'ru', 504, 0.1892, 24),
(8, 'ru', 563, 0.1892, 51),
(8, 'ru', 564, 0.1892, 1),
(8, 'ru', 565, 0.2999, 12.5),
(8, 'ru', 566, 0.1892, 6),
(8, 'ru', 567, 0.1892, 10),
(8, 'ru', 568, 0.1892, 21),
(8, 'ru', 569, 0.4393, 50.75),
(8, 'ru', 570, 0.1892, 28),
(8, 'ru', 571, 0.1892, 31),
(8, 'ru', 572, 0.1892, 33),
(8, 'ru', 573, 0.1892, 42),
(8, 'ru', 574, 0.1892, 43),
(8, 'ru', 575, 0.1892, 44),
(8, 'ru', 576, 0.1892, 47),
(8, 'ru', 577, 0.1892, 59),
(8, 'ru', 578, 0.3784, 62.6667),
(8, 'ru', 579, 0.1892, 61),
(8, 'ru', 580, 0.1892, 64),
(8, 'ru', 581, 0.1892, 66),
(9, 'ru', 3, 0.3173, 9),
(9, 'ru', 134, 0.2514, 102),
(9, 'ru', 155, 0.1586, 121),
(9, 'ru', 187, 0.1586, 90),
(9, 'ru', 219, 0.1586, 120),
(9, 'ru', 227, 0.1586, 24),
(9, 'ru', 257, 0.1586, 15),
(9, 'ru', 269, 0.1586, 107),
(9, 'ru', 280, 0.1586, 1),
(9, 'ru', 331, 0.1586, 25),
(9, 'ru', 345, 0.2514, 109),
(9, 'ru', 357, 0.1586, 73),
(9, 'ru', 511, 0.1586, 7),
(9, 'ru', 569, 0.1586, 150),
(9, 'ru', 577, 0.1586, 153),
(9, 'ru', 578, 0.2514, 152.5),
(9, 'ru', 582, 0.1586, 2),
(9, 'ru', 583, 0.2514, 9.5),
(9, 'ru', 584, 0.1586, 5),
(9, 'ru', 585, 0.1586, 6),
(9, 'ru', 586, 0.3173, 10.6667),
(9, 'ru', 587, 0.1586, 10),
(9, 'ru', 588, 0.1586, 18),
(9, 'ru', 589, 0.1586, 19),
(9, 'ru', 590, 0.1586, 20),
(9, 'ru', 591, 0.1586, 21),
(9, 'ru', 592, 0.1586, 22),
(9, 'ru', 593, 0.2514, 47),
(9, 'ru', 594, 0.1586, 26),
(9, 'ru', 595, 0.1586, 27),
(9, 'ru', 596, 0.1586, 28),
(9, 'ru', 597, 0.1586, 29),
(9, 'ru', 598, 0.1586, 30),
(9, 'ru', 599, 0.1586, 31),
(9, 'ru', 600, 0.1586, 63),
(9, 'ru', 601, 0.1586, 64),
(9, 'ru', 602, 0.1586, 72),
(9, 'ru', 603, 0.2514, 100),
(9, 'ru', 604, 0.1586, 75),
(9, 'ru', 605, 0.2514, 110),
(9, 'ru', 606, 0.1586, 91),
(9, 'ru', 607, 0.1586, 98),
(9, 'ru', 608, 0.1586, 99),
(9, 'ru', 609, 0.1586, 106),
(9, 'ru', 610, 0.1586, 108),
(9, 'ru', 611, 0.1586, 109),
(9, 'ru', 612, 0.1586, 110),
(9, 'ru', 613, 0.1586, 111),
(9, 'ru', 614, 0.1586, 112),
(9, 'ru', 615, 0.1586, 113),
(9, 'ru', 616, 0.1586, 114),
(9, 'ru', 617, 0.1586, 115),
(9, 'ru', 618, 0.1586, 116),
(9, 'ru', 619, 0.1586, 117),
(9, 'ru', 620, 0.1586, 118),
(9, 'ru', 621, 0.1586, 119),
(9, 'ru', 622, 0.1586, 122),
(9, 'ru', 623, 0.1586, 123),
(9, 'ru', 624, 0.1586, 124),
(9, 'ru', 625, 0.1586, 125),
(9, 'ru', 626, 0.1586, 127),
(9, 'ru', 627, 0.1586, 142),
(9, 'ru', 628, 0.1586, 152),
(9, 'ru', 629, 0.1586, 155),
(9, 'ru', 630, 0.1586, 156),
(9, 'ru', 631, 0.1586, 157),
(9, 'ru', 632, 0.1586, 158),
(9, 'ru', 633, 0.1586, 164),
(10, 'ru', 2, 0.2314, 2),
(10, 'ru', 558, 0.2314, 1),
(11, 'ru', 634, 0.2314, 1),
(12, 'ru', 29, 0.2314, 1),
(12, 'ru', 544, 0.2314, 2),
(13, 'ru', 3, 0.3967, 136.571),
(13, 'ru', 15, 0.1322, 147),
(13, 'ru', 17, 0.2096, 133.5),
(13, 'ru', 27, 0.2096, 112),
(13, 'ru', 31, 0.1322, 166),
(13, 'ru', 32, 0.2096, 48),
(13, 'ru', 49, 0.2645, 138.667),
(13, 'ru', 58, 0.1322, 179),
(13, 'ru', 59, 0.1322, 180),
(13, 'ru', 73, 0.1322, 237),
(13, 'ru', 79, 0.2645, 97.6667),
(13, 'ru', 80, 0.3418, 104.6),
(13, 'ru', 86, 0.2096, 102),
(13, 'ru', 93, 0.1322, 112),
(13, 'ru', 98, 0.1322, 41),
(13, 'ru', 107, 0.1322, 39),
(13, 'ru', 128, 0.1322, 197),
(13, 'ru', 155, 0.2645, 33.6667),
(13, 'ru', 179, 0.1322, 172),
(13, 'ru', 190, 0.1322, 148),
(13, 'ru', 191, 0.2645, 127),
(13, 'ru', 192, 0.1322, 201),
(13, 'ru', 197, 0.1322, 186),
(13, 'ru', 201, 0.2096, 170),
(13, 'ru', 211, 0.1322, 19),
(13, 'ru', 219, 0.1322, 159),
(13, 'ru', 226, 0.1322, 124),
(13, 'ru', 228, 0.2096, 166.5),
(13, 'ru', 257, 0.1322, 18),
(13, 'ru', 268, 0.1322, 9),
(13, 'ru', 269, 0.4393, 134.111),
(13, 'ru', 272, 0.1322, 122),
(13, 'ru', 277, 0.1322, 143),
(13, 'ru', 282, 0.2096, 78),
(13, 'ru', 288, 0.1322, 165),
(13, 'ru', 346, 0.1322, 236),
(13, 'ru', 347, 0.1322, 66),
(13, 'ru', 431, 0.1322, 93),
(13, 'ru', 478, 0.1322, 14),
(13, 'ru', 499, 0.1322, 116),
(13, 'ru', 540, 0.2096, 75),
(13, 'ru', 544, 0.1322, 62),
(13, 'ru', 568, 0.1322, 16),
(13, 'ru', 570, 0.1322, 182),
(13, 'ru', 635, 0.1322, 1),
(13, 'ru', 636, 0.2096, 30.5),
(13, 'ru', 637, 0.1322, 4),
(13, 'ru', 638, 0.1322, 5),
(13, 'ru', 639, 0.1322, 7),
(13, 'ru', 640, 0.1322, 20),
(13, 'ru', 641, 0.1322, 25),
(13, 'ru', 642, 0.2645, 96.6667),
(13, 'ru', 643, 0.1322, 32),
(13, 'ru', 644, 0.1322, 35),
(13, 'ru', 645, 0.1322, 38),
(13, 'ru', 646, 0.1322, 51),
(13, 'ru', 647, 0.1322, 52),
(13, 'ru', 648, 0.1322, 53),
(13, 'ru', 649, 0.1322, 61),
(13, 'ru', 650, 0.2096, 75),
(13, 'ru', 651, 0.1322, 72),
(13, 'ru', 652, 0.2096, 75.5),
(13, 'ru', 653, 0.2096, 152),
(13, 'ru', 654, 0.1322, 78),
(13, 'ru', 655, 0.1322, 79),
(13, 'ru', 656, 0.1322, 80),
(13, 'ru', 657, 0.1322, 86),
(13, 'ru', 658, 0.1322, 87),
(13, 'ru', 659, 0.1322, 89),
(13, 'ru', 660, 0.307, 99),
(13, 'ru', 661, 0.1322, 92),
(13, 'ru', 662, 0.1322, 96),
(13, 'ru', 663, 0.1322, 97),
(13, 'ru', 664, 0.2096, 150.5),
(13, 'ru', 665, 0.1322, 104),
(13, 'ru', 666, 0.1322, 105),
(13, 'ru', 667, 0.1322, 111),
(13, 'ru', 668, 0.1322, 114),
(13, 'ru', 669, 0.1322, 115),
(13, 'ru', 670, 0.2096, 184.5),
(13, 'ru', 671, 0.1322, 121),
(13, 'ru', 672, 0.1322, 125),
(13, 'ru', 673, 0.1322, 126),
(13, 'ru', 674, 0.1322, 127),
(13, 'ru', 675, 0.2096, 129),
(13, 'ru', 676, 0.1322, 129),
(13, 'ru', 677, 0.1322, 133),
(13, 'ru', 678, 0.2096, 144.5),
(13, 'ru', 679, 0.1322, 136),
(13, 'ru', 680, 0.1322, 137),
(13, 'ru', 681, 0.1322, 138),
(13, 'ru', 682, 0.1322, 142),
(13, 'ru', 683, 0.1322, 144),
(13, 'ru', 684, 0.1322, 151),
(13, 'ru', 685, 0.2096, 171.5),
(13, 'ru', 686, 0.307, 171.5),
(13, 'ru', 687, 0.1322, 153),
(13, 'ru', 688, 0.2096, 171.5),
(13, 'ru', 689, 0.1322, 158),
(13, 'ru', 690, 0.1322, 161),
(13, 'ru', 691, 0.1322, 162),
(13, 'ru', 692, 0.2096, 162),
(13, 'ru', 693, 0.1322, 164),
(13, 'ru', 694, 0.1322, 167),
(13, 'ru', 695, 0.1322, 173),
(13, 'ru', 696, 0.1322, 184),
(13, 'ru', 697, 0.1322, 188),
(13, 'ru', 698, 0.1322, 190),
(13, 'ru', 699, 0.1322, 192),
(13, 'ru', 700, 0.1322, 196),
(13, 'ru', 701, 0.1322, 198),
(13, 'ru', 702, 0.1322, 199),
(13, 'ru', 703, 0.1322, 202),
(13, 'ru', 704, 0.1322, 204),
(13, 'ru', 705, 0.1322, 210),
(13, 'ru', 706, 0.1322, 211),
(13, 'ru', 707, 0.1322, 215),
(13, 'ru', 708, 0.1322, 221),
(13, 'ru', 709, 0.1322, 222),
(13, 'ru', 710, 0.1322, 224),
(13, 'ru', 711, 0.1322, 228),
(13, 'ru', 712, 0.1322, 231),
(13, 'ru', 713, 0.2096, 233.5),
(13, 'ru', 714, 0.2096, 239),
(13, 'ru', 715, 0.1322, 238),
(13, 'ru', 716, 0.1322, 239),
(13, 'ru', 717, 0.1322, 240),
(13, 'ru', 718, 0.1322, 241),
(13, 'ru', 719, 0.1322, 242),
(13, 'ru', 720, 0.1322, 253),
(13, 'ru', 721, 0.1322, 254),
(13, 'ru', 722, 0.1322, 255),
(13, 'ru', 723, 0.1322, 256),
(13, 'ru', 724, 0.1322, 257),
(14, 'ru', 3, 0.2871, 156.25),
(14, 'ru', 15, 0.1236, 537),
(14, 'ru', 16, 0.196, 538),
(14, 'ru', 17, 0.1236, 45),
(14, 'ru', 47, 0.2871, 76.5),
(14, 'ru', 86, 0.4108, 246.111),
(14, 'ru', 93, 0.1236, 511),
(14, 'ru', 107, 0.196, 502.5),
(14, 'ru', 114, 0.1236, 313),
(14, 'ru', 178, 0.1236, 491),
(14, 'ru', 181, 0.1236, 397),
(14, 'ru', 183, 0.1236, 73),
(14, 'ru', 200, 0.1236, 125),
(14, 'ru', 205, 0.4433, 293.182),
(14, 'ru', 211, 0.1236, 134),
(14, 'ru', 233, 0.1236, 538),
(14, 'ru', 237, 0.1236, 14),
(14, 'ru', 262, 0.196, 456.5),
(14, 'ru', 265, 0.1236, 71),
(14, 'ru', 277, 0.4278, 165.9),
(14, 'ru', 286, 0.1236, 507),
(14, 'ru', 289, 0.196, 25.5),
(14, 'ru', 332, 0.1236, 35),
(14, 'ru', 357, 0.1236, 510),
(14, 'ru', 431, 0.196, 465.5),
(14, 'ru', 442, 0.196, 109),
(14, 'ru', 465, 0.1236, 27),
(14, 'ru', 527, 0.1236, 81),
(14, 'ru', 571, 0.196, 100),
(14, 'ru', 607, 0.196, 373),
(14, 'ru', 649, 0.1236, 78),
(14, 'ru', 654, 0.196, 467.5),
(14, 'ru', 683, 0.392, 183.125),
(14, 'ru', 686, 0.1236, 132),
(14, 'ru', 693, 0.196, 262),
(14, 'ru', 704, 0.2871, 517.75),
(14, 'ru', 725, 0.4831, 203.143),
(14, 'ru', 726, 0.4278, 204.8),
(14, 'ru', 727, 0.1236, 15),
(14, 'ru', 728, 0.2473, 38.3333),
(14, 'ru', 729, 0.2871, 78.25),
(14, 'ru', 730, 0.1236, 36),
(14, 'ru', 731, 0.1236, 37),
(14, 'ru', 732, 0.1236, 41),
(14, 'ru', 733, 0.1236, 44),
(14, 'ru', 734, 0.1236, 46),
(14, 'ru', 735, 0.1236, 53),
(14, 'ru', 736, 0.1236, 54),
(14, 'ru', 737, 0.2473, 224.667),
(14, 'ru', 738, 0.2473, 225.667),
(14, 'ru', 739, 0.1236, 80),
(14, 'ru', 740, 0.1236, 87),
(14, 'ru', 741, 0.1236, 88),
(14, 'ru', 742, 0.1236, 91),
(14, 'ru', 743, 0.1236, 94),
(14, 'ru', 744, 0.196, 101),
(14, 'ru', 745, 0.1236, 102),
(14, 'ru', 746, 0.1236, 126),
(14, 'ru', 747, 0.2473, 135),
(14, 'ru', 748, 0.3196, 407.2),
(14, 'ru', 749, 0.1236, 138),
(14, 'ru', 750, 0.1236, 139),
(14, 'ru', 751, 0.196, 139),
(14, 'ru', 752, 0.1236, 142),
(14, 'ru', 753, 0.1236, 143),
(14, 'ru', 754, 0.5812, 304.6),
(14, 'ru', 755, 0.1236, 160),
(14, 'ru', 756, 0.1236, 162),
(14, 'ru', 757, 0.392, 298.125),
(14, 'ru', 758, 0.1236, 167),
(14, 'ru', 759, 0.392, 309.125),
(14, 'ru', 760, 0.196, 215.5),
(14, 'ru', 761, 0.1236, 200),
(14, 'ru', 762, 0.1236, 205),
(14, 'ru', 763, 0.2871, 312.75),
(14, 'ru', 764, 0.1236, 237),
(14, 'ru', 765, 0.1236, 242),
(14, 'ru', 766, 0.196, 290),
(14, 'ru', 767, 0.1236, 274),
(14, 'ru', 768, 0.1236, 279),
(14, 'ru', 769, 0.1236, 318),
(14, 'ru', 770, 0.1236, 355),
(14, 'ru', 771, 0.1236, 360),
(14, 'ru', 772, 0.3196, 440.6),
(14, 'ru', 773, 0.1236, 402),
(14, 'ru', 774, 0.196, 436.5),
(14, 'ru', 775, 0.1236, 429),
(14, 'ru', 776, 0.1236, 431),
(14, 'ru', 777, 0.1236, 436),
(14, 'ru', 778, 0.1236, 446),
(14, 'ru', 779, 0.1236, 448),
(14, 'ru', 780, 0.196, 457.5),
(14, 'ru', 781, 0.2871, 472.25),
(14, 'ru', 782, 0.2871, 475.25),
(14, 'ru', 783, 0.196, 466.5),
(14, 'ru', 784, 0.1236, 478),
(14, 'ru', 785, 0.196, 506.5),
(14, 'ru', 786, 0.1236, 488),
(14, 'ru', 787, 0.1236, 489),
(14, 'ru', 788, 0.1236, 495),
(14, 'ru', 789, 0.1236, 498),
(14, 'ru', 790, 0.1236, 500),
(14, 'ru', 791, 0.1236, 501),
(14, 'ru', 792, 0.1236, 502),
(14, 'ru', 793, 0.1236, 505),
(14, 'ru', 794, 0.1236, 508),
(14, 'ru', 795, 0.1236, 509),
(14, 'ru', 796, 0.196, 535.5),
(14, 'ru', 797, 0.1236, 521),
(14, 'ru', 798, 0.1236, 522),
(14, 'ru', 799, 0.1236, 524),
(14, 'ru', 800, 0.1236, 530),
(14, 'ru', 801, 0.1236, 532),
(14, 'ru', 802, 0.1236, 534),
(14, 'ru', 803, 0.1236, 535),
(14, 'ru', 804, 0.196, 535),
(14, 'ru', 805, 0.1236, 536),
(14, 'ru', 806, 0.1236, 540),
(14, 'ru', 807, 0.1236, 542),
(14, 'ru', 808, 0.1236, 555),
(14, 'ru', 809, 0.1236, 556),
(15, 'ru', 3, 0.3856, 39.5),
(15, 'ru', 21, 0.166, 37),
(15, 'ru', 27, 0.3321, 37),
(15, 'ru', 30, 0.166, 25),
(15, 'ru', 32, 0.166, 31),
(15, 'ru', 34, 0.166, 34),
(15, 'ru', 47, 0.166, 77),
(15, 'ru', 53, 0.166, 9),
(15, 'ru', 86, 0.4662, 36.3333),
(15, 'ru', 104, 0.166, 53),
(15, 'ru', 110, 0.166, 51),
(15, 'ru', 130, 0.166, 39),
(15, 'ru', 133, 0.166, 38),
(15, 'ru', 155, 0.2632, 14),
(15, 'ru', 194, 0.166, 29),
(15, 'ru', 216, 0.2632, 35.5),
(15, 'ru', 223, 0.166, 55),
(15, 'ru', 228, 0.166, 76),
(15, 'ru', 237, 0.166, 72),
(15, 'ru', 254, 0.166, 4),
(15, 'ru', 260, 0.3321, 28.6667),
(15, 'ru', 280, 0.166, 70),
(15, 'ru', 286, 0.166, 5),
(15, 'ru', 287, 0.166, 61),
(15, 'ru', 365, 0.166, 44),
(15, 'ru', 432, 0.166, 24),
(15, 'ru', 434, 0.166, 63),
(15, 'ru', 458, 0.166, 23),
(15, 'ru', 462, 0.166, 43),
(15, 'ru', 475, 0.166, 7),
(15, 'ru', 476, 0.2632, 7),
(15, 'ru', 547, 0.166, 42),
(15, 'ru', 607, 0.166, 52),
(15, 'ru', 635, 0.166, 81),
(15, 'ru', 725, 0.166, 80),
(15, 'ru', 810, 0.166, 19),
(15, 'ru', 811, 0.166, 23),
(15, 'ru', 812, 0.166, 26),
(15, 'ru', 813, 0.166, 27),
(15, 'ru', 814, 0.166, 32),
(15, 'ru', 815, 0.166, 33),
(15, 'ru', 816, 0.166, 35),
(15, 'ru', 817, 0.166, 41),
(15, 'ru', 818, 0.2632, 41),
(15, 'ru', 819, 0.166, 59),
(15, 'ru', 820, 0.166, 60),
(15, 'ru', 821, 0.166, 64),
(15, 'ru', 822, 0.166, 75),
(15, 'ru', 823, 0.166, 78),
(16, 'ru', 3, 0.4246, 65.1429),
(16, 'ru', 27, 0.283, 87.3333),
(16, 'ru', 38, 0.1415, 126),
(16, 'ru', 47, 0.283, 90.6667),
(16, 'ru', 63, 0.1415, 72),
(16, 'ru', 80, 0.2243, 110),
(16, 'ru', 86, 0.3658, 102.2),
(16, 'ru', 93, 0.1415, 63),
(16, 'ru', 125, 0.1415, 68),
(16, 'ru', 134, 0.1415, 94),
(16, 'ru', 142, 0.2243, 67.5),
(16, 'ru', 146, 0.1415, 26),
(16, 'ru', 169, 0.2243, 83.5),
(16, 'ru', 216, 0.1415, 113),
(16, 'ru', 225, 0.1415, 127),
(16, 'ru', 226, 0.2243, 108),
(16, 'ru', 228, 0.2243, 58),
(16, 'ru', 229, 0.3286, 92),
(16, 'ru', 236, 0.2243, 54),
(16, 'ru', 254, 0.1415, 11),
(16, 'ru', 256, 0.2243, 37),
(16, 'ru', 260, 0.2243, 123.5),
(16, 'ru', 269, 0.3286, 89),
(16, 'ru', 278, 0.1415, 45),
(16, 'ru', 288, 0.1415, 10),
(16, 'ru', 289, 0.1415, 120),
(16, 'ru', 357, 0.1415, 62),
(16, 'ru', 431, 0.2243, 110),
(16, 'ru', 437, 0.2243, 55),
(16, 'ru', 458, 0.1415, 179),
(16, 'ru', 497, 0.1415, 58),
(16, 'ru', 503, 0.1415, 4),
(16, 'ru', 539, 0.1415, 24),
(16, 'ru', 541, 0.1415, 9),
(16, 'ru', 570, 0.1415, 98),
(16, 'ru', 607, 0.1415, 162),
(16, 'ru', 636, 0.1415, 125),
(16, 'ru', 652, 0.1415, 102),
(16, 'ru', 674, 0.283, 81.6667),
(16, 'ru', 675, 0.3286, 79.75),
(16, 'ru', 683, 0.1415, 46),
(16, 'ru', 688, 0.1415, 61),
(16, 'ru', 690, 0.283, 97),
(16, 'ru', 706, 0.1415, 180),
(16, 'ru', 707, 0.1415, 181),
(16, 'ru', 725, 0.1415, 114),
(16, 'ru', 726, 0.1415, 116),
(16, 'ru', 729, 0.1415, 117),
(16, 'ru', 747, 0.1415, 192),
(16, 'ru', 787, 0.3286, 153.5),
(16, 'ru', 811, 0.1415, 179),
(16, 'ru', 822, 0.1415, 56),
(16, 'ru', 823, 0.1415, 1),
(16, 'ru', 824, 0.1415, 8),
(16, 'ru', 825, 0.283, 56),
(16, 'ru', 826, 0.1415, 18),
(16, 'ru', 827, 0.1415, 22),
(16, 'ru', 828, 0.1415, 28),
(16, 'ru', 829, 0.1415, 37),
(16, 'ru', 830, 0.1415, 44),
(16, 'ru', 831, 0.1415, 60),
(16, 'ru', 832, 0.1415, 65),
(16, 'ru', 833, 0.2243, 65),
(16, 'ru', 834, 0.1415, 67),
(16, 'ru', 835, 0.2243, 67),
(16, 'ru', 836, 0.1415, 69),
(16, 'ru', 837, 0.1415, 78),
(16, 'ru', 838, 0.2243, 129),
(16, 'ru', 839, 0.1415, 91),
(16, 'ru', 840, 0.1415, 97),
(16, 'ru', 841, 0.1415, 106),
(16, 'ru', 842, 0.1415, 107),
(16, 'ru', 843, 0.1415, 109),
(16, 'ru', 844, 0.1415, 118),
(16, 'ru', 845, 0.1415, 121),
(16, 'ru', 846, 0.1415, 123),
(16, 'ru', 847, 0.1415, 130),
(16, 'ru', 848, 0.1415, 131),
(16, 'ru', 849, 0.2243, 143.5),
(16, 'ru', 850, 0.1415, 141),
(16, 'ru', 851, 0.1415, 149),
(16, 'ru', 852, 0.1415, 151),
(16, 'ru', 853, 0.1415, 152),
(16, 'ru', 854, 0.1415, 178),
(16, 'ru', 855, 0.1415, 183),
(16, 'ru', 856, 0.1415, 184),
(16, 'ru', 857, 0.1415, 188),
(16, 'ru', 858, 0.1415, 190),
(17, 'ru', 3, 0.1852, 23),
(17, 'ru', 5, 0.1168, 520),
(17, 'ru', 15, 0.1168, 512),
(17, 'ru', 23, 0.1168, 21),
(17, 'ru', 27, 0.1852, 278),
(17, 'ru', 32, 0.1168, 24),
(17, 'ru', 34, 0.1168, 62),
(17, 'ru', 44, 0.1168, 454),
(17, 'ru', 47, 0.328, 244.333),
(17, 'ru', 53, 0.1168, 34),
(17, 'ru', 54, 0.4872, 287.647),
(17, 'ru', 55, 0.4872, 288.647),
(17, 'ru', 72, 0.1168, 105),
(17, 'ru', 79, 0.1168, 125),
(17, 'ru', 80, 0.1168, 174),
(17, 'ru', 86, 0.2337, 40.3333),
(17, 'ru', 92, 0.1168, 223),
(17, 'ru', 93, 0.302, 262.8),
(17, 'ru', 106, 0.2337, 145.333),
(17, 'ru', 128, 0.1168, 84),
(17, 'ru', 136, 0.1168, 61),
(17, 'ru', 142, 0.302, 245.8),
(17, 'ru', 160, 0.1168, 533),
(17, 'ru', 183, 0.1168, 78),
(17, 'ru', 192, 0.1852, 362.5),
(17, 'ru', 201, 0.1168, 382),
(17, 'ru', 216, 0.1168, 48),
(17, 'ru', 219, 0.1168, 99),
(17, 'ru', 221, 0.1168, 10),
(17, 'ru', 226, 0.1168, 27),
(17, 'ru', 228, 0.2337, 86.3333),
(17, 'ru', 229, 0.3881, 267.222),
(17, 'ru', 256, 0.1168, 539),
(17, 'ru', 259, 0.1168, 56),
(17, 'ru', 269, 0.505, 242.632),
(17, 'ru', 272, 0.1852, 371.5),
(17, 'ru', 278, 0.1168, 429),
(17, 'ru', 286, 0.302, 437.6),
(17, 'ru', 301, 0.1168, 116),
(17, 'ru', 357, 0.2713, 271.5),
(17, 'ru', 420, 0.1852, 71),
(17, 'ru', 426, 0.1168, 7),
(17, 'ru', 478, 0.1168, 102),
(17, 'ru', 490, 0.1168, 389),
(17, 'ru', 497, 0.2713, 186.5),
(17, 'ru', 499, 0.1168, 9),
(17, 'ru', 503, 0.1168, 52),
(17, 'ru', 507, 0.1168, 133),
(17, 'ru', 541, 0.1168, 124),
(17, 'ru', 542, 0.1168, 388),
(17, 'ru', 549, 0.1168, 384),
(17, 'ru', 571, 0.1852, 132),
(17, 'ru', 577, 0.1168, 160),
(17, 'ru', 583, 0.1168, 216),
(17, 'ru', 584, 0.1168, 263),
(17, 'ru', 597, 0.1168, 206),
(17, 'ru', 611, 0.1168, 528),
(17, 'ru', 651, 0.1168, 29),
(17, 'ru', 652, 0.1168, 31),
(17, 'ru', 660, 0.1852, 148),
(17, 'ru', 664, 0.1168, 156),
(17, 'ru', 667, 0.1168, 13),
(17, 'ru', 668, 0.1168, 380),
(17, 'ru', 669, 0.1168, 8),
(17, 'ru', 671, 0.1168, 87),
(17, 'ru', 688, 0.1852, 34.5),
(17, 'ru', 693, 0.1852, 341.5),
(17, 'ru', 700, 0.1168, 83),
(17, 'ru', 705, 0.2337, 301.333),
(17, 'ru', 706, 0.2713, 358.25),
(17, 'ru', 707, 0.328, 402),
(17, 'ru', 747, 0.302, 397.2),
(17, 'ru', 748, 0.1168, 519),
(17, 'ru', 753, 0.1168, 517),
(17, 'ru', 754, 0.4449, 371.154),
(17, 'ru', 759, 0.2337, 304.333),
(17, 'ru', 778, 0.1168, 88),
(17, 'ru', 783, 0.1168, 170),
(17, 'ru', 789, 0.2337, 324.667),
(17, 'ru', 799, 0.2713, 191.25),
(17, 'ru', 810, 0.1168, 70),
(17, 'ru', 828, 0.1168, 11),
(17, 'ru', 831, 0.2713, 241),
(17, 'ru', 832, 0.2337, 251),
(17, 'ru', 833, 0.328, 251),
(17, 'ru', 834, 0.2337, 265),
(17, 'ru', 835, 0.328, 265),
(17, 'ru', 856, 0.1852, 365.5),
(17, 'ru', 859, 0.1852, 107.5),
(17, 'ru', 860, 0.3704, 218.125),
(17, 'ru', 861, 0.1168, 5),
(17, 'ru', 862, 0.1852, 14),
(17, 'ru', 863, 0.1168, 20),
(17, 'ru', 864, 0.2337, 52.6667),
(17, 'ru', 865, 0.1168, 33),
(17, 'ru', 866, 0.4674, 276.667),
(17, 'ru', 867, 0.1168, 53),
(17, 'ru', 868, 0.1168, 57),
(17, 'ru', 869, 0.1168, 58),
(17, 'ru', 870, 0.1168, 59),
(17, 'ru', 871, 0.1168, 60),
(17, 'ru', 872, 0.1168, 63),
(17, 'ru', 873, 0.1168, 64),
(17, 'ru', 874, 0.1168, 65),
(17, 'ru', 875, 0.1168, 66),
(17, 'ru', 876, 0.1168, 67),
(17, 'ru', 877, 0.1168, 71),
(17, 'ru', 878, 0.1168, 76),
(17, 'ru', 879, 0.1852, 91.5),
(17, 'ru', 880, 0.1852, 104.5),
(17, 'ru', 881, 0.1168, 89),
(17, 'ru', 882, 0.1168, 92),
(17, 'ru', 883, 0.1852, 217),
(17, 'ru', 884, 0.3881, 290.889),
(17, 'ru', 885, 0.1168, 101),
(17, 'ru', 886, 0.1168, 107),
(17, 'ru', 887, 0.1168, 109),
(17, 'ru', 888, 0.1168, 112),
(17, 'ru', 889, 0.1168, 115),
(17, 'ru', 890, 0.1168, 126),
(17, 'ru', 891, 0.1168, 131),
(17, 'ru', 892, 0.1168, 132),
(17, 'ru', 893, 0.1168, 136),
(17, 'ru', 894, 0.1168, 146),
(17, 'ru', 895, 0.1168, 147),
(17, 'ru', 896, 0.1168, 148),
(17, 'ru', 897, 0.1168, 152),
(17, 'ru', 898, 0.1168, 155),
(17, 'ru', 899, 0.1168, 158),
(17, 'ru', 900, 0.2713, 366.5),
(17, 'ru', 901, 0.1168, 168),
(17, 'ru', 902, 0.1168, 172),
(17, 'ru', 903, 0.2337, 322.333),
(17, 'ru', 904, 0.1168, 242),
(17, 'ru', 905, 0.1168, 256),
(17, 'ru', 906, 0.1168, 268),
(17, 'ru', 907, 0.1852, 361),
(17, 'ru', 908, 0.1168, 271),
(17, 'ru', 909, 0.2337, 315.667),
(17, 'ru', 910, 0.1852, 303),
(17, 'ru', 911, 0.1852, 307.5),
(17, 'ru', 912, 0.1168, 338),
(17, 'ru', 913, 0.1168, 340),
(17, 'ru', 914, 0.1168, 344),
(17, 'ru', 915, 0.1852, 363.5),
(17, 'ru', 916, 0.1168, 365),
(17, 'ru', 917, 0.1852, 406.5),
(17, 'ru', 918, 0.2713, 442.75),
(17, 'ru', 919, 0.1852, 426),
(17, 'ru', 920, 0.2713, 452.75),
(17, 'ru', 921, 0.1852, 446),
(17, 'ru', 922, 0.1168, 430),
(17, 'ru', 923, 0.1168, 444),
(17, 'ru', 924, 0.1852, 485),
(17, 'ru', 925, 0.1852, 486),
(17, 'ru', 926, 0.1852, 487),
(17, 'ru', 927, 0.1852, 481),
(17, 'ru', 928, 0.1852, 489),
(17, 'ru', 929, 0.1852, 494),
(17, 'ru', 930, 0.1852, 497),
(17, 'ru', 931, 0.1168, 510),
(17, 'ru', 932, 0.1168, 511),
(17, 'ru', 933, 0.1168, 514),
(17, 'ru', 934, 0.1168, 516),
(17, 'ru', 935, 0.1168, 531),
(17, 'ru', 936, 0.1168, 537),
(17, 'ru', 937, 0.1168, 547),
(18, 'ru', 3, 0.3182, 133.8),
(18, 'ru', 17, 0.1231, 35),
(18, 'ru', 47, 0.2462, 95.6667),
(18, 'ru', 79, 0.1951, 206.5),
(18, 'ru', 91, 0.1231, 15),
(18, 'ru', 106, 0.2462, 265),
(18, 'ru', 125, 0.2858, 207.5),
(18, 'ru', 128, 0.1951, 117.5),
(18, 'ru', 136, 0.1231, 16),
(18, 'ru', 137, 0.1231, 142),
(18, 'ru', 141, 0.1231, 152),
(18, 'ru', 142, 0.1231, 11),
(18, 'ru', 155, 0.2462, 85.3333),
(18, 'ru', 194, 0.1231, 40),
(18, 'ru', 206, 0.1231, 61),
(18, 'ru', 228, 0.2858, 165),
(18, 'ru', 229, 0.3182, 173.4),
(18, 'ru', 236, 0.1231, 55),
(18, 'ru', 237, 0.1231, 5),
(18, 'ru', 253, 0.1231, 145),
(18, 'ru', 254, 0.1231, 39),
(18, 'ru', 258, 0.1951, 37.5),
(18, 'ru', 259, 0.1951, 257),
(18, 'ru', 262, 0.1231, 312),
(18, 'ru', 263, 0.1231, 313),
(18, 'ru', 265, 0.1951, 179),
(18, 'ru', 269, 0.3456, 223.167),
(18, 'ru', 277, 0.1231, 234),
(18, 'ru', 280, 0.1951, 20),
(18, 'ru', 288, 0.1231, 187),
(18, 'ru', 307, 0.1951, 197),
(18, 'ru', 319, 0.1951, 120.5),
(18, 'ru', 390, 0.1231, 154),
(18, 'ru', 426, 0.1231, 18),
(18, 'ru', 464, 0.1231, 6),
(18, 'ru', 497, 0.1951, 291.5),
(18, 'ru', 514, 0.1231, 51),
(18, 'ru', 541, 0.1231, 251),
(18, 'ru', 611, 0.1951, 254),
(18, 'ru', 652, 0.1231, 74),
(18, 'ru', 664, 0.1231, 181),
(18, 'ru', 665, 0.1951, 168.5),
(18, 'ru', 674, 0.2858, 205.5),
(18, 'ru', 690, 0.2462, 125.333),
(18, 'ru', 700, 0.1951, 116.5),
(18, 'ru', 709, 0.1231, 170),
(18, 'ru', 740, 0.1231, 193),
(18, 'ru', 743, 0.1231, 301),
(18, 'ru', 745, 0.1951, 258),
(18, 'ru', 747, 0.1231, 49),
(18, 'ru', 778, 0.1951, 261.5),
(18, 'ru', 813, 0.1231, 34),
(18, 'ru', 825, 0.2858, 167),
(18, 'ru', 830, 0.2858, 156.25),
(18, 'ru', 837, 0.1951, 167),
(18, 'ru', 842, 0.1231, 46),
(18, 'ru', 862, 0.1951, 280),
(18, 'ru', 867, 0.1231, 75),
(18, 'ru', 868, 0.1231, 148),
(18, 'ru', 877, 0.1231, 26),
(18, 'ru', 880, 0.1951, 177.5),
(18, 'ru', 881, 0.1231, 297),
(18, 'ru', 891, 0.1231, 255),
(18, 'ru', 900, 0.1231, 173),
(18, 'ru', 909, 0.1951, 277),
(18, 'ru', 920, 0.3456, 138.5),
(18, 'ru', 928, 0.1951, 127.5),
(18, 'ru', 938, 0.1231, 17),
(18, 'ru', 939, 0.1231, 23),
(18, 'ru', 940, 0.1231, 25),
(18, 'ru', 941, 0.1951, 173.5),
(18, 'ru', 942, 0.1231, 33),
(18, 'ru', 943, 0.1231, 41),
(18, 'ru', 944, 0.1231, 44),
(18, 'ru', 945, 0.1231, 45),
(18, 'ru', 946, 0.1231, 48),
(18, 'ru', 947, 0.1231, 53),
(18, 'ru', 948, 0.1231, 54),
(18, 'ru', 949, 0.1231, 56),
(18, 'ru', 950, 0.1231, 58),
(18, 'ru', 951, 0.1231, 59),
(18, 'ru', 952, 0.1231, 62),
(18, 'ru', 953, 0.5031, 137.312),
(18, 'ru', 954, 0.1951, 173),
(18, 'ru', 955, 0.1231, 78),
(18, 'ru', 956, 0.3182, 191.4),
(18, 'ru', 957, 0.4258, 191.4),
(18, 'ru', 958, 0.2462, 202.667),
(18, 'ru', 959, 0.1231, 84),
(18, 'ru', 960, 0.2462, 203.333),
(18, 'ru', 961, 0.2462, 203.333),
(18, 'ru', 962, 0.2462, 203.333),
(18, 'ru', 963, 0.1231, 88),
(18, 'ru', 964, 0.1231, 90),
(18, 'ru', 965, 0.2462, 96.3333),
(18, 'ru', 966, 0.1951, 191.5),
(18, 'ru', 967, 0.1231, 112),
(18, 'ru', 968, 0.1231, 117),
(18, 'ru', 969, 0.1951, 120.5),
(18, 'ru', 970, 0.1951, 120.5),
(18, 'ru', 971, 0.1231, 122),
(18, 'ru', 972, 0.1231, 124),
(18, 'ru', 973, 0.1231, 139),
(18, 'ru', 974, 0.1231, 141),
(18, 'ru', 975, 0.1231, 147),
(18, 'ru', 976, 0.1231, 153),
(18, 'ru', 977, 0.1231, 155),
(18, 'ru', 978, 0.1231, 156),
(18, 'ru', 979, 0.1951, 156),
(18, 'ru', 980, 0.1951, 187),
(18, 'ru', 981, 0.1951, 195),
(18, 'ru', 982, 0.2462, 190),
(18, 'ru', 983, 0.3693, 190),
(18, 'ru', 984, 0.1231, 169),
(18, 'ru', 985, 0.1231, 179),
(18, 'ru', 986, 0.1231, 180),
(18, 'ru', 987, 0.1231, 189),
(18, 'ru', 988, 0.1231, 192),
(18, 'ru', 989, 0.1951, 259),
(18, 'ru', 990, 0.1231, 201),
(18, 'ru', 991, 0.1951, 263.5),
(18, 'ru', 992, 0.1231, 215),
(18, 'ru', 993, 0.4089, 256),
(18, 'ru', 994, 0.3182, 249.6),
(18, 'ru', 995, 0.3182, 249.6),
(18, 'ru', 996, 0.1951, 236.5),
(18, 'ru', 997, 0.1231, 235),
(18, 'ru', 998, 0.1951, 265),
(18, 'ru', 999, 0.1231, 245),
(18, 'ru', 1000, 0.1231, 247),
(18, 'ru', 1001, 0.1231, 252),
(18, 'ru', 1002, 0.1231, 257),
(18, 'ru', 1003, 0.1951, 279),
(18, 'ru', 1004, 0.1951, 282),
(18, 'ru', 1005, 0.1951, 284),
(18, 'ru', 1006, 0.1231, 274),
(18, 'ru', 1007, 0.1231, 275),
(18, 'ru', 1008, 0.1231, 280),
(18, 'ru', 1009, 0.1231, 298),
(18, 'ru', 1010, 0.1231, 300),
(18, 'ru', 1011, 0.1231, 310),
(18, 'ru', 1012, 0.1231, 324),
(19, 'ru', 3, 0.4874, 92.7),
(19, 'ru', 20, 0.1409, 3),
(19, 'ru', 21, 0.2233, 95),
(19, 'ru', 23, 0.1409, 116),
(19, 'ru', 32, 0.1409, 120),
(19, 'ru', 34, 0.3642, 83.8),
(19, 'ru', 47, 0.2818, 182.333),
(19, 'ru', 53, 0.3642, 99),
(19, 'ru', 65, 0.1409, 54),
(19, 'ru', 86, 0.3271, 113),
(19, 'ru', 133, 0.1409, 15),
(19, 'ru', 136, 0.2233, 87.5),
(19, 'ru', 146, 0.1409, 123),
(19, 'ru', 160, 0.1409, 173),
(19, 'ru', 176, 0.1409, 99),
(19, 'ru', 200, 0.1409, 35),
(19, 'ru', 210, 0.1409, 35),
(19, 'ru', 211, 0.1409, 35),
(19, 'ru', 216, 0.2233, 113),
(19, 'ru', 217, 0.1409, 18),
(19, 'ru', 218, 0.2818, 99),
(19, 'ru', 221, 0.1409, 61),
(19, 'ru', 226, 0.1409, 124),
(19, 'ru', 229, 0.2818, 131),
(19, 'ru', 236, 0.1409, 65),
(19, 'ru', 237, 0.1409, 176),
(19, 'ru', 254, 0.1409, 17),
(19, 'ru', 263, 0.1409, 86),
(19, 'ru', 269, 0.2818, 109.667),
(19, 'ru', 270, 0.1409, 37),
(19, 'ru', 280, 0.2818, 97),
(19, 'ru', 286, 0.2233, 55.5),
(19, 'ru', 287, 0.1409, 63),
(19, 'ru', 291, 0.2233, 62.5),
(19, 'ru', 295, 0.2233, 18.5),
(19, 'ru', 299, 0.1409, 103),
(19, 'ru', 333, 0.2233, 89),
(19, 'ru', 372, 0.1409, 80),
(19, 'ru', 426, 0.1409, 58),
(19, 'ru', 432, 0.1409, 160),
(19, 'ru', 447, 0.1409, 162),
(19, 'ru', 448, 0.1409, 149),
(19, 'ru', 473, 0.1409, 90),
(19, 'ru', 474, 0.2233, 90),
(19, 'ru', 487, 0.1409, 76),
(19, 'ru', 527, 0.2233, 90),
(19, 'ru', 539, 0.1409, 121),
(19, 'ru', 547, 0.1409, 127),
(19, 'ru', 675, 0.1409, 128),
(19, 'ru', 683, 0.1409, 95),
(19, 'ru', 688, 0.1409, 118),
(19, 'ru', 809, 0.1409, 14),
(19, 'ru', 822, 0.1409, 179),
(19, 'ru', 825, 0.1409, 125),
(19, 'ru', 842, 0.1409, 142),
(19, 'ru', 859, 0.1409, 185),
(19, 'ru', 861, 0.1409, 114),
(19, 'ru', 862, 0.1409, 117),
(19, 'ru', 900, 0.1409, 134),
(19, 'ru', 920, 0.1409, 187),
(19, 'ru', 945, 0.1409, 141),
(19, 'ru', 1013, 0.1409, 8),
(19, 'ru', 1014, 0.1409, 9),
(19, 'ru', 1015, 0.1409, 12),
(19, 'ru', 1016, 0.1409, 13),
(19, 'ru', 1017, 0.1409, 28),
(19, 'ru', 1018, 0.1409, 30),
(19, 'ru', 1019, 0.1409, 32),
(19, 'ru', 1020, 0.1409, 34),
(19, 'ru', 1021, 0.1409, 36),
(19, 'ru', 1022, 0.1409, 38),
(19, 'ru', 1023, 0.1409, 44),
(19, 'ru', 1024, 0.1409, 45),
(19, 'ru', 1025, 0.1409, 46),
(19, 'ru', 1026, 0.2233, 116.5),
(19, 'ru', 1027, 0.1409, 52),
(19, 'ru', 1028, 0.1409, 53),
(19, 'ru', 1029, 0.1409, 56),
(19, 'ru', 1030, 0.1409, 57),
(19, 'ru', 1031, 0.1409, 71),
(19, 'ru', 1032, 0.1409, 72),
(19, 'ru', 1033, 0.1409, 74),
(19, 'ru', 1034, 0.1409, 87),
(19, 'ru', 1035, 0.1409, 89),
(19, 'ru', 1036, 0.1409, 94),
(19, 'ru', 1037, 0.1409, 136),
(19, 'ru', 1038, 0.1409, 138),
(19, 'ru', 1039, 0.1409, 150),
(19, 'ru', 1040, 0.1409, 151),
(19, 'ru', 1041, 0.2233, 151),
(19, 'ru', 1042, 0.1409, 153),
(19, 'ru', 1043, 0.1409, 161),
(19, 'ru', 1044, 0.1409, 164),
(19, 'ru', 1045, 0.1409, 166),
(19, 'ru', 1046, 0.2233, 166),
(20, 'ru', 3, 0.4449, 319.75),
(20, 'ru', 5, 0.1202, 209),
(20, 'ru', 14, 0.1202, 463),
(20, 'ru', 17, 0.2405, 215),
(20, 'ru', 26, 0.1906, 285.5),
(20, 'ru', 27, 0.1202, 180),
(20, 'ru', 31, 0.1202, 364),
(20, 'ru', 36, 0.1202, 205),
(20, 'ru', 47, 0.2405, 132.667),
(20, 'ru', 49, 0.1202, 373),
(20, 'ru', 53, 0.2405, 136),
(20, 'ru', 54, 0.1906, 162.5),
(20, 'ru', 55, 0.1202, 85),
(20, 'ru', 75, 0.3607, 131.857),
(20, 'ru', 86, 0.2405, 381.333),
(20, 'ru', 93, 0.1202, 434),
(20, 'ru', 96, 0.1202, 494),
(20, 'ru', 109, 0.1202, 492),
(20, 'ru', 120, 0.1202, 428),
(20, 'ru', 125, 0.1202, 236),
(20, 'ru', 136, 0.1202, 316),
(20, 'ru', 153, 0.1202, 282),
(20, 'ru', 160, 0.1202, 437),
(20, 'ru', 165, 0.1202, 72),
(20, 'ru', 169, 0.2405, 102.667),
(20, 'ru', 179, 0.1202, 458),
(20, 'ru', 183, 0.1202, 475),
(20, 'ru', 194, 0.2405, 117),
(20, 'ru', 200, 0.1202, 304),
(20, 'ru', 206, 0.1202, 28),
(20, 'ru', 210, 0.1202, 304),
(20, 'ru', 211, 0.1906, 253),
(20, 'ru', 215, 0.1202, 425),
(20, 'ru', 226, 0.1202, 178),
(20, 'ru', 228, 0.1906, 78.5),
(20, 'ru', 229, 0.3811, 302.25),
(20, 'ru', 237, 0.1202, 223),
(20, 'ru', 250, 0.1202, 13),
(20, 'ru', 252, 0.1906, 378),
(20, 'ru', 253, 0.2792, 172),
(20, 'ru', 254, 0.1202, 412),
(20, 'ru', 264, 0.1202, 154),
(20, 'ru', 269, 0.1202, 396),
(20, 'ru', 277, 0.2405, 291),
(20, 'ru', 280, 0.1202, 410),
(20, 'ru', 288, 0.1202, 181),
(20, 'ru', 331, 0.1202, 83),
(20, 'ru', 420, 0.1202, 482),
(20, 'ru', 450, 0.1202, 338),
(20, 'ru', 497, 0.1202, 249),
(20, 'ru', 507, 0.1202, 484),
(20, 'ru', 565, 0.1202, 152),
(20, 'ru', 567, 0.1202, 147),
(20, 'ru', 569, 0.1202, 163),
(20, 'ru', 578, 0.1202, 164),
(20, 'ru', 603, 0.1202, 383),
(20, 'ru', 647, 0.1202, 174),
(20, 'ru', 652, 0.1202, 93),
(20, 'ru', 660, 0.3375, 379.333),
(20, 'ru', 672, 0.2405, 263.667),
(20, 'ru', 673, 0.3108, 266),
(20, 'ru', 674, 0.1906, 243),
(20, 'ru', 675, 0.3108, 220.2),
(20, 'ru', 678, 0.1202, 239),
(20, 'ru', 679, 0.1202, 240),
(20, 'ru', 683, 0.2405, 368.333),
(20, 'ru', 690, 0.1906, 341.5),
(20, 'ru', 693, 0.1202, 346),
(20, 'ru', 694, 0.1202, 394),
(20, 'ru', 697, 0.2792, 204.5),
(20, 'ru', 698, 0.1202, 440),
(20, 'ru', 729, 0.1202, 276),
(20, 'ru', 736, 0.1202, 435),
(20, 'ru', 748, 0.2792, 100.25),
(20, 'ru', 759, 0.1906, 43),
(20, 'ru', 766, 0.1202, 73),
(20, 'ru', 774, 0.1202, 122),
(20, 'ru', 778, 0.2405, 229.333),
(20, 'ru', 782, 0.1202, 35),
(20, 'ru', 792, 0.1906, 65),
(20, 'ru', 796, 0.1202, 442),
(20, 'ru', 799, 0.1202, 485),
(20, 'ru', 825, 0.1202, 317),
(20, 'ru', 828, 0.1906, 364.5),
(20, 'ru', 830, 0.1202, 333),
(20, 'ru', 842, 0.2792, 164.25),
(20, 'ru', 843, 0.1906, 193),
(20, 'ru', 846, 0.1202, 363),
(20, 'ru', 857, 0.1202, 340),
(20, 'ru', 869, 0.1202, 89),
(20, 'ru', 871, 0.4809, 442.667),
(20, 'ru', 879, 0.1202, 431),
(20, 'ru', 891, 0.1202, 367),
(20, 'ru', 896, 0.1906, 354),
(20, 'ru', 900, 0.1906, 349.5),
(20, 'ru', 913, 0.1202, 179),
(20, 'ru', 916, 0.1202, 390),
(20, 'ru', 920, 0.1202, 314),
(20, 'ru', 927, 0.3108, 170.2),
(20, 'ru', 935, 0.1202, 441),
(20, 'ru', 942, 0.1202, 430),
(20, 'ru', 954, 0.1202, 491),
(20, 'ru', 958, 0.1202, 423),
(20, 'ru', 966, 0.2405, 312),
(20, 'ru', 973, 0.1202, 184),
(20, 'ru', 974, 0.1202, 186),
(20, 'ru', 984, 0.1202, 337),
(20, 'ru', 986, 0.1202, 501),
(20, 'ru', 991, 0.2405, 203),
(20, 'ru', 993, 0.1202, 342),
(20, 'ru', 995, 0.1202, 318),
(20, 'ru', 1002, 0.1202, 345),
(20, 'ru', 1003, 0.1202, 287),
(20, 'ru', 1022, 0.1202, 250),
(20, 'ru', 1026, 0.1906, 4),
(20, 'ru', 1047, 0.1202, 9),
(20, 'ru', 1048, 0.1906, 119.5),
(20, 'ru', 1049, 0.2405, 66.3333),
(20, 'ru', 1050, 0.1906, 46.5),
(20, 'ru', 1051, 0.1906, 169.5),
(20, 'ru', 1052, 0.1906, 172.5),
(20, 'ru', 1053, 0.1202, 50),
(20, 'ru', 1054, 0.1906, 86),
(20, 'ru', 1055, 0.1202, 74),
(20, 'ru', 1056, 0.1906, 206),
(20, 'ru', 1057, 0.1202, 90),
(20, 'ru', 1058, 0.1202, 91),
(20, 'ru', 1059, 0.2792, 105.5),
(20, 'ru', 1060, 0.2405, 112),
(20, 'ru', 1061, 0.1202, 107),
(20, 'ru', 1062, 0.1906, 119),
(20, 'ru', 1063, 0.1906, 120),
(20, 'ru', 1064, 0.1202, 125),
(20, 'ru', 1065, 0.1202, 135),
(20, 'ru', 1066, 0.1202, 136),
(20, 'ru', 1067, 0.1202, 155),
(20, 'ru', 1068, 0.1202, 156),
(20, 'ru', 1069, 0.1202, 160),
(20, 'ru', 1070, 0.1202, 165),
(20, 'ru', 1071, 0.1202, 187),
(20, 'ru', 1072, 0.1202, 189),
(20, 'ru', 1073, 0.1906, 248.5),
(20, 'ru', 1074, 0.1202, 197),
(20, 'ru', 1075, 0.1202, 198),
(20, 'ru', 1076, 0.1202, 200),
(20, 'ru', 1077, 0.1202, 207),
(20, 'ru', 1078, 0.1202, 224),
(20, 'ru', 1079, 0.1202, 248),
(20, 'ru', 1080, 0.1202, 255),
(20, 'ru', 1081, 0.1202, 256),
(20, 'ru', 1082, 0.1202, 257),
(20, 'ru', 1083, 0.1202, 259),
(20, 'ru', 1084, 0.1202, 265),
(20, 'ru', 1085, 0.1202, 271),
(20, 'ru', 1086, 0.1202, 279),
(20, 'ru', 1087, 0.1906, 287),
(20, 'ru', 1088, 0.1202, 285),
(20, 'ru', 1089, 0.1202, 286),
(20, 'ru', 1090, 0.1202, 292),
(20, 'ru', 1091, 0.1202, 294),
(20, 'ru', 1092, 0.1202, 300),
(20, 'ru', 1093, 0.1202, 321),
(20, 'ru', 1094, 0.1202, 326),
(20, 'ru', 1095, 0.2792, 382.75),
(20, 'ru', 1096, 0.1906, 340),
(20, 'ru', 1097, 0.1202, 334),
(20, 'ru', 1098, 0.1202, 344),
(20, 'ru', 1099, 0.1202, 348),
(20, 'ru', 1100, 0.1202, 358),
(20, 'ru', 1101, 0.1202, 374),
(20, 'ru', 1102, 0.1202, 381),
(20, 'ru', 1103, 0.1202, 385),
(20, 'ru', 1104, 0.1202, 387),
(20, 'ru', 1105, 0.1202, 388),
(20, 'ru', 1106, 0.2405, 429),
(20, 'ru', 1107, 0.1202, 424),
(20, 'ru', 1108, 0.1202, 426),
(20, 'ru', 1109, 0.1906, 446.5),
(20, 'ru', 1110, 0.1202, 432),
(20, 'ru', 1111, 0.1202, 444),
(20, 'ru', 1112, 0.1202, 445),
(20, 'ru', 1113, 0.1202, 456),
(20, 'ru', 1114, 0.1202, 460),
(20, 'ru', 1115, 0.1202, 462),
(20, 'ru', 1116, 0.1202, 470),
(20, 'ru', 1117, 0.1202, 471),
(20, 'ru', 1118, 0.1202, 481),
(20, 'ru', 1119, 0.1202, 496),
(20, 'ru', 1120, 0.1202, 498),
(20, 'ru', 1121, 0.1202, 500),
(21, 'ru', 3, 0.4071, 249.778),
(21, 'ru', 8, 0.2846, 152.75),
(21, 'ru', 15, 0.1226, 60),
(21, 'ru', 26, 0.1226, 206),
(21, 'ru', 29, 0.424, 162.4),
(21, 'ru', 30, 0.1226, 356),
(21, 'ru', 36, 0.1942, 276),
(21, 'ru', 47, 0.1226, 409),
(21, 'ru', 59, 0.1226, 77),
(21, 'ru', 63, 0.1942, 278),
(21, 'ru', 80, 0.1226, 117),
(21, 'ru', 83, 0.1942, 325.5),
(21, 'ru', 111, 0.1226, 46),
(21, 'ru', 112, 0.2846, 286.25),
(21, 'ru', 125, 0.1226, 180),
(21, 'ru', 142, 0.1226, 448),
(21, 'ru', 155, 0.1226, 1),
(21, 'ru', 169, 0.3885, 265),
(21, 'ru', 178, 0.1942, 236),
(21, 'ru', 199, 0.1942, 67.5),
(21, 'ru', 225, 0.1226, 84),
(21, 'ru', 227, 0.1942, 109.5),
(21, 'ru', 229, 0.4071, 250.667),
(21, 'ru', 270, 0.1226, 3);
INSERT INTO `b_search_content_stem` (`SEARCH_CONTENT_ID`, `LANGUAGE_ID`, `STEM`, `TF`, `PS`) VALUES
(21, 'ru', 271, 0.1942, 63.5),
(21, 'ru', 272, 0.1942, 64.5),
(21, 'ru', 277, 0.2846, 260),
(21, 'ru', 279, 0.1226, 453),
(21, 'ru', 286, 0.1226, 196),
(21, 'ru', 309, 0.1226, 12),
(21, 'ru', 420, 0.1942, 251),
(21, 'ru', 431, 0.1226, 215),
(21, 'ru', 450, 0.1226, 82),
(21, 'ru', 540, 0.1226, 399),
(21, 'ru', 551, 0.2846, 217.5),
(21, 'ru', 607, 0.1226, 102),
(21, 'ru', 611, 0.2846, 216.5),
(21, 'ru', 636, 0.1226, 341),
(21, 'ru', 650, 0.1226, 411),
(21, 'ru', 675, 0.1226, 178),
(21, 'ru', 676, 0.1226, 159),
(21, 'ru', 683, 0.344, 282.333),
(21, 'ru', 686, 0.2451, 181.333),
(21, 'ru', 690, 0.1226, 51),
(21, 'ru', 704, 0.2451, 431),
(21, 'ru', 707, 0.1942, 140.5),
(21, 'ru', 729, 0.4071, 213.111),
(21, 'ru', 754, 0.1942, 155),
(21, 'ru', 759, 0.2846, 97.5),
(21, 'ru', 766, 0.2846, 204),
(21, 'ru', 772, 0.2451, 218.333),
(21, 'ru', 783, 0.1226, 99),
(21, 'ru', 796, 0.3677, 217.286),
(21, 'ru', 804, 0.4071, 224.667),
(21, 'ru', 825, 0.344, 141.333),
(21, 'ru', 828, 0.1942, 145.5),
(21, 'ru', 837, 0.2451, 141.333),
(21, 'ru', 842, 0.2451, 216),
(21, 'ru', 856, 0.1942, 274),
(21, 'ru', 903, 0.1226, 154),
(21, 'ru', 911, 0.1226, 230),
(21, 'ru', 919, 0.1942, 270.5),
(21, 'ru', 954, 0.3677, 230),
(21, 'ru', 975, 0.2451, 179.667),
(21, 'ru', 1063, 0.1226, 48),
(21, 'ru', 1122, 0.4788, 250.714),
(21, 'ru', 1123, 0.2846, 185.75),
(21, 'ru', 1124, 0.1942, 195.5),
(21, 'ru', 1125, 0.2451, 211.667),
(21, 'ru', 1126, 0.2846, 209),
(21, 'ru', 1127, 0.2846, 210.75),
(21, 'ru', 1128, 0.1942, 65),
(21, 'ru', 1129, 0.1226, 49),
(21, 'ru', 1130, 0.2451, 163.667),
(21, 'ru', 1131, 0.1942, 62.5),
(21, 'ru', 1132, 0.1226, 62),
(21, 'ru', 1133, 0.1226, 66),
(21, 'ru', 1134, 0.1226, 70),
(21, 'ru', 1135, 0.1226, 73),
(21, 'ru', 1136, 0.1226, 80),
(21, 'ru', 1137, 0.1226, 94),
(21, 'ru', 1138, 0.1942, 97.5),
(21, 'ru', 1139, 0.1226, 97),
(21, 'ru', 1140, 0.1226, 101),
(21, 'ru', 1141, 0.1226, 103),
(21, 'ru', 1142, 0.1226, 104),
(21, 'ru', 1143, 0.344, 201.167),
(21, 'ru', 1144, 0.1942, 188.5),
(21, 'ru', 1145, 0.2846, 188.5),
(21, 'ru', 1146, 0.1226, 115),
(21, 'ru', 1147, 0.1226, 118),
(21, 'ru', 1148, 0.2451, 232),
(21, 'ru', 1149, 0.1942, 272),
(21, 'ru', 1150, 0.1942, 277),
(21, 'ru', 1151, 0.1942, 285),
(21, 'ru', 1152, 0.2451, 252),
(21, 'ru', 1153, 0.1226, 182),
(21, 'ru', 1154, 0.1226, 205),
(21, 'ru', 1155, 0.1226, 213),
(21, 'ru', 1156, 0.1226, 214),
(21, 'ru', 1157, 0.1942, 275.5),
(21, 'ru', 1158, 0.1226, 277),
(21, 'ru', 1159, 0.1942, 307),
(21, 'ru', 1160, 0.1942, 298),
(21, 'ru', 1161, 0.1226, 307),
(21, 'ru', 1162, 0.1226, 335),
(21, 'ru', 1163, 0.1942, 359),
(21, 'ru', 1164, 0.1226, 350),
(21, 'ru', 1165, 0.1226, 354),
(21, 'ru', 1166, 0.1226, 360),
(21, 'ru', 1167, 0.1226, 398),
(21, 'ru', 1168, 0.1942, 430.5),
(21, 'ru', 1169, 0.1226, 431),
(21, 'ru', 1170, 0.1226, 440),
(21, 'ru', 1171, 0.1226, 443),
(21, 'ru', 1172, 0.1226, 444),
(21, 'ru', 1173, 0.1226, 445),
(21, 'ru', 1174, 0.1226, 454),
(22, 'ru', 3, 0.2696, 218.333),
(22, 'ru', 5, 0.1348, 50),
(22, 'ru', 17, 0.2137, 246),
(22, 'ru', 31, 0.1348, 268),
(22, 'ru', 44, 0.2137, 245),
(22, 'ru', 75, 0.1348, 26),
(22, 'ru', 86, 0.1348, 123),
(22, 'ru', 92, 0.1348, 27),
(22, 'ru', 93, 0.1348, 28),
(22, 'ru', 104, 0.2137, 206),
(22, 'ru', 107, 0.1348, 16),
(22, 'ru', 109, 0.2137, 73.5),
(22, 'ru', 111, 0.1348, 73),
(22, 'ru', 112, 0.313, 54.75),
(22, 'ru', 116, 0.1348, 9),
(22, 'ru', 128, 0.1348, 117),
(22, 'ru', 134, 0.2137, 233),
(22, 'ru', 165, 0.1348, 232),
(22, 'ru', 169, 0.2137, 35),
(22, 'ru', 179, 0.1348, 190),
(22, 'ru', 187, 0.1348, 174),
(22, 'ru', 188, 0.1348, 220),
(22, 'ru', 190, 0.2137, 181.5),
(22, 'ru', 203, 0.1348, 114),
(22, 'ru', 215, 0.2137, 248.5),
(22, 'ru', 219, 0.1348, 130),
(22, 'ru', 223, 0.2137, 240),
(22, 'ru', 253, 0.4478, 81.5556),
(22, 'ru', 254, 0.1348, 132),
(22, 'ru', 257, 0.1348, 194),
(22, 'ru', 266, 0.1348, 1),
(22, 'ru', 270, 0.1348, 102),
(22, 'ru', 406, 0.1348, 296),
(22, 'ru', 446, 0.1348, 113),
(22, 'ru', 478, 0.1348, 244),
(22, 'ru', 565, 0.1348, 259),
(22, 'ru', 568, 0.1348, 238),
(22, 'ru', 569, 0.2137, 286.5),
(22, 'ru', 571, 0.1348, 103),
(22, 'ru', 611, 0.1348, 153),
(22, 'ru', 645, 0.1348, 15),
(22, 'ru', 652, 0.1348, 152),
(22, 'ru', 697, 0.1348, 191),
(22, 'ru', 700, 0.2137, 190),
(22, 'ru', 704, 0.1348, 301),
(22, 'ru', 709, 0.1348, 161),
(22, 'ru', 736, 0.1348, 148),
(22, 'ru', 747, 0.2137, 67.5),
(22, 'ru', 748, 0.2137, 66),
(22, 'ru', 759, 0.3785, 116),
(22, 'ru', 778, 0.2137, 127.5),
(22, 'ru', 782, 0.1348, 106),
(22, 'ru', 796, 0.313, 64.75),
(22, 'ru', 827, 0.1348, 279),
(22, 'ru', 842, 0.2696, 113.333),
(22, 'ru', 850, 0.1348, 89),
(22, 'ru', 903, 0.1348, 34),
(22, 'ru', 911, 0.1348, 38),
(22, 'ru', 954, 0.2137, 76.5),
(22, 'ru', 975, 0.1348, 195),
(22, 'ru', 996, 0.1348, 121),
(22, 'ru', 1016, 0.1348, 4),
(22, 'ru', 1022, 0.1348, 293),
(22, 'ru', 1076, 0.1348, 119),
(22, 'ru', 1098, 0.1348, 144),
(22, 'ru', 1122, 0.2137, 74.5),
(22, 'ru', 1126, 0.2137, 71),
(22, 'ru', 1130, 0.1348, 160),
(22, 'ru', 1138, 0.2696, 116),
(22, 'ru', 1141, 0.1348, 52),
(22, 'ru', 1142, 0.1348, 82),
(22, 'ru', 1153, 0.2696, 71.6667),
(22, 'ru', 1169, 0.2137, 72.5),
(22, 'ru', 1170, 0.1348, 46),
(22, 'ru', 1175, 0.1348, 8),
(22, 'ru', 1176, 0.1348, 11),
(22, 'ru', 1177, 0.1348, 18),
(22, 'ru', 1178, 0.1348, 19),
(22, 'ru', 1179, 0.2137, 73.5),
(22, 'ru', 1180, 0.1348, 75),
(22, 'ru', 1181, 0.1348, 86),
(22, 'ru', 1182, 0.1348, 105),
(22, 'ru', 1183, 0.1348, 107),
(22, 'ru', 1184, 0.1348, 111),
(22, 'ru', 1185, 0.1348, 129),
(22, 'ru', 1186, 0.1348, 133),
(22, 'ru', 1187, 0.1348, 134),
(22, 'ru', 1188, 0.1348, 137),
(22, 'ru', 1189, 0.1348, 138),
(22, 'ru', 1190, 0.1348, 142),
(22, 'ru', 1191, 0.1348, 143),
(22, 'ru', 1192, 0.1348, 163),
(22, 'ru', 1193, 0.1348, 165),
(22, 'ru', 1194, 0.1348, 173),
(22, 'ru', 1195, 0.1348, 175),
(22, 'ru', 1196, 0.1348, 179),
(22, 'ru', 1197, 0.2137, 182.5),
(22, 'ru', 1198, 0.1348, 181),
(22, 'ru', 1199, 0.1348, 183),
(22, 'ru', 1200, 0.1348, 186),
(22, 'ru', 1201, 0.1348, 188),
(22, 'ru', 1202, 0.1348, 203),
(22, 'ru', 1203, 0.2137, 223.5),
(22, 'ru', 1204, 0.1348, 212),
(22, 'ru', 1205, 0.1348, 214),
(22, 'ru', 1206, 0.1348, 217),
(22, 'ru', 1207, 0.1348, 221),
(22, 'ru', 1208, 0.1348, 229),
(22, 'ru', 1209, 0.1348, 230),
(22, 'ru', 1210, 0.1348, 231),
(22, 'ru', 1211, 0.1348, 235),
(22, 'ru', 1212, 0.1348, 239),
(22, 'ru', 1213, 0.1348, 245),
(22, 'ru', 1214, 0.1348, 247),
(22, 'ru', 1215, 0.1348, 249),
(22, 'ru', 1216, 0.1348, 261),
(22, 'ru', 1217, 0.1348, 266),
(22, 'ru', 1218, 0.1348, 278),
(22, 'ru', 1219, 0.1348, 281),
(22, 'ru', 1220, 0.1348, 292),
(22, 'ru', 1221, 0.1348, 295),
(22, 'ru', 1222, 0.1348, 297),
(22, 'ru', 1223, 0.1348, 298),
(23, 'ru', 3, 0.3931, 40.25),
(23, 'ru', 10, 0.1693, 64),
(23, 'ru', 17, 0.1693, 57),
(23, 'ru', 20, 0.1693, 59),
(23, 'ru', 29, 0.1693, 83),
(23, 'ru', 35, 0.1693, 78),
(23, 'ru', 86, 0.2683, 52.5),
(23, 'ru', 92, 0.1693, 6),
(23, 'ru', 93, 0.2683, 4.5),
(23, 'ru', 109, 0.1693, 85),
(23, 'ru', 118, 0.2683, 34),
(23, 'ru', 128, 0.1693, 9),
(23, 'ru', 146, 0.1693, 76),
(23, 'ru', 155, 0.2683, 73.5),
(23, 'ru', 187, 0.1693, 8),
(23, 'ru', 194, 0.1693, 11),
(23, 'ru', 213, 0.1693, 62),
(23, 'ru', 218, 0.1693, 81),
(23, 'ru', 237, 0.2683, 50.5),
(23, 'ru', 247, 0.1693, 1),
(23, 'ru', 255, 0.1693, 77),
(23, 'ru', 265, 0.1693, 5),
(23, 'ru', 266, 0.1693, 84),
(23, 'ru', 280, 0.1693, 3),
(23, 'ru', 453, 0.1693, 66),
(23, 'ru', 464, 0.1693, 31),
(23, 'ru', 494, 0.1693, 61),
(23, 'ru', 547, 0.2683, 14),
(23, 'ru', 682, 0.1693, 45),
(23, 'ru', 683, 0.2683, 30.5),
(23, 'ru', 748, 0.1693, 49),
(23, 'ru', 822, 0.1693, 80),
(23, 'ru', 827, 0.1693, 12),
(23, 'ru', 856, 0.1693, 17),
(23, 'ru', 1034, 0.1693, 38),
(23, 'ru', 1182, 0.1693, 60),
(23, 'ru', 1224, 0.1693, 14),
(23, 'ru', 1225, 0.1693, 19),
(23, 'ru', 1226, 0.1693, 26),
(23, 'ru', 1227, 0.1693, 32),
(23, 'ru', 1228, 0.1693, 33),
(23, 'ru', 1229, 0.1693, 34),
(23, 'ru', 1230, 0.1693, 35),
(23, 'ru', 1231, 0.1693, 36),
(23, 'ru', 1232, 0.1693, 41),
(23, 'ru', 1233, 0.1693, 42),
(23, 'ru', 1234, 0.1693, 43),
(23, 'ru', 1235, 0.1693, 44),
(23, 'ru', 1236, 0.1693, 48),
(23, 'ru', 1237, 0.1693, 63),
(24, 'ru', 3, 0.5413, 233.546),
(24, 'ru', 10, 0.1197, 63),
(24, 'ru', 17, 0.1896, 72.5),
(24, 'ru', 20, 0.1896, 162.5),
(24, 'ru', 21, 0.2393, 312.667),
(24, 'ru', 23, 0.1197, 380),
(24, 'ru', 27, 0.2778, 193.5),
(24, 'ru', 28, 0.1197, 182),
(24, 'ru', 29, 0.1896, 132.5),
(24, 'ru', 30, 0.1197, 208),
(24, 'ru', 31, 0.1197, 127),
(24, 'ru', 32, 0.1896, 299),
(24, 'ru', 34, 0.3359, 326),
(24, 'ru', 35, 0.1197, 77),
(24, 'ru', 47, 0.3793, 256),
(24, 'ru', 53, 0.3359, 334.5),
(24, 'ru', 54, 0.1197, 158),
(24, 'ru', 65, 0.1197, 318),
(24, 'ru', 73, 0.1197, 113),
(24, 'ru', 75, 0.1197, 179),
(24, 'ru', 86, 0.4428, 243.917),
(24, 'ru', 92, 0.1197, 5),
(24, 'ru', 93, 0.1197, 6),
(24, 'ru', 104, 0.1197, 236),
(24, 'ru', 107, 0.1197, 160),
(24, 'ru', 109, 0.1197, 84),
(24, 'ru', 110, 0.1197, 234),
(24, 'ru', 116, 0.1197, 162),
(24, 'ru', 118, 0.1896, 33),
(24, 'ru', 128, 0.1197, 8),
(24, 'ru', 130, 0.2393, 162.333),
(24, 'ru', 131, 0.2778, 116.75),
(24, 'ru', 132, 0.2778, 118.75),
(24, 'ru', 133, 0.3359, 163.167),
(24, 'ru', 136, 0.1896, 351.5),
(24, 'ru', 141, 0.1197, 133),
(24, 'ru', 146, 0.1896, 231),
(24, 'ru', 155, 0.3093, 134.6),
(24, 'ru', 160, 0.1197, 437),
(24, 'ru', 176, 0.1197, 363),
(24, 'ru', 187, 0.1197, 7),
(24, 'ru', 194, 0.1896, 111),
(24, 'ru', 200, 0.1197, 299),
(24, 'ru', 210, 0.1197, 299),
(24, 'ru', 211, 0.1197, 299),
(24, 'ru', 213, 0.1197, 61),
(24, 'ru', 216, 0.2778, 297.75),
(24, 'ru', 217, 0.1197, 282),
(24, 'ru', 218, 0.3093, 254),
(24, 'ru', 221, 0.1197, 325),
(24, 'ru', 223, 0.1197, 238),
(24, 'ru', 226, 0.1197, 388),
(24, 'ru', 228, 0.1896, 215),
(24, 'ru', 229, 0.2393, 395),
(24, 'ru', 236, 0.1197, 329),
(24, 'ru', 237, 0.3093, 192.6),
(24, 'ru', 249, 0.1197, 181),
(24, 'ru', 254, 0.1896, 234),
(24, 'ru', 255, 0.1197, 76),
(24, 'ru', 260, 0.2393, 211.667),
(24, 'ru', 263, 0.1197, 350),
(24, 'ru', 265, 0.1197, 4),
(24, 'ru', 266, 0.1197, 83),
(24, 'ru', 269, 0.2393, 373.667),
(24, 'ru', 270, 0.1197, 301),
(24, 'ru', 280, 0.359, 227),
(24, 'ru', 284, 0.1197, 112),
(24, 'ru', 286, 0.2778, 231),
(24, 'ru', 287, 0.2393, 239.333),
(24, 'ru', 291, 0.2393, 251.667),
(24, 'ru', 295, 0.2393, 229.667),
(24, 'ru', 299, 0.1197, 367),
(24, 'ru', 333, 0.1896, 353),
(24, 'ru', 365, 0.1197, 227),
(24, 'ru', 372, 0.1197, 344),
(24, 'ru', 392, 0.1197, 99),
(24, 'ru', 426, 0.1197, 322),
(24, 'ru', 432, 0.1896, 315.5),
(24, 'ru', 434, 0.1896, 189),
(24, 'ru', 447, 0.1197, 426),
(24, 'ru', 448, 0.1197, 413),
(24, 'ru', 453, 0.1197, 65),
(24, 'ru', 458, 0.1896, 166),
(24, 'ru', 460, 0.1197, 119),
(24, 'ru', 462, 0.1197, 226),
(24, 'ru', 464, 0.1197, 30),
(24, 'ru', 473, 0.1197, 354),
(24, 'ru', 474, 0.1896, 354),
(24, 'ru', 475, 0.1197, 190),
(24, 'ru', 476, 0.1896, 190),
(24, 'ru', 487, 0.1197, 340),
(24, 'ru', 494, 0.1197, 60),
(24, 'ru', 508, 0.1197, 150),
(24, 'ru', 527, 0.1896, 354),
(24, 'ru', 539, 0.1197, 385),
(24, 'ru', 546, 0.1197, 144),
(24, 'ru', 547, 0.2778, 160.5),
(24, 'ru', 607, 0.1197, 235),
(24, 'ru', 635, 0.1197, 264),
(24, 'ru', 675, 0.1197, 392),
(24, 'ru', 682, 0.1197, 44),
(24, 'ru', 683, 0.2393, 139.333),
(24, 'ru', 688, 0.1197, 382),
(24, 'ru', 725, 0.1197, 263),
(24, 'ru', 748, 0.1197, 48),
(24, 'ru', 809, 0.1197, 278),
(24, 'ru', 810, 0.1197, 202),
(24, 'ru', 811, 0.1896, 166),
(24, 'ru', 812, 0.1197, 209),
(24, 'ru', 813, 0.1197, 210),
(24, 'ru', 814, 0.1197, 215),
(24, 'ru', 815, 0.1197, 216),
(24, 'ru', 816, 0.1197, 218),
(24, 'ru', 817, 0.1197, 224),
(24, 'ru', 818, 0.1896, 224),
(24, 'ru', 819, 0.1197, 242),
(24, 'ru', 820, 0.1197, 243),
(24, 'ru', 821, 0.1896, 188),
(24, 'ru', 822, 0.2778, 237.5),
(24, 'ru', 823, 0.1197, 261),
(24, 'ru', 825, 0.1197, 389),
(24, 'ru', 827, 0.1197, 11),
(24, 'ru', 842, 0.1197, 406),
(24, 'ru', 856, 0.1197, 16),
(24, 'ru', 859, 0.1197, 449),
(24, 'ru', 861, 0.1197, 378),
(24, 'ru', 862, 0.1197, 381),
(24, 'ru', 900, 0.1197, 398),
(24, 'ru', 920, 0.1197, 451),
(24, 'ru', 945, 0.1197, 405),
(24, 'ru', 1013, 0.1896, 191.5),
(24, 'ru', 1014, 0.1197, 273),
(24, 'ru', 1015, 0.1197, 276),
(24, 'ru', 1016, 0.1896, 188.5),
(24, 'ru', 1017, 0.1197, 292),
(24, 'ru', 1018, 0.1197, 294),
(24, 'ru', 1019, 0.1197, 296),
(24, 'ru', 1020, 0.1197, 298),
(24, 'ru', 1021, 0.1197, 300),
(24, 'ru', 1022, 0.1197, 302),
(24, 'ru', 1023, 0.1197, 308),
(24, 'ru', 1024, 0.1896, 230.5),
(24, 'ru', 1025, 0.1197, 310),
(24, 'ru', 1026, 0.1896, 380.5),
(24, 'ru', 1027, 0.1197, 316),
(24, 'ru', 1028, 0.1197, 317),
(24, 'ru', 1029, 0.1896, 221),
(24, 'ru', 1030, 0.1197, 321),
(24, 'ru', 1031, 0.1197, 335),
(24, 'ru', 1032, 0.1197, 336),
(24, 'ru', 1033, 0.1197, 338),
(24, 'ru', 1034, 0.1896, 194),
(24, 'ru', 1035, 0.1197, 353),
(24, 'ru', 1036, 0.1197, 358),
(24, 'ru', 1037, 0.1197, 400),
(24, 'ru', 1038, 0.1197, 402),
(24, 'ru', 1039, 0.1197, 414),
(24, 'ru', 1040, 0.1197, 415),
(24, 'ru', 1041, 0.1896, 415),
(24, 'ru', 1042, 0.1197, 417),
(24, 'ru', 1043, 0.1197, 425),
(24, 'ru', 1044, 0.1197, 428),
(24, 'ru', 1045, 0.1197, 430),
(24, 'ru', 1046, 0.1896, 430),
(24, 'ru', 1182, 0.1197, 59),
(24, 'ru', 1224, 0.1197, 13),
(24, 'ru', 1225, 0.1197, 18),
(24, 'ru', 1226, 0.1197, 25),
(24, 'ru', 1227, 0.1197, 31),
(24, 'ru', 1228, 0.1197, 32),
(24, 'ru', 1229, 0.1197, 33),
(24, 'ru', 1230, 0.1197, 34),
(24, 'ru', 1231, 0.1197, 35),
(24, 'ru', 1232, 0.1197, 40),
(24, 'ru', 1233, 0.1197, 41),
(24, 'ru', 1234, 0.1197, 42),
(24, 'ru', 1235, 0.1197, 43),
(24, 'ru', 1236, 0.1197, 47),
(24, 'ru', 1237, 0.1197, 62),
(24, 'ru', 1238, 0.1197, 120),
(24, 'ru', 1239, 0.1197, 123),
(24, 'ru', 1240, 0.1197, 128),
(24, 'ru', 1241, 0.1197, 130),
(24, 'ru', 1242, 0.1896, 130),
(24, 'ru', 1243, 0.1197, 145),
(24, 'ru', 1244, 0.1197, 153),
(24, 'ru', 1245, 0.1197, 156),
(24, 'ru', 1246, 0.1197, 180),
(25, 'ru', 3, 0.4577, 153),
(25, 'ru', 8, 0.1277, 111),
(25, 'ru', 15, 0.2023, 93),
(25, 'ru', 23, 0.1277, 231),
(25, 'ru', 24, 0.1277, 11),
(25, 'ru', 27, 0.2023, 49.5),
(25, 'ru', 28, 0.4047, 112.875),
(25, 'ru', 29, 0.5693, 175.809),
(25, 'ru', 30, 0.1277, 189),
(25, 'ru', 32, 0.1277, 246),
(25, 'ru', 47, 0.2553, 244.667),
(25, 'ru', 73, 0.1277, 270),
(25, 'ru', 75, 0.1277, 306),
(25, 'ru', 79, 0.1277, 25),
(25, 'ru', 80, 0.1277, 244),
(25, 'ru', 81, 0.2023, 42.5),
(25, 'ru', 94, 0.1277, 26),
(25, 'ru', 104, 0.1277, 146),
(25, 'ru', 116, 0.2023, 238.5),
(25, 'ru', 134, 0.1277, 104),
(25, 'ru', 136, 0.2023, 47.5),
(25, 'ru', 155, 0.1277, 51),
(25, 'ru', 183, 0.1277, 289),
(25, 'ru', 220, 0.1277, 100),
(25, 'ru', 221, 0.1277, 114),
(25, 'ru', 227, 0.2023, 75.5),
(25, 'ru', 228, 0.1277, 276),
(25, 'ru', 229, 0.2023, 122),
(25, 'ru', 236, 0.1277, 346),
(25, 'ru', 237, 0.2023, 37.5),
(25, 'ru', 253, 0.1277, 313),
(25, 'ru', 259, 0.1277, 142),
(25, 'ru', 264, 0.1277, 301),
(25, 'ru', 269, 0.1277, 256),
(25, 'ru', 270, 0.1277, 304),
(25, 'ru', 279, 0.1277, 266),
(25, 'ru', 280, 0.2964, 90.5),
(25, 'ru', 286, 0.1277, 127),
(25, 'ru', 287, 0.1277, 185),
(25, 'ru', 307, 0.1277, 115),
(25, 'ru', 376, 0.1277, 139),
(25, 'ru', 377, 0.2023, 139),
(25, 'ru', 431, 0.1277, 122),
(25, 'ru', 437, 0.1277, 330),
(25, 'ru', 464, 0.1277, 230),
(25, 'ru', 499, 0.1277, 262),
(25, 'ru', 541, 0.1277, 349),
(25, 'ru', 565, 0.1277, 213),
(25, 'ru', 568, 0.1277, 159),
(25, 'ru', 635, 0.1277, 245),
(25, 'ru', 639, 0.2023, 242.5),
(25, 'ru', 640, 0.1277, 252),
(25, 'ru', 649, 0.2023, 211.5),
(25, 'ru', 652, 0.2023, 202),
(25, 'ru', 654, 0.1277, 329),
(25, 'ru', 669, 0.1277, 201),
(25, 'ru', 675, 0.1277, 341),
(25, 'ru', 683, 0.2023, 271.5),
(25, 'ru', 684, 0.1277, 291),
(25, 'ru', 685, 0.2023, 300),
(25, 'ru', 686, 0.2964, 300),
(25, 'ru', 693, 0.1277, 345),
(25, 'ru', 696, 0.1277, 249),
(25, 'ru', 729, 0.1277, 226),
(25, 'ru', 751, 0.1277, 343),
(25, 'ru', 784, 0.1277, 154),
(25, 'ru', 799, 0.1277, 288),
(25, 'ru', 803, 0.1277, 232),
(25, 'ru', 804, 0.2023, 232),
(25, 'ru', 813, 0.1277, 221),
(25, 'ru', 842, 0.1277, 108),
(25, 'ru', 844, 0.1277, 332),
(25, 'ru', 856, 0.1277, 237),
(25, 'ru', 879, 0.1277, 197),
(25, 'ru', 881, 0.1277, 337),
(25, 'ru', 888, 0.2023, 255),
(25, 'ru', 910, 0.1277, 235),
(25, 'ru', 943, 0.1277, 5),
(25, 'ru', 968, 0.1277, 336),
(25, 'ru', 975, 0.2023, 302),
(25, 'ru', 988, 0.1277, 206),
(25, 'ru', 1011, 0.2023, 47),
(25, 'ru', 1049, 0.1277, 106),
(25, 'ru', 1063, 0.2023, 201.5),
(25, 'ru', 1068, 0.1277, 200),
(25, 'ru', 1086, 0.2023, 301),
(25, 'ru', 1103, 0.2964, 303),
(25, 'ru', 1106, 0.1277, 195),
(25, 'ru', 1122, 0.2023, 277),
(25, 'ru', 1148, 0.1277, 225),
(25, 'ru', 1172, 0.1277, 243),
(25, 'ru', 1175, 0.1277, 339),
(25, 'ru', 1181, 0.1277, 145),
(25, 'ru', 1196, 0.1277, 87),
(25, 'ru', 1200, 0.1277, 310),
(25, 'ru', 1202, 0.1277, 136),
(25, 'ru', 1216, 0.1277, 77),
(25, 'ru', 1218, 0.2023, 194),
(25, 'ru', 1247, 0.1277, 18),
(25, 'ru', 1248, 0.1277, 29),
(25, 'ru', 1249, 0.1277, 32),
(25, 'ru', 1250, 0.1277, 33),
(25, 'ru', 1251, 0.1277, 35),
(25, 'ru', 1252, 0.1277, 36),
(25, 'ru', 1253, 0.1277, 38),
(25, 'ru', 1254, 0.2023, 48),
(25, 'ru', 1255, 0.1277, 56),
(25, 'ru', 1256, 0.1277, 59),
(25, 'ru', 1257, 0.1277, 61),
(25, 'ru', 1258, 0.1277, 63),
(25, 'ru', 1259, 0.1277, 63),
(25, 'ru', 1260, 0.1277, 64),
(25, 'ru', 1261, 0.1277, 70),
(25, 'ru', 1262, 0.1277, 88),
(25, 'ru', 1263, 0.1277, 88),
(25, 'ru', 1264, 0.1277, 91),
(25, 'ru', 1265, 0.1277, 102),
(25, 'ru', 1266, 0.1277, 110),
(25, 'ru', 1267, 0.1277, 123),
(25, 'ru', 1268, 0.1277, 126),
(25, 'ru', 1269, 0.1277, 131),
(25, 'ru', 1270, 0.1277, 141),
(25, 'ru', 1271, 0.1277, 143),
(25, 'ru', 1272, 0.1277, 144),
(25, 'ru', 1273, 0.1277, 155),
(25, 'ru', 1274, 0.1277, 158),
(25, 'ru', 1275, 0.1277, 160),
(25, 'ru', 1276, 0.1277, 168),
(25, 'ru', 1277, 0.1277, 173),
(25, 'ru', 1278, 0.1277, 180),
(25, 'ru', 1279, 0.1277, 186),
(25, 'ru', 1280, 0.1277, 188),
(25, 'ru', 1281, 0.1277, 196),
(25, 'ru', 1282, 0.1277, 208),
(25, 'ru', 1283, 0.1277, 210),
(25, 'ru', 1284, 0.1277, 212),
(25, 'ru', 1285, 0.1277, 233),
(25, 'ru', 1286, 0.1277, 241),
(25, 'ru', 1287, 0.2023, 274.5),
(25, 'ru', 1288, 0.1277, 255),
(25, 'ru', 1289, 0.1277, 267),
(25, 'ru', 1290, 0.1277, 269),
(25, 'ru', 1291, 0.2023, 314.5),
(25, 'ru', 1292, 0.1277, 281),
(25, 'ru', 1293, 0.2023, 303),
(25, 'ru', 1294, 0.1277, 294),
(25, 'ru', 1295, 0.1277, 297),
(25, 'ru', 1296, 0.1277, 312),
(25, 'ru', 1297, 0.1277, 315),
(25, 'ru', 1298, 0.1277, 317),
(25, 'ru', 1299, 0.1277, 331),
(25, 'ru', 1300, 0.1277, 334),
(25, 'ru', 1301, 0.1277, 340),
(25, 'ru', 1302, 0.1277, 348),
(26, 'ru', 3, 0.3093, 89.75),
(26, 'ru', 5, 0.1332, 221),
(26, 'ru', 21, 0.2111, 215.5),
(26, 'ru', 59, 0.1332, 83),
(26, 'ru', 63, 0.1332, 43),
(26, 'ru', 73, 0.2111, 201),
(26, 'ru', 75, 0.3739, 65.1667),
(26, 'ru', 86, 0.1332, 33),
(26, 'ru', 93, 0.1332, 25),
(26, 'ru', 106, 0.1332, 77),
(26, 'ru', 109, 0.1332, 188),
(26, 'ru', 112, 0.5204, 241.357),
(26, 'ru', 130, 0.1332, 176),
(26, 'ru', 131, 0.2111, 101.5),
(26, 'ru', 132, 0.2111, 103.5),
(26, 'ru', 133, 0.3093, 109.25),
(26, 'ru', 141, 0.1332, 85),
(26, 'ru', 160, 0.1332, 18),
(26, 'ru', 169, 0.3443, 202.2),
(26, 'ru', 197, 0.1332, 72),
(26, 'ru', 218, 0.2111, 15),
(26, 'ru', 237, 0.1332, 179),
(26, 'ru', 253, 0.3739, 119.167),
(26, 'ru', 254, 0.1332, 7),
(26, 'ru', 265, 0.1332, 37),
(26, 'ru', 269, 0.1332, 73),
(26, 'ru', 270, 0.3093, 138.5),
(26, 'ru', 280, 0.2111, 95),
(26, 'ru', 286, 0.1332, 8),
(26, 'ru', 347, 0.1332, 187),
(26, 'ru', 357, 0.1332, 24),
(26, 'ru', 392, 0.1332, 10),
(26, 'ru', 446, 0.1332, 27),
(26, 'ru', 489, 0.1332, 98),
(26, 'ru', 504, 0.1332, 111),
(26, 'ru', 563, 0.1332, 146),
(26, 'ru', 565, 0.1332, 117),
(26, 'ru', 566, 0.1332, 134),
(26, 'ru', 569, 0.1332, 113),
(26, 'ru', 571, 0.1332, 160),
(26, 'ru', 572, 0.1332, 162),
(26, 'ru', 576, 0.1332, 142),
(26, 'ru', 578, 0.1332, 115),
(26, 'ru', 607, 0.2111, 257.5),
(26, 'ru', 638, 0.1332, 138),
(26, 'ru', 660, 0.1332, 158),
(26, 'ru', 675, 0.1332, 40),
(26, 'ru', 677, 0.1332, 126),
(26, 'ru', 693, 0.1332, 95),
(26, 'ru', 697, 0.1332, 100),
(26, 'ru', 706, 0.1332, 69),
(26, 'ru', 709, 0.1332, 75),
(26, 'ru', 740, 0.1332, 153),
(26, 'ru', 744, 0.2664, 115.333),
(26, 'ru', 748, 0.1332, 208),
(26, 'ru', 759, 0.4222, 248.25),
(26, 'ru', 778, 0.2111, 119),
(26, 'ru', 796, 0.1332, 205),
(26, 'ru', 813, 0.1332, 53),
(26, 'ru', 831, 0.1332, 71),
(26, 'ru', 842, 0.2111, 134),
(26, 'ru', 903, 0.1332, 228),
(26, 'ru', 919, 0.1332, 213),
(26, 'ru', 927, 0.2111, 133.5),
(26, 'ru', 1055, 0.1332, 263),
(26, 'ru', 1056, 0.1332, 79),
(26, 'ru', 1063, 0.1332, 66),
(26, 'ru', 1076, 0.1332, 30),
(26, 'ru', 1079, 0.2111, 70.5),
(26, 'ru', 1103, 0.1332, 88),
(26, 'ru', 1126, 0.1332, 45),
(26, 'ru', 1127, 0.1332, 47),
(26, 'ru', 1129, 0.1332, 68),
(26, 'ru', 1131, 0.1332, 211),
(26, 'ru', 1138, 0.3093, 248.25),
(26, 'ru', 1140, 0.1332, 224),
(26, 'ru', 1142, 0.1332, 236),
(26, 'ru', 1148, 0.2111, 81),
(26, 'ru', 1153, 0.1332, 44),
(26, 'ru', 1169, 0.3093, 245.25),
(26, 'ru', 1170, 0.2111, 247),
(26, 'ru', 1202, 0.1332, 145),
(26, 'ru', 1216, 0.1332, 122),
(26, 'ru', 1233, 0.1332, 144),
(26, 'ru', 1268, 0.1332, 20),
(26, 'ru', 1303, 0.1332, 28),
(26, 'ru', 1304, 0.1332, 32),
(26, 'ru', 1305, 0.1332, 39),
(26, 'ru', 1306, 0.2664, 98.6667),
(26, 'ru', 1307, 0.1332, 64),
(26, 'ru', 1308, 0.1332, 65),
(26, 'ru', 1309, 0.1332, 78),
(26, 'ru', 1310, 0.1332, 82),
(26, 'ru', 1311, 0.1332, 87),
(26, 'ru', 1312, 0.1332, 90),
(26, 'ru', 1313, 0.1332, 91),
(26, 'ru', 1314, 0.1332, 92),
(26, 'ru', 1315, 0.1332, 93),
(26, 'ru', 1316, 0.1332, 96),
(26, 'ru', 1317, 0.2111, 137.5),
(26, 'ru', 1318, 0.1332, 110),
(26, 'ru', 1319, 0.1332, 116),
(26, 'ru', 1320, 0.1332, 119),
(26, 'ru', 1321, 0.1332, 125),
(26, 'ru', 1322, 0.1332, 135),
(26, 'ru', 1323, 0.1332, 137),
(26, 'ru', 1324, 0.1332, 152),
(26, 'ru', 1325, 0.2111, 169.5),
(26, 'ru', 1326, 0.1332, 172),
(26, 'ru', 1327, 0.1332, 207),
(26, 'ru', 1328, 0.1332, 226),
(26, 'ru', 1329, 0.1332, 252),
(26, 'ru', 1330, 0.1332, 257),
(26, 'ru', 1331, 0.1332, 271),
(27, 'ru', 3, 0.1508, 3),
(27, 'ru', 15, 0.1508, 15),
(27, 'ru', 90, 0.1508, 23),
(27, 'ru', 110, 0.1508, 162),
(27, 'ru', 116, 0.1508, 9),
(27, 'ru', 118, 0.1508, 167),
(27, 'ru', 155, 0.1508, 11),
(27, 'ru', 194, 0.3502, 151),
(27, 'ru', 237, 0.1508, 4),
(27, 'ru', 249, 0.3502, 111.25),
(27, 'ru', 250, 0.4235, 87.1667),
(27, 'ru', 280, 0.1508, 2),
(27, 'ru', 347, 0.1508, 14),
(27, 'ru', 502, 0.1508, 6),
(27, 'ru', 551, 0.2391, 135.5),
(27, 'ru', 552, 0.5408, 105.727),
(27, 'ru', 649, 0.1508, 195),
(27, 'ru', 682, 0.1508, 8),
(27, 'ru', 685, 0.3017, 44.6667),
(27, 'ru', 686, 0.4235, 44.6667),
(27, 'ru', 759, 0.4235, 172.833),
(27, 'ru', 796, 0.1508, 166),
(27, 'ru', 842, 0.4782, 132.25),
(27, 'ru', 1118, 0.2391, 103.5),
(27, 'ru', 1129, 0.2391, 82),
(27, 'ru', 1138, 0.2391, 193.5),
(27, 'ru', 1140, 0.1508, 189),
(27, 'ru', 1235, 0.1508, 187),
(27, 'ru', 1332, 0.1508, 7),
(27, 'ru', 1333, 0.1508, 16),
(27, 'ru', 1334, 0.1508, 22),
(27, 'ru', 1335, 0.2391, 104.5),
(27, 'ru', 1336, 0.3017, 88.3333),
(27, 'ru', 1337, 0.1508, 27),
(27, 'ru', 1338, 0.2391, 83.5),
(27, 'ru', 1339, 0.3017, 43.6667),
(27, 'ru', 1340, 0.3899, 122.8),
(27, 'ru', 1341, 0.2391, 128.5),
(27, 'ru', 1342, 0.2391, 133.5),
(27, 'ru', 1343, 0.1508, 163),
(27, 'ru', 1344, 0.1508, 165),
(27, 'ru', 1345, 0.1508, 169),
(27, 'ru', 1346, 0.1508, 193),
(28, 'ru', 3, 0.3828, 47),
(28, 'ru', 17, 0.1649, 5),
(28, 'ru', 27, 0.1649, 30),
(28, 'ru', 28, 0.1649, 98),
(28, 'ru', 29, 0.1649, 99),
(28, 'ru', 31, 0.1649, 43),
(28, 'ru', 47, 0.3297, 65.3333),
(28, 'ru', 54, 0.1649, 74),
(28, 'ru', 73, 0.1649, 29),
(28, 'ru', 75, 0.1649, 95),
(28, 'ru', 107, 0.1649, 76),
(28, 'ru', 116, 0.1649, 78),
(28, 'ru', 130, 0.2613, 48.5),
(28, 'ru', 131, 0.3828, 32.75),
(28, 'ru', 132, 0.3828, 34.75),
(28, 'ru', 133, 0.3828, 35.75),
(28, 'ru', 141, 0.1649, 49),
(28, 'ru', 155, 0.1649, 50),
(28, 'ru', 218, 0.1649, 17),
(28, 'ru', 228, 0.1649, 87),
(28, 'ru', 237, 0.1649, 85),
(28, 'ru', 249, 0.1649, 97),
(28, 'ru', 280, 0.2613, 41.5),
(28, 'ru', 284, 0.1649, 28),
(28, 'ru', 286, 0.1649, 13),
(28, 'ru', 287, 0.1649, 63),
(28, 'ru', 291, 0.1649, 18),
(28, 'ru', 295, 0.1649, 40),
(28, 'ru', 392, 0.1649, 15),
(28, 'ru', 434, 0.1649, 48),
(28, 'ru', 458, 0.1649, 42),
(28, 'ru', 460, 0.1649, 35),
(28, 'ru', 508, 0.1649, 66),
(28, 'ru', 546, 0.1649, 60),
(28, 'ru', 811, 0.1649, 42),
(28, 'ru', 821, 0.1649, 45),
(28, 'ru', 822, 0.1649, 86),
(28, 'ru', 1013, 0.1649, 27),
(28, 'ru', 1016, 0.1649, 16),
(28, 'ru', 1024, 0.1649, 68),
(28, 'ru', 1029, 0.1649, 38),
(28, 'ru', 1238, 0.1649, 36),
(28, 'ru', 1239, 0.1649, 39),
(28, 'ru', 1240, 0.1649, 44),
(28, 'ru', 1241, 0.1649, 46),
(28, 'ru', 1242, 0.2613, 46),
(28, 'ru', 1243, 0.1649, 61),
(28, 'ru', 1244, 0.1649, 69),
(28, 'ru', 1245, 0.1649, 72),
(28, 'ru', 1246, 0.1649, 96),
(29, 'ru', 3, 0.212, 132),
(29, 'ru', 12, 0.3106, 195.75),
(29, 'ru', 30, 0.1338, 99),
(29, 'ru', 31, 0.1338, 248),
(29, 'ru', 32, 0.1338, 161),
(29, 'ru', 34, 0.1338, 9),
(29, 'ru', 47, 0.1338, 7),
(29, 'ru', 104, 0.3106, 101.75),
(29, 'ru', 111, 0.1338, 216),
(29, 'ru', 130, 0.212, 125),
(29, 'ru', 141, 0.1338, 178),
(29, 'ru', 163, 0.1338, 241),
(29, 'ru', 169, 0.2675, 126),
(29, 'ru', 205, 0.2675, 135.333),
(29, 'ru', 227, 0.3106, 149),
(29, 'ru', 235, 0.1338, 246),
(29, 'ru', 238, 0.2675, 155.667),
(29, 'ru', 245, 0.1338, 249),
(29, 'ru', 254, 0.1338, 269),
(29, 'ru', 256, 0.1338, 4),
(29, 'ru', 257, 0.1338, 271),
(29, 'ru', 258, 0.1338, 6),
(29, 'ru', 262, 0.1338, 185),
(29, 'ru', 263, 0.495, 128.083),
(29, 'ru', 265, 0.1338, 87),
(29, 'ru', 270, 0.1338, 105),
(29, 'ru', 271, 0.1338, 91),
(29, 'ru', 274, 0.1338, 10),
(29, 'ru', 280, 0.212, 131),
(29, 'ru', 420, 0.1338, 146),
(29, 'ru', 484, 0.2675, 156.667),
(29, 'ru', 540, 0.1338, 89),
(29, 'ru', 607, 0.212, 136.5),
(29, 'ru', 660, 0.212, 274),
(29, 'ru', 675, 0.2675, 124),
(29, 'ru', 683, 0.1338, 171),
(29, 'ru', 693, 0.1338, 190),
(29, 'ru', 709, 0.1338, 258),
(29, 'ru', 731, 0.3106, 43.5),
(29, 'ru', 744, 0.1338, 264),
(29, 'ru', 754, 0.2675, 141.333),
(29, 'ru', 772, 0.1338, 45),
(29, 'ru', 778, 0.2675, 114),
(29, 'ru', 794, 0.2675, 201.667),
(29, 'ru', 796, 0.3106, 158.75),
(29, 'ru', 829, 0.1338, 280),
(29, 'ru', 842, 0.3755, 134.833),
(29, 'ru', 896, 0.1338, 274),
(29, 'ru', 909, 0.212, 274),
(29, 'ru', 915, 0.1338, 279),
(29, 'ru', 968, 0.1338, 147),
(29, 'ru', 973, 0.1338, 103),
(29, 'ru', 981, 0.1338, 12),
(29, 'ru', 999, 0.1338, 104),
(29, 'ru', 1037, 0.1338, 181),
(29, 'ru', 1051, 0.1338, 244),
(29, 'ru', 1063, 0.2675, 159.667),
(29, 'ru', 1126, 0.2675, 128),
(29, 'ru', 1127, 0.2675, 129),
(29, 'ru', 1130, 0.2675, 130),
(29, 'ru', 1153, 0.2675, 127),
(29, 'ru', 1179, 0.1338, 168),
(29, 'ru', 1181, 0.2675, 158.667),
(29, 'ru', 1246, 0.4013, 105.857),
(29, 'ru', 1306, 0.1338, 263),
(29, 'ru', 1314, 0.3106, 41.75),
(29, 'ru', 1315, 0.4013, 190.286),
(29, 'ru', 1345, 0.1338, 5),
(29, 'ru', 1347, 0.2675, 63.6667),
(29, 'ru', 1348, 0.1338, 41),
(29, 'ru', 1349, 0.1338, 42),
(29, 'ru', 1350, 0.2675, 147.333),
(29, 'ru', 1351, 0.2675, 151.667),
(29, 'ru', 1352, 0.212, 89.5),
(29, 'ru', 1353, 0.1338, 100),
(29, 'ru', 1354, 0.1338, 106),
(29, 'ru', 1355, 0.1338, 148),
(29, 'ru', 1356, 0.1338, 163),
(29, 'ru', 1357, 0.1338, 169),
(29, 'ru', 1358, 0.1338, 170),
(29, 'ru', 1359, 0.1338, 179),
(29, 'ru', 1360, 0.1338, 182),
(29, 'ru', 1361, 0.1338, 183),
(29, 'ru', 1362, 0.1338, 184),
(29, 'ru', 1363, 0.1338, 186),
(29, 'ru', 1364, 0.1338, 188),
(29, 'ru', 1365, 0.1338, 189),
(29, 'ru', 1366, 0.1338, 259),
(29, 'ru', 1367, 0.1338, 272),
(29, 'ru', 1368, 0.1338, 273),
(29, 'ru', 1369, 0.1338, 281),
(30, 'ru', 3, 0.2314, 2),
(30, 'ru', 558, 0.2314, 1),
(31, 'ru', 3, 0.2944, 36.3333),
(31, 'ru', 15, 0.2333, 115),
(31, 'ru', 47, 0.3805, 62.2),
(31, 'ru', 86, 0.2333, 50),
(31, 'ru', 93, 0.3417, 78),
(31, 'ru', 153, 0.3417, 98),
(31, 'ru', 219, 0.2333, 106),
(31, 'ru', 256, 0.2333, 96),
(31, 'ru', 357, 0.3417, 77),
(31, 'ru', 446, 0.3417, 80),
(31, 'ru', 551, 0.4415, 70.2857),
(31, 'ru', 674, 0.2944, 50.3333),
(31, 'ru', 675, 0.2944, 51.3333),
(31, 'ru', 747, 0.6252, 80.7778),
(31, 'ru', 932, 0.4889, 80.7778),
(31, 'ru', 1011, 0.2333, 98),
(31, 'ru', 1060, 0.4415, 70.7143),
(31, 'ru', 1196, 0.2333, 113),
(31, 'ru', 1303, 0.3417, 81),
(31, 'ru', 1370, 0.2944, 37.3333),
(31, 'ru', 1371, 0.2944, 39.3333),
(31, 'ru', 1372, 0.2333, 49),
(31, 'ru', 1373, 0.2333, 51),
(31, 'ru', 1374, 0.2333, 78),
(31, 'ru', 1375, 0.3417, 96),
(31, 'ru', 1376, 0.3417, 99),
(31, 'ru', 1377, 0.2333, 95),
(31, 'ru', 1378, 0.2333, 114),
(32, 'ru', 3, 0.2522, 41.5),
(32, 'ru', 17, 0.2522, 52.5),
(32, 'ru', 31, 0.2522, 48.5),
(32, 'ru', 80, 0.4113, 61.6),
(32, 'ru', 86, 0.2522, 44.5),
(32, 'ru', 105, 0.4113, 58.6),
(32, 'ru', 107, 0.2522, 83.5),
(32, 'ru', 119, 0.1591, 6),
(32, 'ru', 187, 0.2522, 79.5),
(32, 'ru', 223, 0.3182, 64.3333),
(32, 'ru', 237, 0.2522, 42.5),
(32, 'ru', 280, 0.2522, 40.5),
(32, 'ru', 645, 0.2522, 82.5),
(32, 'ru', 728, 0.2522, 91.5),
(32, 'ru', 1175, 0.2522, 81.5),
(32, 'ru', 1377, 0.2522, 70.5),
(32, 'ru', 1379, 0.3182, 33.3333),
(32, 'ru', 1380, 0.1591, 8),
(32, 'ru', 1381, 0.3694, 55.5),
(32, 'ru', 1382, 0.3694, 56.5),
(32, 'ru', 1383, 0.2522, 49.5),
(32, 'ru', 1384, 0.2522, 50.5),
(32, 'ru', 1385, 0.2522, 60.5),
(32, 'ru', 1386, 0.2522, 61.5),
(32, 'ru', 1387, 0.2522, 62.5),
(32, 'ru', 1388, 0.2522, 64.5),
(32, 'ru', 1389, 0.2522, 69.5),
(32, 'ru', 1390, 0.2522, 71.5),
(32, 'ru', 1391, 0.2522, 72.5),
(32, 'ru', 1392, 0.2522, 85.5),
(32, 'ru', 1393, 0.2522, 86.5),
(32, 'ru', 1394, 0.2522, 87.5),
(32, 'ru', 1395, 0.2522, 89.5),
(32, 'ru', 1396, 0.2522, 92.5),
(33, 'ru', 3, 0.3605, 71.6),
(33, 'ru', 15, 0.2211, 82),
(33, 'ru', 16, 0.5161, 120.667),
(33, 'ru', 23, 0.1395, 2),
(33, 'ru', 31, 0.2211, 75),
(33, 'ru', 47, 0.3238, 85),
(33, 'ru', 56, 0.2211, 126),
(33, 'ru', 86, 0.2211, 91),
(33, 'ru', 87, 0.2211, 69),
(33, 'ru', 89, 0.2211, 68),
(33, 'ru', 107, 0.2211, 64),
(33, 'ru', 133, 0.2211, 143),
(33, 'ru', 155, 0.2211, 73),
(33, 'ru', 233, 0.3238, 123),
(33, 'ru', 237, 0.2211, 78),
(33, 'ru', 238, 0.2211, 127),
(33, 'ru', 257, 0.2211, 94),
(33, 'ru', 265, 0.2211, 72),
(33, 'ru', 280, 0.2211, 90),
(33, 'ru', 284, 0.2211, 156),
(33, 'ru', 347, 0.2211, 93),
(33, 'ru', 434, 0.2211, 135),
(33, 'ru', 438, 0.2211, 136),
(33, 'ru', 477, 0.2211, 113),
(33, 'ru', 484, 0.2211, 128),
(33, 'ru', 503, 0.2211, 80),
(33, 'ru', 584, 0.2211, 131),
(33, 'ru', 638, 0.2211, 158),
(33, 'ru', 642, 0.3238, 149),
(33, 'ru', 652, 0.2211, 98),
(33, 'ru', 709, 0.3238, 130),
(33, 'ru', 810, 0.2211, 109),
(33, 'ru', 857, 0.3238, 125.5),
(33, 'ru', 1116, 0.3238, 83),
(33, 'ru', 1196, 0.2211, 65),
(33, 'ru', 1216, 0.2789, 67.6667),
(33, 'ru', 1320, 0.2211, 63),
(33, 'ru', 1358, 0.2211, 66),
(33, 'ru', 1359, 0.2211, 116),
(33, 'ru', 1377, 0.2211, 151),
(33, 'ru', 1385, 0.2211, 89),
(33, 'ru', 1397, 0.1395, 1),
(33, 'ru', 1398, 0.2211, 67),
(33, 'ru', 1399, 0.2211, 77),
(33, 'ru', 1400, 0.2211, 92),
(33, 'ru', 1401, 0.2211, 108),
(33, 'ru', 1402, 0.2211, 110),
(33, 'ru', 1403, 0.2211, 111),
(33, 'ru', 1404, 0.2211, 112),
(33, 'ru', 1405, 0.2211, 118),
(33, 'ru', 1406, 0.2211, 139),
(33, 'ru', 1407, 0.2211, 142),
(33, 'ru', 1408, 0.2211, 150),
(33, 'ru', 1409, 0.2211, 152),
(33, 'ru', 1410, 0.2211, 154),
(33, 'ru', 1411, 0.2211, 155),
(33, 'ru', 1412, 0.2211, 164),
(33, 'ru', 1413, 0.2211, 166),
(33, 'ru', 1414, 0.2211, 169),
(33, 'ru', 1415, 0.2211, 170),
(34, 'ru', 3, 0.3636, 81.8),
(34, 'ru', 5, 0.1407, 153),
(34, 'ru', 17, 0.2814, 101.333),
(34, 'ru', 23, 0.1407, 8),
(34, 'ru', 34, 0.1407, 12),
(34, 'ru', 41, 0.3266, 72.75),
(34, 'ru', 42, 0.3949, 81.6667),
(34, 'ru', 43, 0.3266, 72.75),
(34, 'ru', 44, 0.1407, 129),
(34, 'ru', 57, 0.2814, 31.6667),
(34, 'ru', 62, 0.1407, 58),
(34, 'ru', 63, 0.1407, 190),
(34, 'ru', 75, 0.1407, 122),
(34, 'ru', 104, 0.1407, 21),
(34, 'ru', 122, 0.1407, 1),
(34, 'ru', 124, 0.1407, 178),
(34, 'ru', 130, 0.1407, 37),
(34, 'ru', 141, 0.1407, 80),
(34, 'ru', 189, 0.223, 111.5),
(34, 'ru', 201, 0.1407, 106),
(34, 'ru', 213, 0.1407, 35),
(34, 'ru', 257, 0.1407, 179),
(34, 'ru', 260, 0.1407, 121),
(34, 'ru', 270, 0.3636, 40.2),
(34, 'ru', 322, 0.1407, 13),
(34, 'ru', 328, 0.1407, 11),
(34, 'ru', 438, 0.1407, 92),
(34, 'ru', 473, 0.3266, 64.75),
(34, 'ru', 474, 0.4459, 64.75),
(34, 'ru', 477, 0.1407, 7),
(34, 'ru', 478, 0.1407, 116),
(34, 'ru', 524, 0.1407, 138),
(34, 'ru', 566, 0.1407, 2),
(34, 'ru', 669, 0.1407, 91),
(34, 'ru', 709, 0.1407, 9),
(34, 'ru', 733, 0.1407, 144),
(34, 'ru', 744, 0.223, 66),
(34, 'ru', 754, 0.1407, 171),
(34, 'ru', 755, 0.1407, 163),
(34, 'ru', 778, 0.1407, 128),
(34, 'ru', 787, 0.223, 152.5),
(34, 'ru', 850, 0.1407, 162),
(34, 'ru', 857, 0.1407, 90),
(34, 'ru', 876, 0.1407, 113),
(34, 'ru', 881, 0.1407, 187),
(34, 'ru', 1066, 0.1407, 148),
(34, 'ru', 1083, 0.2814, 73),
(34, 'ru', 1191, 0.1407, 65),
(34, 'ru', 1192, 0.2814, 53),
(34, 'ru', 1267, 0.1407, 186),
(34, 'ru', 1308, 0.1407, 147),
(34, 'ru', 1416, 0.223, 13.5),
(34, 'ru', 1417, 0.1407, 10),
(34, 'ru', 1418, 0.223, 21),
(34, 'ru', 1419, 0.1407, 17),
(34, 'ru', 1420, 0.1407, 20),
(34, 'ru', 1421, 0.1407, 26),
(34, 'ru', 1422, 0.1407, 27),
(34, 'ru', 1423, 0.223, 38),
(34, 'ru', 1424, 0.1407, 36),
(34, 'ru', 1425, 0.1407, 38),
(34, 'ru', 1426, 0.1407, 39),
(34, 'ru', 1427, 0.1407, 40),
(34, 'ru', 1428, 0.1407, 43),
(34, 'ru', 1429, 0.1407, 57),
(34, 'ru', 1430, 0.1407, 59),
(34, 'ru', 1431, 0.223, 82.5),
(34, 'ru', 1432, 0.1407, 72),
(34, 'ru', 1433, 0.1407, 74),
(34, 'ru', 1434, 0.223, 90.5),
(34, 'ru', 1435, 0.1407, 78),
(34, 'ru', 1436, 0.1407, 81),
(34, 'ru', 1437, 0.1407, 84),
(34, 'ru', 1438, 0.1407, 85),
(34, 'ru', 1439, 0.223, 85),
(34, 'ru', 1440, 0.1407, 86),
(34, 'ru', 1441, 0.1407, 87),
(34, 'ru', 1442, 0.1407, 96),
(34, 'ru', 1443, 0.223, 104.5),
(34, 'ru', 1444, 0.1407, 105),
(34, 'ru', 1445, 0.1407, 108),
(34, 'ru', 1446, 0.1407, 115),
(34, 'ru', 1447, 0.1407, 137),
(34, 'ru', 1448, 0.1407, 146),
(34, 'ru', 1449, 0.1407, 155),
(34, 'ru', 1450, 0.1407, 169),
(34, 'ru', 1451, 0.1407, 170),
(34, 'ru', 1452, 0.1407, 177),
(34, 'ru', 1453, 0.1407, 180),
(34, 'ru', 1454, 0.1407, 188),
(34, 'ru', 1455, 0.1407, 189),
(35, 'ru', 17, 0.2729, 37.5),
(35, 'ru', 20, 0.1722, 26),
(35, 'ru', 63, 0.1722, 48),
(35, 'ru', 89, 0.3444, 19.6667),
(35, 'ru', 90, 0.4834, 19.6667),
(35, 'ru', 124, 0.1722, 81),
(35, 'ru', 155, 0.3444, 18.6667),
(35, 'ru', 257, 0.1722, 49),
(35, 'ru', 322, 0.1722, 10),
(35, 'ru', 328, 0.1722, 9),
(35, 'ru', 440, 0.1722, 21),
(35, 'ru', 453, 0.1722, 14),
(35, 'ru', 491, 0.2729, 19),
(35, 'ru', 507, 0.1722, 24),
(35, 'ru', 566, 0.1722, 1),
(35, 'ru', 660, 0.2729, 38),
(35, 'ru', 673, 0.3444, 17),
(35, 'ru', 709, 0.1722, 7),
(35, 'ru', 733, 0.1722, 62),
(35, 'ru', 754, 0.1722, 74),
(35, 'ru', 778, 0.1722, 44),
(35, 'ru', 881, 0.1722, 37),
(35, 'ru', 896, 0.1722, 38),
(35, 'ru', 1024, 0.1722, 22),
(35, 'ru', 1066, 0.1722, 66),
(35, 'ru', 1191, 0.1722, 32),
(35, 'ru', 1267, 0.1722, 56),
(35, 'ru', 1308, 0.1722, 65),
(35, 'ru', 1417, 0.1722, 8),
(35, 'ru', 1418, 0.1722, 11),
(35, 'ru', 1448, 0.1722, 64),
(35, 'ru', 1450, 0.1722, 72),
(35, 'ru', 1452, 0.1722, 80),
(35, 'ru', 1453, 0.1722, 50),
(35, 'ru', 1455, 0.1722, 47),
(35, 'ru', 1456, 0.1722, 18),
(35, 'ru', 1457, 0.1722, 19),
(35, 'ru', 1458, 0.1722, 20),
(35, 'ru', 1459, 0.1722, 23),
(35, 'ru', 1460, 0.1722, 25),
(35, 'ru', 1461, 0.1722, 45),
(35, 'ru', 1462, 0.1722, 73),
(36, 'ru', 3, 0.3492, 29.3333),
(36, 'ru', 17, 0.3492, 31),
(36, 'ru', 51, 0.1746, 6),
(36, 'ru', 57, 0.2767, 35),
(36, 'ru', 63, 0.1746, 53),
(36, 'ru', 86, 0.1746, 43),
(36, 'ru', 92, 0.2767, 23.5),
(36, 'ru', 93, 0.2767, 26.5),
(36, 'ru', 104, 0.1746, 12),
(36, 'ru', 106, 0.1746, 42),
(36, 'ru', 219, 0.1746, 46),
(36, 'ru', 257, 0.1746, 54),
(36, 'ru', 288, 0.1746, 22),
(36, 'ru', 322, 0.1746, 7),
(36, 'ru', 357, 0.2767, 25.5),
(36, 'ru', 566, 0.1746, 1),
(36, 'ru', 660, 0.2767, 41),
(36, 'ru', 709, 0.1746, 4),
(36, 'ru', 733, 0.1746, 67),
(36, 'ru', 754, 0.1746, 80),
(36, 'ru', 778, 0.1746, 49),
(36, 'ru', 827, 0.1746, 23),
(36, 'ru', 857, 0.1746, 40),
(36, 'ru', 896, 0.1746, 41),
(36, 'ru', 1041, 0.1746, 48),
(36, 'ru', 1066, 0.1746, 71),
(36, 'ru', 1121, 0.1746, 39),
(36, 'ru', 1191, 0.1746, 38),
(36, 'ru', 1267, 0.1746, 61),
(36, 'ru', 1308, 0.1746, 70),
(36, 'ru', 1416, 0.2767, 8),
(36, 'ru', 1417, 0.1746, 5),
(36, 'ru', 1418, 0.1746, 8),
(36, 'ru', 1448, 0.1746, 69),
(36, 'ru', 1450, 0.1746, 77),
(36, 'ru', 1452, 0.1746, 78),
(36, 'ru', 1453, 0.1746, 55),
(36, 'ru', 1455, 0.1746, 52),
(36, 'ru', 1461, 0.1746, 50),
(36, 'ru', 1463, 0.1746, 3),
(36, 'ru', 1464, 0.1746, 26),
(36, 'ru', 1465, 0.1746, 28),
(36, 'ru', 1466, 0.1746, 79),
(37, 'ru', 3, 0.2314, 2),
(37, 'ru', 558, 0.2314, 1),
(38, 'ru', 104, 0.2314, 3),
(38, 'ru', 110, 0.2314, 1),
(38, 'ru', 223, 0.2314, 4),
(38, 'ru', 286, 0.2314, 5),
(38, 'ru', 1467, 0.2314, 6),
(39, 'ru', 44, 0.2314, 11),
(39, 'ru', 225, 0.2314, 5),
(39, 'ru', 704, 0.2314, 1),
(39, 'ru', 751, 0.2314, 3),
(39, 'ru', 825, 0.2314, 8),
(39, 'ru', 1068, 0.2314, 6),
(39, 'ru', 1081, 0.2314, 7),
(39, 'ru', 1468, 0.2314, 2),
(39, 'ru', 1469, 0.2314, 9),
(40, 'ru', 17, 0.2314, 6),
(40, 'ru', 27, 0.2314, 3),
(40, 'ru', 503, 0.2314, 4),
(40, 'ru', 704, 0.2314, 1),
(40, 'ru', 880, 0.2314, 5),
(40, 'ru', 1470, 0.2314, 2),
(41, 'ru', 17, 0.2314, 4),
(41, 'ru', 27, 0.2314, 6),
(41, 'ru', 141, 0.2314, 2),
(41, 'ru', 434, 0.2314, 1),
(41, 'ru', 1471, 0.2314, 3),
(42, 'ru', 17, 0.2314, 10),
(42, 'ru', 280, 0.2314, 9),
(42, 'ru', 1472, 0.2314, 1),
(42, 'ru', 1473, 0.2314, 7),
(42, 'ru', 1474, 0.2314, 8),
(43, 'ru', 44, 0.2314, 1),
(43, 'ru', 605, 0.2314, 9),
(43, 'ru', 1475, 0.2314, 8),
(43, 'ru', 1476, 0.2314, 15),
(43, 'ru', 1477, 0.2314, 22),
(44, 'ru', 107, 0.2314, 1),
(44, 'ru', 178, 0.2314, 5),
(44, 'ru', 772, 0.2314, 2),
(44, 'ru', 787, 0.3667, 4.5),
(44, 'ru', 801, 0.2314, 8),
(45, 'ru', 569, 0.2314, 1),
(45, 'ru', 1478, 0.2314, 3),
(45, 'ru', 1479, 0.2314, 4),
(46, 'ru', 173, 0.2314, 1),
(46, 'ru', 632, 0.2314, 3),
(46, 'ru', 1480, 0.2314, 2),
(47, 'ru', 1481, 0.2314, 1),
(48, 'ru', 1482, 0.2314, 1),
(49, 'ru', 1483, 0.2314, 1),
(53, 'ru', 3, 0.2314, 1),
(53, 'ru', 47, 0.2314, 9),
(53, 'ru', 551, 0.2314, 6),
(53, 'ru', 674, 0.2314, 11),
(53, 'ru', 675, 0.2314, 12),
(53, 'ru', 747, 0.3667, 7),
(53, 'ru', 932, 0.2314, 7),
(53, 'ru', 1060, 0.2314, 3),
(53, 'ru', 1370, 0.2314, 2),
(53, 'ru', 1371, 0.2314, 4),
(54, 'ru', 80, 0.2314, 4),
(54, 'ru', 105, 0.2314, 1),
(54, 'ru', 119, 0.2314, 6),
(54, 'ru', 223, 0.2314, 2),
(54, 'ru', 1379, 0.2314, 5),
(54, 'ru', 1380, 0.2314, 8),
(55, 'ru', 3, 0.2314, 4),
(55, 'ru', 23, 0.2314, 2),
(55, 'ru', 1216, 0.2314, 3),
(55, 'ru', 1397, 0.2314, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_text`
--

CREATE TABLE `b_search_content_text` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_text`
--

INSERT INTO `b_search_content_text` (`SEARCH_CONTENT_ID`, `SEARCH_CONTENT_MD5`, `SEARCHABLE_CONTENT`) VALUES
(1, 'adb27eea179be3c992aeb74e1acb2c41', 'ИСТОРИЯ КОМПАНИИ\r\nЗАО «БАНК» ОСНОВАН 18 ЯНВАРЯ 1993 ГОДА.\rДО 1996 ГОДА БАНК РАЗВИВАЛСЯ КАК НЕБОЛЬШОЙ КОММЕРЧЕСКИЙ БАНК.\r1996 ГОД. ОТКРЫВАЕТСЯ ПЕРВЫЙ ДОПОЛНИТЕЛЬНЫЙ ОФИС ПО РАБОТЕ С НАСЕЛЕНИЕМ. БАНК ПРИСТУПАЕТ К АКТИВНОМУ РАЗВИТИЮ ФИЛИАЛЬНОЙ СЕТИ. \r1997 ГОД. БАНК НАЧИНАЕТ ВЫПУСК И ОБСЛУЖИВАНИЕ ПЛАСТИКОВЫХ КАРТ, ИСПОЛЬЗОВАНИЕ КОТОРЫХ ПОЗВОЛЯЕТ ВЫНЕСТИ ФИНАНСОВЫЙ СЕРВИС ЗА ПРЕДЕЛЫ ПРИВЫЧНЫХ ОПЕРАЦИОННЫХ ЗАЛОВ БАНКА И ФИЛИАЛОВ НА МЕСТА ФАКТИЧЕСКОГО ВОСТРЕБОВАНИЯ УСЛУГ.\rЯНВАРЬ 1998 ГОДА. БАНК ПОЛУЧАЕТ ЛИЦЕНЗИЮ ПРОФЕССИОНАЛЬНОГО УЧАСТНИКА РЫНКА ЦЕННЫХ БУМАГ. ПО РЕЗУЛЬТАТАМ АНАЛИЗА БУХГАЛТЕРСКОЙ И ФИНАНСОВОЙ ОТЧЁТНОСТИ БАНК ОТНОСИТСЯ ПО КРИТЕРИЯМ ЦБ РФ К ПЕРВОЙ КАТЕГОРИИ – ФИНАНСОВО СТАБИЛЬНЫЕ БАНКИ.\r1999 ГОД. БАНК, УСПЕШНО ПРЕОДОЛЕВ КРИЗИС, ПРОДОЛЖАЕТ АКТИВНОЕ РАЗВИТИЕ ФИЛИАЛЬНОЙ СЕТИ. В ЭТОМ ЖЕ ГОДУ БАНК ПРИСТУПАЕТ К РЕАЛИЗАЦИИ ПРОГРАММЫ ИПОТЕЧНОГО КРЕДИТОВАНИЯ МУНИЦИПАЛЬНЫХ СЛУЖАЩИХ.\r2004ГОД. БАНК ПРИСТУПАЕТ К ВЫПУСКУ КАРТ ПЛАТЁЖНОЙ СИСТЕМЫ VISA INTERNATIONAL. В ТЕЧЕНИЕ 2004 ГОДА БАНК ПРЕДСТАВИЛ КЛИЕНТАМ РЯД ВЫСОКОТЕХНОЛОГИЧНЫХ ПРОДУКТОВ. В ОБЛАСТИ КРЕДИТОВАНИЯ ФИЗИЧЕСКИХ ЛИЦ – СИСТЕМУ ИНТЕРНЕТ-КРЕДИТОВАНИЯ НА ПРИОБРЕТЕНИЕ АВТОМОБИЛЕЙ, ОБУЧЕНИЕ В ВУЗЕ, ОТДЫХ И ТУРИЗМ. \r2006 ГОД. ДЕСЯТЬ ЛЕТ С НАЧАЛА РАБОТЫ БАНКА В ОБЛАСТИ ПРЕДОСТАВЛЕНИЯ ФИНАНСОВЫХ УСЛУГ НАСЕЛЕНИЮ. ЗА ЭТО ВРЕМЯ В БАНКЕ ВЗЯЛИ КРЕДИТ БОЛЕЕ 50 000 ЧЕЛОВЕК, БОЛЕЕ 200 000 ЧЕЛОВЕК ДОВЕРИЛИ СВОИ ДЕНЬГИ, СДЕЛАВ ВКЛАДЫ, БОЛЕЕ 50 000 ЧЕЛОВЕК СТАЛИ ДЕРЖАТЕЛЯМИ ПЛАСТИКОВЫХ КАРТ БАНКА.\r2007 ГОД. БАНК ПОЛУЧАЕТ ГЛАВНУЮ ВСЕРОССИЙСКУЮ ПРЕМИЮ «РОССИЙСКИЙ НАЦИОНАЛЬНЫЙ ОЛИМП» В ЧИСЛЕ ЛУЧШИХ ПРЕДПРИЯТИЙ МАЛОГО И СРЕДНЕГО БИЗНЕСА РОССИИ.\r2008 ГОД. ПО РЕЗУЛЬТАТАМ МЕЖДУНАРОДНОГО КОНКУРСА \"ЗОЛОТАЯ МЕДАЛЬ \"ЕВРОПЕЙСКОЕ КАЧЕСТВО\", ПРОВЕДЕННОГО МЕЖДУНАРОДНОЙ АКАДЕМИЕЙ КАЧЕСТВА И МАРКЕТИНГА\" И АССОЦИАЦИЕЙ КАЧЕСТВЕННОЙ ПРОДУКЦИИ БАНК СТАНОВИТСЯ ЛАУРЕАТОМ МЕЖДУНАРОДНОЙ НАГРАДЫ \"ЗОЛОТАЯ МЕДАЛЬ \"ЕВРОПЕЙСКОЕ КАЧЕСТВО\".\r2009 ГОД. ПЕРЕХОД НА НОВУЮ АВТОМАТИЗИРОВАННУЮ БАНКОВСКУЮ СИСТЕМУ IBANK SYSTEM РОССИЙСКОЙ КОМПАНИИ «МКТ».\r2010 ГОД. ПО ДАННЫМ ФИНАНСОВОЙ ОТЧЁТНОСТИ НА 1 ЯНВАРЯ 2010 ГОДА БАНК ЗАВЕРШАЕТ 2009 ГОД С ПОЛОЖИТЕЛЬНЫМИ РЕЗУЛЬТАТАМИ. РАЗМЕР ПРИБЫЛИ ЗА 2009 ГОД СОСТАВЛЯЕТ 95 149 ТЫС. РУБЛЕЙ. ПОЛОЖИТЕЛЬНУЮ ДИНАМИКУ РОСТА ПОКАЗЫВАЮТ ПОЧТИ ВСЕ ФИНАНСОВЫЕ ПОКАЗАТЕЛИ.УСТАВНЫЙ КАПИТАЛ БАНКА УВЕЛИЧИВАЕТСЯ НА 20 % И НА ДАННЫЙ МОМЕНТ СОСТАВЛЯЕТ 415 240 ТЫСЯЧ РУБЛЕЙ.РАЗМЕР СОБСТВЕННОГО КАПИТАЛА БАНКА СОСТАВЛЯЕТ 1 535 522 ТЫСЯЧИ РУБЛЕЙ, ЧТО НА 31 % БОЛЬШЕ ЧЕМ В ПРОШЛОМ ГОДУ. \rЧАСТЬ ДОХОДА ЗА 2009 ГОД БАНК НАПРАВЛЯЕТ НА ФОРМИРОВАНИЕ РЕЗЕРВА НА ВОЗМОЖНЫЕ ПОТЕРИ ПО ССУДАМ, ССУДНОЙ И ПРИРАВНЕННОЙ К НЕЙ ЗАДОЛЖЕННОСТИ. ОБЪЁМ ТАКОГО РЕЗЕРВА ПО СОСТОЯНИЮ НА 1 ФЕВРАЛЯ 2010 ГОДА СОСТАВЛЯЕТ ПОРЯДКА 650 МЛН. РУБЛЕЙ.\rСВОЕ ДАЛЬНЕЙШЕЕ РАЗВИТИЕ БАНК СВЯЗЫВАЕТ С ПОВЫШЕНИЕМ КАЧЕСТВА И НАРАЩИВАНИЕМ ОБЪЕМОВ УСЛУГ, СОБСТВЕННОГО КАПИТАЛА, ВНЕДРЕНИЕМ НОВЕЙШИХ ТЕХНОЛОГИЙ, СОВЕРШЕНСТВОВАНИЕМ ФОРМ ОБСЛУЖИВАНИЯ КЛИЕНТОВ И РАЗВИТИЕМ НОВЫХ ПЕРСПЕКТИВНЫХ НАПРАВЛЕНИЙ В РАБОТЕ.\r\n'),
(2, 'faaa1838323144017f3af9a3b40d7ced', 'ИНФОРМАЦИЯ О КОМПАНИИ\r\nБАНК\r ОДИН ИЗ КРУПНЕЙШИХ УЧАСТНИКОВ РОССИЙСКОГО РЫНКА БАНКОВСКИХ УСЛУГ. БАНК РАБОТАЕТ В РОССИИ С 1997 ГОДА И НА СЕГОДНЯШНИЙ ДЕНЬ ОСУЩЕСТВЛЯЕТ ВСЕ ОСНОВНЫЕ ВИДЫ БАНКОВСКИХ ОПЕРАЦИЙ, ПРЕДСТАВЛЕННЫХ НА РЫНКЕ ФИНАНСОВЫХ УСЛУГ. СЕТЬ БАНКА ФОРМИРУЮТ 490 ФИЛИАЛОВ И ДОПОЛНИТЕЛЬНЫХ ОФИСОВ В 70 РЕГИОНАХ СТРАНЫ. МЫ ПРЕДЛАГАЕМ КЛИЕНТАМ ОСНОВНЫЕ БАНКОВСКИЕ ПРОДУКТЫ, ПРИНЯТЫЕ В МЕЖДУНАРОДНОЙ ФИНАНСОВОЙ ПРАКТИКЕ.\nЗАО БАНК ЗАНИМАЕТ 7-Е МЕСТО ПО РАЗМЕРУ АКТИВОВ ПО РЕЗУЛЬТАТАМ 2009 ГОДА. БАНК НАХОДИТСЯ НА 5-М МЕСТЕ В РОССИИ ПО ОБЪЕМУ ЧАСТНЫХ ДЕПОЗИТОВ И НА 4-М МЕСТЕ ПО ОБЪЕМУ КРЕДИТОВ ДЛЯ ЧАСТНЫХ ЛИЦ ПО РЕЗУЛЬТАТАМ 2009 ГОДА. 									\rБАНК\rЯВЛЯЕТСЯ УНИВЕРСАЛЬНЫМ БАНКОМ И ОКАЗЫВАЕТ ПОЛНЫЙ СПЕКТР УСЛУГ, ВКЛЮЧАЯ ОБСЛУЖИВАНИЕ ЧАСТНЫХ И КОРПОРАТИВНЫХ КЛИЕНТОВ, ИНВЕСТИЦИОННЫЙ БАНКОВСКИЙ БИЗНЕС, ТОРГОВОЕ ФИНАНСИРОВАНИЕ И УПРАВЛЕНИЕ АКТИВАМИ.\rВ ЧИСЛЕ ПРЕДОСТАВЛЯЕМЫХ УСЛУГ: 									\nВЫПУСК БАНКОВСКИХ КАРТ;\rИПОТЕЧНОЕ И ПОТРЕБИТЕЛЬСКОЕ КРЕДИТОВАНИЕ;\rАВТОКРЕДИТОВАНИЕ;\rУСЛУГИ ДИСТАНЦИОННОГО УПРАВЛЕНИЯ СЧЕТАМИ;\rКРЕДИТНЫЕ КАРТЫ С ЛЬГОТНЫМ ПЕРИОДОМ;\rСРОЧНЫЕ ВКЛАДЫ, АРЕНДА СЕЙФОВЫХ ЯЧЕЕК;\rДЕНЕЖНЫЕ ПЕРЕВОДЫ.\rЧАСТЬ УСЛУГ ДОСТУПНА НАШИМ КЛИЕНТАМ В КРУГЛОСУТОЧНОМ РЕЖИМЕ, ДЛЯ ЧЕГО ИСПОЛЬЗУЮТСЯ СОВРЕМЕННЫЕ ТЕЛЕКОММУНИКАЦИОННЫЕ ТЕХНОЛОГИИ.\rБАНК\rЯВЛЯЕТСЯ ОДНИМ ИЗ САМЫХ НАДЕЖНЫХ БАНКОВ НАШЕЙ СТРАНЫ. ОСНОВНЫМИ ЦЕННОСТЯМИ, КОТОРЫМИ МЫ РУКОВОДСТВУЕМСЯ В СВОЕЙ ДЕЯТЕЛЬНОСТИ ЯВЛЯЮТСЯ \rСПРАВЕДЛИВОСТЬ\r,\rПРОЗРАЧНОСТЬ\r, \rУВАЖЕНИЕ\r, \rСОТРУДНИЧЕСТВО\r,\rСВОБОДА\rИ\rДОВЕРИЕ\r. ОДНОЙ ИЗ ГЛАВНЫХ ЗАДАЧ \rБАНК\rВИДИТ ПОДДЕРЖАНИЕ И СОВЕРШЕНСТВОВАНИЕ РАЗВИТОЙ ФИНАНСОВОЙ СИСТЕМЫ РОССИИ.\rВ КАЧЕСТВЕ ОДНОГО ИЗ ПРИОРИТЕТНЫХ НАПРАВЛЕНИЙ КУЛЬТУРНО-ПРОСВЕТИТЕЛЬСКОЙ ДЕЯТЕЛЬНОСТИ \rБАНК\rОСУЩЕСТВЛЯЕТ ПОДДЕРЖКУ НАЦИОНАЛЬНОГО. ПРИ НАШЕМ СОДЕЙСТВИИ РОССИЮ ПОСЕТИЛИ МНОГИЕ ВСЕМИРНО ИЗВЕСТНЫЕ ЗАРУБЕЖНЫЕ МУЗЫКАНТЫ, В РЕГИОНАХ РОССИИ ЕЖЕГОДНО ПРОХОДЯТ ТЕАТРАЛЬНЫЕ ФЕСТИВАЛИ, КОНЦЕРТЫ И МНОГОЧИСЛЕННЫЕ ВЫСТАВКИ.\r\n'),
(3, '04af3cb7a7124d187c790f71d33d78bb', 'РУКОВОДСТВО\r\nКОЛЛЕГИАЛЬНЫЙ ИСПОЛНИТЕЛЬНЫЙ ОРГАН ПРАВЛЕНИЯ БАНКА\rДОЛЖНОСТЬ\rОБРАЗОВАНИЕ\rПЛЕШКОВ ЮРИЙ ГРИГОРЬЕВИЧ \rНАЧАЛЬНИК ЭКОНОМИЧЕСКОГО УПРАВЛЕНИЯ \rВ 1996 ГОДУ ОКОНЧИЛ ИРКУТСКУЮ ГОСУДАРСТВЕННУЮ ЭКОНОМИЧЕСКУЮ АКАДЕМИЮ ПО СПЕЦИАЛЬНОСТИ ФИНАНСЫ И КРЕДИТ \rСМИРНОВ ВЯЧЕСЛАВ ЕВГЕНЬЕВИЧ \rЗАМЕСТИТЕЛЬ ПРЕДСЕДАТЕЛЯ ПРАВЛЕНИЯ \rВ 1991 ГОДУ ОКОНЧИЛ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ (МОСКВА). В 2000 ГОДУ ПОЛУЧИЛ СТЕПЕНЬ MBA В БИЗНЕС-ШКОЛЕ INSEAD. \rКОРНЕВА ИРИНА СТАНИСЛАВОВНА \rЗАМЕСТИТЕЛЬ ПРЕДСЕДАТЕЛЯ ПРАВЛЕНИЯ \rВ 1997 ГОДУ ОКОНЧИЛА МОСКОВСКУЮ ГОСУДАРСТВЕННУЮ ЮРИДИЧЕСКУЮ АКАДЕМИЮ ПО СПЕЦИАЛЬНОСТИ «БАНКОВСКОЕ ДЕЛО» \rИГНАТЬЕВ ВАДИМ МИХАЙЛОВИЧ \rПЕРВЫЙ ЗАМЕСТИТЕЛЬ ПРЕДСЕДАТЕЛЯ ПРАВЛЕНИЯ \rВ 1988 ГОДУ ОКОНЧИЛ ИРКУТСКУЮ ГОСУДАРСТВЕННУЮ ЭКОНОМИЧЕСКУЮ АКАДЕМИЮ ПО СПЕЦИАЛЬНОСТИ «ЭКОНОМИКА И УПРАВЛЕНИЕ ПРОИЗВОДСТВОМ» \rВОЛОШИН СТАНИСЛАВ СЕМЕНОВИЧ \rПРЕДСЕДАТЕЛЬ ПРАВЛЕНИЯ \rВ 1986 ГОДУ ОКОНЧИЛ СВЕРДЛОВСКИЙ ЮРИДИЧЕСКИЙ ИНСТИТУТ ПО СПЕЦИАЛЬНОСТИ «ПРАВОВЕДЕНИЕ» И МОСКОВСКИЙ ИНДУСТРИАЛЬНЫЙ ИНСТИТУТ ПО СПЕЦИАЛЬНОСТИ «ЭКОНОМИКА И УПРАВЛЕНИЕ НА ПРЕДПРИЯТИИ» \rСПИСОК ЧЛЕНОВ СОВЕТА ДИРЕКТОРОВ БАНКА\rДОЛЖНОСТЬ\rОБРАЗОВАНИЕ\rМИХАЙЛОВА ТАТЬЯНА ВАСИЛЬЕВНА \rДИРЕКТОР ПО ФИНАНСАМ \rВ 1996 ГОДУ ОКОНЧИЛА РОССИЙСКУЮ ЭКОНОМИЧЕСКУЮ АКАДЕМИЮ ИМ. Г.В. ПЛЕХАНОВА ПО СПЕЦИАЛЬНОСТИ «БАНКОВСКОЕ ДЕЛО». \rЛЯХ ЕВГЕНИЙ ВИКТОРОВИЧ \rДИРЕКТОР ПО ОБЕСПЕЧЕНИЮ БАНКОВСКОЙ ДЕЯТЕЛЬНОСТИ \rВ 1993 ГОДУ ОКОНЧИЛ РОССИЙСКУЮ ЭКОНОМИЧЕСКУЮ АКАДЕМИЮ ИМ. ПЛЕХАНОВА, ПО СПЕЦИАЛЬНОСТИ МВА «СТРАТЕГИЧЕСКИЙ МЕНЕДЖМЕНТ». \rКОНДРУСЕВ РОМАН АЛЕКСАНДРОВИЧ \rДИРЕКТОР КАЗНАЧЕЙСТВА \rВ 1993 ГОДУ ОКОНЧИЛ КЕМЕРОВСКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ ПО СПЕЦИАЛЬНОСТИ «ПРАВОВЕДЕНИЕ» \rХРАМОВ АНАТОЛИЙ ФЁДОРОВИЧ \rДИРЕКТОР ПО РАБОТЕ С ПЕРСОНАЛОМ \rВ 1996 ГОДУ ОКОНЧИЛ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ УПРАВЛЕНИЯ ПО СПЕЦИАЛИЗАЦИИ «УПРАВЛЕНИЕ ПЕРСОНАЛОМ». В 2002 ПРОШЕЛ ПРОГРАММУ ПОВЫШЕНИЯ КВАЛИФИКАЦИИ «СОВРЕМЕННЫЕ ТЕХНОЛОГИИ УПРАВЛЕНИЯ ЧЕЛОВЕЧЕСКИМИ РЕСУРСАМИ» \rЖУРАВЛЕВА ОЛЬГА НИКОЛАЕВНА \rГЛАВНЫЙ БУХГАЛТЕР \rВ 1985 ГОДУ ОКОНЧИЛА САНКТ-ПЕТЕРБУРГСКИЙ ИНСТИТУТ НАРОДНОГО ХОЗЯЙСТВА ПО СПЕЦИАЛЬНОСТИ «БУХГАЛТЕРСКИЙ УЧЕТ» \rКАЛИНИН АНДРЕЙ ГЕННАДЬЕВИЧ \rДИРЕКТОР ДЕПАРТАМЕНТА КОРПОРАТИВНОГО БИЗНЕСА \rВ 1998 ГОДУ ЗАКОНЧИЛ МОСКОВСКИЙ ГОСУДАРСТВЕННЫЙ ИНСТИТУТ МЕЖДУНАРОДНЫХ ОТНОШЕНИЙ, В 2002  ШКОЛУ МЕНЕДЖМЕНТА УНИВЕРСИТЕТА АНТВЕРПЕНА (UAMS) ПО СПЕЦИАЛЬНОСТИ MBA.\r\n'),
(4, '17c27477cd3b1c927b1f739b9300ef80', 'МИССИЯ\r\nМИССИЯ БАНКА - ПРЕДОСТАВЛЯТЬ КАЖДОМУ КЛИЕНТУ МАКСИМАЛЬНО ВОЗМОЖНЫЙ НАБОР БАНКОВСКИХ УСЛУГ ВЫСОКОГО КАЧЕСТВА И НАДЕЖНОСТИ,СЛЕДУЯ\rМИРОВЫМ СТАНДАРТАМ И ПРИНЦИПАМ КОРПОРАТИВНОЙ ЭТИКИ. НАШ БАНК - ЭТО СОВРЕМЕННЫЙ ВЫСОКОТЕХНОЛОГИЧНЫЙ БАНК,СОЧЕТАЮЩИЙ\rВ СЕБЕ НОВЕЙШИЕ ТЕХНОЛОГИИ ОКАЗАНИЯ УСЛУГ И ЛУЧШИЕ ТРАДИЦИИ БАНКОВСКОГО СООБЩЕСТВА И РОССИЙСКОГО ПРЕДПРИНИМАТЕЛЬСТВА.\rИНДИВИДУАЛЬНЫЙ ПОДХОД\rНАША ЦЕЛЬ — ПРЕДОСТАВЛЕНИЕ КАЖДОМУ КЛИЕНТУ ПОЛНОГО КОМПЛЕКСА СОВРЕМЕННЫХ БАНКОВСКИХ ПРОДУКТОВ И УСЛУГ С ИСПОЛЬЗОВАНИЕМ ПОСЛЕДНИХ ДОСТИЖЕНИЙ И ИННОВАЦИЙ В СФЕРЕ ФИНАНСОВЫХ ТЕХНОЛОГИЙ. ИНДИВИДУАЛЬНЫЙ ПОДХОД К СИТУАЦИИ И ПРОБЛЕМАТИКЕ КАЖДОГО КЛИЕНТА И ФИЛОСОФИЯ ПАРТНЕРСТВА - ОСНОВЫ ВЗАИМОДЕЙСТВИЯ С НАШИМИ КЛИЕНТАМИ.\rУНИВЕРСАЛЬНОСТЬ\rБАНК ОБЕСПЕЧИВАЕТ СВОИМ КЛИЕНТАМ — ЧАСТНЫМ ЛИЦАМ, КРУПНЕЙШИМ ОТРАСЛЕВЫМ КОМПАНИЯМ, ПРЕДПРИЯТИЯМ СРЕДНЕГО И МАЛОГО БИЗНЕСА, ГОСУДАРСТВЕННЫМ СТРУКТУРАМ — ШИРОКИЙ СПЕКТР УСЛУГ. ЧТОБЫ МАКСИМАЛЬНО ПОЛНО ОБЕСПЕЧИТЬ ПОТРЕБНОСТИ КЛИЕНТОВ, МЫ АКТИВНО РАЗВИВАЕМ ФИЛИАЛЬНУЮ СЕТЬ В РОССИИ И ЗА ЕЕ ПРЕДЕЛАМИ. ЭТО ПОЗВОЛЯЕТ НАШИМ КЛИЕНТАМ ВСЕГДА И ВЕЗДЕ ПОЛУЧАТЬ СОВРЕМЕННЫЕ БАНКОВСКИЕ УСЛУГИ НА УРОВНЕ МИРОВЫХ СТАНДАРТОВ.\rБАНК — НАДЕЖНЫЙ ПАРТНЕР ПРИ РЕАЛИЗАЦИИ КРУПНЫХ СОЦИАЛЬНО-ЭКОНОМИЧЕСКИХ ПРОЕКТОВ РОССИИ И ЯВЛЯЕТСЯ ОДНИМ ИЗ ЛИДЕРОВ НА РЫНКЕ ИНВЕСТИЦИОННОГО ОБЕСПЕЧЕНИЯ РЕГИОНАЛЬНЫХ ПРОГРАММ.\rПАРТНЕРСТВО И ПОМОЩЬ В РАЗВИТИИ БИЗНЕСА\rВ СВОЕЙ ДЕЯТЕЛЬНОСТИ МЫ ОПИРАЕМСЯ НА ВЫСОЧАЙШИЕ СТАНДАРТЫ ПРЕДОСТАВЛЕНИЯ ФИНАНСОВЫХ УСЛУГ И ТЩАТЕЛЬНЫЙ АНАЛИЗ РЫНКА.\rПРЕДЛАГАЯ АДРЕСНЫЕ РЕШЕНИЯ И СОБЛЮДАЯ КОНФИДЕНЦИАЛЬНОСТЬ ВЗАИМООТНОШЕНИЙ С ПАРТНЕРАМИ, БАНК ПРОЯВЛЯЕТ ГИБКИЙ ПОДХОД К ЗАПРОСАМ КЛИЕНТОВ, КАК РОЗНИЧНЫХ, ТАК И КОРПОРАТИВНЫХ. ВНЕДРЯЯ ПЕРЕДОВЫЕ ТЕХНОЛОГИИ И ИННОВАЦИОННЫЕ РЕШЕНИЯ, БАНК ГАРАНТИРУЕТ КЛИЕНТАМ ВЫСОКОЕ КАЧЕСТВО ОБСЛУЖИВАНИЯ И СТАБИЛЬНЫЙ ДОХОД.\rМЫ ЧЕСТНЫ И ОТКРЫТЫ ПО ОТНОШЕНИЮ КО ВСЕМ НАШИМ ПАРТНЕРАМ И СТРЕМИМСЯ БЫТЬ ПРИМЕРОМ НАДЕЖНОСТИ И ЭФФЕКТИВНОСТИ ДЛЯ ВСЕХ, КТО С НАМИ СОТРУДНИЧАЕТ.\rСОЦИАЛЬНАЯ ОТВЕТСТВЕННОСТЬ\rБАНК ОРИЕНТИРОВАН НА ПОДДЕРЖКУ СОЦИАЛЬНО-ЭКОНОМИЧЕСКОГО РАЗВИТИЯ КЛИЕНТОВ. МЫ ВНОСИМ ВКЛАД В ПОВЫШЕНИЕ БЛАГОСОСТОЯНИЯ ОБЩЕСТВА, ПРЕДОСТАВЛЯЯ НАШИМ КЛИЕНТАМ ПЕРВОКЛАССНЫЕ ЭКОНОМИЧЕСКИЕ ВОЗМОЖНОСТИ, А ТАКЖЕ РЕАЛИЗУЯ ЭКОЛОГИЧЕСКИЕ ПРОГРАММЫ, ОБРАЗОВАТЕЛЬНЫЕ И КУЛЬТУРНЫЕ ПРОЕКТЫ. БАНК ОКАЗЫВАЕТ БЛАГОТВОРИТЕЛЬНУЮ ПОМОЩЬ СОЦИАЛЬНО НЕЗАЩИЩЕННЫМ СЛОЯМ ОБЩЕСТВА, УЧРЕЖДЕНИЯМ МЕДИЦИНЫ, ОБРАЗОВАНИЯ И КУЛЬТУРЫ, СПОРТИВНЫМ И РЕЛИГИОЗНЫМ ОРГАНИЗАЦИЯМ В РЕГИОНАХ РОССИИ. \rНАШ БАНК — ЭТО БАНК, РАБОТАЮЩИЙ НА БЛАГО ОБЩЕСТВА, CТРАНЫ И КАЖДОГО ЕЕ ЖИТЕЛЯ.\r\n'),
(5, 'd6ae18283686e0f65091531174c8b418', 'ВАКАНСИИ\r\n\r\n'),
(6, '06cecc23c5cc18e8d1e0166639dc5c25', 'АВТОРИЗАЦИЯ\r\nВЫ ЗАРЕГИСТРИРОВАНЫ И УСПЕШНО АВТОРИЗОВАЛИСЬ.\rИСПОЛЬЗУЙТЕ АДМИНИСТРАТИВНУЮ ПАНЕЛЬ В ВЕРХНЕЙ ЧАСТИ ЭКРАНА ДЛЯ БЫСТРОГО ДОСТУПА К ФУНКЦИЯМ УПРАВЛЕНИЯ СТРУКТУРОЙ И ИНФОРМАЦИОННЫМ НАПОЛНЕНИЕМ САЙТА. НАБОР КНОПОК ВЕРХНЕЙ ПАНЕЛИ ОТЛИЧАЕТСЯ ДЛЯ РАЗЛИЧНЫХ РАЗДЕЛОВ САЙТА. ТАК ОТДЕЛЬНЫЕ НАБОРЫ ДЕЙСТВИЙ ПРЕДУСМОТРЕНЫ ДЛЯ УПРАВЛЕНИЯ СТАТИЧЕСКИМ СОДЕРЖИМЫМ СТРАНИЦ, ДИНАМИЧЕСКИМИ ПУБЛИКАЦИЯМИ (НОВОСТЯМИ, КАТАЛОГОМ, ФОТОГАЛЕРЕЕЙ) И Т.П.\rВЕРНУТЬСЯ НА ГЛАВНУЮ СТРАНИЦУ\r\n'),
(7, 'ea6b7e8f2315bef45aff06046bff51b8', 'ЗАДАТЬ ВОПРОС\r\n\r\n'),
(8, '7535a1f25a1d9dccc214848d4086e066', 'КОНТАКТНАЯ ИНФОРМАЦИЯ\r\nОБРАТИТЕСЬ К НАШИМ СПЕЦИАЛИСТАМ И ПОЛУЧИТЕ ПРОФЕССИОНАЛЬНУЮ КОНСУЛЬТАЦИЮ ПО УСЛУГАМ НАШЕГО БАНКА.\rВЫ МОЖЕТЕ ОБРАТИТЬСЯ К НАМ ПО ТЕЛЕФОНУ, ПО ЭЛЕКТРОННОЙ ПОЧТЕ ИЛИ ДОГОВОРИТЬСЯ О ВСТРЕЧЕ В НАШЕМ ОФИСЕ. БУДЕМ РАДЫ ПОМОЧЬ ВАМ И ОТВЕТИТЬ НА ВСЕ ВАШИ ВОПРОСЫ. \rТЕЛЕФОНЫ\rТЕЛЕФОН/ФАКС: \n(495) 212-85-06\rТЕЛЕФОНЫ: \n(495) 212-85-07\r(495) 212-85-08\rНАШ ОФИС В МОСКВЕ\r\n'),
(9, '5cb3783e398e7c6ed1983ad2cd1d6419', 'НАШИ РЕКВИЗИТЫ\r\nНАИМЕНОВАНИЕ БАНКА\rЗАКРЫТОЕ АКЦИОНЕРНОЕ ОБЩЕСТВО \"НАЗВАНИЕ БАНКА\"\rСОКРАЩЕННОЕ НАЗВАНИЕ\rЗАО \"НАЗВАНИЕ БАНКА\"\rПОЛНОЕ НАИМЕНОВАНИЕ НА АНГЛИЙСКОМ ЯЗЫКЕ\r\"THE NAME OF BANK\"\rОСНОВНОЙ ГОСУДАРСТВЕННЫЙ РЕГИСТРАЦИОННЫЙ НОМЕР\r152073950937987\rTELEX\r911156 IRS RU\rS.W.I.F.T.\rIISARUMM\rSPRINT\rRU.BANK/BITEX\rЮРИДИЧЕСКИЙ АДРЕС: \r175089, РОССИЯ, Г. МОСКВА, УЛ. БОЛЬШАЯ ДМИТРОВКА, Д. 15, СТР. 1\rКОР/СЧЕТ: \r30102810000000000569\rИНН:\r7860249880\rБИК:\r044591488\rОКПО:\r11806935\rОКОНХ:\r98122\rКПП:\r775021017\rПРОЧАЯ ИНФОРМАЦИЯ\rБАНКОВСКИЙ ИДЕНТИФИКАЦИОННЫЙ КОД: 0575249000\rПОЧТОВЫЙ АДРЕС: 115035, РОССИЯ, Г. МОСКВА, УЛ. БАЛЧУГ, Д. 2\rТЕЛЕФОН: (495) 960-10-12\rФАКС: (495) 240-38-12\rE-MAIL: \rRUSBK@MAIL.RUSBANK.RU\r\n'),
(10, '21114cbd09d60ca232b3e53d004564dc', 'НОВОСТИ КОМПАНИИ\r\n\r\n'),
(11, 'f58e028735b5d07233c4a161c9231405', 'ПОИСК\r\n\r\n'),
(12, 'be3fe2336ca014ea48484837a6379cf7', 'КАРТА САЙТА\r\n\r\n'),
(13, 'ddea3137a2dc2052dfdc6ef265d0e1de', 'ИНТЕРНЕТ-БАНКИНГ\r\n\"ИНТЕРНЕТ-БАНК\" — ЭТО ПОЛНОФУНКЦИОНАЛЬНАЯ, УДОБНАЯ И БЕЗОПАСНАЯ СИСТЕМА ДИСТАНЦИОННОГО БАНКОВСКОГО ОБСЛУЖИВАНИЯ, С ЕЕ ПОМОЩЬЮ ВЫ МОЖЕТЕ В ПОЛНОМ ОБЪЕМЕ УПРАВЛЯТЬ БАНКОВСКИМИ СЧЕТАМИ В РЕЖИМЕ РЕАЛЬНОГО ВРЕМЕНИ. ПОНЯТНЫЙ ДЛЯ КЛИЕНТА ИНТЕРФЕЙС ПОЗВОЛЯЕТ НЕ ТРАТИТЬ ВРЕМЯ НА ОБУЧЕНИЕ РАБОТЕ С СИСТЕМОЙ. СИСТЕМА СНАБЖЕНА ВНУТРЕННИМИ ПОДСКАЗКАМИ.\r\"ИНТЕРНЕТ-БАНК\" ПОЗВОЛЯЕТ:\rЧЕРЕЗ САЙТ БАНКА В ИНТЕРНЕТЕ ПОЛУЧИТЬ ДОСТУП К ВАШИМ БАНКОВСКИМ СЧЕТАМ ПРАКТИЧЕСКИ С ЛЮБОГО КОМПЬЮТЕРА В ЛЮБОЙ ТОЧКЕ ЗЕМНОГО ШАРА, ГДЕ ЕСТЬ ДОСТУП В ИНТЕРНЕТ \rВВОДИТЬ, РЕДАКТИРОВАТЬ И ПЕЧАТАТЬ ПЛАТЕЖНЫЕ ДОКУМЕНТЫ \rПОДПИСЫВАТЬ КАЖДЫЙ ПЛАТЕЖНЫЙ ДОКУМЕНТ ПЕРСОНИФИЦИРОВАННОЙ ЭЛЕКТРОННОЙ-ЦИФРОВОЙ ПОДПИСЬЮ \rНАПРАВЛЯТЬ ДОКУМЕНТЫ В БАНК НА ИСПОЛНЕНИЕ \r«ВИЗИРОВАТЬ» НАПРАВЛЯЕМЫЕ В БАНК ПЛАТЕЖНЫЕ ДОКУМЕНТЫ УПОЛНОМОЧЕННЫМ ЛИЦОМ \rПОЛУЧАТЬ ВЫПИСКИ СО ВСЕМИ ПРИЛОЖЕНИЯМИ ПО СЧЕТАМ ЗА ОПРЕДЕЛЕННЫЙ ПЕРИОД ВРЕМЕНИ \rОСУЩЕСТВЛЯТЬ ПОКУПКУ/ПРОДАЖУ ИНОСТРАННОЙ ВАЛЮТЫ, КОНВЕРТАЦИЮ ВАЛЮТ В РЕЖИМЕ ON-LINE ПО ТЕКУЩЕМУ РЫНОЧНОМУ КУРСУ \rРЕЗЕРВИРОВАТЬ НА СЧЕТЕ ВРЕМЕННО СВОБОДНЫЕ ДЕНЕЖНЫЕ СРЕДСТВА И ПОЛУЧАТЬ ДОПОЛНИТЕЛЬНЫЙ ДОХОД В ВИДЕ НАЧИСЛЕННЫХ ПРОЦЕНТОВ \rОТСЛЕЖИВАТЬ ТЕКУЩЕЕ СОСТОЯНИЕ СЧЕТОВ\rПОЛУЧАТЬ АКТУАЛЬНУЮ ИНФОРМАЦИЮ О ПЛАТЕЖАХ КОНТРАГЕНТОВ ИЗ ДРУГИХ БАНКОВ, КОТОРЫЕ ЗАЧИСЛЯЮТСЯ НА СЧЕТ КЛИЕНТА В МОМЕНТ ПОСТУПЛЕНИЯ В БАНК \rНАПРАВЛЯТЬ В БАНК БУХГАЛТЕРСКУЮ ОТЧЕТНОСТЬ В ЭЛЕКТРОННОМ ВИДЕ \rКОНТРОЛИРОВАТЬ СОСТОЯНИЕ ССУДНЫХ СЧЕТОВ, ПОГАШЕНИЕ И УПЛАТУ ПРОЦЕНТОВ \rПОДКЛЮЧЕНИЕ К СИСТЕМЕ, В ТОМ ЧИСЛЕ ГЕНЕРАЦИЯ КЛЮЧЕЙ ДЛЯ ФОРМИРОВАНИЯ ЭЛЕКТРОННО-ЦИФРОВОЙ ПОДПИСИ, БЕСПЛАТНО. АБОНЕНТСКАЯ ПЛАТА ЗА ОБСЛУЖИВАНИЕ НЕ ВЗИМАЕТСЯ.\rТЕХНИЧЕСКИЕ ТРЕБОВАНИЯ\rДЛЯ ПОЛНОЦЕННОЙ РАБОТЫ С СИСТЕМОЙ НЕОБХОДИМ КОМПЬЮТЕР С ОС WINDOWS ,НЕ НИЖЕ WINDOWS 2000; ПРОГРАММА ПРОСМОТРА ИНТЕРНЕТ-СТРАНИЦ INTERNET EXPLORER ВЕРСИИ НЕ НИЖЕ 6.0; ПРИЛОЖЕНИЕ JAVA RUNTIME ENVIRONMENT (JRE) VERSION 1.5.0\r\n'),
(14, '54c7cb63bd2ee9f4878bc248cccbab6b', 'ИНКАССАЦИЯ\r\nИНКАССАЦИЯ\r– ДОСТАВКА ЦЕННОСТЕЙ И ДЕНЕЖНЫХ СРЕДСТВ.\rБАНК ПРЕДЛАГАЕТ ВОСПОЛЬЗОВАТЬСЯ УСЛУГАМИ СЛУЖБЫ ИНКАССАЦИИ. СЛУЖБА ИНКАССАЦИИ БАНКА ОБЕСПЕЧИТ:\rИНКАССАЦИЮ НАЛИЧНЫХ ДЕНЕЖНЫХ СРЕДСТВ, ДОСТАВКУ ИХ НА СПЕЦИАЛЬНО ОБОРУДОВАННОМ ТРАНСПОРТЕ В БАНК, ПО СОГЛАСОВАННОМУ С КЛИЕНТОМ, ГРАФИКУ РАБОТЫ;\rСОПРОВОЖДЕНИЕ ЦЕННОСТЕЙ И ДЕНЕЖНЫХ СРЕДСТВ КЛИЕНТА ПО МАРШРУТУ, УКАЗАННОМУ КЛИЕНТОМ; \rДОСТАВКУ НАЛИЧНЫХ ДЕНЕЖНЫХ СРЕДСТВ КЛИЕНТУ; \rДОСТАВКУ КЛИЕНТУ РАЗМЕННОЙ МОНЕТЫ.\rУСЛУГИ ПРЕДОСТАВЛЯЮТСЯ КАК СОБСТВЕННОЙ СЛУЖБОЙ ИНКАССАЦИИ, ТАК И ЧЕРЕЗ ДРУГИЕ СПЕЦИАЛИЗИРОВАННЫЕ ОРГАНИЗАЦИИ.\rНЕОБХОДИМАЯ ДОКУМЕНТАЦИЯ:\rДОГОВОР НА СБОР (ИНКАССАЦИЮ) ДЕНЕЖНОЙ ВЫРУЧКИ И ДОСТАВКУ РАЗМЕННОЙ МОНЕТЫ;\rЗАЯВКА НА ИНКАССАЦИЮ;\rПРЕДВАРИТЕЛЬНАЯ ЗАЯВКА НА ОКАЗАНИЕ УСЛУГ ПО ДОСТАВКЕ ДЕНЕЖНОЙ НАЛИЧНОСТИ;\rДОГОВОР НА ОКАЗАНИЕ УСЛУГ ПО ДОСТАВКЕ НАЛИЧНЫХ ДЕНЕЖНЫХ СРЕДСТВ.\rОБЪЕМ ИНКАССИРУЕМЫХ ДЕНЕЖНЫХ СРЕДСТВ\rТАРИФЫ ПО СТАВКЕ ПРОЦЕНТА ОТ ОБЪЕМА ИНКАССАЦИИ\rТАРИФЫ ОТ КОЛИЧЕСТВА ВЫЕЗДОВ\rТАРИФЫ С ФИКСИРОВАННОЙ СТОИМОСТЬЮ\rДО 0,5 МЛН. РУБ.\r0,45%\rОТ 120 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 2500 РУБ. В МЕСЯЦ\rОТ 0,5 ДО 1,0 МЛН. РУБ.\r0,4 - 0,35%\rОТ 140 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 3500 РУБ. В МЕСЯЦ\rОТ 1,0 ДО 1,5 МЛН. РУБ.\r0,35 -0,3%\rОТ 160 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 4500 РУБ. В МЕСЯЦ\rОТ 1,5 ДО 2,0 МЛН. РУБ.\r0,3 -0,25%\rОТ 180 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 5000 РУБ. В МЕСЯЦ\rОТ 2,0 МЛН ДО 3,0 МЛН. РУБ.\r0,25 - 0,2 %\rОТ 200 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 6000 РУБ. В МЕСЯЦ\rОТ 4,0 МЛН. ДО 6 МЛН. РУБ.\r0,2 -0,15%\rОТ 220 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 7000 РУБ. В МЕСЯЦ\rОТ 6,0 МЛН. ДО 10 МЛН. РУБ.\r0,15 -0,1 %\rОТ 240 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 8000 РУБ. В МЕСЯЦ\rСВЫШЕ 10 МЛН. РУБ.\r0,1 - 0,05%\rОТ 260 РУБ/ЗАЕЗД\rНЕ МЕНЕЕ 9000 РУБ. В МЕСЯЦ\rДРУГИЕ УСЛОВИЯ\rИНКАССАЦИЯ 5-10 ТОРГОВЫХ ТОЧЕК КЛИЕНТА\rПЛЮС 5 % ОТ ТАРИФНОЙ СТАВКИ ЗА КАЖДУЮ ПОСЛЕДУЮЩУЮ ТОЧКУ\rИНКАССАЦИЯ СВЫШЕ 10 ТОРГОВЫХ ТОЧЕК КЛИЕНТА\rПЛЮС 10 % ОТ ТАРИФНОЙ СТАВКИ ЗА КАЖДУЮ ПОСЛЕДУЮЩУЮ ТОЧКУ\rВРЕМЯ ИНКАССАЦИИ УСТАНАВЛИВАЕТ КЛИЕНТ\rПЛЮС 10 % ОТ ТАРИФНОЙ СТАВКИ\rНОЧНАЯ ИНКАССАЦИЯ (С 22:00)\rПЛЮС 20% ОТ ТАРИФНОЙ СТАВКИ\rУТРЕННЯЯ ИНКАССАЦИЯ ДЛЯ ЗАЧИСЛЕНИЯ В 1ОЙ ПОЛОВИНЕ ДНЯ\rБЕСПЛАТНО\rЕСЛИ СДАЮТ НА ОДНОМ ОБЪЕКТЕ НЕСКОЛЬКО ЮРИДИЧЕСКИХ ЛИЦ\rБЕСПЛАТНО\rДОСТАВКА РАЗМЕННОЙ МОНЕТЫ\r0,4 % ОТ СУММЫ ДОСТАВКИ\rРАСХОДНЫЙ МАТЕРИАЛ\rБЕСПЛАТНО\rХРАНЕНИЕ ДЕНЕЖНЫХ СРЕДСТВ В НОЧНОЕ ВРЕМЯ, ПРАЗДНИЧНЫЕ И ВЫХОДНЫЕ\rБЕСПЛАТНО\rЗАГРУЗКА БАНКОМАТОВ, ПОДКРЕПЛЕНИЕ ДОПОЛНИТЕЛЬНЫХ ОФИСОВ\rОТ 350 РУБ/ЧАС\rДОСТАВКА ДЕНЕЖНЫХ СРЕДСТВ ИЗ БАНКА КЛИЕНТУ\r0,5 % ОТ СУММЫ, ЛИБО ПО СОГЛАШЕНИЮ СТОРОН\r\n'),
(15, 'cbfa46d27f8efb5a7a8153fe51f3bf3b', 'КОРПОРАТИВНЫМ КЛИЕНТАМ\r\nБАНК ЯВЛЯЕТСЯ ОДНИМ ИЗ ЛИДЕРОВ БАНКОВСКОГО РЫНКА ПО ОБСЛУЖИВАНИЮ КОРПОРАТИВНЫХ КЛИЕНТОВ. \rКОМПЛЕКСНОЕ БАНКОВСКОЕ ОБСЛУЖИВАНИЕ НА ОСНОВЕ МАКСИМАЛЬНОГО ИСПОЛЬЗОВАНИЯ КОНКУРЕНТНЫХ ПРЕИМУЩЕСТВ И ВОЗМОЖНОСТЕЙ БАНКА ПОЗВОЛЯЕТ СОЗДАТЬ УСТОЙЧИВУЮ \rФИНАНСОВУЮ ПЛАТФОРМУ ДЛЯ РАЗВИТИЯ БИЗНЕСА ПРЕДПРИЯТИЙ И ХОЛДИНГОВ РАЗЛИЧНЫХ ОТРАСЛЕЙ ЭКОНОМИКИ. УЖЕ БОЛЕЕ 15 ЛЕТ БАНК РАБОТАЕТ ДЛЯ СВОИХ КЛИЕНТОВ, \rЯВЛЯЯСЬ ОБРАЗЦОМ НАДЕЖНОСТИ И ВЫСОКОГО ПРОФЕССИОНАЛИЗМА.\rНАШ БАНК ПРЕДЛАГАЕТ КОРПОРАТИВНЫМ КЛИЕНТАМ СЛЕДУЮЩИЕ ВИДЫ УСЛУГ:\rРАСЧЕТНО-КАССОВОЕ ОБСЛУЖИВАНИЕ\rИНКАССАЦИЯ\rИНТЕРНЕТ-БАНКИНГ\r\n'),
(16, '0081c8541e53a7f35c06cc7a74ff5a29', 'РАСЧЕТНО-КАССОВОЕ ОБСЛУЖИВАНИЕ\r\nВО ВСЕХ СТРАНАХ МИРА САМОЙ РАСПРОСТРАНЕННОЙ ФУНКЦИЕЙ БАНКОВ ЯВЛЯЮТСЯ РАСЧЕТЫ. БОЛЬШИНСТВО ОКАЗЫВАЕМЫХ БАНКОМ УСЛУГ СВЯЗАНЫ С БЫСТРЫМ И КАЧЕСТВЕННЫМ ПРОВЕДЕНИЕМ РАСЧЕТНЫХ ОПЕРАЦИЙ. КАЖДЫЙ КЛИЕНТ, НЕЗАВИСИМО ОТ ВИДА ОСУЩЕСТВЛЯЕМЫХ В БАНКЕ ОПЕРАЦИЙ, ПОЛЬЗУЕТСЯ ПЕРЕВОДОМ СРЕДСТВ.\rКОРПОРАТИВНЫМ КЛИЕНТАМ БАНК ОКАЗЫВАЕТ СЛЕДУЮЩИЕ УСЛУГИ:\rОТКРЫТИЕ И ВЕДЕНИЕ СЧЕТОВ ЮРИДИЧЕСКИХ ЛИЦ - РЕЗИДЕНТОВ И НЕРЕЗИДЕНТОВ РОССИЙСКОЙ ФЕДЕРАЦИИ — В ВАЛЮТЕ РФ И ИНОСТРАННОЙ ВАЛЮТЕ; \rВСЕ ВИДЫ РАСЧЕТОВ В РУБЛЯХ И ИНОСТРАННОЙ ВАЛЮТЕ; \rКАССОВОЕ ОБСЛУЖИВАНИЕ В РУБЛЯХ И ИНОСТРАННОЙ ВАЛЮТЕ; \rУСКОРЕННЫЕ ПЛАТЕЖИ ПО РОССИИ ПО СИСТЕМЕ МЕЖРЕГИОНАЛЬНЫХ ЭЛЕКТРОННЫХ ПЛАТЕЖЕЙ; \rПЛАТЕЖИ В ЛЮБУЮ СТРАНУ МИРА В КРАТЧАЙШИЕ СРОКИ \rПРОВЕДЕНИЕ КОНВЕРСИОННЫХ ОПЕРАЦИЙ ПО СЧЕТАМ КЛИЕНТОВ \rИНКАССАЦИЯ И ДОСТАВКА НАЛИЧНЫХ ДЕНЕГ И ЦЕННОСТЕЙ \rРАСПОРЯЖЕНИЕ СЧЕТОМ ПОСРЕДСТВОМ СИСТЕМЫ «ИНТЕРНЕТ-БАНК» \rОПЕРАЦИОННЫЙ ДЕНЬ В БАНКЕ УСТАНОВЛЕН: ЕЖЕДНЕВНО С 09.00 ДО 16.00, В ПЯТНИЦУ И ПРЕДПРАЗДНИЧНЫЕ ДНИ С 09.00 ДО 15.00.\rКАССОВОЕ ОБСЛУЖИВАНИЕ ОСУЩЕСТВЛЯЕТСЯ НА ДОГОВОРНОЙ ОСНОВЕ, ПЛАТА ВЗИМАЕТСЯ ПО ФАКТУ СОВЕРШЕНИЯ КАЖДОЙ ОПЕРАЦИИ В СООТВЕТСТВИИ С УТВЕРЖДЕННЫМИ БАНКОМ ТАРИФАМИ ЗА УСЛУГИ КОРПОРАТИВНЫМ КЛИЕНТАМ.\r\n'),
(17, 'c53e6ba1e8943d2df7ff449091252209', 'ДЕПОЗИТАРНЫЕ УСЛУГИ\r\nДЕПОЗИТАРИЙ БАНКА ИМЕЕТ КОРРЕСПОНДЕНТСКИЕ ОТНОШЕНИЯ СО ВСЕМИ КРУПНЫМИ РАСЧЕТНЫМИ И УПОЛНОМОЧЕННЫМИ ДЕПОЗИТАРИЯМИ. РАЗВЕТВЛЕННАЯ СЕТЬ КОРРЕСПОНДЕНТСКИХ СЧЕТОВ ПОЗВОЛЯЕТ КЛИЕНТАМ ДЕПОЗИТАРИЯ ОСУЩЕСТВЛЯТЬ ОПЕРАЦИИ ПРАКТИЧЕСКИ С ЛЮБЫМИ ИНСТРУМЕНТАМИ ФОНДОВОГО РЫНКА.\rУСЛУГИ ДЕПОЗИТАРИЯ БАНКА:\rОТКРЫТИЕ И ВЕДЕНИЕ СЧЕТОВ ДЕПО КЛИЕНТОВ;\rХРАНЕНИЕ И УЧЕТ ВСЕХ ВИДОВ ЦЕННЫХ БУМАГ, ВКЛЮЧАЯ АКЦИИ, ОБЛИГАЦИИ, ПАИ, ВЕКСЕЛЯ, МЕЖДУНАРОДНЫХ ФИНАНСОВЫХ ИНСТРУМЕНТОВ (ЕВРООБЛИГАЦИИ, АДР, ГДР);\rКОНСУЛЬТИРОВАНИЕ И ПРОВЕДЕНИЕ КОМПЛЕКСНЫХ СТРУКТУРИРОВАННЫХ ОПЕРАЦИЙ С ЦЕННЫМИ БУМАГАМИ;\rПЕРЕРЕГИСТРАЦИЯ ПРАВ СОБСТВЕННОСТИ НА ЦЕННЫЕ БУМАГИ, В ТОМ ЧИСЛЕ ПРИ ВЫПОЛНЕНИИ ОПРЕДЕЛЕННОГО УСЛОВИЯ;\rОФОРМЛЕНИЕ И УЧЕТ ЗАЛОГОВЫХ ОПЕРАЦИЙ С ЦЕННЫМИ БУМАГАМИ ДЕПОНЕНТОВ;\rПРЕДОСТАВЛЕНИЕ ИНФОРМАЦИИ ОБ ЭМИТЕНТЕ;\rПОМОЩЬ ДЕПОНЕНТАМ В РЕАЛИЗАЦИИ ПРАВ, ЗАКРЕПЛЕННЫХ ЗА НИМИ КАК ЗА ВЛАДЕЛЬЦАМИ ЦЕННЫХ БУМАГ;\rКОНСУЛЬТАЦИОННАЯ ПОДДЕРЖКА ПРИ ПРОВЕДЕНИИ ОПЕРАЦИЙ ПО СЧЕТАМ ДЕПО;\rВЫПОЛНЕНИЕ ФУНКЦИЙ ПЛАТЕЖНОГО АГЕНТА:\rХРАНЕНИЕ ЦЕННЫХ БУМАГ НА ОСНОВАНИИ ДОГОВОРОВ ОТВЕТСТВЕННОГО ХРАНЕНИЯ;\rПРОВЕДЕНИЕ ЭКСПЕРТИЗЫ ЦЕННЫХ БУМАГ;\rДРУГИЕ УСЛУГИ.\rСПОСОБЫ ОБМЕНА ДОКУМЕНТОВ С ДЕПОЗИТАРИЕМ:\rВ БУМАЖНОМ ВИДЕ С ОРИГИНАЛЬНЫМИ ПОДПИСЯМИ И ПЕЧАТЯМИ;\rПО ФАКСУ (ПОРУЧЕНИЯ НА ЗАЧИСЛЕНИЕ ЦЕННЫХ БУМАГ И ПРЕДОСТАВЛЕНИЕ ВЫПИСОК) С ПОСЛЕДУЮЩИМ ПРЕДОСТАВЛЕНИЕМ ОРИГИНАЛА;\rПО СИСТЕМАМ S.W.I.F.T. И TELEX.\rТАРИФЫ НА ДЕПОЗИТАРНОЕ ОБСЛУЖИВАНИЕ\rНАИМЕНОВАНИЕ УСЛУГИ\rТАРИФ\rОТКРЫТИЕ СЧЕТА ДЕПО ДЛЯ ФИЗИЧЕСКИХ ЛИЦ (РЕЗИДЕНТОВ И НЕРЕЗИДЕНТОВ)\n150 РУБ.\nОТКРЫТИЕ СЧЕТА ДЕПО ДЛЯ ЮРИДИЧЕСКИХ ЛИЦ – РЕЗИДЕНТОВ\n400 РУБ.\nОТКРЫТИЕ СЧЕТА ДЕПО ДЛЯ ЮРИДИЧЕСКИХ ЛИЦ – НЕРЕЗИДЕНТОВ\n1600 РУБ.\nЗАКРЫТИЕ СЧЕТА ДЕПО\nНЕ ВЗИМАЕТСЯ\nВНЕСЕНИЕ ИЗМЕНЕНИЯ В АНКЕТУ ДЕПОНЕНТА\nНЕ ВЗИМАЕТСЯ\nАБОНЕНТСКАЯ ПЛАТА В МЕСЯЦ ЗА ВЕДЕНИЕ СЧЕТА ДЕПО ДЛЯ ЮРИДИЧЕСКИХ ЛИЦ - РЕЗИДЕНТОВ,\nПРИ НАЛИЧИИ ОСТАТКА НА СЧЕТЕ ДЕПО\n500 РУБ.\nАБОНЕНТСКАЯ ПЛАТА В МЕСЯЦ ЗА ВЕДЕНИЕ СЧЕТА ДЕПО ДЛЯ ЮРИДИЧЕСКИХ ЛИЦ - НЕРЕЗИДЕНТОВ,\nПРИ НАЛИЧИИ ОСТАТКА НА СЧЕТЕ ДЕПО\n2 500 РУБ.\nАБОНЕНТСКАЯ ПЛАТА В МЕСЯЦ ЗА ВЕДЕНИЕ СЧЕТА ДЕПО ДЛЯ ДЕПОНЕНТОВ, НАХОДЯЩИХСЯ НА БРОКЕРСКОМ\nОБСЛУЖИВАНИИ, ПРИ НАЛИЧИИ ДВИЖЕНИЯ ПО СЧЕТУ ДЕПО\n150 РУБ.\nФОРМИРОВАНИЕ ОТЧЕТА О СОВЕРШЕННЫХ ПО СЧЕТУ ДЕПО ОПЕРАЦИЯХ ЗА ПЕРИОД ПОСЛЕ ПРОВЕДЕНИЯ\nОПЕРАЦИИ\nНЕ ВЗИМАЕТСЯ\nФОРМИРОВАНИЕ ОТЧЕТА О СОВЕРШЕННЫХ ПО СЧЕТУ ДЕПО ОПЕРАЦИЯХ ЗА ПЕРИОД, ВЫПИСКИ О СОСТОЯНИИ\nСЧЕТА (РАЗДЕЛА СЧЕТА) ДЕПО ПО ИНФОРМАЦИОННОМУ ЗАПРОСУ ДЕПОНЕНТА\n150 РУБ.\nЗАЧИСЛЕНИЕ (СПИСАНИЕ) БЕЗДОКУМЕНТАРНЫХ ЦЕННЫХ БУМАГ, ЗА ОДНО ПОРУЧЕНИЕ\n300 РУБ.\nЗАЧИСЛЕНИЕ (СПИСАНИЕ) ДОКУМЕНТАРНЫХ ЦЕННЫХ БУМАГ, ЗА ОДНУ ЦЕННУЮ БУМАГУ\n580 РУБ.\nПЕРЕВОД (ВНУТРИ ДЕПОЗИТАРИЯ) БЕЗДОКУМЕНТАРНЫХ И ДОКУМЕНТАРНЫХ ЦЕННЫХ БУМАГ, ЗА ОДНО\nПОРУЧЕНИЕ (ВЗИМАЕТСЯ С ДЕПОНЕНТА - ИНИЦИАТОРА ОПЕРАЦИИ)\n300 РУБ.\nИЗМЕНЕНИЕ МЕСТ ХРАНЕНИЯ БЕЗДОКУМЕНТАРНЫХ ЦЕННЫХ БУМАГ (ЗА ОДНО ПОРУЧЕНИЕ) И ДОКУМЕНТАРНЫХ\nЦЕННЫХ БУМАГ (ЗА ОДНУ ЦЕННУЮ БУМАГУ)\n580 РУБ.\nБЛОКИРОВКА (РАЗБЛОКИРОВКА), РЕГИСТРАЦИЯ ЗАЛОГА (ВОЗВРАТА ЗАЛОГА) БЕЗДОКУМЕНТАРНЫХ\nЦЕННЫХ БУМАГ\n870 РУБ.\nБЛОКИРОВКА (РАЗБЛОКИРОВКА), РЕГИСТРАЦИЯ ЗАКЛАДА (ВОЗВРАТА ЗАКЛАДА) ДОКУМЕНТАРНЫХ\nЦЕННЫХ БУМАГ\n870 РУБ.\n*ПРИ ВЗИМАНИИ ТАРИФОВ ДОПОЛНИТЕЛЬНО ВЗИМАЕТСЯ НАЛОГ НА ДОБАВЛЕННУЮ СТОИМОСТЬ ПО СТАВКЕ 18%.\rПЛАТА ЗА ИНЫЕ УСЛУГИ, НЕ ОГОВОРЕННЫЕ В ДАННЫХ ТАРИФАХ ДЕПОЗИТАРИЯ, ЗА ИСКЛЮЧЕНИЕМ УСЛУГ, ОКАЗЫВАЕМЫХ ПРИ ПРОВЕДЕНИИ ОПЕРАЦИЙ ДЕПОНЕНТА ДРУГИМИ ДЕПОЗИТАРИЯМИ И РЕЕСТРОДЕРЖАТЕЛЯМИ, НЕ ВЗИМАЕТСЯ.\r\n'),
(18, '65624a89c9bf009bafe9104c4ca2c703', 'ДОКУМЕНТАРНЫЕ ОПЕРАЦИИ\r\nНАШ БАНК ПРЕДЛАГАЕТ ШИРОКИЙ СПЕКТР БАНКОВСКИХ УСЛУГ ПО ПРОВЕДЕНИЮ ДОКУМЕНТАРНЫХ РАСЧЕТОВ В ОБЛАСТИ МЕЖДУНАРОДНЫХ ТОРГОВО-ЭКОНОМИЧЕСКИХ ОТНОШЕНИЙ ,В ТОМ ЧИСЛЕ ПО НЕСТАНДАРТНЫМ И СЛОЖНО СТРУКТУРИРОВАННЫМ СХЕМАМ.\rБЕЗУСЛОВНЫМ ПРЕИМУЩЕСТВОМ РАБОТЫ С НАШИМ БАНКОМ ЯВЛЯЕТСЯ ВОЗМОЖНОСТЬ ПРОВОДИТЬ ОПЕРАЦИИ В ПРЕДЕЛЬНО СЖАТЫЕ СРОКИ ПО КОНКУРЕНТОСПОСОБНЫМ ТАРИФАМ, А ТАКЖЕ ИХ ОБШИРНАЯ ГЕОГРАФИЯ: СТРАНЫ СНГ И БАЛТИИ, БЛИЖНЕГО И ДАЛЬНЕГО ЗАРУБЕЖЬЯ.\rСПЕКТР УСЛУГ ПО БАНКОВСКИМ ГАРАНТИЯМ: \rВЫДАЧА ЛЮБЫХ ВИДОВ ГАРАНТИЙ ПОД КОНТРГАРАНТИИ БАНКОВ-КОРРЕСПОНДЕНТОВ В СЧЕТ УСТАНОВЛЕННЫХ НА НИХ ДОКУМЕНТАРНЫХ ЛИМИТОВ: 									 \nГАРАНТИИ НАДЛЕЖАЩЕГО ИСПОЛНЕНИЯ КОНТРАКТОВ;\rГАРАНТИИ ПЛАТЕЖА (Т.Е. ВЫПОЛНЕНИЯ ПЛАТЕЖНЫХ ОБЯЗАТЕЛЬСТВ ПО КОНТРАКТАМ);\rГАРАНТИИ ВОЗВРАТА АВАНСОВОГО ПЛАТЕЖА;\rГАРАНТИИ В ПОЛЬЗУ ТАМОЖЕННЫХ ОРГАНОВ;\rГАРАНТИИ В ПОЛЬЗУ НАЛОГОВЫХ ОРГАНОВ;\rТЕНДЕРНЫЕ ГАРАНТИИ (Т.Е. ГАРАНТИИ УЧАСТИЯ В ТОРГАХ/КОНКУРСАХ);\rГАРАНТИИ ВОЗВРАТА КРЕДИТА;\rГАРАНТИИ ОПЛАТЫ АКЦИЙ;\rГАРАНТИИ, ПРЕДОСТАВЛЯЕМЫЕ В КАЧЕСТВЕ ВСТРЕЧНОГО ОБЕСПЕЧЕНИЯ СУДЕБНЫХ ИСКОВ;\rАВИЗОВАНИЕ ГАРАНТИЙ ИНОСТРАННЫХ И РОССИЙСКИХ БАНКОВ-КОРРЕСПОНДЕНТОВ В ПОЛЬЗУ ОТЕЧЕСТВЕННЫХ И ЗАРУБЕЖНЫХ БЕНЕФИЦИАРОВ;\rПРЕДЪЯВЛЕНИЕ ТРЕБОВАНИЯ ПЛАТЕЖА ПО ПОРУЧЕНИЮ БЕНЕФИЦИАРОВ В СЧЕТ БАНКОВСКИХ ГАРАНТИЙ;\rЗАВЕРКА ПОДЛИННОСТИ ПОДПИСЕЙ НА ГАРАНТИЯХ ИНОСТРАННЫХ И РОССИЙСКИХ БАНКОВ ПО ПРОСЬБЕ БЕНЕФИЦИАРА;\rВ СЛУЧАЕ НЕОБХОДИМОСТИ ИНЫЕ ВИДЫ ОПЕРАЦИЙ, ВКЛЮЧАЯ ПРЕДВАРИТЕЛЬНУЮ ПРОРАБОТКУ УСЛОВИЙ ГАРАНТИЙНОЙ СДЕЛКИ.\rПРЕДОСТАВЛЯЕМЫЕ УСЛУГИ ПО ДОКУМЕНТАРНЫМ (В ТОМ ЧИСЛЕ РЕЗЕРВНЫМ) АККРЕДИТИВАМ:\rАВИЗОВАНИЕ АККРЕДИТИВОВ ИНОСТРАННЫХ И РОССИЙСКИХ БАНКОВ-КОРРЕСПОНДЕНТОВ В ПОЛЬЗУ ОТЕЧЕСТВЕННЫХ И ЗАРУБЕЖНЫХ БЕНЕФИЦИАРОВ;\rПОДТВЕРЖДЕНИЕ АККРЕДИТИВОВ БАНКОВ-КОРРЕСПОНДЕНТОВ ПОД ПРЕДОСТАВЛЕННОЕ ДЕНЕЖНОЕ ПОКРЫТИЕ ИЛИ В СЧЕТ ДОКУМЕНТАРНЫХ ЛИМИТОВ, УСТАНОВЛЕННЫХ НА БАНК-ЭМИТЕНТ;\rПОДТВЕРЖДЕНИЕ ЭКСПОРТНЫХ АККРЕДИТИВОВ КОТНРАГЕНТА;\rИСПОЛНЕНИЕ АККРЕДИТИВОВ;\rВЫПОЛНЕНИЕ ФУНКЦИИ РАМБУРСИРУЮЩЕГО БАНКА НА ОСНОВАНИИ ПРЕДОСТАВЛЕННЫХ ПОЛНОМОЧИЙ ПО АККРЕДИТИВАМ ИНОСТРАННЫХ И РОССИЙСКИХ БАНКОВ-КОРРЕСПОНДЕНТОВ (ПРИ НАЛИЧИИ У БАНКА-ЭМИТЕНТА КОРРЕСПОНДЕНТСКОГО СЧЕТА ЛОРО В ГАЗПРОМБАНКЕ);\rВЫДАЧА БЕЗОТЗЫВНЫХ РАМБУРСНЫХ ОБЯЗАТЕЛЬСТВ ПО АККРЕДИТИВАМ, ОТКРЫТЫМ БАНКАМИ-КОРРЕСПОНДЕНТАМИ, В СЧЕТ ДОКУМЕНТАРНЫХ ЛИМИТОВ, УСТАНОВЛЕННЫХ НА БАНК-ЭМИТЕНТ (ПРИ НАЛИЧИИ У БАНКА-ЭМИТЕНТА КОРРЕСПОНДЕНТСКОГО СЧЕТА ЛОРО В ГАЗПРОМБАНКЕ);\rОФОРМЛЕНИЕ ТРАНСФЕРАЦИИ И ПЕРЕУСТУПКИ ВЫРУЧКИ ПО АККРЕДИТИВАМ;\rОТКРЫТИЕ АККРЕДИТИВОВ/ПРЕДОСТАВЛЕНИЕ ПЛАТЕЖНЫХ ГАРАНТИЙ В РАМКАХ ОПЕРАЦИЙ ТОРГОВОГО ФИНАНСИРОВАНИЯ;\rИНЫЕ ВИДЫ ОПЕРАЦИЙ, ВКЛЮЧАЯ ПРЕДВАРИТЕЛЬНУЮ ПРОРАБОТКУ СХЕМЫ РАСЧЕТОВ И УСЛОВИЙ АККРЕДИТИВНОЙ СДЕЛКИ.\r\n'),
(19, 'c24ffbaa8b72cfcb3d011c1f2708c749', 'ФИНАНСОВЫМ ОРГАНИЗАЦИЯМ\r\nАКТИВНОЕ СОТРУДНИЧЕСТВО НА ФИНАНСОВЫХ РЫНКАХ ПРЕДСТАВЛЯЕТ СОБОЙ ОДНУ ИЗ НАИБОЛЕЕ ВАЖНЫХ СТОРОН БИЗНЕСА И ЯВЛЯЕТСЯ ПЕРСПЕКТИВНЫМ НАПРАВЛЕНИЕМ ДЕЯТЕЛЬНОСТИ НАШЕГО БАНКА. ПОЛИТИКА БАНКА НАПРАВЛЕНА НА РАСШИРЕНИЕ СОТРУДНИЧЕСТВА, УВЕЛИЧЕНИЕ ОБЪЕМОВ ВЗАИМНЫХ КРЕДИТНЫХ ЛИНИЙ. СОЛИДНАЯ ДЕЛОВАЯ РЕПУТАЦИЯ БАНКА НА РЫНКЕ МЕЖБАНКОВСКИХ ОПЕРАЦИЙ СПОСОБСТВУЕТ НАЛАЖИВАНИЮ СТАБИЛЬНЫХ И ВЗАИМОВЫГОДНЫХ ПАРТНЕРСКИХ ОТНОШЕНИЙ С САМЫМИ КРУПНЫМИ И НАДЕЖНЫМИ БАНКАМИ СТРАНЫ.\rОСОБОЕ ВНИМАНИЕ БАНК УДЕЛЯЕТ РАЗВИТИЮ ВЗАИМООТНОШЕНИЙ С МЕЖДУНАРОДНЫМИ ФИНАНСОВЫМИ ИНСТИТУТАМИ. ФИНАНСИРОВАНИЕ ДОЛГОСРОЧНЫХ И СРЕДНЕСРОЧНЫХ ПРОЕКТОВ КЛИЕНТОВ ЗА СЧЕТ ПРИВЛЕЧЕНИЯ СРЕДСТВ НА МЕЖДУНАРОДНЫХ РЫНКАХ КАПИТАЛА - ОДНО ИЗ ПРИОРИТЕТНЫХ НАПРАВЛЕНИЙ ДЕЯТЕЛЬНОСТИ БАНКА. НАШ БАНК ИМЕЕТ РАЗВИТУЮ СЕТЬ КОРРЕСПОНДЕНТСКИХ СЧЕТОВ, ЧТО ПОЗВОЛЯЕТ БЫСТРО И КАЧЕСТВЕННО ОСУЩЕСТВЛЯТЬ РАСЧЕТЫ В РАЗЛИЧНЫХ ВАЛЮТАХ. ПОРУЧЕНИЯ КЛИЕНТОВ МОГУТ БЫТЬ ИСПОЛНЕНЫ БАНКОМ В СЖАТЫЕ СРОКИ.\rВ ЦЕЛЯХ МИНИМИЗАЦИИ РИСКОВ ПРИ ПОВЕДЕНИИ ОПЕРАЦИЙ НА ФИНАНСОВЫХ РЫНКАХ НАШ БАНК МАКСИМАЛЬНО ТРЕБОВАТЕЛЬНО ПОДХОДИТ К ВЫБОРУ СВОИХ БАНКОВ-КОНТРАГЕНТОВ. \rВ ДАННОМ НАПРАВЛЕНИИ БАНК ПРЕДЛАГАЕТ ФИНАНСОВЫМ ОРГАНИЗАЦИЯМ СЛЕДУЮЩИЕ УСЛУГИ:\rУСЛУГИ НА МЕЖБАНКОВСКОМ РЫНКЕ\rДЕПОЗИТАРНЫЕ УСЛУГИ\rДОКУМЕНТАРНЫЕ ОПЕРАЦИИ\r\n'),
(20, '53412cd449563f783dca67a6dbdc6d62', 'УСЛУГИ НА МЕЖБАНКОВСКОМ РЫНКЕ\r\nМЕЖБАНКОВСКОЕ КРЕДИТОВАНИЕ\rВИД УСЛУГИ\nОПИСАНИЕ\nКРЕДИТОВАНИЕ ПОД ВАЛЮТНЫЙ ДЕПОЗИТ\nКРЕДИТЫ ВЫДАЮТСЯ В РУБЛЯХ НА СРОК ОТ 1 ДНЯ ДО 1 МЕСЯЦА С ВОЗМОЖНОСТЬЮ ДАЛЬНЕЙШЕЙ\nПРОЛОНГАЦИИ. ТАРИФНЫЕ СТАВКИ ЗАВИСЯТ ОТ КОНКРЕТНЫХ УСЛОВИЙ СДЕЛКИ.\nКРЕДИТОВАНИЕ ПОД ЗАЛОГ ОВГВЗ\nКРЕДИТЫ ВЫДАЮТСЯ В РУБЛЯХ И ВАЛЮТЕ НА СРОК ДО 1 МЕСЯЦА С ВОЗМОЖНОЙ ПРОЛОНГАЦИЕЙ.\nСТАВКА ДИСКОНТА СОСТАВЛЯЕТ 25—30%.\nКРЕДИТОВАНИЕ ПОД ЗАЛОГ ГОСУДАРСТВЕННЫХ ЦЕННЫХ БУМАГ\nВ ЗАЛОГ ПРИНИМАЮТСЯ ОБЛИГАЦИИ ФЕДЕРАЛЬНОГО ЗАЙМА (ОФЗ) ЛЮБОГО ВЫПУСКА. СТАВКА ДИСКОНТА:\nОФЗ С ДАТОЙ ПОГАШЕНИЯ ДО 91 ДНЯ — 5%;\rОФЗ С ДАТОЙ ПОГАШЕНИЯ ДО 365 ДНЕЙ — 8%;\rОФЗ С ДАТОЙ ПОГАШЕНИЯ СВЫШЕ 365 ДНЕЙ — 13%.\rКРЕДИТЫ ВЫДАЮТСЯ НА СРОК ДО2 НЕДЕЛЬ.\nКРЕДИТОВАНИЕ ПОД ЗАЛОГ ВЕКСЕЛЕЙ\nДЛЯ КОНСУЛЬТАЦИЙ ПО ЭТОМУ ВИДУ КРЕДИТОВАНИЯ ОБРАТИТЕСЬ В УПРАВЛЕНИЕ ВЕКСЕЛЬНОГО\nОБРАЩЕНИЯ И РАБОТЫ С ДОЛГОВЫМИ ОБЯЗАТЕЛЬСТВАМИ ПО ТЕЛЕФОНУ (495) 978-78-78.\nКОНВЕРСИОННЫЕ ОПЕРАЦИИ\rНА ВНУТРЕННЕМ ДЕНЕЖНОМ РЫНКЕ БАНК ОСУЩЕСТВЛЯЕТ:\rБРОКЕРСКОЕ ОБСЛУЖИВАНИЕ БАНКОВ ПО ИХ УЧАСТИЮ В ТОРГАХ ЕТС НА ММВБ. СТАВКИ КОМИССИОННОГО ВОЗНАГРАЖДЕНИЯ ВАРЬИРУЮТСЯ В ЗАВИСИМОСТИ ОТ ОБЪЕМА ОПЕРАЦИЙ (В ПРЕДЕЛАХ 0,147—0,18%).\rКОНВЕРСИОННЫЕ ОПЕРАЦИИ. БАНК ПРЕДЛАГАЕТ БАНКАМ-КОНТРАГЕНТАМ РАБОТУ НА ВАЛЮТНОМ РЫНКЕ ПО ПОКУПКЕ И ПРОДАЖЕ ИНОСТРАННОЙ ВАЛЮТЫ ЗА РОССИЙСКИЕ РУБЛИ ПО ТЕКУЩИМ РЫНОЧНЫМ ЦЕНАМ. ПРИ ОТСУТСТВИИ ОТКРЫТЫХ ЛИНИЙ ПРИ ПРОДАЖЕ ИНОСТРАННОЙ ВАЛЮТЫ БАНК-КОНТРАГЕНТ ПРОИЗВОДИТ ПРЕДОПЛАТУ ПО ЗАКЛЮЧЕННОЙ СДЕЛКЕ, ВОЗМОЖНА РАБОТА ПОД КРЕДИТОВОЕ АВИЗО.\rБАНКНОТНЫЕ ОПЕРАЦИИ\rПОКУПКА И ПРОДАЖА НАЛИЧНОЙ ВАЛЮТЫ ЗА БЕЗНАЛИЧНУЮ ВАЛЮТУ;\rПРОДАЖА НОВЫХ БАНКНОТ В УПАКОВКЕ АМЕРИКАНСКОГО БАНКА-ЭМИТЕНТА;\rПОКУПКА И ПРОДАЖА БАНКНОТ, БЫВШИХ В УПОТРЕБЛЕНИИ.\rУРОВЕНЬ КОМИССИОННЫХ ЗАВИСИТ ОТ ОБЪЕМОВ И КОНКРЕТНЫХ УСЛОВИЙ СДЕЛКИ.\rДОКУМЕНТАРНЫЕ ОПЕРАЦИИ\rМЕЖДУНАРОДНЫЕ РАСЧЕТЫ:\nАККРЕДИТИВ\r- ЭТО УСЛОВНОЕ ДЕНЕЖНОЕ ОБЯЗАТЕЛЬСТВО, ПРИНИМАЕМОЕ БАНКОМ (БАНКОМ-ЭМИТЕНТОМ) ПО ПОРУЧЕНИЮ ПЛАТЕЛЬЩИКА, ПРОИЗВЕСТИ ПЛАТЕЖИ В ПОЛЬЗУ ПОЛУЧАТЕЛЯ СРЕДСТВ ПО ПРЕДЪЯВЛЕНИИ ПОСЛЕДНИМ ДОКУМЕНТОВ, СООТВЕТСТВУЮЩИХ УСЛОВИЯМ АККРЕДИТИВА, ИЛИ ПРЕДОСТАВИТЬ ПОЛНОМОЧИЯ ДРУГОМУ БАНКУ (ИСПОЛНЯЮЩЕМУ БАНКУ) ПРОИЗВЕСТИ ТАКИЕ ПЛАТЕЖИ.\rИНКАССО\r- ЭТО РАСЧЕТНАЯ ОПЕРАЦИЯ, ПОСРЕДСТВОМ КОТОРОЙ БАНК НА ОСНОВАНИИ РАСЧЕТНЫХ ДОКУМЕНТОВ ПО ПОРУЧЕНИЮ КЛИЕНТА ПОЛУЧАЕТ ПРИЧИТАЮЩИЕСЯ КЛИЕНТУ ДЕНЕЖНЫЕ СРЕДСТВА ОТ ПЛАТЕЛЬЩИКА ЗА ПОСТУПИВШИЕ В АДРЕС ПЛАТЕЛЬЩИКА ТОВАРЫ ИЛИ ОКАЗАННЫЕ ЕМУ УСЛУГИ, ПОСЛЕ ЧЕГО ЭТИ СРЕДСТВА ЗАЧИСЛЯЮТСЯ НА СЧЕТ КЛИЕНТА В БАНКЕ.\rОПЕРАЦИИ С ВЕКСЕЛЯМИ БАНКА\rВЕКСЕЛИ НАШЕГО БАНКА ЯВЛЯЮТСЯ ПРОСТЫМИ ВЕКСЕЛЯМИ.\rПРОСТОЙ ВЕКСЕЛЬ — ДОКУМЕНТ УСТАНОВЛЕННОЙ ЗАКОНОМ ФОРМЫ, ДАЮЩИЙ ЕГО ДЕРЖАТЕЛЮ (ВЕКСЕЛЕДЕРЖАТЕЛЮ) БЕЗУСЛОВНОЕ ПРАВО ТРЕБОВАТЬ С ЛИЦА, УКАЗАННОГО В ДАННОМ ДОКУМЕНТЕ (ПЛАТЕЛЬЩИКА), УПЛАТЫ ОГОВОРЕННОЙ СУММЫ ПО НАСТУПЛЕНИЮ НЕКОТОРОГО СРОКА. ОБЯЗАТЕЛЬСТВО ПО ПРОСТОМУ ВЕКСЕЛЮ ВОЗНИКАЕТ С МОМЕНТА ЕГО СОСТАВЛЕНИЯ И ПЕРЕДАЧИ ПЕРВОМУ ВЕКСЕЛЕДЕРЖАТЕЛЮ.\rПЕРЕЧЕНЬ ПРОВОДИМЫХ БАНКОМ ОПЕРАЦИЙ С СОБСТВЕННЫМИ ВЕКСЕЛЯМИ:\nВЫПУСК ВЕКСЕЛЕЙ;\rПОГАШЕНИЕ ВЕКСЕЛЕЙ;\rДОСРОЧНЫЙ УЧЕТ ВЕКСЕЛЕЙ;\rОТВЕТСТВЕННОЕ ХРАНЕНИЕ ВЕКСЕЛЕЙ;\rКРЕДИТОВАНИЕ ПОД ЗАЛОГ ВЕКСЕЛЕЙ;\rВЫДАЧА КРЕДИТОВ НА ПРИОБРЕТЕНИЕ ВЕКСЕЛЕЙ;\rНОВАЦИЯ И РАЗМЕН ВЕКСЕЛЕЙ;\rПРОВЕРКА ПОДЛИННОСТИ ВЕКСЕЛЕЙ.\r\n'),
(21, '89a00e9561c33cb54aca96d9d99c715e', 'БАНКОВСКИЕ КАРТЫ\r\nКРЕДИТНЫЕ КАРТЫ\rСРОК ДЕЙСТВИЯ КАРТЫ\r3 ГОДА\rКОМИССИЯ ЗА ЕЖЕГОДНОЕ ОСУЩЕСТВЛЕНИЕ РАСЧЕТОВ ПО ОПЕРАЦИЯМ С ОСНОВНОЙ КАРТОЙ.\r600 РУБ. / 25 ДОЛЛ. США / 25 ЕВРО\rЛЬГОТНЫЙ ПЕРИОД ОПЛАТЫ\rДО 50 КАЛЕНДАРНЫХ ДНЕЙ\rЕЖЕМЕСЯЧНЫЙ МИНИМАЛЬНЫЙ ПЛАТЕЖ \r(В ПРОЦЕНТАХ ОТ СУММЫ ЗАДОЛЖЕННОСТИ ПО ОВЕРДРАФТАМ):\r10% \rДОПОЛНИТЕЛЬНЫЕ ПРОЦЕНТЫ/ШТРАФЫ/КОМИССИИ/ НА СУММУ НЕРАЗРЕШЕННОГО ОВЕРДРАФТА\rНЕ ВЗИМАЕТСЯ (ОТМЕНЕНА С 1 МАРТА) \rКОМИССИЯ ЗА УЧЕТ ОТЧЕТНОЙ СУММЫ ЗАДОЛЖЕННОСТИ, НЕПОГАШЕННОЙ НА ПОСЛЕДНИЙ КАЛЕНДАРНЫЙ ДЕНЬ ЛЬГОТНОГО ПЕРИОДА ОПЛАТЫ.\rДЛЯ 1-6-ГО МЕСЯЦЕВ\rДЛЯ 6-ГО И ПОСЛЕДУЮЩИХ МЕСЯЦЕВ\r12% / 15% \r21% / 24% \rВ ПУНКТАХ ВЫДАЧИ НАЛИЧНЫХ ИЛИ БАНКОМАТАХ \"БАНКА\" \rВ БАНКОМАТАХ БАНКОВ-ПАРТНЕРОВ \"ОБЪЕДИНЕННОЙ РАСЧЕТНОЙ СИСТЕМЫ (ОРС)\" \rВ ПУНКТАХ ВЫДАЧИ НАЛИЧНЫХ ИЛИ БАНКОМАТАХ ИНОГО БАНКА \r0%\r0,5%\r2,5%\rМИНИМАЛЬНАЯ СУММА КОМИССИИ ПО ОПЕРАЦИЯМ ПОЛУЧЕНИЯ НАЛИЧНЫХ ДЕНЕЖНЫХ СРЕДСТВ В ПУНКТАХ ВЫДАЧИ НАЛИЧНЫХ ИЛИ БАНКОМАТАХ ИНОГО БАНКА. \r150 РУБЛЕЙ\rКОМИССИЯ ЗА ОСУЩЕСТВЛЕНИЕ КОНВЕРТАЦИИ ПО ТРАНСГРАНИЧНЫМ ОПЕРАЦИЯМ (СОВЕРШЕННЫМ ЗА ПРЕДЕЛАМИ ТЕРРИТОРИИ РФ). \r0,75% \rРАСЧЕТНЫЕ КАРТЫ БАНКА\rВАЛЮТА КАРТСЧЕТА\rРОССИЙСКИЕ РУБЛИ / ДОЛЛАРЫ США / ЕВРО\rСРОК ДЕЙСТВИЯ КАРТЫ\r3 ГОДА\rКОМИССИЯ ЗА ОСУЩЕСТВЛЕНИЕ РАСЧЕТОВ В ТЕЧЕНИЕ ОДНОГО ГОДА ПО ОПЕРАЦИЯМ С ОСНОВНОЙ КАРТОЙ ПРИ ЕЕ ПЕРВИЧНОМ ВЫПУСКЕ.\rВЗИМАЕТСЯ ПЕРЕД НАЧАЛОМ КАЖДОГО ГОДА РАСЧЕТОВ ПО ДЕЙСТВУЮЩЕЙ КАРТЕ ИЗ СРЕДСТВ НА КАРТСЧЕТЕ.\r500 РУБЛЕЙ/20 ДОЛЛ. США/20 ЕВРО\rКОМИССИЯ ЗА ОПЕРАЦИЮ ПОЛУЧЕНИЯ НАЛИЧНЫХ ДЕНЕЖНЫХ СРЕДСТВ:\rДО 300 000 РУБЛЕЙ (ВКЛЮЧИТЕЛЬНО)\rВ ПУНКТАХ ВЫДАЧИ НАЛИЧНЫХ ИЛИ БАНКОМАТАХ «БАНКА»\rВ БАНКОМАТАХ БАНКОВ-ПАРТНЕРОВ\rВ ПУНКТАХ ВЫДАЧИ НАЛИЧНЫХ ИЛИ БАНКОМАТАХ ИНОГО БАНКА\r0%\r0,5%\r1,5% МИН. 90 РУБ.\rОТ 300 001 ДО 10 000 000 РУБЛЕЙ (ВКЛЮЧИТЕЛЬНО)\r2,5% \rОТ 10 000 001 РУБЛЯ И ВЫШЕ\r5%\rМИНИМАЛЬНАЯ СУММА КОМИССИИ ПО ОПЕРАЦИЯМ ПОЛУЧЕНИЯ НАЛИЧНЫХ ДЕНЕЖНЫХ СРЕДСТВ В ПУНКТАХ ВЫДАЧИ НАЛИЧНЫХ ИЛИ БАНКОМАТАХ ИНОГО БАНКА. \r90 РУБЛЕЙ\rКОМИССИЯ ЗА ПЕРЕЧИСЛЕНИЕ И КОНВЕРСИЮ ДЕНЕЖНЫХ СРЕДСТВ В ИНТЕРНЕТ-БАНКЕ. \r0%\rКОМИССИЯ ЗА ОСТАНОВКУ ОПЕРАЦИЙ ПО КАРТСЧЕТУ, СОВЕРШАЕМЫХ С ИСПОЛЬЗОВАНИЕМ КАРТЫ, ПРИ ЕЕ УТРАТЕ. \r600 РУБЛЕЙ/25 ДОЛЛ. США/25 ЕВРО\rКОМИССИЯ ЗА ОСУЩЕСТВЛЕНИЕ КОНВЕРСИИ ПО ТРАНСГРАНИЧНЫМ ОПЕРАЦИЯМ (СОВЕРШЕННЫМ ЗА ПРЕДЕЛАМИ ТЕРРИТОРИИ РФ).\r0,75%\rВЫДАЧА КАРТОЧКИ ДОСТУПА.\rБЕСПЛАТНО\rКОМИССИЯ ЗА ОПЛАТУ УСЛУГ В ИНТЕРНЕТ - БАНКЕ И В БАНКОМАТАХ БАНКА. \rБЕСПЛАТНО\rКОМИССИЯ ЗА УЧЕТ ПЕРЕРАСХОДА СРЕДСТВ (В ПРОЦЕНТАХ ГОДОВЫХ ОТ СУММЫ ПЕРЕРАСХОДА). \r36%\rКОМИССИЯ ЗА ОТПРАВКУ SMS СООБЩЕНИЙ О СУММАХ ПРОВЕДЕННЫХ ПО КАРТЕ ОПЕРАЦИЙ И ДОСТУПНОМ БАЛАНСЕ В ТЕЧЕНИЕ ЕЕ СРОКА ДЕЙСТВИЯ.\rБЕСПЛАТНО\r\n'),
(22, '97cc4b8d5eae6669c6e5920eca22f9cd', 'ПОТРЕБИТЕЛЬСКИЙ КРЕДИТ\r\nНЕ ВАЖНО, ДЛЯ ЧЕГО ВАМ НУЖНЫ ДЕНЬГИ — МЫ ДОВЕРЯЕМ ВАМ И НЕ ТРАТИМ ВРЕМЯ НА ЛИШНИЕ ПРОЦЕДУРЫ.\rТАРИФЫ КРЕДИТОВАНИЯ ФИЗИЧЕСКИХ ЛИЦ\rВ РУБЛЯХ\rСУММА КРЕДИТА: ОТ 150 000 ДО 1 500 000 РУБЛЕЙ\rСРОК КРЕДИТА: ОТ 6 ДО 36 МЕСЯЦЕВ\r% СТАВКА: ОТ 18 ДО 21,5% ГОДОВЫХ\rЕДИНОВРЕМЕННАЯ КОМИССИЯ ЗА ВЫДАЧУ КРЕДИТА: 2% ОТ СУММЫ КРЕДИТА\rВ ДОЛЛАРАХ США\rСУММА КРЕДИТА: ОТ 5 000 ДО 50 000 ДОЛЛАРОВ США\rСРОК КРЕДИТА: ОТ 6 ДО 24 МЕСЯЦЕВ\r% СТАВКА: ОТ 14,5 ДО 16,5% ГОДОВЫХ\rЕДИНОВРЕМЕННАЯ КОМИССИЯ ЗА ВЫДАЧУ КРЕДИТА: 2% ОТ СУММЫ КРЕДИТА\rУСЛОВИЯ КРЕДИТНОГО ДОГОВОРА И ПРИМЕНЯЕМЫЙ ТАРИФНЫЙ ПЛАН И/ИЛИ ТАРИФЫ ОПРЕДЕЛЯЮТСЯ В ИНДИВИДУАЛЬНОМ ПОРЯДКЕ, В ТОМ ЧИСЛЕ В ЗАВИСИМОСТИ ОТ ПОДТВЕРЖДЕННОГО ДОХОДА КЛИЕНТА. ИЗЛОЖЕННАЯ ИНФОРМАЦИЯ НЕ ЯВЛЯЕТСЯ ПУБЛИЧНОЙ ОФЕРТОЙ И НЕ ВЛЕЧЕТ ВОЗНИКНОВЕНИЯ У ЗАО «БАНК ИНТЕЗА» ОБЯЗАННОСТИ ПРЕДОСТАВИТЬ КРЕДИТ, КАК НА УКАЗАННЫХ, ТАК И НА ЛЮБЫХ ИНЫХ УСЛОВИЯХ.\rМИНИМАЛЬНЫЕ ТРЕБОВАНИЯ К ЗАЕМЩИКУ\rВЫ ГРАЖДАНИН РОССИИ.\rВАМ СЕЙЧАС БОЛЬШЕ 23 ЛЕТ И ВАМ БУДЕТ МЕНЬШЕ 60 (ДЛЯ МУЖЧИН) ИЛИ МЕНЬШЕ 55 (ДЛЯ ЖЕНЩИН) НА МОМЕНТ ПОГАШЕНИЯ (ТО ЕСТЬ ПОЛНОЙ ОПЛАТЫ) КРЕДИТА.\rУ ВАС ЕСТЬ ОФИЦИАЛЬНОЕ МЕСТО РАБОТЫ, И ВЫ РАБОТАЕТЕ НА НЕМ ПО НАЙМУ НЕ МЕНЕЕ ШЕСТИ МЕСЯЦЕВ И ПРОШЛИ ИСПЫТАТЕЛЬНЫЙ СРОК.\rВАШ ОБЩИЙ ТРУДОВОЙ СТАЖ СОСТАВЛЯЕТ НЕ МЕНЕЕ ДВУХ ЛЕТ\rВЫ МОЖЕТЕ ПОДТВЕРДИТЬ СВОЙ ДОХОД ОФИЦИАЛЬНО ПРИ ПОМОЩИ СТАНДАРТНОЙ ФОРМЫ 2НДФЛ ИЛИ СПРАВКОЙ ПО ФОРМЕ БАНКА.\rВЫ ОБРАТИЛИСЬ В ОТДЕЛЕНИЕ БАНКА В ТОМ ЖЕ ГОРОДЕ, В КОТОРОМ ВЫ РАБОТАЕТЕ.\rС ВАМИ МОЖНО СВЯЗАТЬСЯ ПО ГОРОДСКОМУ ТЕЛЕФОНУ ПО МЕСТУ РАБОТЫ.\rТЕЛЕФОН ГОРЯЧЕЙ ЛИНИИ: \r8 800 2002 808\r( ЗВОНОК ПО РОССИИ БЕСПЛАТНЫЙ)\r\n'),
(23, '1560168bdcc5a4573c23c7cacbbf48d8', 'ЧАСТНЫМ ЛИЦАМ\r\nНАШ БАНК ПРЕДОСТАВЛЯЕТ ФИЗИЧЕСКИМ ЛИЦАМ БОЛЬШОЕ ЧИСЛО РАЗЛИЧНЫХ ВОЗМОЖНОСТЕЙ, СВЯЗАННЫХ С СОХРАНЕНИЕМ СРЕДСТВ И СОВЕРШЕНИЕМ РАЗЛИЧНЫХ СДЕЛОК. В ЧАСТНОСТИ, БАНК ПРЕДЛАГАЕТ СВОИМ КЛИЕНТАМ ШИРОКУЮ ЛИНЕЙКУ РАЗНООБРАЗНЫХ ВКЛАДОВ, СПОСОБНЫХ УДОВЛЕТВОРИТЬ КАК ДОЛГОСРОЧНЫЕ, ТАК И КРАТКОСРОЧНЫЕ ИНТЕРЕСЫ, КАСАЮЩИЕСЯ РАЗМЕЩЕНИЯ СВОБОДНЫХ СРЕДСТВ ПО ВЫГОДНЫМ СТАВКАМ. В СВОЕЙ РАБОТЕ БАНК АКТИВНО ПРИМЕНЯЕТ ИННОВАЦИОННЫЕ ТЕХНОЛОГИИ ДИНАМИЧНО РАЗВИВАЮЩЕЙСЯ БАНКОВСКОЙ СФЕРЫ.\rБАНК ПРЕДЛАГАЕТ СВОИМ КЛИЕНТАМ КАЧЕСТВЕННЫЙ УНИВЕРСАЛЬНЫЙ СЕРВИС ПО СЛЕДУЮЩИМ НАПРАВЛЕНИЯМ:\rБАНКОВСКИЕ КАРТЫ\rПОТРЕБИТЕЛЬСКИЙ КРЕДИТ\r\n'),
(24, '5294819207cd629318e1de373aa1e6f3', 'УСЛУГИ\r\nНАШ БАНК ПРЕДОСТАВЛЯЕТ ФИЗИЧЕСКИМ ЛИЦАМ БОЛЬШОЕ ЧИСЛО РАЗЛИЧНЫХ ВОЗМОЖНОСТЕЙ, СВЯЗАННЫХ С СОХРАНЕНИЕМ СРЕДСТВ И СОВЕРШЕНИЕМ РАЗЛИЧНЫХ СДЕЛОК. В ЧАСТНОСТИ, БАНК ПРЕДЛАГАЕТ СВОИМ КЛИЕНТАМ ШИРОКУЮ ЛИНЕЙКУ РАЗНООБРАЗНЫХ ВКЛАДОВ, СПОСОБНЫХ УДОВЛЕТВОРИТЬ КАК ДОЛГОСРОЧНЫЕ, ТАК И КРАТКОСРОЧНЫЕ ИНТЕРЕСЫ, КАСАЮЩИЕСЯ РАЗМЕЩЕНИЯ СВОБОДНЫХ СРЕДСТВ ПО ВЫГОДНЫМ СТАВКАМ. В СВОЕЙ РАБОТЕ БАНК АКТИВНО ПРИМЕНЯЕТ ИННОВАЦИОННЫЕ ТЕХНОЛОГИИ ДИНАМИЧНО РАЗВИВАЮЩЕЙСЯ БАНКОВСКОЙ СФЕРЫ.\rБАНК ПРЕДЛАГАЕТ СВОИМ КЛИЕНТАМ КАЧЕСТВЕННЫЙ УНИВЕРСАЛЬНЫЙ СЕРВИС ПО СЛЕДУЮЩИМ НАПРАВЛЕНИЯМ:\rБАНКОВСКИЕ КАРТЫ\rПОТРЕБИТЕЛЬСКИЙ КРЕДИТ\rМАЛОМУ И СРЕДНЕМУ БИЗНЕСУ\rРАБОТА С ПРЕДПРИЯТИЯМИ МАЛОГО И СРЕДНЕГО БИЗНЕСА - ОДНО ИЗ СТРАТЕГИЧЕСКИ ВАЖНЫХ НАПРАВЛЕНИЙ ДЕЯТЕЛЬНОСТИ БАНКА. НАШ БАНК ПРЕДСТАВЛЯЕТ СОВРЕМЕННЫЕ ПРОГРАММЫ ОБСЛУЖИВАНИЯ МАЛОГО И СРЕДНЕГО БИЗНЕСА, ОБЕСПЕЧИВАЕТ ОПТИМАЛЬНЫЕ И ВЗАИМОВЫГОДНЫЕ ВАРИАНТЫ СОТРУДНИЧЕСТВА, В ОСНОВЕ КОТОРЫХ ЛЕЖИТ ПРОФЕССИОНАЛИЗМ СОТРУДНИКОВ И ВЫСОКОЕ КАЧЕСТВО БАНКОВСКИХ УСЛУГ. УСЛУГИ НАШЕГО БАНКА ОТЛИЧАЮТСЯ ОПЕРАТИВНОСТЬЮ И НАДЕЖНОСТЬЮ, ТАК КАК ОРИЕНТИРОВАНЫ НА ДЕЛОВЫХ ЛЮДЕЙ - НА ТЕХ, КТО ЦЕНИТ СВОЕ ВРЕМЯ И ДЕНЬГИ.\rБАНК ПРЕДЛАГАЕТ СЛЕДУЮЩИЕ ВИДЫ УСЛУГ ДЛЯ ПРЕДПРИЯТИЙ МАЛОГО И СРЕДНЕГО БИЗНЕСА:\rКРЕДИТОВАНИЕ\rЛИЗИНГ\rДЕПОЗИТЫ\rПЛАСТИКОВЫЕ КАРТЫ\rКОРПОРАТИВНЫМ КЛИЕНТАМ\rБАНК ЯВЛЯЕТСЯ ОДНИМ ИЗ ЛИДЕРОВ БАНКОВСКОГО РЫНКА ПО ОБСЛУЖИВАНИЮ КОРПОРАТИВНЫХ КЛИЕНТОВ. \rКОМПЛЕКСНОЕ БАНКОВСКОЕ ОБСЛУЖИВАНИЕ НА ОСНОВЕ МАКСИМАЛЬНОГО ИСПОЛЬЗОВАНИЯ КОНКУРЕНТНЫХ ПРЕИМУЩЕСТВ И ВОЗМОЖНОСТЕЙ БАНКА ПОЗВОЛЯЕТ СОЗДАТЬ УСТОЙЧИВУЮ \rФИНАНСОВУЮ ПЛАТФОРМУ ДЛЯ РАЗВИТИЯ БИЗНЕСА ПРЕДПРИЯТИЙ И ХОЛДИНГОВ РАЗЛИЧНЫХ ОТРАСЛЕЙ ЭКОНОМИКИ. УЖЕ БОЛЕЕ 15 ЛЕТ БАНК РАБОТАЕТ ДЛЯ СВОИХ КЛИЕНТОВ, \rЯВЛЯЯСЬ ОБРАЗЦОМ НАДЕЖНОСТИ И ВЫСОКОГО ПРОФЕССИОНАЛИЗМА.\rНАШ БАНК ПРЕДЛАГАЕТ КОРПОРАТИВНЫМ КЛИЕНТАМ СЛЕДУЮЩИЕ ВИДЫ УСЛУГ:\rРАСЧЕТНО-КАССОВОЕ ОБСЛУЖИВАНИЕ\rИНКАССАЦИЯ\rИНТЕРНЕТ-БАНКИНГ\rФИНАНСОВЫМ ОРГАНИЗАЦИЯМ\rАКТИВНОЕ СОТРУДНИЧЕСТВО НА ФИНАНСОВЫХ РЫНКАХ ПРЕДСТАВЛЯЕТ СОБОЙ ОДНУ ИЗ НАИБОЛЕЕ ВАЖНЫХ СТОРОН БИЗНЕСА И ЯВЛЯЕТСЯ ПЕРСПЕКТИВНЫМ НАПРАВЛЕНИЕМ ДЕЯТЕЛЬНОСТИ НАШЕГО БАНКА. ПОЛИТИКА БАНКА НАПРАВЛЕНА НА РАСШИРЕНИЕ СОТРУДНИЧЕСТВА, УВЕЛИЧЕНИЕ ОБЪЕМОВ ВЗАИМНЫХ КРЕДИТНЫХ ЛИНИЙ. СОЛИДНАЯ ДЕЛОВАЯ РЕПУТАЦИЯ БАНКА НА РЫНКЕ МЕЖБАНКОВСКИХ ОПЕРАЦИЙ СПОСОБСТВУЕТ НАЛАЖИВАНИЮ СТАБИЛЬНЫХ И ВЗАИМОВЫГОДНЫХ ПАРТНЕРСКИХ ОТНОШЕНИЙ С САМЫМИ КРУПНЫМИ И НАДЕЖНЫМИ БАНКАМИ СТРАНЫ.\rОСОБОЕ ВНИМАНИЕ БАНК УДЕЛЯЕТ РАЗВИТИЮ ВЗАИМООТНОШЕНИЙ С МЕЖДУНАРОДНЫМИ ФИНАНСОВЫМИ ИНСТИТУТАМИ. ФИНАНСИРОВАНИЕ ДОЛГОСРОЧНЫХ И СРЕДНЕСРОЧНЫХ ПРОЕКТОВ КЛИЕНТОВ ЗА СЧЕТ ПРИВЛЕЧЕНИЯ СРЕДСТВ НА МЕЖДУНАРОДНЫХ РЫНКАХ КАПИТАЛА - ОДНО ИЗ ПРИОРИТЕТНЫХ НАПРАВЛЕНИЙ ДЕЯТЕЛЬНОСТИ БАНКА. НАШ БАНК ИМЕЕТ РАЗВИТУЮ СЕТЬ КОРРЕСПОНДЕНТСКИХ СЧЕТОВ, ЧТО ПОЗВОЛЯЕТ БЫСТРО И КАЧЕСТВЕННО ОСУЩЕСТВЛЯТЬ РАСЧЕТЫ В РАЗЛИЧНЫХ ВАЛЮТАХ. ПОРУЧЕНИЯ КЛИЕНТОВ МОГУТ БЫТЬ ИСПОЛНЕНЫ БАНКОМ В СЖАТЫЕ СРОКИ.\rВ ЦЕЛЯХ МИНИМИЗАЦИИ РИСКОВ ПРИ ПОВЕДЕНИИ ОПЕРАЦИЙ НА ФИНАНСОВЫХ РЫНКАХ НАШ БАНК МАКСИМАЛЬНО ТРЕБОВАТЕЛЬНО ПОДХОДИТ К ВЫБОРУ СВОИХ БАНКОВ-КОНТРАГЕНТОВ. \rВ ДАННОМ НАПРАВЛЕНИИ БАНК ПРЕДЛАГАЕТ ФИНАНСОВЫМ ОРГАНИЗАЦИЯМ СЛЕДУЮЩИЕ УСЛУГИ:\rУСЛУГИ НА МЕЖБАНКОВСКОМ РЫНКЕ\rДЕПОЗИТАРНЫЕ УСЛУГИ\rДОКУМЕНТАРНЫЕ ОПЕРАЦИИ\r\n'),
(25, '4c6e4f50a46679283be9c0d9734ef751', 'ПЛАСТИКОВЫЕ КАРТЫ\r\nНАШ БАНК ПРОВОДИТ ОПЕРАЦИИ С ПЛАСТИКОВЫМИ КАРТАМИ С 1997 Г. СЕГОДНЯ МЫ ПРЕДЛАГАЕМ ПЛАСТИКОВЫЕ КАРТЫ ОСНОВНЫХ МЕЖДУНАРОДНЫХ ПЛАТЁЖНЫХ СИСТЕМ – VISA И MASTERCARD; ОТ САМЫХ ДЕМОКРАТИЧНЫХ ЕLЕCTRON ДО ЭЛИТНЫХ GOLD И PLATINUM. В РАМКАХ ПЕРСОНАЛЬНОГО ОБСЛУЖИВАНИЯ В РАМКАХ ПЕРСОНАЛЬНОГО БАНКОВСКОГО ОБСЛУЖИВАНИЯ БАНК ДОПОЛНИТЕЛЬНО ПРЕДЛАГАЕТ ЭКСКЛЮЗИВНЫЕ КАРТЫ VISA INFINITE С БРИЛЛИАНТАМИ И ПЛАТИНОВЫМ ОРНАМЕНТОМ.\rЗАКАЗАТЬ МЕЖДУНАРОДНУЮ ПЛАСТИКОВУЮ КАРТУ МОЖНО В ЛЮБОМ ОТДЕЛЕНИИ НАШЕГО БАНКА. ВАША КАРТА БУДЕТ ГОТОВА УЖЕ ЧЕРЕЗ 3-5 ДНЕЙ. НАШ БАНК ОДИН ИЗ НЕМНОГИХ В РОССИИ, КТО ВЫДАЕТ КАРТУ СРОКОМ НА ДВА ГОДА, КАК И КРУПНЕЙШИЕ ЗАРУБЕЖНЫЕ БАНКИ.КАЖДЫЙ ПАКЕТ УСЛУГ БАНКА ВКЛЮЧАЕТ ОДНУ ОСНОВНУЮ И ДО ТРЕХ ДОПОЛНИТЕЛЬНЫХ ПЛАСТИКОВЫХ КАРТ ДЛЯ ВАС И ДЛЯ ЧЛЕНОВ ВАШЕЙ СЕМЬИ (ВКЛЮЧАЯ ДЕТЕЙ СТАРШЕ 14 ЛЕТ). ВЫ САМИ УСТАНАВЛИВАЕТЕ ОГРАНИЧЕНИЯ: КТО И СКОЛЬКО МОЖЕТ ПОТРАТИТЬ ПО КАРТЕ.\rТЕРЯЯ ПЛАСТИКОВУЮ КАРТУ, ВЫ НЕ ТЕРЯЕТЕ ДЕНЬГИ. ПОТОМУ ЧТО КАРТЫ НАШЕГО БАНКА НАДЕЖНО ЗАЩИЩЕНЫ ОТ НЕЗАКОННОГО ИСПОЛЬЗОВАНИЯ. ПРОСТО СОБЛЮДАЙТЕ ПРАВИЛА БЕЗОПАСНОСТИ ПРИ ОБРАЩЕНИИ СО СВОЕЙ КАРТОЙ, А В СЛУЧАЕ ЕЕ ПРОПАЖИ ИЛИ ХИЩЕНИЯ БЕЗ ПРОМЕДЛЕНИЯ ОБРАТИТЕСЬ В БАНК.\rПРЕИМУЩЕСТВА ПЛАСТИКОВЫХ КАРТ БАНКА\rПОЛУЧЕНИЕ НАЛИЧНЫХ БЕЗ КОМИССИИ В ШИРОКОЙ СЕТИ БАНКОМАТОВ;\rСВЕДЕНИЯ ОБ ОСТАТКЕ И СОВЕРШЁННЫХ ОПЕРАЦИЯХ ПО КАРТЕ ПРИХОДЯТ ПО SMS;\rСИСТЕМА ИНТЕРНЕТ-БАНКИНГА ПОЗВОЛЯЕТ ВЛАДЕЛЬЦУ КАРТЫ КОНТРОЛИРОВАТЬ РАСХОДЫ И УПРАВЛЯТЬ СРЕДСТВАМИ НА КАРТОЧНЫХ СЧЕТАХ.\rВСЕМ ВЛАДЕЛЬЦАМ КАРТ БАНКА ДОСТУПНЫ CКИДКИ И БОНУСНЫЕ ПРОГРАММЫ.\rВИДЫ ПЛАСТИКОВЫХ КАРТ\rДЕБЕТОВЫЕ КАРТЫ:\rУДОБСТВО БЕЗНАЛИЧНОЙ ОПЛАТЫ ТОВАРОВ И УСЛУГ\rБЕЗОПАСНОЕ ХРАНЕНИЕ СОБСТВЕННЫХ СРЕДСТВ\rНАЧИСЛЕНИЕ ПРОЦЕНТОВ НА ОСТАТОК ПО КАРТЕ\rКОНТРОЛЬ НАД РАСХОДАМИ И УПРАВЛЕНИЕ СВОИМИ ДЕНЬГАМИ\rКРЕДИТНЫЕ КАРТЫ:\rКРЕДИТОВАНИЕ БЕЗ ПРОЦЕНТОВ ДО 55 ДНЕЙ\rПОЛЬЗОВАТЬСЯ КРЕДИТОМ МОЖНО МНОГОКРАТНО, НЕ ОБРАЩАЯСЬ В БАНК\rБЕЗНАЛИЧНАЯ ОПЛАТА ТОВАРОВ И УСЛУГ БЕЗ КОМИССИЙ В ЛЮБОЙ ТОЧКЕ МИРА\rПРОВОЗ ДЕНЕГ ЧЕРЕЗ ГРАНИЦУ БЕЗ ТАМОЖЕННОГО ОФОРМЛЕНИЯ\rНЕ НУЖНО ПОКУПАТЬ ВАЛЮТУ ДЛЯ ВЫЕЗДА В ДРУГИЕ СТРАНЫ\rВСЕ ПОЛЕЗНЫЕ ФУНКЦИИ ДЕБЕТОВЫХ КАРТ\r\n'),
(26, '344cad3205bd5c2e8cffcf29a17ae499', 'КРЕДИТОВАНИЕ\r\nКРЕДИТОВАНИЕ МАЛОГО И СРЕДНЕГО БИЗНЕСА ЯВЛЯЕТСЯ ОДНИМ ИЗ СТРАТЕГИЧЕСКИХ НАПРАВЛЕНИЙ БАНКА.\rДАННОЕ НАПРАВЛЕНИЕ ВКЛЮЧАЕТ В СЕБЯ:\nКРЕДИТОВАНИЕ ЮРИДИЧЕСКИХ ЛИЦ\rКРЕДИТОВАНИЕ ИНДИВИДУАЛЬНЫХ ПРЕДПРИНИМАТЕЛЕЙ\rВ ЗАВИСИМОСТИ ОТ ПОЖЕЛАНИЙ КЛИЕНТА КРЕДИТЫ ДЛЯ БИЗНЕСА ПРЕДОСТАВЛЯЮТСЯ В РАЗНЫХ ВАЛЮТАХ: В РУБЛЯХ РФ, ДОЛЛАРАХ США И ЕВРО. \nПРЕИМУЩЕСТВА ПОЛУЧЕНИЯ КРЕДИТА В НАШЕМ БАНКЕ:\rСРОК РАССМОТРЕНИЯ КРЕДИТНОЙ ЗАЯВКИ ОТ 2-Х РАБОЧИХ ДНЕЙ; \rОТСУТСТВИЕ ЕЖЕМЕСЯЧНОЙ ПЛАТЫ ЗА ВЕДЕНИЕ ССУДНОГО СЧЕТА;\rОТСУТСТВИЕ ТРЕБОВАНИЙ ПО ПРЕДОСТАВЛЕНИЮ БИЗНЕС-ПЛАНА;\rПРИНИМАЕТСЯ К РАССМОТРЕНИЮ УПРАВЛЕНЧЕСКАЯ ОТЧЕТНОСТЬ;\rВ КАЧЕСТВЕ ЗАЛОГА РАССМАТРИВАЮТСЯ ТОВАРЫ В ОБОРОТЕ, АВТОТРАНСПОРТ, ОБОРУДОВАНИЕ, НЕДВИЖИМОСТЬ И ДРУГОЕ ЛИКВИДНОЕ ИМУЩЕСТВО; \rГИБКИЕ УСЛОВИЯ ПОГАШЕНИЯ КРЕДИТА. \rДЛЯ ПОЛУЧЕНИЯ КРЕДИТА:\rПОЗВОНИТЕ НАМ ПО ТЕЛЕФОНУ +7 (495) 757-57-57, ОБРАТИТЕСЬ В БЛИЖАЙШЕЕ К ВАМ ОТДЕЛЕНИЕ БАНКА ИЛИ ЗАПОЛНИТЕ ON-LINE ЗАЯВКУ. \rНАШИ СПЕЦИАЛИСТЫ ПОМОГУТ ВАМ ВЫБРАТЬ УДОБНЫЕ УСЛОВИЯ КРЕДИТОВАНИЯ И ОТВЕТЯТ НА ИНТЕРЕСУЮЩИЕ ВАС ВОПРОСЫ.\rПОДГОТОВЬТЕ НЕОБХОДИМЫЕ ДЛЯ РАССМОТРЕНИЯ КРЕДИТНОЙ ЗАЯВКИ ДОКУМЕНТЫ И ДОГОВОРИТЕСЬ О ВСТРЕЧЕ С КРЕДИТНЫМ ЭКСПЕРТОМ БАНКА.\rПОКАЖИТЕ КРЕДИТНОМУ ЭКСПЕРТУ ВАШЕ ПРЕДПРИЯТИЕ И ИМУЩЕСТВО, ПРЕДЛАГАЕМОЕ В ЗАЛОГ.\rПОЛУЧИТЕ КРЕДИТ НА РАЗВИТИЕ ВАШЕГО БИЗНЕСА! \nПРОГРАММЫ КРЕДИТОВАНИЯ МАЛОГО И СРЕДНЕГО БИЗНЕСА:\rПРОГРАММА\nСУММА КРЕДИТА\nПРОЦЕНТНАЯ СТАВКА\nСРОК КРЕДИТА\n«ОВЕРДРАФТ»\rОТ 300 000\nДО 5 000 000 РУБЛЕЙ\nОТ 18% ГОДОВЫХ\nДО 12 МЕСЯЦЕВ\n«МИНИКРЕДИТ»\rОТ 150 000\nДО 1 000 000 РУБЛЕЙ\nОТ 24% ГОДОВЫХ\nДО 36 МЕСЯЦЕВ\n«РАЗВИТИЕ»\nОТ 1 000 000\nДО 15 000 000 РУБЛЕЙ\nОТ 17% ГОДОВЫХ\nДО 36 МЕСЯЦЕВ\n«ИНВЕСТ»\nОТ 1 000 000\nДО 30 000 000 РУБЛЕЙ\nОТ 15% ГОДОВЫХ\nДО 72 МЕСЯЦЕВ\r\n'),
(27, '3e30b6e27a290bc4818f2de6a938fdf3', 'ДЕПОЗИТЫ\r\nНАШ БАНК ПРЕДЛАГАЕТ ВАМ ЭФФЕКТИВНО РАЗМЕСТИТЬ СВОБОДНЫЕ ДЕНЬГИ НА БАНКОВСКОМ ДЕПОЗИТЕ И ПОЛУЧИТЬ ДОПОЛНИТЕЛЬНУЮ ПРИБЫЛЬ.\rДЕПОЗИТНЫЕ ПРОДУКТЫ\r \rДОСРОЧНОЕ РАСТОРЖЕНИЕ\rПОПОЛНЕНИЕ\rЧАСТИЧНОЕ ИЗЪЯТИЕ\rВЫПЛАТА ПРОЦЕНТОВ\rДЕПОЗИТ С ВЫПЛАТОЙ ПРОЦЕНТОВ В КОНЦЕ СРОКА\rНЕ ПРЕДУСМОТРЕНО.\rНЕ ПРЕДУСМОТРЕНО.\rНЕ ПРЕДУСМОТРЕНО.\rВ КОНЦЕ СРОКА.\rДЕПОЗИТ С ВЫПЛАТОЙ ПРОЦЕНТОВ ЕЖЕМЕСЯЧНО\rНЕ ПРЕДУСМОТРЕНО.\rНЕ ПРЕДУСМОТРЕНО.\rНЕ ПРЕДУСМОТРЕНО.\rЕЖЕМЕСЯЧНО.\rДЕПОЗИТ С ВОЗМОЖНОСТЬЮ ПОПОЛНЕНИЯ\rНЕ ПРЕДУСМОТРЕНО.\rПРЕКРАЩАЕТСЯ ЗА 2 МЕСЯЦА ДО ОКОНЧАНИЯ СРОКА ДЕЙСТВИЯ ДЕПОЗИТА. \rНЕ ПРЕДУСМОТРЕНО \rВ КОНЦЕ СРОКА. \rДЕПОЗИТ С ВОЗМОЖНОСТЬЮ ПОПОЛНЕНИЯ И ИЗЪЯТИЯ\rНЕ ПРЕДУСМОТРЕНО.\rПРЕКРАЩАЕТСЯ ЗА 2 МЕСЯЦА ДО ОКОНЧАНИЯ СРОКА ДЕЙСТВИЯ ДЕПОЗИТА.\rНЕ БОЛЕЕ 40% ОТ ПЕРВОНАЧАЛЬНОЙ СУММЫ ВКЛАДА ЗА ВЕСЬ СРОК ДЕПОЗИТА \rВ КОНЦЕ СРОКА. \rДЕПОЗИТ С ВОЗМОЖНОСТЬЮ ДОСРОЧНОГО РАСТОРЖЕНИЯ \rВОЗМОЖНО ПРИ РАЗМЕЩЕНИИ НА 12 МЕСЯЦЕВ, НО НЕ РАНЕЕ ЧЕМ ЧЕРЕЗ 6 МЕСЯЦЕВ.\rНЕ ПРЕДУСМОТРЕНО.\rНЕ ПРЕДУСМОТРЕНО. \rВ КОНЦЕ СРОКА.\r\n'),
(28, 'dc76e079e3571df6ebba5ee1fd4ce0cd', 'МАЛОМУ И СРЕДНЕМУ БИЗНЕСУ\r\nРАБОТА С ПРЕДПРИЯТИЯМИ МАЛОГО И СРЕДНЕГО БИЗНЕСА - ОДНО ИЗ СТРАТЕГИЧЕСКИ ВАЖНЫХ НАПРАВЛЕНИЙ ДЕЯТЕЛЬНОСТИ БАНКА. НАШ БАНК ПРЕДСТАВЛЯЕТ СОВРЕМЕННЫЕ ПРОГРАММЫ ОБСЛУЖИВАНИЯ МАЛОГО И СРЕДНЕГО БИЗНЕСА, ОБЕСПЕЧИВАЕТ ОПТИМАЛЬНЫЕ И ВЗАИМОВЫГОДНЫЕ ВАРИАНТЫ СОТРУДНИЧЕСТВА, В ОСНОВЕ КОТОРЫХ ЛЕЖИТ ПРОФЕССИОНАЛИЗМ СОТРУДНИКОВ И ВЫСОКОЕ КАЧЕСТВО БАНКОВСКИХ УСЛУГ. УСЛУГИ НАШЕГО БАНКА ОТЛИЧАЮТСЯ ОПЕРАТИВНОСТЬЮ И НАДЕЖНОСТЬЮ, ТАК КАК ОРИЕНТИРОВАНЫ НА ДЕЛОВЫХ ЛЮДЕЙ - НА ТЕХ, КТО ЦЕНИТ СВОЕ ВРЕМЯ И ДЕНЬГИ.\rБАНК ПРЕДЛАГАЕТ СЛЕДУЮЩИЕ ВИДЫ УСЛУГ ДЛЯ ПРЕДПРИЯТИЙ МАЛОГО И СРЕДНЕГО БИЗНЕСА:\rКРЕДИТОВАНИЕ\rЛИЗИНГ\rДЕПОЗИТЫ\rПЛАСТИКОВЫЕ КАРТЫ\r\n'),
(29, 'da1f66499efacd659dcf24c5c7f6fcb2', 'ЛИЗИНГ\r\nНАШ БАНК ОКАЗЫВАЕТ ВЕСЬ СПЕКТР УСЛУГ ПО ФИНАНСОВОЙ АРЕНДЕ (ЛИЗИНГУ) ОТЕЧЕСТВЕННОГО И ИМПОРТНОГО ОБОРУДОВАНИЯ, ТРАНСПОРТА И НЕДВИЖИМОСТИ.\rЛИЗИНГ ОБОРУДОВАНИЯ И ТРАНСПОРТА\rОСНОВНЫЕ УСЛОВИЯ:\rСРОК ФИНАНСИРОВАНИЯ:\nОБОРУДОВАНИЕ И ТРАНСПОРТ - ДО 5 ЛЕТ\rЖ/Д ПОДВИЖНОЙ СОСТАВ - ДО 10 ЛЕТ\rВАЛЮТА ФИНАНСИРОВАНИЯ: РУБЛИ, ДОЛЛАРЫ США, ЕВРО\rМИНИМАЛЬНАЯ СУММА ФИНАНСИРОВАНИЯ: ОТ 4,5 МЛН.РУБ.\rАВАНС: ОТ 0%\rУДОРОЖАНИЕ: ОТ 9%\rСРОК ПРИНЯТИЯ РЕШЕНИЯ: ОТ 14 ДНЕЙ\rФИНАНСИРОВАНИЕ ИМПОРТНЫХ ПОСТАВОК\rМЫ ПРЕДОСТАВЛЯЕМ ПРЕДПРИЯТИЯМ ДОСТУП К ЛЬГОТНОМУ ФИНАНСИРОВАНИЮ ИМПОРТНЫХ ПОСТАВОК ОБОРУДОВАНИЯ И ТРАНСПОРТА С ИСПОЛЬЗОВАНИЕМ МЕХАНИЗМА ЛИЗИНГА ПРИ УЧАСТИИ ЭКСПОРТНЫХ КРЕДИТНЫХ АГЕНТСТВ.\rОСНОВНЫЕ УСЛОВИЯ:\rСРОК ФИНАНСИРОВАНИЯ: ДО 7 ЛЕТ\rВАЛЮТА ФИНАНСИРОВАНИЯ: РУБЛИ, ДОЛЛАРЫ США, ЕВРО\rМИНИМАЛЬНАЯ СУММА ФИНАНСИРОВАНИЯ: ОТ 15 МЛН.РУБ. \rАВАНС: ОТ 15% (БЕЗ УЧЕТА ТАМОЖЕННЫХ ПОШЛИН) \rУДОРОЖАНИЕ: ОТ 5%\rСРОК ПРИНЯТИЯ РЕШЕНИЯ: ОТ 14 ДНЕЙ\rЛИЗИНГ КОММЕРЧЕСКОЙ НЕДВИЖИМОСТИ\rПОЗВОЛЯЕТ ПРЕДПРИЯТИЯМ ПРИОБРЕСТИ ОБЪЕКТЫ КОММЕРЧЕСКОЙ НЕДВИЖИМОСТИ БЕЗ ЕДИНОВРЕМЕННОГО ОТВЛЕЧЕНИЯ ЗНАЧИТЕЛЬНЫХ СРЕДСТВ.\rВ КАЧЕСТВЕ ПРЕДМЕТА ЛИЗИНГА МОГУТ ВЫСТУПАТЬ:\rОФИСНЫЕ ЗДАНИЯ;\rТОРГОВЫЕ, СКЛАДСКИЕ И ПРОИЗВОДСТВЕННЫЕ ПОМЕЩЕНИЯ;\rДРУГИЕ ОБЪЕКТЫ КОММЕРЧЕСКОЙ НЕДВИЖИМОСТИ.\rОСНОВНЫЕ УСЛОВИЯ:\rСРОК ФИНАНСИРОВАНИЯ: ОТ 5 ЛЕТ\rВАЛЮТА ФИНАНСИРОВАНИЯ: РУБЛИ, ДОЛЛАРЫ США, ЕВРО\rМИНИМАЛЬНАЯ СУММА ФИНАНСИРОВАНИЯ: ОТ 50 МЛН.РУБ.* \rАВАНС: ОТ 0%\rУДОРОЖАНИЕ: ОТ 7%\rСРОК ПРИНЯТИЯ РЕШЕНИЯ: ОТ 14 ДНЕЙ\r* РАЗМЕР СУММЫ ФИНАНСИРОВАНИЯ ЗАВИСИТ ОТ РЕГИОНА, В КОТОРОМ НАХОДИТСЯ ОБЪЕКТ НЕДВИЖИМОСТИ.\rОСНОВНЫМ ТРЕБОВАНИЕМ, ПРЕДЪЯВЛЯЕМЫМ НАШИМ БАНКОМ ДЛЯ РАССМОТРЕНИЯ ЗАЯВКИ НА ЛИЗИНГ КОММЕРЧЕСКОЙ НЕДВИЖИМОСТИ, ЯВЛЯЕТСЯ НАЛИЧИЕ ПОЛНОГО КОМПЛЕКТА ПРАВОУСТАНАВЛИВАЮЩИХ ДОКУМЕНТОВ НА НЕДВИЖИМОСТЬ И НАЛИЧИЕ ОТЧЕТА НЕЗАВИСИМОГО ОЦЕНЩИКА.\r\n'),
(30, 'f38b1d21b4e881774aab9ca0e121ef4d', 'НОВОСТИ БАНКА\r\n\r\n'),
(31, '9dfab91b86ab4a11b04df5f40578198c', 'БАНК ПЕРЕНОСИТ ДАТУ ВСТУПЛЕНИЯ В ДЕЙСТВИЕ ТАРИФОВ НА УСЛУГИ В ИНОСТРАННОЙ ВАЛЮТЕ\r\nУВАЖАЕМЫЕ КЛИЕНТЫ,\rСООБЩАЕМ ВАМ, ЧТО БАНК ПЕРЕНОСИТ ДАТУ ВСТУПЛЕНИЯ В ДЕЙСТВИЕ ТАРИФОВ НА УСЛУГИ ДЛЯ ЮРИДИЧЕСКИХ ЛИЦ И ИНДИВИДУАЛЬНЫХ ПРЕДПРИНИМАТЕЛЕЙ В ИНОСТРАННОЙ ВАЛЮТЕ. В СВЯЗИ С ЭТИМ ДО ДАТЫ ВВЕДЕНИЯ В ДЕЙСТВИЕ НОВОЙ РЕДАКЦИИ ТАРИФОВ, УСЛУГИ ЮРИДИЧЕСКИМ ЛИЦАМ И ИНДИВИДУАЛЬНЫМ ПРЕДПРИНИМАТЕЛЯМ БУДУТ ОКАЗЫВАТЬСЯ В РАМКАХ ДЕЙСТВУЮЩИХ ТАРИФОВ. \rИНФОРМАЦИЯ О ДАТЕ ВВЕДЕНИЯ НОВОЙ РЕДАКЦИИ ТАРИФОВ БУДЕТ СООБЩЕНА ДОПОЛНИТЕЛЬНО.\r\nУВАЖАЕМЫЕ КЛИЕНТЫ,\rСООБЩАЕМ ВАМ, ЧТО БАНК ПЕРЕНОСИТ ДАТУ ВСТУПЛЕНИЯ В ДЕЙСТВИЕ ТАРИФОВ НА УСЛУГИ ДЛЯ ЮРИДИЧЕСКИХ ЛИЦ И ИНДИВИДУАЛЬНЫХ ПРЕДПРИНИМАТЕЛЕЙ В ИНОСТРАННОЙ ВАЛЮТЕ. В СВЯЗИ С ЭТИМ ДО ДАТЫ ВВЕДЕНИЯ В ДЕЙСТВИЕ НОВОЙ РЕДАКЦИИ ТАРИФОВ, УСЛУГИ ЮРИДИЧЕСКИМ ЛИЦАМ И ИНДИВИДУАЛЬНЫМ ПРЕДПРИНИМАТЕЛЯМ БУДУТ ОКАЗЫВАТЬСЯ В РАМКАХ ДЕЙСТВУЮЩИХ ТАРИФОВ. \rИНФОРМАЦИЯ О ДАТЕ ВВЕДЕНИЯ НОВОЙ РЕДАКЦИИ ТАРИФОВ БУДЕТ СООБЩЕНА ДОПОЛНИТЕЛЬНО.\r\n'),
(32, '437ea50fe03f56e33342d948ce95e9f8', 'НАЧАТЬ РАБОТАТЬ С СИСТЕМОЙ «ИНТЕРНЕТ-КЛИЕНТ» СТАЛО ЕЩЕ ПРОЩЕ\r\nНАШ БАНК ПРЕДЛАГАЕТ СВОИМ КЛИЕНТАМ МАСТЕР УСТАНОВКИ «ИНТЕРНЕТ-КЛИЕНТ», КОТОРЫЙ СУЩЕСТВЕННО УПРОСТИТ НАЧАЛО РАБОТЫ С СИСТЕМОЙ. ТЕПЕРЬ ДОСТАТОЧНО СКАЧАТЬ И ЗАПУСТИТЬ МАСТЕР УСТАНОВКИ, И ВСЕ НАСТРОЙКИ БУДУТ ПРОИЗВЕДЕНЫ АВТОМАТИЧЕСКИ. ВАМ БОЛЬШЕ НЕ НУЖНО ТРАТИТЬ ВРЕМЯ НА ИЗУЧЕНИЕ ОБЪЕМНЫХ ИНСТРУКЦИЙ, ИЛИ ЗВОНИТЬ В СЛУЖБУ ТЕХПОДДЕРЖКИ, ЧТОБЫ НАЧАТЬ РАБОТАТЬ С СИСТЕМОЙ.\r\nНАШ БАНК ПРЕДЛАГАЕТ СВОИМ КЛИЕНТАМ МАСТЕР УСТАНОВКИ «ИНТЕРНЕТ-КЛИЕНТ», КОТОРЫЙ СУЩЕСТВЕННО УПРОСТИТ НАЧАЛО РАБОТЫ С СИСТЕМОЙ. ТЕПЕРЬ ДОСТАТОЧНО СКАЧАТЬ И ЗАПУСТИТЬ МАСТЕР УСТАНОВКИ, И ВСЕ НАСТРОЙКИ БУДУТ ПРОИЗВЕДЕНЫ АВТОМАТИЧЕСКИ. ВАМ БОЛЬШЕ НЕ НУЖНО ТРАТИТЬ ВРЕМЯ НА ИЗУЧЕНИЕ ОБЪЕМНЫХ ИНСТРУКЦИЙ, ИЛИ ЗВОНИТЬ В СЛУЖБУ ТЕХПОДДЕРЖКИ, ЧТОБЫ НАЧАТЬ РАБОТАТЬ С СИСТЕМОЙ.\r\n'),
(33, 'e9a9009de370e84b759e3b542f854458', 'РЕОРГАНИЗАЦИЯ СЕТИ ОТДЕЛЕНИЙ БАНКА\r\nВ БЛИЖАЙШЕЕ ВРЕМЯ БУДЕТ ЗНАЧИТЕЛЬНО РАСШИРЕН ПРОДУКТОВЫЙ РЯД И ПЕРЕЧЕНЬ ПРЕДОСТАВЛЯЕМЫХ БАНКОВСКИХ УСЛУГ, КОТОРЫЕ БАНК СМОЖЕТ ПРЕДЛАГАТЬ ВО ВСЕХ СВОИХ ДОПОЛНИТЕЛЬНЫХ ОФИСАХ. ТЕПЕРЬ НАШИ КЛИЕНТЫ СМОГУТ ПОЛУЧИТЬ ПОЛНЫЙ ПЕРЕЧЕНЬ УСЛУГ В ЛЮБОМ ИЗ ОТДЕЛЕНИЙ БАНКА. \rБЫЛО ПРОВЕДЕНО КОМПЛЕКСНОЕ ВСЕСТОРОННЕЕ ИССЛЕДОВАНИЕ ФУНКЦИОНИРОВАНИЯ РЕГИОНАЛЬНЫХ ОФИСОВ НА ПРЕДМЕТ СООТВЕТСТВИЯ ВОЗРОСШИМ ТРЕБОВАНИЯМ. В РЕЗУЛЬТАТЕ, ПРИНЯТО РЕШЕНИЕ О ВРЕМЕННОМ ЗАКРЫТИИ ОФИСОВ, НЕ СООТВЕТСТВУЮЩИХ ВЫСОКИМ СТАНДАРТАМ И НЕ ПРИСПОСОБЛЕННЫХ К ТРЕБОВАНИЯМ РАСТУЩЕГО БИЗНЕСА. ОФИСЫ ПОСТЕПЕННО БУДУТ ОТРЕМОНТИРОВАНЫ И ПЕРЕОБОРУДОВАНЫ, СТАНУТ СОВРЕМЕННЫМИ И УДОБНЫМИ. \rПРИНОСИМ СВОИ ИЗВИНЕНИЯ ЗА ВРЕМЕННО ДОСТАВЛЕННЫЕ НЕУДОБСТВА. \r\nВ БЛИЖАЙШЕЕ ВРЕМЯ БУДЕТ ЗНАЧИТЕЛЬНО РАСШИРЕН ПРОДУКТОВЫЙ РЯД И ПЕРЕЧЕНЬ ПРЕДОСТАВЛЯЕМЫХ БАНКОВСКИХ УСЛУГ, КОТОРЫЕ БАНК СМОЖЕТ ПРЕДЛАГАТЬ ВО ВСЕХ СВОИХ ДОПОЛНИТЕЛЬНЫХ ОФИСАХ. ТЕПЕРЬ НАШИ КЛИЕНТЫ СМОГУТ ПОЛУЧИТЬ ПОЛНЫЙ ПЕРЕЧЕНЬ УСЛУГ В ЛЮБОМ ИЗ ОТДЕЛЕНИЙ БАНКА. \rБЫЛО ПРОВЕДЕНО КОМПЛЕКСНОЕ ВСЕСТОРОННЕЕ ИССЛЕДОВАНИЕ ФУНКЦИОНИРОВАНИЯ РЕГИОНАЛЬНЫХ ОФИСОВ НА ПРЕДМЕТ СООТВЕТСТВИЯ ВОЗРОСШИМ ТРЕБОВАНИЯМ. В РЕЗУЛЬТАТЕ, ПРИНЯТО РЕШЕНИЕ О ВРЕМЕННОМ ЗАКРЫТИИ ОФИСОВ, НЕ СООТВЕТСТВУЮЩИХ ВЫСОКИМ СТАНДАРТАМ И НЕ ПРИСПОСОБЛЕННЫХ К ТРЕБОВАНИЯМ РАСТУЩЕГО БИЗНЕСА. ОФИСЫ ПОСТЕПЕННО БУДУТ ОТРЕМОНТИРОВАНЫ И ПЕРЕОБОРУДОВАНЫ, СТАНУТ СОВРЕМЕННЫМИ И УДОБНЫМИ. \rПРИНОСИМ СВОИ ИЗВИНЕНИЯ ЗА ВРЕМЕННО ДОСТАВЛЕННЫЕ НЕУДОБСТВА.\r\n'),
(34, 'a0b07dac40b2192e3759747f41ea1edc', 'ГЛАВНЫЙ СПЕЦИАЛИСТ ОТДЕЛА АНАЛИЗА КРЕДИТНЫХ ПРОЕКТОВ РЕГИОНАЛЬНОЙ СЕТИ\r\nТРЕБОВАНИЯ\rВЫСШЕЕ ЭКОНОМИЧЕСКОЕ/ФИНАНСОВОЕ ОБРАЗОВАНИЕ, ОПЫТ В БАНКАХ ТОП-100 НЕ МЕНЕЕ 3-Х ЛЕТ В КРЕДИТНОМ ОТДЕЛЕ (АНАЛИЗ ЗАЕМЩИКОВ), ЖЕЛАТЕЛЕН ОПЫТ РАБОТЫ С КРЕДИТНЫМИ ЗАЯВКАМИ ФИЛИАЛОВ, ЗНАНИЕ ТЕХНОЛОГИЙ АФХД ПРЕДПРИЯТИЙ, НАВЫКИ НАПИСАНИЯ ЭКСПЕРТНОГО ЗАКЛЮЧЕНИЯ, ЗНАНИЕ ЗАКОНОДАТЕЛЬСТВА (В Т.Ч. ПОЛОЖЕНИЕ ЦБ № 254-П).\rОБЯЗАННОСТИ\rАНАЛИЗ КРЕДИТНЫХ ПРОЕКТОВ ФИЛИАЛОВ БАНКА, ПОДГОТОВКА ПРЕДЛОЖЕНИЙ ПО СТРУКТУРИРОВАНИЮ КРЕДИТНЫХ ПРОЕКТОВ, ОЦЕНКА ПОЛНОТЫ И КАЧЕСТВА ФОРМИРУЕМЫХ ФИЛИАЛАМИ ЗАКЛЮЧЕНИЙ, ВЫЯВЛЕНИЕ СТОП-ФАКТОРОВ, ДОРАБОТКА ЗАЯВОК ФИЛИАЛОВ В СООТВЕТСТВИИ СО СТАНДАРТАМИ БАНКА, ПОДГОТОВКА ЗАКЛЮЧЕНИЯ (РЕКОМЕНДАЦИЙ) НА КК ПО ЗАЯВКАМ ФИЛИАЛОВ В ЧАСТИ ОЦЕНКИ ФИНАНСОВО-ЭКОНОМИЧЕСКОГО СОСТОЯНИЯ ЗАЕМЩИКА, ЗАЩИТА ПРОЕКТОВ НА КК БАНКА, КОНСУЛЬТИРОВАНИЕ И МЕТОДОЛОГИЧЕСКАЯ ПОМОЩЬ ФИЛИАЛАМ БАНКА В ЧАСТИ КОРПОРАТИВНОГО КРЕДИТОВАНИЯ.\rУСЛОВИЯ\rМЕСТО РАБОТЫ: М.ПАРК КУЛЬТУРЫ. ГРАФИКИ РАБОТЫ: ПЯТИДНЕВНАЯ РАБОЧАЯ НЕДЕЛЯ, С 9:00 ДО 18:00, ПТ. ДО 16:45. ЗАРПЛАТА: 50000 РУБ. ОКЛАД + ПРЕМИИ, ПОЛНЫЙ СОЦ. ПАКЕТ,ОФОРМЛЕНИЕ СОГЛАСНО ТК РФ\r\n'),
(35, 'c2f74d9d9478f621cc944462301f0298', 'СПЕЦИАЛИСТ ПО ПРОДАЖАМ РОЗНИЧНЫХ БАНКОВСКИХ ПРОДУКТОВ\r\nТРЕБОВАНИЯ\rВЫСШЕЕ ЭКОНОМИЧЕСКОГО ОБРАЗОВАНИЯ ‚ ОПЫТ РАБОТЫ В СФЕРЕ ПРОДАЖ БАНКОВСКИХ ПРОДУКТОВ‚ ОПЫТНЫЙ ПОЛЬЗОВАТЕЛЬ ПК‚ ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ‚ ОТВЕТСТВЕННОСТЬ‚ ИНИЦИАТИВНОСТЬ‚ АКТИВНОСТЬ.\rОБЯЗАННОСТИ\rПРОДАЖА РОЗНИЧНЫХ БАНКОВСКИХ ПРОДУКТОВ, ОФОРМЛЕНИЕ ДОКУМЕНТОВ.\rУСЛОВИЯ\rТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ. ГРАФИК РАБОТЫ: ПЯТИДНЕВНАЯ РАБОЧАЯ НЕДЕЛЯ. ЗАРПЛАТА: 20000 РУБ. ОКЛАД + ПРЕМИИ\r\n');
INSERT INTO `b_search_content_text` (`SEARCH_CONTENT_ID`, `SEARCH_CONTENT_MD5`, `SEARCHABLE_CONTENT`) VALUES
(36, 'f80f82e8603db0db02c1d3a241b0db0c', 'СПЕЦИАЛИСТ ОТДЕЛА АНДЕРРАЙТИНГА\r\nТРЕБОВАНИЯ\rВЫСШЕЕ ПРОФЕССИОНАЛЬНОЕ ОБРАЗОВАНИЕ, ОПЫТ РАБОТЫ ОТ 2 ЛЕТ В ОТДЕЛЕ ПО РАБОТЕ С ФИЗИЧЕСКИМИ И ЮРИДИЧЕСКИМИ ЛИЦАМИ БАНКОВ, СВЯЗАННЫХ С АНАЛИЗОМ ПЛАТЁЖЕСПОСОБНОСТИ И КРЕДИТОСПОСОБНОСТИ ФИЗИЧЕСКИХ И ЮРИДИЧЕСКИХ ЛИЦ.\rОБЯЗАННОСТИ\rПРОВЕРКА СООТВЕТСТВИЯ ДОКУМЕНТОВ, ПРЕДОСТАВЛЕННЫХ КЛИЕНТАМИ БАНКА, АНАЛИЗ ИНФОРМАЦИИ О РИСКЕ\rУСЛОВИЯ\rТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ. ГРАФИК РАБОТЫ: ПЯТИДНЕВНАЯ РАБОЧАЯ НЕДЕЛЯ. ЗАРПЛАТА: ОКЛАД 25000 РУБ.\r\n'),
(37, 'f38b1d21b4e881774aab9ca0e121ef4d', 'НОВОСТИ БАНКА\r\n\r\n'),
(38, 'a478156a7f37b19b29eb6ce86f38e6e3', 'БОЛЕЕ 7 ЛЕТ\r\nРАБОТАЕМ ОДНИМ СОСТАВОМ\r\n'),
(39, '1a7e54b3f8e7f128e78d67b00bdbd889', 'БЕСПЛАТНЫЙ ЗАМЕР\r\nВЫЕЗД В ДЕНЬ ОБРАЩЕНИЯ, ПРОИЗВОДИМ РАСЧЕТ СРАЗУ НА МЕСТЕ\r\n'),
(40, '9584def4e3467d813cdfeadb8fbe842b', 'БЕСПЛАТНО\r\nСЕРВИСНОЕ ОБСЛУЖИВАНИЕ ВСЕХ ВЫПОЛНЕННЫХ РАБОТ\r\n'),
(41, 'ff685e2cf29585bcd5724bb703a5f062', 'ВЫСОКОЕ КАЧЕСТВО\r\nМОНТАЖНЫХ РАБОТ\r\nИ ОБСЛУЖИВАНИЯ\r\n'),
(42, '899299f1e0adb6868d81c9f341f66f6a', 'ГОС. ЗАКАЗЧИКИ\r\nДОВОЛЬНЫ НАШЕЙ РАБОТОЙ\r\n'),
(43, '9c2ad89e4e069e667a1f2e86dcfab77d', 'МЕСТО\r\nГ. НОВОСИБИРСК,\r\nУЛ. ДЕРЖАВИНА Д. 49\r\n'),
(44, '6ec17f4b19ea4640ed999650a0ae4069', 'ВРЕМЯ\r\n10:00 - 20:00,\r\nБЕЗ ВЫХОДНЫХ\r\n'),
(45, '3f57b3a5e484389fa5619052cb6228a7', 'ТЕЛЕФОН\r\n8 (383) 000-00-00\r\n'),
(46, '807b7348469d1ff1f328e67268755b76', 'ПОЧТА\r\nAMPIR_NSK@MAIL.RU\r\n'),
(47, 'aedfe08f6133d12b63f32f3a665defa0', 'ГРАМОТА1\r\n\r\n'),
(48, 'fbe8a758cb7086ec4323f00c23d28b04', 'ГРАМОТА2\r\n\r\n'),
(49, '0232d2d61c7f9106fe889bf712ca5556', 'ГРАМОТА3\r\n\r\n'),
(53, '6a57c04f0bfdfb82c5fa2a98071fb5fc', 'БАНК ПЕРЕНОСИТ ДАТУ ВСТУПЛЕНИЯ В ДЕЙСТВИЕ ТАРИФОВ НА УСЛУГИ В ИНОСТРАННОЙ ВАЛЮТЕ\r\n\r\n'),
(54, '0fe17ef3b396b91cca15c11be8a12b62', 'НАЧАТЬ РАБОТАТЬ С СИСТЕМОЙ «ИНТЕРНЕТ-КЛИЕНТ» СТАЛО ЕЩЕ ПРОЩЕ\r\n\r\n'),
(55, 'fcb08892d8c71342b6487dc68d10cc29', 'РЕОРГАНИЗАЦИЯ СЕТИ ОТДЕЛЕНИЙ БАНКА\r\n\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_title`
--

CREATE TABLE `b_search_content_title` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_content_title`
--

INSERT INTO `b_search_content_title` (`SEARCH_CONTENT_ID`, `SITE_ID`, `POS`, `WORD`) VALUES
(1, 's1', 0, 'ИСТОРИЯ'),
(1, 's1', 8, 'КОМПАНИИ'),
(2, 's1', 0, 'ИНФОРМАЦИЯ'),
(2, 's1', 13, 'КОМПАНИИ'),
(2, 's1', 3, 'О'),
(3, 's1', 0, 'РУКОВОДСТВО'),
(4, 's1', 0, 'МИССИЯ'),
(5, 's1', 0, 'ВАКАНСИИ'),
(6, 's1', 0, 'АВТОРИЗАЦИЯ'),
(7, 's1', 7, 'ВОПРОС'),
(7, 's1', 0, 'ЗАДАТЬ'),
(8, 's1', 11, 'ИНФОРМАЦИЯ'),
(8, 's1', 0, 'КОНТАКТНАЯ'),
(9, 's1', 0, 'НАШИ'),
(9, 's1', 5, 'РЕКВИЗИТЫ'),
(10, 's1', 8, 'КОМПАНИИ'),
(10, 's1', 0, 'НОВОСТИ'),
(11, 's1', 0, 'ПОИСК'),
(12, 's1', 0, 'КАРТА'),
(12, 's1', 6, 'САЙТА'),
(13, 's1', 0, 'ИНТЕРНЕТ-БАНКИНГ'),
(14, 's1', 0, 'ИНКАССАЦИЯ'),
(15, 's1', 14, 'КЛИЕНТАМ'),
(15, 's1', 0, 'КОРПОРАТИВНЫМ'),
(16, 's1', 18, 'ОБСЛУЖИВАНИЕ'),
(16, 's1', 0, 'РАСЧЕТНО-КАССОВОЕ'),
(17, 's1', 0, 'ДЕПОЗИТАРНЫЕ'),
(17, 's1', 13, 'УСЛУГИ'),
(18, 's1', 0, 'ДОКУМЕНТАРНЫЕ'),
(18, 's1', 14, 'ОПЕРАЦИИ'),
(19, 's1', 11, 'ОРГАНИЗАЦИЯМ'),
(19, 's1', 0, 'ФИНАНСОВЫМ'),
(20, 's1', 10, 'МЕЖБАНКОВСКОМ'),
(20, 's1', 7, 'НА'),
(20, 's1', 24, 'РЫНКЕ'),
(20, 's1', 0, 'УСЛУГИ'),
(21, 's1', 0, 'БАНКОВСКИЕ'),
(21, 's1', 11, 'КАРТЫ'),
(22, 's1', 16, 'КРЕДИТ'),
(22, 's1', 0, 'ПОТРЕБИТЕЛЬСКИЙ'),
(23, 's1', 8, 'ЛИЦАМ'),
(23, 's1', 0, 'ЧАСТНЫМ'),
(24, 's1', 0, 'УСЛУГИ'),
(25, 's1', 12, 'КАРТЫ'),
(25, 's1', 0, 'ПЛАСТИКОВЫЕ'),
(26, 's1', 0, 'КРЕДИТОВАНИЕ'),
(27, 's1', 0, 'ДЕПОЗИТЫ'),
(28, 's1', 18, 'БИЗНЕСУ'),
(28, 's1', 7, 'И'),
(28, 's1', 0, 'МАЛОМУ'),
(28, 's1', 9, 'СРЕДНЕМУ'),
(29, 's1', 0, 'ЛИЗИНГ'),
(30, 's1', 8, 'БАНКА'),
(30, 's1', 0, 'НОВОСТИ'),
(31, 's1', 0, 'БАНК'),
(31, 's1', 20, 'В'),
(31, 's1', 74, 'ВАЛЮТЕ'),
(31, 's1', 20, 'ВСТУПЛЕНИЯ'),
(31, 's1', 15, 'ДАТУ'),
(31, 's1', 33, 'ДЕЙСТВИЕ'),
(31, 's1', 62, 'ИНОСТРАННОЙ'),
(31, 's1', 50, 'НА'),
(31, 's1', 5, 'ПЕРЕНОСИТ'),
(31, 's1', 42, 'ТАРИФОВ'),
(31, 's1', 53, 'УСЛУГИ'),
(32, 's1', 51, 'ЕЩЕ'),
(32, 's1', 28, 'ИНТЕРНЕТ-КЛИЕНТ'),
(32, 's1', 0, 'НАЧАТЬ'),
(32, 's1', 55, 'ПРОЩЕ'),
(32, 's1', 7, 'РАБОТАТЬ'),
(32, 's1', 16, 'С'),
(32, 's1', 18, 'СИСТЕМОЙ'),
(32, 's1', 45, 'СТАЛО'),
(33, 's1', 29, 'БАНКА'),
(33, 's1', 19, 'ОТДЕЛЕНИЙ'),
(33, 's1', 0, 'РЕОРГАНИЗАЦИЯ'),
(33, 's1', 14, 'СЕТИ'),
(34, 's1', 26, 'АНАЛИЗА'),
(34, 's1', 0, 'ГЛАВНЫЙ'),
(34, 's1', 34, 'КРЕДИТНЫХ'),
(34, 's1', 19, 'ОТДЕЛА'),
(34, 's1', 44, 'ПРОЕКТОВ'),
(34, 's1', 53, 'РЕГИОНАЛЬНОЙ'),
(34, 's1', 66, 'СЕТИ'),
(34, 's1', 8, 'СПЕЦИАЛИСТ'),
(35, 's1', 33, 'БАНКОВСКИХ'),
(35, 's1', 11, 'ПО'),
(35, 's1', 14, 'ПРОДАЖАМ'),
(35, 's1', 44, 'ПРОДУКТОВ'),
(35, 's1', 23, 'РОЗНИЧНЫХ'),
(35, 's1', 0, 'СПЕЦИАЛИСТ'),
(36, 's1', 18, 'АНДЕРРАЙТИНГА'),
(36, 's1', 11, 'ОТДЕЛА'),
(36, 's1', 0, 'СПЕЦИАЛИСТ'),
(37, 's1', 8, 'БАНКА'),
(37, 's1', 0, 'НОВОСТИ'),
(38, 's1', 6, '7'),
(38, 's1', 0, 'БОЛЕЕ'),
(38, 's1', 8, 'ЛЕТ'),
(39, 's1', 0, 'БЕСПЛАТНЫЙ'),
(39, 's1', 11, 'ЗАМЕР'),
(40, 's1', 0, 'БЕСПЛАТНО'),
(41, 's1', 0, 'ВЫСОКОЕ'),
(41, 's1', 8, 'КАЧЕСТВО'),
(42, 's1', 0, 'ГОС'),
(42, 's1', 5, 'ЗАКАЗЧИКИ'),
(43, 's1', 0, 'МЕСТО'),
(44, 's1', 0, 'ВРЕМЯ'),
(45, 's1', 0, 'ТЕЛЕФОН'),
(46, 's1', 0, 'ПОЧТА'),
(47, 's1', 0, 'ГРАМОТА1'),
(48, 's1', 0, 'ГРАМОТА2'),
(49, 's1', 0, 'ГРАМОТА3'),
(53, 's1', 0, 'БАНК'),
(53, 's1', 20, 'В'),
(53, 's1', 74, 'ВАЛЮТЕ'),
(53, 's1', 20, 'ВСТУПЛЕНИЯ'),
(53, 's1', 15, 'ДАТУ'),
(53, 's1', 33, 'ДЕЙСТВИЕ'),
(53, 's1', 62, 'ИНОСТРАННОЙ'),
(53, 's1', 50, 'НА'),
(53, 's1', 5, 'ПЕРЕНОСИТ'),
(53, 's1', 42, 'ТАРИФОВ'),
(53, 's1', 53, 'УСЛУГИ'),
(54, 's1', 51, 'ЕЩЕ'),
(54, 's1', 28, 'ИНТЕРНЕТ-КЛИЕНТ'),
(54, 's1', 0, 'НАЧАТЬ'),
(54, 's1', 55, 'ПРОЩЕ'),
(54, 's1', 7, 'РАБОТАТЬ'),
(54, 's1', 16, 'С'),
(54, 's1', 18, 'СИСТЕМОЙ'),
(54, 's1', 45, 'СТАЛО'),
(55, 's1', 29, 'БАНКА'),
(55, 's1', 19, 'ОТДЕЛЕНИЙ'),
(55, 's1', 0, 'РЕОРГАНИЗАЦИЯ'),
(55, 's1', 14, 'СЕТИ');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_custom_rank`
--

CREATE TABLE `b_search_custom_rank` (
  `ID` int NOT NULL,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_phrase`
--

CREATE TABLE `b_search_phrase` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int NOT NULL,
  `PAGES` int NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_stem`
--

CREATE TABLE `b_search_stem` (
  `ID` int NOT NULL,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_stem`
--

INSERT INTO `b_search_stem` (`ID`, `STEM`) VALUES
(763, '-0'),
(787, '00'),
(112, '000'),
(1479, '000-00-00'),
(1160, '001'),
(614, '044591488'),
(775, '05'),
(624, '0575249000'),
(849, '09'),
(1137, '1-6-ГО'),
(772, '10'),
(626, '115035'),
(616, '11806935'),
(1140, '12'),
(756, '120'),
(1064, '13'),
(1181, '14'),
(761, '140'),
(1077, '147'),
(167, '149'),
(607, '15'),
(903, '150'),
(596, '152073950937987'),
(850, '16'),
(764, '160'),
(905, '1600'),
(1329, '17'),
(604, '175089'),
(5, '18'),
(767, '180'),
(416, '1985'),
(370, '1986'),
(364, '1988'),
(340, '1991'),
(7, '1993'),
(9, '1996'),
(24, '1997'),
(48, '1998'),
(66, '1999'),
(790, '1О'),
(1307, '2-Х'),
(178, '20'),
(114, '200'),
(346, '2000'),
(1462, '20000'),
(406, '2002'),
(84, '2004'),
(78, '2004ГОД'),
(102, '2006'),
(121, '2007'),
(135, '2008'),
(151, '2009'),
(159, '2010'),
(1141, '21'),
(579, '212-85-06'),
(580, '212-85-07'),
(581, '212-85-08'),
(786, '22'),
(770, '220'),
(1195, '23'),
(1142, '24'),
(181, '240'),
(629, '240-38-12'),
(766, '25'),
(758, '2500'),
(1466, '25000'),
(1430, '254-П'),
(776, '260'),
(1214, '2НДФЛ'),
(1264, '3-5'),
(1420, '3-Х'),
(1055, '30'),
(919, '300'),
(610, '30102810000000000569'),
(186, '31'),
(760, '35'),
(806, '350'),
(762, '3500'),
(1170, '36'),
(1062, '365'),
(1478, '383'),
(251, '4-М'),
(1343, '40'),
(904, '400'),
(180, '415'),
(755, '45'),
(765, '4500'),
(1477, '49'),
(232, '490'),
(578, '495'),
(779, '5-10'),
(246, '5-М'),
(111, '50'),
(911, '500'),
(768, '5000'),
(1451, '50000'),
(185, '522'),
(184, '535'),
(1200, '55'),
(921, '580'),
(1139, '6-ГО'),
(1198, '60'),
(1124, '600'),
(769, '6000'),
(204, '650'),
(241, '7-Е'),
(234, '70'),
(771, '7000'),
(1331, '72'),
(1151, '75'),
(1319, '757-57-57'),
(620, '775021017'),
(612, '7860249880'),
(1221, '800'),
(773, '8000'),
(1222, '808'),
(929, '870'),
(1159, '90'),
(777, '9000'),
(1061, '91'),
(598, '911156'),
(166, '95'),
(628, '960-10-12'),
(1070, '978-78-78'),
(618, '98122'),
(1480, 'AMPIR_NSK'),
(593, 'BANK'),
(602, 'BITEX'),
(1289, 'CКИДК'),
(529, 'CТРАН'),
(630, 'E-MAIL'),
(722, 'ENVIRONMENT'),
(718, 'EXPLORER'),
(1252, 'GOLD'),
(156, 'IBANK'),
(600, 'IISARUMM'),
(1256, 'INFINITE'),
(351, 'INSEAD'),
(82, 'INTERNATIONAL'),
(717, 'INTERNET'),
(599, 'IRS'),
(720, 'JAVA'),
(723, 'JRE'),
(632, 'MAIL'),
(1248, 'MASTERCARD'),
(349, 'MBA'),
(591, 'NAME'),
(592, 'OF'),
(677, 'ON-LINE'),
(1253, 'PLATINUM'),
(721, 'RUNTIME'),
(633, 'RUSBANK'),
(631, 'RUSBK'),
(1172, 'SMS'),
(601, 'SPRINT'),
(157, 'SYSTEM'),
(597, 'TELEX'),
(590, 'THE'),
(429, 'UAMS'),
(724, 'VERSION'),
(81, 'VISA'),
(713, 'WINDOWS'),
(705, 'АБОНЕНТСК'),
(1350, 'АВАНС'),
(967, 'АВАНСОВ'),
(1084, 'АВИЗ'),
(980, 'АВИЗОВАН'),
(267, 'АВТОКРЕДИТОВАН'),
(154, 'АВТОМАТИЗИРОВА'),
(1391, 'АВТОМАТИЧЕСК'),
(97, 'АВТОМОБИЛ'),
(532, 'АВТОРИЗАЦ'),
(534, 'АВТОРИЗОВА'),
(1313, 'АВТОТРАНСПОРТ'),
(890, 'АГЕНТ'),
(1354, 'АГЕНТСТВ'),
(535, 'АДМИНИСТРАТИВН'),
(874, 'АДР'),
(603, 'АДРЕС'),
(483, 'АДРЕСН'),
(143, 'АКАДЕМ'),
(995, 'АККРЕДИТ'),
(993, 'АККРЕДИТИВ'),
(1012, 'АККРЕДИТИВН'),
(994, 'АККРЕДИТИВОВ'),
(244, 'АКТ'),
(243, 'АКТИВ'),
(20, 'АКТИВН'),
(242, 'АКТИВОВ'),
(689, 'АКТУАЛЬН'),
(868, 'АКЦ'),
(585, 'АКЦИОНЕРН'),
(397, 'АЛЕКСАНДРОВИЧ'),
(1089, 'АМЕРИКАНСК'),
(57, 'АНАЛИЗ'),
(402, 'АНАТОЛ'),
(588, 'АНГЛИЙСК'),
(1463, 'АНДЕРРАЙТИНГ'),
(422, 'АНДР'),
(908, 'АНКЕТ'),
(428, 'АНТВЕРП'),
(274, 'АРЕНД'),
(145, 'АССОЦИАЦ'),
(1424, 'АФХД'),
(1174, 'БАЛАНС'),
(950, 'БАЛТ'),
(627, 'БАЛЧУГ'),
(3, 'БАНК'),
(1080, 'БАНК-КОНТРАГЕНТ'),
(998, 'БАНК-ЭМИТЕНТ'),
(1003, 'БАНКА-ЭМИТЕНТ'),
(1078, 'БАНКАМ-КОНТРАГЕНТ'),
(1008, 'БАНКАМИ-КОРРЕСПОНДЕНТ'),
(1087, 'БАНКНОТ'),
(1085, 'БАНКНОТН'),
(288, 'БАНКОВ'),
(1046, 'БАНКОВ-КОНТРАГЕНТ'),
(1045, 'БАНКОВ-КОНТРАГЕНТОВ'),
(957, 'БАНКОВ-КОРРЕСПОНДЕНТ'),
(956, 'БАНКОВ-КОРРЕСПОНДЕНТОВ'),
(1145, 'БАНКОВ-ПАРТНЕР'),
(1144, 'БАНКОВ-ПАРТНЕРОВ'),
(155, 'БАНКОВСК'),
(1094, 'БАНКОМ-ЭМИТЕНТ'),
(804, 'БАНКОМАТ'),
(803, 'БАНКОМАТОВ'),
(918, 'БЕЗДОКУМЕНТАРН'),
(1086, 'БЕЗНАЛИЧН'),
(639, 'БЕЗОПАСН'),
(1006, 'БЕЗОТЗЫВН'),
(942, 'БЕЗУСЛОВН'),
(983, 'БЕНЕФИЦИАР'),
(982, 'БЕНЕФИЦИАРОВ'),
(704, 'БЕСПЛАТН'),
(133, 'БИЗНЕС'),
(1309, 'БИЗНЕС-ПЛА'),
(350, 'БИЗНЕС-ШКОЛ'),
(613, 'БИК'),
(528, 'БЛАГ'),
(510, 'БЛАГОСОСТОЯН'),
(519, 'БЛАГОТВОРИТЕЛЬН'),
(1320, 'БЛИЖАЙШ'),
(951, 'БЛИЖН'),
(924, 'БЛОКИРОВК'),
(110, 'БОЛ'),
(187, 'БОЛЬШ'),
(826, 'БОЛЬШИНСТВ'),
(1290, 'БОНУСН'),
(1257, 'БРИЛЛИАНТ'),
(913, 'БРОКЕРСК'),
(573, 'БУД'),
(1196, 'БУДЕТ'),
(1377, 'БУДУТ'),
(55, 'БУМАГ'),
(897, 'БУМАЖН'),
(415, 'БУХГАЛТЕР'),
(58, 'БУХГАЛТЕРСК'),
(1090, 'БЫВШ'),
(539, 'БЫСТР'),
(362, 'ВАД'),
(1016, 'ВАЖН'),
(531, 'ВАКАНС'),
(675, 'ВАЛЮТ'),
(1048, 'ВАЛЮТН'),
(1239, 'ВАРИАНТ'),
(1075, 'ВАРЬИР'),
(1202, 'ВАС'),
(384, 'ВАСИЛЬЕВН'),
(1375, 'ВВЕДЕН'),
(657, 'ВВОД'),
(1345, 'ВЕ'),
(831, 'ВЕДЕН'),
(468, 'ВЕЗД'),
(871, 'ВЕКСЕЛ'),
(1109, 'ВЕКСЕЛЕДЕРЖАТЕЛ'),
(1067, 'ВЕКСЕЛЬН'),
(561, 'ВЕРНУТ'),
(719, 'ВЕРС'),
(537, 'ВЕРХН'),
(1021, 'ВЗАИМН'),
(1029, 'ВЗАИМОВЫГОДН'),
(459, 'ВЗАИМОДЕЙСТВ'),
(487, 'ВЗАИМООТНОШЕН'),
(707, 'ВЗИМА'),
(931, 'ВЗИМАН'),
(108, 'ВЗЯЛ'),
(228, 'ВИД'),
(867, 'ВИДОВ'),
(666, 'ВИЗИРОВА'),
(389, 'ВИКТОРОВИЧ'),
(118, 'ВКЛАД'),
(1229, 'ВКЛАДОВ'),
(259, 'ВКЛЮЧ'),
(1268, 'ВКЛЮЧА'),
(1157, 'ВКЛЮЧИТЕЛЬН'),
(888, 'ВЛАДЕЛЬЦ'),
(1188, 'ВЛЕЧЕТ'),
(492, 'ВНЕДР'),
(212, 'ВНЕДРЕН'),
(906, 'ВНЕСЕН'),
(1032, 'ВНИМАН'),
(509, 'ВНОС'),
(922, 'ВНУТР'),
(647, 'ВНУТРЕН'),
(928, 'ВОЗВРАТ'),
(194, 'ВОЗМОЖН'),
(1074, 'ВОЗНАГРАЖДЕН'),
(1113, 'ВОЗНИКА'),
(1189, 'ВОЗНИКНОВЕН'),
(1405, 'ВОЗРОСШ'),
(367, 'ВОЛОШИН'),
(563, 'ВОПРОС'),
(727, 'ВОСПОЛЬЗОВА'),
(46, 'ВОСТРЕБОВАН'),
(107, 'ВРЕМ'),
(642, 'ВРЕМЕН'),
(467, 'ВСЕГД'),
(499, 'ВСЕМ'),
(305, 'ВСЕМИРН'),
(123, 'ВСЕРОССИЙСК'),
(1402, 'ВСЕСТОРОН'),
(503, 'ВСЕХ'),
(572, 'ВСТРЕЧ'),
(976, 'ВСТРЕЧН'),
(1371, 'ВСТУПЛЕН'),
(99, 'ВУЗ'),
(1044, 'ВЫБОР'),
(1323, 'ВЫБРА'),
(1236, 'ВЫГОДН'),
(1049, 'ВЫДА'),
(954, 'ВЫДАЧ'),
(751, 'ВЫЕЗД'),
(750, 'ВЫЕЗДОВ'),
(33, 'ВЫНЕСТ'),
(668, 'ВЫПИСК'),
(901, 'ВЫПИСОК'),
(1339, 'ВЫПЛАТ'),
(880, 'ВЫПОЛНЕН'),
(26, 'ВЫПУСК'),
(743, 'ВЫРУЧК'),
(434, 'ВЫСОК'),
(88, 'ВЫСОКОТЕХНОЛОГИЧН'),
(480, 'ВЫСОЧАЙШ'),
(315, 'ВЫСТАВК'),
(1360, 'ВЫСТУПА'),
(1417, 'ВЫСШ'),
(801, 'ВЫХОДН'),
(1161, 'ВЫШ'),
(1437, 'ВЫЯВЛЕН'),
(336, 'ВЯЧЕСЛА'),
(1005, 'ГАЗПРОМБАНК'),
(953, 'ГАРАНТ'),
(990, 'ГАРАНТИЙН'),
(495, 'ГАРАНТИР'),
(875, 'ГДР'),
(701, 'ГЕНЕРАЦ'),
(423, 'ГЕННАДЬЕВИЧ'),
(948, 'ГЕОГРАФ'),
(489, 'ГИБК'),
(122, 'ГЛАВН'),
(8, 'ГОД'),
(1169, 'ГОДОВ'),
(1217, 'ГОРОД'),
(1219, 'ГОРОДСК'),
(1220, 'ГОРЯЧ'),
(1472, 'ГОС'),
(331, 'ГОСУДАРСТВЕН'),
(1263, 'ГОТ'),
(1262, 'ГОТОВ'),
(1193, 'ГРАЖДАНИН'),
(1481, 'ГРАМОТА1'),
(1482, 'ГРАМОТА2'),
(1483, 'ГРАМОТА3'),
(1300, 'ГРАНИЦ'),
(733, 'ГРАФИК'),
(326, 'ГРИГОРЬЕВИЧ'),
(206, 'ДАЛЬН'),
(160, 'ДАН'),
(1060, 'ДАТ'),
(1108, 'ДАЮЩ'),
(1266, 'ДВА'),
(914, 'ДВИЖЕН'),
(1211, 'ДВУХ'),
(1291, 'ДЕБЕТОВ'),
(551, 'ДЕЙСТВ'),
(358, 'ДЕЛ'),
(1024, 'ДЕЛОВ'),
(1249, 'ДЕМОКРАТИЧН'),
(225, 'ДЕН'),
(844, 'ДЕНЕГ'),
(277, 'ДЕНЕЖН'),
(116, 'ДЕНЬГ'),
(866, 'ДЕП'),
(424, 'ДЕПАРТАМЕНТ'),
(250, 'ДЕПОЗ'),
(249, 'ДЕПОЗИТ'),
(860, 'ДЕПОЗИТАР'),
(859, 'ДЕПОЗИТАРН'),
(1334, 'ДЕПОЗИТН'),
(248, 'ДЕПОЗИТОВ'),
(884, 'ДЕПОНЕНТ'),
(883, 'ДЕПОНЕНТОВ'),
(1476, 'ДЕРЖАВИН'),
(120, 'ДЕРЖАТЕЛ'),
(103, 'ДЕСЯ'),
(1271, 'ДЕТ'),
(291, 'ДЕЯТЕЛЬН'),
(170, 'ДИНАМИК'),
(556, 'ДИНАМИЧЕСК'),
(1237, 'ДИНАМИЧН'),
(380, 'ДИРЕКТОР'),
(379, 'ДИРЕКТОРОВ'),
(1054, 'ДИСКОНТ'),
(268, 'ДИСТАНЦИОН'),
(606, 'ДМИТРОВК'),
(1063, 'ДНЕ'),
(853, 'ДНИ'),
(792, 'ДНЯ'),
(1065, 'ДО2'),
(934, 'ДОБАВЛЕН'),
(115, 'ДОВЕР'),
(1176, 'ДОВЕРЯ'),
(1474, 'ДОВОЛЬН'),
(571, 'ДОГОВОР'),
(854, 'ДОГОВОРН'),
(892, 'ДОГОВОРОВ'),
(660, 'ДОКУМЕНТ'),
(920, 'ДОКУМЕНТАРН'),
(741, 'ДОКУМЕНТАЦ'),
(896, 'ДОКУМЕНТОВ'),
(1069, 'ДОЛГОВ'),
(1034, 'ДОЛГОСРОЧН'),
(321, 'ДОЛЖНОСТ'),
(1125, 'ДОЛЛ'),
(1153, 'ДОЛЛАР'),
(1180, 'ДОЛЛАРОВ'),
(15, 'ДОПОЛНИТЕЛЬН'),
(1440, 'ДОРАБОТК'),
(1118, 'ДОСРОЧН'),
(726, 'ДОСТАВК'),
(1414, 'ДОСТАВЛЕН'),
(1386, 'ДОСТАТОЧН'),
(451, 'ДОСТИЖЕН'),
(540, 'ДОСТУП'),
(279, 'ДОСТУПН'),
(190, 'ДОХОД'),
(693, 'ДРУГ'),
(342, 'ДРУЖБ'),
(1250, 'ЕLЕCTRON'),
(388, 'ЕВГЕН'),
(337, 'ЕВГЕНЬЕВИЧ'),
(1127, 'ЕВР'),
(873, 'ЕВРООБЛИГАЦ'),
(140, 'ЕВРОПЕЙСК'),
(1179, 'ЕДИНОВРЕМЕН'),
(309, 'ЕЖЕГОДН'),
(848, 'ЕЖЕДНЕВН'),
(1129, 'ЕЖЕМЕСЯЧН'),
(1105, 'ЕМ'),
(1071, 'ЕТС'),
(1422, 'ЖЕЛАТЕЛ'),
(1201, 'ЖЕНЩИН'),
(530, 'ЖИТЕЛ'),
(412, 'ЖУРАВЛ'),
(411, 'ЖУРАВЛЕВ'),
(985, 'ЗАВЕРК'),
(161, 'ЗАВЕРША'),
(1051, 'ЗАВИС'),
(1076, 'ЗАВИСИМ'),
(802, 'ЗАГРУЗК'),
(562, 'ЗАДА'),
(297, 'ЗАДАЧ'),
(199, 'ЗАДОЛЖЕН'),
(757, 'ЗАЕЗД'),
(1192, 'ЗАЕМЩИК'),
(1421, 'ЗАЕМЩИКОВ'),
(1058, 'ЗАЙМ'),
(1261, 'ЗАКАЗА'),
(1473, 'ЗАКАЗЧИК'),
(930, 'ЗАКЛАД'),
(1083, 'ЗАКЛЮЧЕН'),
(1107, 'ЗАКОН'),
(1428, 'ЗАКОНОДАТЕЛЬСТВ'),
(425, 'ЗАКОНЧ'),
(886, 'ЗАКРЕПЛЕН'),
(584, 'ЗАКРЫТ'),
(40, 'ЗАЛ'),
(39, 'ЗАЛОВ'),
(927, 'ЗАЛОГ'),
(882, 'ЗАЛОГОВ'),
(1468, 'ЗАМЕР'),
(338, 'ЗАМЕСТИТЕЛ'),
(240, 'ЗАНИМА'),
(1321, 'ЗАПОЛН'),
(490, 'ЗАПРОС'),
(1388, 'ЗАПУСТ'),
(533, 'ЗАРЕГИСТРИРОВА'),
(1450, 'ЗАРПЛАТ'),
(952, 'ЗАРУБЕЖ'),
(307, 'ЗАРУБЕЖН'),
(789, 'ЗАЧИСЛЕН'),
(694, 'ЗАЧИСЛЯ'),
(1445, 'ЗАЩИТ'),
(1279, 'ЗАЩИЩ'),
(744, 'ЗАЯВК'),
(1441, 'ЗАЯВОК'),
(1395, 'ЗВОН'),
(1223, 'ЗВОНОК'),
(1362, 'ЗДАН'),
(655, 'ЗЕМН'),
(1423, 'ЗНАН'),
(1358, 'ЗНАЧИТЕЛЬН'),
(138, 'ЗОЛОТ'),
(361, 'ИГНА'),
(360, 'ИГНАТ'),
(359, 'ИГНАТЬЕВ'),
(622, 'ИДЕНТИФИКАЦИОН'),
(306, 'ИЗВЕСТН'),
(1413, 'ИЗВИНЕН'),
(1185, 'ИЗЛОЖЕН'),
(907, 'ИЗМЕНЕН'),
(1392, 'ИЗУЧЕН'),
(1338, 'ИЗЪЯТ'),
(861, 'ИМЕЕТ'),
(1347, 'ИМПОРТН'),
(1317, 'ИМУЩЕСТВ'),
(611, 'ИН'),
(1330, 'ИНВЕСТ'),
(261, 'ИНВЕСТИЦИОН'),
(446, 'ИНДИВИДУАЛЬН'),
(374, 'ИНДУСТРИАЛЬН'),
(1460, 'ИНИЦИАТИВН'),
(923, 'ИНИЦИАТОР'),
(1100, 'ИНКАСС'),
(725, 'ИНКАССАЦ'),
(746, 'ИНКАССИРУЕМ'),
(452, 'ИННОВАЦ'),
(494, 'ИННОВАЦИОН'),
(674, 'ИНОСТРА'),
(372, 'ИНСТИТУТ'),
(1394, 'ИНСТРУКЦ'),
(864, 'ИНСТРУМЕНТ'),
(872, 'ИНСТРУМЕНТОВ'),
(1190, 'ИНТЕЗ'),
(1233, 'ИНТЕРЕС'),
(650, 'ИНТЕРНЕТ'),
(636, 'ИНТЕРНЕТ-БАНК'),
(635, 'ИНТЕРНЕТ-БАНКИНГ'),
(1379, 'ИНТЕРНЕТ-КЛИЕНТ'),
(95, 'ИНТЕРНЕТ-КРЕДИТОВАН'),
(716, 'ИНТЕРНЕТ-СТРАНИЦ'),
(644, 'ИНТЕРФЕЙС'),
(219, 'ИНФОРМАЦ'),
(542, 'ИНФОРМАЦИОН'),
(74, 'ИПОТЕЧН'),
(354, 'ИРИН'),
(330, 'ИРКУТСК'),
(979, 'ИСК'),
(936, 'ИСКЛЮЧЕН'),
(978, 'ИСКОВ'),
(1038, 'ИСПОЛН'),
(665, 'ИСПОЛНЕН'),
(318, 'ИСПОЛНИТЕЛЬН'),
(1099, 'ИСПОЛНЯ'),
(283, 'ИСПОЛЬЗ'),
(30, 'ИСПОЛЬЗОВАН'),
(1207, 'ИСПЫТАТЕЛЬН'),
(1403, 'ИССЛЕДОВАН'),
(1, 'ИСТОР'),
(431, 'КАЖД'),
(398, 'КАЗНАЧЕЙСТВ'),
(1128, 'КАЛЕНДАРН'),
(421, 'КАЛИНИН'),
(176, 'КАПИТА'),
(29, 'КАРТ'),
(1167, 'КАРТОЧК'),
(1288, 'КАРТОЧН'),
(1152, 'КАРТСЧЕТ'),
(1234, 'КАСА'),
(838, 'КАССОВ'),
(559, 'КАТАЛОГ'),
(64, 'КАТЕГОР'),
(141, 'КАЧЕСТВ'),
(146, 'КАЧЕСТВЕН'),
(408, 'КВАЛИФИКАЦ'),
(399, 'КЕМЕРОВСК'),
(1443, 'КК'),
(86, 'КЛИЕНТ'),
(216, 'КЛИЕНТОВ'),
(702, 'КЛЮЧ'),
(545, 'КНОПОК'),
(498, 'КО'),
(623, 'КОД'),
(749, 'КОЛИЧЕСТВ'),
(317, 'КОЛЛЕГИАЛЬН'),
(1122, 'КОМИСС'),
(1073, 'КОМИССИОН'),
(12, 'КОММЕРЧЕСК'),
(2, 'КОМПАН'),
(449, 'КОМПЛЕКС'),
(810, 'КОМПЛЕКСН'),
(1367, 'КОМПЛЕКТ'),
(653, 'КОМПЬЮТЕР'),
(1163, 'КОНВЕРС'),
(843, 'КОНВЕРСИОН'),
(676, 'КОНВЕРТАЦ'),
(395, 'КОНДРУС'),
(394, 'КОНДРУСЕВ'),
(1052, 'КОНКРЕТН'),
(812, 'КОНКУРЕНТН'),
(946, 'КОНКУРЕНТОСПОСОБН'),
(137, 'КОНКУРС'),
(567, 'КОНСУЛЬТАЦ'),
(889, 'КОНСУЛЬТАЦИОН'),
(876, 'КОНСУЛЬТИРОВАН'),
(564, 'КОНТАКТН'),
(692, 'КОНТРАГЕНТ'),
(691, 'КОНТРАГЕНТОВ'),
(965, 'КОНТРАКТ'),
(964, 'КОНТРАКТОВ'),
(955, 'КОНТРГАРАНТ'),
(1295, 'КОНТРОЛ'),
(696, 'КОНТРОЛИРОВА'),
(486, 'КОНФИДЕНЦИАЛЬН'),
(1340, 'КОНЦ'),
(313, 'КОНЦЕРТ'),
(609, 'КОР'),
(353, 'КОРН'),
(352, 'КОРНЕВ'),
(260, 'КОРПОРАТИВН'),
(862, 'КОРРЕСПОНДЕНТСК'),
(1000, 'КОТНРАГЕНТ'),
(31, 'КОТОР'),
(619, 'КПП'),
(1232, 'КРАТКОСРОЧН'),
(841, 'КРАТЧАЙШ'),
(109, 'КРЕД'),
(253, 'КРЕДИТ'),
(270, 'КРЕДИТН'),
(252, 'КРЕДИТОВ'),
(75, 'КРЕДИТОВАН'),
(1465, 'КРЕДИТОСПОСОБН'),
(70, 'КРИЗИС'),
(61, 'КРИТЕР'),
(281, 'КРУГЛОСУТОЧН'),
(221, 'КРУПН'),
(524, 'КУЛЬТУР'),
(518, 'КУЛЬТУРН'),
(300, 'КУЛЬТУРНО-ПРОСВЕТИТЕЛЬСК'),
(680, 'КУРС'),
(149, 'ЛАУРЕАТ'),
(1240, 'ЛЕЖ'),
(104, 'ЛЕТ'),
(476, 'ЛИДЕР'),
(475, 'ЛИДЕРОВ'),
(1246, 'ЛИЗИНГ'),
(1316, 'ЛИКВИДН'),
(962, 'ЛИМ'),
(961, 'ЛИМИТ'),
(960, 'ЛИМИТОВ'),
(1022, 'ЛИН'),
(1227, 'ЛИНЕЙК'),
(93, 'ЛИЦ'),
(50, 'ЛИЦЕНЗ'),
(1177, 'ЛИШН'),
(1004, 'ЛОР'),
(129, 'ЛУЧШ'),
(271, 'ЛЬГОТН'),
(652, 'ЛЮБ'),
(1244, 'ЛЮД'),
(387, 'ЛЯХ'),
(432, 'МАКСИМАЛЬН'),
(131, 'МАЛ'),
(144, 'МАРКЕТИНГ'),
(1135, 'МАРТ'),
(735, 'МАРШРУТ'),
(1381, 'МАСТЕР'),
(798, 'МАТЕРИА'),
(391, 'МВА'),
(139, 'МЕДАЛ'),
(523, 'МЕДИЦИН'),
(1026, 'МЕЖБАНКОВСК'),
(136, 'МЕЖДУНАРОДН'),
(840, 'МЕЖРЕГИОНАЛЬН'),
(393, 'МЕНЕДЖМЕНТ'),
(1197, 'МЕНЬШ'),
(44, 'МЕСТ'),
(759, 'МЕСЯЦ'),
(1138, 'МЕСЯЦЕВ'),
(1446, 'МЕТОДОЛОГИЧЕСК'),
(1353, 'МЕХАНИЗМ'),
(1158, 'МИН'),
(1328, 'МИНИКРЕД'),
(1130, 'МИНИМАЛЬН'),
(1039, 'МИНИМИЗАЦ'),
(437, 'МИР'),
(436, 'МИРОВ'),
(430, 'МИСС'),
(382, 'МИХАЙЛ'),
(381, 'МИХАЙЛОВ'),
(363, 'МИХАЙЛОВИЧ'),
(158, 'МКТ'),
(205, 'МЛН'),
(1072, 'ММВБ'),
(304, 'МНОГ'),
(1297, 'МНОГОКРАТН'),
(314, 'МНОГОЧИСЛЕН'),
(1037, 'МОГУТ'),
(568, 'МОЖЕТ'),
(1218, 'МОЖН'),
(179, 'МОМЕНТ'),
(738, 'МОНЕТ'),
(1471, 'МОНТАЖН'),
(345, 'МОСКВ'),
(356, 'МОСКОВСК'),
(1199, 'МУЖЧИН'),
(308, 'МУЗЫКАНТ'),
(76, 'МУНИЦИПАЛЬН'),
(433, 'НАБОР'),
(1425, 'НАВЫК'),
(150, 'НАГРАД'),
(287, 'НАДЕЖН'),
(963, 'НАДЛЕЖА'),
(586, 'НАЗВАН'),
(1015, 'НАИБОЛ'),
(583, 'НАИМЕНОВАН'),
(1205, 'НАЙМ'),
(1028, 'НАЛАЖИВАН'),
(909, 'НАЛИЧ'),
(729, 'НАЛИЧН'),
(933, 'НАЛОГ'),
(971, 'НАЛОГОВ'),
(504, 'НАМ'),
(1426, 'НАПИСАН'),
(543, 'НАПОЛНЕН'),
(1018, 'НАПРАВЛ'),
(218, 'НАПРАВЛЕН'),
(191, 'НАПРАВЛЯ'),
(209, 'НАРАЩИВАН'),
(344, 'НАРОД'),
(418, 'НАРОДН'),
(343, 'НАРОДОВ'),
(18, 'НАСЕЛЕН'),
(1389, 'НАСТРОЙК'),
(1111, 'НАСТУПЛЕН'),
(245, 'НАХОД'),
(912, 'НАХОДЯ'),
(126, 'НАЦИОНАЛЬН'),
(105, 'НАЧА'),
(1156, 'НАЧАЛ'),
(327, 'НАЧАЛЬНИК'),
(25, 'НАЧИНА'),
(684, 'НАЧИСЛЕН'),
(280, 'НАШ'),
(11, 'НЕБОЛЬШ'),
(1315, 'НЕДВИЖИМ'),
(1066, 'НЕДЕЛ'),
(829, 'НЕЗАВИСИМ'),
(1280, 'НЕЗАКОН'),
(520, 'НЕЗАЩИЩЕН'),
(1112, 'НЕКОТОР'),
(1204, 'НЕМ'),
(1265, 'НЕМНОГ'),
(711, 'НЕОБХОД'),
(740, 'НЕОБХОДИМ'),
(1136, 'НЕПОГАШЕН'),
(1133, 'НЕРАЗРЕШЕН'),
(835, 'НЕРЕЗИДЕНТ'),
(834, 'НЕРЕЗИДЕНТОВ'),
(795, 'НЕСКОЛЬК'),
(939, 'НЕСТАНДАРТН'),
(1415, 'НЕУДОБСТВ'),
(714, 'НИЖ'),
(414, 'НИКОЛАЕВН'),
(887, 'НИМ'),
(959, 'НИХ'),
(153, 'НОВ'),
(1119, 'НОВАЦ'),
(1475, 'НОВОСИБИРСК'),
(558, 'НОВОСТ'),
(595, 'НОМЕР'),
(785, 'НОЧН'),
(1175, 'НУЖН'),
(465, 'ОБЕСПЕЧ'),
(390, 'ОБЕСПЕЧЕН'),
(460, 'ОБЕСПЕЧИВА'),
(91, 'ОБЛАСТ'),
(869, 'ОБЛИГАЦ'),
(895, 'ОБМ'),
(1312, 'ОБОРОТ'),
(730, 'ОБОРУДОВА'),
(1314, 'ОБОРУДОВАН'),
(1298, 'ОБРА'),
(322, 'ОБРАЗОВАН'),
(517, 'ОБРАЗОВАТЕЛЬН'),
(820, 'ОБРАЗЦ'),
(565, 'ОБРАТ'),
(1068, 'ОБРАЩЕН'),
(27, 'ОБСЛУЖИВАН'),
(98, 'ОБУЧЕН'),
(947, 'ОБШИРН'),
(1208, 'ОБЩ'),
(1459, 'ОБЩЕН'),
(511, 'ОБЩЕСТВ'),
(200, 'ОБЪ'),
(1146, 'ОБЪЕДИНЕН'),
(794, 'ОБЪЕКТ'),
(211, 'ОБЪЕМ'),
(1393, 'ОБЪЕМН'),
(210, 'ОБЪЕМОВ'),
(1191, 'ОБЯЗАН'),
(966, 'ОБЯЗАТЕЛЬСТВ'),
(1053, 'ОВГВЗ'),
(1131, 'ОВЕРДРАФТ'),
(935, 'ОГОВОРЕН'),
(1273, 'ОГРАНИЧЕН'),
(220, 'ОДИН'),
(286, 'ОДН'),
(1104, 'ОКАЗА'),
(442, 'ОКАЗАН'),
(256, 'ОКАЗЫВА'),
(1452, 'ОКЛАД'),
(617, 'ОКОНХ'),
(329, 'ОКОНЧ'),
(1342, 'ОКОНЧАН'),
(615, 'ОКП'),
(127, 'ОЛИМП'),
(413, 'ОЛЬГ'),
(1418, 'ОП'),
(1243, 'ОПЕРАТИВН'),
(229, 'ОПЕРАЦ'),
(38, 'ОПЕРАЦИОН'),
(479, 'ОПИРА'),
(1047, 'ОПИСАН'),
(975, 'ОПЛАТ'),
(671, 'ОПРЕДЕЛЕН'),
(1184, 'ОПРЕДЕЛЯ'),
(1238, 'ОПТИМАЛЬН'),
(1456, 'ОПЫТН'),
(319, 'ОРГА'),
(970, 'ОРГАН'),
(527, 'ОРГАНИЗАЦ'),
(969, 'ОРГАНОВ'),
(902, 'ОРИГИНА'),
(898, 'ОРИГИНАЛЬН'),
(508, 'ОРИЕНТИРОВА'),
(1260, 'ОРНАМЕНТ'),
(1147, 'ОРС'),
(712, 'ОС'),
(811, 'ОСН'),
(458, 'ОСНОВ'),
(4, 'ОСНОВА'),
(891, 'ОСНОВАН'),
(227, 'ОСНОВН'),
(1031, 'ОСОБ'),
(1164, 'ОСТАНОВК'),
(910, 'ОСТАТК'),
(1294, 'ОСТАТОК'),
(1123, 'ОСУЩЕСТВЛЕН'),
(226, 'ОСУЩЕСТВЛЯ'),
(576, 'ОТВЕТ'),
(507, 'ОТВЕТСТВЕН'),
(1357, 'ОТВЛЕЧЕН'),
(100, 'ОТД'),
(1416, 'ОТДЕЛ'),
(1216, 'ОТДЕЛЕН'),
(550, 'ОТДЕЛЬН'),
(981, 'ОТЕЧЕСТВЕН'),
(13, 'ОТКРЫВА'),
(497, 'ОТКРЫТ'),
(546, 'ОТЛИЧА'),
(1134, 'ОТМЕН'),
(60, 'ОТНОС'),
(426, 'ОТНОШЕН'),
(1171, 'ОТПРАВК'),
(462, 'ОТРАСЛ'),
(461, 'ОТРАСЛЕВ'),
(1409, 'ОТРЕМОНТИРОВА'),
(687, 'ОТСЛЕЖИВА'),
(1079, 'ОТСУТСТВ'),
(915, 'ОТЧЕТ'),
(59, 'ОТЧЕТН'),
(1187, 'ОФЕРТ'),
(1059, 'ОФЗ'),
(16, 'ОФИС'),
(1361, 'ОФИСН'),
(233, 'ОФИСОВ'),
(1203, 'ОФИЦИАЛЬН'),
(881, 'ОФОРМЛЕН'),
(1434, 'ОЦЕНК'),
(1369, 'ОЦЕНЩИК'),
(870, 'ПА'),
(1267, 'ПАКЕТ'),
(536, 'ПАНЕЛ'),
(1447, 'ПАРК'),
(471, 'ПАРТНЕР'),
(1030, 'ПАРТНЕРСК'),
(457, 'ПАРТНЕРСТВ'),
(14, 'ПЕРВ'),
(1154, 'ПЕРВИЧН'),
(513, 'ПЕРВОКЛАССН'),
(1344, 'ПЕРВОНАЧАЛЬН'),
(278, 'ПЕРЕВОД'),
(1155, 'ПЕРЕД'),
(1115, 'ПЕРЕДАЧ'),
(493, 'ПЕРЕДОВ'),
(1370, 'ПЕРЕНОС'),
(1410, 'ПЕРЕОБОРУДОВА'),
(1168, 'ПЕРЕРАСХОД'),
(878, 'ПЕРЕРЕГИСТРАЦ'),
(1010, 'ПЕРЕУСТУПК'),
(152, 'ПЕРЕХОД'),
(1116, 'ПЕРЕЧЕН'),
(1162, 'ПЕРЕЧИСЛЕН'),
(272, 'ПЕРИОД'),
(404, 'ПЕРСОНАЛ'),
(1254, 'ПЕРСОНАЛЬН'),
(662, 'ПЕРСОНИФИЦИРОВА'),
(217, 'ПЕРСПЕКТИВН'),
(899, 'ПЕЧАТ'),
(659, 'ПЕЧАТА'),
(1458, 'ПК'),
(1183, 'ПЛАН'),
(28, 'ПЛАСТИКОВ'),
(706, 'ПЛАТ'),
(690, 'ПЛАТЕЖ'),
(1464, 'ПЛАТЕЖЕСПОСОБН'),
(79, 'ПЛАТЕЖН'),
(1095, 'ПЛАТЕЛЬЩИК'),
(1259, 'ПЛАТИН'),
(1258, 'ПЛАТИНОВ'),
(816, 'ПЛАТФОРМ'),
(386, 'ПЛЕХАН'),
(385, 'ПЛЕХАНОВ'),
(324, 'ПЛЕШК'),
(323, 'ПЛЕШКОВ'),
(781, 'ПЛЮС'),
(1042, 'ПОВЕДЕН'),
(208, 'ПОВЫШЕН'),
(697, 'ПОГАШЕН'),
(1348, 'ПОДВИЖН'),
(1431, 'ПОДГОТОВК'),
(1324, 'ПОДГОТОВЬТ'),
(298, 'ПОДДЕРЖАН'),
(301, 'ПОДДЕРЖК'),
(699, 'ПОДКЛЮЧЕН'),
(805, 'ПОДКРЕПЛЕН'),
(986, 'ПОДЛИН'),
(664, 'ПОДПИС'),
(661, 'ПОДПИСЫВА'),
(648, 'ПОДСКАЗК'),
(1212, 'ПОДТВЕРД'),
(996, 'ПОДТВЕРЖДЕН'),
(447, 'ПОДХОД'),
(1304, 'ПОЖЕЛАН'),
(32, 'ПОЗВОЛЯ'),
(1318, 'ПОЗВОН'),
(634, 'ПОИСК'),
(1326, 'ПОКАЖ'),
(174, 'ПОКАЗАТЕЛ'),
(172, 'ПОКАЗЫВА'),
(997, 'ПОКРЫТ'),
(1301, 'ПОКУПА'),
(672, 'ПОКУПК'),
(1302, 'ПОЛЕЗН'),
(1017, 'ПОЛИТИК'),
(257, 'ПОЛН'),
(1002, 'ПОЛНОМОЧ'),
(1435, 'ПОЛНОТ'),
(637, 'ПОЛНОФУНКЦИОНАЛЬН'),
(710, 'ПОЛНОЦЕН'),
(791, 'ПОЛОВИН'),
(1429, 'ПОЛОЖЕН'),
(162, 'ПОЛОЖИТЕЛЬН'),
(347, 'ПОЛУЧ'),
(49, 'ПОЛУЧА'),
(1097, 'ПОЛУЧАТЕЛ'),
(1148, 'ПОЛУЧЕН'),
(830, 'ПОЛЬЗ'),
(1296, 'ПОЛЬЗОВА'),
(1457, 'ПОЛЬЗОВАТЕЛ'),
(1365, 'ПОМЕЩЕН'),
(1322, 'ПОМОГУТ'),
(575, 'ПОМОЧ'),
(478, 'ПОМОЩ'),
(643, 'ПОНЯТН'),
(1336, 'ПОПОЛНЕН'),
(900, 'ПОРУЧЕН'),
(203, 'ПОРЯДК'),
(303, 'ПОСЕТ'),
(916, 'ПОСЛ'),
(783, 'ПОСЛЕД'),
(450, 'ПОСЛЕДН'),
(846, 'ПОСРЕДСТВ'),
(1352, 'ПОСТАВОК'),
(1408, 'ПОСТЕПЕН'),
(1102, 'ПОСТУП'),
(695, 'ПОСТУПЛЕН'),
(1278, 'ПОТ'),
(195, 'ПОТЕР'),
(1275, 'ПОТРАТ'),
(266, 'ПОТРЕБИТЕЛЬСК'),
(466, 'ПОТРЕБН'),
(173, 'ПОЧТ'),
(625, 'ПОЧТОВ'),
(1355, 'ПОШЛИН'),
(879, 'ПРАВ'),
(320, 'ПРАВЛЕН'),
(373, 'ПРАВОВЕДЕН'),
(1368, 'ПРАВОУСТАНАВЛИВА'),
(800, 'ПРАЗДНИЧН'),
(239, 'ПРАКТИК'),
(651, 'ПРАКТИЧЕСК'),
(745, 'ПРЕДВАРИТЕЛЬН'),
(36, 'ПРЕДЕЛ'),
(944, 'ПРЕДЕЛЬН'),
(482, 'ПРЕДЛАГ'),
(237, 'ПРЕДЛАГА'),
(1432, 'ПРЕДЛОЖЕН'),
(1359, 'ПРЕДМЕТ'),
(1082, 'ПРЕДОПЛАТ'),
(1098, 'ПРЕДОСТАВ'),
(512, 'ПРЕДОСТАВЛ'),
(106, 'ПРЕДОСТАВЛЕН'),
(265, 'ПРЕДОСТАВЛЯ'),
(852, 'ПРЕДПРАЗДНИЧН'),
(1303, 'ПРЕДПРИНИМАТЕЛ'),
(445, 'ПРЕДПРИНИМАТЕЛЬСТВ'),
(130, 'ПРЕДПРИЯТ'),
(339, 'ПРЕДСЕДАТЕЛ'),
(85, 'ПРЕДСТАВ'),
(230, 'ПРЕДСТАВЛЕН'),
(1013, 'ПРЕДСТАВЛЯ'),
(552, 'ПРЕДУСМОТР'),
(984, 'ПРЕДЪЯВЛЕН'),
(1366, 'ПРЕДЪЯВЛЯ'),
(813, 'ПРЕИМУЩЕСТВ'),
(1341, 'ПРЕКРАЩА'),
(124, 'ПРЕМ'),
(69, 'ПРЕОДОЛ'),
(68, 'ПРЕОДОЛЕВ'),
(164, 'ПРИБ'),
(1333, 'ПРИБЫЛ'),
(1036, 'ПРИВЛЕЧЕН'),
(37, 'ПРИВЫЧН'),
(670, 'ПРИЛОЖЕН'),
(1182, 'ПРИМЕНЯ'),
(501, 'ПРИМЕР'),
(1056, 'ПРИНИМА'),
(1412, 'ПРИНОС'),
(439, 'ПРИНЦИП'),
(238, 'ПРИНЯТ'),
(1356, 'ПРИОБРЕСТ'),
(96, 'ПРИОБРЕТЕН'),
(299, 'ПРИОРИТЕТН'),
(198, 'ПРИРАВНЕН'),
(1406, 'ПРИСПОСОБЛЕН'),
(19, 'ПРИСТУПА'),
(1286, 'ПРИХОД'),
(1101, 'ПРИЧИТА'),
(455, 'ПРОБЛЕМАТИК'),
(1401, 'ПРОВЕД'),
(142, 'ПРОВЕДЕН'),
(1121, 'ПРОВЕРК'),
(943, 'ПРОВОД'),
(1117, 'ПРОВОДИМ'),
(1299, 'ПРОВОЗ'),
(73, 'ПРОГРАММ'),
(673, 'ПРОДАЖ'),
(71, 'ПРОДОЛЖА'),
(90, 'ПРОДУКТ'),
(89, 'ПРОДУКТОВ'),
(147, 'ПРОДУКЦ'),
(474, 'ПРОЕКТ'),
(473, 'ПРОЕКТОВ'),
(293, 'ПРОЗРАЧН'),
(1390, 'ПРОИЗВЕД'),
(1096, 'ПРОИЗВЕСТ'),
(1081, 'ПРОИЗВОД'),
(366, 'ПРОИЗВОДСТВ'),
(1364, 'ПРОИЗВОДСТВЕН'),
(1050, 'ПРОЛОНГАЦ'),
(1284, 'ПРОМЕДЛЕН'),
(1282, 'ПРОПАЖ'),
(989, 'ПРОРАБОТК'),
(715, 'ПРОСМОТР'),
(1106, 'ПРОСТ'),
(987, 'ПРОСЬБ'),
(821, 'ПРОФЕССИОНАЛИЗМ'),
(51, 'ПРОФЕССИОНАЛЬН'),
(310, 'ПРОХОД'),
(1178, 'ПРОЦЕДУР'),
(686, 'ПРОЦЕНТ'),
(1327, 'ПРОЦЕНТН'),
(685, 'ПРОЦЕНТОВ'),
(621, 'ПРОЧ'),
(407, 'ПРОШЕЛ'),
(188, 'ПРОШЛ'),
(1380, 'ПРОЩ'),
(488, 'ПРОЯВЛЯ'),
(1449, 'ПТ'),
(557, 'ПУБЛИКАЦ'),
(1186, 'ПУБЛИЧН'),
(1143, 'ПУНКТ'),
(1448, 'ПЯТИДНЕВН'),
(851, 'ПЯТНИЦ'),
(17, 'РАБОТ'),
(223, 'РАБОТА'),
(1308, 'РАБОЧ'),
(574, 'РАД'),
(925, 'РАЗБЛОКИРОВК'),
(863, 'РАЗВЕТВЛЕН'),
(10, 'РАЗВИВА'),
(21, 'РАЗВИТ'),
(549, 'РАЗДЕЛ'),
(548, 'РАЗДЕЛОВ'),
(547, 'РАЗЛИЧН'),
(1120, 'РАЗМ'),
(737, 'РАЗМЕН'),
(163, 'РАЗМЕР'),
(1332, 'РАЗМЕСТ'),
(1235, 'РАЗМЕЩЕН'),
(1305, 'РАЗН'),
(1228, 'РАЗНООБРАЗН'),
(1001, 'РАМБУРСИР'),
(1007, 'РАМБУРСН'),
(1011, 'РАМК'),
(1346, 'РАН'),
(845, 'РАСПОРЯЖЕН'),
(824, 'РАСПРОСТРАНЕН'),
(1311, 'РАССМАТРИВА'),
(1306, 'РАССМОТРЕН'),
(1335, 'РАСТОРЖЕН'),
(1407, 'РАСТУЩ'),
(1287, 'РАСХОД'),
(797, 'РАСХОДН'),
(825, 'РАСЧЕТ'),
(828, 'РАСЧЕТН'),
(823, 'РАСЧЕТНО-КАССОВ'),
(837, 'РАСЧЕТОВ'),
(1398, 'РАСШИР'),
(1019, 'РАСШИРЕН'),
(72, 'РЕАЛИЗАЦ'),
(515, 'РЕАЛИЗУ'),
(641, 'РЕАЛЬН'),
(235, 'РЕГИОН'),
(477, 'РЕГИОНАЛЬН'),
(926, 'РЕГИСТРАЦ'),
(594, 'РЕГИСТРАЦИОН'),
(658, 'РЕДАКТИРОВА'),
(1376, 'РЕДАКЦ'),
(937, 'РЕЕСТРОДЕРЖАТЕЛ'),
(282, 'РЕЖИМ'),
(193, 'РЕЗЕРВ'),
(681, 'РЕЗЕРВИРОВА'),
(992, 'РЕЗЕРВН'),
(833, 'РЕЗИДЕНТ'),
(832, 'РЕЗИДЕНТОВ'),
(56, 'РЕЗУЛЬТАТ'),
(582, 'РЕКВИЗИТ'),
(1442, 'РЕКОМЕНДАЦ'),
(526, 'РЕЛИГИОЗН'),
(1397, 'РЕОРГАНИЗАЦ'),
(1025, 'РЕПУТАЦ'),
(410, 'РЕСУРС'),
(484, 'РЕШЕН'),
(1041, 'РИСК'),
(1040, 'РИСКОВ'),
(491, 'РОЗНИЧН'),
(396, 'РОМА'),
(134, 'РОСС'),
(125, 'РОССИЙСК'),
(171, 'РОСТ'),
(754, 'РУБ'),
(169, 'РУБЛ'),
(316, 'РУКОВОДСТВ'),
(290, 'РУКОВОДСТВУ'),
(63, 'РФ'),
(53, 'РЫНК'),
(679, 'РЫНОЧН'),
(87, 'РЯД'),
(544, 'САЙТ'),
(417, 'САНКТ-ПЕТЕРБУРГСК'),
(742, 'СБОР'),
(1285, 'СВЕДЕН'),
(371, 'СВЕРДЛОВСК'),
(296, 'СВОБОД'),
(682, 'СВОБОДН'),
(774, 'СВЫШ'),
(1374, 'СВЯЗ'),
(827, 'СВЯЗА'),
(207, 'СВЯЗЫВА'),
(793, 'СДАЮТ'),
(117, 'СДЕЛА'),
(991, 'СДЕЛК'),
(1225, 'СДЕЛОК'),
(1247, 'СЕГОДН'),
(224, 'СЕГОДНЯШН'),
(275, 'СЕЙФОВ'),
(1194, 'СЕЙЧАС'),
(1270, 'СЕМ'),
(369, 'СЕМЕНОВИЧ'),
(35, 'СЕРВИС'),
(1470, 'СЕРВИСН'),
(23, 'СЕТ'),
(945, 'СЖАТ'),
(94, 'СИСТ'),
(80, 'СИСТЕМ'),
(454, 'СИТУАЦ'),
(1387, 'СКАЧА'),
(1363, 'СКЛАДСК'),
(1274, 'СКОЛЬК'),
(822, 'СЛЕД'),
(435, 'СЛЕДУ'),
(521, 'СЛО'),
(940, 'СЛОЖН'),
(77, 'СЛУЖА'),
(728, 'СЛУЖБ'),
(988, 'СЛУЧА'),
(335, 'СМИРН'),
(334, 'СМИРНОВ'),
(1400, 'СМОГУТ'),
(1399, 'СМОЖЕТ'),
(646, 'СНАБЖ'),
(949, 'СНГ'),
(669, 'СО'),
(1014, 'СОБ'),
(485, 'СОБЛЮД'),
(1281, 'СОБЛЮДА'),
(183, 'СОБСТВЕН'),
(1165, 'СОВЕРША'),
(856, 'СОВЕРШЕН'),
(214, 'СОВЕРШЕНСТВОВАН'),
(378, 'СОВЕТ'),
(284, 'СОВРЕМЕН'),
(1454, 'СОГЛАСН'),
(732, 'СОГЛАСОВА'),
(808, 'СОГЛАШЕН'),
(302, 'СОДЕЙСТВ'),
(554, 'СОДЕРЖИМ'),
(814, 'СОЗДА'),
(587, 'СОКРАЩЕН'),
(1023, 'СОЛИДН'),
(1378, 'СООБЩ'),
(1373, 'СООБЩА'),
(1173, 'СООБЩЕН'),
(444, 'СООБЩЕСТВ'),
(857, 'СООТВЕТСТВ'),
(734, 'СОПРОВОЖДЕН'),
(1349, 'СОСТА'),
(1467, 'СОСТАВ'),
(1114, 'СОСТАВЛЕН'),
(165, 'СОСТАВЛЯ'),
(201, 'СОСТОЯН'),
(1242, 'СОТРУДНИК'),
(1241, 'СОТРУДНИКОВ'),
(505, 'СОТРУДНИЧА'),
(295, 'СОТРУДНИЧЕСТВ'),
(1224, 'СОХРАНЕН'),
(1453, 'СОЦ'),
(506, 'СОЦИАЛЬН'),
(472, 'СОЦИАЛЬНО-ЭКОНОМИЧЕСК'),
(441, 'СОЧЕТА'),
(258, 'СПЕКТР'),
(405, 'СПЕЦИАЛИЗАЦ'),
(739, 'СПЕЦИАЛИЗИРОВА'),
(566, 'СПЕЦИАЛИСТ'),
(332, 'СПЕЦИАЛЬН'),
(917, 'СПИСАН'),
(375, 'СПИСОК'),
(525, 'СПОРТИВН'),
(894, 'СПОСОБ'),
(1230, 'СПОСОБН'),
(1027, 'СПОСОБСТВ'),
(292, 'СПРАВЕДЛИВ'),
(1215, 'СПРАВК'),
(1469, 'СРАЗ'),
(132, 'СРЕДН'),
(1035, 'СРЕДНЕСРОЧН'),
(683, 'СРЕДСТВ'),
(842, 'СРОК'),
(273, 'СРОЧН'),
(196, 'ССУД'),
(197, 'ССУДН'),
(65, 'СТАБИЛЬН'),
(748, 'СТАВК'),
(1210, 'СТАЖ'),
(119, 'СТАЛ'),
(438, 'СТАНДАРТ'),
(1213, 'СТАНДАРТН'),
(470, 'СТАНДАРТОВ'),
(368, 'СТАНИСЛА'),
(355, 'СТАНИСЛАВОВН'),
(148, 'СТАНОВ'),
(1411, 'СТАНУТ'),
(1272, 'СТАРШ'),
(553, 'СТАТИЧЕСК'),
(348, 'СТЕПЕН'),
(753, 'СТОИМОСТ'),
(1439, 'СТОП-ФАКТОР'),
(1438, 'СТОП-ФАКТОРОВ'),
(809, 'СТОРОН'),
(608, 'СТР'),
(236, 'СТРАН'),
(555, 'СТРАНИЦ'),
(392, 'СТРАТЕГИЧЕСК'),
(500, 'СТРЕМ'),
(463, 'СТРУКТУР'),
(877, 'СТРУКТУРИРОВА'),
(1433, 'СТРУКТУРИРОВАН'),
(977, 'СУДЕБН'),
(796, 'СУММ'),
(1383, 'СУЩЕСТВЕН'),
(453, 'СФЕР'),
(941, 'СХЕМ'),
(269, 'СЧЕТ'),
(688, 'СЧЕТОВ'),
(1126, 'США'),
(514, 'ТАКЖ'),
(968, 'ТАМОЖЕН'),
(747, 'ТАРИФ'),
(782, 'ТАРИФН'),
(932, 'ТАРИФОВ'),
(383, 'ТАТЬЯ'),
(311, 'ТЕАТРАЛЬН'),
(678, 'ТЕКУЩ'),
(285, 'ТЕЛЕКОММУНИКАЦИОН'),
(569, 'ТЕЛЕФОН'),
(972, 'ТЕНДЕРН'),
(1385, 'ТЕПЕР'),
(1276, 'ТЕР'),
(1150, 'ТЕРРИТОР'),
(1277, 'ТЕРЯ'),
(1245, 'ТЕХ'),
(708, 'ТЕХНИЧЕСК'),
(213, 'ТЕХНОЛОГ'),
(1396, 'ТЕХПОДДЕРЖК'),
(83, 'ТЕЧЕН'),
(1455, 'ТК'),
(1103, 'ТОВАР'),
(1293, 'ТОВАРОВ'),
(700, 'ТОМ'),
(1419, 'ТОП-100'),
(974, 'ТОРГ'),
(262, 'ТОРГОВ'),
(938, 'ТОРГОВО-ЭКОНОМИЧЕСК'),
(780, 'ТОЧЕК'),
(654, 'ТОЧК'),
(443, 'ТРАДИЦ'),
(1149, 'ТРАНСГРАНИЧН'),
(731, 'ТРАНСПОРТ'),
(1009, 'ТРАНСФЕРАЦ'),
(645, 'ТРАТ'),
(1110, 'ТРЕБОВА'),
(709, 'ТРЕБОВАН'),
(1043, 'ТРЕБОВАТЕЛЬН'),
(1269, 'ТРЕХ'),
(1209, 'ТРУДОВ'),
(1461, 'ТРУДОУСТРОЙСТВ'),
(101, 'ТУРИЗМ'),
(481, 'ТЩАТЕЛЬН'),
(168, 'ТЫС'),
(182, 'ТЫСЯЧ'),
(1372, 'УВАЖА'),
(294, 'УВАЖЕН'),
(1020, 'УВЕЛИЧЕН'),
(177, 'УВЕЛИЧИВА'),
(1033, 'УДЕЛЯ'),
(638, 'УДОБН'),
(1292, 'УДОБСТВ'),
(1231, 'УДОВЛЕТВОР'),
(1351, 'УДОРОЖАН'),
(736, 'УКАЗА'),
(605, 'УЛ'),
(255, 'УНИВЕРСАЛЬН'),
(341, 'УНИВЕРСИТЕТ'),
(1088, 'УПАКОВК'),
(698, 'УПЛАТ'),
(667, 'УПОЛНОМОЧЕН'),
(1091, 'УПОТРЕБЛЕН'),
(264, 'УПРАВЛЕН'),
(1310, 'УПРАВЛЕНЧЕСК'),
(640, 'УПРАВЛЯ'),
(1384, 'УПРОСТ'),
(1092, 'УРОВЕН'),
(469, 'УРОВН'),
(839, 'УСКОРЕН'),
(778, 'УСЛОВ'),
(1093, 'УСЛОВН'),
(47, 'УСЛУГ'),
(67, 'УСПЕШН'),
(175, 'УСТАВН'),
(784, 'УСТАНАВЛИВА'),
(1382, 'УСТАНОВК'),
(847, 'УСТАНОВЛ'),
(958, 'УСТАНОВЛЕН'),
(815, 'УСТОЙЧИВ'),
(858, 'УТВЕРЖДЕН'),
(1166, 'УТРАТ'),
(788, 'УТРЕН'),
(973, 'УЧАСТ'),
(52, 'УЧАСТНИК'),
(222, 'УЧАСТНИКОВ'),
(420, 'УЧЕТ'),
(522, 'УЧРЕЖДЕН'),
(577, 'ФАКС'),
(855, 'ФАКТ'),
(45, 'ФАКТИЧЕСК'),
(202, 'ФЕВРАЛ'),
(1057, 'ФЕДЕРАЛЬН'),
(836, 'ФЕДЕРАЦ'),
(403, 'ФЕДОРОВИЧ'),
(312, 'ФЕСТИВА'),
(92, 'ФИЗИЧЕСК'),
(752, 'ФИКСИРОВА'),
(43, 'ФИЛИА'),
(42, 'ФИЛИАЛ'),
(41, 'ФИЛИАЛОВ'),
(22, 'ФИЛИАЛЬН'),
(456, 'ФИЛОСОФ'),
(333, 'ФИНАНС'),
(263, 'ФИНАНСИРОВАН'),
(34, 'ФИНАНСОВ'),
(1444, 'ФИНАНСОВО-ЭКОНОМИЧЕСК'),
(865, 'ФОНДОВ'),
(215, 'ФОРМ'),
(231, 'ФОРМИР'),
(192, 'ФОРМИРОВАН'),
(1436, 'ФОРМИРУЕМ'),
(560, 'ФОТОГАЛЕРЕ'),
(541, 'ФУНКЦ'),
(1404, 'ФУНКЦИОНИРОВАН'),
(1283, 'ХИЩЕН'),
(419, 'ХОЗЯЙСТВ'),
(818, 'ХОЛДИНГ'),
(817, 'ХОЛДИНГОВ'),
(401, 'ХРАМ'),
(400, 'ХРАМОВ'),
(799, 'ХРАНЕН'),
(62, 'ЦБ'),
(448, 'ЦЕЛ'),
(54, 'ЦЕН'),
(289, 'ЦЕННОСТ'),
(807, 'ЧАС'),
(189, 'ЧАСТ'),
(1337, 'ЧАСТИЧН'),
(247, 'ЧАСТН'),
(1226, 'ЧАСТНОСТ'),
(113, 'ЧЕЛОВЕК'),
(409, 'ЧЕЛОВЕЧЕСК'),
(649, 'ЧЕРЕЗ'),
(496, 'ЧЕСТН'),
(128, 'ЧИСЛ'),
(377, 'ЧЛЕН'),
(376, 'ЧЛЕНОВ'),
(656, 'ШАР'),
(1206, 'ШЕСТ'),
(464, 'ШИРОК'),
(427, 'ШКОЛ'),
(1132, 'ШТРАФ'),
(516, 'ЭКОЛОГИЧЕСК'),
(365, 'ЭКОНОМИК'),
(328, 'ЭКОНОМИЧЕСК'),
(538, 'ЭКРА'),
(1255, 'ЭКСКЛЮЗИВН'),
(1325, 'ЭКСПЕРТ'),
(893, 'ЭКСПЕРТИЗ'),
(1427, 'ЭКСПЕРТН'),
(999, 'ЭКСПОРТН'),
(570, 'ЭЛЕКТРОН'),
(703, 'ЭЛЕКТРОННО-ЦИФРОВ'),
(663, 'ЭЛЕКТРОННОЙ-ЦИФРОВ'),
(1484, 'ЭЛЕМЕНТ'),
(1251, 'ЭЛИТН'),
(885, 'ЭМИТЕНТ'),
(440, 'ЭТИК'),
(502, 'ЭФФЕКТИВН'),
(325, 'ЮР'),
(357, 'ЮРИДИЧЕСК'),
(819, 'ЯВЛ'),
(254, 'ЯВЛЯ'),
(589, 'ЯЗЫК'),
(6, 'ЯНВАР'),
(276, 'ЯЧЕЕК');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_suggest`
--

CREATE TABLE `b_search_suggest` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_tags`
--

CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_user_right`
--

CREATE TABLE `b_search_user_right` (
  `USER_ID` int NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_autolog`
--

CREATE TABLE `b_seo_adv_autolog` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int DEFAULT '0',
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_banner`
--

CREATE TABLE `b_seo_adv_banner` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` mediumtext COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int NOT NULL,
  `GROUP_ID` int DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_campaign`
--

CREATE TABLE `b_seo_adv_campaign` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_group`
--

CREATE TABLE `b_seo_adv_group` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_link`
--

CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int NOT NULL,
  `BANNER_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_log`
--

CREATE TABLE `b_seo_adv_log` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_order`
--

CREATE TABLE `b_seo_adv_order` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int NOT NULL,
  `BANNER_ID` int NOT NULL,
  `ORDER_ID` int NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_region`
--

CREATE TABLE `b_seo_adv_region` (
  `ID` int NOT NULL,
  `ENGINE_ID` int NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `PARENT_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_keywords`
--

CREATE TABLE `b_seo_keywords` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_search_engine`
--

CREATE TABLE `b_seo_search_engine` (
  `ID` int NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_seo_search_engine`
--

INSERT INTO `b_seo_search_engine` (`ID`, `CODE`, `ACTIVE`, `SORT`, `NAME`, `CLIENT_ID`, `CLIENT_SECRET`, `REDIRECT_URI`, `SETTINGS`) VALUES
(1, 'google', 'Y', 200, 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', NULL),
(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', NULL),
(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_log`
--

CREATE TABLE `b_seo_service_log` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_queue`
--

CREATE TABLE `b_seo_service_queue` (
  `ID` int NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `SERVICE_TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` int NOT NULL,
  `SORT` int NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_rtg_queue`
--

CREATE TABLE `b_seo_service_rtg_queue` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCOUNT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PARENT_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_subscription`
--

CREATE TABLE `b_seo_service_subscription` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALLBACK_SERVER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_webhook`
--

CREATE TABLE `b_seo_service_webhook` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap`
--

CREATE TABLE `b_seo_sitemap` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_entity`
--

CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int NOT NULL,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `SITEMAP_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_iblock`
--

CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int NOT NULL,
  `IBLOCK_ID` int NOT NULL,
  `SITEMAP_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_runtime`
--

CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int NOT NULL,
  `PID` int NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_yandex_direct_stat`
--

CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int NOT NULL,
  `CAMPAIGN_ID` int NOT NULL,
  `BANNER_ID` int NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int DEFAULT '0',
  `CLICKS_SEARCH` int DEFAULT '0',
  `CLICKS_CONTEXT` int DEFAULT '0',
  `SHOWS` int DEFAULT '0',
  `SHOWS_SEARCH` int DEFAULT '0',
  `SHOWS_CONTEXT` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_short_uri`
--

CREATE TABLE `b_short_uri` (
  `ID` int NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int NOT NULL,
  `STATUS` int NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_site_template`
--

CREATE TABLE `b_site_template` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_site_template`
--

INSERT INTO `b_site_template` (`ID`, `SITE_ID`, `CONDITION`, `SORT`, `TEMPLATE`) VALUES
(2, 's1', '', 150, '10');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile`
--

CREATE TABLE `b_smile` (
  `ID` int NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int NOT NULL DEFAULT '0',
  `SORT` int NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_smile`
--

INSERT INTO `b_smile` (`ID`, `TYPE`, `SET_ID`, `SORT`, `TYPING`, `CLICKABLE`, `HIDDEN`, `IMAGE`, `IMAGE_DEFINITION`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
(1, 'S', 2, 100, ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', 20, 20),
(2, 'S', 2, 105, ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', 20, 20),
(3, 'S', 2, 110, ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', 20, 20),
(4, 'S', 2, 115, '8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', 20, 20),
(5, 'S', 2, 120, ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', 20, 20),
(6, 'S', 2, 125, ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', 20, 20),
(7, 'S', 2, 130, ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', 20, 20),
(8, 'S', 2, 135, ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', 20, 20),
(9, 'S', 2, 140, ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', 20, 20),
(10, 'S', 2, 145, ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', 20, 20),
(11, 'S', 2, 150, ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', 20, 20),
(12, 'S', 2, 155, ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', 20, 20),
(13, 'S', 2, 160, ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', 20, 20),
(14, 'S', 2, 165, ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', 20, 20),
(15, 'S', 2, 170, ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', 20, 20),
(16, 'S', 2, 175, ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', 20, 20),
(17, 'S', 2, 180, ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', 20, 20),
(18, 'I', 2, 175, 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', 15, 15),
(19, 'I', 2, 180, 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', 15, 15),
(20, 'I', 2, 185, 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', 15, 15),
(21, 'I', 2, 190, 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', 15, 15),
(22, 'I', 2, 195, 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', 15, 15),
(23, 'I', 2, 200, 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', 15, 15),
(24, 'I', 2, 205, 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', 15, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_lang`
--

CREATE TABLE `b_smile_lang` (
  `ID` int NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_smile_lang`
--

INSERT INTO `b_smile_lang` (`ID`, `TYPE`, `SID`, `LID`, `NAME`) VALUES
(1, 'P', 1, 'ru', 'Стандартная галерея'),
(2, 'P', 1, 'en', 'Standard gallery'),
(3, 'G', 2, 'ru', 'Основной набор'),
(4, 'G', 2, 'en', 'Default pack'),
(5, 'S', 1, 'ru', 'С улыбкой'),
(6, 'S', 1, 'en', 'Smile'),
(7, 'S', 2, 'ru', 'Шутливо'),
(8, 'S', 2, 'en', 'Wink'),
(9, 'S', 3, 'ru', 'Широкая улыбка'),
(10, 'S', 3, 'en', 'Big grin'),
(11, 'S', 4, 'ru', 'Здорово'),
(12, 'S', 4, 'en', 'Cool'),
(13, 'S', 5, 'ru', 'Разочарование'),
(14, 'S', 5, 'en', 'Facepalm'),
(15, 'S', 6, 'ru', 'Поцелуй'),
(16, 'S', 6, 'en', 'Kiss'),
(17, 'S', 7, 'ru', 'Печально'),
(18, 'S', 7, 'en', 'Sad'),
(19, 'S', 8, 'ru', 'Скептически'),
(20, 'S', 8, 'en', 'Skeptic'),
(21, 'S', 9, 'ru', 'Смущенный'),
(22, 'S', 9, 'en', 'Embarrassed'),
(23, 'S', 10, 'ru', 'Очень грустно'),
(24, 'S', 10, 'en', 'Crying'),
(25, 'S', 11, 'ru', 'Со злостью'),
(26, 'S', 11, 'en', 'Angry'),
(27, 'S', 12, 'ru', 'Удивленно'),
(28, 'S', 12, 'en', 'Surprised'),
(29, 'S', 13, 'ru', 'Смущенно'),
(30, 'S', 13, 'en', 'Confused'),
(31, 'S', 14, 'ru', 'Идея'),
(32, 'S', 14, 'en', 'Idea'),
(33, 'S', 15, 'ru', 'Вопрос'),
(34, 'S', 15, 'en', 'Question'),
(35, 'S', 16, 'ru', 'Восклицание'),
(36, 'S', 16, 'en', 'Exclamation'),
(37, 'S', 17, 'ru', 'Нравится'),
(38, 'S', 17, 'en', 'Like');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_set`
--

CREATE TABLE `b_smile_set` (
  `ID` int NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '150'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_smile_set`
--

INSERT INTO `b_smile_set` (`ID`, `TYPE`, `PARENT_ID`, `STRING_ID`, `SORT`) VALUES
(1, 'P', 0, 'bitrix', 150),
(2, 'G', 1, 'bitrix_main', 150);

-- --------------------------------------------------------

--
-- Структура таблицы `b_sms_template`
--

CREATE TABLE `b_sms_template` (
  `ID` int NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SENDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECEIVER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_sms_template`
--

INSERT INTO `b_sms_template` (`ID`, `EVENT_NAME`, `ACTIVE`, `SENDER`, `RECEIVER`, `MESSAGE`, `LANGUAGE_ID`) VALUES
(1, 'SMS_USER_CONFIRM_NUMBER', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код подтверждения #CODE#', NULL),
(2, 'SMS_USER_RESTORE_PASSWORD', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код для восстановления пароля #CODE#', NULL),
(3, 'SMS_EVENT_LOG_NOTIFICATION', 'Y', '#DEFAULT_SENDER#', '#PHONE_NUMBER#', '#NAME#: #ADDITIONAL_TEXT# (событий: #EVENT_COUNT#)', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_sms_template_site`
--

CREATE TABLE `b_sms_template_site` (
  `TEMPLATE_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_sms_template_site`
--

INSERT INTO `b_sms_template_site` (`TEMPLATE_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1'),
(3, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_sm_version_history`
--

CREATE TABLE `b_sm_version_history` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `VERSIONS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_ap`
--

CREATE TABLE `b_socialservices_ap` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_contact`
--

CREATE TABLE `b_socialservices_contact` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int NOT NULL,
  `CONTACT_USER_ID` int DEFAULT NULL,
  `CONTACT_XML_ID` int DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_contact_connect`
--

CREATE TABLE `b_socialservices_contact_connect` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int DEFAULT NULL,
  `LINK_ID` int DEFAULT NULL,
  `CONTACT_PROFILE_ID` int NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_message`
--

CREATE TABLE `b_socialservices_message` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `SOCSERV_USER_ID` int NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_user`
--

CREATE TABLE `b_socialservices_user` (
  `ID` int NOT NULL,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` text COLLATE utf8_unicode_ci,
  `OATOKEN_EXPIRES` int DEFAULT NULL,
  `OASECRET` text COLLATE utf8_unicode_ci,
  `REFRESH_TOKEN` text COLLATE utf8_unicode_ci,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_user_link`
--

CREATE TABLE `b_socialservices_user_link` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `SOCSERV_USER_ID` int NOT NULL,
  `LINK_USER_ID` int DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_zoom_meeting`
--

CREATE TABLE `b_socialservices_zoom_meeting` (
  `ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `CONFERENCE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFERENCE_EXTERNAL_ID` bigint UNSIGNED NOT NULL,
  `CONFERENCE_PASSWORD` text COLLATE utf8_unicode_ci,
  `JOINED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFERENCE_CREATED` datetime DEFAULT NULL,
  `CONFERENCE_STARTED` datetime DEFAULT NULL,
  `CONFERENCE_ENDED` datetime DEFAULT NULL,
  `DURATION` int DEFAULT NULL,
  `TITLE` text COLLATE utf8_unicode_ci,
  `SHORT_LINK` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_RECORDING` char(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_zoom_meeting_recording`
--

CREATE TABLE `b_socialservices_zoom_meeting_recording` (
  `ID` int NOT NULL,
  `EXTERNAL_ID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `MEETING_ID` int NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `FILE_TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int NOT NULL,
  `PLAY_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOWNLOAD_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECORDING_TYPE` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `DOWNLOAD_TOKEN` text COLLATE utf8_unicode_ci,
  `PASSWORD` text COLLATE utf8_unicode_ci,
  `FILE_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker`
--

CREATE TABLE `b_sticker` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int NOT NULL,
  `CREATED_BY` int NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int DEFAULT NULL,
  `POS_LEFT` int DEFAULT NULL,
  `WIDTH` int DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `COLOR` int DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int DEFAULT NULL,
  `MARKER_LEFT` int DEFAULT NULL,
  `MARKER_WIDTH` int DEFAULT NULL,
  `MARKER_HEIGHT` int DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker_group_task`
--

CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int NOT NULL,
  `TASK_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_sticker_group_task`
--

INSERT INTO `b_sticker_group_task` (`GROUP_ID`, `TASK_ID`) VALUES
(5, 29);

-- --------------------------------------------------------

--
-- Структура таблицы `b_task`
--

CREATE TABLE `b_task` (
  `ID` int NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_task`
--

INSERT INTO `b_task` (`ID`, `NAME`, `LETTER`, `MODULE_ID`, `SYS`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
(12, 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', NULL, 'module'),
(13, 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', NULL, 'module'),
(14, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
(15, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
(16, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
(17, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
(18, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
(19, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
(20, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
(21, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
(22, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
(23, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
(24, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
(25, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
(26, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
(27, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
(28, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
(29, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
(30, 'hblock_denied', 'D', 'highloadblock', 'Y', NULL, 'module'),
(31, 'hblock_read', 'R', 'highloadblock', 'Y', NULL, 'module'),
(32, 'hblock_write', 'W', 'highloadblock', 'Y', NULL, 'module'),
(33, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
(34, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
(35, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
(36, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
(37, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
(38, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
(39, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
(40, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
(41, 'landing_right_denied', 'D', 'landing', 'Y', NULL, 'module'),
(42, 'landing_right_read', 'R', 'landing', 'Y', NULL, 'module'),
(43, 'landing_right_edit', 'U', 'landing', 'Y', NULL, 'module'),
(44, 'landing_right_sett', 'V', 'landing', 'Y', NULL, 'module'),
(45, 'landing_right_public', 'W', 'landing', 'Y', NULL, 'module'),
(46, 'landing_right_delete', 'X', 'landing', 'Y', NULL, 'module'),
(47, 'seo_denied', 'D', 'seo', 'Y', '', 'module'),
(48, 'seo_edit', 'F', 'seo', 'Y', '', 'module'),
(49, 'seo_full_access', 'W', 'seo', 'Y', '', 'module'),
(50, 'Контент-редакторы', 'Q', 'main', 'N', 'Разрешено изменять информацию в своем профайле. Управление кешем', 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_task_operation`
--

CREATE TABLE `b_task_operation` (
  `TASK_ID` int NOT NULL,
  `OPERATION_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_task_operation`
--

INSERT INTO `b_task_operation` (`TASK_ID`, `OPERATION_ID`) VALUES
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 2),
(5, 3),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(8, 19),
(8, 20),
(8, 21),
(9, 19),
(9, 20),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(11, 19),
(11, 20),
(11, 21),
(11, 24),
(11, 28),
(13, 36),
(13, 37),
(13, 38),
(15, 39),
(16, 39),
(16, 40),
(17, 39),
(17, 40),
(17, 41),
(19, 44),
(19, 45),
(19, 46),
(19, 47),
(19, 48),
(19, 49),
(19, 50),
(19, 52),
(19, 53),
(20, 42),
(20, 43),
(20, 44),
(20, 45),
(20, 46),
(20, 47),
(20, 48),
(20, 49),
(20, 50),
(20, 51),
(20, 52),
(20, 53),
(20, 54),
(22, 55),
(23, 55),
(23, 56),
(23, 60),
(24, 55),
(24, 60),
(24, 61),
(24, 62),
(25, 55),
(25, 56),
(25, 57),
(25, 58),
(25, 60),
(25, 61),
(25, 62),
(26, 55),
(26, 56),
(26, 57),
(26, 58),
(26, 59),
(26, 60),
(26, 61),
(26, 62),
(28, 63),
(29, 63),
(29, 64),
(29, 65),
(29, 66),
(31, 67),
(32, 68),
(32, 69),
(34, 70),
(34, 71),
(35, 72),
(36, 70),
(36, 71),
(36, 73),
(37, 70),
(37, 71),
(37, 72),
(37, 73),
(38, 70),
(38, 71),
(38, 72),
(38, 73),
(38, 74),
(38, 75),
(38, 76),
(38, 77),
(39, 70),
(39, 71),
(39, 72),
(39, 73),
(39, 74),
(39, 75),
(39, 76),
(39, 77),
(39, 78),
(39, 79),
(39, 80),
(39, 81),
(40, 70),
(40, 71),
(40, 72),
(40, 73),
(40, 74),
(40, 75),
(40, 76),
(40, 77),
(40, 78),
(40, 79),
(40, 80),
(40, 81),
(40, 82),
(40, 83),
(40, 84),
(40, 85),
(40, 86),
(40, 87),
(42, 88),
(43, 89),
(44, 90),
(45, 91),
(46, 92),
(48, 94),
(49, 93),
(49, 94),
(50, 2),
(50, 3),
(50, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_diff`
--

CREATE TABLE `b_translate_diff` (
  `ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `PATH_ID` int NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `AGAINST_LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EXCESS_COUNT` int NOT NULL DEFAULT '0',
  `DEFICIENCY_COUNT` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_file`
--

CREATE TABLE `b_translate_file` (
  `ID` int NOT NULL,
  `PATH_ID` int NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FULL_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE_COUNT` int NOT NULL DEFAULT '0',
  `INDEXED` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_path`
--

CREATE TABLE `b_translate_path` (
  `ID` int NOT NULL,
  `PARENT_ID` int NOT NULL DEFAULT '0',
  `DEPTH_LEVEL` int NOT NULL DEFAULT '0',
  `SORT` int NOT NULL DEFAULT '0',
  `PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IS_LANG` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_DIR` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `OBLIGATORY_LANGS` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEXED` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASSIGNMENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_path_lang`
--

CREATE TABLE `b_translate_path_lang` (
  `ID` int NOT NULL,
  `PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_path_tree`
--

CREATE TABLE `b_translate_path_tree` (
  `ID` int NOT NULL,
  `PARENT_ID` int NOT NULL,
  `PATH_ID` int NOT NULL,
  `DEPTH_LEVEL` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_translate_phrase`
--

CREATE TABLE `b_translate_phrase` (
  `ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `PATH_ID` int NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PHRASE` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_entity_editor_config`
--

CREATE TABLE `b_ui_entity_editor_config` (
  `ID` int UNSIGNED NOT NULL,
  `CATEGORY` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_entity_editor_config_ac`
--

CREATE TABLE `b_ui_entity_editor_config_ac` (
  `ID` int UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_undo`
--

CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int DEFAULT NULL,
  `TIMESTAMP_X` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_undo`
--

INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
('108205fad80a36160b384687255ca49d0', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5800:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\"first\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"first\",\n		\"EMAIL_TO\" => \"mallaev.yakov@yandex.ru\",\n		\"EVENT_MESSAGE_ID\" => array(\n		),\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"REQUIRED_FIELDS\" => array(\n			0 => \"NAME\",\n			1 => \"EMAIL\",\n		),\n		\"USE_CAPTCHA\" => \"N\"\n	),\n	false\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\"second\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"second\",\n		\"USE_CAPTCHA\" => \"Y\",\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"EMAIL_TO\" => \"mallaev.yakov@yandex.ru\",\n		\"REQUIRED_FIELDS\" => array(\n		),\n		\"EVENT_MESSAGE_ID\" => array(\n		)\n	),\n	false\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657364711),
('10da85385c8759fe90efe919f6ac65230', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:1845:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"about\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"about\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657350056),
('112d5bacfecdcb12f39d9edeacd272702', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5772:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\",\n	\"first\",\n	Array(\n		\"COMPONENT_TEMPLATE\" => \"first\",\n		\"EMAIL_TO\" => \"mallaev.yakov@yandex.ru\",\n		\"EVENT_MESSAGE_ID\" => array(),\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"REQUIRED_FIELDS\" => array(0=>\"NAME\",1=>\"EMAIL\",),\n		\"USE_CAPTCHA\" => \"Y\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\"second\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"second\",\n		\"USE_CAPTCHA\" => \"Y\",\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"EMAIL_TO\" => \"mallaev.yakov@yandex.ru\",\n		\"REQUIRED_FIELDS\" => array(\n		),\n		\"EVENT_MESSAGE_ID\" => array(\n		)\n	),\n	false\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657364701),
('118379f154096b3be73c776fdfff822d5', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5089:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"reviews\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"N\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\"\n	),\n	false\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657353476),
('1246021bc064dc31894d0e0ef92438743', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:1900:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"about\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"NAME\",\n			1 => \"PREVIEW_TEXT\",\n			2 => \"PREVIEW_PICTURE\",\n			3 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"about\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657350026),
('131d33c8779b13fbafd50cbddcce555f7', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:3454:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"contact\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"contact\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657351782),
('1362e38cc5a5de4eb6ded4816c0b59fb0', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5437:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\"first\", \n	array(\n		\"EMAIL_TO\" => \"mallaev.yakov@yandex.ru\",\n		\"EVENT_MESSAGE_ID\" => array(\n		),\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"REQUIRED_FIELDS\" => array(\n			0 => \"NAME\",\n		),\n		\"USE_CAPTCHA\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"first\"\n	),\n	false\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657355552),
('13bb7c58ee370f230534a3252a91a1328', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5415:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\",\n	\"first\",\n	Array(\n		\"COMPONENT_TEMPLATE\" => \"first\",\n		\"EMAIL_TO\" => \"mallaev.yakov@yandex.ru\",\n		\"EVENT_MESSAGE_ID\" => array(),\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"REQUIRED_FIELDS\" => array(0=>\"NAME\",),\n		\"USE_CAPTCHA\" => \"Y\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657355787),
('1405a52c13035b254a6698ea9b3994b1d', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5502:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\",\n	\"first\",\n	Array(\n		\"COMPONENT_TEMPLATE\" => \"first\",\n		\"EMAIL_TO\" => \"mallaev.yakov@yandex.ru\",\n		\"EVENT_MESSAGE_ID\" => array(),\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"REQUIRED_FIELDS\" => array(0=>\"NAME\",1=>\"EMAIL\",),\n		\"USE_CAPTCHA\" => \"Y\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\",\n	\"\",\nArray()\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657356303);
INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
('14601b200fcbd9e2f9ebf0bdbf6e28f0a', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5049:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657354858),
('157636282fc4a3bd30b1d22c0d0709d6a', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:4998:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\"\",\"\"),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\"\",\"\"),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657351841),
('169957183b241118cbff64d3abe487c52', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5454:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\"first\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"first\",\n		\"EMAIL_TO\" => \"mallaev.yakov@yandex.ru\",\n		\"EVENT_MESSAGE_ID\" => array(\n		),\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"REQUIRED_FIELDS\" => array(\n			0 => \"NAME\",\n			1 => \"EMAIL\",\n		),\n		\"USE_CAPTCHA\" => \"Y\"\n	),\n	false\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657355961),
('174d52103fb211fa803f550685ab12b4c', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5753:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\",\n	\"first\",\n	Array(\n		\"COMPONENT_TEMPLATE\" => \"first\",\n		\"EMAIL_TO\" => \"mallaev.yakov@yandex.ru\",\n                 \"REQUIRED_FIELDS\" => array(\n            0 => \"NAME\",\n            1 => \"EMAIL\",\n            2 => \"MESSAGE\",\n            3 => \"MESSAGE2\",\n            4 => \"user_phone\",\n            5 => \"user_street\",\n            6 => \"user_house\",\n            7 => \"user_porch\",\n            8 => \"user_apartment\",\n             \n        ),\n		\"EVENT_MESSAGE_ID\" => array(),\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"REQUIRED_FIELDS\" => array(0=>\"NAME\",),\n		\"USE_CAPTCHA\" => \"Y\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657355567),
('178e56733ed8fc5d138f8703af9bdd21e', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:1838:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"about\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"SORT\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"about\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657350080),
('17c032ba8d95231931140e91d9fdf610e', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:3366:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\"\",\"\"),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\"\",\"\"),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657350250),
('17ed2259e8ae2f0d8cc2eefaaba2d0939', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:3455:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"contact\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"contact\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657350515),
('186dee1653d26d85fb670fc2d5bca72eb', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:1832:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"about\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"SORT\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"about\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657350091),
('18cac0bcfeaaa941d7ff64753408222f0', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:4998:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\"\",\"\"),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\"\",\"\"),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657352298);
INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
('190f254b3bc76124f86a8cab6e42c9063', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5260:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.map\",\n	\"\",\n	Array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COL_NUM\" => \"1\",\n		\"LEVEL\" => \"1\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_DESCRIPTION\" => \"N\"\n	)\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657354317),
('1963bc3c2e5b21c460f6587916970cc6f', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:1829:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"about\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"about\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657350227),
('1983a2e1a6d583a76ee73625a9f7d13ba', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:3455:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"contact\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"contact\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657350488),
('1a1a93e4d7c4ef8a2977e8815d6f563a4', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:1826:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"about\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"about\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657350133),
('1aba771b5505f67d7b846f321119065e3', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:1828:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"about\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"SORT\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"about\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657350125),
('1bf4fc38b3857f6bf1cdb3f3bee534cde', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5379:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\",\n	\"\",\n	Array(\n		\"EMAIL_TO\" => \"mallaev.yakov@yandex.ru\",\n		\"EVENT_MESSAGE_ID\" => array(),\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"REQUIRED_FIELDS\" => array(\"NAME\",\"EMAIL\"),\n		\"USE_CAPTCHA\" => \"Y\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657355313),
('1cca247799bd02c46da0aa218fe01f5b4', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5089:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"reviews\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\"\n	),\n	false\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657354296),
('1e5e0b459af2c67bb76ac00a5659d01c6', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:5437:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\"first\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"first\",\n		\"EMAIL_TO\" => \"mallaev.yakov@yandex.ru\",\n		\"REQUIRED_FIELDS\" => array(\n			0 => \"NAME\",\n		),\n		\"EVENT_MESSAGE_ID\" => array(\n		),\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"USE_CAPTCHA\" => \"Y\"\n	),\n	false\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"about\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"about\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"reviews\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"reviews\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"N\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"4\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\",\n	\"contact\",\n	Array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"contact\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"N\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(0=>\"\",1=>\"\",),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"5\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(0=>\"\",1=>\"\",),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ID\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\"\n	)\n);?><br>\n <br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657355597),
('1f997d206ae8f8e1eed81fef6c30f6779', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:1900:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\"about\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"NAME\",\n			1 => \"PREVIEW_TEXT\",\n			2 => \"PREVIEW_PICTURE\",\n			3 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \"about\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657348867),
('1f9de8cef580388b1043deb7aa509bedc', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:38:\"C:/OpenServer/domains/bitrix/index.php\";s:7:\"content\";s:1906:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости банка\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news.list\", \n	\".default\", \n	array(\n		\"ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CHECK_DATES\" => \"Y\",\n		\"DETAIL_URL\" => \"\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DISPLAY_DATE\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"DISPLAY_PICTURE\" => \"Y\",\n		\"DISPLAY_PREVIEW_TEXT\" => \"Y\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"FIELD_CODE\" => array(\n			0 => \"NAME\",\n			1 => \"PREVIEW_TEXT\",\n			2 => \"PREVIEW_PICTURE\",\n			3 => \"\",\n		),\n		\"FILTER_NAME\" => \"\",\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"N\",\n		\"IBLOCK_ID\" => \"3\",\n		\"IBLOCK_TYPE\" => \"rest_entity\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"INCLUDE_SUBSECTIONS\" => \"Y\",\n		\"MESSAGE_404\" => \"\",\n		\"NEWS_COUNT\" => \"20\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PARENT_SECTION\" => \"\",\n		\"PARENT_SECTION_CODE\" => \"\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SET_BROWSER_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"SET_META_DESCRIPTION\" => \"Y\",\n		\"SET_META_KEYWORDS\" => \"Y\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SHOW_404\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER1\" => \"ASC\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"STRICT_SECTION_CHECK\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1657349924);
INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
('2736c68c3516034dce4cee41b8da3408a', 'main', 'autosave', 'CAutoSave::_Restore', 'a:311:{s:6:\"filter\";s:1:\"Y\";s:10:\"set_filter\";s:1:\"Y\";s:6:\"Update\";s:1:\"Y\";s:2:\"ID\";s:1:\"1\";s:7:\"VERSION\";s:1:\"1\";s:6:\"ACTIVE\";s:1:\"Y\";s:4:\"save\";s:0:\"\";s:4:\"CODE\";s:17:\"corporate_news_s1\";s:8:\"API_CODE\";s:0:\"\";s:7:\"REST_ON\";s:0:\"\";s:19:\"LIDX000091XX000093X\";a:1:{i:0;s:2:\"s1\";}s:4:\"NAME\";s:19:\"[s1] Новости\";s:4:\"SORT\";s:3:\"500\";s:13:\"LIST_PAGE_URL\";s:16:\"#SITE_DIR#/news/\";s:15:\"DETAIL_PAGE_URL\";s:21:\"#SITE_DIR#/news/#ID#/\";s:18:\"CANONICAL_PAGE_URL\";s:0:\"\";s:13:\"INDEX_ELEMENT\";s:1:\"Y\";s:15:\"SECTION_CHOOSER\";s:1:\"L\";s:9:\"LIST_MODE\";s:0:\"\";s:16:\"EDIT_FILE_BEFORE\";s:0:\"\";s:6:\"browse\";s:0:\"\";s:15:\"EDIT_FILE_AFTER\";s:0:\"\";s:7:\"PICTURE\";s:0:\"\";s:16:\"DESCRIPTION_TYPE\";s:0:\"\";s:11:\"DESCRIPTION\";s:0:\"\";s:77:\"IPROPERTY_TEMPLATESX000091XSECTION_META_TITLEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:80:\"IPROPERTY_TEMPLATESX000091XSECTION_META_KEYWORDSX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:83:\"IPROPERTY_TEMPLATESX000091XSECTION_META_DESCRIPTIONX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:77:\"IPROPERTY_TEMPLATESX000091XSECTION_PAGE_TITLEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:77:\"IPROPERTY_TEMPLATESX000091XELEMENT_META_TITLEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:80:\"IPROPERTY_TEMPLATESX000091XELEMENT_META_KEYWORDSX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:83:\"IPROPERTY_TEMPLATESX000091XELEMENT_META_DESCRIPTIONX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:77:\"IPROPERTY_TEMPLATESX000091XELEMENT_PAGE_TITLEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:83:\"IPROPERTY_TEMPLATESX000091XSECTION_PICTURE_FILE_ALTX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:85:\"IPROPERTY_TEMPLATESX000091XSECTION_PICTURE_FILE_TITLEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:84:\"IPROPERTY_TEMPLATESX000091XSECTION_PICTURE_FILE_NAMEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:81:\"IPROPERTY_TEMPLATESX000091XSECTION_PICTURE_FILE_NAMEX000093XX000091XLOWERX000093X\";s:0:\"\";s:84:\"IPROPERTY_TEMPLATESX000091XSECTION_PICTURE_FILE_NAMEX000093XX000091XTRANSLITX000093X\";s:0:\"\";s:81:\"IPROPERTY_TEMPLATESX000091XSECTION_PICTURE_FILE_NAMEX000093XX000091XSPACEX000093X\";s:0:\"\";s:90:\"IPROPERTY_TEMPLATESX000091XSECTION_DETAIL_PICTURE_FILE_ALTX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:92:\"IPROPERTY_TEMPLATESX000091XSECTION_DETAIL_PICTURE_FILE_TITLEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:91:\"IPROPERTY_TEMPLATESX000091XSECTION_DETAIL_PICTURE_FILE_NAMEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:88:\"IPROPERTY_TEMPLATESX000091XSECTION_DETAIL_PICTURE_FILE_NAMEX000093XX000091XLOWERX000093X\";s:0:\"\";s:91:\"IPROPERTY_TEMPLATESX000091XSECTION_DETAIL_PICTURE_FILE_NAMEX000093XX000091XTRANSLITX000093X\";s:0:\"\";s:88:\"IPROPERTY_TEMPLATESX000091XSECTION_DETAIL_PICTURE_FILE_NAMEX000093XX000091XSPACEX000093X\";s:0:\"\";s:91:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_ALTX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:93:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_TITLEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:92:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_NAMEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:89:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_NAMEX000093XX000091XLOWERX000093X\";s:0:\"\";s:92:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_NAMEX000093XX000091XTRANSLITX000093X\";s:0:\"\";s:89:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_NAMEX000093XX000091XSPACEX000093X\";s:0:\"\";s:90:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_ALTX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:92:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_TITLEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:91:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_NAMEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:88:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_NAMEX000093XX000091XLOWERX000093X\";s:0:\"\";s:91:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_NAMEX000093XX000091XTRANSLITX000093X\";s:0:\"\";s:88:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_NAMEX000093XX000091XSPACEX000093X\";s:0:\"\";s:22:\"IPROPERTY_CLEAR_VALUES\";s:0:\"\";s:63:\"FIELDSX000091XIBLOCK_SECTIONX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:103:\"FIELDSX000091XIBLOCK_SECTIONX000093XX000091XDEFAULT_VALUEX000093XX000091XKEEP_IBLOCK_SECTION_IDX000093X\";s:0:\"\";s:55:\"FIELDSX000091XACTIVEX000093XX000091XIS_REQUIREDX000093X\";s:1:\"Y\";s:57:\"FIELDSX000091XACTIVEX000093XX000091XDEFAULT_VALUEX000093X\";s:1:\"Y\";s:60:\"FIELDSX000091XACTIVE_FROMX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:62:\"FIELDSX000091XACTIVE_FROMX000093XX000091XDEFAULT_VALUEX000093X\";s:6:\"=today\";s:58:\"FIELDSX000091XACTIVE_TOX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:60:\"FIELDSX000091XACTIVE_TOX000093XX000091XDEFAULT_VALUEX000093X\";s:0:\"\";s:53:\"FIELDSX000091XSORTX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:55:\"FIELDSX000091XSORTX000093XX000091XDEFAULT_VALUEX000093X\";s:1:\"0\";s:53:\"FIELDSX000091XNAMEX000093XX000091XIS_REQUIREDX000093X\";s:1:\"Y\";s:55:\"FIELDSX000091XNAMEX000093XX000091XDEFAULT_VALUEX000093X\";s:0:\"\";s:64:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:93:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XFROM_DETAILX000093X\";s:0:\"\";s:100:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XUPDATE_WITH_DETAILX000093X\";s:0:\"\";s:100:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XDELETE_WITH_DETAILX000093X\";s:0:\"\";s:87:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XSCALEX000093X\";s:0:\"\";s:87:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWIDTHX000093X\";s:0:\"\";s:88:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XHEIGHTX000093X\";s:0:\"\";s:95:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XIGNORE_ERRORSX000093X\";s:0:\"\";s:88:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XMETHODX000093X\";s:0:\"\";s:93:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XCOMPRESSIONX000093X\";s:0:\"\";s:100:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XUSE_WATERMARK_FILEX000093X\";s:0:\"\";s:96:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_FILEX000093X\";s:0:\"\";s:102:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_FILE_ALPHAX000093X\";s:0:\"\";s:105:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_FILE_POSITIONX000093X\";s:2:\"tl\";s:100:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XUSE_WATERMARK_TEXTX000093X\";s:0:\"\";s:96:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXTX000093X\";s:0:\"\";s:101:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_FONTX000093X\";s:0:\"\";s:102:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_COLORX000093X\";s:0:\"\";s:101:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_SIZEX000093X\";s:0:\"\";s:105:\"FIELDSX000091XPREVIEW_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_POSITIONX000093X\";s:2:\"tl\";s:66:\"FIELDSX000091XPREVIEW_TEXT_TYPEX000093XX000091XIS_REQUIREDX000093X\";s:1:\"Y\";s:68:\"FIELDSX000091XPREVIEW_TEXT_TYPEX000093XX000091XDEFAULT_VALUEX000093X\";s:4:\"text\";s:81:\"FIELDSX000091XPREVIEW_TEXT_TYPE_ALLOW_CHANGEX000093XX000091XDEFAULT_VALUEX000093X\";s:1:\"Y\";s:61:\"FIELDSX000091XPREVIEW_TEXTX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:63:\"FIELDSX000091XPREVIEW_TEXTX000093XX000091XDEFAULT_VALUEX000093X\";s:0:\"\";s:63:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:86:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XSCALEX000093X\";s:0:\"\";s:86:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWIDTHX000093X\";s:0:\"\";s:87:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XHEIGHTX000093X\";s:0:\"\";s:94:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XIGNORE_ERRORSX000093X\";s:0:\"\";s:87:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XMETHODX000093X\";s:0:\"\";s:92:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XCOMPRESSIONX000093X\";s:0:\"\";s:99:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XUSE_WATERMARK_FILEX000093X\";s:0:\"\";s:95:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_FILEX000093X\";s:0:\"\";s:101:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_FILE_ALPHAX000093X\";s:0:\"\";s:104:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_FILE_POSITIONX000093X\";s:2:\"tl\";s:99:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XUSE_WATERMARK_TEXTX000093X\";s:0:\"\";s:95:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXTX000093X\";s:0:\"\";s:100:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_FONTX000093X\";s:0:\"\";s:101:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_COLORX000093X\";s:0:\"\";s:100:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_SIZEX000093X\";s:0:\"\";s:104:\"FIELDSX000091XDETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_POSITIONX000093X\";s:2:\"tl\";s:65:\"FIELDSX000091XDETAIL_TEXT_TYPEX000093XX000091XIS_REQUIREDX000093X\";s:1:\"Y\";s:67:\"FIELDSX000091XDETAIL_TEXT_TYPEX000093XX000091XDEFAULT_VALUEX000093X\";s:4:\"text\";s:80:\"FIELDSX000091XDETAIL_TEXT_TYPE_ALLOW_CHANGEX000093XX000091XDEFAULT_VALUEX000093X\";s:1:\"Y\";s:60:\"FIELDSX000091XDETAIL_TEXTX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:62:\"FIELDSX000091XDETAIL_TEXTX000093XX000091XDEFAULT_VALUEX000093X\";s:0:\"\";s:55:\"FIELDSX000091XXML_IDX000093XX000091XIS_REQUIREDX000093X\";s:1:\"Y\";s:57:\"FIELDSX000091XXML_IDX000093XX000091XDEFAULT_VALUEX000093X\";s:0:\"\";s:53:\"FIELDSX000091XCODEX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:77:\"FIELDSX000091XCODEX000093XX000091XDEFAULT_VALUEX000093XX000091XUNIQUEX000093X\";s:0:\"\";s:86:\"FIELDSX000091XCODEX000093XX000091XDEFAULT_VALUEX000093XX000091XTRANSLITERATIONX000093X\";s:0:\"\";s:80:\"FIELDSX000091XCODEX000093XX000091XDEFAULT_VALUEX000093XX000091XTRANS_LENX000093X\";s:3:\"100\";s:81:\"FIELDSX000091XCODEX000093XX000091XDEFAULT_VALUEX000093XX000091XTRANS_CASEX000093X\";s:0:\"\";s:82:\"FIELDSX000091XCODEX000093XX000091XDEFAULT_VALUEX000093XX000091XTRANS_SPACEX000093X\";s:0:\"\";s:82:\"FIELDSX000091XCODEX000093XX000091XDEFAULT_VALUEX000093XX000091XTRANS_OTHERX000093X\";s:0:\"\";s:80:\"FIELDSX000091XCODEX000093XX000091XDEFAULT_VALUEX000093XX000091XTRANS_EATX000093X\";s:0:\"\";s:81:\"FIELDSX000091XCODEX000093XX000091XDEFAULT_VALUEX000093XX000091XUSE_GOOGLEX000093X\";s:0:\"\";s:53:\"FIELDSX000091XTAGSX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:55:\"FIELDSX000091XTAGSX000093XX000091XDEFAULT_VALUEX000093X\";s:0:\"\";s:18:\"IB_PROPERTY_1_NAME\";s:16:\"Название\";s:22:\"IB_PROPERTY_1_PROPINFO\";s:564:\"YToxNjp7czo5OiJJQkxPQ0tfSUQiO3M6MToiMSI7czo5OiJGSUxFX1RZUEUiO3M6MDoiIjtzOjk6IkxJU1RfVFlQRSI7czoxOiJMIjtzOjk6IlJPV19DT1VOVCI7czoxOiIxIjtzOjk6IkNPTF9DT1VOVCI7czoyOiIzMCI7czoxNDoiTElOS19JQkxPQ0tfSUQiO3M6MToiMCI7czoxMzoiREVGQVVMVF9WQUxVRSI7czowOiIiO3M6MTY6IldJVEhfREVTQ1JJUFRJT04iO3M6MToiTiI7czoxMDoiU0VBUkNIQUJMRSI7czoxOiJOIjtzOjk6IkZJTFRSQUJMRSI7czoxOiJOIjtzOjEyOiJNVUxUSVBMRV9DTlQiO3M6MToiNSI7czo0OiJISU5UIjtzOjA6IiI7czoxNjoiU0VDVElPTl9QUk9QRVJUWSI7czoxOiJZIjtzOjEyOiJTTUFSVF9GSUxURVIiO3M6MToiTiI7czoxMjoiRElTUExBWV9UWVBFIjtzOjE6IkYiO3M6ODoiRkVBVFVSRVMiO2E6MDp7fX0=\";s:27:\"IB_PROPERTY_1_PROPERTY_TYPE\";s:1:\"S\";s:20:\"IB_PROPERTY_1_ACTIVE\";s:1:\"Y\";s:22:\"IB_PROPERTY_1_MULTIPLE\";s:0:\"\";s:25:\"IB_PROPERTY_1_IS_REQUIRED\";s:0:\"\";s:18:\"IB_PROPERTY_1_SORT\";s:3:\"500\";s:18:\"IB_PROPERTY_1_CODE\";s:7:\"pr_name\";s:17:\"IB_PROPERTY_1_BTN\";s:0:\"\";s:17:\"IB_PROPERTY_1_DEL\";s:0:\"\";s:18:\"IB_PROPERTY_2_NAME\";s:29:\"Дата публикаций\";s:22:\"IB_PROPERTY_2_PROPINFO\";s:528:\"YToxNTp7czo5OiJJQkxPQ0tfSUQiO3M6MToiMSI7czo5OiJGSUxFX1RZUEUiO3M6MDoiIjtzOjk6IkxJU1RfVFlQRSI7czoxOiJMIjtzOjk6IlJPV19DT1VOVCI7czoxOiIxIjtzOjk6IkNPTF9DT1VOVCI7czoyOiIzMCI7czoxNDoiTElOS19JQkxPQ0tfSUQiO3M6MToiMCI7czoxNjoiV0lUSF9ERVNDUklQVElPTiI7czoxOiJOIjtzOjEwOiJTRUFSQ0hBQkxFIjtzOjE6Ik4iO3M6OToiRklMVFJBQkxFIjtzOjE6Ik4iO3M6MTI6Ik1VTFRJUExFX0NOVCI7czoxOiI1IjtzOjQ6IkhJTlQiO3M6MDoiIjtzOjE2OiJTRUNUSU9OX1BST1BFUlRZIjtzOjE6IlkiO3M6MTI6IlNNQVJUX0ZJTFRFUiI7czoxOiJOIjtzOjEyOiJESVNQTEFZX1RZUEUiO3M6MToiVSI7czo4OiJGRUFUVVJFUyI7YTowOnt9fQ==\";s:27:\"IB_PROPERTY_2_PROPERTY_TYPE\";s:10:\"S:DateTime\";s:20:\"IB_PROPERTY_2_ACTIVE\";s:1:\"Y\";s:22:\"IB_PROPERTY_2_MULTIPLE\";s:0:\"\";s:25:\"IB_PROPERTY_2_IS_REQUIRED\";s:0:\"\";s:18:\"IB_PROPERTY_2_SORT\";s:3:\"500\";s:18:\"IB_PROPERTY_2_CODE\";s:7:\"pr_date\";s:17:\"IB_PROPERTY_2_BTN\";s:0:\"\";s:17:\"IB_PROPERTY_2_DEL\";s:0:\"\";s:18:\"IB_PROPERTY_3_NAME\";s:10:\"Анонс\";s:22:\"IB_PROPERTY_3_PROPINFO\";s:684:\"YToxNzp7czo5OiJJQkxPQ0tfSUQiO3M6MToiMSI7czo5OiJGSUxFX1RZUEUiO3M6MDoiIjtzOjk6IkxJU1RfVFlQRSI7czoxOiJMIjtzOjk6IlJPV19DT1VOVCI7czoxOiIxIjtzOjk6IkNPTF9DT1VOVCI7czoyOiIzMCI7czoxNDoiTElOS19JQkxPQ0tfSUQiO3M6MToiMCI7czoxMzoiREVGQVVMVF9WQUxVRSI7YToyOntzOjQ6IlRFWFQiO3M6MDoiIjtzOjQ6IlRZUEUiO3M6NDoiSFRNTCI7fXM6MTg6IlVTRVJfVFlQRV9TRVRUSU5HUyI7YToxOntzOjY6ImhlaWdodCI7aToyMDA7fXM6MTY6IldJVEhfREVTQ1JJUFRJT04iO3M6MToiTiI7czoxMDoiU0VBUkNIQUJMRSI7czoxOiJOIjtzOjk6IkZJTFRSQUJMRSI7czoxOiJOIjtzOjEyOiJNVUxUSVBMRV9DTlQiO3M6MToiNSI7czo0OiJISU5UIjtzOjA6IiI7czoxNjoiU0VDVElPTl9QUk9QRVJUWSI7czoxOiJZIjtzOjEyOiJTTUFSVF9GSUxURVIiO3M6MToiTiI7czoxMjoiRElTUExBWV9UWVBFIjtzOjE6IkYiO3M6ODoiRkVBVFVSRVMiO2E6MDp7fX0=\";s:27:\"IB_PROPERTY_3_PROPERTY_TYPE\";s:6:\"S:HTML\";s:20:\"IB_PROPERTY_3_ACTIVE\";s:1:\"Y\";s:22:\"IB_PROPERTY_3_MULTIPLE\";s:0:\"\";s:25:\"IB_PROPERTY_3_IS_REQUIRED\";s:0:\"\";s:18:\"IB_PROPERTY_3_SORT\";s:3:\"500\";s:18:\"IB_PROPERTY_3_CODE\";s:8:\"pr_anons\";s:17:\"IB_PROPERTY_3_BTN\";s:0:\"\";s:17:\"IB_PROPERTY_3_DEL\";s:0:\"\";s:18:\"IB_PROPERTY_4_NAME\";s:26:\"Ответственный\";s:22:\"IB_PROPERTY_4_PROPINFO\";s:564:\"YToxNjp7czo5OiJJQkxPQ0tfSUQiO3M6MToiMSI7czo5OiJGSUxFX1RZUEUiO3M6MDoiIjtzOjk6IkxJU1RfVFlQRSI7czoxOiJMIjtzOjk6IlJPV19DT1VOVCI7czoxOiIxIjtzOjk6IkNPTF9DT1VOVCI7czoyOiIzMCI7czoxNDoiTElOS19JQkxPQ0tfSUQiO3M6MToiMCI7czoxMzoiREVGQVVMVF9WQUxVRSI7czowOiIiO3M6MTY6IldJVEhfREVTQ1JJUFRJT04iO3M6MToiTiI7czoxMDoiU0VBUkNIQUJMRSI7czoxOiJOIjtzOjk6IkZJTFRSQUJMRSI7czoxOiJOIjtzOjEyOiJNVUxUSVBMRV9DTlQiO3M6MToiNSI7czo0OiJISU5UIjtzOjA6IiI7czoxNjoiU0VDVElPTl9QUk9QRVJUWSI7czoxOiJZIjtzOjEyOiJTTUFSVF9GSUxURVIiO3M6MToiTiI7czoxMjoiRElTUExBWV9UWVBFIjtzOjE6IkYiO3M6ODoiRkVBVFVSRVMiO2E6MDp7fX0=\";s:27:\"IB_PROPERTY_4_PROPERTY_TYPE\";s:1:\"S\";s:20:\"IB_PROPERTY_4_ACTIVE\";s:1:\"Y\";s:22:\"IB_PROPERTY_4_MULTIPLE\";s:0:\"\";s:25:\"IB_PROPERTY_4_IS_REQUIRED\";s:0:\"\";s:18:\"IB_PROPERTY_4_SORT\";s:3:\"500\";s:18:\"IB_PROPERTY_4_CODE\";s:6:\"pr_otv\";s:17:\"IB_PROPERTY_4_BTN\";s:0:\"\";s:17:\"IB_PROPERTY_4_DEL\";s:0:\"\";s:18:\"IB_PROPERTY_5_NAME\";s:10:\"Адрес\";s:22:\"IB_PROPERTY_5_PROPINFO\";s:564:\"YToxNjp7czo5OiJJQkxPQ0tfSUQiO3M6MToiMSI7czo5OiJGSUxFX1RZUEUiO3M6MDoiIjtzOjk6IkxJU1RfVFlQRSI7czoxOiJMIjtzOjk6IlJPV19DT1VOVCI7czoxOiIxIjtzOjk6IkNPTF9DT1VOVCI7czoyOiIzMCI7czoxNDoiTElOS19JQkxPQ0tfSUQiO3M6MToiMCI7czoxMzoiREVGQVVMVF9WQUxVRSI7czowOiIiO3M6MTY6IldJVEhfREVTQ1JJUFRJT04iO3M6MToiTiI7czoxMDoiU0VBUkNIQUJMRSI7czoxOiJOIjtzOjk6IkZJTFRSQUJMRSI7czoxOiJOIjtzOjEyOiJNVUxUSVBMRV9DTlQiO3M6MToiNSI7czo0OiJISU5UIjtzOjA6IiI7czoxNjoiU0VDVElPTl9QUk9QRVJUWSI7czoxOiJZIjtzOjEyOiJTTUFSVF9GSUxURVIiO3M6MToiTiI7czoxMjoiRElTUExBWV9UWVBFIjtzOjE6IkYiO3M6ODoiRkVBVFVSRVMiO2E6MDp7fX0=\";s:27:\"IB_PROPERTY_5_PROPERTY_TYPE\";s:1:\"S\";s:20:\"IB_PROPERTY_5_ACTIVE\";s:1:\"Y\";s:22:\"IB_PROPERTY_5_MULTIPLE\";s:0:\"\";s:25:\"IB_PROPERTY_5_IS_REQUIRED\";s:0:\"\";s:18:\"IB_PROPERTY_5_SORT\";s:3:\"500\";s:18:\"IB_PROPERTY_5_CODE\";s:10:\"pr_address\";s:17:\"IB_PROPERTY_5_BTN\";s:0:\"\";s:17:\"IB_PROPERTY_5_DEL\";s:0:\"\";s:18:\"IB_PROPERTY_6_NAME\";s:36:\"Координаты на карте\";s:22:\"IB_PROPERTY_6_PROPINFO\";s:564:\"YToxNjp7czo5OiJJQkxPQ0tfSUQiO3M6MToiMSI7czo5OiJGSUxFX1RZUEUiO3M6MDoiIjtzOjk6IkxJU1RfVFlQRSI7czoxOiJMIjtzOjk6IlJPV19DT1VOVCI7czoxOiIxIjtzOjk6IkNPTF9DT1VOVCI7czoyOiIzMCI7czoxNDoiTElOS19JQkxPQ0tfSUQiO3M6MToiMCI7czoxMzoiREVGQVVMVF9WQUxVRSI7czowOiIiO3M6MTY6IldJVEhfREVTQ1JJUFRJT04iO3M6MToiTiI7czoxMDoiU0VBUkNIQUJMRSI7czoxOiJOIjtzOjk6IkZJTFRSQUJMRSI7czoxOiJOIjtzOjEyOiJNVUxUSVBMRV9DTlQiO3M6MToiNSI7czo0OiJISU5UIjtzOjA6IiI7czoxNjoiU0VDVElPTl9QUk9QRVJUWSI7czoxOiJZIjtzOjEyOiJTTUFSVF9GSUxURVIiO3M6MToiTiI7czoxMjoiRElTUExBWV9UWVBFIjtzOjE6IkYiO3M6ODoiRkVBVFVSRVMiO2E6MDp7fX0=\";s:27:\"IB_PROPERTY_6_PROPERTY_TYPE\";s:1:\"S\";s:20:\"IB_PROPERTY_6_ACTIVE\";s:1:\"Y\";s:22:\"IB_PROPERTY_6_MULTIPLE\";s:0:\"\";s:25:\"IB_PROPERTY_6_IS_REQUIRED\";s:0:\"\";s:18:\"IB_PROPERTY_6_SORT\";s:3:\"500\";s:18:\"IB_PROPERTY_6_CODE\";s:6:\"pr_map\";s:17:\"IB_PROPERTY_6_BTN\";s:0:\"\";s:17:\"IB_PROPERTY_6_DEL\";s:0:\"\";s:19:\"IB_PROPERTY_n0_NAME\";s:0:\"\";s:23:\"IB_PROPERTY_n0_PROPINFO\";s:724:\"YToyMTp7czo5OiJJQkxPQ0tfSUQiO2k6MDtzOjk6IkZJTEVfVFlQRSI7czowOiIiO3M6OToiTElTVF9UWVBFIjtzOjE6IkwiO3M6OToiUk9XX0NPVU5UIjtzOjE6IjEiO3M6OToiQ09MX0NPVU5UIjtzOjI6IjMwIjtzOjE0OiJMSU5LX0lCTE9DS19JRCI7czoxOiIwIjtzOjEzOiJERUZBVUxUX1ZBTFVFIjtzOjA6IiI7czoxODoiVVNFUl9UWVBFX1NFVFRJTkdTIjthOjA6e31zOjE2OiJXSVRIX0RFU0NSSVBUSU9OIjtzOjA6IiI7czoxMDoiU0VBUkNIQUJMRSI7czowOiIiO3M6OToiRklMVFJBQkxFIjtzOjA6IiI7czoxMjoiTVVMVElQTEVfQ05UIjtzOjE6IjUiO3M6NDoiSElOVCI7czowOiIiO3M6NjoiWE1MX0lEIjtzOjA6IiI7czo2OiJWQUxVRVMiO2E6MDp7fXM6MTY6IlNFQ1RJT05fUFJPUEVSVFkiO3M6MToiWSI7czoxMjoiU01BUlRfRklMVEVSIjtzOjE6Ik4iO3M6MTI6IkRJU1BMQVlfVFlQRSI7czowOiIiO3M6MTY6IkRJU1BMQVlfRVhQQU5ERUQiO3M6MToiTiI7czoxMToiRklMVEVSX0hJTlQiO3M6MDoiIjtzOjg6IkZFQVRVUkVTIjthOjA6e319\";s:28:\"IB_PROPERTY_n0_PROPERTY_TYPE\";s:1:\"S\";s:21:\"IB_PROPERTY_n0_ACTIVE\";s:1:\"Y\";s:23:\"IB_PROPERTY_n0_MULTIPLE\";s:0:\"\";s:26:\"IB_PROPERTY_n0_IS_REQUIRED\";s:0:\"\";s:19:\"IB_PROPERTY_n0_SORT\";s:3:\"500\";s:19:\"IB_PROPERTY_n0_CODE\";s:0:\"\";s:18:\"IB_PROPERTY_n0_BTN\";s:0:\"\";s:19:\"IB_PROPERTY_n1_NAME\";s:0:\"\";s:23:\"IB_PROPERTY_n1_PROPINFO\";s:724:\"YToyMTp7czo5OiJJQkxPQ0tfSUQiO2k6MDtzOjk6IkZJTEVfVFlQRSI7czowOiIiO3M6OToiTElTVF9UWVBFIjtzOjE6IkwiO3M6OToiUk9XX0NPVU5UIjtzOjE6IjEiO3M6OToiQ09MX0NPVU5UIjtzOjI6IjMwIjtzOjE0OiJMSU5LX0lCTE9DS19JRCI7czoxOiIwIjtzOjEzOiJERUZBVUxUX1ZBTFVFIjtzOjA6IiI7czoxODoiVVNFUl9UWVBFX1NFVFRJTkdTIjthOjA6e31zOjE2OiJXSVRIX0RFU0NSSVBUSU9OIjtzOjA6IiI7czoxMDoiU0VBUkNIQUJMRSI7czowOiIiO3M6OToiRklMVFJBQkxFIjtzOjA6IiI7czoxMjoiTVVMVElQTEVfQ05UIjtzOjE6IjUiO3M6NDoiSElOVCI7czowOiIiO3M6NjoiWE1MX0lEIjtzOjA6IiI7czo2OiJWQUxVRVMiO2E6MDp7fXM6MTY6IlNFQ1RJT05fUFJPUEVSVFkiO3M6MToiWSI7czoxMjoiU01BUlRfRklMVEVSIjtzOjE6Ik4iO3M6MTI6IkRJU1BMQVlfVFlQRSI7czowOiIiO3M6MTY6IkRJU1BMQVlfRVhQQU5ERUQiO3M6MToiTiI7czoxMToiRklMVEVSX0hJTlQiO3M6MDoiIjtzOjg6IkZFQVRVUkVTIjthOjA6e319\";s:28:\"IB_PROPERTY_n1_PROPERTY_TYPE\";s:1:\"S\";s:21:\"IB_PROPERTY_n1_ACTIVE\";s:1:\"Y\";s:23:\"IB_PROPERTY_n1_MULTIPLE\";s:0:\"\";s:26:\"IB_PROPERTY_n1_IS_REQUIRED\";s:0:\"\";s:19:\"IB_PROPERTY_n1_SORT\";s:3:\"500\";s:19:\"IB_PROPERTY_n1_CODE\";s:0:\"\";s:18:\"IB_PROPERTY_n1_BTN\";s:0:\"\";s:19:\"IB_PROPERTY_n2_NAME\";s:0:\"\";s:23:\"IB_PROPERTY_n2_PROPINFO\";s:724:\"YToyMTp7czo5OiJJQkxPQ0tfSUQiO2k6MDtzOjk6IkZJTEVfVFlQRSI7czowOiIiO3M6OToiTElTVF9UWVBFIjtzOjE6IkwiO3M6OToiUk9XX0NPVU5UIjtzOjE6IjEiO3M6OToiQ09MX0NPVU5UIjtzOjI6IjMwIjtzOjE0OiJMSU5LX0lCTE9DS19JRCI7czoxOiIwIjtzOjEzOiJERUZBVUxUX1ZBTFVFIjtzOjA6IiI7czoxODoiVVNFUl9UWVBFX1NFVFRJTkdTIjthOjA6e31zOjE2OiJXSVRIX0RFU0NSSVBUSU9OIjtzOjA6IiI7czoxMDoiU0VBUkNIQUJMRSI7czowOiIiO3M6OToiRklMVFJBQkxFIjtzOjA6IiI7czoxMjoiTVVMVElQTEVfQ05UIjtzOjE6IjUiO3M6NDoiSElOVCI7czowOiIiO3M6NjoiWE1MX0lEIjtzOjA6IiI7czo2OiJWQUxVRVMiO2E6MDp7fXM6MTY6IlNFQ1RJT05fUFJPUEVSVFkiO3M6MToiWSI7czoxMjoiU01BUlRfRklMVEVSIjtzOjE6Ik4iO3M6MTI6IkRJU1BMQVlfVFlQRSI7czowOiIiO3M6MTY6IkRJU1BMQVlfRVhQQU5ERUQiO3M6MToiTiI7czoxMToiRklMVEVSX0hJTlQiO3M6MDoiIjtzOjg6IkZFQVRVUkVTIjthOjA6e319\";s:28:\"IB_PROPERTY_n2_PROPERTY_TYPE\";s:1:\"S\";s:21:\"IB_PROPERTY_n2_ACTIVE\";s:1:\"Y\";s:23:\"IB_PROPERTY_n2_MULTIPLE\";s:0:\"\";s:26:\"IB_PROPERTY_n2_IS_REQUIRED\";s:0:\"\";s:19:\"IB_PROPERTY_n2_SORT\";s:3:\"500\";s:19:\"IB_PROPERTY_n2_CODE\";s:0:\"\";s:18:\"IB_PROPERTY_n2_BTN\";s:0:\"\";s:19:\"IB_PROPERTY_n3_NAME\";s:0:\"\";s:23:\"IB_PROPERTY_n3_PROPINFO\";s:724:\"YToyMTp7czo5OiJJQkxPQ0tfSUQiO2k6MDtzOjk6IkZJTEVfVFlQRSI7czowOiIiO3M6OToiTElTVF9UWVBFIjtzOjE6IkwiO3M6OToiUk9XX0NPVU5UIjtzOjE6IjEiO3M6OToiQ09MX0NPVU5UIjtzOjI6IjMwIjtzOjE0OiJMSU5LX0lCTE9DS19JRCI7czoxOiIwIjtzOjEzOiJERUZBVUxUX1ZBTFVFIjtzOjA6IiI7czoxODoiVVNFUl9UWVBFX1NFVFRJTkdTIjthOjA6e31zOjE2OiJXSVRIX0RFU0NSSVBUSU9OIjtzOjA6IiI7czoxMDoiU0VBUkNIQUJMRSI7czowOiIiO3M6OToiRklMVFJBQkxFIjtzOjA6IiI7czoxMjoiTVVMVElQTEVfQ05UIjtzOjE6IjUiO3M6NDoiSElOVCI7czowOiIiO3M6NjoiWE1MX0lEIjtzOjA6IiI7czo2OiJWQUxVRVMiO2E6MDp7fXM6MTY6IlNFQ1RJT05fUFJPUEVSVFkiO3M6MToiWSI7czoxMjoiU01BUlRfRklMVEVSIjtzOjE6Ik4iO3M6MTI6IkRJU1BMQVlfVFlQRSI7czowOiIiO3M6MTY6IkRJU1BMQVlfRVhQQU5ERUQiO3M6MToiTiI7czoxMToiRklMVEVSX0hJTlQiO3M6MDoiIjtzOjg6IkZFQVRVUkVTIjthOjA6e319\";s:28:\"IB_PROPERTY_n3_PROPERTY_TYPE\";s:1:\"S\";s:21:\"IB_PROPERTY_n3_ACTIVE\";s:1:\"Y\";s:23:\"IB_PROPERTY_n3_MULTIPLE\";s:0:\"\";s:26:\"IB_PROPERTY_n3_IS_REQUIRED\";s:0:\"\";s:19:\"IB_PROPERTY_n3_SORT\";s:3:\"500\";s:19:\"IB_PROPERTY_n3_CODE\";s:0:\"\";s:18:\"IB_PROPERTY_n3_BTN\";s:0:\"\";s:19:\"IB_PROPERTY_n4_NAME\";s:0:\"\";s:23:\"IB_PROPERTY_n4_PROPINFO\";s:724:\"YToyMTp7czo5OiJJQkxPQ0tfSUQiO2k6MDtzOjk6IkZJTEVfVFlQRSI7czowOiIiO3M6OToiTElTVF9UWVBFIjtzOjE6IkwiO3M6OToiUk9XX0NPVU5UIjtzOjE6IjEiO3M6OToiQ09MX0NPVU5UIjtzOjI6IjMwIjtzOjE0OiJMSU5LX0lCTE9DS19JRCI7czoxOiIwIjtzOjEzOiJERUZBVUxUX1ZBTFVFIjtzOjA6IiI7czoxODoiVVNFUl9UWVBFX1NFVFRJTkdTIjthOjA6e31zOjE2OiJXSVRIX0RFU0NSSVBUSU9OIjtzOjA6IiI7czoxMDoiU0VBUkNIQUJMRSI7czowOiIiO3M6OToiRklMVFJBQkxFIjtzOjA6IiI7czoxMjoiTVVMVElQTEVfQ05UIjtzOjE6IjUiO3M6NDoiSElOVCI7czowOiIiO3M6NjoiWE1MX0lEIjtzOjA6IiI7czo2OiJWQUxVRVMiO2E6MDp7fXM6MTY6IlNFQ1RJT05fUFJPUEVSVFkiO3M6MToiWSI7czoxMjoiU01BUlRfRklMVEVSIjtzOjE6Ik4iO3M6MTI6IkRJU1BMQVlfVFlQRSI7czowOiIiO3M6MTY6IkRJU1BMQVlfRVhQQU5ERUQiO3M6MToiTiI7czoxMToiRklMVEVSX0hJTlQiO3M6MDoiIjtzOjg6IkZFQVRVUkVTIjthOjA6e319\";s:28:\"IB_PROPERTY_n4_PROPERTY_TYPE\";s:1:\"S\";s:21:\"IB_PROPERTY_n4_ACTIVE\";s:1:\"Y\";s:23:\"IB_PROPERTY_n4_MULTIPLE\";s:0:\"\";s:26:\"IB_PROPERTY_n4_IS_REQUIRED\";s:0:\"\";s:19:\"IB_PROPERTY_n4_SORT\";s:3:\"500\";s:19:\"IB_PROPERTY_n4_CODE\";s:0:\"\";s:18:\"IB_PROPERTY_n4_BTN\";s:0:\"\";s:21:\"IBLOCK_PROPERTY_COUNT\";s:1:\"5\";s:61:\"FIELDSX000091XSECTION_NAMEX000093XX000091XIS_REQUIREDX000093X\";s:1:\"Y\";s:63:\"FIELDSX000091XSECTION_NAMEX000093XX000091XDEFAULT_VALUEX000093X\";s:0:\"\";s:64:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:93:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XFROM_DETAILX000093X\";s:0:\"\";s:100:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XUPDATE_WITH_DETAILX000093X\";s:0:\"\";s:100:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XDELETE_WITH_DETAILX000093X\";s:0:\"\";s:87:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XSCALEX000093X\";s:0:\"\";s:87:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWIDTHX000093X\";s:0:\"\";s:88:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XHEIGHTX000093X\";s:0:\"\";s:95:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XIGNORE_ERRORSX000093X\";s:0:\"\";s:88:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XMETHODX000093X\";s:8:\"resample\";s:93:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XCOMPRESSIONX000093X\";s:2:\"95\";s:100:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XUSE_WATERMARK_FILEX000093X\";s:0:\"\";s:96:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_FILEX000093X\";s:0:\"\";s:102:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_FILE_ALPHAX000093X\";s:0:\"\";s:105:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_FILE_POSITIONX000093X\";s:2:\"tl\";s:100:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XUSE_WATERMARK_TEXTX000093X\";s:0:\"\";s:96:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXTX000093X\";s:0:\"\";s:101:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_FONTX000093X\";s:0:\"\";s:102:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_COLORX000093X\";s:0:\"\";s:101:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_SIZEX000093X\";s:0:\"\";s:105:\"FIELDSX000091XSECTION_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_POSITIONX000093X\";s:2:\"tl\";s:73:\"FIELDSX000091XSECTION_DESCRIPTION_TYPEX000093XX000091XIS_REQUIREDX000093X\";s:1:\"Y\";s:75:\"FIELDSX000091XSECTION_DESCRIPTION_TYPEX000093XX000091XDEFAULT_VALUEX000093X\";s:4:\"text\";s:88:\"FIELDSX000091XSECTION_DESCRIPTION_TYPE_ALLOW_CHANGEX000093XX000091XDEFAULT_VALUEX000093X\";s:1:\"Y\";s:68:\"FIELDSX000091XSECTION_DESCRIPTIONX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:70:\"FIELDSX000091XSECTION_DESCRIPTIONX000093XX000091XDEFAULT_VALUEX000093X\";s:0:\"\";s:71:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:94:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XSCALEX000093X\";s:0:\"\";s:94:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWIDTHX000093X\";s:0:\"\";s:95:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XHEIGHTX000093X\";s:0:\"\";s:102:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XIGNORE_ERRORSX000093X\";s:0:\"\";s:95:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XMETHODX000093X\";s:8:\"resample\";s:100:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XCOMPRESSIONX000093X\";s:2:\"95\";s:107:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XUSE_WATERMARK_FILEX000093X\";s:0:\"\";s:103:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_FILEX000093X\";s:0:\"\";s:109:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_FILE_ALPHAX000093X\";s:0:\"\";s:112:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_FILE_POSITIONX000093X\";s:2:\"tl\";s:107:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XUSE_WATERMARK_TEXTX000093X\";s:0:\"\";s:103:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXTX000093X\";s:0:\"\";s:108:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_FONTX000093X\";s:0:\"\";s:109:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_COLORX000093X\";s:0:\"\";s:108:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_SIZEX000093X\";s:0:\"\";s:112:\"FIELDSX000091XSECTION_DETAIL_PICTUREX000093XX000091XDEFAULT_VALUEX000093XX000091XWATERMARK_TEXT_POSITIONX000093X\";s:2:\"tl\";s:63:\"FIELDSX000091XSECTION_XML_IDX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:65:\"FIELDSX000091XSECTION_XML_IDX000093XX000091XDEFAULT_VALUEX000093X\";s:0:\"\";s:61:\"FIELDSX000091XSECTION_CODEX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:85:\"FIELDSX000091XSECTION_CODEX000093XX000091XDEFAULT_VALUEX000093XX000091XUNIQUEX000093X\";s:0:\"\";s:94:\"FIELDSX000091XSECTION_CODEX000093XX000091XDEFAULT_VALUEX000093XX000091XTRANSLITERATIONX000093X\";s:0:\"\";s:88:\"FIELDSX000091XSECTION_CODEX000093XX000091XDEFAULT_VALUEX000093XX000091XTRANS_LENX000093X\";s:3:\"100\";s:89:\"FIELDSX000091XSECTION_CODEX000093XX000091XDEFAULT_VALUEX000093XX000091XTRANS_CASEX000093X\";s:1:\"L\";s:90:\"FIELDSX000091XSECTION_CODEX000093XX000091XDEFAULT_VALUEX000093XX000091XTRANS_SPACEX000093X\";s:1:\"-\";s:90:\"FIELDSX000091XSECTION_CODEX000093XX000091XDEFAULT_VALUEX000093XX000091XTRANS_OTHERX000093X\";s:1:\"-\";s:88:\"FIELDSX000091XSECTION_CODEX000093XX000091XDEFAULT_VALUEX000093XX000091XTRANS_EATX000093X\";s:1:\"Y\";s:89:\"FIELDSX000091XSECTION_CODEX000093XX000091XDEFAULT_VALUEX000093XX000091XUSE_GOOGLEX000093X\";s:0:\"\";s:11:\"RIGHTS_MODE\";s:0:\"\";s:22:\"GROUPX000091X2X000093X\";s:1:\"R\";s:22:\"GROUPX000091X1X000093X\";s:1:\"X\";s:22:\"GROUPX000091X3X000093X\";s:0:\"\";s:22:\"GROUPX000091X4X000093X\";s:0:\"\";s:22:\"GROUPX000091X5X000093X\";s:1:\"W\";s:13:\"ELEMENTS_NAME\";s:14:\"Новости\";s:12:\"ELEMENT_NAME\";s:14:\"Новость\";s:11:\"ELEMENT_ADD\";s:31:\"Добавить новость\";s:12:\"ELEMENT_EDIT\";s:31:\"Изменить новость\";s:14:\"ELEMENT_DELETE\";s:29:\"Удалить новость\";s:64:\"FIELDSX000091XLOG_SECTION_ADDX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:65:\"FIELDSX000091XLOG_SECTION_EDITX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:67:\"FIELDSX000091XLOG_SECTION_DELETEX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:64:\"FIELDSX000091XLOG_ELEMENT_ADDX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:65:\"FIELDSX000091XLOG_ELEMENT_EDITX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:67:\"FIELDSX000091XLOG_ELEMENT_DELETEX000093XX000091XIS_REQUIREDX000093X\";s:0:\"\";s:5:\"apply\";s:0:\"\";s:6:\"cancel\";s:0:\"\";s:21:\"tabControl_active_tab\";s:5:\"edit2\";}', 1, 1657439956),
('2f8f58db42deb8749de70445271321833', 'main', 'autosave', 'CAutoSave::_Restore', 'a:12:{s:2:\"ID\";s:1:\"0\";s:5:\"EMAIL\";s:20:\"testfi9011@yandex.ru\";s:4:\"NAME\";s:8:\"Сайт\";s:9:\"IS_PUBLIC\";s:0:\"\";s:5:\"login\";s:10:\"testfi9011\";s:6:\"server\";s:14:\"smtp.yandex.ru\";s:4:\"port\";s:3:\"465\";s:8:\"password\";s:0:\"\";s:4:\"save\";s:0:\"\";s:5:\"apply\";s:0:\"\";s:6:\"cancel\";s:0:\"\";s:21:\"tabControl_active_tab\";s:5:\"edit1\";}', 1, 1657358114);

-- --------------------------------------------------------

--
-- Структура таблицы `b_urlpreview_metadata`
--

CREATE TABLE `b_urlpreview_metadata` (
  `ID` int NOT NULL,
  `URL` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IMAGE_ID` int DEFAULT NULL,
  `IMAGE` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci,
  `EXTRA` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_urlpreview_route`
--

CREATE TABLE `b_urlpreview_route` (
  `ID` int NOT NULL,
  `ROUTE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_urlpreview_route`
--

INSERT INTO `b_urlpreview_route` (`ID`, `ROUTE`, `MODULE`, `CLASS`, `PARAMETERS`) VALUES
(1, '/knowledge/#knowledgeCode#/', 'landing', '\\Bitrix\\Landing\\Landing\\UrlPreview', 'a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:9:\"knowledge\";s:12:\"allowSlashes\";s:1:\"N\";}'),
(2, '/knowledge/group/#knowledgeCode#/', 'landing', '\\Bitrix\\Landing\\Landing\\UrlPreview', 'a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:5:\"group\";s:12:\"allowSlashes\";s:1:\"N\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user`
--

CREATE TABLE `b_user` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BLOCKED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PASSWORD_EXPIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user`
--

INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, `NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`, `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`, `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`, `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`, `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`, `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`, `TITLE`, `BX_USER_ID`, `LANGUAGE_ID`, `BLOCKED`, `PASSWORD_EXPIRED`) VALUES
(1, NULL, 'admin', '$6$fXkaAQEX03pVrgN6$nMBLhnm5XbynBmrOYoNryRKQp50qlWlOl0vqu0.7pugi2hkQ/NygMk2AwQPxRLmEUuvnTqnPKk0Plyx93ah6v1', '$6$alkpkII07OQLnrcn$QoINJShLLPpdYaHo8HTP94qTqcuttP.zZueZjzzNVAyOdKXDxRQp5ZCKVBvam9.//fumwSgVVgLS16h0XFLnF.', 'Y', 'Яков', 'Маллаев', 'mallaev.yakov@yandex.ru', '2022-07-10 15:22:33', '2022-07-05 22:49:12', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-05 22:49:12', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access`
--

CREATE TABLE `b_user_access` (
  `ID` bigint UNSIGNED NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_access`
--

INSERT INTO `b_user_access` (`ID`, `USER_ID`, `PROVIDER_ID`, `ACCESS_CODE`) VALUES
(1, 0, 'group', 'G2'),
(2, 1, 'group', 'G1'),
(3, 1, 'group', 'G3'),
(4, 1, 'group', 'G4'),
(5, 1, 'group', 'G2'),
(9, 1, 'user', 'U1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access_check`
--

CREATE TABLE `b_user_access_check` (
  `USER_ID` int DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_auth_action`
--

CREATE TABLE `b_user_auth_action` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `PRIORITY` int NOT NULL DEFAULT '100',
  `ACTION` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_auth_code`
--

CREATE TABLE `b_user_auth_code` (
  `USER_ID` int NOT NULL,
  `CODE_TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  `OTP_SECRET` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int DEFAULT '0',
  `DATE_SENT` datetime DEFAULT NULL,
  `DATE_RESENT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_counter`
--

CREATE TABLE `b_user_counter` (
  `USER_ID` int NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_digest`
--

CREATE TABLE `b_user_digest` (
  `USER_ID` int NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field`
--

CREATE TABLE `b_user_field` (
  `ID` int NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_confirm`
--

CREATE TABLE `b_user_field_confirm` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `DATE_CHANGE` timestamp NULL DEFAULT NULL,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ATTEMPTS` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_enum`
--

CREATE TABLE `b_user_field_enum` (
  `ID` int NOT NULL,
  `USER_FIELD_ID` int DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_lang`
--

CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_permission`
--

CREATE TABLE `b_user_field_permission` (
  `ID` int UNSIGNED NOT NULL,
  `ENTITY_TYPE_ID` tinyint UNSIGNED NOT NULL,
  `USER_FIELD_ID` int UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `PERMISSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_group`
--

CREATE TABLE `b_user_group` (
  `USER_ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_group`
--

INSERT INTO `b_user_group` (`USER_ID`, `GROUP_ID`, `DATE_ACTIVE_FROM`, `DATE_ACTIVE_TO`) VALUES
(1, 1, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_hit_auth`
--

CREATE TABLE `b_user_hit_auth` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `VALID_UNTIL` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_index`
--

CREATE TABLE `b_user_index` (
  `USER_ID` int NOT NULL,
  `SEARCH_USER_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_DEPARTMENT_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_ADMIN_CONTENT` text COLLATE utf8_unicode_ci,
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_index`
--

INSERT INTO `b_user_index` (`USER_ID`, `SEARCH_USER_CONTENT`, `SEARCH_DEPARTMENT_CONTENT`, `SEARCH_ADMIN_CONTENT`, `NAME`, `LAST_NAME`, `SECOND_NAME`, `WORK_POSITION`, `UF_DEPARTMENT_NAME`) VALUES
(1, '001 Яков Маллаев ', '', '001 Яков Маллаев znyynri lnxbi lnaqrk znyynri.lnxbi@lnaqrk.eh nqzva', 'Яков', 'Маллаев', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_option`
--

CREATE TABLE `b_user_option` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_option`
--

INSERT INTO `b_user_option` (`ID`, `USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`) VALUES
(1, 0, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:8:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_SITESPEED@666666777\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}}}}', 'Y'),
(2, 0, 'main.interface', 'global', 'a:1:{s:5:\"theme\";s:4:\"gray\";}', 'Y'),
(3, 1, 'admin_panel', 'settings', 'a:2:{s:4:\"edit\";s:3:\"off\";s:9:\"collapsed\";s:3:\"off\";}', 'N'),
(4, 1, 'hot_keys', 'user_defined', 'b:1;', 'N'),
(5, 1, 'html_editor', 'user_settings_', 'a:3:{s:14:\"split_vertical\";s:1:\"1\";s:4:\"view\";s:5:\"split\";s:13:\"taskbar_shown\";s:1:\"1\";}', 'N'),
(6, 1, 'fileman', 'code_editor', 'a:1:{s:5:\"theme\";s:5:\"light\";}', 'N'),
(8, 1, 'socialservices', 'networkPopup', 'a:1:{s:9:\"showcount\";s:1:\"5\";}', 'N'),
(11, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:\"stick\";s:1:\"Y\";}', 'N'),
(12, 1, 'admin_menu', 'pos', 'a:1:{s:8:\"sections\";s:252:\"menu_iblock,menu_iblock_/vacancies,iblock_admin,menu_iblock_/rest_entity,menu_iblock_%2Fvacancies%2F2,menu_iblock_%2Frest_entity%2F3,menu_iblock_%2Frest_entity%2F5,menu_iblock_%2Frest_entity%2F4,menu_system,menu_templates,menu_landing,menu_iblock_/news\";}', 'N'),
(15, 1, 'bx.windowmanager.9.5', 'size_/bitrix/admin/component_props.php', 'a:2:{s:5:\"width\";s:3:\"957\";s:6:\"height\";s:3:\"406\";}', 'N'),
(24, 1, 'main.ui.filter', 'tbl_iblock_section_126c4dc60c074e76ab4941492195c5fa', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}}}', 'N'),
(30, 1, 'main.interface.grid', 'tbl_iblock_section_126c4dc60c074e76ab4941492195c5fa', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(31, 1, 'main.ui.filter', 'tbl_iblock_element_126c4dc60c074e76ab4941492195c5fa', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:14:\"default_filter\";a:0:{}}}', 'N'),
(36, 1, 'main.interface.grid', 'tbl_iblock_element_126c4dc60c074e76ab4941492195c5fa', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(57, 1, 'main.interface.grid', 'tbl_iblock_admin_46b3931b9959c927df4fc65fdee94b07', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(59, 1, 'main.interface.grid', 'tbl_iblock_admin_750dd17d83198dd551018232269fa242', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(66, 1, 'main.ui.filter', 'tbl_iblock_section_5ee644eec4b6e7ed627feaa7c5d599f3', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}}}', 'N'),
(72, 1, 'main.interface.grid', 'tbl_iblock_section_5ee644eec4b6e7ed627feaa7c5d599f3', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(84, 1, 'main.ui.filter', 'tbl_iblock_element_5ee644eec4b6e7ed627feaa7c5d599f3', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:14:\"default_filter\";a:0:{}}}', 'N'),
(89, 1, 'main.interface.grid', 'tbl_iblock_element_5ee644eec4b6e7ed627feaa7c5d599f3', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(124, 1, 'main.ui.filter', 'tbl_iblock_section_dcf30f2eb438272ba49ed1b3f172d6d0', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}}}', 'N'),
(130, 1, 'main.interface.grid', 'tbl_iblock_section_dcf30f2eb438272ba49ed1b3f172d6d0', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(133, 1, 'main.ui.filter', 'tbl_iblock_section_4bc2c6e0eee632b28ac63d940a4d22fd', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}}}', 'N'),
(139, 1, 'main.interface.grid', 'tbl_iblock_section_4bc2c6e0eee632b28ac63d940a4d22fd', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(146, 1, 'main.ui.filter', 'tbl_iblock_element_4bc2c6e0eee632b28ac63d940a4d22fd', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:14:\"default_filter\";a:0:{}}}', 'N'),
(151, 1, 'main.interface.grid', 'tbl_iblock_element_4bc2c6e0eee632b28ac63d940a4d22fd', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(198, 1, 'main.ui.filter', 'tbl_iblock_element_dcf30f2eb438272ba49ed1b3f172d6d0', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:14:\"default_filter\";a:0:{}}}', 'N'),
(203, 1, 'main.interface.grid', 'tbl_iblock_element_dcf30f2eb438272ba49ed1b3f172d6d0', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(211, 1, 'bx.windowmanager.9.5', 'size_/bitrix/admin/public_file_edit.php', 'a:2:{s:5:\"width\";s:3:\"998\";s:6:\"height\";s:3:\"422\";}', 'N'),
(244, 1, 'main.interface.grid', 'tbl_iblock_element_d1cb75b5aaf00401fd4a48cc75b13ebc', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(251, 1, 'main.interface.grid', 'tbl_iblock_admin_508c75c8507a2ae5223dfd2faeb98122', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(254, 1, 'main.interface.grid', 'tbl_iblock_element_476f74660a5379f8abc3748ef3fd5e19', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_password`
--

CREATE TABLE `b_user_password` (
  `ID` bigint NOT NULL,
  `USER_ID` bigint NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CHANGE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_password`
--

INSERT INTO `b_user_password` (`ID`, `USER_ID`, `PASSWORD`, `DATE_CHANGE`) VALUES
(1, 1, '$6$fXkaAQEX03pVrgN6$nMBLhnm5XbynBmrOYoNryRKQp50qlWlOl0vqu0.7pugi2hkQ/NygMk2AwQPxRLmEUuvnTqnPKk0Plyx93ah6v1', '2022-07-05 18:49:12');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_phone_auth`
--

CREATE TABLE `b_user_phone_auth` (
  `USER_ID` int NOT NULL,
  `PHONE_NUMBER` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `OTP_SECRET` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int DEFAULT '0',
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DATE_SENT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_profile_history`
--

CREATE TABLE `b_user_profile_history` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `EVENT_TYPE` int DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `UPDATED_BY_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_profile_record`
--

CREATE TABLE `b_user_profile_record` (
  `ID` int NOT NULL,
  `HISTORY_ID` int NOT NULL,
  `FIELD` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_session`
--

CREATE TABLE `b_user_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_stored_auth`
--

CREATE TABLE `b_user_stored_auth` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_stored_auth`
--

INSERT INTO `b_user_stored_auth` (`ID`, `USER_ID`, `DATE_REG`, `LAST_AUTH`, `STORED_HASH`, `TEMP_HASH`, `IP_ADDR`) VALUES
(1, 1, '2022-07-05 22:49:14', '2022-07-05 22:49:14', 'c0238b6745d26463ffab68e8670a43a3', 'N', 2130706433);

-- --------------------------------------------------------

--
-- Структура таблицы `b_xml_tree`
--

CREATE TABLE `b_xml_tree` (
  `ID` bigint NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  `LEFT_MARGIN` int DEFAULT NULL,
  `RIGHT_MARGIN` int DEFAULT NULL,
  `DEPTH_LEVEL` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `ATTRIBUTES` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_xml_tree`
--

INSERT INTO `b_xml_tree` (`ID`, `PARENT_ID`, `LEFT_MARGIN`, `RIGHT_MARGIN`, `DEPTH_LEVEL`, `NAME`, `VALUE`, `ATTRIBUTES`) VALUES
(1, 0, 1, 320, 0, 'КоммерческаяИнформация', NULL, 'a:2:{s:22:\"ВерсияСхемы\";s:5:\"2.021\";s:32:\"ДатаФормирования\";s:19:\"2010-06-22T12:53:42\";}'),
(2, 1, 2, 67, 1, 'Классификатор', NULL, NULL),
(3, 2, 3, 4, 2, 'Ид', '2', NULL),
(4, 2, 5, 6, 2, 'Наименование', 'Вакансии', NULL),
(5, 2, 7, 64, 2, 'Свойства', NULL, NULL),
(6, 5, 8, 15, 3, 'Свойство', NULL, NULL),
(7, 6, 9, 10, 4, 'Ид', 'CML2_ACTIVE', NULL),
(8, 6, 11, 12, 4, 'Наименование', 'БитриксАктивность', NULL),
(9, 6, 13, 14, 4, 'Множественное', 'false', NULL),
(10, 5, 16, 23, 3, 'Свойство', NULL, NULL),
(11, 10, 17, 18, 4, 'Ид', 'CML2_CODE', NULL),
(12, 10, 19, 20, 4, 'Наименование', 'Символьный код', NULL),
(13, 10, 21, 22, 4, 'Множественное', 'false', NULL),
(14, 5, 24, 31, 3, 'Свойство', NULL, NULL),
(15, 14, 25, 26, 4, 'Ид', 'CML2_SORT', NULL),
(16, 14, 27, 28, 4, 'Наименование', 'Сортировка', NULL),
(17, 14, 29, 30, 4, 'Множественное', 'false', NULL),
(18, 5, 32, 39, 3, 'Свойство', NULL, NULL),
(19, 18, 33, 34, 4, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(20, 18, 35, 36, 4, 'Наименование', 'Начало активности', NULL),
(21, 18, 37, 38, 4, 'Множественное', 'false', NULL),
(22, 5, 40, 47, 3, 'Свойство', NULL, NULL),
(23, 22, 41, 42, 4, 'Ид', 'CML2_ACTIVE_TO', NULL),
(24, 22, 43, 44, 4, 'Наименование', 'Окончание активности', NULL),
(25, 22, 45, 46, 4, 'Множественное', 'false', NULL),
(26, 5, 48, 55, 3, 'Свойство', NULL, NULL),
(27, 26, 49, 50, 4, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(28, 26, 51, 52, 4, 'Наименование', 'Анонс', NULL),
(29, 26, 53, 54, 4, 'Множественное', 'false', NULL),
(30, 5, 56, 63, 3, 'Свойство', NULL, NULL),
(31, 30, 57, 58, 4, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(32, 30, 59, 60, 4, 'Наименование', 'Картинка анонса', NULL),
(33, 30, 61, 62, 4, 'Множественное', 'false', NULL),
(34, 2, 65, 66, 2, 'Группы', NULL, NULL),
(35, 1, 68, 319, 1, 'Каталог', NULL, NULL),
(36, 35, 69, 70, 2, 'Ид', 'corp_vacancies', NULL),
(37, 35, 71, 72, 2, 'ИдКлассификатора', '2', NULL),
(38, 35, 73, 74, 2, 'Наименование', 'Вакансии', NULL),
(39, 35, 75, 76, 2, 'БитриксКод', 'corp_vacancies', NULL),
(40, 35, 77, 78, 2, 'БитриксСортировка', '500', NULL),
(41, 35, 79, 80, 2, 'БитриксURLСписок', '#SITE_DIR#/about/vacancies.php', NULL),
(42, 35, 81, 82, 2, 'БитриксURLДеталь', '#SITE_DIR#/about/vacancies.php##ID#', NULL),
(43, 35, 83, 84, 2, 'БитриксURLРаздел', NULL, NULL),
(44, 35, 85, 86, 2, 'БитриксКартинка', NULL, NULL),
(45, 35, 87, 88, 2, 'БитриксИндексироватьЭлементы', 'true', NULL),
(46, 35, 89, 90, 2, 'БитриксИндексироватьРазделы', 'false', NULL),
(47, 35, 91, 92, 2, 'БитриксДокументооборот', 'false', NULL),
(48, 35, 93, 154, 2, 'БитриксПодписи', NULL, NULL),
(49, 48, 94, 99, 3, 'БитриксПодпись', NULL, NULL),
(50, 49, 95, 96, 4, 'Ид', 'ELEMENT_NAME', NULL),
(51, 49, 97, 98, 4, 'Значение', 'Вакансия', NULL),
(52, 48, 100, 105, 3, 'БитриксПодпись', NULL, NULL),
(53, 52, 101, 102, 4, 'Ид', 'ELEMENTS_NAME', NULL),
(54, 52, 103, 104, 4, 'Значение', 'Вакансии', NULL),
(55, 48, 106, 111, 3, 'БитриксПодпись', NULL, NULL),
(56, 55, 107, 108, 4, 'Ид', 'ELEMENT_ADD', NULL),
(57, 55, 109, 110, 4, 'Значение', 'Добавить вакансию', NULL),
(58, 48, 112, 117, 3, 'БитриксПодпись', NULL, NULL),
(59, 58, 113, 114, 4, 'Ид', 'ELEMENT_EDIT', NULL),
(60, 58, 115, 116, 4, 'Значение', 'Изменить вакансию', NULL),
(61, 48, 118, 123, 3, 'БитриксПодпись', NULL, NULL),
(62, 61, 119, 120, 4, 'Ид', 'ELEMENT_DELETE', NULL),
(63, 61, 121, 122, 4, 'Значение', 'Удалить вакансию', NULL),
(64, 48, 124, 129, 3, 'БитриксПодпись', NULL, NULL),
(65, 64, 125, 126, 4, 'Ид', 'SECTION_NAME', NULL),
(66, 64, 127, 128, 4, 'Значение', 'Раздел', NULL),
(67, 48, 130, 135, 3, 'БитриксПодпись', NULL, NULL),
(68, 67, 131, 132, 4, 'Ид', 'SECTIONS_NAME', NULL),
(69, 67, 133, 134, 4, 'Значение', 'Разделы', NULL),
(70, 48, 136, 141, 3, 'БитриксПодпись', NULL, NULL),
(71, 70, 137, 138, 4, 'Ид', 'SECTION_ADD', NULL),
(72, 70, 139, 140, 4, 'Значение', 'Добавить раздел', NULL),
(73, 48, 142, 147, 3, 'БитриксПодпись', NULL, NULL),
(74, 73, 143, 144, 4, 'Ид', 'SECTION_EDIT', NULL),
(75, 73, 145, 146, 4, 'Значение', 'Изменить раздел', NULL),
(76, 48, 148, 153, 3, 'БитриксПодпись', NULL, NULL),
(77, 76, 149, 150, 4, 'Ид', 'SECTION_DELETE', NULL),
(78, 76, 151, 152, 4, 'Значение', 'Удалить раздел', NULL),
(79, 35, 155, 318, 2, 'Товары', NULL, NULL),
(80, 79, 156, 209, 3, 'Товар', NULL, NULL),
(81, 80, 157, 158, 4, 'Ид', '2', NULL),
(82, 80, 159, 160, 4, 'Наименование', 'Главный специалист Отдела анализа кредитных проектов региональной сети', NULL),
(83, 80, 161, 162, 4, 'БитриксТеги', NULL, NULL),
(84, 80, 163, 164, 4, 'Описание', '<b>Требования</b> 						 						 \n<p>Высшее экономическое/финансовое образование, опыт в банках топ-100 не менее 3-х лет в кредитном отделе (анализ заемщиков), желателен опыт работы с кредитными заявками филиалов, знание технологий АФХД предприятий, навыки написания экспертного заключения, знание законодательства (в т.ч. Положение ЦБ № 254-П).</p>\n 						 						<b>Обязанности</b> 						 \n<p>Анализ кредитных проектов филиалов Банка, подготовка предложений по структурированию кредитных проектов, оценка полноты и качества формируемых филиалами заключений, выявление стоп-факторов, доработка заявок филиалов в соответствии со стандартами Банка, подготовка заключения (рекомендаций) на КК по заявкам филиалов в части оценки финансово-экономического состояния заемщика, защита проектов на КК Банка, консультирование и методологическая помощь филиалам Банка в части корпоративного кредитования.</p>\n 						 						<b>Условия</b> 						 \n<p> Место работы: М.Парк Культуры. Графики работы: пятидневная рабочая неделя, с 9:00 до 18:00, пт. до 16:45. Зарплата: 50000 руб. оклад + премии, полный соц. пакет,оформление согласно ТК РФ</p>\n ', NULL),
(85, 80, 165, 208, 4, 'ЗначенияСвойств', NULL, NULL),
(86, 85, 166, 171, 5, 'ЗначенияСвойства', NULL, NULL),
(87, 86, 167, 168, 6, 'Ид', 'CML2_ACTIVE', NULL),
(88, 86, 169, 170, 6, 'Значение', 'true', NULL),
(89, 85, 172, 177, 5, 'ЗначенияСвойства', NULL, NULL),
(90, 89, 173, 174, 6, 'Ид', 'CML2_CODE', NULL),
(91, 89, 175, 176, 6, 'Значение', NULL, NULL),
(92, 85, 178, 183, 5, 'ЗначенияСвойства', NULL, NULL),
(93, 92, 179, 180, 6, 'Ид', 'CML2_SORT', NULL),
(94, 92, 181, 182, 6, 'Значение', '200', NULL),
(95, 85, 184, 189, 5, 'ЗначенияСвойства', NULL, NULL),
(96, 95, 185, 186, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(97, 95, 187, 188, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(98, 85, 190, 195, 5, 'ЗначенияСвойства', NULL, NULL),
(99, 98, 191, 192, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(100, 98, 193, 194, 6, 'Значение', NULL, NULL),
(101, 85, 196, 201, 5, 'ЗначенияСвойства', NULL, NULL),
(102, 101, 197, 198, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(103, 101, 199, 200, 6, 'Значение', NULL, NULL),
(104, 85, 202, 207, 5, 'ЗначенияСвойства', NULL, NULL),
(105, 104, 203, 204, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(106, 104, 205, 206, 6, 'Значение', NULL, NULL),
(107, 79, 210, 263, 3, 'Товар', NULL, NULL),
(108, 107, 211, 212, 4, 'Ид', '3', NULL),
(109, 107, 213, 214, 4, 'Наименование', 'Специалист по продажам розничных банковских продуктов', NULL),
(110, 107, 215, 216, 4, 'БитриксТеги', NULL, NULL),
(111, 107, 217, 218, 4, 'Описание', '<b>Требования</b> 						 						 \n<p>Высшее экономического образования ‚ опыт работы в сфере продаж банковских продуктов‚ опытный пользователь ПК‚ этика делового общения‚ ответственность‚ инициативность‚ активность.</p>\n 						 						<b>Обязанности</b> 						 \n<p>Продажа розничных банковских продуктов, оформление документов.</p>\n 						 						<b>Условия</b> 						 \n<p>Трудоустройство по ТК РФ‚ полный соц. пакет. График работы: пятидневная рабочая неделя. Зарплата: 20000 руб. оклад + премии</p>\n ', NULL),
(112, 107, 219, 262, 4, 'ЗначенияСвойств', NULL, NULL),
(113, 112, 220, 225, 5, 'ЗначенияСвойства', NULL, NULL),
(114, 113, 221, 222, 6, 'Ид', 'CML2_ACTIVE', NULL),
(115, 113, 223, 224, 6, 'Значение', 'true', NULL),
(116, 112, 226, 231, 5, 'ЗначенияСвойства', NULL, NULL),
(117, 116, 227, 228, 6, 'Ид', 'CML2_CODE', NULL),
(118, 116, 229, 230, 6, 'Значение', NULL, NULL),
(119, 112, 232, 237, 5, 'ЗначенияСвойства', NULL, NULL),
(120, 119, 233, 234, 6, 'Ид', 'CML2_SORT', NULL),
(121, 119, 235, 236, 6, 'Значение', '300', NULL),
(122, 112, 238, 243, 5, 'ЗначенияСвойства', NULL, NULL),
(123, 122, 239, 240, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(124, 122, 241, 242, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(125, 112, 244, 249, 5, 'ЗначенияСвойства', NULL, NULL),
(126, 125, 245, 246, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(127, 125, 247, 248, 6, 'Значение', NULL, NULL),
(128, 112, 250, 255, 5, 'ЗначенияСвойства', NULL, NULL),
(129, 128, 251, 252, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(130, 128, 253, 254, 6, 'Значение', NULL, NULL),
(131, 112, 256, 261, 5, 'ЗначенияСвойства', NULL, NULL),
(132, 131, 257, 258, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(133, 131, 259, 260, 6, 'Значение', NULL, NULL),
(134, 79, 264, 317, 3, 'Товар', NULL, NULL),
(135, 134, 265, 266, 4, 'Ид', '4', NULL),
(136, 134, 267, 268, 4, 'Наименование', 'Специалист Отдела андеррайтинга', NULL),
(137, 134, 269, 270, 4, 'БитриксТеги', NULL, NULL),
(138, 134, 271, 272, 4, 'Описание', '<b>Требования</b> 						 						 \n<p>Высшее профессиональное образование, опыт работы от 2 лет в отделе по работе с физическими и юридическими лицами Банков, связанных с анализом платёжеспособности и кредитоспособности физических и юридических лиц.</p>\n 						 						<b>Обязанности</b> 						 \n<p>Проверка соответствия документов, предоставленных клиентами Банка, анализ информации о риске</p>\n 						 						<b>Условия</b> 						 \n<p>Трудоустройство по ТК РФ‚ полный соц. пакет. График работы: пятидневная рабочая неделя. Зарплата: оклад 25000 руб.</p>\n ', NULL),
(139, 134, 273, 316, 4, 'ЗначенияСвойств', NULL, NULL),
(140, 139, 274, 279, 5, 'ЗначенияСвойства', NULL, NULL),
(141, 140, 275, 276, 6, 'Ид', 'CML2_ACTIVE', NULL),
(142, 140, 277, 278, 6, 'Значение', 'true', NULL),
(143, 139, 280, 285, 5, 'ЗначенияСвойства', NULL, NULL),
(144, 143, 281, 282, 6, 'Ид', 'CML2_CODE', NULL),
(145, 143, 283, 284, 6, 'Значение', NULL, NULL),
(146, 139, 286, 291, 5, 'ЗначенияСвойства', NULL, NULL),
(147, 146, 287, 288, 6, 'Ид', 'CML2_SORT', NULL),
(148, 146, 289, 290, 6, 'Значение', '400', NULL),
(149, 139, 292, 297, 5, 'ЗначенияСвойства', NULL, NULL),
(150, 149, 293, 294, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(151, 149, 295, 296, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(152, 139, 298, 303, 5, 'ЗначенияСвойства', NULL, NULL),
(153, 152, 299, 300, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(154, 152, 301, 302, 6, 'Значение', NULL, NULL),
(155, 139, 304, 309, 5, 'ЗначенияСвойства', NULL, NULL),
(156, 155, 305, 306, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(157, 155, 307, 308, 6, 'Значение', NULL, NULL),
(158, 139, 310, 315, 5, 'ЗначенияСвойства', NULL, NULL),
(159, 158, 311, 312, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(160, 158, 313, 314, 6, 'Значение', NULL, NULL),
(161, 0, 4, 0, 0, '', NULL, NULL),
(162, 0, 5, 0, 0, '', NULL, NULL),
(163, 0, 6, 0, 0, '', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `b_admin_notify`
--
ALTER TABLE `b_admin_notify`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_AD_TAG` (`TAG`);

--
-- Индексы таблицы `b_admin_notify_lang`
--
ALTER TABLE `b_admin_notify_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  ADD KEY `IX_ADM_NTFY_LID` (`LID`);

--
-- Индексы таблицы `b_agent`
--
ALTER TABLE `b_agent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  ADD KEY `ix_agent_user_id` (`USER_ID`),
  ADD KEY `ix_agent_name` (`NAME`(100));

--
-- Индексы таблицы `b_app_password`
--
ALTER TABLE `b_app_password`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_app_password_user` (`USER_ID`);

--
-- Индексы таблицы `b_b24connector_buttons`
--
ALTER TABLE `b_b24connector_buttons`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_b24connector_button_site`
--
ALTER TABLE `b_b24connector_button_site`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_BUTTON_ID` (`BUTTON_ID`);

--
-- Индексы таблицы `b_bitrixcloud_option`
--
ALTER TABLE `b_bitrixcloud_option`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_bitrixcloud_option_1` (`NAME`);

--
-- Индексы таблицы `b_cache_tag`
--
ALTER TABLE `b_cache_tag`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  ADD KEY `ix_b_cache_tag_1` (`TAG`);

--
-- Индексы таблицы `b_captcha`
--
ALTER TABLE `b_captcha`
  ADD UNIQUE KEY `UX_B_CAPTCHA` (`ID`);

--
-- Индексы таблицы `b_checklist`
--
ALTER TABLE `b_checklist`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_clouds_copy_queue`
--
ALTER TABLE `b_clouds_copy_queue`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_clouds_delete_queue`
--
ALTER TABLE `b_clouds_delete_queue`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_clouds_delete_queue_1` (`BUCKET_ID`,`FILE_PATH`(100));

--
-- Индексы таблицы `b_clouds_file_bucket`
--
ALTER TABLE `b_clouds_file_bucket`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_clouds_file_hash`
--
ALTER TABLE `b_clouds_file_hash`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_clouds_file_hash` (`BUCKET_ID`,`FILE_PATH`(190));

--
-- Индексы таблицы `b_clouds_file_resize`
--
ALTER TABLE `b_clouds_file_resize`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  ADD KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  ADD KEY `ix_b_file_resize_file` (`FILE_ID`);

--
-- Индексы таблицы `b_clouds_file_save`
--
ALTER TABLE `b_clouds_file_save`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_EXTERNAL_ID` (`EXTERNAL_ID`);

--
-- Индексы таблицы `b_clouds_file_upload`
--
ALTER TABLE `b_clouds_file_upload`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_component_params`
--
ALTER TABLE `b_component_params`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  ADD KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  ADD KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`);

--
-- Индексы таблицы `b_composite_log`
--
ALTER TABLE `b_composite_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  ADD KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  ADD KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`);

--
-- Индексы таблицы `b_composite_page`
--
ALTER TABLE `b_composite_page`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  ADD KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  ADD KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`);

--
-- Индексы таблицы `b_consent_agreement`
--
ALTER TABLE `b_consent_agreement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`);

--
-- Индексы таблицы `b_consent_field`
--
ALTER TABLE `b_consent_field`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`);

--
-- Индексы таблицы `b_consent_user_consent`
--
ALTER TABLE `b_consent_user_consent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`),
  ADD KEY `IX_CONSENT_USER_CONSENT_USER_ORIGIN` (`USER_ID`,`ORIGIN_ID`);

--
-- Индексы таблицы `b_consent_user_consent_item`
--
ALTER TABLE `b_consent_user_consent_item`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_USER_ITEM_AG_ID` (`USER_CONSENT_ID`);

--
-- Индексы таблицы `b_counter_data`
--
ALTER TABLE `b_counter_data`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_culture`
--
ALTER TABLE `b_culture`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_entity_usage`
--
ALTER TABLE `b_entity_usage`
  ADD PRIMARY KEY (`USER_ID`,`CONTEXT`,`ENTITY_ID`,`ITEM_ID`),
  ADD KEY `IX_ENTITY_USAGE_ITEM_ID_INT` (`ITEM_ID_INT`),
  ADD KEY `IX_ENTITY_USAGE_LAST_USE_DATE` (`LAST_USE_DATE`);

--
-- Индексы таблицы `b_event`
--
ALTER TABLE `b_event`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_success` (`SUCCESS_EXEC`),
  ADD KEY `ix_b_event_date_exec` (`DATE_EXEC`);

--
-- Индексы таблицы `b_event_attachment`
--
ALTER TABLE `b_event_attachment`
  ADD PRIMARY KEY (`EVENT_ID`,`FILE_ID`);

--
-- Индексы таблицы `b_event_log`
--
ALTER TABLE `b_event_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  ADD KEY `ix_b_event_log_audit_type_time` (`AUDIT_TYPE_ID`,`TIMESTAMP_X`);

--
-- Индексы таблицы `b_event_message`
--
ALTER TABLE `b_event_message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_event_message_name` (`EVENT_NAME`(50));

--
-- Индексы таблицы `b_event_message_attachment`
--
ALTER TABLE `b_event_message_attachment`
  ADD PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`);

--
-- Индексы таблицы `b_event_message_site`
--
ALTER TABLE `b_event_message_site`
  ADD PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_event_type`
--
ALTER TABLE `b_event_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`);

--
-- Индексы таблицы `b_favorite`
--
ALTER TABLE `b_favorite`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_file`
--
ALTER TABLE `b_file`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`);

--
-- Индексы таблицы `b_file_duplicate`
--
ALTER TABLE `b_file_duplicate`
  ADD PRIMARY KEY (`DUPLICATE_ID`,`ORIGINAL_ID`),
  ADD KEY `ix_file_duplicate_duplicate` (`ORIGINAL_ID`);

--
-- Индексы таблицы `b_file_hash`
--
ALTER TABLE `b_file_hash`
  ADD PRIMARY KEY (`FILE_ID`),
  ADD KEY `ix_file_hash_size_hash` (`FILE_SIZE`,`FILE_HASH`);

--
-- Индексы таблицы `b_file_preview`
--
ALTER TABLE `b_file_preview`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FILE_PL_TOUCH` (`TOUCHED_AT`),
  ADD KEY `IX_B_FILE_PL_FILE` (`FILE_ID`);

--
-- Индексы таблицы `b_file_search`
--
ALTER TABLE `b_file_search`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_filters`
--
ALTER TABLE `b_filters`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_finder_dest`
--
ALTER TABLE `b_finder_dest`
  ADD PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  ADD KEY `IX_FINDER_DEST` (`CODE_TYPE`);

--
-- Индексы таблицы `b_geoip_handlers`
--
ALTER TABLE `b_geoip_handlers`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group`
--
ALTER TABLE `b_group`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group_collection_task`
--
ALTER TABLE `b_group_collection_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`);

--
-- Индексы таблицы `b_group_subordinate`
--
ALTER TABLE `b_group_subordinate`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group_task`
--
ALTER TABLE `b_group_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`);

--
-- Индексы таблицы `b_hlblock_entity`
--
ALTER TABLE `b_hlblock_entity`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_hlblock_entity_rights`
--
ALTER TABLE `b_hlblock_entity_rights`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_hot_keys`
--
ALTER TABLE `b_hot_keys`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  ADD KEY `ix_hot_keys_user` (`USER_ID`);

--
-- Индексы таблицы `b_hot_keys_code`
--
ALTER TABLE `b_hot_keys_code`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  ADD KEY `ix_hot_keys_code_url` (`URL`);

--
-- Индексы таблицы `b_iblock`
--
ALTER TABLE `b_iblock`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_iblock_api_code` (`API_CODE`),
  ADD KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`);

--
-- Индексы таблицы `b_iblock_cache`
--
ALTER TABLE `b_iblock_cache`
  ADD PRIMARY KEY (`CACHE_KEY`);

--
-- Индексы таблицы `b_iblock_element`
--
ALTER TABLE `b_iblock_element`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  ADD KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  ADD KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  ADD KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`);

--
-- Индексы таблицы `b_iblock_element_iprop`
--
ALTER TABLE `b_iblock_element_iprop`
  ADD PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  ADD KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  ADD KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`);

--
-- Индексы таблицы `b_iblock_element_lock`
--
ALTER TABLE `b_iblock_element_lock`
  ADD PRIMARY KEY (`IBLOCK_ELEMENT_ID`);

--
-- Индексы таблицы `b_iblock_element_property`
--
ALTER TABLE `b_iblock_element_property`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_prop_val` (`VALUE`(50),`IBLOCK_PROPERTY_ID`,`IBLOCK_ELEMENT_ID`);

--
-- Индексы таблицы `b_iblock_element_right`
--
ALTER TABLE `b_iblock_element_right`
  ADD PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  ADD KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  ADD KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`);

--
-- Индексы таблицы `b_iblock_fields`
--
ALTER TABLE `b_iblock_fields`
  ADD PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`);

--
-- Индексы таблицы `b_iblock_group`
--
ALTER TABLE `b_iblock_group`
  ADD UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`);

--
-- Индексы таблицы `b_iblock_iblock_iprop`
--
ALTER TABLE `b_iblock_iblock_iprop`
  ADD PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  ADD KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`);

--
-- Индексы таблицы `b_iblock_iproperty`
--
ALTER TABLE `b_iblock_iproperty`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`);

--
-- Индексы таблицы `b_iblock_messages`
--
ALTER TABLE `b_iblock_messages`
  ADD PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`);

--
-- Индексы таблицы `b_iblock_offers_tmp`
--
ALTER TABLE `b_iblock_offers_tmp`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_iblock_property`
--
ALTER TABLE `b_iblock_property`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  ADD KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  ADD KEY `ix_iblock_property_2` (`CODE`);

--
-- Индексы таблицы `b_iblock_property_enum`
--
ALTER TABLE `b_iblock_property_enum`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`);

--
-- Индексы таблицы `b_iblock_property_feature`
--
ALTER TABLE `b_iblock_property_feature`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_iblock_property_feature` (`PROPERTY_ID`,`MODULE_ID`,`FEATURE_ID`);

--
-- Индексы таблицы `b_iblock_right`
--
ALTER TABLE `b_iblock_right`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  ADD KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  ADD KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  ADD KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  ADD KEY `ix_b_iblock_right_task_id` (`TASK_ID`);

--
-- Индексы таблицы `b_iblock_rss`
--
ALTER TABLE `b_iblock_rss`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_iblock_section`
--
ALTER TABLE `b_iblock_section`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  ADD KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  ADD KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`),
  ADD KEY `ix_iblock_section_left_margin2` (`IBLOCK_ID`,`LEFT_MARGIN`),
  ADD KEY `ix_iblock_section_right_margin2` (`IBLOCK_ID`,`RIGHT_MARGIN`);

--
-- Индексы таблицы `b_iblock_section_element`
--
ALTER TABLE `b_iblock_section_element`
  ADD UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  ADD KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`);

--
-- Индексы таблицы `b_iblock_section_iprop`
--
ALTER TABLE `b_iblock_section_iprop`
  ADD PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  ADD KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  ADD KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`);

--
-- Индексы таблицы `b_iblock_section_property`
--
ALTER TABLE `b_iblock_section_property`
  ADD PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  ADD KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  ADD KEY `ix_b_iblock_section_property_2` (`SECTION_ID`);

--
-- Индексы таблицы `b_iblock_section_right`
--
ALTER TABLE `b_iblock_section_right`
  ADD PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  ADD KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  ADD KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`);

--
-- Индексы таблицы `b_iblock_sequence`
--
ALTER TABLE `b_iblock_sequence`
  ADD PRIMARY KEY (`IBLOCK_ID`,`CODE`);

--
-- Индексы таблицы `b_iblock_site`
--
ALTER TABLE `b_iblock_site`
  ADD PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_iblock_type`
--
ALTER TABLE `b_iblock_type`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_landing`
--
ALTER TABLE `b_landing`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_LAND_CODE` (`CODE`),
  ADD KEY `IX_B_LAND_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_LAND_DELETED` (`DELETED`),
  ADD KEY `IX_B_LAND_SYS` (`SYS`),
  ADD KEY `IX_B_LAND_XML_ID` (`XML_ID`),
  ADD KEY `IX_B_LAND_SITE_ID` (`SITE_ID`),
  ADD KEY `IX_B_LAND_SITEMAP` (`SITEMAP`),
  ADD KEY `IX_B_LAND_FOLDER` (`FOLDER`),
  ADD KEY `IX_B_LAND_FOLDER_ID` (`FOLDER_ID`);
ALTER TABLE `b_landing` ADD FULLTEXT KEY `IX_B_LANDING_SEARCH` (`SEARCH_CONTENT`);

--
-- Индексы таблицы `b_landing_binding`
--
ALTER TABLE `b_landing_binding`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_BINDING` (`BINDING_ID`,`BINDING_TYPE`),
  ADD KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `IX_B_BINDING_TYPE` (`BINDING_TYPE`);

--
-- Индексы таблицы `b_landing_block`
--
ALTER TABLE `b_landing_block`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_BLOCK_LID` (`LID`),
  ADD KEY `IX_B_BLOCK_CODE` (`CODE`),
  ADD KEY `IX_B_BLOCK_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_BLOCK_PUBLIC` (`PUBLIC`,`DATE_CREATE`),
  ADD KEY `IX_B_BLOCK_DELETED` (`DELETED`);
ALTER TABLE `b_landing_block` ADD FULLTEXT KEY `IX_B_BLOCK_SEARCH` (`SEARCH_CONTENT`);

--
-- Индексы таблицы `b_landing_block_last_used`
--
ALTER TABLE `b_landing_block_last_used`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_BLOCK_LU_USER` (`USER_ID`),
  ADD KEY `IX_B_BLOCK_LU_CODE` (`CODE`),
  ADD KEY `IX_B_BLOCK_LU_USER_CODE` (`USER_ID`,`CODE`);

--
-- Индексы таблицы `b_landing_chat`
--
ALTER TABLE `b_landing_chat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CHAT` (`CHAT_ID`);

--
-- Индексы таблицы `b_landing_chat_binding`
--
ALTER TABLE `b_landing_chat_binding`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CHAT` (`INTERNAL_CHAT_ID`),
  ADD KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`);

--
-- Индексы таблицы `b_landing_cookies_agreement`
--
ALTER TABLE `b_landing_cookies_agreement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SITE` (`SITE_ID`,`CODE`);

--
-- Индексы таблицы `b_landing_demo`
--
ALTER TABLE `b_landing_demo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_DEMO_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_DEMO_SHOW_IN_LIST` (`SHOW_IN_LIST`),
  ADD KEY `IX_B_DEMO_XML_ID` (`XML_ID`),
  ADD KEY `IX_B_DEMO_APP_CODE` (`APP_CODE`),
  ADD KEY `IX_B_DEMO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`);

--
-- Индексы таблицы `b_landing_designer_repo`
--
ALTER TABLE `b_landing_designer_repo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_XML_ID` (`XML_ID`);

--
-- Индексы таблицы `b_landing_domain`
--
ALTER TABLE `b_landing_domain`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_DOMAIN_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_DOMAIN_DOMAIN` (`DOMAIN`),
  ADD KEY `IX_B_DOMAIN_PROVIDER` (`PROVIDER`),
  ADD KEY `IX_B_DOMAIN_XML_ID` (`XML_ID`);

--
-- Индексы таблицы `b_landing_entity_lock`
--
ALTER TABLE `b_landing_entity_lock`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `IX_TYPE` (`LOCK_TYPE`);

--
-- Индексы таблицы `b_landing_entity_rights`
--
ALTER TABLE `b_landing_entity_rights`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `IX_ROLE` (`ROLE_ID`);

--
-- Индексы таблицы `b_landing_file`
--
ALTER TABLE `b_landing_file`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `IX_FILE` (`FILE_ID`),
  ADD KEY `IX_TEMP` (`TEMP`);

--
-- Индексы таблицы `b_landing_filter_block`
--
ALTER TABLE `b_landing_filter_block`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_FILTER_BLOCK` (`FILTER_ID`,`BLOCK_ID`);

--
-- Индексы таблицы `b_landing_filter_entity`
--
ALTER TABLE `b_landing_filter_entity`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_FILTER_HASH` (`FILTER_HASH`);

--
-- Индексы таблицы `b_landing_folder`
--
ALTER TABLE `b_landing_folder`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FOLDER_SITE_ID` (`SITE_ID`),
  ADD KEY `IX_B_FOLDER_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_FOLDER_DELETED` (`DELETED`);

--
-- Индексы таблицы `b_landing_hook_data`
--
ALTER TABLE `b_landing_hook_data`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `K_HOOK_CODE` (`HOOK`,`CODE`);

--
-- Индексы таблицы `b_landing_placement`
--
ALTER TABLE `b_landing_placement`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_landing_repo`
--
ALTER TABLE `b_landing_repo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_REPO_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_REPO_XML_ID` (`XML_ID`),
  ADD KEY `IX_B_REPO_APP_CODE` (`APP_CODE`),
  ADD KEY `IX_B_REPO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`);

--
-- Индексы таблицы `b_landing_role`
--
ALTER TABLE `b_landing_role`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_ROLE_TYPE` (`TYPE`);

--
-- Индексы таблицы `b_landing_site`
--
ALTER TABLE `b_landing_site`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SITE_CODE` (`CODE`),
  ADD KEY `IX_B_SITE_ACTIVE` (`ACTIVE`),
  ADD KEY `IX_B_SITE_DELETED` (`DELETED`),
  ADD KEY `IX_B_SITE_XML_ID` (`XML_ID`),
  ADD KEY `IX_B_SITE_SPECIAL` (`SPECIAL`);

--
-- Индексы таблицы `b_landing_syspage`
--
ALTER TABLE `b_landing_syspage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_SITE_ID` (`SITE_ID`),
  ADD KEY `IX_LANDING_ID` (`LANDING_ID`);

--
-- Индексы таблицы `b_landing_template`
--
ALTER TABLE `b_landing_template`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_landing_template_ref`
--
ALTER TABLE `b_landing_template_ref`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `K_LANDING_ID` (`LANDING_ID`),
  ADD KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`);

--
-- Индексы таблицы `b_landing_update_block`
--
ALTER TABLE `b_landing_update_block`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_CODE` (`CODE`);

--
-- Индексы таблицы `b_landing_urlchecker_host`
--
ALTER TABLE `b_landing_urlchecker_host`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CHECKER_STATUS_HOST` (`STATUS_ID`,`HOST`);

--
-- Индексы таблицы `b_landing_urlchecker_status`
--
ALTER TABLE `b_landing_urlchecker_status`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CHECKER_HASH` (`HASH`);

--
-- Индексы таблицы `b_landing_urlchecker_whitelist`
--
ALTER TABLE `b_landing_urlchecker_whitelist`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CHECKER_DOMAIN` (`DOMAIN`);

--
-- Индексы таблицы `b_landing_urlrewrite`
--
ALTER TABLE `b_landing_urlrewrite`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_SITE_RULE` (`SITE_ID`,`RULE`),
  ADD KEY `IX_LANDING_ID` (`LANDING_ID`);

--
-- Индексы таблицы `b_landing_view`
--
ALTER TABLE `b_landing_view`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_VIEW_LIDUID` (`LID`,`USER_ID`);

--
-- Индексы таблицы `b_lang`
--
ALTER TABLE `b_lang`
  ADD PRIMARY KEY (`LID`);

--
-- Индексы таблицы `b_language`
--
ALTER TABLE `b_language`
  ADD PRIMARY KEY (`LID`);

--
-- Индексы таблицы `b_lang_domain`
--
ALTER TABLE `b_lang_domain`
  ADD PRIMARY KEY (`LID`,`DOMAIN`);

--
-- Индексы таблицы `b_log_notification`
--
ALTER TABLE `b_log_notification`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_log_notification_action`
--
ALTER TABLE `b_log_notification_action`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_log_notification_action_notification_id` (`NOTIFICATION_ID`);

--
-- Индексы таблицы `b_main_mail_blacklist`
--
ALTER TABLE `b_main_mail_blacklist`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_B_MAIN_MAIL_BLACKLIST_CODE` (`CODE`);

--
-- Индексы таблицы `b_main_mail_sender`
--
ALTER TABLE `b_main_mail_sender`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_MAIN_MAIL_SENDER_USER_ID` (`USER_ID`,`IS_CONFIRMED`,`IS_PUBLIC`);

--
-- Индексы таблицы `b_main_mail_sender_send_counter`
--
ALTER TABLE `b_main_mail_sender_send_counter`
  ADD PRIMARY KEY (`DATE_STAT`,`EMAIL`);

--
-- Индексы таблицы `b_medialib_collection`
--
ALTER TABLE `b_medialib_collection`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_medialib_collection_item`
--
ALTER TABLE `b_medialib_collection_item`
  ADD PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`);

--
-- Индексы таблицы `b_medialib_item`
--
ALTER TABLE `b_medialib_item`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_medialib_type`
--
ALTER TABLE `b_medialib_type`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_messageservice_message`
--
ALTER TABLE `b_messageservice_message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `B_MESSAGESERVICE_MESSAGE_1` (`DATE_EXEC`),
  ADD KEY `B_MESSAGESERVICE_MESSAGE_2` (`SUCCESS_EXEC`),
  ADD KEY `B_MESSAGESERVICE_MESSAGE_3` (`SENDER_ID`,`EXTERNAL_ID`);

--
-- Индексы таблицы `b_messageservice_rest_app`
--
ALTER TABLE `b_messageservice_rest_app`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `B_MESSAGESERVICE_REST_APP_1` (`APP_ID`,`CODE`);

--
-- Индексы таблицы `b_messageservice_rest_app_lang`
--
ALTER TABLE `b_messageservice_rest_app_lang`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_module`
--
ALTER TABLE `b_module`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_module_group`
--
ALTER TABLE `b_module_group`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_module_to_module`
--
ALTER TABLE `b_module_to_module`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_module_to_module_unique_id` (`UNIQUE_ID`),
  ADD KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20));

--
-- Индексы таблицы `b_numerator`
--
ALTER TABLE `b_numerator`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_numerator_sequence`
--
ALTER TABLE `b_numerator_sequence`
  ADD PRIMARY KEY (`NUMERATOR_ID`,`KEY`);

--
-- Индексы таблицы `b_operation`
--
ALTER TABLE `b_operation`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_option`
--
ALTER TABLE `b_option`
  ADD PRIMARY KEY (`MODULE_ID`,`NAME`),
  ADD KEY `ix_option_name` (`NAME`);

--
-- Индексы таблицы `b_option_site`
--
ALTER TABLE `b_option_site`
  ADD PRIMARY KEY (`MODULE_ID`,`NAME`,`SITE_ID`),
  ADD KEY `ix_option_site_module_site` (`MODULE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_perf_cache`
--
ALTER TABLE `b_perf_cache`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  ADD KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`);

--
-- Индексы таблицы `b_perf_cluster`
--
ALTER TABLE `b_perf_cluster`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_perf_component`
--
ALTER TABLE `b_perf_component`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`);

--
-- Индексы таблицы `b_perf_error`
--
ALTER TABLE `b_perf_error`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_PERF_ERROR_0` (`HIT_ID`);

--
-- Индексы таблицы `b_perf_history`
--
ALTER TABLE `b_perf_history`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_perf_hit`
--
ALTER TABLE `b_perf_hit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_PERF_HIT_0` (`DATE_HIT`);

--
-- Индексы таблицы `b_perf_index_ban`
--
ALTER TABLE `b_perf_index_ban`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_perf_index_complete`
--
ALTER TABLE `b_perf_index_complete`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`);

--
-- Индексы таблицы `b_perf_index_suggest`
--
ALTER TABLE `b_perf_index_suggest`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`);

--
-- Индексы таблицы `b_perf_index_suggest_sql`
--
ALTER TABLE `b_perf_index_suggest_sql`
  ADD PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  ADD KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`);

--
-- Индексы таблицы `b_perf_sql`
--
ALTER TABLE `b_perf_sql`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  ADD KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`);

--
-- Индексы таблицы `b_perf_sql_backtrace`
--
ALTER TABLE `b_perf_sql_backtrace`
  ADD PRIMARY KEY (`SQL_ID`,`NN`);

--
-- Индексы таблицы `b_perf_tab_column_stat`
--
ALTER TABLE `b_perf_tab_column_stat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`);

--
-- Индексы таблицы `b_perf_tab_stat`
--
ALTER TABLE `b_perf_tab_stat`
  ADD PRIMARY KEY (`TABLE_NAME`);

--
-- Индексы таблицы `b_perf_test`
--
ALTER TABLE `b_perf_test`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`);

--
-- Индексы таблицы `b_rating`
--
ALTER TABLE `b_rating`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rating_component`
--
ALTER TABLE `b_rating_component`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`);

--
-- Индексы таблицы `b_rating_component_results`
--
ALTER TABLE `b_rating_component_results`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  ADD KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  ADD KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`);

--
-- Индексы таблицы `b_rating_results`
--
ALTER TABLE `b_rating_results`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  ADD KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_rule`
--
ALTER TABLE `b_rating_rule`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rating_rule_vetting`
--
ALTER TABLE `b_rating_rule_vetting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_user`
--
ALTER TABLE `b_rating_user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  ADD KEY `IX_B_RAT_USER_2` (`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_vote`
--
ALTER TABLE `b_rating_vote`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  ADD KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  ADD KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_10` (`USER_ID`,`OWNER_ID`);

--
-- Индексы таблицы `b_rating_vote_group`
--
ALTER TABLE `b_rating_vote_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RATING_ID` (`GROUP_ID`,`TYPE`);

--
-- Индексы таблицы `b_rating_voting`
--
ALTER TABLE `b_rating_voting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  ADD KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`);

--
-- Индексы таблицы `b_rating_voting_prepare`
--
ALTER TABLE `b_rating_voting_prepare`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`);

--
-- Индексы таблицы `b_rating_voting_reaction`
--
ALTER TABLE `b_rating_voting_reaction`
  ADD PRIMARY KEY (`ENTITY_TYPE_ID`,`ENTITY_ID`,`REACTION`);

--
-- Индексы таблицы `b_rating_weight`
--
ALTER TABLE `b_rating_weight`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rest_ap`
--
ALTER TABLE `b_rest_ap`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_rest_ap` (`USER_ID`,`PASSWORD`,`ACTIVE`);

--
-- Индексы таблицы `b_rest_app`
--
ALTER TABLE `b_rest_app`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_app1` (`CLIENT_ID`);

--
-- Индексы таблицы `b_rest_app_lang`
--
ALTER TABLE `b_rest_app_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_app_lang1` (`APP_ID`,`LANGUAGE_ID`);

--
-- Индексы таблицы `b_rest_app_log`
--
ALTER TABLE `b_rest_app_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_rest_app_log1` (`APP_ID`);

--
-- Индексы таблицы `b_rest_ap_permission`
--
ALTER TABLE `b_rest_ap_permission`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_ap_perm1` (`PASSWORD_ID`,`PERM`);

--
-- Индексы таблицы `b_rest_configuration_storage`
--
ALTER TABLE `b_rest_configuration_storage`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rest_event`
--
ALTER TABLE `b_rest_event`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_event_app_event` (`APP_ID`,`EVENT_NAME`(50),`EVENT_HANDLER`(180),`USER_ID`,`CONNECTOR_ID`(70)),
  ADD KEY `ix_b_rest_event_event_name` (`EVENT_NAME`);

--
-- Индексы таблицы `b_rest_event_offline`
--
ALTER TABLE `b_rest_event_offline`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_event_offline1` (`MESSAGE_ID`(50),`APP_ID`,`CONNECTOR_ID`(100),`PROCESS_ID`(50)),
  ADD KEY `ix_b_rest_event_offline2` (`TIMESTAMP_X`),
  ADD KEY `ix_b_rest_event_offline3` (`APP_ID`,`CONNECTOR_ID`),
  ADD KEY `ix_b_rest_event_offline4` (`PROCESS_ID`);

--
-- Индексы таблицы `b_rest_integration`
--
ALTER TABLE `b_rest_integration`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rest_log`
--
ALTER TABLE `b_rest_log`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rest_owner_entity`
--
ALTER TABLE `b_rest_owner_entity`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_b_rest_owner_entity` (`ENTITY_TYPE`,`ENTITY`);

--
-- Индексы таблицы `b_rest_placement`
--
ALTER TABLE `b_rest_placement`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_placement1` (`APP_ID`,`PLACEMENT`(100),`PLACEMENT_HANDLER`(200)),
  ADD KEY `ix_b_rest_placement3` (`PLACEMENT`(100),`ADDITIONAL`(100));

--
-- Индексы таблицы `b_rest_placement_lang`
--
ALTER TABLE `b_rest_placement_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `b_rest_placement_lang_unique` (`PLACEMENT_ID`,`LANGUAGE_ID`);

--
-- Индексы таблицы `b_rest_stat`
--
ALTER TABLE `b_rest_stat`
  ADD PRIMARY KEY (`APP_ID`,`STAT_DATE`,`METHOD_ID`);

--
-- Индексы таблицы `b_rest_stat_app`
--
ALTER TABLE `b_rest_stat_app`
  ADD PRIMARY KEY (`APP_ID`),
  ADD KEY `ix_b_rest_stat_app_code` (`APP_CODE`);

--
-- Индексы таблицы `b_rest_stat_method`
--
ALTER TABLE `b_rest_stat_method`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_rest_stat_method` (`NAME`);

--
-- Индексы таблицы `b_rest_usage_entity`
--
ALTER TABLE `b_rest_usage_entity`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_b_rest_usage_entity` (`ENTITY_TYPE`,`ENTITY_ID`,`SUB_ENTITY_TYPE`,`SUB_ENTITY_NAME`);

--
-- Индексы таблицы `b_rest_usage_stat`
--
ALTER TABLE `b_rest_usage_stat`
  ADD PRIMARY KEY (`STAT_DATE`,`ENTITY_ID`),
  ADD KEY `ix_b_rest_usage` (`ENTITY_ID`,`STAT_DATE`);

--
-- Индексы таблицы `b_search_content`
--
ALTER TABLE `b_search_content`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  ADD KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  ADD KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`);

--
-- Индексы таблицы `b_search_content_freq`
--
ALTER TABLE `b_search_content_freq`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_search_content_param`
--
ALTER TABLE `b_search_content_param`
  ADD KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  ADD KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_content_right`
--
ALTER TABLE `b_search_content_right`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`);

--
-- Индексы таблицы `b_search_content_site`
--
ALTER TABLE `b_search_content_site`
  ADD PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_search_content_stem`
--
ALTER TABLE `b_search_content_stem`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  ADD KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_content_text`
--
ALTER TABLE `b_search_content_text`
  ADD PRIMARY KEY (`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_content_title`
--
ALTER TABLE `b_search_content_title`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  ADD KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_custom_rank`
--
ALTER TABLE `b_search_custom_rank`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`);

--
-- Индексы таблицы `b_search_phrase`
--
ALTER TABLE `b_search_phrase`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  ADD KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  ADD KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_search_stem`
--
ALTER TABLE `b_search_stem`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`);

--
-- Индексы таблицы `b_search_suggest`
--
ALTER TABLE `b_search_suggest`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  ADD KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  ADD KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_search_tags`
--
ALTER TABLE `b_search_tags`
  ADD PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  ADD KEY `IX_B_SEARCH_TAGS_0` (`NAME`);

--
-- Индексы таблицы `b_search_user_right`
--
ALTER TABLE `b_search_user_right`
  ADD UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`);

--
-- Индексы таблицы `b_seo_adv_autolog`
--
ALTER TABLE `b_seo_adv_autolog`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  ADD KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_seo_adv_banner`
--
ALTER TABLE `b_seo_adv_banner`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  ADD KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  ADD KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`);

--
-- Индексы таблицы `b_seo_adv_campaign`
--
ALTER TABLE `b_seo_adv_campaign`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`);

--
-- Индексы таблицы `b_seo_adv_group`
--
ALTER TABLE `b_seo_adv_group`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  ADD KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`);

--
-- Индексы таблицы `b_seo_adv_link`
--
ALTER TABLE `b_seo_adv_link`
  ADD PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`);

--
-- Индексы таблицы `b_seo_adv_log`
--
ALTER TABLE `b_seo_adv_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  ADD KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_seo_adv_order`
--
ALTER TABLE `b_seo_adv_order`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  ADD KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`);

--
-- Индексы таблицы `b_seo_adv_region`
--
ALTER TABLE `b_seo_adv_region`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  ADD KEY `ix_b_seo_adv_region1` (`PARENT_ID`);

--
-- Индексы таблицы `b_seo_keywords`
--
ALTER TABLE `b_seo_keywords`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`);

--
-- Индексы таблицы `b_seo_search_engine`
--
ALTER TABLE `b_seo_search_engine`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`);

--
-- Индексы таблицы `b_seo_service_log`
--
ALTER TABLE `b_seo_service_log`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_seo_service_queue`
--
ALTER TABLE `b_seo_service_queue`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SEO_SERVICE_QUEUE_TYPE` (`TYPE`),
  ADD KEY `IX_B_SEO_SERVICE_SERVICE_TYPE_CLIENT_ID` (`SERVICE_TYPE`,`CLIENT_ID`);

--
-- Индексы таблицы `b_seo_service_rtg_queue`
--
ALTER TABLE `b_seo_service_rtg_queue`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  ADD KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`);

--
-- Индексы таблицы `b_seo_service_subscription`
--
ALTER TABLE `b_seo_service_subscription`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SEO_SERVICE_SUB_1` (`TYPE`,`GROUP_ID`);

--
-- Индексы таблицы `b_seo_service_webhook`
--
ALTER TABLE `b_seo_service_webhook`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SEO_SERVICE_WEBHOOK_1` (`TYPE`,`EXTERNAL_ID`);

--
-- Индексы таблицы `b_seo_sitemap`
--
ALTER TABLE `b_seo_sitemap`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_seo_sitemap_entity`
--
ALTER TABLE `b_seo_sitemap_entity`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  ADD KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`);

--
-- Индексы таблицы `b_seo_sitemap_iblock`
--
ALTER TABLE `b_seo_sitemap_iblock`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  ADD KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`);

--
-- Индексы таблицы `b_seo_sitemap_runtime`
--
ALTER TABLE `b_seo_sitemap_runtime`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`);

--
-- Индексы таблицы `b_seo_yandex_direct_stat`
--
ALTER TABLE `b_seo_yandex_direct_stat`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  ADD KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`);

--
-- Индексы таблицы `b_short_uri`
--
ALTER TABLE `b_short_uri`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  ADD KEY `ux_b_short_uri_2` (`URI_CRC`);

--
-- Индексы таблицы `b_site_template`
--
ALTER TABLE `b_site_template`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_site_template_site` (`SITE_ID`);

--
-- Индексы таблицы `b_smile`
--
ALTER TABLE `b_smile`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_smile_lang`
--
ALTER TABLE `b_smile_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`);

--
-- Индексы таблицы `b_smile_set`
--
ALTER TABLE `b_smile_set`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sms_template`
--
ALTER TABLE `b_sms_template`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_sms_message_name` (`EVENT_NAME`(50));

--
-- Индексы таблицы `b_sms_template_site`
--
ALTER TABLE `b_sms_template_site`
  ADD PRIMARY KEY (`TEMPLATE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_sm_version_history`
--
ALTER TABLE `b_sm_version_history`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_socialservices_ap`
--
ALTER TABLE `b_socialservices_ap`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`);

--
-- Индексы таблицы `b_socialservices_contact`
--
ALTER TABLE `b_socialservices_contact`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_socialservices_contact1` (`USER_ID`),
  ADD KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  ADD KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  ADD KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`);

--
-- Индексы таблицы `b_socialservices_contact_connect`
--
ALTER TABLE `b_socialservices_contact_connect`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  ADD KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  ADD KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`);

--
-- Индексы таблицы `b_socialservices_message`
--
ALTER TABLE `b_socialservices_message`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_socialservices_user`
--
ALTER TABLE `b_socialservices_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  ADD KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`),
  ADD KEY `IX_B_SOCIALSERVICES_US_4` (`USER_ID`,`EXTERNAL_AUTH_ID`);

--
-- Индексы таблицы `b_socialservices_user_link`
--
ALTER TABLE `b_socialservices_user_link`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  ADD KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  ADD KEY `ix_b_socialservices_user_link_7` (`LINK_UID`);

--
-- Индексы таблицы `b_socialservices_zoom_meeting`
--
ALTER TABLE `b_socialservices_zoom_meeting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_1` (`CONFERENCE_EXTERNAL_ID`),
  ADD KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`);

--
-- Индексы таблицы `b_socialservices_zoom_meeting_recording`
--
ALTER TABLE `b_socialservices_zoom_meeting_recording`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_RECORDING_1` (`MEETING_ID`);

--
-- Индексы таблицы `b_sticker`
--
ALTER TABLE `b_sticker`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sticker_group_task`
--
ALTER TABLE `b_sticker_group_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`);

--
-- Индексы таблицы `b_task`
--
ALTER TABLE `b_task`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`);

--
-- Индексы таблицы `b_task_operation`
--
ALTER TABLE `b_task_operation`
  ADD PRIMARY KEY (`TASK_ID`,`OPERATION_ID`);

--
-- Индексы таблицы `b_translate_diff`
--
ALTER TABLE `b_translate_diff`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IXU_TRNSL_DIFF` (`FILE_ID`,`LANG_ID`,`AGAINST_LANG_ID`),
  ADD KEY `IX_TRNSL_DIFF_PATH` (`PATH_ID`,`LANG_ID`);

--
-- Индексы таблицы `b_translate_file`
--
ALTER TABLE `b_translate_file`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_TRNSL_FL_PATH` (`PATH_ID`,`LANG_ID`),
  ADD KEY `IX_TRNSL_FULL_PATH` (`FULL_PATH`(255));

--
-- Индексы таблицы `b_translate_path`
--
ALTER TABLE `b_translate_path`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_TRNSL_PTH_NAME` (`PARENT_ID`,`NAME`),
  ADD KEY `IX_TRNSL_PTH_PARENT` (`PARENT_ID`,`IS_DIR`,`IS_LANG`),
  ADD KEY `IX_TRNSL_PTH_PATH` (`PATH`(255));

--
-- Индексы таблицы `b_translate_path_lang`
--
ALTER TABLE `b_translate_path_lang`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_TRNSL_LNG_PATH` (`PATH`(255));

--
-- Индексы таблицы `b_translate_path_tree`
--
ALTER TABLE `b_translate_path_tree`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_TRNSL_ANCESTOR` (`PARENT_ID`,`DEPTH_LEVEL`,`PATH_ID`),
  ADD UNIQUE KEY `IX_TRNSL_DESCENDANT` (`PATH_ID`,`PARENT_ID`,`DEPTH_LEVEL`);

--
-- Индексы таблицы `b_translate_phrase`
--
ALTER TABLE `b_translate_phrase`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IXU_TRNSL_PHR_PATH_CODE` (`PATH_ID`,`LANG_ID`,`CODE`),
  ADD KEY `IX_TRNSL_PHR_PATH` (`PATH_ID`,`CODE`),
  ADD KEY `IX_TRNSL_FILE` (`FILE_ID`);
ALTER TABLE `b_translate_phrase` ADD FULLTEXT KEY `IXF_TRNSL_PHR` (`PHRASE`);

--
-- Индексы таблицы `b_ui_entity_editor_config`
--
ALTER TABLE `b_ui_entity_editor_config`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  ADD KEY `CATEGORY` (`CATEGORY`);

--
-- Индексы таблицы `b_ui_entity_editor_config_ac`
--
ALTER TABLE `b_ui_entity_editor_config_ac`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ACCESS_CODE` (`ACCESS_CODE`),
  ADD KEY `CONFIG_ID` (`CONFIG_ID`);

--
-- Индексы таблицы `b_undo`
--
ALTER TABLE `b_undo`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_urlpreview_metadata`
--
ALTER TABLE `b_urlpreview_metadata`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_URLPREVIEW_METADATA_URL` (`URL`(255));

--
-- Индексы таблицы `b_urlpreview_route`
--
ALTER TABLE `b_urlpreview_route`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`(255));

--
-- Индексы таблицы `b_user`
--
ALTER TABLE `b_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  ADD KEY `ix_b_user_email` (`EMAIL`),
  ADD KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  ADD KEY `IX_B_USER_XML_ID` (`XML_ID`),
  ADD KEY `ix_user_last_login` (`LAST_LOGIN`),
  ADD KEY `ix_user_date_register` (`DATE_REGISTER`);

--
-- Индексы таблицы `b_user_access`
--
ALTER TABLE `b_user_access`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  ADD KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  ADD KEY `ix_ua_access` (`ACCESS_CODE`),
  ADD KEY `ix_ua_provider` (`PROVIDER_ID`);

--
-- Индексы таблицы `b_user_access_check`
--
ALTER TABLE `b_user_access_check`
  ADD UNIQUE KEY `ux_uac_user_provider` (`USER_ID`,`PROVIDER_ID`);

--
-- Индексы таблицы `b_user_auth_action`
--
ALTER TABLE `b_user_auth_action`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  ADD KEY `ix_auth_action_date` (`ACTION_DATE`);

--
-- Индексы таблицы `b_user_auth_code`
--
ALTER TABLE `b_user_auth_code`
  ADD PRIMARY KEY (`USER_ID`,`CODE_TYPE`);

--
-- Индексы таблицы `b_user_counter`
--
ALTER TABLE `b_user_counter`
  ADD PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  ADD KEY `ix_buc_tag` (`TAG`),
  ADD KEY `ix_buc_code` (`CODE`),
  ADD KEY `ix_buc_ts` (`TIMESTAMP_X`),
  ADD KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`);

--
-- Индексы таблицы `b_user_digest`
--
ALTER TABLE `b_user_digest`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Индексы таблицы `b_user_field`
--
ALTER TABLE `b_user_field`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`);

--
-- Индексы таблицы `b_user_field_confirm`
--
ALTER TABLE `b_user_field_confirm`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`);

--
-- Индексы таблицы `b_user_field_enum`
--
ALTER TABLE `b_user_field_enum`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`);

--
-- Индексы таблицы `b_user_field_lang`
--
ALTER TABLE `b_user_field_lang`
  ADD PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`);

--
-- Индексы таблицы `b_user_field_permission`
--
ALTER TABLE `b_user_field_permission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ROLE_ID` (`ENTITY_TYPE_ID`),
  ADD KEY `GROUP_ID` (`USER_FIELD_ID`),
  ADD KEY `PERMISSION_ID` (`PERMISSION_ID`);

--
-- Индексы таблицы `b_user_group`
--
ALTER TABLE `b_user_group`
  ADD UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  ADD KEY `ix_user_group_group` (`GROUP_ID`);

--
-- Индексы таблицы `b_user_hit_auth`
--
ALTER TABLE `b_user_hit_auth`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  ADD KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  ADD KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_user_index`
--
ALTER TABLE `b_user_index`
  ADD PRIMARY KEY (`USER_ID`);
ALTER TABLE `b_user_index` ADD FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`);
ALTER TABLE `b_user_index` ADD FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`);
ALTER TABLE `b_user_index` ADD FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`);

--
-- Индексы таблицы `b_user_option`
--
ALTER TABLE `b_user_option`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`);

--
-- Индексы таблицы `b_user_password`
--
ALTER TABLE `b_user_password`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_user_password_user_date` (`USER_ID`,`DATE_CHANGE`);

--
-- Индексы таблицы `b_user_phone_auth`
--
ALTER TABLE `b_user_phone_auth`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `ix_user_phone_auth_number` (`PHONE_NUMBER`);

--
-- Индексы таблицы `b_user_profile_history`
--
ALTER TABLE `b_user_profile_history`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_profile_history_user` (`USER_ID`),
  ADD KEY `ix_profile_history_date` (`DATE_INSERT`);

--
-- Индексы таблицы `b_user_profile_record`
--
ALTER TABLE `b_user_profile_record`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_profile_record_history_field` (`HISTORY_ID`,`FIELD`);

--
-- Индексы таблицы `b_user_session`
--
ALTER TABLE `b_user_session`
  ADD PRIMARY KEY (`SESSION_ID`),
  ADD KEY `ix_user_session_time` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_user_stored_auth`
--
ALTER TABLE `b_user_stored_auth`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ux_user_hash` (`USER_ID`);

--
-- Индексы таблицы `b_xml_tree`
--
ALTER TABLE `b_xml_tree`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_xml_tree_parent` (`PARENT_ID`),
  ADD KEY `ix_b_xml_tree_left` (`LEFT_MARGIN`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `b_admin_notify`
--
ALTER TABLE `b_admin_notify`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_admin_notify_lang`
--
ALTER TABLE `b_admin_notify_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_agent`
--
ALTER TABLE `b_agent`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT для таблицы `b_app_password`
--
ALTER TABLE `b_app_password`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_b24connector_button_site`
--
ALTER TABLE `b_b24connector_button_site`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_bitrixcloud_option`
--
ALTER TABLE `b_bitrixcloud_option`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `b_cache_tag`
--
ALTER TABLE `b_cache_tag`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT для таблицы `b_checklist`
--
ALTER TABLE `b_checklist`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_copy_queue`
--
ALTER TABLE `b_clouds_copy_queue`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_delete_queue`
--
ALTER TABLE `b_clouds_delete_queue`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_file_bucket`
--
ALTER TABLE `b_clouds_file_bucket`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_file_hash`
--
ALTER TABLE `b_clouds_file_hash`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_file_resize`
--
ALTER TABLE `b_clouds_file_resize`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_file_save`
--
ALTER TABLE `b_clouds_file_save`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_component_params`
--
ALTER TABLE `b_component_params`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT для таблицы `b_composite_log`
--
ALTER TABLE `b_composite_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_composite_page`
--
ALTER TABLE `b_composite_page`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_agreement`
--
ALTER TABLE `b_consent_agreement`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_field`
--
ALTER TABLE `b_consent_field`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_user_consent`
--
ALTER TABLE `b_consent_user_consent`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_user_consent_item`
--
ALTER TABLE `b_consent_user_consent_item`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_culture`
--
ALTER TABLE `b_culture`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_event`
--
ALTER TABLE `b_event`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_event_log`
--
ALTER TABLE `b_event_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `b_event_message`
--
ALTER TABLE `b_event_message`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `b_event_type`
--
ALTER TABLE `b_event_type`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `b_favorite`
--
ALTER TABLE `b_favorite`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_file`
--
ALTER TABLE `b_file`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `b_file_preview`
--
ALTER TABLE `b_file_preview`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_file_search`
--
ALTER TABLE `b_file_search`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_filters`
--
ALTER TABLE `b_filters`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_geoip_handlers`
--
ALTER TABLE `b_geoip_handlers`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_group`
--
ALTER TABLE `b_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `b_hlblock_entity`
--
ALTER TABLE `b_hlblock_entity`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_hlblock_entity_rights`
--
ALTER TABLE `b_hlblock_entity_rights`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_hot_keys`
--
ALTER TABLE `b_hot_keys`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `b_hot_keys_code`
--
ALTER TABLE `b_hot_keys_code`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT для таблицы `b_iblock`
--
ALTER TABLE `b_iblock`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `b_iblock_element`
--
ALTER TABLE `b_iblock_element`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `b_iblock_element_property`
--
ALTER TABLE `b_iblock_element_property`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `b_iblock_iproperty`
--
ALTER TABLE `b_iblock_iproperty`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_offers_tmp`
--
ALTER TABLE `b_iblock_offers_tmp`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_property`
--
ALTER TABLE `b_iblock_property`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `b_iblock_property_enum`
--
ALTER TABLE `b_iblock_property_enum`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_property_feature`
--
ALTER TABLE `b_iblock_property_feature`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_right`
--
ALTER TABLE `b_iblock_right`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_rss`
--
ALTER TABLE `b_iblock_rss`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_section`
--
ALTER TABLE `b_iblock_section`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing`
--
ALTER TABLE `b_landing`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_binding`
--
ALTER TABLE `b_landing_binding`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_block`
--
ALTER TABLE `b_landing_block`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_block_last_used`
--
ALTER TABLE `b_landing_block_last_used`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_chat`
--
ALTER TABLE `b_landing_chat`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_chat_binding`
--
ALTER TABLE `b_landing_chat_binding`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_cookies_agreement`
--
ALTER TABLE `b_landing_cookies_agreement`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_demo`
--
ALTER TABLE `b_landing_demo`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_designer_repo`
--
ALTER TABLE `b_landing_designer_repo`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_domain`
--
ALTER TABLE `b_landing_domain`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_entity_lock`
--
ALTER TABLE `b_landing_entity_lock`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_entity_rights`
--
ALTER TABLE `b_landing_entity_rights`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_file`
--
ALTER TABLE `b_landing_file`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_filter_block`
--
ALTER TABLE `b_landing_filter_block`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_filter_entity`
--
ALTER TABLE `b_landing_filter_entity`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_folder`
--
ALTER TABLE `b_landing_folder`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_hook_data`
--
ALTER TABLE `b_landing_hook_data`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_placement`
--
ALTER TABLE `b_landing_placement`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_repo`
--
ALTER TABLE `b_landing_repo`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_role`
--
ALTER TABLE `b_landing_role`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_site`
--
ALTER TABLE `b_landing_site`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_syspage`
--
ALTER TABLE `b_landing_syspage`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_template`
--
ALTER TABLE `b_landing_template`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `b_landing_template_ref`
--
ALTER TABLE `b_landing_template_ref`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_update_block`
--
ALTER TABLE `b_landing_update_block`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_urlchecker_host`
--
ALTER TABLE `b_landing_urlchecker_host`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_urlchecker_status`
--
ALTER TABLE `b_landing_urlchecker_status`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_urlchecker_whitelist`
--
ALTER TABLE `b_landing_urlchecker_whitelist`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_urlrewrite`
--
ALTER TABLE `b_landing_urlrewrite`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_landing_view`
--
ALTER TABLE `b_landing_view`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_log_notification`
--
ALTER TABLE `b_log_notification`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_log_notification_action`
--
ALTER TABLE `b_log_notification_action`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_main_mail_blacklist`
--
ALTER TABLE `b_main_mail_blacklist`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_main_mail_sender`
--
ALTER TABLE `b_main_mail_sender`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_medialib_collection`
--
ALTER TABLE `b_medialib_collection`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_medialib_item`
--
ALTER TABLE `b_medialib_item`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_medialib_type`
--
ALTER TABLE `b_medialib_type`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_messageservice_message`
--
ALTER TABLE `b_messageservice_message`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_messageservice_rest_app`
--
ALTER TABLE `b_messageservice_rest_app`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_messageservice_rest_app_lang`
--
ALTER TABLE `b_messageservice_rest_app_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_module_group`
--
ALTER TABLE `b_module_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_module_to_module`
--
ALTER TABLE `b_module_to_module`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT для таблицы `b_numerator`
--
ALTER TABLE `b_numerator`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_operation`
--
ALTER TABLE `b_operation`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT для таблицы `b_perf_cache`
--
ALTER TABLE `b_perf_cache`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_cluster`
--
ALTER TABLE `b_perf_cluster`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_component`
--
ALTER TABLE `b_perf_component`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_error`
--
ALTER TABLE `b_perf_error`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_history`
--
ALTER TABLE `b_perf_history`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_hit`
--
ALTER TABLE `b_perf_hit`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_index_ban`
--
ALTER TABLE `b_perf_index_ban`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_index_complete`
--
ALTER TABLE `b_perf_index_complete`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_index_suggest`
--
ALTER TABLE `b_perf_index_suggest`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_sql`
--
ALTER TABLE `b_perf_sql`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_tab_column_stat`
--
ALTER TABLE `b_perf_tab_column_stat`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_test`
--
ALTER TABLE `b_perf_test`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating`
--
ALTER TABLE `b_rating`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_rating_component`
--
ALTER TABLE `b_rating_component`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_component_results`
--
ALTER TABLE `b_rating_component_results`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_results`
--
ALTER TABLE `b_rating_results`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_rule`
--
ALTER TABLE `b_rating_rule`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `b_rating_rule_vetting`
--
ALTER TABLE `b_rating_rule_vetting`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_user`
--
ALTER TABLE `b_rating_user`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_rating_vote`
--
ALTER TABLE `b_rating_vote`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_vote_group`
--
ALTER TABLE `b_rating_vote_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `b_rating_voting`
--
ALTER TABLE `b_rating_voting`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_voting_prepare`
--
ALTER TABLE `b_rating_voting_prepare`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_weight`
--
ALTER TABLE `b_rating_weight`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_rest_ap`
--
ALTER TABLE `b_rest_ap`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_app`
--
ALTER TABLE `b_rest_app`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_app_lang`
--
ALTER TABLE `b_rest_app_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_app_log`
--
ALTER TABLE `b_rest_app_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_ap_permission`
--
ALTER TABLE `b_rest_ap_permission`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_configuration_storage`
--
ALTER TABLE `b_rest_configuration_storage`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_event`
--
ALTER TABLE `b_rest_event`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_event_offline`
--
ALTER TABLE `b_rest_event_offline`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_integration`
--
ALTER TABLE `b_rest_integration`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_log`
--
ALTER TABLE `b_rest_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_owner_entity`
--
ALTER TABLE `b_rest_owner_entity`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_placement`
--
ALTER TABLE `b_rest_placement`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_placement_lang`
--
ALTER TABLE `b_rest_placement_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_stat_method`
--
ALTER TABLE `b_rest_stat_method`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rest_usage_entity`
--
ALTER TABLE `b_rest_usage_entity`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_search_content`
--
ALTER TABLE `b_search_content`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `b_search_custom_rank`
--
ALTER TABLE `b_search_custom_rank`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_search_phrase`
--
ALTER TABLE `b_search_phrase`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_search_stem`
--
ALTER TABLE `b_search_stem`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1485;

--
-- AUTO_INCREMENT для таблицы `b_search_suggest`
--
ALTER TABLE `b_search_suggest`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_autolog`
--
ALTER TABLE `b_seo_adv_autolog`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_banner`
--
ALTER TABLE `b_seo_adv_banner`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_campaign`
--
ALTER TABLE `b_seo_adv_campaign`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_group`
--
ALTER TABLE `b_seo_adv_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_log`
--
ALTER TABLE `b_seo_adv_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_order`
--
ALTER TABLE `b_seo_adv_order`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_region`
--
ALTER TABLE `b_seo_adv_region`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_keywords`
--
ALTER TABLE `b_seo_keywords`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_search_engine`
--
ALTER TABLE `b_seo_search_engine`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_log`
--
ALTER TABLE `b_seo_service_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_queue`
--
ALTER TABLE `b_seo_service_queue`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_rtg_queue`
--
ALTER TABLE `b_seo_service_rtg_queue`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_subscription`
--
ALTER TABLE `b_seo_service_subscription`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_webhook`
--
ALTER TABLE `b_seo_service_webhook`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap`
--
ALTER TABLE `b_seo_sitemap`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap_entity`
--
ALTER TABLE `b_seo_sitemap_entity`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap_iblock`
--
ALTER TABLE `b_seo_sitemap_iblock`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap_runtime`
--
ALTER TABLE `b_seo_sitemap_runtime`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_yandex_direct_stat`
--
ALTER TABLE `b_seo_yandex_direct_stat`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_short_uri`
--
ALTER TABLE `b_short_uri`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_site_template`
--
ALTER TABLE `b_site_template`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_smile`
--
ALTER TABLE `b_smile`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `b_smile_lang`
--
ALTER TABLE `b_smile_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `b_smile_set`
--
ALTER TABLE `b_smile_set`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_sms_template`
--
ALTER TABLE `b_sms_template`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_sm_version_history`
--
ALTER TABLE `b_sm_version_history`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_ap`
--
ALTER TABLE `b_socialservices_ap`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_contact`
--
ALTER TABLE `b_socialservices_contact`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_contact_connect`
--
ALTER TABLE `b_socialservices_contact_connect`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_message`
--
ALTER TABLE `b_socialservices_message`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_user`
--
ALTER TABLE `b_socialservices_user`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_user_link`
--
ALTER TABLE `b_socialservices_user_link`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_zoom_meeting`
--
ALTER TABLE `b_socialservices_zoom_meeting`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_zoom_meeting_recording`
--
ALTER TABLE `b_socialservices_zoom_meeting_recording`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sticker`
--
ALTER TABLE `b_sticker`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_task`
--
ALTER TABLE `b_task`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `b_translate_diff`
--
ALTER TABLE `b_translate_diff`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_translate_file`
--
ALTER TABLE `b_translate_file`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_translate_path`
--
ALTER TABLE `b_translate_path`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_translate_path_lang`
--
ALTER TABLE `b_translate_path_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_translate_path_tree`
--
ALTER TABLE `b_translate_path_tree`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_translate_phrase`
--
ALTER TABLE `b_translate_phrase`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_entity_editor_config`
--
ALTER TABLE `b_ui_entity_editor_config`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_entity_editor_config_ac`
--
ALTER TABLE `b_ui_entity_editor_config_ac`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_urlpreview_metadata`
--
ALTER TABLE `b_urlpreview_metadata`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_urlpreview_route`
--
ALTER TABLE `b_urlpreview_route`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_user`
--
ALTER TABLE `b_user`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_user_access`
--
ALTER TABLE `b_user_access`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `b_user_auth_action`
--
ALTER TABLE `b_user_auth_action`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_user_field`
--
ALTER TABLE `b_user_field`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_field_confirm`
--
ALTER TABLE `b_user_field_confirm`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_field_enum`
--
ALTER TABLE `b_user_field_enum`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_field_permission`
--
ALTER TABLE `b_user_field_permission`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_hit_auth`
--
ALTER TABLE `b_user_hit_auth`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_option`
--
ALTER TABLE `b_user_option`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT для таблицы `b_user_password`
--
ALTER TABLE `b_user_password`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_user_profile_history`
--
ALTER TABLE `b_user_profile_history`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_profile_record`
--
ALTER TABLE `b_user_profile_record`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_stored_auth`
--
ALTER TABLE `b_user_stored_auth`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_xml_tree`
--
ALTER TABLE `b_xml_tree`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
