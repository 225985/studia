<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Q2" />
        <signal name="X" />
        <signal name="Q0" />
        <signal name="Q1" />
        <signal name="CLR" />
        <signal name="CE" />
        <signal name="C" />
        <signal name="XLXN_53" />
        <signal name="XLXN_54" />
        <signal name="XLXN_55" />
        <signal name="XLXN_91" />
        <signal name="XLXN_93" />
        <signal name="XLXN_94" />
        <signal name="XLXN_95" />
        <signal name="XLXN_96" />
        <signal name="XLXN_100" />
        <signal name="XLXN_101" />
        <signal name="XLXN_102" />
        <signal name="XLXN_103" />
        <signal name="XLXN_104" />
        <signal name="XLXN_105" />
        <signal name="Y" />
        <signal name="XLXN_116" />
        <signal name="XLXN_117" />
        <signal name="XLXN_118" />
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
        <blockdef name="and4b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="64" y1="-112" y2="-112" x1="144" />
        </blockdef>
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
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
        <block symbolname="and3b2" name="XLXI_41">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="X" name="I1" />
            <blockpin signalname="Q2" name="I2" />
            <blockpin signalname="XLXN_100" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_42">
            <blockpin signalname="X" name="I0" />
            <blockpin signalname="Q0" name="I1" />
            <blockpin signalname="Q1" name="I2" />
            <blockpin signalname="XLXN_101" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_45">
            <blockpin signalname="XLXN_101" name="I0" />
            <blockpin signalname="XLXN_100" name="I1" />
            <blockpin signalname="XLXN_53" name="O" />
        </block>
        <block symbolname="and4b2" name="XLXI_46">
            <blockpin signalname="Q1" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="Q0" name="I2" />
            <blockpin signalname="X" name="I3" />
            <blockpin signalname="XLXN_102" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_48">
            <blockpin signalname="XLXN_103" name="I0" />
            <blockpin signalname="XLXN_102" name="I1" />
            <blockpin signalname="XLXN_54" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_49">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="XLXN_103" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_50">
            <blockpin signalname="XLXN_118" name="I0" />
            <blockpin signalname="XLXN_117" name="I1" />
            <blockpin signalname="XLXN_116" name="I2" />
            <blockpin signalname="XLXN_105" name="I3" />
            <blockpin signalname="XLXN_55" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_52">
            <blockpin signalname="X" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="XLXN_104" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_53">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="XLXN_104" name="I1" />
            <blockpin signalname="XLXN_105" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_54">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="XLXN_116" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_40">
            <blockpin signalname="Q2" name="I0" />
            <blockpin signalname="Q0" name="I1" />
            <blockpin signalname="Y" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_60">
            <blockpin signalname="X" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="XLXN_117" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_61">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="X" name="I1" />
            <blockpin signalname="Q1" name="I2" />
            <blockpin signalname="XLXN_118" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
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
            <wire x2="1792" y1="992" y2="992" x1="1616" />
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
        <iomarker fontsize="28" x="2336" y="144" name="Q2" orien="R0" />
        <iomarker fontsize="28" x="2336" y="96" name="Q1" orien="R0" />
        <iomarker fontsize="28" x="2336" y="48" name="Q0" orien="R0" />
        <branch name="X">
            <wire x2="688" y1="208" y2="208" x1="128" />
            <wire x2="768" y1="208" y2="208" x1="688" />
            <wire x2="688" y1="208" y2="448" x1="688" />
            <wire x2="768" y1="448" y2="448" x1="688" />
            <wire x2="688" y1="448" y2="480" x1="688" />
            <wire x2="768" y1="480" y2="480" x1="688" />
            <wire x2="688" y1="480" y2="944" x1="688" />
            <wire x2="720" y1="944" y2="944" x1="688" />
            <wire x2="688" y1="944" y2="1232" x1="688" />
            <wire x2="768" y1="1232" y2="1232" x1="688" />
            <wire x2="688" y1="1232" y2="1344" x1="688" />
            <wire x2="688" y1="1344" y2="2112" x1="688" />
            <wire x2="768" y1="1344" y2="1344" x1="688" />
            <wire x2="688" y1="112" y2="208" x1="688" />
        </branch>
        <instance x="768" y="336" name="XLXI_41" orien="R0" />
        <instance x="768" y="512" name="XLXI_42" orien="R0" />
        <instance x="1088" y="368" name="XLXI_45" orien="R0" />
        <branch name="XLXN_100">
            <wire x2="1056" y1="208" y2="208" x1="1024" />
            <wire x2="1056" y1="208" y2="240" x1="1056" />
            <wire x2="1088" y1="240" y2="240" x1="1056" />
        </branch>
        <branch name="XLXN_101">
            <wire x2="1056" y1="384" y2="384" x1="1024" />
            <wire x2="1056" y1="304" y2="384" x1="1056" />
            <wire x2="1088" y1="304" y2="304" x1="1056" />
        </branch>
        <instance x="768" y="736" name="XLXI_46" orien="R0" />
        <instance x="1088" y="672" name="XLXI_48" orien="R0" />
        <branch name="XLXN_102">
            <wire x2="1056" y1="576" y2="576" x1="1024" />
            <wire x2="1056" y1="544" y2="576" x1="1056" />
            <wire x2="1088" y1="544" y2="544" x1="1056" />
        </branch>
        <branch name="XLXN_103">
            <wire x2="1056" y1="768" y2="768" x1="1024" />
            <wire x2="1056" y1="608" y2="768" x1="1056" />
            <wire x2="1088" y1="608" y2="608" x1="1056" />
        </branch>
        <branch name="Q1">
            <wire x2="2224" y1="64" y2="64" x1="208" />
            <wire x2="2224" y1="64" y2="96" x1="2224" />
            <wire x2="2224" y1="96" y2="576" x1="2224" />
            <wire x2="2336" y1="96" y2="96" x1="2224" />
            <wire x2="208" y1="64" y2="544" x1="208" />
            <wire x2="624" y1="544" y2="544" x1="208" />
            <wire x2="624" y1="544" y2="672" x1="624" />
            <wire x2="768" y1="672" y2="672" x1="624" />
            <wire x2="624" y1="672" y2="736" x1="624" />
            <wire x2="768" y1="736" y2="736" x1="624" />
            <wire x2="624" y1="736" y2="880" x1="624" />
            <wire x2="720" y1="880" y2="880" x1="624" />
            <wire x2="624" y1="880" y2="1280" x1="624" />
            <wire x2="624" y1="1280" y2="2128" x1="624" />
            <wire x2="768" y1="1280" y2="1280" x1="624" />
            <wire x2="624" y1="112" y2="320" x1="624" />
            <wire x2="768" y1="320" y2="320" x1="624" />
            <wire x2="624" y1="320" y2="544" x1="624" />
            <wire x2="2224" y1="576" y2="576" x1="2176" />
        </branch>
        <instance x="768" y="864" name="XLXI_49" orien="R0" />
        <branch name="XLXN_104">
            <wire x2="1008" y1="912" y2="912" x1="976" />
        </branch>
        <instance x="720" y="1008" name="XLXI_52" orien="R0" />
        <instance x="1008" y="1040" name="XLXI_53" orien="R0" />
        <instance x="1360" y="1152" name="XLXI_50" orien="R0" />
        <branch name="XLXN_105">
            <wire x2="1280" y1="944" y2="944" x1="1264" />
            <wire x2="1360" y1="944" y2="944" x1="1280" />
            <wire x2="1360" y1="896" y2="944" x1="1360" />
        </branch>
        <instance x="768" y="1152" name="XLXI_54" orien="R0" />
        <branch name="Q2">
            <wire x2="2208" y1="80" y2="80" x1="224" />
            <wire x2="2208" y1="80" y2="144" x1="2208" />
            <wire x2="2208" y1="144" y2="272" x1="2208" />
            <wire x2="2336" y1="144" y2="144" x1="2208" />
            <wire x2="224" y1="80" y2="384" x1="224" />
            <wire x2="592" y1="384" y2="384" x1="224" />
            <wire x2="592" y1="384" y2="608" x1="592" />
            <wire x2="768" y1="608" y2="608" x1="592" />
            <wire x2="592" y1="608" y2="1024" x1="592" />
            <wire x2="768" y1="1024" y2="1024" x1="592" />
            <wire x2="592" y1="1024" y2="1168" x1="592" />
            <wire x2="592" y1="1168" y2="1968" x1="592" />
            <wire x2="592" y1="1968" y2="2128" x1="592" />
            <wire x2="720" y1="1968" y2="1968" x1="592" />
            <wire x2="768" y1="1168" y2="1168" x1="592" />
            <wire x2="592" y1="112" y2="144" x1="592" />
            <wire x2="768" y1="144" y2="144" x1="592" />
            <wire x2="592" y1="144" y2="384" x1="592" />
            <wire x2="2208" y1="272" y2="272" x1="2176" />
        </branch>
        <branch name="Y">
            <wire x2="1072" y1="1936" y2="1936" x1="976" />
        </branch>
        <branch name="Q0">
            <wire x2="2240" y1="48" y2="48" x1="192" />
            <wire x2="2240" y1="48" y2="992" x1="2240" />
            <wire x2="2336" y1="48" y2="48" x1="2240" />
            <wire x2="192" y1="48" y2="704" x1="192" />
            <wire x2="656" y1="704" y2="704" x1="192" />
            <wire x2="656" y1="704" y2="800" x1="656" />
            <wire x2="768" y1="800" y2="800" x1="656" />
            <wire x2="656" y1="800" y2="976" x1="656" />
            <wire x2="1008" y1="976" y2="976" x1="656" />
            <wire x2="656" y1="976" y2="1088" x1="656" />
            <wire x2="768" y1="1088" y2="1088" x1="656" />
            <wire x2="656" y1="1088" y2="1408" x1="656" />
            <wire x2="656" y1="1408" y2="1904" x1="656" />
            <wire x2="656" y1="1904" y2="2128" x1="656" />
            <wire x2="720" y1="1904" y2="1904" x1="656" />
            <wire x2="768" y1="1408" y2="1408" x1="656" />
            <wire x2="656" y1="112" y2="272" x1="656" />
            <wire x2="768" y1="272" y2="272" x1="656" />
            <wire x2="656" y1="272" y2="384" x1="656" />
            <wire x2="768" y1="384" y2="384" x1="656" />
            <wire x2="656" y1="384" y2="544" x1="656" />
            <wire x2="768" y1="544" y2="544" x1="656" />
            <wire x2="656" y1="544" y2="704" x1="656" />
            <wire x2="2240" y1="992" y2="992" x1="2176" />
        </branch>
        <instance x="720" y="2032" name="XLXI_40" orien="R0" />
        <iomarker fontsize="28" x="1072" y="1936" name="Y" orien="R0" />
        <instance x="768" y="1296" name="XLXI_60" orien="R0" />
        <branch name="XLXN_116">
            <wire x2="1040" y1="1056" y2="1056" x1="1024" />
            <wire x2="1280" y1="1056" y2="1056" x1="1040" />
            <wire x2="1280" y1="960" y2="1056" x1="1280" />
            <wire x2="1360" y1="960" y2="960" x1="1280" />
        </branch>
        <branch name="XLXN_117">
            <wire x2="1040" y1="1200" y2="1200" x1="1024" />
            <wire x2="1312" y1="1200" y2="1200" x1="1040" />
            <wire x2="1360" y1="1024" y2="1024" x1="1312" />
            <wire x2="1312" y1="1024" y2="1200" x1="1312" />
        </branch>
        <branch name="XLXN_118">
            <wire x2="1360" y1="1344" y2="1344" x1="1024" />
            <wire x2="1360" y1="1088" y2="1344" x1="1360" />
        </branch>
        <instance x="768" y="1472" name="XLXI_61" orien="R0" />
    </sheet>
</drawing>