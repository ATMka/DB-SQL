#Список студентов
SELECT * FROM student;

#Список студентов по алфавиту
select * from student
order by name;

#Список оценок по предмету «Java» (с фамилиями студентов)
select m.subject, st.name, m.mark from marks m
  join student st on m.student_id=st.student_id
  where m.subject='Java';

#Средняя оценка студента Петрова
select st.name, AVG(m.mark) as avg_marks from marks m
  join student st on m.student_id=st.student_id
  where st.student_id='3';

#Средняя оценка по предмету «Java» по каждой группе
select st.group, AVG(m.mark) as avg_marks from marks m
  join student st on m.student_id=st.student_id
  where m.subject='Java'
  group by st.group
  order by st.group;

#Количество оценок каждого студента
select st.student_id,st.name,count(m.mark) from student st
  join marks m on st.student_id=m.student_id
  group by st.student_id
  order by st.name;

#Список студентов, имеющих ровно две двойки
select st.student_id,st.name from student st
  join marks m on st.student_id=m.student_id
  where m.mark='2'
  group by st.student_id
  having COUNT(m.mark)=2
  order by st.name;

#Список предметов, по которым количество двоек больше двух
select m.marks_id,m.subject from marks m
  where m.mark='2'
  GROUP BY m.subject
  HAVING COUNT(m.mark)>2
  order by m.subject;

#Удалить студентов, имеющих три двойки
delete from student
where student_id in (
select student_id from (
  select st.student_id from student st
  join marks m on st.student_id=m.student_id
  where m.mark='2'
  group by st.student_id
  having COUNT(m.mark)=3) as students
);