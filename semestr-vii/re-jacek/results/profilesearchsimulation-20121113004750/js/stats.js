var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "12000",
			ok: "9994",
			ko: "2006"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "10090",
			ok: "10090",
			ko: "80"
		},
		meanResponseTime : {
			total: "4736",
			ok: "5681",
			ko: "25"
		},
		standardDeviation : {
			total: "3333",
			ok: "2828",
			ko: "13"
		},
		percentiles1 : {
			total: "9020",
			ok: "9080",
			ko: "50"
		},
		percentiles2 : {
			total: "9200",
			ok: "9210",
			ko: "60"
		},
		group1 : {
			name: "t < 800 ms",
			count: 630,
			percentage: 5
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 134,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 9230,
			percentage: 76
		},
		group4 : {
			name: "failed",
			count: 2006,
			percentage: 16
		},
		meanNumberOfRequestsPerSecond: {
			total: "138",
			ok: "115",
			ko: "23"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "4000",
			ok: "3398",
			ko: "602"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "9270",
			ok: "9270",
			ko: "80"
		},
		meanResponseTime : {
			total: "4277",
			ok: "5031",
			ko: "23"
		},
		standardDeviation : {
			total: "3292",
			ok: "2996",
			ko: "12"
		},
		percentiles1 : {
			total: "9010",
			ok: "9070",
			ko: "40"
		},
		percentiles2 : {
			total: "9190",
			ok: "9190",
			ko: "50"
		},
		group1 : {
			name: "t < 800 ms",
			count: 391,
			percentage: 9
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 43,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2964,
			percentage: 74
		},
		group4 : {
			name: "failed",
			count: 602,
			percentage: 15
		},
		meanNumberOfRequestsPerSecond: {
			total: "46",
			ok: "39",
			ko: "7"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "4000",
			ok: "3313",
			ko: "687"
		},
		minResponseTime : {
			total: "0",
			ok: "20",
			ko: "0"
		},
		maxResponseTime : {
			total: "9280",
			ok: "9280",
			ko: "80"
		},
		meanResponseTime : {
			total: "4906",
			ok: "5918",
			ko: "25"
		},
		standardDeviation : {
			total: "3399",
			ok: "2826",
			ko: "13"
		},
		percentiles1 : {
			total: "9020",
			ok: "9100",
			ko: "50"
		},
		percentiles2 : {
			total: "9200",
			ok: "9210",
			ko: "70"
		},
		group1 : {
			name: "t < 800 ms",
			count: 188,
			percentage: 4
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 45,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3080,
			percentage: 77
		},
		group4 : {
			name: "failed",
			count: 687,
			percentage: 17
		},
		meanNumberOfRequestsPerSecond: {
			total: "46",
			ok: "38",
			ko: "8"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "4000",
			ok: "3283",
			ko: "717"
		},
		minResponseTime : {
			total: "10",
			ok: "40",
			ko: "10"
		},
		maxResponseTime : {
			total: "10090",
			ok: "10090",
			ko: "80"
		},
		meanResponseTime : {
			total: "5024",
			ok: "6116",
			ko: "27"
		},
		standardDeviation : {
			total: "3260",
			ok: "2510",
			ko: "13"
		},
		percentiles1 : {
			total: "9020",
			ok: "9080",
			ko: "50"
		},
		percentiles2 : {
			total: "9210",
			ok: "9210",
			ko: "60"
		},
		group1 : {
			name: "t < 800 ms",
			count: 51,
			percentage: 1
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 46,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 3186,
			percentage: 79
		},
		group4 : {
			name: "failed",
			count: 717,
			percentage: 17
		},
		meanNumberOfRequestsPerSecond: {
			total: "46",
			ok: "38",
			ko: "8"
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
