var stats = {
	global_information: {
		name: "Global Information",
		numberOfRequests : {
			total: "10200",
			ok: "10054",
			ko: "146"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "20"
		},
		maxResponseTime : {
			total: "11580",
			ok: "11580",
			ko: "610"
		},
		meanResponseTime : {
			total: "4761",
			ok: "4827",
			ko: "170"
		},
		standardDeviation : {
			total: "3277",
			ok: "3255",
			ko: "144"
		},
		percentiles1 : {
			total: "11260",
			ok: "11260",
			ko: "470"
		},
		percentiles2 : {
			total: "11450",
			ok: "11450",
			ko: "560"
		},
		group1 : {
			name: "t < 800 ms",
			count: 902,
			percentage: 8
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 772,
			percentage: 7
		},
		group3 : {
			name: "t > 1200 ms",
			count: 8380,
			percentage: 82
		},
		group4 : {
			name: "failed",
			count: 146,
			percentage: 1
		},
		meanNumberOfRequestsPerSecond: {
			total: "113",
			ok: "111",
			ko: "2"
		}
	},	dashboard: {
		name: "Dashboard",
		numberOfRequests : {
			total: "3400",
			ok: "3369",
			ko: "31"
		},
		minResponseTime : {
			total: "10",
			ok: "10",
			ko: "20"
		},
		maxResponseTime : {
			total: "11430",
			ok: "11430",
			ko: "210"
		},
		meanResponseTime : {
			total: "3959",
			ok: "3994",
			ko: "110"
		},
		standardDeviation : {
			total: "2926",
			ok: "2916",
			ko: "52"
		},
		percentiles1 : {
			total: "10520",
			ok: "10540",
			ko: "190"
		},
		percentiles2 : {
			total: "11270",
			ok: "11270",
			ko: "210"
		},
		group1 : {
			name: "t < 800 ms",
			count: 458,
			percentage: 13
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 300,
			percentage: 8
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2611,
			percentage: 76
		},
		group4 : {
			name: "failed",
			count: 31,
			percentage: 0
		},
		meanNumberOfRequestsPerSecond: {
			total: "38",
			ok: "37",
			ko: "0"
		}
	},	profile_1: {
		name: "Profile 1",
		numberOfRequests : {
			total: "3400",
			ok: "3331",
			ko: "69"
		},
		minResponseTime : {
			total: "20",
			ok: "20",
			ko: "30"
		},
		maxResponseTime : {
			total: "11550",
			ok: "11550",
			ko: "550"
		},
		meanResponseTime : {
			total: "5010",
			ok: "5110",
			ko: "179"
		},
		standardDeviation : {
			total: "3499",
			ok: "3464",
			ko: "136"
		},
		percentiles1 : {
			total: "11340",
			ok: "11350",
			ko: "470"
		},
		percentiles2 : {
			total: "11470",
			ok: "11470",
			ko: "470"
		},
		group1 : {
			name: "t < 800 ms",
			count: 283,
			percentage: 8
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 249,
			percentage: 7
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2799,
			percentage: 82
		},
		group4 : {
			name: "failed",
			count: 69,
			percentage: 2
		},
		meanNumberOfRequestsPerSecond: {
			total: "38",
			ok: "37",
			ko: "1"
		}
	},	profile_2: {
		name: "Profile 2",
		numberOfRequests : {
			total: "3400",
			ok: "3354",
			ko: "46"
		},
		minResponseTime : {
			total: "20",
			ok: "40",
			ko: "20"
		},
		maxResponseTime : {
			total: "11580",
			ok: "11580",
			ko: "610"
		},
		meanResponseTime : {
			total: "5313",
			ok: "5383",
			ko: "198"
		},
		standardDeviation : {
			total: "3228",
			ok: "3194",
			ko: "180"
		},
		percentiles1 : {
			total: "11310",
			ok: "11310",
			ko: "560"
		},
		percentiles2 : {
			total: "11470",
			ok: "11470",
			ko: "610"
		},
		group1 : {
			name: "t < 800 ms",
			count: 161,
			percentage: 4
		},
		group2 : {
			name: "800 ms < t < 1200 ms",
			count: 223,
			percentage: 6
		},
		group3 : {
			name: "t > 1200 ms",
			count: 2970,
			percentage: 87
		},
		group4 : {
			name: "failed",
			count: 46,
			percentage: 1
		},
		meanNumberOfRequestsPerSecond: {
			total: "38",
			ok: "37",
			ko: "1"
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
