import AssemblyKeys._

organization := "pwr"

name := "bazy"

version := "0.1.0-SNAPSHOT"

seq(assemblySettings: _*)

jarName in assembly := "db.jar"

test in assembly := {}

assembleArtifact in packageScala := false

resolvers += "Db4o repository" at "http://source.db4o.com/maven"

libraryDependencies ++= Seq("com.db4o" % "db4o-full-java5" % "8.1-SNAPSHOT")


