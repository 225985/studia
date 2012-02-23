<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2" />
        <signal name="XLXN_4" />
        <signal name="XLXN_7" />
        <signal name="Q0" />
        <signal name="Q1" />
        <signal name="Q2" />
        <signal name="Y(0:7)" />
        <signal name="Y(0)" />
        <signal name="Y(1)" />
        <signal name="Y(2)" />
        <signal name="Y(3)" />
        <signal name="Y(4)" />
        <signal name="Y(5)" />
        <signal name="Y(6)" />
        <signal name="Y(7)" />
        <port polarity="Input" name="Q0" />
        <port polarity="Input" name="Q1" />
        <port polarity="Input" name="Q2" />
        <port polarity="Output" name="Y(0:7)" />
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
        <blockdef name="and3b3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="40" y1="-192" y2="-192" x1="0" />
            <circle r="12" cx="52" cy="-192" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
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
        <block symbolname="and3b3" name="XLXI_2">
            <blockpin signalname="Q2" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="Q0" name="I2" />
            <blockpin signalname="Y(0)" name="O" />
        </block>
        <block symbolname="and3b2" name="XLXI_3">
            <blockpin signalname="Q2" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="Q0" name="I2" />
            <blockpin signalname="Y(1)" name="O" />
        </block>
        <block symbolname="and3b2" name="XLXI_4">
            <blockpin signalname="Q2" name="I0" />
            <blockpin signalname="Q0" name="I1" />
            <blockpin signalname="Q1" name="I2" />
            <blockpin signalname="Y(2)" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_6">
            <blockpin signalname="Q2" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="Q0" name="I2" />
            <blockpin signalname="Y(3)" name="O" />
        </block>
        <block symbolname="and3b2" name="XLXI_5">
            <blockpin signalname="Q1" name="I0" />
            <blockpin signalname="Q0" name="I1" />
            <blockpin signalname="Q2" name="I2" />
            <blockpin signalname="Y(4)" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_7">
            <blockpin signalname="Q1" name="I0" />
            <blockpin signalname="Q2" name="I1" />
            <blockpin signalname="Q0" name="I2" />
            <blockpin signalname="Y(5)" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_8">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="Q2" name="I2" />
            <blockpin signalname="Y(6)" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_1">
            <blockpin signalname="Q2" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="Q0" name="I2" />
            <blockpin signalname="Y(7)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <instance x="672" y="416" name="XLXI_2" orien="R0" />
        <instance x="672" y="592" name="XLXI_3" orien="R0" />
        <instance x="672" y="768" name="XLXI_4" orien="R0" />
        <instance x="672" y="944" name="XLXI_6" orien="R0" />
        <instance x="672" y="1120" name="XLXI_5" orien="R0" />
        <instance x="672" y="1296" name="XLXI_7" orien="R0" />
        <instance x="672" y="1472" name="XLXI_8" orien="R0" />
        <instance x="672" y="1648" name="XLXI_1" orien="R0" />
        <branch name="Q0">
            <wire x2="480" y1="224" y2="224" x1="160" />
            <wire x2="672" y1="224" y2="224" x1="480" />
            <wire x2="480" y1="224" y2="400" x1="480" />
            <wire x2="672" y1="400" y2="400" x1="480" />
            <wire x2="480" y1="400" y2="640" x1="480" />
            <wire x2="672" y1="640" y2="640" x1="480" />
            <wire x2="480" y1="640" y2="752" x1="480" />
            <wire x2="672" y1="752" y2="752" x1="480" />
            <wire x2="480" y1="752" y2="992" x1="480" />
            <wire x2="672" y1="992" y2="992" x1="480" />
            <wire x2="480" y1="992" y2="1104" x1="480" />
            <wire x2="672" y1="1104" y2="1104" x1="480" />
            <wire x2="480" y1="1104" y2="1408" x1="480" />
            <wire x2="672" y1="1408" y2="1408" x1="480" />
            <wire x2="480" y1="1408" y2="1456" x1="480" />
            <wire x2="672" y1="1456" y2="1456" x1="480" />
        </branch>
        <branch name="Q1">
            <wire x2="448" y1="288" y2="288" x1="160" />
            <wire x2="672" y1="288" y2="288" x1="448" />
            <wire x2="448" y1="288" y2="464" x1="448" />
            <wire x2="672" y1="464" y2="464" x1="448" />
            <wire x2="448" y1="464" y2="576" x1="448" />
            <wire x2="672" y1="576" y2="576" x1="448" />
            <wire x2="448" y1="576" y2="816" x1="448" />
            <wire x2="672" y1="816" y2="816" x1="448" />
            <wire x2="448" y1="816" y2="1056" x1="448" />
            <wire x2="672" y1="1056" y2="1056" x1="448" />
            <wire x2="448" y1="1056" y2="1232" x1="448" />
            <wire x2="672" y1="1232" y2="1232" x1="448" />
            <wire x2="448" y1="1232" y2="1344" x1="448" />
            <wire x2="672" y1="1344" y2="1344" x1="448" />
            <wire x2="448" y1="1344" y2="1520" x1="448" />
            <wire x2="672" y1="1520" y2="1520" x1="448" />
        </branch>
        <branch name="Q2">
            <wire x2="416" y1="352" y2="352" x1="160" />
            <wire x2="672" y1="352" y2="352" x1="416" />
            <wire x2="416" y1="352" y2="528" x1="416" />
            <wire x2="672" y1="528" y2="528" x1="416" />
            <wire x2="416" y1="528" y2="704" x1="416" />
            <wire x2="672" y1="704" y2="704" x1="416" />
            <wire x2="416" y1="704" y2="880" x1="416" />
            <wire x2="672" y1="880" y2="880" x1="416" />
            <wire x2="416" y1="880" y2="928" x1="416" />
            <wire x2="672" y1="928" y2="928" x1="416" />
            <wire x2="416" y1="928" y2="1168" x1="416" />
            <wire x2="672" y1="1168" y2="1168" x1="416" />
            <wire x2="416" y1="1168" y2="1280" x1="416" />
            <wire x2="672" y1="1280" y2="1280" x1="416" />
            <wire x2="416" y1="1280" y2="1584" x1="416" />
            <wire x2="672" y1="1584" y2="1584" x1="416" />
        </branch>
        <branch name="Y(0:7)">
            <wire x2="1504" y1="176" y2="176" x1="1248" />
            <wire x2="1248" y1="176" y2="288" x1="1248" />
            <wire x2="1248" y1="288" y2="464" x1="1248" />
            <wire x2="1248" y1="464" y2="640" x1="1248" />
            <wire x2="1248" y1="640" y2="816" x1="1248" />
            <wire x2="1248" y1="816" y2="992" x1="1248" />
            <wire x2="1248" y1="992" y2="1168" x1="1248" />
            <wire x2="1248" y1="1168" y2="1344" x1="1248" />
            <wire x2="1248" y1="1344" y2="1520" x1="1248" />
        </branch>
        <bustap x2="1152" y1="288" y2="288" x1="1248" />
        <branch name="Y(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1144" y="288" type="branch" />
            <wire x2="1144" y1="288" y2="288" x1="928" />
            <wire x2="1152" y1="288" y2="288" x1="1144" />
        </branch>
        <bustap x2="1152" y1="464" y2="464" x1="1248" />
        <branch name="Y(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1144" y="464" type="branch" />
            <wire x2="1144" y1="464" y2="464" x1="928" />
            <wire x2="1152" y1="464" y2="464" x1="1144" />
        </branch>
        <bustap x2="1152" y1="640" y2="640" x1="1248" />
        <branch name="Y(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1144" y="640" type="branch" />
            <wire x2="1136" y1="640" y2="640" x1="928" />
            <wire x2="1144" y1="640" y2="640" x1="1136" />
            <wire x2="1152" y1="640" y2="640" x1="1144" />
        </branch>
        <bustap x2="1152" y1="816" y2="816" x1="1248" />
        <branch name="Y(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1144" y="816" type="branch" />
            <wire x2="1136" y1="816" y2="816" x1="928" />
            <wire x2="1144" y1="816" y2="816" x1="1136" />
            <wire x2="1152" y1="816" y2="816" x1="1144" />
        </branch>
        <bustap x2="1152" y1="992" y2="992" x1="1248" />
        <branch name="Y(4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1144" y="992" type="branch" />
            <wire x2="1136" y1="992" y2="992" x1="928" />
            <wire x2="1144" y1="992" y2="992" x1="1136" />
            <wire x2="1152" y1="992" y2="992" x1="1144" />
        </branch>
        <bustap x2="1152" y1="1168" y2="1168" x1="1248" />
        <branch name="Y(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1144" y="1168" type="branch" />
            <wire x2="1136" y1="1168" y2="1168" x1="928" />
            <wire x2="1144" y1="1168" y2="1168" x1="1136" />
            <wire x2="1152" y1="1168" y2="1168" x1="1144" />
        </branch>
        <bustap x2="1152" y1="1344" y2="1344" x1="1248" />
        <branch name="Y(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1144" y="1344" type="branch" />
            <wire x2="1136" y1="1344" y2="1344" x1="928" />
            <wire x2="1144" y1="1344" y2="1344" x1="1136" />
            <wire x2="1152" y1="1344" y2="1344" x1="1144" />
        </branch>
        <bustap x2="1152" y1="1520" y2="1520" x1="1248" />
        <branch name="Y(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1144" y="1520" type="branch" />
            <wire x2="1136" y1="1520" y2="1520" x1="928" />
            <wire x2="1144" y1="1520" y2="1520" x1="1136" />
            <wire x2="1152" y1="1520" y2="1520" x1="1144" />
        </branch>
        <iomarker fontsize="28" x="160" y="352" name="Q2" orien="R180" />
        <iomarker fontsize="28" x="160" y="288" name="Q1" orien="R180" />
        <iomarker fontsize="28" x="160" y="224" name="Q0" orien="R180" />
        <iomarker fontsize="28" x="1504" y="176" name="Y(0:7)" orien="R0" />
    </sheet>
</drawing>