-- This file is autogenerated by the Rail schema generator, using
-- the schema defined in db/migration/*.rb
--
-- Do not edit this file.  Instead, add a new migration using
-- ./script/generate migration <name>, and then run
-- ./script/generate schema

-- tables 

CREATE TABLE articles_categories (
  `article_id` int(11),
  `category_id` int(11),
  `is_primary` int(11)
) TYPE=MyISAM;

CREATE TABLE articles_tags (
  `article_id` int(11),
  `tag_id` int(11)
) TYPE=MyISAM;

CREATE TABLE blacklist_patterns (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `type` varchar(255),
  `pattern` varchar(255)
) TYPE=MyISAM;

CREATE TABLE blogs (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `settings` text
) TYPE=MyISAM;

CREATE TABLE categories (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `name` varchar(255),
  `position` int(11),
  `permalink` varchar(255)
) TYPE=MyISAM;

CREATE TABLE contents (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `type` varchar(255),
  `title` varchar(255),
  `author` varchar(255),
  `body` text,
  `body_html` text,
  `extended` text,
  `excerpt` text,
  `keywords` varchar(255),
  `created_at` datetime,
  `updated_at` datetime,
  `extended_html` text,
  `user_id` int(11),
  `permalink` varchar(255),
  `guid` varchar(255),
  `text_filter_id` int(11),
  `whiteboard` text,
  `article_id` int(11),
  `email` varchar(255),
  `url` varchar(255),
  `ip` varchar(40),
  `blog_name` varchar(255),
  `name` varchar(255),
  `comments_count` int(11),
  `trackbacks_count` int(11),
  `published` tinyint(1) DEFAULT 0,
  `allow_pings` tinyint(1),
  `allow_comments` tinyint(1),
  `blog_id` int(11) NOT NULL,
  `published_at` datetime
) TYPE=MyISAM;

CREATE TABLE notifications (
  `notify_user_id` int(11),
  `notify_content_id` int(11),
  `created_at` datetime,
  `updated_at` datetime
) TYPE=MyISAM;

CREATE TABLE page_caches (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `name` varchar(255)
) TYPE=MyISAM;

CREATE TABLE pings (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `article_id` int(11),
  `url` varchar(255),
  `created_at` datetime
) TYPE=MyISAM;

CREATE TABLE redirects (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `from_path` varchar(255),
  `to_path` varchar(255)
) TYPE=MyISAM;

CREATE TABLE resources (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `size` int(11),
  `filename` varchar(255),
  `mime` varchar(255),
  `created_at` datetime,
  `updated_at` datetime,
  `article_id` int(11),
  `itunes_metadata` tinyint(1),
  `itunes_author` varchar(255),
  `itunes_subtitle` varchar(255),
  `itunes_duration` int(11),
  `itunes_summary` text,
  `itunes_keywords` varchar(255),
  `itunes_category` varchar(255),
  `itunes_explicit` tinyint(1)
) TYPE=MyISAM;

CREATE TABLE sessions (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `sessid` varchar(255),
  `data` text,
  `created_at` datetime,
  `updated_at` datetime
) TYPE=MyISAM;

CREATE TABLE sidebars (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `controller` varchar(255),
  `active_position` int(11),
  `config` text,
  `staged_position` int(11)
) TYPE=MyISAM;

CREATE TABLE tags (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `name` varchar(255),
  `created_at` datetime,
  `updated_at` datetime,
  `display_name` varchar(255)
) TYPE=MyISAM;

CREATE TABLE text_filters (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `name` varchar(255),
  `description` varchar(255),
  `markup` varchar(255),
  `filters` text,
  `params` text
) TYPE=MyISAM;

CREATE TABLE triggers (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `pending_item_id` int(11),
  `pending_item_type` varchar(255),
  `due_at` datetime,
  `trigger_method` varchar(255)
) TYPE=MyISAM;

CREATE TABLE users (
  `id` int(11) DEFAULT NULL auto_increment PRIMARY KEY,
  `login` varchar(255),
  `password` varchar(255),
  `email` text,
  `name` text,
  `notify_via_email` tinyint(1),
  `notify_on_new_articles` tinyint(1),
  `notify_on_comments` tinyint(1),
  `notify_watch_my_articles` tinyint(1),
  `notify_via_jabber` tinyint(1),
  `jabber` varchar(255)
) TYPE=MyISAM;


-- indexes 

CREATE  INDEX blacklist_patterns_pattern_index ON blacklist_patterns (pattern);
CREATE  INDEX categories_permalink_index ON categories (permalink);
CREATE  INDEX contents_blog_id_index ON contents (blog_id);
CREATE  INDEX contents_article_id_index ON contents (article_id);
CREATE  INDEX page_caches_name_index ON page_caches (name);
CREATE  INDEX pings_article_id_index ON pings (article_id);
CREATE  INDEX sessions_sessid_index ON sessions (sessid);

-- data 

INSERT INTO sidebars (`config`, `staged_position`, `active_position`, `controller`) VALUES(NULL, NULL, 0, 'category');
INSERT INTO sidebars (`config`, `staged_position`, `active_position`, `controller`) VALUES(NULL, NULL, 1, 'static');
INSERT INTO sidebars (`config`, `staged_position`, `active_position`, `controller`) VALUES(NULL, NULL, 2, 'xml');
INSERT INTO text_filters (`name`, `filters`, `description`, `params`, `markup`) VALUES('none', '--- []

', 'None', '--- {}

', 'none');
INSERT INTO text_filters (`name`, `filters`, `description`, `params`, `markup`) VALUES('markdown', '--- []

', 'Markdown', '--- {}

', 'markdown');
INSERT INTO text_filters (`name`, `filters`, `description`, `params`, `markup`) VALUES('smartypants', '--- 
- :smartypants
', 'SmartyPants', '--- {}

', 'none');
INSERT INTO text_filters (`name`, `filters`, `description`, `params`, `markup`) VALUES('markdown smartypants', '--- 
- :smartypants
', 'Markdown with SmartyPants', '--- {}

', 'markdown');
INSERT INTO text_filters (`name`, `filters`, `description`, `params`, `markup`) VALUES('textile', '--- []

', 'Textile', '--- {}

', 'textile');

-- schema version meta-info 

CREATE TABLE schema_info (
  `version` int(11)
) TYPE=MyISAM;

insert into schema_info (version) values (46);
