import AssemblyKeys._

organization := "pwr"

name := "bazy"

version := "0.1.0-SNAPSHOT"

seq(assemblySettings: _*)

jarName in assembly := "db.jar"

test in assembly := {}

assembleArtifact in packageScala := false
