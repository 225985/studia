<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3adsp" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Q0" />
        <signal name="Q1" />
        <signal name="Q2" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="CE" />
        <signal name="XLXN_9" />
        <signal name="C" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_16" />
        <port polarity="Output" name="Q0" />
        <port polarity="Output" name="Q1" />
        <port polarity="Output" name="Q2" />
        <port polarity="Input" name="CE" />
        <port polarity="Input" name="C" />
        <blockdef name="ftce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-96" x1="64" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="64" y1="-64" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="32" y1="-64" y2="-64" x1="96" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="64" />
        </blockdef>
        <block symbolname="ftce" name="XLXI_3">
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="XLXN_4" name="CLR" />
            <blockpin signalname="XLXN_7" name="T" />
            <blockpin signalname="Q0" name="Q" />
        </block>
        <block symbolname="ftce" name="XLXI_4">
            <blockpin signalname="Q0" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="XLXN_4" name="CLR" />
            <blockpin signalname="XLXN_7" name="T" />
            <blockpin signalname="Q1" name="Q" />
        </block>
        <block symbolname="ftce" name="XLXI_5">
            <blockpin signalname="Q1" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="XLXN_4" name="CLR" />
            <blockpin signalname="XLXN_7" name="T" />
            <blockpin signalname="Q2" name="Q" />
        </block>
        <block symbolname="gnd" name="XLXI_6">
            <blockpin signalname="XLXN_4" name="G" />
        </block>
        <block symbolname="inv" name="XLXI_9">
            <blockpin signalname="Q0" name="I" />
            <blockpin signalname="Q0" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_10">
            <blockpin signalname="Q1" name="I" />
            <blockpin signalname="Q1" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_11">
            <blockpin signalname="XLXN_7" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1472" y="672" name="XLXI_3" orien="R0" />
        <instance x="1472" y="1168" name="XLXI_4" orien="R0" />
        <instance x="1488" y="1600" name="XLXI_5" orien="R0" />
        <branch name="Q2">
            <wire x2="2288" y1="1344" y2="1344" x1="1872" />
        </branch>
        <iomarker fontsize="28" x="2256" y="416" name="Q0" orien="R0" />
        <iomarker fontsize="28" x="2272" y="912" name="Q1" orien="R0" />
        <iomarker fontsize="28" x="2288" y="1344" name="Q2" orien="R0" />
        <instance x="1168" y="192" name="XLXI_6" orien="R180" />
        <branch name="Q0">
            <wire x2="1936" y1="416" y2="416" x1="1856" />
            <wire x2="2256" y1="416" y2="416" x1="1936" />
            <wire x2="1936" y1="416" y2="464" x1="1936" />
        </branch>
        <branch name="Q1">
            <wire x2="1936" y1="912" y2="912" x1="1856" />
            <wire x2="2272" y1="912" y2="912" x1="1936" />
            <wire x2="1936" y1="912" y2="944" x1="1936" />
        </branch>
        <instance x="1904" y="464" name="XLXI_9" orien="R90" />
        <instance x="1904" y="944" name="XLXI_10" orien="R90" />
        <instance x="912" y="320" name="XLXI_11" orien="R0" />
        <branch name="XLXN_7">
            <wire x2="976" y1="320" y2="416" x1="976" />
            <wire x2="1472" y1="416" y2="416" x1="976" />
            <wire x2="976" y1="416" y2="912" x1="976" />
            <wire x2="1472" y1="912" y2="912" x1="976" />
            <wire x2="976" y1="912" y2="1344" x1="976" />
            <wire x2="1488" y1="1344" y2="1344" x1="976" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1104" y1="320" y2="640" x1="1104" />
            <wire x2="1104" y1="640" y2="1136" x1="1104" />
            <wire x2="1104" y1="1136" y2="1568" x1="1104" />
            <wire x2="1488" y1="1568" y2="1568" x1="1104" />
            <wire x2="1472" y1="1136" y2="1136" x1="1104" />
            <wire x2="1472" y1="640" y2="640" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="640" y="544" name="C" orien="R180" />
        <iomarker fontsize="28" x="640" y="480" name="CE" orien="R180" />
        <branch name="Q1">
            <wire x2="1936" y1="1216" y2="1216" x1="1424" />
            <wire x2="1424" y1="1216" y2="1472" x1="1424" />
            <wire x2="1488" y1="1472" y2="1472" x1="1424" />
            <wire x2="1936" y1="1168" y2="1216" x1="1936" />
        </branch>
        <branch name="C">
            <wire x2="1312" y1="544" y2="544" x1="640" />
            <wire x2="1472" y1="544" y2="544" x1="1312" />
        </branch>
        <branch name="Q0">
            <wire x2="1936" y1="784" y2="784" x1="1408" />
            <wire x2="1408" y1="784" y2="976" x1="1408" />
            <wire x2="1408" y1="976" y2="1040" x1="1408" />
            <wire x2="1472" y1="1040" y2="1040" x1="1408" />
            <wire x2="1936" y1="688" y2="784" x1="1936" />
        </branch>
        <branch name="CE">
            <wire x2="1280" y1="480" y2="480" x1="640" />
            <wire x2="1472" y1="480" y2="480" x1="1280" />
            <wire x2="1280" y1="480" y2="960" x1="1280" />
            <wire x2="1456" y1="960" y2="960" x1="1280" />
            <wire x2="1456" y1="960" y2="976" x1="1456" />
            <wire x2="1472" y1="976" y2="976" x1="1456" />
            <wire x2="1280" y1="960" y2="1408" x1="1280" />
            <wire x2="1488" y1="1408" y2="1408" x1="1280" />
        </branch>
    </sheet>
</drawing>