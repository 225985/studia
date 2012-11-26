var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "10200",
			ok: "10200",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "15860",
			ok: "15860",
			ko: "-"
		},
		meanResponseTime : {
			total: "9171",
			ok: "9171",
			ko: "-"
		},
		standardDeviation : {
			total: "4914",
			ok: "4914",
			ko: "-"
		},
		percentiles1 : {
			total: "15490",
			ok: "15490",
			ko: "-"
		},
		percentiles2 : {
			total: "15720",
			ok: "15720",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 569,
			percentage: 5
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 100,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 9531,
			percentage: 93
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "98",
			ok: "98",
			ko: "-"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "3400",
			ok: "3400",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "15730",
			ok: "15730",
			ko: "-"
		},
		meanResponseTime : {
			total: "7548",
			ok: "7548",
			ko: "-"
		},
		standardDeviation : {
			total: "4741",
			ok: "4741",
			ko: "-"
		},
		percentiles1 : {
			total: "14870",
			ok: "14870",
			ko: "-"
		},
		percentiles2 : {
			total: "15550",
			ok: "15550",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 349,
			percentage: 10
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 35,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3016,
			percentage: 88
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
			total: "3400",
			ok: "3400",
			ko: "0"
		},
		minResponseTime : {
			total: "70",
			ok: "70",
			ko: "-"
		},
		maxResponseTime : {
			total: "15830",
			ok: "15830",
			ko: "-"
		},
		meanResponseTime : {
			total: "9710",
			ok: "9710",
			ko: "-"
		},
		standardDeviation : {
			total: "5094",
			ok: "5094",
			ko: "-"
		},
		percentiles1 : {
			total: "15600",
			ok: "15600",
			ko: "-"
		},
		percentiles2 : {
			total: "15740",
			ok: "15740",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 167,
			percentage: 4
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 36,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3197,
			percentage: 94
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
			total: "3400",
			ok: "3400",
			ko: "0"
		},
		minResponseTime : {
			total: "30",
			ok: "30",
			ko: "-"
		},
		maxResponseTime : {
			total: "15860",
			ok: "15860",
			ko: "-"
		},
		meanResponseTime : {
			total: "10256",
			ok: "10256",
			ko: "-"
		},
		standardDeviation : {
			total: "4462",
			ok: "4462",
			ko: "-"
		},
		percentiles1 : {
			total: "15540",
			ok: "15540",
			ko: "-"
		},
		percentiles2 : {
			total: "15720",
			ok: "15720",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 53,
			percentage: 1
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 29,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3318,
			percentage: 97
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
