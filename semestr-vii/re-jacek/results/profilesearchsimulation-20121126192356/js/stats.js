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
			total: "3050",
			ok: "3050",
			ko: "-"
		},
		meanResponseTime : {
			total: "262",
			ok: "262",
			ko: "-"
		},
		standardDeviation : {
			total: "308",
			ok: "308",
			ko: "-"
		},
		percentiles1 : {
			total: "850",
			ok: "850",
			ko: "-"
		},
		percentiles2 : {
			total: "990",
			ok: "990",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 5560,
			percentage: 92
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 433,
			percentage: 7
		},
		group3 : {
			name: "t > 1200 ms",
			count: 7,
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
			total: "3050",
			ok: "3050",
			ko: "-"
		},
		meanResponseTime : {
			total: "237",
			ok: "237",
			ko: "-"
		},
		standardDeviation : {
			total: "326",
			ok: "326",
			ko: "-"
		},
		percentiles1 : {
			total: "840",
			ok: "840",
			ko: "-"
		},
		percentiles2 : {
			total: "950",
			ok: "950",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 1876,
			percentage: 93
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 118,
			percentage: 5
		},
		group3 : {
			name: "t > 1200 ms",
			count: 6,
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
			total: "1120",
			ok: "1120",
			ko: "-"
		},
		meanResponseTime : {
			total: "279",
			ok: "279",
			ko: "-"
		},
		standardDeviation : {
			total: "299",
			ok: "299",
			ko: "-"
		},
		percentiles1 : {
			total: "870",
			ok: "870",
			ko: "-"
		},
		percentiles2 : {
			total: "990",
			ok: "990",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 1840,
			percentage: 92
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 160,
			percentage: 8
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
			total: "1240",
			ok: "1240",
			ko: "-"
		},
		meanResponseTime : {
			total: "271",
			ok: "271",
			ko: "-"
		},
		standardDeviation : {
			total: "295",
			ok: "295",
			ko: "-"
		},
		percentiles1 : {
			total: "850",
			ok: "850",
			ko: "-"
		},
		percentiles2 : {
			total: "1010",
			ok: "1010",
			ko: "-"
		},
		group1 : {
			name: "t < 800 ms",
			count: 1844,
			percentage: 92
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 155,
			percentage: 7
		},
		group3 : {
			name: "t > 1200 ms",
			count: 1,
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
