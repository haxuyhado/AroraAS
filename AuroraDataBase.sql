Create DataBase AuroraData;
GO
use AuroraData;
GO

Create Table Clients
(
    id int identity(1,1) primary key,
    recipientCompany nvarchar(max),
    recipientFullName nvarchar(max) not null,
    address nvarchar(max) not null,
    phone nvarchar(max) not null,
    email nvarchar(max) not null,
	INN nvarchar(13) not null,
	OGRN nvarchar(13) not null,
	acceptScan varbinary(MAX)
);
GO

Create Table Positions
(
    id int identity not null primary key, 
    position nvarchar(max) not null
);
GO

Create Table Employees
(
    id int identity not null primary key,
    fullName nvarchar(max) not null,
    positionId int foreign key references Positions(id) not null,
    [address] nvarchar(max) not null,
    phone nvarchar(max) not null,
    email nvarchar(max) not null,
    myPassword nvarchar(16) not null	
);
GO

Create Table Products
(
    id int identity(1,1) not null primary key,
    productName nvarchar(max) not null,
    mainCharacteristics text,
    countProduct int not null,
	price money
)
GO

Create Table Orders
(
    id int identity(1,1) not null primary key,
	orderNumber nvarchar(max) not null,
    recipientId int foreign key references Clients(id),
    paymentMethod nvarchar(max),
    price money not null,
    orderStatus nvarchar(max),
    creationDate nvarchar(max),
	managerId int foreign key references Employees(id),
	contractSkan varbinary(max)
)
GO

Create Table ItemsInOrder
(
    id int identity(1,1) primary key,
    orderId int foreign key references Orders(id),
    productId int foreign key references Products(id),
	countProduct int
)
GO

Create Table CreateProduct
(
    id int identity(1,1) not null primary key,
    productId int foreign key references Products(id) not null,
    countProduct int not null,
	forOrder int foreign key references Orders(id),
	[status] nvarchar(max) not null
)
GO

insert into Positions 
values
('Менеджер'),
('Бухгалтер'),
('Складовщик'),
('Доставщик'),
('Нач. Производства'),
('Кадровик')

insert into Employees
values
('Васильева Юлия Андреевна', 1, 'г. Саратов, ул Пушкина, д. 19', '89159873599', 'manager1@gmail.com', '00000'),
('Маригин Виктор Владимирович', 1, 'г. Саратов, ул Пушкина, д. 18', '89159873599', 'manager2@gmail.com', '00000'),
('Ораков Андрей Андреевич', 1, 'г. Саратов, ул Пушкина, д. 17', '89159873599', 'manager3@gmail.com', '00000'),
('Петрунько Борис Анатольевич', 2, 'г. Саратов, ул Пушкина, д. 16', '89159873599', 'bux1@gmail.com', '00000'),
('Антропова Александра Ивановна', 2, 'г. Саратов, ул Пушкина, д. 15', '89159873599', 'bux2@gmail.com', '00000'),
('Пиратова Юлия Викторовна', 2, 'г. Саратов, ул Пушкина, д. 14', '89159873599', 'bux3@gmail.com', '00000'),
('Авербулов Даниил Викторович', 2, 'г. Саратов, ул Пушкина, д. 14', '89159873599', 'bux4@gmail.com', '00000'),
('Самсонов Юрий Борисович', 3, 'г. Саратов, ул Пушкина, д. 13', '89159873599', 'sklad1@gmail.com', '00000'),
('Териянко Виктор Петрович', 3, 'г. Саратов, ул Пушкина, д. 12', '89159873599', 'sklad2@gmail.com', '00000'),
('Вальков Андрей Васильевич', 4, 'г. Саратов, ул Пушкина, д. 11', '89159873599', 'del1@gmail.com', '00000'),
('Матриенко Олег Александрович', 4, 'г. Саратов, ул Пушкина, д. 10', '89159873599', 'del2@gmail.com', '00000'),
('Матюшина Валентина Васильевна', 5, 'г. Саратов, ул Пушкина, д. 9', '89159873599', 'nach@gmail.com', '00000'),
('Матерененко Алексей Геннадьевич', 6, 'г. Саратов, ул Пушкина, д. 8', '89159873599', 'kadr@gmail.com', '00000')

insert into Products
values
('Аппарат УЗИ', '', 4, 89900),
('Аппарат ИВЛ', '', 10, 99999.90),
('Дефибриллятор', 'ручной режим работы, питание от сети и АКБ, емкость аккумулятора 35 + 10 разрядов по 360 Дж', 12, 13990)

