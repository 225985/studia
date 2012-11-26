var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "9000",
			ok: "9000",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "11610",
			ok: "11610",
			ko: "-"
		},
		meanResponseTime : {
			total: "6240",
			ok: "6240",
			ko: "-"
		},
		standardDeviation : {
			total: "3510",
			ok: "3510",
			ko: "-"
		},
		percentiles1 : {
			total: "11060",
			ok: "11060",
			ko: "-"
		},
		percentiles2 : {
			total: "11410",
			ok: "11410",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 573,
			percentage: 6
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 165,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 8262,
			percentage: 91
		},
		group4 : {
			name: "failed",
			count: 0,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "97",
			ok: "97",
			ko: "-"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "3000",
			ok: "3000",
			ko: "0"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "-"
		},
		maxResponseTime : {
			total: "11570",
			ok: "11570",
			ko: "-"
		},
		meanResponseTime : {
			total: "5331",
			ok: "5331",
			ko: "-"
		},
		standardDeviation : {
			total: "3502",
			ok: "3502",
			ko: "-"
		},
		percentiles1 : {
			total: "11080",
			ok: "11080",
			ko: "-"
		},
		percentiles2 : {
			total: "11390",
			ok: "11390",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 329,
			percentage: 10
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 64,
			percentage: 2
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2607,
			percentage: 86
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
			total: "3000",
			ok: "3000",
			ko: "0"
		},
		minResponseTime : {
			total: "30",
			ok: "30",
			ko: "-"
		},
		maxResponseTime : {
			total: "11570",
			ok: "11570",
			ko: "-"
		},
		meanResponseTime : {
			total: "6560",
			ok: "6560",
			ko: "-"
		},
		standardDeviation : {
			total: "3610",
			ok: "3610",
			ko: "-"
		},
		percentiles1 : {
			total: "11080",
			ok: "11080",
			ko: "-"
		},
		percentiles2 : {
			total: "11430",
			ok: "11430",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 172,
			percentage: 5
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 56,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2772,
			percentage: 92
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
			total: "3000",
			ok: "3000",
			ko: "0"
		},
		minResponseTime : {
			total: "40",
			ok: "40",
			ko: "-"
		},
		maxResponseTime : {
			total: "11610",
			ok: "11610",
			ko: "-"
		},
		meanResponseTime : {
			total: "6830",
			ok: "6830",
			ko: "-"
		},
		standardDeviation : {
			total: "3222",
			ok: "3222",
			ko: "-"
		},
		percentiles1 : {
			total: "11020",
			ok: "11020",
			ko: "-"
		},
		percentiles2 : {
			total: "11390",
			ok: "11390",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 72,
			percentage: 2
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 45,
			percentage: 1
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2883,
			percentage: 96
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
