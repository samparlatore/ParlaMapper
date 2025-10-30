@echo off
mvn clean package
mvn dependency:copy-dependencies -DoutputDirectory=lib
java -cp "target/ParlaMapper-1.0-SNAPSHOT.jar;lib/*" com.parlAquatics.Main

