package pl.jacbar.runner
import com.excilys.ebi.gatling.core.Predef._
import com.excilys.ebi.gatling.http.Predef._
import com.excilys.ebi.gatling.jdbc.Predef._
import com.excilys.ebi.gatling.http.Headers.Names._
import akka.util.duration._
import bootstrap._

class ProfileSearchSimulation extends Simulation {

	def apply = {
		val httpConf = httpConfig
			.baseURL("http://192.168.1.151")
			.acceptHeader("text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
			.acceptLanguageHeader("en-us,en;q=0.5")
			.acceptEncodingHeader("gzip, deflate")
			.userAgentHeader("Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:14.0) Gecko/20100101 Firefox/14.0.1")
			.hostHeader("192.168.1.151")


		val scn = scenario("Main page")	
			.exec(http("Dashboard").get("/runner/dashboard")).pause(3)
			.exec(http("Profile 1").get("/runner/profile/1")).pause(2)
			.exec(http("Profile 2").get("/runner/profile/2"))

		scn.configure.users(2000).ramp(60).protocolConfig(httpConf) :: Nil
	}
}