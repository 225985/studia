var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "12600",
			ok: "12600",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "24610",
			ok: "24610",
			ko: "-"
		},
		meanResponseTime : {
			total: "14707",
			ok: "14707",
			ko: "-"
		},
		standardDeviation : {
			total: "7783",
			ok: "7783",
			ko: "-"
		},
		percentiles1 : {
			total: "24240",
			ok: "24240",
			ko: "-"
		},
		percentiles2 : {
			total: "24360",
			ok: "24360",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 552,
			percentage: 4
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 80,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 11968,
			percentage: 94
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "100",
			ok: "100",
			ko: "-"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "4200",
			ok: "4200",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "24320",
			ok: "24320",
			ko: "-"
		},
		meanResponseTime : {
			total: "11478",
			ok: "11478",
			ko: "-"
		},
		standardDeviation : {
			total: "7244",
			ok: "7244",
			ko: "-"
		},
		percentiles1 : {
			total: "22950",
			ok: "22950",
			ko: "-"
		},
		percentiles2 : {
			total: "23940",
			ok: "23940",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 378,
			percentage: 9
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 31,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3791,
			percentage: 90
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "33",
			ok: "33",
			ko: "-"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "4200",
			ok: "4200",
			ko: "0"
		},
		minResponseTime : {
			total: "90",
			ok: "90",
			ko: "-"
		},
		maxResponseTime : {
			total: "24610",
			ok: "24610",
			ko: "-"
		},
		meanResponseTime : {
			total: "15769",
			ok: "15769",
			ko: "-"
		},
		standardDeviation : {
			total: "8123",
			ok: "8123",
			ko: "-"
		},
		percentiles1 : {
			total: "24300",
			ok: "24300",
			ko: "-"
		},
		percentiles2 : {
			total: "24390",
			ok: "24390",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 165,
			percentage: 3
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 26,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 4009,
			percentage: 95
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "33",
			ok: "33",
			ko: "-"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "4200",
			ok: "4200",
			ko: "0"
		},
		minResponseTime : {
			total: "610",
			ok: "610",
			ko: "-"
		},
		maxResponseTime : {
			total: "24490",
			ok: "24490",
			ko: "-"
		},
		meanResponseTime : {
			total: "16874",
			ok: "16874",
			ko: "-"
		},
		standardDeviation : {
			total: "6858",
			ok: "6858",
			ko: "-"
		},
		percentiles1 : {
			total: "24260",
			ok: "24260",
			ko: "-"
		},
		percentiles2 : {
			total: "24360",
			ok: "24360",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 9,
			percentage: 0
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 23,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 4168,
			percentage: 99
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "33",
			ok: "33",
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
