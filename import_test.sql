-- Creation of a test base...

CREATE DATABASE bank;

-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 18 2024 г., 13:07
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bank`
--

-- --------------------------------------------------------

--
-- Структура таблицы `borrowed_funds`
--

CREATE TABLE `borrowed_funds` (
  `id_found` int(11) NOT NULL,
  `id_individual` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `interest_rate` int(11) NOT NULL,
  `time` varchar(20) NOT NULL,
  `conditions` text NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `borrowers`
--

CREATE TABLE `borrowers` (
  `id_borrower` int(11) NOT NULL,
  `inn` varchar(20) NOT NULL,
  `juridical_or_individual` binary(1) NOT NULL,
  `address` varchar(100) NOT NULL,
  `sum` int(11) NOT NULL,
  `conditions` text NOT NULL,
  `legal_note` text NOT NULL,
  `list_of_contracts` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `borrowers`
--

INSERT INTO `borrowers` (`id_borrower`, `inn`, `juridical_or_individual`, `address`, `sum`, `conditions`, `legal_note`, `list_of_contracts`) VALUES
(1, '12331233', 0x31, 'Moscow Pobeda street house 3', 312, 'No conditions', '-', '-'),
(2, '3454323', 0x30, 'Moscow Pobeda street house 10', 100, 'Need to do at 3 march', 'asdasd', '-'),
(3, '3454111', 0x31, 'Samara Pobeda street house 3', 1000, 'Need to do at 3 december', 'test2', 'Moloko organization'),
(4, '1114111', 0x31, 'Moscow Mira street house 3', 2000, 'No conditions', 'test3', 'Moloko2 organization'),
(5, '333333', 0x30, 'Moscow Mira street house 13', 4000, 'No conditions', 'test', 'Moloko organization');

-- --------------------------------------------------------

--
-- Структура таблицы `corporate_loans`
--

CREATE TABLE `corporate_loans` (
  `id_loan` int(11) NOT NULL,
  `id_individual` int(11) NOT NULL,
  `id_organization` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  `time` varchar(20) NOT NULL,
  `percent` int(11) NOT NULL,
  `conditions` text NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `individuals`
--

CREATE TABLE `individuals` (
  `id_individual` int(11) NOT NULL,
  `id_borrower` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `patronymic` varchar(45) NOT NULL,
  `passport` varchar(14) NOT NULL,
  `itn` int(11) NOT NULL,
  `snils` int(11) NOT NULL,
  `driver_card` int(11) NOT NULL,
  `additional_docs` varchar(100) NOT NULL,
  `additional_information` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `borrowed_funds`
--
ALTER TABLE `borrowed_funds`
  ADD PRIMARY KEY (`id_found`),
  ADD KEY `id_individual` (`id_individual`);

--
-- Индексы таблицы `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id_borrower`);

--
-- Индексы таблицы `corporate_loans`
--
ALTER TABLE `corporate_loans`
  ADD PRIMARY KEY (`id_loan`),
  ADD KEY `id_individual` (`id_individual`);

--
-- Индексы таблицы `individuals`
--
ALTER TABLE `individuals`
  ADD PRIMARY KEY (`id_individual`),
  ADD KEY `id_borrower` (`id_borrower`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id_borrower` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `borrowed_funds`
--
ALTER TABLE `borrowed_funds`
  ADD CONSTRAINT `borrowed_funds_ibfk_1` FOREIGN KEY (`id_individual`) REFERENCES `individuals` (`id_individual`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `corporate_loans`
--
ALTER TABLE `corporate_loans`
  ADD CONSTRAINT `corporate_loans_ibfk_1` FOREIGN KEY (`id_individual`) REFERENCES `individuals` (`id_individual`);

--
-- Ограничения внешнего ключа таблицы `individuals`
--
ALTER TABLE `individuals`
  ADD CONSTRAINT `individuals_ibfk_1` FOREIGN KEY (`id_borrower`) REFERENCES `borrowers` (`id_borrower`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
