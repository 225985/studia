<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_12" />
        <signal name="X(0)" />
        <signal name="Y(0)" />
        <signal name="XLXN_30" />
        <signal name="Y(2)" />
        <signal name="XLXN_35" />
        <signal name="XLXN_36" />
        <signal name="XLXN_41" />
        <signal name="XLXN_43" />
        <signal name="XLXN_46" />
        <signal name="XLXN_47" />
        <signal name="X(3)" />
        <signal name="X(2)" />
        <signal name="XLXN_57" />
        <signal name="XLXN_58" />
        <signal name="XLXN_61" />
        <signal name="XLXN_62" />
        <signal name="Y(3)" />
        <signal name="X(3:0)" />
        <signal name="Y(3:0)" />
        <signal name="XLXN_68" />
        <signal name="X(1)" />
        <signal name="XLXN_70" />
        <signal name="Y(1)" />
        <signal name="Hex(3:0)" />
        <signal name="Hex(0)" />
        <signal name="Hex(1)" />
        <signal name="XLXN_76" />
        <signal name="Hex(2)" />
        <signal name="Hex(3)" />
        <signal name="Z(6:0)" />
        <port polarity="Input" name="X(3:0)" />
        <port polarity="Output" name="Y(3:0)" />
        <port polarity="Output" name="Z(6:0)" />
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
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="HexTo7Seg">
            <timestamp>2011-10-3T14:19:2</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="inv" name="XLXI_2">
            <blockpin signalname="X(0)" name="I" />
            <blockpin signalname="Y(0)" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_3">
            <blockpin signalname="X(1)" name="I0" />
            <blockpin signalname="X(2)" name="I1" />
            <blockpin signalname="Y(2)" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_5">
            <blockpin signalname="X(1)" name="I0" />
            <blockpin signalname="X(2)" name="I1" />
            <blockpin signalname="XLXN_47" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_6">
            <blockpin signalname="X(3)" name="I" />
            <blockpin signalname="XLXN_46" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_7">
            <blockpin signalname="XLXN_47" name="I0" />
            <blockpin signalname="XLXN_46" name="I1" />
            <blockpin signalname="XLXN_62" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_8">
            <blockpin signalname="XLXN_58" name="I0" />
            <blockpin signalname="XLXN_57" name="I1" />
            <blockpin signalname="X(3)" name="I2" />
            <blockpin signalname="XLXN_61" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_9">
            <blockpin signalname="X(2)" name="I" />
            <blockpin signalname="XLXN_57" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_10">
            <blockpin signalname="X(1)" name="I" />
            <blockpin signalname="XLXN_58" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_11">
            <blockpin signalname="XLXN_62" name="I0" />
            <blockpin signalname="XLXN_61" name="I1" />
            <blockpin signalname="Y(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_13">
            <blockpin signalname="X(1)" name="I" />
            <blockpin signalname="Y(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_15">
            <blockpin signalname="Y(3)" name="I" />
            <blockpin signalname="Hex(3)" name="O" />
        </block>
        <block symbolname="HexTo7Seg" name="XLXI_14">
            <blockpin signalname="Hex(3:0)" name="Hex(3:0)" />
            <blockpin signalname="Z(6:0)" name="Displ7S(6:0)" />
        </block>
        <block symbolname="buf" name="XLXI_17">
            <blockpin signalname="Y(2)" name="I" />
            <blockpin signalname="Hex(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_18">
            <blockpin signalname="Y(1)" name="I" />
            <blockpin signalname="Hex(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_19">
            <blockpin signalname="Y(0)" name="I" />
            <blockpin signalname="Hex(0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="Y(0)">
            <wire x2="2080" y1="1776" y2="1776" x1="1488" />
            <wire x2="2400" y1="1776" y2="1776" x1="2080" />
            <wire x2="2080" y1="1776" y2="1920" x1="2080" />
            <wire x2="2416" y1="1472" y2="1472" x1="2400" />
            <wire x2="2400" y1="1472" y2="1776" x1="2400" />
        </branch>
        <branch name="Y(2)">
            <wire x2="2240" y1="1328" y2="1328" x1="1376" />
            <wire x2="2400" y1="1328" y2="1328" x1="2240" />
            <wire x2="2400" y1="1328" y2="1344" x1="2400" />
            <wire x2="2416" y1="1344" y2="1344" x1="2400" />
            <wire x2="2240" y1="1328" y2="1920" x1="2240" />
        </branch>
        <instance x="1120" y="1424" name="XLXI_3" orien="R0" />
        <instance x="1120" y="1200" name="XLXI_5" orien="R0" />
        <instance x="528" y="960" name="XLXI_6" orien="R0" />
        <instance x="1440" y="944" name="XLXI_7" orien="R0" />
        <branch name="XLXN_46">
            <wire x2="768" y1="928" y2="928" x1="752" />
            <wire x2="1440" y1="816" y2="816" x1="768" />
            <wire x2="768" y1="816" y2="928" x1="768" />
        </branch>
        <branch name="XLXN_47">
            <wire x2="1392" y1="1104" y2="1104" x1="1376" />
            <wire x2="1440" y1="880" y2="880" x1="1392" />
            <wire x2="1392" y1="880" y2="1104" x1="1392" />
        </branch>
        <instance x="656" y="1184" name="XLXI_9" orien="R0" />
        <branch name="X(2)">
            <wire x2="480" y1="1344" y2="1344" x1="352" />
            <wire x2="480" y1="1296" y2="1344" x1="480" />
            <wire x2="592" y1="1296" y2="1296" x1="480" />
            <wire x2="1056" y1="1296" y2="1296" x1="592" />
            <wire x2="1120" y1="1296" y2="1296" x1="1056" />
            <wire x2="656" y1="1152" y2="1152" x1="592" />
            <wire x2="592" y1="1152" y2="1296" x1="592" />
            <wire x2="1120" y1="1072" y2="1072" x1="1056" />
            <wire x2="1056" y1="1072" y2="1296" x1="1056" />
        </branch>
        <instance x="656" y="1568" name="XLXI_10" orien="R0" />
        <branch name="XLXN_58">
            <wire x2="1104" y1="1536" y2="1536" x1="880" />
            <wire x2="1104" y1="592" y2="1536" x1="1104" />
            <wire x2="1440" y1="592" y2="592" x1="1104" />
        </branch>
        <instance x="1440" y="656" name="XLXI_8" orien="R0" />
        <branch name="XLXN_57">
            <wire x2="896" y1="1152" y2="1152" x1="880" />
            <wire x2="1440" y1="528" y2="528" x1="896" />
            <wire x2="896" y1="528" y2="1152" x1="896" />
        </branch>
        <instance x="1792" y="768" name="XLXI_11" orien="R0" />
        <branch name="XLXN_61">
            <wire x2="1744" y1="528" y2="528" x1="1696" />
            <wire x2="1744" y1="528" y2="640" x1="1744" />
            <wire x2="1792" y1="640" y2="640" x1="1744" />
        </branch>
        <branch name="XLXN_62">
            <wire x2="1744" y1="848" y2="848" x1="1696" />
            <wire x2="1744" y1="704" y2="848" x1="1744" />
            <wire x2="1792" y1="704" y2="704" x1="1744" />
        </branch>
        <branch name="Y(3)">
            <wire x2="2224" y1="672" y2="672" x1="2048" />
            <wire x2="2224" y1="672" y2="1280" x1="2224" />
            <wire x2="2320" y1="1280" y2="1280" x1="2224" />
            <wire x2="2416" y1="1280" y2="1280" x1="2320" />
            <wire x2="2320" y1="1280" y2="1920" x1="2320" />
        </branch>
        <instance x="1264" y="1808" name="XLXI_2" orien="R0" />
        <branch name="X(0)">
            <wire x2="480" y1="1472" y2="1472" x1="352" />
            <wire x2="480" y1="1472" y2="1776" x1="480" />
            <wire x2="1264" y1="1776" y2="1776" x1="480" />
        </branch>
        <iomarker fontsize="28" x="256" y="1040" name="X(3:0)" orien="R270" />
        <bustap x2="352" y1="1472" y2="1472" x1="256" />
        <bustap x2="352" y1="1280" y2="1280" x1="256" />
        <bustap x2="352" y1="1344" y2="1344" x1="256" />
        <bustap x2="352" y1="1408" y2="1408" x1="256" />
        <branch name="X(3:0)">
            <wire x2="256" y1="1040" y2="1280" x1="256" />
            <wire x2="256" y1="1280" y2="1344" x1="256" />
            <wire x2="256" y1="1344" y2="1408" x1="256" />
            <wire x2="256" y1="1408" y2="1472" x1="256" />
            <wire x2="256" y1="1472" y2="1664" x1="256" />
        </branch>
        <branch name="X(3)">
            <wire x2="480" y1="1280" y2="1280" x1="352" />
            <wire x2="1440" y1="464" y2="464" x1="480" />
            <wire x2="480" y1="464" y2="928" x1="480" />
            <wire x2="528" y1="928" y2="928" x1="480" />
            <wire x2="480" y1="928" y2="1280" x1="480" />
        </branch>
        <branch name="Y(3:0)">
            <wire x2="2512" y1="1008" y2="1280" x1="2512" />
            <wire x2="2512" y1="1280" y2="1344" x1="2512" />
            <wire x2="2512" y1="1344" y2="1408" x1="2512" />
            <wire x2="2512" y1="1408" y2="1472" x1="2512" />
            <wire x2="2512" y1="1472" y2="1744" x1="2512" />
        </branch>
        <iomarker fontsize="28" x="2512" y="1008" name="Y(3:0)" orien="R270" />
        <bustap x2="2416" y1="1280" y2="1280" x1="2512" />
        <bustap x2="2416" y1="1344" y2="1344" x1="2512" />
        <bustap x2="2416" y1="1408" y2="1408" x1="2512" />
        <bustap x2="2416" y1="1472" y2="1472" x1="2512" />
        <instance x="1536" y="1440" name="XLXI_13" orien="R0" />
        <branch name="X(1)">
            <wire x2="640" y1="1408" y2="1408" x1="352" />
            <wire x2="656" y1="1408" y2="1408" x1="640" />
            <wire x2="656" y1="1408" y2="1536" x1="656" />
            <wire x2="1120" y1="1408" y2="1408" x1="656" />
            <wire x2="1536" y1="1408" y2="1408" x1="1120" />
            <wire x2="1120" y1="1136" y2="1360" x1="1120" />
            <wire x2="1120" y1="1360" y2="1408" x1="1120" />
        </branch>
        <branch name="Y(1)">
            <wire x2="2160" y1="1408" y2="1408" x1="1760" />
            <wire x2="2432" y1="1408" y2="1408" x1="2160" />
            <wire x2="2160" y1="1408" y2="1920" x1="2160" />
        </branch>
        <instance x="2368" y="2464" name="XLXI_14" orien="R0">
        </instance>
        <branch name="Hex(3:0)">
            <wire x2="2176" y1="2432" y2="2432" x1="1856" />
            <wire x2="2224" y1="2432" y2="2432" x1="2176" />
            <wire x2="2272" y1="2432" y2="2432" x1="2224" />
            <wire x2="2320" y1="2432" y2="2432" x1="2272" />
            <wire x2="2368" y1="2432" y2="2432" x1="2320" />
        </branch>
        <bustap x2="2320" y1="2432" y2="2336" x1="2320" />
        <bustap x2="2272" y1="2432" y2="2336" x1="2272" />
        <bustap x2="2224" y1="2432" y2="2336" x1="2224" />
        <bustap x2="2176" y1="2432" y2="2336" x1="2176" />
        <instance x="2288" y="1920" name="XLXI_15" orien="R90" />
        <instance x="2208" y="1920" name="XLXI_17" orien="R90" />
        <instance x="2128" y="1920" name="XLXI_18" orien="R90" />
        <instance x="2048" y="1920" name="XLXI_19" orien="R90" />
        <branch name="Hex(0)">
            <wire x2="2080" y1="2144" y2="2336" x1="2080" />
            <wire x2="2176" y1="2336" y2="2336" x1="2080" />
        </branch>
        <branch name="Hex(1)">
            <wire x2="2160" y1="2144" y2="2240" x1="2160" />
            <wire x2="2224" y1="2240" y2="2240" x1="2160" />
            <wire x2="2224" y1="2240" y2="2336" x1="2224" />
        </branch>
        <branch name="Hex(2)">
            <wire x2="2272" y1="2144" y2="2144" x1="2240" />
            <wire x2="2272" y1="2144" y2="2208" x1="2272" />
            <wire x2="2272" y1="2208" y2="2224" x1="2272" />
            <wire x2="2272" y1="2224" y2="2336" x1="2272" />
        </branch>
        <branch name="Hex(3)">
            <wire x2="2320" y1="2144" y2="2336" x1="2320" />
        </branch>
        <branch name="Z(6:0)">
            <wire x2="2784" y1="2432" y2="2432" x1="2752" />
        </branch>
        <iomarker fontsize="28" x="2784" y="2432" name="Z(6:0)" orien="R0" />
    </sheet>
</drawing>