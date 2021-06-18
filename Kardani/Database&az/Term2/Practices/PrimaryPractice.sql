use university
Go 
select * from C
select * from p
select * from S
select * from R

-- Q1
	select S.Sname, S.Sfamily 
	from S join R on R.Sid=S.Sid 
	join C on C.Cid=R.Cid 
	where R.Cid = (select C.Cid from C where C.Cname=N'پایگاه داده')
	
-- ًQ2 
	select P.Pid as N'کد اساتیدی که تو این ترم نیستند' from P
	where P.Pid in(	select P.Pid from P 
	except 
	select R.Pid from R where R.Rmid='921') 
	-- or 
	select P.Pid from P 
	except 
	select R.Pid from R where R.Rmid='921'
	
-- Q3
	select MAX(R.Rnum) as N'High score' from R where R.Cid='1114'

-- Q4
	
	select S.*, R.Rnum from S join R on R.Sid=S.Sid where R.Rnum = (select MAX(R.Rnum) from R where R.Cid='1114') and R.Cid='1114'
	
	select COUNT(distinct R.Cid) from R where R.Pid='111'
	
-- Q5
	-- چه کسانی انتخاب واحده کرده اند؟
	select distinct S.Sfamily, S.Sname from S inner join R on R.Sid=S.Sid where R.Rmid='921'

-- Q6
	-- اول بدست آوردن شماره دانشجویی کسایی که انتخاب واحد نکرده اند
	select S.Sid from S 
	except 
	select R.Sid from R
	-- شرط این مورد
	select S.Sfamily, S.Sname from S where S.Sid in(select S.Sid from S 
	except 
	select R.Sid from R where R.Rmid='921')
	
-- Q7
	select distinct R.Pid as N'کد اساتید', COUNT(Pid) as N'تعداد دروس اخذ شده' from R where R.Rmid='921' group by R.Pid
	
	select R.Pid, COUNT(C.Cname) from R join C on C.Cid=R.Cid group by R.Pid 
	
	/*select 
		R.Pid,
		Count(distinct C.Cid)
		from R join C on C.Cid=R.Cid where R.Rmid='921'
		group by R.Pid*/
		
		
	select R.Pid, COUNT(distinct R.Cid) from R group by R.Pid
		
		

	
-- Q8
	-- شکل ساده و فقط شماره دانشجویی افراد
	select R.Sid as N'شماره دانشجویی', COUNT(C.Cid) from R join C on C.Cid=R.Cid group by R.Sid
	
	select 
		S.Sid as N'شماره دانشجویی',
		S.Sfamily as N'نام خانوادگی',
		S.Sname as N'نام',
		count(C.Cid)as N'تعداد درس های اخذ شده دانشجویان'
	from S join R on S.Sid=R.Sid join C on C.Cid=R.Cid 
	where R.Rmid='921' group by S.Sid, S.Sfamily, S.Sname
	
-- Q9 
	select
	 R.Sid as N'شماره دانشجویی',
	 AVG(R.Rnum) as N'معدل' 
	 from R where R.Rmid='921' group by R.Sid
	
-- Q10
	select R.Sid as N'شماره دانشجویان', sum(C.unit)as N'تعداد واحد اخذ شده' from R join C on R.Cid=C.Cid group by R.Sid 
	
	-- اگر به همراه نام ونام خانودگی باشد
	select 
		S.Sfamily as N'نام خانوادگی',
		S.Sname as N'نام',
		S.Sid as N'َشماره دانشجویی',
		sum(C.unit)as N'تعداد کل واحد های اخذ شده'
	from S join R on R.Sid=S.Sid join C on C.Cid=R.Cid
	group by S.Sfamily, S.Sname, S.Sid
	

exec getAvg 88004, 921

select S.Sid, S.Sfamily, S.Sname, C.Cid, C.Cname from S join R 
on R.Sid=S.Sid join C on C.Cid=R.Cid group by S.Sid, S.Sfamily, S.Sname, C.Cid, C.Cname

select Sid, Sfamily, count(Cid) cc from universJoiner group by Sid, Sfamily order by cc  ASC
select * from universJoiner
