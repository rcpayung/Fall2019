with gActors (firstname, lastname, mid, title,aid) as (
	select actors.firstname, actors.lastname, isin.mid, movies.title, isin.aid
	from actors, isin, movies
	where actors.aid = isin.aid and isin.mid = movies.mid and actors.firstname like "G%"
)
select count(firstname), country
from (
	select firstname, lastname, gActors.mid, title, cid
	from gActors, incountry
	where gActors.mid = incountry.mid
) as t, country
where country.cid = t.cid
group by country