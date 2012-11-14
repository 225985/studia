var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "6600",
			ok: "6600",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "1470",
			ok: "1470",
			ko: "-"
		},
		meanResponseTime : {
			total: "182",
			ok: "182",
			ko: "-"
		},
		standardDeviation : {
			total: "352",
			ok: "352",
			ko: "-"
		},
		percentiles1 : {
			total: "1240",
			ok: "1240",
			ko: "-"
		},
		percentiles2 : {
			total: "1430",
			ok: "1430",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 6013,
			percentage: 91
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 236,
			percentage: 3
		},
		group3 : {
			name: "t > 1200 ms",
			count: 351,
			percentage: 5
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "81",
			ok: "81",
			ko: "-"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "2200",
			ok: "2200",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "1460",
			ok: "1460",
			ko: "-"
		},
		meanResponseTime : {
			total: "175",
			ok: "175",
			ko: "-"
		},
		standardDeviation : {
			total: "351",
			ok: "351",
			ko: "-"
		},
		percentiles1 : {
			total: "1180",
			ok: "1180",
			ko: "-"
		},
		percentiles2 : {
			total: "1410",
			ok: "1410",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 1998,
			percentage: 90
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 94,
			percentage: 4
		},
		group3 : {
			name: "t > 1200 ms",
			count: 108,
			percentage: 4
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "27",
			ok: "27",
			ko: "-"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "2200",
			ok: "2200",
			ko: "0"
		},
		minResponseTime : {
			total: "20",
			ok: "20",
			ko: "-"
		},
		maxResponseTime : {
			total: "1470",
			ok: "1470",
			ko: "-"
		},
		meanResponseTime : {
			total: "181",
			ok: "181",
			ko: "-"
		},
		standardDeviation : {
			total: "342",
			ok: "342",
			ko: "-"
		},
		percentiles1 : {
			total: "1180",
			ok: "1180",
			ko: "-"
		},
		percentiles2 : {
			total: "1430",
			ok: "1430",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 2007,
			percentage: 91
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 91,
			percentage: 4
		},
		group3 : {
			name: "t > 1200 ms",
			count: 102,
			percentage: 4
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "27",
			ok: "27",
			ko: "-"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "2200",
			ok: "2200",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "1470",
			ok: "1470",
			ko: "-"
		},
		meanResponseTime : {
			total: "190",
			ok: "190",
			ko: "-"
		},
		standardDeviation : {
			total: "363",
			ok: "363",
			ko: "-"
		},
		percentiles1 : {
			total: "1320",
			ok: "1320",
			ko: "-"
		},
		percentiles2 : {
			total: "1440",
			ok: "1440",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 2008,
			percentage: 91
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 51,
			percentage: 2
		},
		group3 : {
			name: "t > 1200 ms",
			count: 141,
			percentage: 6
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "27",
			ok: "27",
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
