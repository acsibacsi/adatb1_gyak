--Masodik gyak
--2
select gyumolcs from szeret
minus
select gyumolcs from szeret where nev = 'Micimack�';

--5
select nev from szeret where gyumolcs = 'k�rte'
union
select nev from szeret where gyumolcs = 'alma';

--6
select nev from szeret where gyumolcs = 'k�rte'
intersect
select nev from szeret where gyumolcs = 'alma';

-------------------------------------------------

select * from dolgozo;

--7
select dnev, fizetes, fizetes*2, oazon from dolgozo where oazon = 10;

--3
select dnev, jutalek from dolgozo where jutalek > 600;

--4
select dnev, jutalek from dolgozo
minus
select dnev, jutalek from dolgozo where jutalek > 600;

--9
select dnev, fonoke from dolgozo where fonoke is null;