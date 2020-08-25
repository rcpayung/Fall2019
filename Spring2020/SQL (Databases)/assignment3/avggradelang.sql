select language, avg(grade)
from (
	select t.lid, t.grade, langs.language
	from (
		select inlang.lid as lid, inlang.mid, movies.title, movies.grade as grade
		from inlang join movies on movies.mid = inlang.mid
	) as t, langs
	where langs.lid = t.lid
) as l
group by language