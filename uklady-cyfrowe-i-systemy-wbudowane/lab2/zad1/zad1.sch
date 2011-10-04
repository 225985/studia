<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="x1" />
        <signal name="x2" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="y1" />
        <signal name="y2" />
        <port polarity="Input" name="x1" />
        <port polarity="Input" name="x2" />
        <port polarity="Output" name="y1" />
        <port polarity="Output" name="y2" />
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
        <block symbolname="or2" name="XLXI_1">
            <blockpin signalname="x1" name="I0" />
            <blockpin signalname="x2" name="I1" />
            <blockpin signalname="y1" name="O" />
        </block>
        <block symbolname="xnor2" name="XLXI_3">
            <blockpin signalname="x2" name="I0" />
            <blockpin signalname="x1" name="I1" />
            <blockpin signalname="y2" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="704" y="1568" name="XLXI_3" orien="R0" />
        <branch name="x1">
            <wire x2="560" y1="1440" y2="1440" x1="512" />
            <wire x2="704" y1="1440" y2="1440" x1="560" />
            <wire x2="704" y1="1312" y2="1312" x1="560" />
            <wire x2="560" y1="1312" y2="1440" x1="560" />
        </branch>
        <branch name="x2">
            <wire x2="624" y1="1504" y2="1504" x1="512" />
            <wire x2="704" y1="1504" y2="1504" x1="624" />
            <wire x2="704" y1="1248" y2="1248" x1="624" />
            <wire x2="624" y1="1248" y2="1504" x1="624" />
        </branch>
        <iomarker fontsize="28" x="512" y="1440" name="x1" orien="R180" />
        <iomarker fontsize="28" x="512" y="1504" name="x2" orien="R180" />
        <instance x="704" y="1376" name="XLXI_1" orien="R0" />
        <branch name="y1">
            <wire x2="992" y1="1280" y2="1280" x1="960" />
        </branch>
        <iomarker fontsize="28" x="992" y="1280" name="y1" orien="R0" />
        <branch name="y2">
            <wire x2="992" y1="1472" y2="1472" x1="960" />
        </branch>
        <iomarker fontsize="28" x="992" y="1472" name="y2" orien="R0" />
    </sheet>
</drawing>