var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "14400",
			ok: "14400",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "30840",
			ok: "30840",
			ko: "-"
		},
		meanResponseTime : {
			total: "18665",
			ok: "18665",
			ko: "-"
		},
		standardDeviation : {
			total: "9561",
			ok: "9561",
			ko: "-"
		},
		percentiles1 : {
			total: "30190",
			ok: "30190",
			ko: "-"
		},
		percentiles2 : {
			total: "30550",
			ok: "30550",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 497,
			percentage: 3
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 122,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 13781,
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
			total: "4800",
			ok: "4800",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "29920",
			ok: "29920",
			ko: "-"
		},
		meanResponseTime : {
			total: "14158",
			ok: "14158",
			ko: "-"
		},
		standardDeviation : {
			total: "8754",
			ok: "8754",
			ko: "-"
		},
		percentiles1 : {
			total: "27530",
			ok: "27530",
			ko: "-"
		},
		percentiles2 : {
			total: "28630",
			ok: "28630",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 375,
			percentage: 7
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 54,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 4371,
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
			total: "4800",
			ok: "4800",
			ko: "0"
		},
		minResponseTime : {
			total: "70",
			ok: "70",
			ko: "-"
		},
		maxResponseTime : {
			total: "30840",
			ok: "30840",
			ko: "-"
		},
		meanResponseTime : {
			total: "20041",
			ok: "20041",
			ko: "-"
		},
		standardDeviation : {
			total: "9929",
			ok: "9929",
			ko: "-"
		},
		percentiles1 : {
			total: "30340",
			ok: "30340",
			ko: "-"
		},
		percentiles2 : {
			total: "30580",
			ok: "30580",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 122,
			percentage: 2
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 63,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 4615,
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
			total: "4800",
			ok: "4800",
			ko: "0"
		},
		minResponseTime : {
			total: "1080",
			ok: "1080",
			ko: "-"
		},
		maxResponseTime : {
			total: "30830",
			ok: "30830",
			ko: "-"
		},
		meanResponseTime : {
			total: "21796",
			ok: "21796",
			ko: "-"
		},
		standardDeviation : {
			total: "8186",
			ok: "8186",
			ko: "-"
		},
		percentiles1 : {
			total: "30320",
			ok: "30320",
			ko: "-"
		},
		percentiles2 : {
			total: "30610",
			ok: "30610",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 0,
			percentage: 0
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 5,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 4795,
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
