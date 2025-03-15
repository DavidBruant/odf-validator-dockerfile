# Utilisation d'une image Java 11 comme base
FROM eclipse-temurin:11-jdk

# Installation de Maven
RUN apt-get update && \
    apt-get install -y maven git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Création du répertoire de travail
WORKDIR /app

# Clonage du repo ODF Toolkit
RUN git clone https://github.com/tdf/odftoolkit.git

# Compilation du projet
WORKDIR /app/odftoolkit
RUN mvn clean install -DskipTests

# Création d'un répertoire pour les documents à valider
WORKDIR /app
RUN mkdir /documents

# Récupération du jar avec dépendances pour faciliter l'exécution
RUN find /app/odftoolkit -name "odfvalidator-*-jar-with-dependencies.jar" -exec cp {} /app/odfvalidator.jar \;

# Définition du point d'entrée
ENTRYPOINT ["java", "-jar", "/app/odfvalidator.jar"]

# Définition du répertoire de travail par défaut où seront montés les documents
WORKDIR /documents