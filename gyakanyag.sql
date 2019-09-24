--Masodik gyak
--2
select gyumolcs from szeret
minus
select gyumolcs from szeret where nev = 'Micimackó';

--5
select nev from szeret where gyumolcs = 'körte'
union
select nev from szeret where gyumolcs = 'alma';

--6
select nev from szeret where gyumolcs = 'körte'
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

--8
select dnev, belepes from dolgozo where belepes > to_date('1982.01.01', 'YYYY.MM.DD');

--------------------------------------------------------------------------------------

--Harmadik gyak

--descartes szorzat

select * from szeret sz1, szeret sz2;

--legalabb 2 gyumolcs

select distinct sz1.nev from szeret sz1, szeret sz2
    where sz1.nev = sz2.nev and sz1.gyumolcs != sz2.gyumolcs;
    
--legalabb 3 gyumolcs

select distinct sz1.nev from szeret sz1, szeret sz2, szeret sz3
    where sz1.nev = sz2.nev and sz2.nev = sz3.nev and 
    sz1.gyumolcs != sz2.gyumolcs and sz2.gyumolcs != sz3.gyumolcs and sz1.gyumolcs != sz3.gyumolcs;
    
--legfeljebb 2 gyumolcs
select distinct nev from szeret
minus
select distinct sz1.nev from szeret sz1, szeret sz2, szeret sz3
    where sz1.nev = sz2.nev and sz2.nev = sz3.nev and 
    sz1.gyumolcs != sz2.gyumolcs and sz2.gyumolcs != sz3.gyumolcs and sz1.gyumolcs != sz3.gyumolcs;
    
--pontosan 2 gyumolcs
(select distinct sz1.nev from szeret sz1, szeret sz2
    where sz1.nev = sz2.nev and sz1.gyumolcs != sz2.gyumolcs)
intersect
(select distinct nev from szeret
minus
select distinct sz1.nev from szeret sz1, szeret sz2, szeret sz3
    where sz1.nev = sz2.nev and sz2.nev = sz3.nev and 
    sz1.gyumolcs != sz2.gyumolcs and sz2.gyumolcs != sz3.gyumolcs and sz1.gyumolcs != sz3.gyumolcs);


--kinek a fonoke King
select beosztott.dnev from dolgozo beosztott, dolgozo fonok
    where beosztott.fonoke = fonok.dkod and fonok.dnev='KING';
    
--szorzas
--ki dolgozik new yorkban
select * from dolgozo, osztaly
    where dolgozo.oazon = osztaly.oazon and osztaly.telephely = 'NEW YORK';
