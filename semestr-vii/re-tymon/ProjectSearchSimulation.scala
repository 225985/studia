package org.scalajars.stress
import com.excilys.ebi.gatling.core.Predef._
import com.excilys.ebi.gatling.http.Predef._
import com.excilys.ebi.gatling.jdbc.Predef._
import com.excilys.ebi.gatling.http.Headers.Names._
import akka.util.duration._
import bootstrap._

class ProjectSearchSimulation extends Simulation {

  def apply = {
    val httpConf = httpConfig
      .baseURL("http://localhost:6020")
      .acceptHeader("text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
      .acceptLanguageHeader("en-us,en;q=0.5")
      .acceptEncodingHeader("gzip, deflate")
      .userAgentHeader("Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:15.0) Gecko/20100101 Firefox/15.0.1")
      .hostHeader("scalajars.org")

    val scn = scenario("Project search")
      .exec(http("Homepage").get("/"))
      .pause(1)
      .exec(http("Projects").get("/projects"))
      .pause(5)
      .exec(http("Search").get("/projects").queryParam("query", "navigator"))
      .pause(3)
      .exec(http("Project page").get("/projects/play-navigator"))

    scn.configure.users(System.getenv("N").toInt).ramp(10).protocolConfig(httpConf) :: Nil
  }
}
