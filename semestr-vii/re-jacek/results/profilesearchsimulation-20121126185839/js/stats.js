var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "15000",
			ok: "15000",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "33500",
			ok: "33500",
			ko: "-"
		},
		meanResponseTime : {
			total: "20357",
			ok: "20357",
			ko: "-"
		},
		standardDeviation : {
			total: "10381",
			ok: "10381",
			ko: "-"
		},
		percentiles1 : {
			total: "32700",
			ok: "32700",
			ko: "-"
		},
		percentiles2 : {
			total: "33130",
			ok: "33130",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 493,
			percentage: 3
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 117,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 14390,
			percentage: 95
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "101",
			ok: "101",
			ko: "-"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "5000",
			ok: "5000",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "32220",
			ok: "32220",
			ko: "-"
		},
		meanResponseTime : {
			total: "15282",
			ok: "15282",
			ko: "-"
		},
		standardDeviation : {
			total: "9446",
			ok: "9446",
			ko: "-"
		},
		percentiles1 : {
			total: "29810",
			ok: "29810",
			ko: "-"
		},
		percentiles2 : {
			total: "30980",
			ok: "30980",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 384,
			percentage: 7
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 51,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 4565,
			percentage: 91
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "34",
			ok: "34",
			ko: "-"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "5000",
			ok: "5000",
			ko: "0"
		},
		minResponseTime : {
			total: "40",
			ok: "40",
			ko: "-"
		},
		maxResponseTime : {
			total: "33450",
			ok: "33450",
			ko: "-"
		},
		meanResponseTime : {
			total: "21927",
			ok: "21927",
			ko: "-"
		},
		standardDeviation : {
			total: "10773",
			ok: "10773",
			ko: "-"
		},
		percentiles1 : {
			total: "32880",
			ok: "32880",
			ko: "-"
		},
		percentiles2 : {
			total: "33160",
			ok: "33160",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 109,
			percentage: 2
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 65,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 4826,
			percentage: 96
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "34",
			ok: "34",
			ko: "-"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "5000",
			ok: "5000",
			ko: "0"
		},
		minResponseTime : {
			total: "1180",
			ok: "1180",
			ko: "-"
		},
		maxResponseTime : {
			total: "33500",
			ok: "33500",
			ko: "-"
		},
		meanResponseTime : {
			total: "23863",
			ok: "23863",
			ko: "-"
		},
		standardDeviation : {
			total: "8802",
			ok: "8802",
			ko: "-"
		},
		percentiles1 : {
			total: "32840",
			ok: "32840",
			ko: "-"
		},
		percentiles2 : {
			total: "33240",
			ok: "33240",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 0,
			percentage: 0
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 1,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 4999,
			percentage: 99
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "34",
			ok: "34",
			ko: "-"
		}
	}}

function fillStats(stat){
    $("#numberOfRequests").append(stat.numberOfRequests.total);
    $("#numberOfRequestsOK").append(stat.numberOfRequests.ok);
    $("#numberOfRequestsKO").append(stat.numberOfRequests.ko);

    $("#minResponseTime").append(stat.minResponseTime.total);
    $("#minResponseTimeOK").append(stat.minResponseTime.ok);
    $("#minResponseTimeKO").append(stat.minResponseTime.ko);

    $("#maxResponseTime").append(stat.maxResponseTime.total);
    $("#maxResponseTimeOK").append(stat.maxResponseTime.ok);
    $("#maxResponseTimeKO").append(stat.maxResponseTime.ko);

    $("#meanResponseTime").append(stat.meanResponseTime.total);
    $("#meanResponseTimeOK").append(stat.meanResponseTime.ok);
    $("#meanResponseTimeKO").append(stat.meanResponseTime.ko);

    $("#standardDeviation").append(stat.standardDeviation.total);
    $("#standardDeviationOK").append(stat.standardDeviation.ok);
    $("#standardDeviationKO").append(stat.standardDeviation.ko);

    $("#percentiles1").append(stat.percentiles1.total);
    $("#percentiles1OK").append(stat.percentiles1.ok);
    $("#percentiles1KO").append(stat.percentiles1.ko);

    $("#percentiles2").append(stat.percentiles2.total);
    $("#percentiles2OK").append(stat.percentiles2.ok);
    $("#percentiles2KO").append(stat.percentiles2.ko);

    $("#meanNumberOfRequestsPerSecond").append(stat.meanNumberOfRequestsPerSecond.total);
    $("#meanNumberOfRequestsPerSecondOK").append(stat.meanNumberOfRequestsPerSecond.ok);
    $("#meanNumberOfRequestsPerSecondKO").append(stat.meanNumberOfRequestsPerSecond.ko);
}
