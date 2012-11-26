var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "7800",
			ok: "7800",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "6560",
			ok: "6560",
			ko: "-"
		},
		meanResponseTime : {
			total: "3445",
			ok: "3445",
			ko: "-"
		},
		standardDeviation : {
			total: "1878",
			ok: "1878",
			ko: "-"
		},
		percentiles1 : {
			total: "6240",
			ok: "6240",
			ko: "-"
		},
		percentiles2 : {
			total: "6430",
			ok: "6430",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 651,
			percentage: 8
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 734,
			percentage: 9
		},
		group3 : {
			name: "t > 1200 ms",
			count: 6415,
			percentage: 82
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "93",
			ok: "93",
			ko: "-"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "2600",
			ok: "2600",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "6490",
			ok: "6490",
			ko: "-"
		},
		meanResponseTime : {
			total: "3047",
			ok: "3047",
			ko: "-"
		},
		standardDeviation : {
			total: "1909",
			ok: "1909",
			ko: "-"
		},
		percentiles1 : {
			total: "6180",
			ok: "6180",
			ko: "-"
		},
		percentiles2 : {
			total: "6380",
			ok: "6380",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 351,
			percentage: 13
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 276,
			percentage: 10
		},
		group3 : {
			name: "t > 1200 ms",
			count: 1973,
			percentage: 75
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "31",
			ok: "31",
			ko: "-"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "2600",
			ok: "2600",
			ko: "0"
		},
		minResponseTime : {
			total: "30",
			ok: "30",
			ko: "-"
		},
		maxResponseTime : {
			total: "6540",
			ok: "6540",
			ko: "-"
		},
		meanResponseTime : {
			total: "3598",
			ok: "3598",
			ko: "-"
		},
		standardDeviation : {
			total: "1909",
			ok: "1909",
			ko: "-"
		},
		percentiles1 : {
			total: "6280",
			ok: "6280",
			ko: "-"
		},
		percentiles2 : {
			total: "6440",
			ok: "6440",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 201,
			percentage: 7
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 239,
			percentage: 9
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2160,
			percentage: 83
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "31",
			ok: "31",
			ko: "-"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "2600",
			ok: "2600",
			ko: "0"
		},
		minResponseTime : {
			total: "30",
			ok: "30",
			ko: "-"
		},
		maxResponseTime : {
			total: "6560",
			ok: "6560",
			ko: "-"
		},
		meanResponseTime : {
			total: "3691",
			ok: "3691",
			ko: "-"
		},
		standardDeviation : {
			total: "1747",
			ok: "1747",
			ko: "-"
		},
		percentiles1 : {
			total: "6260",
			ok: "6260",
			ko: "-"
		},
		percentiles2 : {
			total: "6450",
			ok: "6450",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 99,
			percentage: 3
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 219,
			percentage: 8
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2282,
			percentage: 87
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "31",
			ok: "31",
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
