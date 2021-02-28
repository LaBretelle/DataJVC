install.packages(c("devtools", # permet d'utiliser la fonction install_github()
                   "ggridges", # permet de représenter les densité non paramétriques les unes derrière les autres
                   "gridExtra", 
                   "labelled", # recherche de mots-clés
                   "tidyverse"  # ensemble de packages pour le data scientist
)
)

library(tidyverse)

data = read.csv("datajvctest.csv")

#infos générales
summary(data)

#répartition des notes dans un graphe généraliste
plot(table(data$note_testeur))
plot(table(data$note_lecteur))

#répartition des notes en fonction du nombre de lecteurs ayant contribué, donc de l'intérêt
ggplot(data, aes(x = note_lecteur, fill = nombre_testeur)) + geom_bar()

ggplot(data, aes(x = note_testeur, fill = nombre_testeur)) + geom_bar()

#infos sur les testeurs
table(data$nom_testeur)
print("Nombre testeurs :")
length(unique(data$nom_testeur))
print("Liste des testeurs :")
unique(data$nom_testeur)

#nombre d'avis écrits par des de lecteurs
sum(data$nombre_testeur, na.rm=TRUE) 

#nombre d'avis moyen de lecteurs
nombre_commentaire = data$nombre_testeur
nombre_commentaire[is.na(nombre_commentaire)] = 0
mean(nombre_commentaire)

# répartition des avis par jeu
quantile(nombre_commentaire)

#étude des meilleurs et pires jeux par note
Best_note_testeur = subset(data, note_testeur >= 18)
Best_note_lecteur = subset(data, note_lecteur >= 18)
Pire_note_testeur = subset(data, note_testeur <= 3)
Pire_note_lecteur = subset(data, note_lecteur <= 3)
Pire_jeux = subset(data, note_testeur <= 3 & note_lecteur <= 3)
Meilleurs_jeux = subset(data, note_testeur > 18 & note_lecteur > 18)
