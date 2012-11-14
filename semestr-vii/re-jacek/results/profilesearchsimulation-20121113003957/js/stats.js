var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "9600",
			ok: "9600",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "7320",
			ok: "7320",
			ko: "-"
		},
		meanResponseTime : {
			total: "3860",
			ok: "3860",
			ko: "-"
		},
		standardDeviation : {
			total: "2163",
			ok: "2163",
			ko: "-"
		},
		percentiles1 : {
			total: "7060",
			ok: "7060",
			ko: "-"
		},
		percentiles2 : {
			total: "7260",
			ok: "7260",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 953,
			percentage: 9
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 626,
			percentage: 6
		},
		group3 : {
			name: "t > 1200 ms",
			count: 8021,
			percentage: 83
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "113",
			ok: "113",
			ko: "-"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "3200",
			ok: "3200",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "7320",
			ok: "7320",
			ko: "-"
		},
		meanResponseTime : {
			total: "3387",
			ok: "3387",
			ko: "-"
		},
		standardDeviation : {
			total: "2161",
			ok: "2161",
			ko: "-"
		},
		percentiles1 : {
			total: "6630",
			ok: "6630",
			ko: "-"
		},
		percentiles2 : {
			total: "7240",
			ok: "7240",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 481,
			percentage: 15
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 232,
			percentage: 7
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2487,
			percentage: 77
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "38",
			ok: "38",
			ko: "-"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "3200",
			ok: "3200",
			ko: "0"
		},
		minResponseTime : {
			total: "20",
			ok: "20",
			ko: "-"
		},
		maxResponseTime : {
			total: "7320",
			ok: "7320",
			ko: "-"
		},
		meanResponseTime : {
			total: "4022",
			ok: "4022",
			ko: "-"
		},
		standardDeviation : {
			total: "2231",
			ok: "2231",
			ko: "-"
		},
		percentiles1 : {
			total: "7160",
			ok: "7160",
			ko: "-"
		},
		percentiles2 : {
			total: "7270",
			ok: "7270",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 293,
			percentage: 9
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 208,
			percentage: 6
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2699,
			percentage: 84
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "38",
			ok: "38",
			ko: "-"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "3200",
			ok: "3200",
			ko: "0"
		},
		minResponseTime : {
			total: "30",
			ok: "30",
			ko: "-"
		},
		maxResponseTime : {
			total: "7310",
			ok: "7310",
			ko: "-"
		},
		meanResponseTime : {
			total: "4169",
			ok: "4169",
			ko: "-"
		},
		standardDeviation : {
			total: "2014",
			ok: "2014",
			ko: "-"
		},
		percentiles1 : {
			total: "7040",
			ok: "7040",
			ko: "-"
		},
		percentiles2 : {
			total: "7250",
			ok: "7250",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 179,
			percentage: 5
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 186,
			percentage: 5
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2835,
			percentage: 88
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "38",
			ok: "38",
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