insert into Clients values
('Городская больница №8', 'Баранова Валентина Викторовна', 'г. Саратов, ул. Одесская, 46а', '89934567811', 'baranovvva@yandex.ru', '64530322108', '5743088965443', null),
('ООО СоцМедПомощь', 'Олегов Юрий Валентинович', 'г. Саратов, ул. Астраханская, 78', '89451788396', 'yuriihelper133@gamil.com', '16389035401', '1240532576653', null),
('ИП Орехов Андрей Анатольевич', 'Орехов Андрей Анатольевич', 'г. Саратов, Ново-Астраханское ш., 41', '+79111461113', 'orechofficial@mail.ru', '63356074753', '8055438876923', null)

-- Доп
-- Добавляем новых клиентов
INSERT INTO Clients (recipientCompany, recipientFullName, address, phone, email, INN, OGRN, acceptScan)
VALUES
('Городская больница №1', 'Смирнов Александр Иванович', 'г. Саратов, ул. Московская, 120', '89271112233', 'gb1_saratov@mail.ru', '64530123456', '1023400567891', NULL),
('МедЦентр "Здоровье"', 'Ковалева Елена Викторовна', 'г. Саратов, ул. Рахова, 156', '89275556677', 'medcentr-zdorovie@yandex.ru', '64530987654', '1098765432109', NULL),
('ООО "МедТехника"', 'Громов Дмитрий Сергеевич', 'г. Саратов, ул. Чернышевского, 88', '89274443322', 'medtechnika@mail.ru', '64530567890', '1122334455667', NULL),
('ИП Васильев П.А.', 'Васильев Петр Алексеевич', 'г. Саратов, ул. Горького, 45', '89276669988', 'vasiliev.med@yandex.ru', '64530234567', '1234567890123', NULL),
('Городская поликлиника №3', 'Николаева Ольга Борисовна', 'г. Саратов, ул. Чапаева, 34', '89273334455', 'poliklinika3@mail.ru', '64530789123', '1345678901234', NULL);

-- Добавляем новые заказы
INSERT INTO Orders (orderNumber, recipientId, paymentMethod, price, orderStatus, creationDate, managerId, contractSkan)
VALUES
('ORD-2023-005', 4, 'Безналичный расчет', 279600, 'Новый', '2023-05-12', 1, NULL),
('ORD-2023-006', 5, 'Наличный расчет', 499950, 'В обработке', '2023-05-18', 2, NULL),
('ORD-2023-007', 6, 'Безналичный расчет', 139900, 'В производстве', '2023-06-01', 3, NULL),
('ORD-2023-008', 7, 'Безналичный расчет', 89900, 'Доставка', '2023-06-05', 1, NULL),
('ORD-2023-009', 8, 'Наличный расчет', 209880, 'Завершен', '2023-06-10', 2, NULL),
('ORD-2023-010', 4, 'Безналичный расчет', 99999.90, 'Новый', '2023-06-15', 3, NULL),
('ORD-2023-011', 5, 'Безналичный расчет', 41970, 'В обработке', '2023-06-20', 1, NULL),
('ORD-2023-012', 6, 'Наличный расчет', 279800, 'В производстве', '2023-07-01', 2, NULL);

-- Добавляем товары в заказы
INSERT INTO ItemsInOrder (orderId, productId, countProduct)
VALUES
(5, 1, 3),
(5, 2, 2),
(6, 2, 5),
(7, 3, 10),
(8, 1, 1),
(9, 3, 15),
(10, 2, 1),
(11, 3, 3),
(12, 1, 2),
(12, 2, 1),
(12, 3, 5);

-- Добавляем записи о производстве
INSERT INTO CreateProduct (productId, countProduct, forOrder, [status])
VALUES
(1, 3, 5, 'В производстве'),
(2, 2, 5, 'В производстве'),
(2, 5, 6, 'Готово к отгрузке'),
(3, 10, 7, 'Произведено'),
(1, 1, 8, 'Готово к отгрузке'),
(3, 15, 9, 'Произведено'),
(2, 1, 10, 'В производстве'),
(3, 3, 11, 'В производстве'),
(1, 2, 12, 'В производстве'),
(2, 1, 12, 'В производстве'),
(3, 5, 12, 'В производстве');
