name := "dist"

version := "0.1.0"

scalaVersion := "2.9.1"

resolvers += "Typesafe Repository" at "http://repo.typesafe.com/typesafe/releases/"

libraryDependencies ++= Seq(
  "com.typesafe.akka" % "akka-actor" % "2.0",
  "com.typesafe.akka" % "akka-remote" % "2.0",
  "com.typesafe.akka" % "akka-slf4j" % "2.0",
  "ch.qos.logback" % "logback-classic" % "1.0.0" % "runtime"
)

fork in run := true
