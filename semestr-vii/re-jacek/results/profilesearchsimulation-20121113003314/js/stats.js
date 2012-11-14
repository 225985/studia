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
			total: "200",
			ok: "200",
			ko: "-"
		},
		meanResponseTime : {
			total: "59",
			ok: "59",
			ko: "-"
		},
		standardDeviation : {
			total: "32",
			ok: "32",
			ko: "-"
		},
		percentiles1 : {
			total: "120",
			ok: "120",
			ko: "-"
		},
		percentiles2 : {
			total: "150",
			ok: "150",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 7800,
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
			total: "95",
			ok: "95",
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
			total: "190",
			ok: "190",
			ko: "-"
		},
		meanResponseTime : {
			total: "50",
			ok: "50",
			ko: "-"
		},
		standardDeviation : {
			total: "31",
			ok: "31",
			ko: "-"
		},
		percentiles1 : {
			total: "110",
			ok: "110",
			ko: "-"
		},
		percentiles2 : {
			total: "140",
			ok: "140",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 2600,
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
			total: "32",
			ok: "32",
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
			total: "20",
			ok: "20",
			ko: "-"
		},
		maxResponseTime : {
			total: "190",
			ok: "190",
			ko: "-"
		},
		meanResponseTime : {
			total: "64",
			ok: "64",
			ko: "-"
		},
		standardDeviation : {
			total: "30",
			ok: "30",
			ko: "-"
		},
		percentiles1 : {
			total: "120",
			ok: "120",
			ko: "-"
		},
		percentiles2 : {
			total: "150",
			ok: "150",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 2600,
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
			total: "32",
			ok: "32",
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
			total: "20",
			ok: "20",
			ko: "-"
		},
		maxResponseTime : {
			total: "200",
			ok: "200",
			ko: "-"
		},
		meanResponseTime : {
			total: "64",
			ok: "64",
			ko: "-"
		},
		standardDeviation : {
			total: "31",
			ok: "31",
			ko: "-"
		},
		percentiles1 : {
			total: "130",
			ok: "130",
			ko: "-"
		},
		percentiles2 : {
			total: "160",
			ok: "160",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 2600,
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
			total: "32",
			ok: "32",
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
