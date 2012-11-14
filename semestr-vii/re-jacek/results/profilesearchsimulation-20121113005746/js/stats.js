var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "15000",
			ok: "7135",
			ko: "7865"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "16000",
			ok: "16000",
			ko: "3320"
		},
		meanResponseTime : {
			total: "4703",
			ok: "9758",
			ko: "117"
		},
		standardDeviation : {
			total: "5880",
			ok: "4891",
			ko: "126"
		},
		percentiles1 : {
			total: "15560",
			ok: "15730",
			ko: "380"
		},
		percentiles2 : {
			total: "15840",
			ok: "15890",
			ko: "490"
		},
		group1 : {
			name: "t < 800 ms",
			count: 442,
			percentage: 2
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 79,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 6614,
			percentage: 44
		},
		group4 : {
			name: "failed",
			count: 7865,
			percentage: 52
		},
		meanNumberOfRequestsPerSecond: {
			total: "165",
			ok: "79",
			ko: "87"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "5000",
			ok: "2550",
			ko: "2450"
		},
		minResponseTime : {
			total: "0",
			ok: "10",
			ko: "0"
		},
		maxResponseTime : {
			total: "15950",
			ok: "15950",
			ko: "3320"
		},
		meanResponseTime : {
			total: "4486",
			ok: "8682",
			ko: "118"
		},
		standardDeviation : {
			total: "5835",
			ok: "5551",
			ko: "144"
		},
		percentiles1 : {
			total: "15590",
			ok: "15710",
			ko: "380"
		},
		percentiles2 : {
			total: "15840",
			ok: "15870",
			ko: "500"
		},
		group1 : {
			name: "t < 800 ms",
			count: 348,
			percentage: 6
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 38,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2164,
			percentage: 43
		},
		group4 : {
			name: "failed",
			count: 2450,
			percentage: 49
		},
		meanNumberOfRequestsPerSecond: {
			total: "55",
			ok: "28",
			ko: "27"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "5000",
			ok: "2228",
			ko: "2772"
		},
		minResponseTime : {
			total: "0",
			ok: "50",
			ko: "0"
		},
		maxResponseTime : {
			total: "16000",
			ok: "16000",
			ko: "1200"
		},
		meanResponseTime : {
			total: "4626",
			ok: "10238",
			ko: "116"
		},
		standardDeviation : {
			total: "5919",
			ok: "4669",
			ko: "109"
		},
		percentiles1 : {
			total: "15530",
			ok: "15750",
			ko: "380"
		},
		percentiles2 : {
			total: "15850",
			ok: "15910",
			ko: "500"
		},
		group1 : {
			name: "t < 800 ms",
			count: 90,
			percentage: 1
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 41,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2097,
			percentage: 41
		},
		group4 : {
			name: "failed",
			count: 2772,
			percentage: 55
		},
		meanNumberOfRequestsPerSecond: {
			total: "55",
			ok: "25",
			ko: "31"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "5000",
			ok: "2357",
			ko: "2643"
		},
		minResponseTime : {
			total: "0",
			ok: "20",
			ko: "0"
		},
		maxResponseTime : {
			total: "15990",
			ok: "15990",
			ko: "3260"
		},
		meanResponseTime : {
			total: "4997",
			ok: "10468",
			ko: "118"
		},
		standardDeviation : {
			total: "5872",
			ok: "4063",
			ko: "124"
		},
		percentiles1 : {
			total: "15540",
			ok: "15730",
			ko: "380"
		},
		percentiles2 : {
			total: "15840",
			ok: "15900",
			ko: "490"
		},
		group1 : {
			name: "t < 800 ms",
			count: 4,
			percentage: 0
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 0,
			percentage: 0
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2353,
			percentage: 47
		},
		group4 : {
			name: "failed",
			count: 2643,
			percentage: 52
		},
		meanNumberOfRequestsPerSecond: {
			total: "55",
			ok: "26",
			ko: "29"
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
