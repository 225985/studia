var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "10800",
			ok: "9782",
			ko: "1018"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "8770",
			ok: "8770",
			ko: "3120"
		},
		meanResponseTime : {
			total: "4985",
			ok: "5497",
			ko: "62"
		},
		standardDeviation : {
			total: "2984",
			ok: "2654",
			ko: "128"
		},
		percentiles1 : {
			total: "8600",
			ok: "8610",
			ko: "280"
		},
		percentiles2 : {
			total: "8700",
			ok: "8700",
			ko: "430"
		},
		group1 : {
			name: "t < 800 ms",
			count: 577,
			percentage: 5
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 101,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 9104,
			percentage: 84
		},
		group4 : {
			name: "failed",
			count: 1018,
			percentage: 9
		},
		meanNumberOfRequestsPerSecond: {
			total: "125",
			ok: "113",
			ko: "12"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "3600",
			ok: "3314",
			ko: "286"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "8750",
			ok: "8750",
			ko: "460"
		},
		meanResponseTime : {
			total: "4525",
			ok: "4910",
			ko: "61"
		},
		standardDeviation : {
			total: "3013",
			ok: "2828",
			ko: "94"
		},
		percentiles1 : {
			total: "8610",
			ok: "8620",
			ko: "310"
		},
		percentiles2 : {
			total: "8690",
			ok: "8690",
			ko: "430"
		},
		group1 : {
			name: "t < 800 ms",
			count: 357,
			percentage: 9
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 34,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2923,
			percentage: 81
		},
		group4 : {
			name: "failed",
			count: 286,
			percentage: 7
		},
		meanNumberOfRequestsPerSecond: {
			total: "42",
			ok: "38",
			ko: "3"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "3600",
			ok: "3234",
			ko: "366"
		},
		minResponseTime : {
			total: "0",
			ok: "30",
			ko: "0"
		},
		maxResponseTime : {
			total: "8770",
			ok: "8770",
			ko: "3120"
		},
		meanResponseTime : {
			total: "5126",
			ok: "5698",
			ko: "70"
		},
		standardDeviation : {
			total: "3045",
			ok: "2664",
			ko: "182"
		},
		percentiles1 : {
			total: "8610",
			ok: "8620",
			ko: "310"
		},
		percentiles2 : {
			total: "8710",
			ok: "8710",
			ko: "430"
		},
		group1 : {
			name: "t < 800 ms",
			count: 175,
			percentage: 4
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 31,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3028,
			percentage: 84
		},
		group4 : {
			name: "failed",
			count: 366,
			percentage: 10
		},
		meanNumberOfRequestsPerSecond: {
			total: "42",
			ok: "37",
			ko: "4"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "3600",
			ok: "3234",
			ko: "366"
		},
		minResponseTime : {
			total: "0",
			ok: "40",
			ko: "0"
		},
		maxResponseTime : {
			total: "8770",
			ok: "8770",
			ko: "460"
		},
		meanResponseTime : {
			total: "5303",
			ok: "5897",
			ko: "55"
		},
		standardDeviation : {
			total: "2834",
			ok: "2339",
			ko: "74"
		},
		percentiles1 : {
			total: "8580",
			ok: "8600",
			ko: "260"
		},
		percentiles2 : {
			total: "8700",
			ok: "8700",
			ko: "400"
		},
		group1 : {
			name: "t < 800 ms",
			count: 45,
			percentage: 1
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 36,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3153,
			percentage: 87
		},
		group4 : {
			name: "failed",
			count: 366,
			percentage: 10
		},
		meanNumberOfRequestsPerSecond: {
			total: "42",
			ok: "37",
			ko: "4"
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
