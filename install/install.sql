-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2014 at 11:22 AM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `onlinejudge`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `__problem_accept_table`
--
CREATE TABLE IF NOT EXISTS `__problem_accept_table` (
`id` int(11)
,`accept` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `__problem_external`
--
CREATE TABLE IF NOT EXISTS `__problem_external` (
`id` int(11)
,`submission` bigint(21)
,`accept` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `__problem_submission_table`
--
CREATE TABLE IF NOT EXISTS `__problem_submission_table` (
`id` int(11)
,`submission` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `__user_accept_table`
--
CREATE TABLE IF NOT EXISTS `__user_accept_table` (
`id` int(11)
,`accept` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `__user_external`
--
CREATE TABLE IF NOT EXISTS `__user_external` (
`id` int(11)
,`submission` bigint(21)
,`accept` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `__user_submission_table`
--
CREATE TABLE IF NOT EXISTS `__user_submission_table` (
`id` int(11)
,`submission` bigint(21)
);
-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add blog post', 7, 'add_blogpost'),
(20, 'Can change blog post', 7, 'change_blogpost'),
(21, 'Can delete blog post', 7, 'delete_blogpost'),
(22, 'Can add problem', 8, 'add_problem'),
(23, 'Can change problem', 8, 'change_problem'),
(24, 'Can delete problem', 8, 'delete_problem'),
(25, 'Can add user', 9, 'add_user'),
(26, 'Can change user', 9, 'change_user'),
(27, 'Can delete user', 9, 'delete_user'),
(28, 'Can add response', 10, 'add_response'),
(29, 'Can change response', 10, 'change_response'),
(30, 'Can delete response', 10, 'delete_response'),
(31, 'Can add record', 11, 'add_record'),
(32, 'Can change record', 11, 'change_record'),
(33, 'Can delete record', 11, 'delete_record');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blog_blogpost`
--

CREATE TABLE IF NOT EXISTS `blog_blogpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `author` varchar(30) NOT NULL,
  `abstract` varchar(500) NOT NULL,
  `body` longtext NOT NULL,
  `created_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `blog_blogpost`
--

INSERT INTO `blog_blogpost` (`id`, `title`, `author`, `abstract`, `body`, `created_time`, `modified_time`) VALUES
(1, 'Issues', 'Alogfans', 'This document express some important issues of this online judge.', 'See also $ a^2+y^2=z^2 $ and express any.', '2014-11-09 03:47:35', '2014-11-09 13:59:31'),
(2, 'Achievements', 'Alogfans', 'This article we list more.', 'This article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\n\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\n\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\n\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.\r\nThis article we list more.', '2014-11-10 10:38:22', '2014-11-10 10:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'blog post', 'blog', 'blogpost'),
(8, 'problem', 'onlinejudge', 'problem'),
(9, 'user', 'onlinejudge', 'user'),
(10, 'response', 'onlinejudge', 'response'),
(11, 'record', 'onlinejudge', 'record');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2014-11-09 03:18:58'),
(2, 'auth', '0001_initial', '2014-11-09 03:18:58'),
(3, 'admin', '0001_initial', '2014-11-09 03:18:58'),
(4, 'sessions', '0001_initial', '2014-11-09 03:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `onlinejudge_problem`
--

CREATE TABLE IF NOT EXISTS `onlinejudge_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `post_date` datetime NOT NULL,
  `memory_limit` int(11) NOT NULL,
  `time_limit` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `pre_written_code` longtext NOT NULL,
  `test_data` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `onlinejudge_problem`
--

INSERT INTO `onlinejudge_problem` (`id`, `title`, `post_date`, `memory_limit`, `time_limit`, `description`, `pre_written_code`, `test_data`) VALUES
(1, 'The first problem of this online judge', '2014-11-09 05:19:12', 3, 3, 'Not so-called a+b!\r\n\r\nWhat you need is to complete a program, so that it prints all numbers as\r\nwhat you input.\r\n\r\nFor example, if we input\r\n\r\n    1 2 3\r\n\r\nit should print to stdout\r\n\r\n    1 2 3\r\n    \r\nThat''s simple.', '// If you don''t need this, do not modify this line.', './1.zip'),
(2, 'The second problem -- still the same', '2014-11-09 06:27:35', 100, 100, 'complete a function like this:\r\n    \r\n    int add(int a, int b)\r\n    {\r\n        // ...\r\n    }\r\n\r\ndo not write more parts or it may cause unpridicted error!', '#include <stdio.h>\r\nint add(int a, int b);\r\nint main()\r\n{\r\n    int a, b;\r\n    scanf("%d%d", &a, &b);\r\n    printf("%d\\n", add(a, b));\r\n    return 0;\r\n}', './2.zip');

-- --------------------------------------------------------

--
-- Table structure for table `onlinejudge_record`
--

CREATE TABLE IF NOT EXISTS `onlinejudge_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commit_user_id` int(11) NOT NULL,
  `commit_problem_id` int(11) NOT NULL,
  `commit_status_id` int(11) NOT NULL,
  `commit_date` datetime NOT NULL,
  `commit_sourcefile` longtext NOT NULL,
  `commit_external` longtext,
  `cost_time_ms` int(11) NOT NULL,
  `cost_memory_mb` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `onlinejudge_record_12e0812e` (`commit_user_id`),
  KEY `onlinejudge_record_366d7674` (`commit_problem_id`),
  KEY `onlinejudge_record_c49c14b9` (`commit_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `onlinejudge_record`
--

INSERT INTO `onlinejudge_record` (`id`, `commit_user_id`, `commit_problem_id`, `commit_status_id`, `commit_date`, `commit_sourcefile`, `commit_external`, `cost_time_ms`, `cost_memory_mb`) VALUES
(1, 1, 1, 4, '2014-11-09 05:57:20', '1234568', 'Main.cpp:2:1: error: expected unqualified-id before numeric constant\n 1234568\n ^\n', -1, -1),
(2, 1, 2, 2, '2014-11-09 08:05:25', 'int add(int a, int b)\r\n{\r\n    return a + b;\r\n}', '------- Style Check (by Google Cpplint) ------\n\nMain.cpp:0:  No copyright message found.  You should have a line: "Copyright [year] <Copyright Owner>"  [legal/copyright] [5]\nMain.cpp:4:  { should almost always be at the end of the previous line  [whitespace/braces] [4]\nMain.cpp:11:  { should almost always be at the end of the previous line  [whitespace/braces] [4]\nMain.cpp:13:  Could not find a newline character at the end of the file.  [whitespace/ending_newline] [5]\nDone processing Main.cpp\nTotal errors found: 4\n\n------ Correct Vaildation ------\n\nTest Case 1: Accepted\n', 0, 0),
(3, 1, 2, 3, '2014-11-09 08:07:34', 'int add(int a, int b)\r\n{\r\n    return 1000;\r\n}', '------- Style Check (by Google Cpplint) ------\n\nMain.cpp:0:  No copyright message found.  You should have a line: "Copyright [year] <Copyright Owner>"  [legal/copyright] [5]\nMain.cpp:4:  { should almost always be at the end of the previous line  [whitespace/braces] [4]\nMain.cpp:11:  { should almost always be at the end of the previous line  [whitespace/braces] [4]\nMain.cpp:13:  Could not find a newline character at the end of the file.  [whitespace/ending_newline] [5]\nDone processing Main.cpp\nTotal errors found: 4\n\n------ Correct Vaildation ------\n\nTest Case 1: Wrong Answer\nInput:\n1 3\nCorrect Output:\n4\n\nYour Output:\n1000\n', -1, 0),
(4, 1, 1, 3, '2014-11-09 08:24:12', '#include <iostream>\r\nusing namespace std;\r\n\r\nint main()\r\n{\r\n    int t;\r\n    while (cin >> t)\r\n        cout << t << " ";\r\n    cout << endl;\r\n}', '------- Style Check (by Google Cpplint) ------\n\nMain.cpp:0:  No copyright message found.  You should have a line: "Copyright [year] <Copyright Owner>"  [legal/copyright] [5]\nMain.cpp:2:  Streams are highly discouraged.  [readability/streams] [3]\nMain.cpp:3:  Do not use namespace using-directives.  Use using-declarations instead.  [build/namespaces] [5]\nMain.cpp:6:  { should almost always be at the end of the previous line  [whitespace/braces] [4]\nMain.cpp:11:  Could not find a newline character at the end of the file.  [whitespace/ending_newline] [5]\nDone processing Main.cpp\nTotal errors found: 5\n\n------ Correct Vaildation ------\n\n\nTest Case 1: Wrong Answer\nInput:\n4 4 5\r\n\nCorrect Output:\n4 4 5\r\n\nYour Output:\n4 4 5 \n\n', -1, 1),
(5, 1, 1, 2, '2014-11-09 08:25:14', '#include <iostream>\r\nusing namespace std;\r\nint main()\r\n{\r\n    int t;\r\n    cin >> t;\r\n    cout << t;\r\n    while (cin >> t)\r\n        cout << " " << t;\r\n    cout << endl;\r\n} ', '------- Style Check (by Google Cpplint) ------\n\nMain.cpp:0:  No copyright message found.  You should have a line: "Copyright [year] <Copyright Owner>"  [legal/copyright] [5]\nMain.cpp:2:  Streams are highly discouraged.  [readability/streams] [3]\nMain.cpp:3:  Do not use namespace using-directives.  Use using-declarations instead.  [build/namespaces] [5]\nMain.cpp:5:  { should almost always be at the end of the previous line  [whitespace/braces] [4]\nMain.cpp:12:  Line ends in whitespace.  Consider deleting these extra spaces.  [whitespace/end_of_line] [4]\nMain.cpp:12:  Could not find a newline character at the end of the file.  [whitespace/ending_newline] [5]\nDone processing Main.cpp\nTotal errors found: 6\n\n------ Correct Vaildation ------\n\n\nTest Case 1: Accepted\n\nTest Case 2: Accepted\n', -1, 1),
(6, 1, 1, 4, '2014-11-09 08:28:21', '#include <iostream>\r\nusing namespace std;\r\nint main()\r\n{\r\n    int *t = new int[1000000];\r\n    t[999999]= 22365;\r\n    int t;\r\n    while (cin >> t)\r\n        cout << t << " ";\r\n    cout << endl;\r\n} ', 'Main.cpp: In function ‘int main()’:\nMain.cpp:8:9: error: conflicting declaration ‘int t’\n     int t;\r\n         ^\nMain.cpp:6:10: error: ‘t’ has a previous declaration as ‘int* t’\n     int *t = new int[1000000];\r\n          ^\nMain.cpp:9:16: error: no match for ‘operator>>’ (operand types are ‘std::istream {aka std::basic_istream<char>}’ and ‘int*’)\n     while (cin >> t)\r\n                ^\nMain.cpp:9:16: note: candidates are:\nIn file included from /usr/include/c++/4.8/iostream:40:0,\n                 from Main.cpp:2:\n/usr/include/c++/4.8/istream:120:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(std::basic_istream<_CharT, _Traits>::__istream_type& (*)(std::basic_istream<_CharT, _Traits>::__istream_type&)) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(__istream_type& (*__pf)(__istream_type&))\n       ^\n/usr/include/c++/4.8/istream:120:7: note:   no known conversion for argument 1 from ‘int*’ to ‘std::basic_istream<char>::__istream_type& (*)(std::basic_istream<char>::__istream_type&) {aka std::basic_istream<char>& (*)(std::basic_istream<char>&)}’\n/usr/include/c++/4.8/istream:124:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(std::basic_istream<_CharT, _Traits>::__ios_type& (*)(std::basic_istream<_CharT, _Traits>::__ios_type&)) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>; std::basic_istream<_CharT, _Traits>::__ios_type = std::basic_ios<char>]\n       operator>>(__ios_type& (*__pf)(__ios_type&))\n       ^\n/usr/include/c++/4.8/istream:124:7: note:   no known conversion for argument 1 from ‘int*’ to ‘std::basic_istream<char>::__ios_type& (*)(std::basic_istream<char>::__ios_type&) {aka std::basic_ios<char>& (*)(std::basic_ios<char>&)}’\n/usr/include/c++/4.8/istream:131:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(std::ios_base& (*)(std::ios_base&)) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(ios_base& (*__pf)(ios_base&))\n       ^\n/usr/include/c++/4.8/istream:131:7: note:   no known conversion for argument 1 from ‘int*’ to ‘std::ios_base& (*)(std::ios_base&)’\n/usr/include/c++/4.8/istream:168:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(bool&) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(bool& __n)\n       ^\n/usr/include/c++/4.8/istream:168:7: note:   no known conversion for argument 1 from ‘int*’ to ‘bool&’\n/usr/include/c++/4.8/istream:172:7: note: std::basic_istream<_CharT, _Traits>& std::basic_istream<_CharT, _Traits>::operator>>(short int&) [with _CharT = char; _Traits = std::char_traits<char>]\n       operator>>(short& __n);\n       ^\n/usr/include/c++/4.8/istream:172:7: note:   no known conversion for argument 1 from ‘int*’ to ‘short int&’\n/usr/include/c++/4.8/istream:175:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(short unsigned int&) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(unsigned short& __n)\n       ^\n/usr/include/c++/4.8/istream:175:7: note:   no known conversion for argument 1 from ‘int*’ to ‘short unsigned int&’\n/usr/include/c++/4.8/istream:179:7: note: std::basic_istream<_CharT, _Traits>& std::basic_istream<_CharT, _Traits>::operator>>(int&) [with _CharT = char; _Traits = std::char_traits<char>]\n       operator>>(int& __n);\n       ^\n/usr/include/c++/4.8/istream:179:7: note:   no known conversion for argument 1 from ‘int*’ to ‘int&’\n/usr/include/c++/4.8/istream:182:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(unsigned int&) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(unsigned int& __n)\n       ^\n/usr/include/c++/4.8/istream:182:7: note:   no known conversion for argument 1 from ‘int*’ to ‘unsigned int&’\n/usr/include/c++/4.8/istream:186:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(long int&) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(long& __n)\n       ^\n/usr/include/c++/4.8/istream:186:7: note:   no known conversion for argument 1 from ‘int*’ to ‘long int&’\n/usr/include/c++/4.8/istream:190:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(long unsigned int&) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(unsigned long& __n)\n       ^\n/usr/include/c++/4.8/istream:190:7: note:   no known conversion for argument 1 from ‘int*’ to ‘long unsigned int&’\n/usr/include/c++/4.8/istream:195:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(long long int&) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(long long& __n)\n       ^\n/usr/include/c++/4.8/istream:195:7: note:   no known conversion for argument 1 from ‘int*’ to ‘long long int&’\n/usr/include/c++/4.8/istream:199:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(long long unsigned int&) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(unsigned long long& __n)\n       ^\n/usr/include/c++/4.8/istream:199:7: note:   no known conversion for argument 1 from ‘int*’ to ‘long long unsigned int&’\n/usr/include/c++/4.8/istream:214:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(float&) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(float& __f)\n       ^\n/usr/include/c++/4.8/istream:214:7: note:   no known conversion for argument 1 from ‘int*’ to ‘float&’\n/usr/include/c++/4.8/istream:218:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(double&) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(double& __f)\n       ^\n/usr/include/c++/4.8/istream:218:7: note:   no known conversion for argument 1 from ‘int*’ to ‘double&’\n/usr/include/c++/4.8/istream:222:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(long double&) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(long double& __f)\n       ^\n/usr/include/c++/4.8/istream:222:7: note:   no known conversion for argument 1 from ‘int*’ to ‘long double&’\n/usr/include/c++/4.8/istream:235:7: note: std::basic_istream<_CharT, _Traits>::__istream_type& std::basic_istream<_CharT, _Traits>::operator>>(void*&) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__istream_type = std::basic_istream<char>]\n       operator>>(void*& __p)\n       ^\n/usr/include/c++/4.8/istream:235:7: note:   no known conversion for argument 1 from ‘int*’ to ‘void*&’\n/usr/include/c++/4.8/istream:259:7: note: std::basic_istream<_CharT, _Traits>& std::basic_istream<_CharT, _Traits>::operator>>(std::basic_istream<_CharT, _Traits>::__streambuf_type*) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_istream<_CharT, _Traits>::__streambuf_type = std::basic_streambuf<char>]\n       operator>>(__streambuf_type* __sb);\n       ^\n/usr/include/c++/4.8/istream:259:7: note:   no known conversion for argument 1 from ‘int*’ to ‘std::basic_istream<char>::__streambuf_type* {aka std::basic_streambuf<char>*}’\nIn file included from /usr/include/c++/4.8/string:53:0,\n                 from /usr/include/c++/4.8/bits/locale_classes.h:40,\n                 from /usr/include/c++/4.8/bits/ios_base.h:41,\n                 from /usr/include/c++/4.8/ios:42,\n                 from /usr/include/c++/4.8/ostream:38,\n                 from /usr/include/c++/4.8/iostream:39,\n                 from Main.cpp:2:\n/usr/include/c++/4.8/bits/basic_string.tcc:996:5: note: template<class _CharT, class _Traits, class _Alloc> std::basic_istream<_CharT, _Traits>& std::operator>>(std::basic_istream<_CharT, _Traits>&, std::basic_string<_CharT, _Traits, _Alloc>&)\n     operator>>(basic_istream<_CharT, _Traits>& __in,\n     ^\n/usr/include/c++/4.8/bits/basic_string.tcc:996:5: note:   template argument deduction/substitution failed:\nMain.cpp:9:19: note:   mismatched types ‘std::basic_string<_CharT, _Traits, _Alloc>’ and ‘int*’\n     while (cin >> t)\r\n                   ^\nIn file included from /usr/include/c++/4.8/istream:879:0,\n                 from /usr/include/c++/4.8/iostream:40,\n                 from Main.cpp:2:\n/usr/include/c++/4.8/bits/istream.tcc:955:5: note: template<class _CharT2, class _Traits2> std::basic_istream<_CharT, _Traits>& std::operator>>(std::basic_istream<_CharT, _Traits>&, _CharT2*)\n     operator>>(basic_istream<_CharT, _Traits>& __in, _CharT* __s)\n     ^\n/usr/include/c++/4.8/bits/istream.tcc:955:5: note:   template argument deduction/substitution failed:\nMain.cpp:9:19: note:   deduced conflicting types for parameter ‘_CharT2’ (‘char’ and ‘int’)\n     while (cin >> t)\r\n                   ^\nIn file included from /usr/include/c++/4.8/istream:879:0,\n                 from /usr/include/c++/4.8/iostream:40,\n                 from Main.cpp:2:\n/usr/include/c++/4.8/bits/istream.tcc:923:5: note: template<class _CharT, class _Traits> std::basic_istream<_CharT, _Traits>& std::operator>>(std::basic_istream<_CharT, _Traits>&, _CharT&)\n     operator>>(basic_istream<_CharT, _Traits>& __in, _CharT& __c)\n     ^\n/usr/include/c++/4.8/bits/istream.tcc:923:5: note:   template argument deduction/substitution failed:\nMain.cpp:9:19: note:   deduced conflicting types for parameter ‘_CharT’ (‘char’ and ‘int*’)\n     while (cin >> t)\r\n                   ^\nIn file included from /usr/include/c++/4.8/iostream:40:0,\n                 from Main.cpp:2:\n/usr/include/c++/4.8/istream:727:5: note: template<class _Traits> std::basic_istream<char, _Traits>& std::operator>>(std::basic_istream<char, _Traits>&, unsigned char&)\n     operator>>(basic_istream<char, _Traits>& __in, unsigned char& __c)\n     ^\n/usr/include/c++/4.8/istream:727:5: note:   template argument deduction/substitution failed:\nMain.cpp:9:19: note:   cannot convert ‘t’ (type ‘int*’) to type ‘unsigned char&’\n     while (cin >> t)\r\n                   ^\nIn file included from /usr/include/c++/4.8/iostream:40:0,\n                 from Main.cpp:2:\n/usr/include/c++/4.8/istream:732:5: note: template<class _Traits> std::basic_istream<char, _Traits>& std::operator>>(std::basic_istream<char, _Traits>&, signed char&)\n     operator>>(basic_istream<char, _Traits>& __in, signed char& __c)\n     ^\n/usr/include/c++/4.8/istream:732:5: note:   template argument deduction/substitution failed:\nMain.cpp:9:19: note:   cannot convert ‘t’ (type ‘int*’) to type ‘signed char&’\n     while (cin >> t)\r\n                   ^\nIn file included from /usr/include/c++/4.8/iostream:40:0,\n                 from Main.cpp:2:\n/usr/include/c++/4.8/istream:774:5: note: template<class _Traits> std::basic_istream<char, _Traits>& std::operator>>(std::basic_istream<char, _Traits>&, unsigned char*)\n     operator>>(basic_istream<char, _Traits>& __in, unsigned char* __s)\n     ^\n/usr/include/c++/4.8/istream:774:5: note:   template argument deduction/substitution failed:\nMain.cpp:9:19: note:   cannot convert ‘t’ (type ‘int*’) to type ‘unsigned char*’\n     while (cin >> t)\r\n                   ^\nIn file included from /usr/include/c++/4.8/iostream:40:0,\n                 from Main.cpp:2:\n/usr/include/c++/4.8/istream:779:5: note: template<class _Traits> std::basic_istream<char, _Traits>& std::operator>>(std::basic_istream<char, _Traits>&, signed char*)\n     operator>>(basic_istream<char, _Traits>& __in, signed char* __s)\n     ^\n/usr/include/c++/4.8/istream:779:5: note:   template argument deduction/substitution failed:\nMain.cpp:9:19: note:   cannot convert ‘t’ (type ‘int*’) to type ‘signed char*’\n     while (cin >> t)\r\n                   ^\n', -1, -1),
(7, 1, 1, 3, '2014-11-09 08:29:07', '#include <iostream>\r\nusing namespace std;\r\nint main()\r\n{\r\n    int t;\r\n    while (cin >> t)\r\n        cout << t << " ";\r\n    cout << endl;\r\n} ', '------- Style Check (by Google Cpplint) ------\n\nMain.cpp:0:  No copyright message found.  You should have a line: "Copyright [year] <Copyright Owner>"  [legal/copyright] [5]\nMain.cpp:2:  Streams are highly discouraged.  [readability/streams] [3]\nMain.cpp:3:  Do not use namespace using-directives.  Use using-declarations instead.  [build/namespaces] [5]\nMain.cpp:5:  { should almost always be at the end of the previous line  [whitespace/braces] [4]\nMain.cpp:10:  Line ends in whitespace.  Consider deleting these extra spaces.  [whitespace/end_of_line] [4]\nMain.cpp:10:  Could not find a newline character at the end of the file.  [whitespace/ending_newline] [5]\nDone processing Main.cpp\nTotal errors found: 6\n\n------ Correct Vaildation ------\n\nTest Case 1: Wrong Answer\nInput:\n4 4 5\r\nCorrect Output:\n4 4 5\r\nYour Output:\n4 4 5 \n', -1, 1),
(8, 1, 1, 4, '2014-11-10 03:26:57', '123456', 'Main.cpp:2:1: error: expected unqualified-id before numeric constant\n 123456\n ^\n', -1, -1),
(9, 1, 1, 4, '2014-11-14 06:49:05', '222355', 'Main.cpp:2:1: error: expected unqualified-id before numeric constant\n 222355\n ^\n', -1, -1),
(10, 1, 1, 7, '2014-11-15 02:02:52', '#include <iostream>\r\nusing namespace std;\r\n\r\nint hole[10000000];\r\n\r\nint main()\r\n{\r\n    hole[9999990] = 23;\r\n}', '------- Style Check (by Google Cpplint) ------\n\nMain.cpp:0:  No copyright message found.  You should have a line: "Copyright [year] <Copyright Owner>"  [legal/copyright] [5]\nMain.cpp:2:  Streams are highly discouraged.  [readability/streams] [3]\nMain.cpp:3:  Do not use namespace using-directives.  Use using-declarations instead.  [build/namespaces] [5]\nMain.cpp:8:  { should almost always be at the end of the previous line  [whitespace/braces] [4]\nMain.cpp:10:  Could not find a newline character at the end of the file.  [whitespace/ending_newline] [5]\nDone processing Main.cpp\nTotal errors found: 5\n\n------ Correct Vaildation ------\n\n', -1, -1);

-- --------------------------------------------------------

--
-- Table structure for table `onlinejudge_response`
--

CREATE TABLE IF NOT EXISTS `onlinejudge_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_string` varchar(30) NOT NULL,
  `display_string` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `onlinejudge_response`
--

INSERT INTO `onlinejudge_response` (`id`, `short_string`, `display_string`) VALUES
(1, 'WAIT_FOR_JUDGE', 'Pending'),
(2, 'ACCEPTED', 'Accepted'),
(3, 'WRONG_ANSWER', 'Wrong Answer'),
(4, 'COMPLIE_ERROR', 'Compile Error'),
(5, 'RUNTIME_ERROR', 'Runtime Error'),
(6, 'TIME_LIMIT_EXCEEDED', 'Time Limit Exceeded'),
(7, 'MEMORY_LIMIT_EXCEEDED', 'Memory Limit Exceeded'),
(8, 'UNKNOWN', 'Internal Error');

-- --------------------------------------------------------

--
-- Table structure for table `onlinejudge_user`
--

CREATE TABLE IF NOT EXISTS `onlinejudge_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `announcement` varchar(1024) NOT NULL,
  `register_date` datetime NOT NULL,
  `last_activity_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `onlinejudge_user`
--

INSERT INTO `onlinejudge_user` (`id`, `username`, `password`, `department`, `announcement`, `register_date`, `last_activity_date`) VALUES
(1, 'Admin', '0F359740BD1CDA994F8B55330C86D845', 'Xidian University', '', '2014-11-09 03:46:46', '2014-11-15 02:39:57'),
(2, 'Alogfans', 'ECF07806E9A4639A852457838D4F5746', 'Xidian University', '', '2014-11-09 10:33:26', '2014-11-09 10:33:35');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_problem_ex`
--
CREATE TABLE IF NOT EXISTS `view_problem_ex` (
`id` int(11)
,`title` varchar(255)
,`post_date` datetime
,`memory_limit` int(11)
,`time_limit` int(11)
,`description` longtext
,`pre_written_code` longtext
,`test_data` varchar(100)
,`su_count` bigint(21)
,`ac_count` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user_ex`
--
CREATE TABLE IF NOT EXISTS `view_user_ex` (
`id` int(11)
,`username` varchar(255)
,`password` varchar(255)
,`department` varchar(255)
,`announcement` varchar(1024)
,`register_date` datetime
,`last_activity_date` datetime
,`su_count` bigint(21)
,`ac_count` bigint(21)
);
-- --------------------------------------------------------

--
-- Structure for view `__problem_accept_table`
--
DROP TABLE IF EXISTS `__problem_accept_table`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `__problem_accept_table` AS select `onlinejudge_record`.`commit_problem_id` AS `id`,count(`onlinejudge_record`.`commit_problem_id`) AS `accept` from `onlinejudge_record` where (`onlinejudge_record`.`commit_status_id` = 2) group by `onlinejudge_record`.`commit_problem_id`;

-- --------------------------------------------------------

--
-- Structure for view `__problem_external`
--
DROP TABLE IF EXISTS `__problem_external`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `__problem_external` AS select `__problem_submission_table`.`id` AS `id`,`__problem_submission_table`.`submission` AS `submission`,`__problem_accept_table`.`accept` AS `accept` from (`__problem_submission_table` left join `__problem_accept_table` on((`__problem_submission_table`.`id` = `__problem_accept_table`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `__problem_submission_table`
--
DROP TABLE IF EXISTS `__problem_submission_table`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `__problem_submission_table` AS select `onlinejudge_record`.`commit_problem_id` AS `id`,count(`onlinejudge_record`.`commit_problem_id`) AS `submission` from `onlinejudge_record` group by `onlinejudge_record`.`commit_problem_id`;

-- --------------------------------------------------------

--
-- Structure for view `__user_accept_table`
--
DROP TABLE IF EXISTS `__user_accept_table`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `__user_accept_table` AS select `onlinejudge_record`.`commit_user_id` AS `id`,count(`onlinejudge_record`.`commit_user_id`) AS `accept` from `onlinejudge_record` where (`onlinejudge_record`.`commit_status_id` = 2) group by `onlinejudge_record`.`commit_user_id`;

-- --------------------------------------------------------

--
-- Structure for view `__user_external`
--
DROP TABLE IF EXISTS `__user_external`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `__user_external` AS select `__user_submission_table`.`id` AS `id`,`__user_submission_table`.`submission` AS `submission`,`__user_accept_table`.`accept` AS `accept` from (`__user_submission_table` left join `__user_accept_table` on((`__user_submission_table`.`id` = `__user_accept_table`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `__user_submission_table`
--
DROP TABLE IF EXISTS `__user_submission_table`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `__user_submission_table` AS select `onlinejudge_record`.`commit_user_id` AS `id`,count(`onlinejudge_record`.`commit_user_id`) AS `submission` from `onlinejudge_record` group by `onlinejudge_record`.`commit_user_id`;

-- --------------------------------------------------------

--
-- Structure for view `view_problem_ex`
--
DROP TABLE IF EXISTS `view_problem_ex`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_problem_ex` AS select `onlinejudge_problem`.`id` AS `id`,`onlinejudge_problem`.`title` AS `title`,`onlinejudge_problem`.`post_date` AS `post_date`,`onlinejudge_problem`.`memory_limit` AS `memory_limit`,`onlinejudge_problem`.`time_limit` AS `time_limit`,`onlinejudge_problem`.`description` AS `description`,`onlinejudge_problem`.`pre_written_code` AS `pre_written_code`,`onlinejudge_problem`.`test_data` AS `test_data`,ifnull(`__problem_external`.`submission`,0) AS `su_count`,ifnull(`__problem_external`.`accept`,0) AS `ac_count` from (`onlinejudge_problem` left join `__problem_external` on((`onlinejudge_problem`.`id` = `__problem_external`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `view_user_ex`
--
DROP TABLE IF EXISTS `view_user_ex`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_ex` AS select `onlinejudge_user`.`id` AS `id`,`onlinejudge_user`.`username` AS `username`,`onlinejudge_user`.`password` AS `password`,`onlinejudge_user`.`department` AS `department`,`onlinejudge_user`.`announcement` AS `announcement`,`onlinejudge_user`.`register_date` AS `register_date`,`onlinejudge_user`.`last_activity_date` AS `last_activity_date`,ifnull(`__user_external`.`submission`,0) AS `su_count`,ifnull(`__user_external`.`accept`,0) AS `ac_count` from (`onlinejudge_user` left join `__user_external` on((`onlinejudge_user`.`id` = `__user_external`.`id`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `onlinejudge_record`
--
ALTER TABLE `onlinejudge_record`
  ADD CONSTRAINT `commit_problem_id_refs_id_57ff14bf` FOREIGN KEY (`commit_problem_id`) REFERENCES `onlinejudge_problem` (`id`),
  ADD CONSTRAINT `commit_status_id_refs_id_80f4e837` FOREIGN KEY (`commit_status_id`) REFERENCES `onlinejudge_response` (`id`),
  ADD CONSTRAINT `commit_user_id_refs_id_817c4f00` FOREIGN KEY (`commit_user_id`) REFERENCES `onlinejudge_user` (`id`);
--
-- Database: `phpmyadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `pma_bookmark`
--

CREATE TABLE IF NOT EXISTS `pma_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_column_info`
--

CREATE TABLE IF NOT EXISTS `pma_column_info` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma_designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma_history`
--

CREATE TABLE IF NOT EXISTS `pma_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`db`,`table`,`timevalue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma_pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`page_nr`),
  KEY `db_name` (`db_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_recent`
--

CREATE TABLE IF NOT EXISTS `pma_recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma_recent`
--

INSERT INTO `pma_recent` (`username`, `tables`) VALUES
('root', '[{"db":"onlinejudge","table":"onlinejudge_problem"},{"db":"onlinejudge","table":"onlinejudge_record"},{"db":"onlinejudge","table":"onlinejudge_response"},{"db":"onlinejudge","table":"onlinejudge_languages"},{"db":"onlinejudge","table":"django_session"},{"db":"onlinejudge","table":"onlinejudge_user"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma_relation`
--

CREATE TABLE IF NOT EXISTS `pma_relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  KEY `foreign_field` (`foreign_db`,`foreign_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_coords`
--

CREATE TABLE IF NOT EXISTS `pma_table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_info`
--

CREATE TABLE IF NOT EXISTS `pma_table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma_table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`,`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma_tracking`
--

CREATE TABLE IF NOT EXISTS `pma_tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`db_name`,`table_name`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma_userconfig`
--

CREATE TABLE IF NOT EXISTS `pma_userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
