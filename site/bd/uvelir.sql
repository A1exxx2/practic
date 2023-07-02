-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 02 2023 г., 23:27
-- Версия сервера: 10.4.25-MariaDB
-- Версия PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `uvelir`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `name`, `phone`, `email`) VALUES
(1, 'Иванов Иван Иванович', '+7(111)111-11-11', 'ivanov@mail.ru'),
(2, 'Петров Петр Петрович', '+7(222)222-22-22', 'petrov@mail.ru'),
(3, 'Сидоров Сидор Сидорович', '+7(333)333-33-33', 'sidorov@mail.ru'),
(4, 'Никитин Никита Никитович', '+7(444)444-44-44', 'nikitin@mail.ru'),
(5, 'Козлова Елена Сергеевна', '+7(555)555-55-55', 'kozlova@mail.ru'),
(6, 'Смирнов Иван Александрович', '+7(666)666-66-66', 'smirnov@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `gemstones`
--

CREATE TABLE `gemstones` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `carat_weight` decimal(10,0) NOT NULL,
  `cut` text NOT NULL,
  `color` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gemstones`
--

INSERT INTO `gemstones` (`id`, `name`, `carat_weight`, `cut`, `color`) VALUES
(1, 'Александрит', '2', 'Круговая огранка', 'Зеленый/Красный'),
(2, 'Аметист', '3', 'Овальная огранка', 'Фиолетовый'),
(3, 'Аквамарин', '2', 'Прямоугольная огранка', 'Голубой'),
(4, 'Бриллиант', '2', 'Круговая огранка', 'Бесцветный'),
(5, 'Изумруд', '2', 'Круговая огранка', 'Зеленый'),
(6, 'Рубин', '3', 'Овальная огранка', 'Красный');

-- --------------------------------------------------------

--
-- Структура таблицы `jewelry_pieces`
--

CREATE TABLE `jewelry_pieces` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `master_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `gemstone_id` int(11) DEFAULT NULL,
  `metal` text NOT NULL,
  `weight` decimal(10,0) NOT NULL,
  `cost` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `jewelry_pieces`
--

INSERT INTO `jewelry_pieces` (`id`, `order_id`, `master_id`, `name`, `gemstone_id`, `metal`, `weight`, `cost`) VALUES
(1, 1, 1, 'Кольцо', 1, 'Золото', '5', '1000'),
(2, 1, 2, 'Серьги', 2, 'Серебро', '2', '500'),
(3, 2, 3, 'Ожерелье', 3, 'Золото', '10', '2000'),
(4, 2, 2, 'Браслет', 4, 'Серебро', '3', '250'),
(5, 3, 3, 'Колье', 1, 'Золото', '7', '1500'),
(6, 3, 2, 'Брошь', NULL, 'Золото', '1', '100');

-- --------------------------------------------------------

--
-- Структура таблицы `masters`
--

CREATE TABLE `masters` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `masters`
--

INSERT INTO `masters` (`id`, `name`) VALUES
(1, 'Григорьев Марк Юрьевич'),
(2, 'Кузнецов Станислав Анатольевич'),
(3, 'Тюрина Юлия Сергеевна');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `master_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `material` text NOT NULL,
  `order_cost` decimal(10,0) NOT NULL,
  `date_created` date NOT NULL,
  `date_due` date NOT NULL,
  `date_completed` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `master_id`, `client_id`, `description`, `material`, `order_cost`, `date_created`, `date_due`, `date_completed`) VALUES
(1, 1, 2, 'Починить кольцо', 'Золото', '25000', '2022-01-01', '2022-01-01', '2022-01-18'),
(2, 2, 4, 'Починить ожерелье', 'Металл', '35000', '2021-06-15', '2021-07-15', '2022-01-19'),
(3, 3, 1, 'Починить серьги', 'Битум', '15000', '2021-07-01', '2021-07-10', '2022-01-19'),
(4, 1, 3, 'Починить кольцо', 'Золото', '20000', '2021-07-15', '2021-08-15', '2022-01-01'),
(5, 1, 5, 'Покрасить серьги', 'Серебро', '30000', '2021-08-01', '2021-08-31', '2021-09-19'),
(6, 3, 6, 'Починить кольцо', 'Медь', '5000000', '2022-01-01', '2023-01-01', '2023-03-12');

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `amount`, `date_created`) VALUES
(1, 1, '100', '2022-01-01'),
(2, 2, '200', '2022-01-02'),
(3, 1, '50', '2022-01-03'),
(4, 3, '76', '2022-01-04'),
(5, 2, '150', '2022-01-05'),
(6, 4, '300', '2022-01-06');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `six`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `six` (
`name` text
,`total_spent` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `two`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `two` (
`id` int(11)
,`order_id` int(11)
,`name` text
,`gemstone_id` int(11)
,`metal` text
,`weight` decimal(10,0)
,`cost` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `code`) VALUES
(1, '123@123.ru', '123123', '0'),
(2, 'da-2333@mail.ru', '123456', '0');

-- --------------------------------------------------------

--
-- Структура для представления `six`
--
DROP TABLE IF EXISTS `six`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `six`  AS SELECT `clients`.`name` AS `name`, sum(`orders`.`order_cost`) AS `total_spent` FROM (`clients` join `orders` on(`clients`.`id` = `orders`.`client_id`)) GROUP BY `clients`.`name` HAVING sum(`orders`.`order_cost`) > 10000100001000010000  ;

-- --------------------------------------------------------

--
-- Структура для представления `two`
--
DROP TABLE IF EXISTS `two`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `two`  AS SELECT `jewelry_pieces`.`id` AS `id`, `jewelry_pieces`.`order_id` AS `order_id`, `jewelry_pieces`.`name` AS `name`, `jewelry_pieces`.`gemstone_id` AS `gemstone_id`, `jewelry_pieces`.`metal` AS `metal`, `jewelry_pieces`.`weight` AS `weight`, `jewelry_pieces`.`cost` AS `cost` FROM `jewelry_pieces` WHERE `jewelry_pieces`.`cost` > 1000100010001000  ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gemstones`
--
ALTER TABLE `gemstones`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jewelry_pieces`
--
ALTER TABLE `jewelry_pieces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gemstone_id` (`gemstone_id`),
  ADD KEY `master_id` (`master_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `masters`
--
ALTER TABLE `masters`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `master_id` (`master_id`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `gemstones`
--
ALTER TABLE `gemstones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `masters`
--
ALTER TABLE `masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `jewelry_pieces`
--
ALTER TABLE `jewelry_pieces`
  ADD CONSTRAINT `jewelry_pieces_ibfk_1` FOREIGN KEY (`gemstone_id`) REFERENCES `gemstones` (`id`),
  ADD CONSTRAINT `jewelry_pieces_ibfk_2` FOREIGN KEY (`master_id`) REFERENCES `masters` (`id`),
  ADD CONSTRAINT `jewelry_pieces_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`master_id`) REFERENCES `masters` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
