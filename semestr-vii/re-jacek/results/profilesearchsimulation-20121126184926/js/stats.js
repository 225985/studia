var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "11400",
			ok: "11400",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "22440",
			ok: "22440",
			ko: "-"
		},
		meanResponseTime : {
			total: "11867",
			ok: "11867",
			ko: "-"
		},
		standardDeviation : {
			total: "6282",
			ok: "6282",
			ko: "-"
		},
		percentiles1 : {
			total: "19680",
			ok: "19680",
			ko: "-"
		},
		percentiles2 : {
			total: "19800",
			ok: "19800",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 562,
			percentage: 4
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 88,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 10750,
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
			total: "3800",
			ok: "3800",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "19690",
			ok: "19690",
			ko: "-"
		},
		meanResponseTime : {
			total: "9474",
			ok: "9474",
			ko: "-"
		},
		standardDeviation : {
			total: "5913",
			ok: "5913",
			ko: "-"
		},
		percentiles1 : {
			total: "18710",
			ok: "18710",
			ko: "-"
		},
		percentiles2 : {
			total: "19460",
			ok: "19460",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 366,
			percentage: 9
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 31,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3403,
			percentage: 89
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
			total: "3800",
			ok: "3800",
			ko: "0"
		},
		minResponseTime : {
			total: "40",
			ok: "40",
			ko: "-"
		},
		maxResponseTime : {
			total: "22440",
			ok: "22440",
			ko: "-"
		},
		meanResponseTime : {
			total: "12635",
			ok: "12635",
			ko: "-"
		},
		standardDeviation : {
			total: "6536",
			ok: "6536",
			ko: "-"
		},
		percentiles1 : {
			total: "19740",
			ok: "19740",
			ko: "-"
		},
		percentiles2 : {
			total: "19840",
			ok: "19840",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 168,
			percentage: 4
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 29,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3603,
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
			total: "3800",
			ok: "3800",
			ko: "0"
		},
		minResponseTime : {
			total: "390",
			ok: "390",
			ko: "-"
		},
		maxResponseTime : {
			total: "20030",
			ok: "20030",
			ko: "-"
		},
		meanResponseTime : {
			total: "13491",
			ok: "13491",
			ko: "-"
		},
		standardDeviation : {
			total: "5637",
			ok: "5637",
			ko: "-"
		},
		percentiles1 : {
			total: "19700",
			ok: "19700",
			ko: "-"
		},
		percentiles2 : {
			total: "19800",
			ok: "19800",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 28,
			percentage: 0
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 28,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3744,
			percentage: 98
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
