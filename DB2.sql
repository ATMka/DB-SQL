#Вставим пользователей из первой db и немножко рандомной магии
    INSERT INTO db2.users(user_id,full_name,billing_address,login,password)
      select st.student_id,st.name,char(65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26 USING utf8),
      char(65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26 USING utf8),
      char(65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26,65+rand()*26 USING utf8) from db1.student st;
 
#Список ставок данного пользователя
SELECT * from bids
  where users_user_id = '1';
#Список лотов данного пользователя
  SELECT * from items
    where users_user_id='3';
#Поиск лотов по подстроке в названии
  SELECT * from items
    where LOWER(title) like LOWER('%ПАНАМКА%')
#Поиск лотов по подстроке в описании
  SELECT * from items
    where LOWER(description) like LOWER('%НА%');
#Средняя цена лотов каждого пользователя
  SELECT u.user_id,u.full_name, AVG(i.start_price) from items i
  join users u on i.users_user_id=u.user_id
    GROUP BY u.user_id;
#Максимальный размер имеющихся ставок на каждый лот
select i.item_id,MAX(b.bid_value) from bids b
  join items i on b.items_item_id=i.item_id
  group by i.item_id;
#Список действующих лотов данного пользователя
  select i.item_id,i.title,i.description,i.start_price,i.start_price,i.bid_increment from items i
    JOIN users u on i.users_user_id=u.user_id
    where u.user_id=1;
#Добавить нового пользователя
  INSERT INTO users(full_name,billing_address,login,password) VALUES('Alexey Biyanov','Izhevsk','1','1');
#Добавить новый лот
  INSERT INTO items(title,description,start_price,bid_increment,start_date,stop_date,by_it_now, users_user_id) VALUES('Комп','Рабочий', '100','50','01.01.2019','31.12.2019','NO!',5);
#Удалить ставки данного пользователя
delete from bids
  where users_user_id=1;
#Удалить лоты данного пользователя
  delete from items
  where users_user_id=1;
#Увеличить стартовые цены товаров данного пользователя вдвое
  UPDATE items i
    join users u on i.users_user_id=u.user_id
    set i.start_price=i.start_price*2
    where u.full_name='Алина';
