var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "6000",
			ok: "6000",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "900",
			ok: "900",
			ko: "-"
		},
		meanResponseTime : {
			total: "56",
			ok: "56",
			ko: "-"
		},
		standardDeviation : {
			total: "75",
			ok: "75",
			ko: "-"
		},
		percentiles1 : {
			total: "250",
			ok: "250",
			ko: "-"
		},
		percentiles2 : {
			total: "390",
			ok: "390",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 5999,
			percentage: 99
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 1,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 0,
			percentage: 0
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "73",
			ok: "73",
			ko: "-"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "2000",
			ok: "2000",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "440",
			ok: "440",
			ko: "-"
		},
		meanResponseTime : {
			total: "42",
			ok: "42",
			ko: "-"
		},
		standardDeviation : {
			total: "68",
			ok: "68",
			ko: "-"
		},
		percentiles1 : {
			total: "210",
			ok: "210",
			ko: "-"
		},
		percentiles2 : {
			total: "360",
			ok: "360",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 2000,
			percentage: 100
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 0,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 0,
			percentage: 0
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "24",
			ok: "24",
			ko: "-"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "2000",
			ok: "2000",
			ko: "0"
		},
		minResponseTime : {
			total: "20",
			ok: "20",
			ko: "-"
		},
		maxResponseTime : {
			total: "900",
			ok: "900",
			ko: "-"
		},
		meanResponseTime : {
			total: "62",
			ok: "62",
			ko: "-"
		},
		standardDeviation : {
			total: "78",
			ok: "78",
			ko: "-"
		},
		percentiles1 : {
			total: "280",
			ok: "280",
			ko: "-"
		},
		percentiles2 : {
			total: "390",
			ok: "390",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 1999,
			percentage: 99
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 1,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 0,
			percentage: 0
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "24",
			ok: "24",
			ko: "-"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "2000",
			ok: "2000",
			ko: "0"
		},
		minResponseTime : {
			total: "20",
			ok: "20",
			ko: "-"
		},
		maxResponseTime : {
			total: "730",
			ok: "730",
			ko: "-"
		},
		meanResponseTime : {
			total: "64",
			ok: "64",
			ko: "-"
		},
		standardDeviation : {
			total: "78",
			ok: "78",
			ko: "-"
		},
		percentiles1 : {
			total: "280",
			ok: "280",
			ko: "-"
		},
		percentiles2 : {
			total: "400",
			ok: "400",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 2000,
			percentage: 100
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 0,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 0,
			percentage: 0
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "24",
			ok: "24",
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
