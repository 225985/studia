<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Q0c" />
        <signal name="Q1c" />
        <signal name="Q2c" />
        <signal name="Y(0:7)" />
        <signal name="Y(0)" />
        <signal name="Y(2)" />
        <signal name="Y(6)" />
        <signal name="R" />
        <signal name="C" />
        <signal name="CE" />
        <port polarity="Output" name="Q0c" />
        <port polarity="Output" name="Q1c" />
        <port polarity="Output" name="Q2c" />
        <port polarity="Output" name="Y(0:7)" />
        <port polarity="Output" name="R" />
        <port polarity="Input" name="C" />
        <port polarity="Input" name="CE" />
        <blockdef name="counter">
            <timestamp>2011-11-7T14:7:9</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="decoder">
            <timestamp>2011-11-7T14:21:8</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
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
        <block symbolname="counter" name="cnt">
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="Q0c" name="Q0" />
            <blockpin signalname="Q1c" name="Q1" />
            <blockpin signalname="Q2c" name="Q2" />
        </block>
        <block symbolname="decoder" name="dec">
            <blockpin signalname="Q0c" name="Q0" />
            <blockpin signalname="Q1c" name="Q1" />
            <blockpin signalname="Q2c" name="Q2" />
            <blockpin signalname="Y(0:7)" name="Y(0:7)" />
        </block>
        <block symbolname="or3" name="XLXI_4">
            <blockpin signalname="Y(6)" name="I0" />
            <blockpin signalname="Y(2)" name="I1" />
            <blockpin signalname="Y(0)" name="I2" />
            <blockpin signalname="R" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <instance x="208" y="384" name="cnt" orien="R0">
        </instance>
        <instance x="784" y="384" name="dec" orien="R0">
        </instance>
        <branch name="Q1c">
            <wire x2="656" y1="288" y2="288" x1="592" />
            <wire x2="784" y1="288" y2="288" x1="656" />
            <wire x2="656" y1="288" y2="608" x1="656" />
            <wire x2="800" y1="608" y2="608" x1="656" />
        </branch>
        <branch name="Q2c">
            <wire x2="624" y1="352" y2="352" x1="592" />
            <wire x2="784" y1="352" y2="352" x1="624" />
            <wire x2="624" y1="352" y2="656" x1="624" />
            <wire x2="800" y1="656" y2="656" x1="624" />
        </branch>
        <branch name="Y(0:7)">
            <wire x2="1360" y1="224" y2="224" x1="1168" />
            <wire x2="1360" y1="224" y2="288" x1="1360" />
            <wire x2="1360" y1="288" y2="352" x1="1360" />
            <wire x2="1360" y1="352" y2="416" x1="1360" />
            <wire x2="1360" y1="416" y2="480" x1="1360" />
        </branch>
        <bustap x2="1456" y1="288" y2="288" x1="1360" />
        <branch name="Y(0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1464" y="288" type="branch" />
            <wire x2="1648" y1="288" y2="288" x1="1456" />
        </branch>
        <bustap x2="1456" y1="352" y2="352" x1="1360" />
        <branch name="Y(2)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1460" y="352" type="branch" />
            <wire x2="1648" y1="352" y2="352" x1="1456" />
        </branch>
        <bustap x2="1456" y1="416" y2="416" x1="1360" />
        <branch name="Y(6)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1464" y="416" type="branch" />
            <wire x2="1648" y1="416" y2="416" x1="1456" />
        </branch>
        <instance x="1648" y="480" name="XLXI_4" orien="R0" />
        <branch name="R">
            <wire x2="1936" y1="352" y2="352" x1="1904" />
        </branch>
        <iomarker fontsize="28" x="1936" y="352" name="R" orien="R0" />
        <branch name="C">
            <wire x2="208" y1="224" y2="224" x1="176" />
        </branch>
        <iomarker fontsize="28" x="176" y="224" name="C" orien="R180" />
        <branch name="CE">
            <wire x2="208" y1="352" y2="352" x1="176" />
        </branch>
        <iomarker fontsize="28" x="176" y="352" name="CE" orien="R180" />
        <branch name="Q0c">
            <wire x2="688" y1="224" y2="224" x1="592" />
            <wire x2="784" y1="224" y2="224" x1="688" />
            <wire x2="688" y1="224" y2="560" x1="688" />
            <wire x2="800" y1="560" y2="560" x1="688" />
        </branch>
        <iomarker fontsize="28" x="800" y="560" name="Q0c" orien="R0" />
        <iomarker fontsize="28" x="800" y="656" name="Q2c" orien="R0" />
        <iomarker fontsize="28" x="800" y="608" name="Q1c" orien="R0" />
        <iomarker fontsize="28" x="1360" y="480" name="Y(0:7)" orien="R90" />
    </sheet>
</drawing>