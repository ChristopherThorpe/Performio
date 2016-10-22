select concat("https://karajan-dataset.s3.amazonaws.com/2016-10-21/h5/",
	      tracks.productId, "/", lpad(tracks._order, 2, 0), ".h5"),
kds.tracks.productId, tracks._order, kds.works.title,
kds.works.composerName, kwv.recordingYear from kds.tracks inner join
kds.kwv on kwv.kwv = tracks.kwv inner join kds.works on kwv.workId =
works.workId inner join kds.workparts on workparts.workId = works.workId
and workparts.workPartId = tracks.workPartId where (works.title like
"Symphonie Nr. 6%" and composerName like "Pe%" and workparts._order = 4)
or (works.title like "Symphonie Nr. 5%" and composerName like "L%" and
workparts._order = 1) group by kds.tracks.productId, tracks._order order
by composerName, recordingYear;
