import AssemblyKeys._

organization := "pwr"

name := "bazy"

version := "0.1.0-SNAPSHOT"

seq(assemblySettings: _*)

jarName in assembly := "db.jar"

test in assembly := {}

assembleArtifact in packageScala := false

resolvers += "Media vks" at "http://media.verknowsys.com/maven2-repository/"

libraryDependencies ++= Seq("org.neodatis" % "neodatis-odb" % "1.9.24.679")


