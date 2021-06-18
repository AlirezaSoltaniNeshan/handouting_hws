--q1
select ProductTbl.* , FactorTbl.* 
from ProductTbl join SubFactorTbl on SubFactorTbl.Pid=ProductTbl.Pid
join FactorTbl on FactorTbl.Fid=SubFactorTbl.Fid
where FactorTbl.Fdate between 1390.10.12 and 1390.10.15

--q2
create procedure getDate @date data()
AS
SELECT ProductTbl.*, 
(ProductTbl.pBuyPrice-SubFactorTbl.oDiscount) 
FROM Producttbl join SubFactortbl as sub on pr.pid=sub.pid
WHERE City = @date
EXEC getDate @date = 1390.01.13;

--q3

create view newView 
as
select ProductTbl.Pid,
ProductTbl.Pname, count(SubFactorTbl.OCount)
from ProductTbl join SubFactorTbl 
on SubFactorTbl.Pid=ProductTbl.Pid
group by ProductTbl.Pid, ProductTbl.Pname

--q4
create 
procedure saver @oCount int, @Pid int, @Cid int(), @fDate date()
as 
begin 
select * from  Producttbl join SubFactortbl
ON Producttbl.Pid=SubFactortbl.Pid
join Factortbl on Factortbl.Fid = SubFactortbl.Fid
join Customertbl on Customertbl.Cid=Factortbl.Cid
where oCount=@oCount and Pid=@Pid and Cid=@Cid and FDate=@fDate;
end

--q5
SELECT Cname, Cfamily, SUM(OCount) FROM Customertbl
JOIN Factortbl ON Factortbl.Cid = Customertbl.Cid
JOIN SubFactortbl ON SubFactortbl.Fid = Factortbl.Fid
HAVING  SUM(OCount) > (SELECT AVG(OCount) FROM SubFactortbl);

--q6
create trigger log_of_changes on Shopdb
after insert, update, delete
as 
declare @op nvarchar(50) 
if exists(select * from inserted)
begin
if exists(select * from deleted)
	set @op='Updated successful'
else 
	set @op='Inseted succssfull'
end 
else
	set @op='Deleted successful'
insert into ShopiLog values(SUSER_SNAME(), GETDATE(), 'ShopDb', @op)


