library("MetaboAnalystR");

mSet <- InitDataObjects("conc", "stat", FALSE);
mSet <- Read.TextData(mSet, "http://www.metaboanalyst.ca/resources/data/human_cachexia.csv", "rowu", "disc");
mSet <- SanityCheckData(mSet);
mSet <- ReplaceMin(mSet);
saveRDS(mSet, file="data.Rda");
