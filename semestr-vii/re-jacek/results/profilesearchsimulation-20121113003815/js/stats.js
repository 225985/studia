var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "9000",
			ok: "9000",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "4920",
			ok: "4920",
			ko: "-"
		},
		meanResponseTime : {
			total: "2249",
			ok: "2249",
			ko: "-"
		},
		standardDeviation : {
			total: "1302",
			ok: "1302",
			ko: "-"
		},
		percentiles1 : {
			total: "4430",
			ok: "4430",
			ko: "-"
		},
		percentiles2 : {
			total: "4490",
			ok: "4490",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 1306,
			percentage: 14
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 1078,
			percentage: 11
		},
		group3 : {
			name: "t > 1200 ms",
			count: 6616,
			percentage: 73
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "110",
			ok: "110",
			ko: "-"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "3000",
			ok: "3000",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "4920",
			ok: "4920",
			ko: "-"
		},
		meanResponseTime : {
			total: "2045",
			ok: "2045",
			ko: "-"
		},
		standardDeviation : {
			total: "1341",
			ok: "1341",
			ko: "-"
		},
		percentiles1 : {
			total: "4430",
			ok: "4430",
			ko: "-"
		},
		percentiles2 : {
			total: "4480",
			ok: "4480",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 589,
			percentage: 19
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 379,
			percentage: 12
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2032,
			percentage: 67
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "37",
			ok: "37",
			ko: "-"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "3000",
			ok: "3000",
			ko: "0"
		},
		minResponseTime : {
			total: "20",
			ok: "20",
			ko: "-"
		},
		maxResponseTime : {
			total: "4530",
			ok: "4530",
			ko: "-"
		},
		meanResponseTime : {
			total: "2327",
			ok: "2327",
			ko: "-"
		},
		standardDeviation : {
			total: "1311",
			ok: "1311",
			ko: "-"
		},
		percentiles1 : {
			total: "4430",
			ok: "4430",
			ko: "-"
		},
		percentiles2 : {
			total: "4490",
			ok: "4490",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 414,
			percentage: 13
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 343,
			percentage: 11
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2243,
			percentage: 74
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "37",
			ok: "37",
			ko: "-"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "3000",
			ok: "3000",
			ko: "0"
		},
		minResponseTime : {
			total: "20",
			ok: "20",
			ko: "-"
		},
		maxResponseTime : {
			total: "4540",
			ok: "4540",
			ko: "-"
		},
		meanResponseTime : {
			total: "2374",
			ok: "2374",
			ko: "-"
		},
		standardDeviation : {
			total: "1227",
			ok: "1227",
			ko: "-"
		},
		percentiles1 : {
			total: "4420",
			ok: "4420",
			ko: "-"
		},
		percentiles2 : {
			total: "4500",
			ok: "4500",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 303,
			percentage: 10
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 356,
			percentage: 11
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2341,
			percentage: 78
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "37",
			ok: "37",
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
