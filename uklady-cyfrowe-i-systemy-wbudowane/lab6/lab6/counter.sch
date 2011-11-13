<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Q2" />
        <signal name="Q1" />
        <signal name="Q0" />
        <signal name="C" />
        <signal name="XLXN_34" />
        <signal name="CE" />
        <signal name="XLXN_44" />
        <signal name="XLXN_50" />
        <signal name="XLXN_51" />
        <signal name="XLXN_53" />
        <signal name="XLXN_54" />
        <signal name="XLXN_60" />
        <port polarity="Output" name="Q2" />
        <port polarity="Output" name="Q1" />
        <port polarity="Output" name="Q0" />
        <port polarity="Input" name="C" />
        <port polarity="Input" name="CE" />
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-96" x1="64" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="64" y1="-64" y2="-96" x1="64" />
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
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
        <block symbolname="gnd" name="XLXI_8">
            <blockpin signalname="XLXN_34" name="G" />
        </block>
        <block symbolname="fdce" name="XLXI_16">
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="XLXN_34" name="CLR" />
            <blockpin signalname="XLXN_44" name="D" />
            <blockpin signalname="Q0" name="Q" />
        </block>
        <block symbolname="fdce" name="XLXI_17">
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="XLXN_34" name="CLR" />
            <blockpin signalname="XLXN_50" name="D" />
            <blockpin signalname="Q1" name="Q" />
        </block>
        <block symbolname="fdce" name="XLXI_18">
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="XLXN_34" name="CLR" />
            <blockpin signalname="XLXN_60" name="D" />
            <blockpin signalname="Q2" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_19">
            <blockpin signalname="Q0" name="I" />
            <blockpin signalname="XLXN_44" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_29">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="XLXN_50" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_30">
            <blockpin signalname="XLXN_51" name="I0" />
            <blockpin signalname="XLXN_54" name="I1" />
            <blockpin signalname="XLXN_53" name="I2" />
            <blockpin signalname="XLXN_60" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_32">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="XLXN_54" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_31">
            <blockpin signalname="Q1" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="XLXN_51" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_33">
            <blockpin signalname="Q2" name="I0" />
            <blockpin signalname="Q0" name="I1" />
            <blockpin signalname="Q1" name="I2" />
            <blockpin signalname="XLXN_53" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <instance x="352" y="192" name="XLXI_8" orien="R180" />
        <branch name="Q1">
            <wire x2="1280" y1="736" y2="736" x1="1168" />
            <wire x2="1280" y1="736" y2="896" x1="1280" />
            <wire x2="1824" y1="896" y2="896" x1="1280" />
            <wire x2="2160" y1="736" y2="736" x1="1280" />
            <wire x2="2160" y1="736" y2="976" x1="2160" />
            <wire x2="2160" y1="976" y2="1344" x1="2160" />
            <wire x2="1280" y1="896" y2="896" x1="1232" />
            <wire x2="2160" y1="976" y2="976" x1="1952" />
            <wire x2="2160" y1="1344" y2="1344" x1="1952" />
        </branch>
        <branch name="Q0">
            <wire x2="1280" y1="160" y2="160" x1="1168" />
            <wire x2="1280" y1="160" y2="416" x1="1280" />
            <wire x2="1824" y1="416" y2="416" x1="1280" />
            <wire x2="1280" y1="416" y2="672" x1="1280" />
            <wire x2="2080" y1="672" y2="672" x1="1280" />
            <wire x2="2080" y1="672" y2="1088" x1="2080" />
            <wire x2="2080" y1="1088" y2="1280" x1="2080" />
            <wire x2="1280" y1="672" y2="672" x1="1168" />
            <wire x2="1280" y1="416" y2="416" x1="1232" />
            <wire x2="2016" y1="1104" y2="1104" x1="1952" />
            <wire x2="2080" y1="1280" y2="1280" x1="1952" />
            <wire x2="2016" y1="1088" y2="1104" x1="2016" />
            <wire x2="2080" y1="1088" y2="1088" x1="2016" />
        </branch>
        <instance x="848" y="672" name="XLXI_16" orien="R0" />
        <branch name="C">
            <wire x2="400" y1="544" y2="544" x1="208" />
            <wire x2="848" y1="544" y2="544" x1="400" />
            <wire x2="400" y1="544" y2="1024" x1="400" />
            <wire x2="400" y1="1024" y2="1504" x1="400" />
            <wire x2="848" y1="1504" y2="1504" x1="400" />
            <wire x2="848" y1="1024" y2="1024" x1="400" />
        </branch>
        <branch name="XLXN_34">
            <wire x2="288" y1="320" y2="640" x1="288" />
            <wire x2="288" y1="640" y2="1120" x1="288" />
            <wire x2="848" y1="1120" y2="1120" x1="288" />
            <wire x2="288" y1="1120" y2="1600" x1="288" />
            <wire x2="848" y1="1600" y2="1600" x1="288" />
            <wire x2="848" y1="640" y2="640" x1="288" />
        </branch>
        <instance x="848" y="1152" name="XLXI_17" orien="R0" />
        <instance x="848" y="1632" name="XLXI_18" orien="R0" />
        <branch name="CE">
            <wire x2="448" y1="480" y2="480" x1="208" />
            <wire x2="848" y1="480" y2="480" x1="448" />
            <wire x2="448" y1="480" y2="960" x1="448" />
            <wire x2="448" y1="960" y2="1440" x1="448" />
            <wire x2="848" y1="1440" y2="1440" x1="448" />
            <wire x2="848" y1="960" y2="960" x1="448" />
        </branch>
        <iomarker fontsize="28" x="208" y="480" name="CE" orien="R180" />
        <iomarker fontsize="28" x="208" y="544" name="C" orien="R180" />
        <iomarker fontsize="28" x="1824" y="416" name="Q0" orien="R0" />
        <iomarker fontsize="28" x="1824" y="1376" name="Q2" orien="R0" />
        <iomarker fontsize="28" x="1824" y="896" name="Q1" orien="R0" />
        <branch name="XLXN_44">
            <wire x2="800" y1="160" y2="416" x1="800" />
            <wire x2="848" y1="416" y2="416" x1="800" />
            <wire x2="944" y1="160" y2="160" x1="800" />
        </branch>
        <instance x="1168" y="128" name="XLXI_19" orien="R180" />
        <instance x="1168" y="608" name="XLXI_29" orien="R180" />
        <branch name="XLXN_50">
            <wire x2="800" y1="704" y2="896" x1="800" />
            <wire x2="848" y1="896" y2="896" x1="800" />
            <wire x2="912" y1="704" y2="704" x1="800" />
        </branch>
        <instance x="1952" y="912" name="XLXI_31" orien="R180" />
        <branch name="Q2">
            <wire x2="1280" y1="1376" y2="1376" x1="1232" />
            <wire x2="1824" y1="1376" y2="1376" x1="1280" />
            <wire x2="1280" y1="1376" y2="1520" x1="1280" />
            <wire x2="2240" y1="1520" y2="1520" x1="1280" />
            <wire x2="2240" y1="1040" y2="1040" x1="1952" />
            <wire x2="2240" y1="1040" y2="1152" x1="2240" />
            <wire x2="2240" y1="1152" y2="1184" x1="2240" />
            <wire x2="2240" y1="1184" y2="1520" x1="2240" />
            <wire x2="2096" y1="1168" y2="1168" x1="1952" />
            <wire x2="2096" y1="1216" y2="1216" x1="1952" />
            <wire x2="2096" y1="1152" y2="1168" x1="2096" />
            <wire x2="2240" y1="1152" y2="1152" x1="2096" />
            <wire x2="2096" y1="1184" y2="1216" x1="2096" />
            <wire x2="2240" y1="1184" y2="1184" x1="2096" />
        </branch>
        <branch name="XLXN_51">
            <wire x2="1696" y1="1024" y2="1024" x1="1584" />
            <wire x2="1584" y1="1024" y2="1056" x1="1584" />
            <wire x2="1696" y1="1008" y2="1024" x1="1696" />
        </branch>
        <instance x="1584" y="992" name="XLXI_30" orien="R180" />
        <instance x="1952" y="1152" name="XLXI_33" orien="R180" />
        <branch name="XLXN_53">
            <wire x2="1600" y1="1184" y2="1184" x1="1584" />
            <wire x2="1600" y1="1184" y2="1280" x1="1600" />
            <wire x2="1696" y1="1280" y2="1280" x1="1600" />
        </branch>
        <branch name="XLXN_60">
            <wire x2="800" y1="1200" y2="1376" x1="800" />
            <wire x2="848" y1="1376" y2="1376" x1="800" />
            <wire x2="1328" y1="1200" y2="1200" x1="800" />
            <wire x2="1328" y1="1120" y2="1200" x1="1328" />
        </branch>
        <instance x="1952" y="1040" name="XLXI_32" orien="R180" />
        <branch name="XLXN_54">
            <wire x2="1600" y1="1120" y2="1120" x1="1584" />
            <wire x2="1600" y1="1120" y2="1136" x1="1600" />
            <wire x2="1696" y1="1136" y2="1136" x1="1600" />
        </branch>
    </sheet>
</drawing>