-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 30 2024 г., 10:48
-- Версия сервера: 5.7.39-log
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `arenda`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auto`
--

CREATE TABLE `auto` (
  `id_auto` int(11) NOT NULL,
  `name_auto` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(5) NOT NULL,
  `img` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `auto`
--

INSERT INTO `auto` (`id_auto`, `name_auto`, `price`, `img`) VALUES
(1, 'audi', 500, 'img/1.jpg'),
(2, 'honda', 20000, 'img/2.jpg'),
(3, 'ford', 10000, 'img/3.jpg'),
(4, 'mersedes', 10000, 'img/4.jpg'),
(5, 'bentLy', 20000, 'img/5.jpg'),
(6, 'lada', 200, 'img/6.jpg'),
(7, 'ford', 6000, 'img/7.jpg'),
(8, 'ford', 800, 'img/8.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `fio` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `fio`, `login`, `password`) VALUES
(1, 'Петров Т.Н', 'petr', '1111petr'),
(2, 'Маркова А.Т', 'mar', '2222mar');

-- --------------------------------------------------------

--
-- Структура таблицы `zayavka`
--

CREATE TABLE `zayavka` (
  `id_zayavka` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_auto` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `zayavka`
--

INSERT INTO `zayavka` (`id_zayavka`, `id_user`, `id_auto`, `date`) VALUES
(1, 1, 1, '2024-11-12'),
(2, 2, 2, '2024-11-11'),
(3, 1, 4, '2024-11-04'),
(4, 1, 3, '2024-11-06'),
(5, 1, 3, '2024-11-15'),
(6, 2, 4, '2024-11-12');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`id_auto`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `zayavka`
--
ALTER TABLE `zayavka`
  ADD PRIMARY KEY (`id_zayavka`),
  ADD KEY `id_auto` (`id_auto`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auto`
--
ALTER TABLE `auto`
  MODIFY `id_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `zayavka`
--
ALTER TABLE `zayavka`
  MODIFY `id_zayavka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `zayavka`
--
ALTER TABLE `zayavka`
  ADD CONSTRAINT `zayavka_ibfk_1` FOREIGN KEY (`id_auto`) REFERENCES `auto` (`id_auto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zayavka_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
