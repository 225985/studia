var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "7200",
			ok: "7200",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "510",
			ok: "510",
			ko: "-"
		},
		meanResponseTime : {
			total: "65",
			ok: "65",
			ko: "-"
		},
		standardDeviation : {
			total: "40",
			ok: "40",
			ko: "-"
		},
		percentiles1 : {
			total: "150",
			ok: "150",
			ko: "-"
		},
		percentiles2 : {
			total: "190",
			ok: "190",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 7200,
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
			total: "88",
			ok: "88",
			ko: "-"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "2400",
			ok: "2400",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "380",
			ok: "380",
			ko: "-"
		},
		meanResponseTime : {
			total: "55",
			ok: "55",
			ko: "-"
		},
		standardDeviation : {
			total: "39",
			ok: "39",
			ko: "-"
		},
		percentiles1 : {
			total: "140",
			ok: "140",
			ko: "-"
		},
		percentiles2 : {
			total: "170",
			ok: "170",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 2400,
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
			total: "29",
			ok: "29",
			ko: "-"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "2400",
			ok: "2400",
			ko: "0"
		},
		minResponseTime : {
			total: "20",
			ok: "20",
			ko: "-"
		},
		maxResponseTime : {
			total: "510",
			ok: "510",
			ko: "-"
		},
		meanResponseTime : {
			total: "69",
			ok: "69",
			ko: "-"
		},
		standardDeviation : {
			total: "41",
			ok: "41",
			ko: "-"
		},
		percentiles1 : {
			total: "150",
			ok: "150",
			ko: "-"
		},
		percentiles2 : {
			total: "190",
			ok: "190",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 2400,
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
			total: "29",
			ok: "29",
			ko: "-"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "2400",
			ok: "2400",
			ko: "0"
		},
		minResponseTime : {
			total: "20",
			ok: "20",
			ko: "-"
		},
		maxResponseTime : {
			total: "510",
			ok: "510",
			ko: "-"
		},
		meanResponseTime : {
			total: "70",
			ok: "70",
			ko: "-"
		},
		standardDeviation : {
			total: "41",
			ok: "41",
			ko: "-"
		},
		percentiles1 : {
			total: "150",
			ok: "150",
			ko: "-"
		},
		percentiles2 : {
			total: "200",
			ok: "200",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 2400,
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
			total: "29",
			ok: "29",
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
