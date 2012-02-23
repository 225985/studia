<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_15" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_34" />
        <signal name="XLXN_38" />
        <signal name="XLXN_41" />
        <signal name="XLXN_45" />
        <signal name="XLXN_48" />
        <signal name="XLXN_35" />
        <signal name="XLXN_57" />
        <signal name="XLXN_36" />
        <signal name="Q2" />
        <signal name="X" />
        <signal name="XLXN_61" />
        <signal name="Q0" />
        <signal name="XLXN_63" />
        <signal name="Q1" />
        <signal name="XLXN_40" />
        <signal name="XLXN_42" />
        <signal name="XLXN_44" />
        <signal name="XLXN_68" />
        <signal name="XLXN_43" />
        <signal name="CLR" />
        <signal name="XLXN_71" />
        <signal name="CE" />
        <signal name="C" />
        <signal name="XLXN_53" />
        <signal name="XLXN_54" />
        <signal name="XLXN_55" />
        <signal name="XLXN_77" />
        <signal name="XLXN_78" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <signal name="XLXN_81" />
        <signal name="XLXN_82" />
        <signal name="XLXN_83" />
        <signal name="XLXN_84" />
        <signal name="XLXN_85" />
        <signal name="Y" />
        <port polarity="Output" name="Q2" />
        <port polarity="Input" name="X" />
        <port polarity="Output" name="Q0" />
        <port polarity="Output" name="Q1" />
        <port polarity="Input" name="CLR" />
        <port polarity="Input" name="CE" />
        <port polarity="Input" name="C" />
        <port polarity="Output" name="Y" />
        <blockdef name="and3b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
        </blockdef>
        <blockdef name="and2b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="and3b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
        </blockdef>
        <blockdef name="xnor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
            <circle r="8" cx="220" cy="-96" />
            <line x2="256" y1="-96" y2="-96" x1="228" />
            <line x2="60" y1="-28" y2="-28" x1="60" />
        </blockdef>
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <blockdef name="fdce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <block symbolname="and3b1" name="XLXI_6">
            <blockpin signalname="X" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="Q0" name="I2" />
            <blockpin signalname="XLXN_53" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_9">
            <blockpin signalname="Q1" name="I0" />
            <blockpin signalname="Q0" name="I1" />
            <blockpin signalname="X" name="I2" />
            <blockpin signalname="XLXN_36" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_10">
            <blockpin signalname="XLXN_36" name="I0" />
            <blockpin signalname="XLXN_35" name="I1" />
            <blockpin signalname="XLXN_54" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_8">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="XLXN_35" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_18">
            <blockpin signalname="X" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="XLXN_42" name="O" />
        </block>
        <block symbolname="and3b2" name="XLXI_19">
            <blockpin signalname="Q1" name="I0" />
            <blockpin signalname="Q0" name="I1" />
            <blockpin signalname="X" name="I2" />
            <blockpin signalname="XLXN_43" name="O" />
        </block>
        <block symbolname="xnor2" name="XLXI_20">
            <blockpin signalname="X" name="I0" />
            <blockpin signalname="Q0" name="I1" />
            <blockpin signalname="XLXN_40" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_21">
            <blockpin signalname="Q1" name="I0" />
            <blockpin signalname="XLXN_40" name="I1" />
            <blockpin signalname="XLXN_44" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_22">
            <blockpin signalname="XLXN_44" name="I0" />
            <blockpin signalname="XLXN_43" name="I1" />
            <blockpin signalname="XLXN_42" name="I2" />
            <blockpin signalname="XLXN_55" name="O" />
        </block>
        <block symbolname="fdce" name="XLXI_23">
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_53" name="D" />
            <blockpin signalname="Q2" name="Q" />
        </block>
        <block symbolname="fdce" name="XLXI_24">
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_54" name="D" />
            <blockpin signalname="Q1" name="Q" />
        </block>
        <block symbolname="fdce" name="XLXI_25">
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_55" name="D" />
            <blockpin signalname="Q0" name="Q" />
        </block>
        <block symbolname="and2b1" name="XLXI_38">
            <blockpin signalname="X" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="Y" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1088" y="144" name="XLXI_6" orien="M180" />
        <branch name="XLXN_35">
            <wire x2="1072" y1="496" y2="496" x1="992" />
            <wire x2="1072" y1="496" y2="544" x1="1072" />
            <wire x2="1088" y1="544" y2="544" x1="1072" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="1072" y1="704" y2="704" x1="992" />
            <wire x2="1088" y1="608" y2="608" x1="1072" />
            <wire x2="1072" y1="608" y2="704" x1="1072" />
        </branch>
        <instance x="736" y="832" name="XLXI_9" orien="R0" />
        <instance x="1088" y="672" name="XLXI_10" orien="R0" />
        <instance x="736" y="592" name="XLXI_8" orien="R0" />
        <branch name="X">
            <wire x2="688" y1="208" y2="208" x1="128" />
            <wire x2="1088" y1="208" y2="208" x1="688" />
            <wire x2="688" y1="208" y2="640" x1="688" />
            <wire x2="736" y1="640" y2="640" x1="688" />
            <wire x2="688" y1="640" y2="928" x1="688" />
            <wire x2="736" y1="928" y2="928" x1="688" />
            <wire x2="688" y1="928" y2="992" x1="688" />
            <wire x2="736" y1="992" y2="992" x1="688" />
            <wire x2="688" y1="992" y2="1248" x1="688" />
            <wire x2="736" y1="1248" y2="1248" x1="688" />
            <wire x2="688" y1="1248" y2="1472" x1="688" />
            <wire x2="736" y1="1472" y2="1472" x1="688" />
        </branch>
        <instance x="736" y="992" name="XLXI_18" orien="R0" />
        <instance x="736" y="1184" name="XLXI_19" orien="R0" />
        <instance x="736" y="1312" name="XLXI_20" orien="R0" />
        <branch name="XLXN_40">
            <wire x2="1040" y1="1216" y2="1216" x1="992" />
        </branch>
        <instance x="1040" y="1344" name="XLXI_21" orien="R0" />
        <branch name="XLXN_42">
            <wire x2="1008" y1="896" y2="896" x1="992" />
            <wire x2="1008" y1="896" y2="928" x1="1008" />
            <wire x2="1312" y1="928" y2="928" x1="1008" />
        </branch>
        <branch name="XLXN_44">
            <wire x2="1312" y1="1248" y2="1248" x1="1296" />
            <wire x2="1312" y1="1056" y2="1248" x1="1312" />
        </branch>
        <instance x="1312" y="1120" name="XLXI_22" orien="R0" />
        <branch name="XLXN_43">
            <wire x2="1008" y1="1056" y2="1056" x1="992" />
            <wire x2="1312" y1="992" y2="992" x1="1008" />
            <wire x2="1008" y1="992" y2="1056" x1="1008" />
        </branch>
        <instance x="1792" y="528" name="XLXI_23" orien="R0" />
        <branch name="XLXN_53">
            <wire x2="1792" y1="272" y2="272" x1="1344" />
        </branch>
        <branch name="XLXN_54">
            <wire x2="1792" y1="576" y2="576" x1="1344" />
        </branch>
        <instance x="1792" y="832" name="XLXI_24" orien="R0" />
        <instance x="1792" y="1248" name="XLXI_25" orien="R0" />
        <branch name="XLXN_55">
            <wire x2="1792" y1="992" y2="992" x1="1568" />
        </branch>
        <iomarker fontsize="28" x="128" y="208" name="X" orien="R180" />
        <branch name="C">
            <wire x2="1792" y1="400" y2="400" x1="1696" />
            <wire x2="1696" y1="400" y2="704" x1="1696" />
            <wire x2="1792" y1="704" y2="704" x1="1696" />
            <wire x2="1696" y1="704" y2="1120" x1="1696" />
            <wire x2="1792" y1="1120" y2="1120" x1="1696" />
            <wire x2="1696" y1="1120" y2="1520" x1="1696" />
            <wire x2="1888" y1="1520" y2="1520" x1="1696" />
        </branch>
        <branch name="CLR">
            <wire x2="1792" y1="496" y2="496" x1="1712" />
            <wire x2="1712" y1="496" y2="800" x1="1712" />
            <wire x2="1792" y1="800" y2="800" x1="1712" />
            <wire x2="1712" y1="800" y2="1216" x1="1712" />
            <wire x2="1792" y1="1216" y2="1216" x1="1712" />
            <wire x2="1712" y1="1216" y2="1424" x1="1712" />
            <wire x2="1888" y1="1424" y2="1424" x1="1712" />
        </branch>
        <branch name="CE">
            <wire x2="1792" y1="336" y2="336" x1="1680" />
            <wire x2="1680" y1="336" y2="640" x1="1680" />
            <wire x2="1792" y1="640" y2="640" x1="1680" />
            <wire x2="1680" y1="640" y2="1056" x1="1680" />
            <wire x2="1792" y1="1056" y2="1056" x1="1680" />
            <wire x2="1680" y1="1056" y2="1472" x1="1680" />
            <wire x2="1888" y1="1472" y2="1472" x1="1680" />
        </branch>
        <iomarker fontsize="28" x="1888" y="1424" name="CLR" orien="R0" />
        <iomarker fontsize="28" x="1888" y="1520" name="C" orien="R0" />
        <iomarker fontsize="28" x="1888" y="1472" name="CE" orien="R0" />
        <branch name="Q0">
            <wire x2="2240" y1="48" y2="48" x1="192" />
            <wire x2="2240" y1="48" y2="992" x1="2240" />
            <wire x2="2336" y1="48" y2="48" x1="2240" />
            <wire x2="192" y1="48" y2="704" x1="192" />
            <wire x2="656" y1="704" y2="704" x1="192" />
            <wire x2="736" y1="704" y2="704" x1="656" />
            <wire x2="656" y1="704" y2="1056" x1="656" />
            <wire x2="736" y1="1056" y2="1056" x1="656" />
            <wire x2="656" y1="1056" y2="1184" x1="656" />
            <wire x2="736" y1="1184" y2="1184" x1="656" />
            <wire x2="1088" y1="336" y2="336" x1="656" />
            <wire x2="656" y1="336" y2="528" x1="656" />
            <wire x2="736" y1="528" y2="528" x1="656" />
            <wire x2="656" y1="528" y2="704" x1="656" />
            <wire x2="2240" y1="992" y2="992" x1="2176" />
        </branch>
        <branch name="Q1">
            <wire x2="2224" y1="64" y2="64" x1="208" />
            <wire x2="2224" y1="64" y2="96" x1="2224" />
            <wire x2="2224" y1="96" y2="576" x1="2224" />
            <wire x2="2336" y1="96" y2="96" x1="2224" />
            <wire x2="208" y1="64" y2="544" x1="208" />
            <wire x2="624" y1="544" y2="544" x1="208" />
            <wire x2="624" y1="544" y2="768" x1="624" />
            <wire x2="736" y1="768" y2="768" x1="624" />
            <wire x2="624" y1="768" y2="1120" x1="624" />
            <wire x2="736" y1="1120" y2="1120" x1="624" />
            <wire x2="624" y1="1120" y2="1312" x1="624" />
            <wire x2="1024" y1="1312" y2="1312" x1="624" />
            <wire x2="1088" y1="272" y2="272" x1="624" />
            <wire x2="624" y1="272" y2="464" x1="624" />
            <wire x2="736" y1="464" y2="464" x1="624" />
            <wire x2="624" y1="464" y2="544" x1="624" />
            <wire x2="1040" y1="1280" y2="1280" x1="1024" />
            <wire x2="1024" y1="1280" y2="1312" x1="1024" />
            <wire x2="2224" y1="576" y2="576" x1="2176" />
        </branch>
        <branch name="Q2">
            <wire x2="2208" y1="80" y2="80" x1="224" />
            <wire x2="2208" y1="80" y2="144" x1="2208" />
            <wire x2="2208" y1="144" y2="272" x1="2208" />
            <wire x2="2336" y1="144" y2="144" x1="2208" />
            <wire x2="224" y1="80" y2="384" x1="224" />
            <wire x2="592" y1="384" y2="384" x1="224" />
            <wire x2="592" y1="384" y2="864" x1="592" />
            <wire x2="608" y1="864" y2="864" x1="592" />
            <wire x2="736" y1="864" y2="864" x1="608" />
            <wire x2="608" y1="864" y2="1536" x1="608" />
            <wire x2="736" y1="1536" y2="1536" x1="608" />
            <wire x2="2208" y1="272" y2="272" x1="2176" />
        </branch>
        <instance x="736" y="1408" name="XLXI_38" orien="M180" />
        <branch name="Y">
            <wire x2="1120" y1="1504" y2="1504" x1="992" />
        </branch>
        <iomarker fontsize="28" x="1120" y="1504" name="Y" orien="R0" />
        <iomarker fontsize="28" x="2336" y="144" name="Q2" orien="R0" />
        <iomarker fontsize="28" x="2336" y="96" name="Q1" orien="R0" />
        <iomarker fontsize="28" x="2336" y="48" name="Q0" orien="R0" />
    </sheet>
</drawing>