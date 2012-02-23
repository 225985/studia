<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Y(0)" />
        <signal name="Y(1)" />
        <signal name="Y(2)" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_10" />
        <signal name="XLXN_12" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="Y(2:0)" />
        <signal name="XLXN_28" />
        <signal name="XLXN_35" />
        <signal name="XLXN_37" />
        <signal name="XLXN_39" />
        <signal name="XLXN_41" />
        <signal name="XLXN_42" />
        <signal name="XLXN_43" />
        <signal name="XLXN_44" />
        <signal name="XLXN_45" />
        <signal name="XLXN_46" />
        <signal name="XLXN_47" />
        <signal name="XLXN_48" />
        <signal name="XLXN_50" />
        <signal name="XLXN_51" />
        <signal name="XLXN_52" />
        <signal name="XLXN_53" />
        <signal name="XLXN_54" />
        <signal name="XLXN_55" />
        <signal name="XLXN_56" />
        <signal name="asdf">
        </signal>
        <signal name="XLXN_62" />
        <signal name="XLXN_64" />
        <signal name="K7">
        </signal>
        <signal name="XLXN_9" />
        <signal name="XLXN_66" />
        <signal name="XLXN_68" />
        <signal name="XLXN_69" />
        <signal name="XLXN_70" />
        <signal name="XLXN_71" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <signal name="XLXN_81" />
        <signal name="XLXN_82" />
        <signal name="XLXN_83" />
        <signal name="XLXN_85" />
        <signal name="XLXN_86" />
        <signal name="XLXN_87" />
        <signal name="XLXN_88" />
        <signal name="XLXN_89" />
        <signal name="XLXN_90" />
        <signal name="Clk_XT" />
        <signal name="XLXN_92" />
        <signal name="XLXN_93" />
        <signal name="DD(7:0)" />
        <signal name="XLXN_95" />
        <signal name="XLXN_96" />
        <signal name="RS_RX" />
        <signal name="XLXN_98(7:0)" />
        <signal name="RST" />
        <signal name="XLXN_102" />
        <signal name="DD(5)" />
        <signal name="XLXN_106" />
        <signal name="XLXN_107" />
        <signal name="XLXN_108" />
        <port polarity="Output" name="Y(2:0)" />
        <port polarity="Input" name="Clk_XT" />
        <port polarity="Input" name="RS_RX" />
        <port polarity="Input" name="RST" />
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
        <blockdef name="RS232_RX">
            <timestamp>2009-9-23T18:30:54</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="320" y1="-160" y2="-160" x1="384" />
        </blockdef>
        <block symbolname="fdce" name="D1">
            <blockpin signalname="Clk_XT" name="C" />
            <blockpin signalname="asdf" name="CE" />
            <blockpin signalname="K7" name="CLR" />
            <blockpin signalname="XLXN_48" name="D" />
            <blockpin signalname="Y(1)" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_12">
            <blockpin signalname="Y(1)" name="I" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_11">
            <blockpin signalname="Y(0)" name="I" />
            <blockpin signalname="XLXN_66" name="O" />
        </block>
        <block symbolname="fdce" name="D0">
            <blockpin signalname="Clk_XT" name="C" />
            <blockpin signalname="asdf" name="CE" />
            <blockpin signalname="K7" name="CLR" />
            <blockpin signalname="XLXN_70" name="D" />
            <blockpin signalname="Y(0)" name="Q" />
        </block>
        <block symbolname="and2" name="XLXI_26">
            <blockpin signalname="XLXN_41" name="I0" />
            <blockpin signalname="Y(2)" name="I1" />
            <blockpin signalname="XLXN_44" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_27">
            <blockpin signalname="XLXN_43" name="I0" />
            <blockpin signalname="XLXN_44" name="I1" />
            <blockpin signalname="XLXN_48" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_28">
            <blockpin signalname="Y(0)" name="I0" />
            <blockpin signalname="XLXN_47" name="I1" />
            <blockpin signalname="XLXN_12" name="I2" />
            <blockpin signalname="XLXN_43" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_29">
            <blockpin signalname="Y(0)" name="I0" />
            <blockpin signalname="Y(1)" name="I1" />
            <blockpin signalname="XLXN_41" name="O" />
        </block>
        <block symbolname="fdce" name="D2">
            <blockpin signalname="Clk_XT" name="C" />
            <blockpin signalname="asdf" name="CE" />
            <blockpin signalname="K7" name="CLR" />
            <blockpin signalname="XLXN_56" name="D" />
            <blockpin signalname="Y(2)" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_13">
            <blockpin signalname="Y(2)" name="I" />
            <blockpin signalname="XLXN_47" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_32">
            <blockpin signalname="XLXN_50" name="I0" />
            <blockpin signalname="XLXN_51" name="I1" />
            <blockpin signalname="XLXN_56" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_33">
            <blockpin signalname="XLXN_47" name="I0" />
            <blockpin signalname="Y(1)" name="I1" />
            <blockpin signalname="Y(0)" name="I2" />
            <blockpin signalname="XLXN_50" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_34">
            <blockpin signalname="XLXN_52" name="I0" />
            <blockpin signalname="Y(2)" name="I1" />
            <blockpin signalname="XLXN_51" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_35">
            <blockpin signalname="XLXN_12" name="I0" />
            <blockpin signalname="XLXN_66" name="I1" />
            <blockpin signalname="XLXN_52" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_36">
            <blockpin signalname="XLXN_12" name="I0" />
            <blockpin signalname="XLXN_47" name="I1" />
            <blockpin signalname="XLXN_68" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_37">
            <blockpin signalname="XLXN_66" name="I0" />
            <blockpin signalname="Y(2)" name="I1" />
            <blockpin signalname="XLXN_69" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_38">
            <blockpin signalname="XLXN_68" name="I0" />
            <blockpin signalname="XLXN_69" name="I1" />
            <blockpin signalname="XLXN_70" name="O" />
        </block>
        <block symbolname="RS232_RX" name="XLXI_42">
            <blockpin signalname="RST" name="Reset" />
            <blockpin signalname="Clk_XT" name="Clk_XT" />
            <blockpin signalname="XLXN_108" name="Rdy" />
            <blockpin signalname="DD(7:0)" name="DO(7:0)" />
            <blockpin signalname="RS_RX" name="RS_RX" />
        </block>
        <block symbolname="inv" name="XLXI_43">
            <blockpin signalname="DD(5)" name="I" />
            <blockpin signalname="XLXN_107" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_44">
            <blockpin signalname="XLXN_108" name="I0" />
            <blockpin signalname="DD(5)" name="I1" />
            <blockpin signalname="asdf" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_45">
            <blockpin signalname="XLXN_108" name="I0" />
            <blockpin signalname="XLXN_107" name="I1" />
            <blockpin signalname="K7" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="912" y="1568" name="D1" orien="R0" />
        <instance x="1376" y="1424" name="XLXI_12" orien="R0" />
        <branch name="Y(2:0)">
            <wire x2="3472" y1="608" y2="608" x1="3456" />
            <wire x2="3472" y1="608" y2="800" x1="3472" />
            <wire x2="3472" y1="800" y2="1312" x1="3472" />
            <wire x2="3472" y1="1312" y2="1872" x1="3472" />
            <wire x2="3472" y1="1872" y2="1936" x1="3472" />
        </branch>
        <bustap x2="3376" y1="800" y2="800" x1="3472" />
        <bustap x2="3376" y1="1312" y2="1312" x1="3472" />
        <bustap x2="3376" y1="1872" y2="1872" x1="3472" />
        <iomarker fontsize="28" x="3456" y="608" name="Y(2:0)" orien="R180" />
        <instance x="912" y="832" name="D0" orien="R0" />
        <instance x="1376" y="768" name="XLXI_11" orien="R0" />
        <branch name="XLXN_41">
            <wire x2="640" y1="1168" y2="1168" x1="624" />
        </branch>
        <branch name="XLXN_43">
            <wire x2="576" y1="992" y2="992" x1="304" />
            <wire x2="592" y1="896" y2="896" x1="576" />
            <wire x2="576" y1="896" y2="992" x1="576" />
        </branch>
        <instance x="624" y="1104" name="XLXI_26" orien="R180" />
        <branch name="XLXN_44">
            <wire x2="352" y1="1056" y2="1056" x1="304" />
            <wire x2="352" y1="1056" y2="1200" x1="352" />
            <wire x2="368" y1="1200" y2="1200" x1="352" />
        </branch>
        <instance x="848" y="768" name="XLXI_28" orien="R180" />
        <instance x="896" y="1072" name="XLXI_29" orien="R180" />
        <instance x="304" y="928" name="XLXI_27" orien="R180" />
        <branch name="XLXN_48">
            <wire x2="48" y1="1024" y2="1024" x1="16" />
            <wire x2="16" y1="1024" y2="1312" x1="16" />
            <wire x2="912" y1="1312" y2="1312" x1="16" />
        </branch>
        <instance x="912" y="2576" name="D2" orien="R0" />
        <instance x="1424" y="2432" name="XLXI_13" orien="R0" />
        <instance x="320" y="1792" name="XLXI_32" orien="R180" />
        <instance x="864" y="1632" name="XLXI_33" orien="R180" />
        <instance x="640" y="1968" name="XLXI_34" orien="R180" />
        <branch name="XLXN_50">
            <wire x2="464" y1="1856" y2="1856" x1="320" />
            <wire x2="464" y1="1760" y2="1856" x1="464" />
            <wire x2="608" y1="1760" y2="1760" x1="464" />
        </branch>
        <branch name="XLXN_51">
            <wire x2="352" y1="1920" y2="1920" x1="320" />
            <wire x2="352" y1="1920" y2="2064" x1="352" />
            <wire x2="384" y1="2064" y2="2064" x1="352" />
        </branch>
        <instance x="960" y="1936" name="XLXI_35" orien="R180" />
        <branch name="XLXN_52">
            <wire x2="704" y1="2032" y2="2032" x1="640" />
        </branch>
        <branch name="XLXN_56">
            <wire x2="64" y1="1888" y2="1888" x1="16" />
            <wire x2="16" y1="1888" y2="2320" x1="16" />
            <wire x2="912" y1="2320" y2="2320" x1="16" />
        </branch>
        <branch name="Y(2)">
            <wire x2="704" y1="1232" y2="1232" x1="624" />
            <wire x2="704" y1="1232" y2="1552" x1="704" />
            <wire x2="1392" y1="1552" y2="1552" x1="704" />
            <wire x2="1392" y1="1552" y2="1872" x1="1392" />
            <wire x2="1408" y1="1872" y2="1872" x1="1392" />
            <wire x2="3376" y1="1872" y2="1872" x1="1408" />
            <wire x2="1408" y1="1872" y2="2400" x1="1408" />
            <wire x2="1424" y1="2400" y2="2400" x1="1408" />
            <wire x2="1392" y1="1872" y2="2320" x1="1392" />
            <wire x2="1008" y1="2096" y2="2096" x1="640" />
            <wire x2="1696" y1="432" y2="432" x1="752" />
            <wire x2="1696" y1="432" y2="1440" x1="1696" />
            <wire x2="1008" y1="1872" y2="2096" x1="1008" />
            <wire x2="1392" y1="1872" y2="1872" x1="1008" />
            <wire x2="1392" y1="2320" y2="2320" x1="1296" />
            <wire x2="1696" y1="1440" y2="1440" x1="1408" />
            <wire x2="1408" y1="1440" y2="1872" x1="1408" />
        </branch>
        <branch name="XLXN_66">
            <wire x2="1712" y1="368" y2="368" x1="752" />
            <wire x2="1712" y1="368" y2="736" x1="1712" />
            <wire x2="1712" y1="736" y2="2064" x1="1712" />
            <wire x2="1712" y1="2064" y2="2064" x1="960" />
            <wire x2="1712" y1="736" y2="736" x1="1600" />
        </branch>
        <branch name="XLXN_47">
            <wire x2="1392" y1="256" y2="256" x1="752" />
            <wire x2="1392" y1="256" y2="416" x1="1392" />
            <wire x2="1664" y1="416" y2="416" x1="1392" />
            <wire x2="1664" y1="416" y2="928" x1="1664" />
            <wire x2="1664" y1="928" y2="1664" x1="1664" />
            <wire x2="1664" y1="1664" y2="2400" x1="1664" />
            <wire x2="1248" y1="896" y2="896" x1="848" />
            <wire x2="1248" y1="896" y2="928" x1="1248" />
            <wire x2="1664" y1="928" y2="928" x1="1248" />
            <wire x2="864" y1="1664" y2="1696" x1="864" />
            <wire x2="1664" y1="1664" y2="1664" x1="864" />
            <wire x2="1664" y1="2400" y2="2400" x1="1648" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1616" y1="192" y2="192" x1="752" />
            <wire x2="1616" y1="192" y2="960" x1="1616" />
            <wire x2="1616" y1="960" y2="1392" x1="1616" />
            <wire x2="1616" y1="1392" y2="2000" x1="1616" />
            <wire x2="1616" y1="960" y2="960" x1="848" />
            <wire x2="1616" y1="2000" y2="2000" x1="960" />
            <wire x2="1616" y1="1392" y2="1392" x1="1600" />
        </branch>
        <branch name="Y(1)">
            <wire x2="896" y1="1760" y2="1760" x1="864" />
            <wire x2="1104" y1="1200" y2="1200" x1="896" />
            <wire x2="896" y1="1232" y2="1760" x1="896" />
            <wire x2="1360" y1="1232" y2="1232" x1="896" />
            <wire x2="1360" y1="1232" y2="1312" x1="1360" />
            <wire x2="1360" y1="1312" y2="1392" x1="1360" />
            <wire x2="1376" y1="1392" y2="1392" x1="1360" />
            <wire x2="3376" y1="1312" y2="1312" x1="1360" />
            <wire x2="1104" y1="1168" y2="1200" x1="1104" />
            <wire x2="1312" y1="1168" y2="1168" x1="1104" />
            <wire x2="1312" y1="1168" y2="1312" x1="1312" />
            <wire x2="1360" y1="1312" y2="1312" x1="1312" />
            <wire x2="1312" y1="1312" y2="1312" x1="1296" />
        </branch>
        <branch name="Y(0)">
            <wire x2="1328" y1="832" y2="832" x1="848" />
            <wire x2="1344" y1="1824" y2="1824" x1="864" />
            <wire x2="896" y1="1104" y2="1136" x1="896" />
            <wire x2="1568" y1="1104" y2="1104" x1="896" />
            <wire x2="1328" y1="576" y2="576" x1="1296" />
            <wire x2="1328" y1="576" y2="736" x1="1328" />
            <wire x2="1360" y1="736" y2="736" x1="1328" />
            <wire x2="1360" y1="736" y2="800" x1="1360" />
            <wire x2="1392" y1="800" y2="800" x1="1360" />
            <wire x2="3376" y1="800" y2="800" x1="1392" />
            <wire x2="1392" y1="800" y2="944" x1="1392" />
            <wire x2="1568" y1="944" y2="944" x1="1392" />
            <wire x2="1568" y1="944" y2="1104" x1="1568" />
            <wire x2="1376" y1="736" y2="736" x1="1360" />
            <wire x2="1328" y1="736" y2="832" x1="1328" />
            <wire x2="1344" y1="720" y2="1824" x1="1344" />
            <wire x2="1360" y1="720" y2="720" x1="1344" />
            <wire x2="1360" y1="720" y2="736" x1="1360" />
        </branch>
        <instance x="752" y="128" name="XLXI_36" orien="R180" />
        <instance x="752" y="304" name="XLXI_37" orien="R180" />
        <instance x="416" y="208" name="XLXI_38" orien="R180" />
        <branch name="XLXN_68">
            <wire x2="448" y1="272" y2="272" x1="416" />
            <wire x2="448" y1="224" y2="272" x1="448" />
            <wire x2="496" y1="224" y2="224" x1="448" />
        </branch>
        <branch name="XLXN_69">
            <wire x2="448" y1="336" y2="336" x1="416" />
            <wire x2="448" y1="336" y2="400" x1="448" />
            <wire x2="496" y1="400" y2="400" x1="448" />
        </branch>
        <branch name="XLXN_70">
            <wire x2="160" y1="304" y2="304" x1="80" />
            <wire x2="80" y1="304" y2="576" x1="80" />
            <wire x2="912" y1="576" y2="576" x1="80" />
        </branch>
        <branch name="Clk_XT">
            <wire x2="32" y1="704" y2="1440" x1="32" />
            <wire x2="528" y1="1440" y2="1440" x1="32" />
            <wire x2="528" y1="1440" y2="1952" x1="528" />
            <wire x2="688" y1="1952" y2="1952" x1="528" />
            <wire x2="688" y1="1952" y2="2448" x1="688" />
            <wire x2="912" y1="2448" y2="2448" x1="688" />
            <wire x2="688" y1="2448" y2="2560" x1="688" />
            <wire x2="2784" y1="2560" y2="2560" x1="688" />
            <wire x2="912" y1="1440" y2="1440" x1="528" />
            <wire x2="912" y1="704" y2="704" x1="32" />
            <wire x2="2784" y1="2032" y2="2032" x1="2768" />
            <wire x2="2832" y1="2032" y2="2032" x1="2784" />
            <wire x2="2784" y1="2032" y2="2560" x1="2784" />
        </branch>
        <iomarker fontsize="28" x="2832" y="2032" name="Clk_XT" orien="R0" />
        <branch name="DD(7:0)">
            <wire x2="2384" y1="2096" y2="2096" x1="2176" />
            <wire x2="2176" y1="2096" y2="2208" x1="2176" />
            <wire x2="2176" y1="2208" y2="2368" x1="2176" />
        </branch>
        <bustap x2="2080" y1="2208" y2="2208" x1="2176" />
        <instance x="2768" y="2000" name="XLXI_42" orien="R180">
        </instance>
        <branch name="RS_RX">
            <wire x2="2384" y1="2160" y2="2160" x1="2336" />
        </branch>
        <iomarker fontsize="28" x="2336" y="2160" name="RS_RX" orien="R180" />
        <branch name="RST">
            <wire x2="2800" y1="2096" y2="2096" x1="2768" />
        </branch>
        <iomarker fontsize="28" x="2800" y="2096" name="RST" orien="R0" />
        <branch name="DD(5)">
            <wire x2="2064" y1="1952" y2="2064" x1="2064" />
            <wire x2="2064" y1="2064" y2="2208" x1="2064" />
            <wire x2="2080" y1="2208" y2="2208" x1="2064" />
            <wire x2="2352" y1="2064" y2="2064" x1="2064" />
            <wire x2="2352" y1="2064" y2="2528" x1="2352" />
            <wire x2="2512" y1="1952" y2="1952" x1="2064" />
            <wire x2="2352" y1="2528" y2="2528" x1="2304" />
            <wire x2="2512" y1="1776" y2="1776" x1="2432" />
            <wire x2="2512" y1="1776" y2="1952" x1="2512" />
        </branch>
        <instance x="2304" y="2400" name="XLXI_44" orien="R180" />
        <branch name="K7">
            <wire x2="912" y1="1536" y2="1536" x1="496" />
            <wire x2="496" y1="1536" y2="1600" x1="496" />
            <wire x2="1328" y1="1600" y2="1600" x1="496" />
            <wire x2="496" y1="1600" y2="1616" x1="496" />
            <wire x2="1744" y1="1616" y2="1616" x1="496" />
            <wire x2="1744" y1="1616" y2="1744" x1="1744" />
            <wire x2="1744" y1="1744" y2="2592" x1="1744" />
            <wire x2="1904" y1="1744" y2="1744" x1="1744" />
            <wire x2="912" y1="800" y2="1184" x1="912" />
            <wire x2="1328" y1="1184" y2="1184" x1="912" />
            <wire x2="1328" y1="1184" y2="1600" x1="1328" />
            <wire x2="912" y1="2544" y2="2592" x1="912" />
            <wire x2="1744" y1="2592" y2="2592" x1="912" />
        </branch>
        <branch name="asdf">
            <wire x2="912" y1="640" y2="640" x1="336" />
            <wire x2="336" y1="640" y2="1328" x1="336" />
            <wire x2="368" y1="1328" y2="1328" x1="336" />
            <wire x2="368" y1="1328" y2="1376" x1="368" />
            <wire x2="912" y1="1376" y2="1376" x1="368" />
            <wire x2="368" y1="1376" y2="2384" x1="368" />
            <wire x2="912" y1="2384" y2="2384" x1="368" />
            <wire x2="368" y1="2384" y2="2624" x1="368" />
            <wire x2="2016" y1="2624" y2="2624" x1="368" />
            <wire x2="2048" y1="2496" y2="2496" x1="2016" />
            <wire x2="2016" y1="2496" y2="2624" x1="2016" />
        </branch>
        <instance x="2432" y="1744" name="XLXI_43" orien="R180" />
        <instance x="2160" y="1648" name="XLXI_45" orien="R180" />
        <branch name="XLXN_107">
            <wire x2="2208" y1="1776" y2="1776" x1="2160" />
        </branch>
        <branch name="XLXN_108">
            <wire x2="2192" y1="1712" y2="1712" x1="2160" />
            <wire x2="2192" y1="1712" y2="1824" x1="2192" />
            <wire x2="2368" y1="1824" y2="1824" x1="2192" />
            <wire x2="2368" y1="1824" y2="2032" x1="2368" />
            <wire x2="2384" y1="2032" y2="2032" x1="2368" />
            <wire x2="2368" y1="2032" y2="2464" x1="2368" />
            <wire x2="2368" y1="2464" y2="2464" x1="2304" />
        </branch>
    </sheet>
</drawing>