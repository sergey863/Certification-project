--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-12-11 14:05:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 17506)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17505)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 17512)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17511)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 17518)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp without time zone,
    number character varying(255),
    price real NOT NULL,
    status integer,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17517)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 17524)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17523)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 17532)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller text NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17541)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17540)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 17531)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3350 (class 0 OID 17506)
-- Dependencies: 210
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Техника для дома');
INSERT INTO public.category (id, name) VALUES (2, 'Техника для кухни');
INSERT INTO public.category (id, name) VALUES (3, 'Телевизоры и цифровое ТВ');


--
-- TOC entry 3352 (class 0 OID 17512)
-- Dependencies: 212
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (1, 'f93d1b7f-08c6-4d89-8bb3-387b177ed607.10031543b.webp', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (2, '4377a005-fcb1-4487-9b23-58b99e1afb71.10031543b1.webp', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (3, 'c3d20ad0-ffee-4eae-863c-def87441f600.10031543b4.webp', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (4, '331ca853-ad7b-4a7b-be52-eb246ae305b2.10031543b5.webp', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (5, '513cf18a-58a5-4830-ac1d-495ccd0c95f2.10031543b6.webp', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (6, '3f38fc96-8875-41c3-85d7-ef8ba59e9845.10026500bb.webp', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, 'cc8fb305-4548-4342-b928-d58c2dd92ad6.10026500bb1.webp', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, '8111f031-a062-4360-8b1d-67b7260a3068.10026500bb3.webp', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, '273a467b-bf4f-40b9-aa9d-58ba2b855846.10026500bb5.webp', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, '848ebfca-388c-47c5-bcfe-08aa1f5d3bad.10026500bb6.webp', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, '24b4044e-1bff-4dc2-a9ae-486b4910e4bd.10027330bb.webp', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, 'bf166679-7245-424c-8667-f07875e8e319.10027330bb1.webp', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, 'c2842d50-78e8-4782-bf68-7a9119105934.10027330bb3.webp', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, '0ca79f6c-acb5-4c38-aec7-c988de64a868.10027330bb5.webp', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, '23f3341b-cb37-48c6-8355-ea8a14ec935a.10027330bb23.webp', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, '54c87ccd-4cef-49ba-b46d-ed322db1ac76.20084006bb.webp', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, '0265f847-96a5-4d8f-904c-15d98e5675bf.20084006bb2.webp', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, '6d3a2ae2-04ec-450b-b209-c9ff2e993250.20084006bb3.webp', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, '0d2740ed-3ec1-4209-a8b2-cba518648150.20084006bb4.webp', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, 'f48457b9-0733-47d2-a121-13b30dc1a0ae.20084006bb7.webp', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, '30391a79-ea56-4cda-b26d-b333561b052a.20070609bb.webp', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, '86fb8dce-5386-44dd-bf3c-58b7f6577848.20070609bb1.webp', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '74b825ce-6776-49c2-9a45-721fcef54772.20070609bb3.webp', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '9b80affc-e3a9-4e1e-a5c3-615d0f2ff6c7.20070609bb4.webp', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '3707f53b-3930-4f6a-8360-57c281392a9a.20070609bb5.webp', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, '7eeb8c98-cdde-49a9-b558-c777c95f6a8c.20067142bb.webp', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '5d39ea7c-abe8-40cd-bdde-03365f154f85.20067142bb1.webp', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, 'e4d20bcf-c602-4a31-9e79-d58ce26c1455.20067142bb2.webp', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, '6ec921a8-5967-471e-855e-1616a33de3a5.20067142bb3.webp', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '23715030-0610-4e76-91a9-f3adbf374f6a.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, '5a1f730d-17b5-44a6-a20c-f431eda7a231.20083257bb.webp', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, 'cbd4d5b6-9c78-44f2-bdf7-cda31c3ab1e3.20083257bb1.webp', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, 'ede3128b-4d58-4278-a500-a5eb04bd7388.20083257bb2.webp', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, '3951f130-0ffb-4f2d-8a49-35ae88ec3031.20083257bb7.webp', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '456b1af4-2221-40ac-ac48-ac84696a8fde.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, 'bc31a1e9-9a70-44d2-a76e-440110b38fca.20056835bb.webp', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, '57411074-a0a6-4865-9c3c-48785522ccf8.20056835bb1.webp', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, 'ba98bcd7-3eb6-4469-abdb-eb8222fd009e.20056835bb2.webp', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, 'ba621a92-460b-4ccf-8324-08c5ddcdcacb.20056835bb3.webp', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, '2f9870f9-bc36-44e8-858c-4834215027b5.20056835bb4.webp', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, '903b37f0-49a2-444c-a1b4-788fda838f21.20070907bb.webp', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, '3be7d4ef-cbde-4ca0-b7c9-e2c836953a30.20070907bb1.webp', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, '6d1d50c2-4ebb-47a7-8736-8a47cca50968.20070907bb2.webp', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, 'd9046bcb-da10-48a7-a482-61e129d682b4.20070907bb3.webp', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, '45ad7eda-6fdf-48c1-a3f5-7062d6ed49f1.20070907bb4.webp', 9);


--
-- TOC entry 3354 (class 0 OID 17518)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2022-12-09 17:08:18.879978', '62a33b59-ce16-4fd3-9fb0-ab0e705cb12f', 69999, 5, 2, 7);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2022-12-10 08:29:34.956435', 'de25458d-8bab-44e0-a636-ae2415cb9af9', 19999, 5, 2, 1);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (3, 1, '2022-12-11 13:45:36.167836', 'c21d3c5f-6210-47e3-bf39-cf4da6965309', 19999, 5, 2, 1);


--
-- TOC entry 3356 (class 0 OID 17524)
-- Dependencies: 216
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (2, 'user1', '$2a$10$yqLaQ6AuSvnN3PFHtxV4q.QNNxpE5efflp3DZO.WSWP3rybxrDP5i', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$MjgWuruWoQY0l.YUB7ojXeCxFN/t5PC35KgX8auqFbTWYZ8dqdlPK', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (3, 'user2', '$2a$10$NFKc3qPXs3iYGZlwby8nbeEhuwF2Dg7o9HNscGGxKgT4YjgCpbCDm', 'ROLE_USER');


--
-- TOC entry 3358 (class 0 OID 17532)
-- Dependencies: 218
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (2, '2022-12-09 16:44:44.480857', 'Телевизор Haier 32 Smart TV MX позволяет получить качественное изображение, раскрывающее все преимущества ваших любимых фильмов и сериалов. Его современная HD-матрица показывает чёткую картинку с яркими, насыщенными цветами и оптимальной контрастностью.

SMART-ТЕХНОЛОГИИ
Android TV предлагает наибольший выбор приложений – от онлайн-кинотеатров Okko, Netflix и Megogo до мессенджеров, клиентов социальных сетей и простых игр. Телевизор изучает ваши предпочтения и подбирает наиболее интересный контент.

И ДАЖЕ БОЛЬШЕ
Встроенный Bluetooth-адаптер позволяет использовать смартфон в качестве управления и подключать беспроводные колонки. USB-плеер даёт возможность смотреть видео и слушать музыку в любой момент даже без доступа к интернету.', 15999, 'Ситилинк', 'Телевизор Haier 32 Smart TV MX', 'Ростов-на-Дону', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (4, '2022-12-09 16:56:58.232861', 'Страна: Турция
Срок службы: 5 лет
Ключевые преимущества: защита от перенаполнения водой, низкий расход воды и электроэнергии
Габаритные размеры (В*Ш*Г): 84.5*59.7*41.6 см
Двигатель: Мотор асинхронный
Максимальная загрузка: 6 кг
Объем барабана: 41 л
Режимы работы: полоскание+Отжим, предварительная стирка, режим "антиаллергия", деликатная стирка, джинсы, ручная стирка,
синтетика, цветные ткани, ускоренная стирка, хлопок, шерсть, экономичная стирка ECO.
Максимальная скорость отжима: 1000 об/мин
Расход воды за цикл: 43 л
Уровень шума при стирке: 58 дБ
Уровень шума при отжиме: 76 дБ
Диаметр люка: 33 см
Материал двери: стекло
Материал бака: пластик
Открытие дверцы: налево
Потребляемая мощность: 1850 Вт
Цвет: белый
Вес: 60.5 кг', 19999, 'Эльдорадо', 'Стиральная машина узкая Daewoo WM610T2WU9RU', 'Ростов-на-Дону', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (5, '2022-12-09 16:59:10.639556', 'В пылесосе Tefal Compact Power XXL TW4826EA компактность сочетается с высокой производительностью. Он хорошо подходит для уборки как больших помещений, так и в условиях ограниченного пространства.

ПРЕВОСХОДНЫЙ РЕЗУЛЬТАТ
Мотор, установленный в этой модели, экономно потребляет электроэнергию и работает с низким уровнем шума. В то же время он достаточно мощный для того, чтобы эффективно собирать пыль с пола и ковров.

ЦИКЛОННАЯ ТЕХНОЛОГИЯ
Загрязнения попадают в многоразовый контейнер. В любой момент вы можете достать его и опустошить — благодаря системе Clean Express это делается быстро и просто — а затем вернуть на место.

ДЛЯ РАЗНЫХ ЗАДАЧ
В комплект входят три насадки. Помимо основной щётки, предусмотрены аксессуары для удаления мусора из щелей и ухода за мягкой мебелью.', 10999, 'М-Видео', 'Пылесос с контейнером для пыли Tefal COMPACT POWER XXL TW4826EA', 'Москва', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (6, '2022-12-09 17:01:18.720859', 'Сушильная машина DA92IL от бренда Gorenje с ионизатором IONTECH выполняет сушку воздухом, насыщенным отрицательными ионами. Это помогает разгладить абсолютно все складки на вещах, удалить большую часть аллергенов и убрать накопившийся электростатический заряд. Результат — свежий аромат белья и легкое проглаживание.

Барабан с волновой перфорацией и 3D-формой ребер смягчает волокна, поэтому уход за одеждой и другими предметами получается еще более деликатным.', 71499, 'Ситилинк', 'Сушильная машина Gorenje DA92IL', 'Москва', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (7, '2022-12-09 17:03:58.930858', 'Холодильник Gorenje NRS918FMX выполнен в металлическом корпусе серого цвета и оснащен колесами и двумя регулируемыми ножками. Объем основной камеры — 334 л, морозильной — 174 л. Обе камеры оснащены автоматической системой разморозки и системой MultiFlow, которая отвечает за циркуляцию воздуха.
Холодильник с классом энергоэффективности А++ и мощностью замораживания 11 кг/сутки работает на базе инверторного компрессора с хладагентом типа R600A. В холодильном отделении установлена полка для хранения бутылок, три дверных полки, льдогенератор, пять стеклянных полки и два лотка для хранения яиц. В морозильной камере расположены четыре дверных кармана, пять стеклянных полок и два выдвижных ящика. Размер холодильника — 1786х910х643 мм, вес — 85 кг.', 69999, 'М-Видео', 'Холодильник (Side-by-Side) Gorenje NRS918FMX', 'Ростов-на-Дону', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (8, '2022-12-09 17:06:18.87404', 'Электрочайник Tefal Glass Kettle KI520530 – настоящее украшение кухни. Он оборудован прозрачной колбой из термоустойчивого стекла и подсветкой, поэтому вы можете любоваться игрой пузырьков в воде во время закипания. Также для производства этой модели использовалась прочная сталь, которая не боится коррозии.

ЭФФЕКТИВНО И УДОБНО
Прибор оборудован скрытым нагревательным элементом мощностью 2200 Вт, обеспечивающим быстрое кипячение и упрощающим уход за устройством. Установленный в носике фильтр не позволяет накипи попадать в чашку.

БЕЗОПАСНОСТЬ
Система автоматического отключения мгновенно срабатывает, когда вода достигает температуры 100 градусов, а также при снятии с базы. Чайник не будет работать при пустом резервуаре и критически маленьком объёме воды.', 4999, 'М-Видео', 'Электрочайник Tefal Glass Kettle KI520530', 'Ростов-на-Дону', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (9, '2022-12-09 17:07:45.961858', 'Микроволновая печь Sharp R6800RK максимально упростит приготовление. В ней есть шесть автоматических программ, включая запекание картофеля, тушение замороженных овощей и жарку попкорна. Конечно, вы можете разогревать готовые блюда и напитки. В любом случае сложные расчёты вам не понадобятся – просто укажите массу продуктов и нажмите кнопку старта.

УДОБНО И ЭКОНОМИЧНО
Микроволновка предлагает функцию кухонного таймера – она может подавать сигнал через заданное время, не включая нагрев. А в экорежиме устройство автоматически отключает подсветку, уменьшая энергопотребление.

СОЧНЫЕ И ХРУСТЯЩИЕ
Готовьте овощи, мясо и рыбу по любимым рецептам – гриль зажарит их до золотистой корочки, но сохранит естественную влажность изнутри.', 8999, 'Эльдорадо', 'Микроволновая печь с грилем Sharp R6800RK', 'Ростов-на-Дону', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (1, NULL, 'Телевизор Samsung UE32N5000AU — модель в корпусе черного цвета с тонкими рамками. Экран с диагональю 32 дюйма (81,2 см) формата 16:9, выполненный с использованием технологии LED, отображает картинку разрешением 1920х1080 пикселей. Частота обновления — 50 Гц, что обеспечивает плавную смену кадров. Цифровое шумоподавление убирает искажения. Акустическая система мощностью 10 Вт при поддержке Dolby Digital Plus выдает громкий и чистый звук. Модель поддерживает Smart TV, что гарантирует доступ в Сеть для запуска стриминговых сервисов и поиска необходимого контента.
Модуль Bluetooth обеспечивает обмен данными с совместимыми устройствами. Управление осуществляется посредством пульта ДУ, оснащенного двумя батарейками типа ААА, или смартфона. При необходимости можно записывать программы с ТВ на USB-устройство. Есть Sleep-таймер для отключения телевизора в конкретное время.
Модель оснащена тюнером DVB T2/C/S2. Установлены разъемы: HDMI версии 1.4, порт USB, оптический выход Toslink, слот для модуля DVB CAM. Потребляемая мощность телевизора — 59 Вт. За безопасность отвечает «Защита от детей», которая закрывает доступ к управлению устройством. Установка осуществляется на входящую в комплект подставку.', 19999, 'М-Видео', 'Телевизор Samsung UE32N5000AU', 'Ростов-на-Дону', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (3, NULL, 'Philips the One 50PUS8506/60 — телевизор с процессором P5 Perfect Picture, поддержкой HDR 10+ и подсветкой Ambilight. В нем реализованы технологии Dolby Vision и Dolby Atmos. Диагональ LED-экрана — 50 дюймов, разрешение — 3840 х 2160 пикселей.

В модели есть цифровой тюнер DVB-T/T2/C/S/S2. Суммарная мощность динамиков — 20 Вт. Операционная система — Android 10.0. Пульт дистанционного управления — инфракрасный. Предусмотрена поддержка Smart TV. Доступны Sleep-таймер, встроенные часы и защита от детей.

Есть два способа подключения к интернету: беспроводной — по Wi-Fi, кабельный — через порт LAN. Внешние устройства и носители информации подсоединяются через интерфейсы HDMI и USB, есть оптический выход Toslink и аудиоразъем 3,5 мм.', 53999, 'М-Видео', 'Телевизор Philips The One 50PUS8506/60', 'Москва', 3);


--
-- TOC entry 3360 (class 0 OID 17541)
-- Dependencies: 220
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 55, true);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 3, true);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 3, true);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 35, true);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 217
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 11, true);


--
-- TOC entry 3191 (class 2606 OID 17510)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 17516)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 17522)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 17530)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 17545)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 17539)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 17547)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3205 (class 2606 OID 17553)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3207 (class 2606 OID 17563)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3206 (class 2606 OID 17558)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3204 (class 2606 OID 17548)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3209 (class 2606 OID 17573)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3208 (class 2606 OID 17568)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2022-12-11 14:05:28

--
-- PostgreSQL database dump complete
--

