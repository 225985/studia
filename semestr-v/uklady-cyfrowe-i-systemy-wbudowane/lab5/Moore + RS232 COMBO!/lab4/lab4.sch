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
        <signal name="XLXN_217" />
        <signal name="CE" />
        <signal name="C" />
        <signal name="XLXN_53" />
        <signal name="XLXN_54" />
        <signal name="XLXN_55" />
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
        <signal name="D(7)" />
        <signal name="D(6)" />
        <signal name="D(4)" />
        <signal name="D(3)" />
        <signal name="D(2)" />
        <signal name="D(1)" />
        <signal name="D(0)" />
        <signal name="XLXN_186" />
        <signal name="XLXN_187" />
        <signal name="XLXN_191" />
        <signal name="XLXN_193" />
        <signal name="XLXN_194" />
        <signal name="XLXN_195" />
        <signal name="XLXN_215" />
        <signal name="XLXN_217" />
        <signal name="RS_RX" />
        <signal name="D(5)" />
        <signal name="XLXN_228" />
        <signal name="XLXN_1234" />
        <signal name="XLXN_1237" />
        <signal name="DI(15:0)" />
        <signal name="DI(15)" />
        <signal name="DI(14)" />
        <signal name="DI(13)" />
        <signal name="DI(12)" />
        <signal name="DI(11)" />
        <signal name="DI(10)" />
        <signal name="DI(9)" />
        <signal name="DI(8)" />
        <signal name="DI(3)" />
        <signal name="DI(0)" />
        <signal name="DI(1)" />
        <signal name="XLXN_1259" />
        <signal name="XLXN_1260" />
        <signal name="XLXN_1261" />
        <signal name="DI(2)" />
        <signal name="XLXN_1263" />
        <signal name="XLXN_1264" />
        <signal name="XLXN_1265" />
        <signal name="D7S_D(3:0)" />
        <signal name="D7S_S(7:0)" />
        <signal name="Clk_LF" />
        <signal name="XLXN_1269" />
        <signal name="XLXN_231" />
        <signal name="D(7:0)" />
        <signal name="XLXN_1286(7:0)" />
        <signal name="XLXN_1289" />
        <signal name="XLXN_1292" />
        <signal name="XLXN_1293" />
        <signal name="XLXN_1294" />
        <signal name="XLXN_1295" />
        <signal name="XLXN_1296" />
        <signal name="XLXN_1297" />
        <signal name="XLXN_1298" />
        <signal name="XLXN_1299" />
        <signal name="XLXN_1300" />
        <signal name="XLXN_1302" />
        <signal name="Blank(3:0)" />
        <signal name="Blank(2)" />
        <signal name="Blank(0)" />
        <signal name="XLXN_1311" />
        <signal name="Blank(1)" />
        <signal name="XLXN_1313" />
        <port polarity="Output" name="Q2" />
        <port polarity="Output" name="Q0" />
        <port polarity="Output" name="Q1" />
        <port polarity="Input" name="C" />
        <port polarity="Output" name="Y" />
        <port polarity="Input" name="RS_RX" />
        <port polarity="Output" name="D7S_D(3:0)" />
        <port polarity="Output" name="D7S_S(7:0)" />
        <port polarity="Input" name="Clk_LF" />
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
        <blockdef name="and8">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-512" x1="64" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="144" y1="-336" y2="-336" x1="64" />
            <line x2="64" y1="-240" y2="-240" x1="144" />
            <arc ex="144" ey="-336" sx="144" sy="-240" r="48" cx="144" cy="-288" />
            <line x2="192" y1="-288" y2="-288" x1="256" />
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
        <blockdef name="Display4x7S">
            <timestamp>2010-10-14T9:39:8</timestamp>
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="256" x="64" y="-128" height="256" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="20" height="24" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="32" y1="-64" y2="-64" x1="96" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="64" />
        </blockdef>
        <block symbolname="fdce" name="XLXI_23">
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="XLXN_1237" name="CLR" />
            <blockpin signalname="XLXN_53" name="D" />
            <blockpin signalname="Q2" name="Q" />
        </block>
        <block symbolname="fdce" name="XLXI_24">
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="XLXN_1237" name="CLR" />
            <blockpin signalname="XLXN_54" name="D" />
            <blockpin signalname="Q1" name="Q" />
        </block>
        <block symbolname="fdce" name="XLXI_25">
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="XLXN_1237" name="CLR" />
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
        <block symbolname="and8" name="ZERO">
            <blockpin signalname="XLXN_186" name="I0" />
            <blockpin signalname="XLXN_187" name="I1" />
            <blockpin signalname="D(5)" name="I2" />
            <blockpin signalname="D(4)" name="I3" />
            <blockpin signalname="XLXN_191" name="I4" />
            <blockpin signalname="XLXN_193" name="I5" />
            <blockpin signalname="XLXN_194" name="I6" />
            <blockpin signalname="XLXN_195" name="I7" />
            <blockpin signalname="XLXN_215" name="O" />
        </block>
        <block symbolname="and8" name="ONE">
            <blockpin signalname="XLXN_186" name="I0" />
            <blockpin signalname="XLXN_187" name="I1" />
            <blockpin signalname="D(5)" name="I2" />
            <blockpin signalname="D(4)" name="I3" />
            <blockpin signalname="XLXN_191" name="I4" />
            <blockpin signalname="XLXN_193" name="I5" />
            <blockpin signalname="XLXN_194" name="I6" />
            <blockpin signalname="D(0)" name="I7" />
            <blockpin signalname="X" name="O" />
        </block>
        <block symbolname="and8" name="ESC">
            <blockpin signalname="XLXN_186" name="I0" />
            <blockpin signalname="XLXN_187" name="I1" />
            <blockpin signalname="XLXN_228" name="I2" />
            <blockpin signalname="D(4)" name="I3" />
            <blockpin signalname="D(3)" name="I4" />
            <blockpin signalname="XLXN_193" name="I5" />
            <blockpin signalname="D(1)" name="I6" />
            <blockpin signalname="D(0)" name="I7" />
            <blockpin signalname="XLXN_1234" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_73">
            <blockpin signalname="D(7)" name="I" />
            <blockpin signalname="XLXN_186" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_74">
            <blockpin signalname="D(6)" name="I" />
            <blockpin signalname="XLXN_187" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_75">
            <blockpin signalname="D(2)" name="I" />
            <blockpin signalname="XLXN_193" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_76">
            <blockpin signalname="D(3)" name="I" />
            <blockpin signalname="XLXN_191" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_77">
            <blockpin signalname="D(1)" name="I" />
            <blockpin signalname="XLXN_194" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_78">
            <blockpin signalname="D(0)" name="I" />
            <blockpin signalname="XLXN_195" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_79">
            <blockpin signalname="D(5)" name="I" />
            <blockpin signalname="XLXN_228" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_80">
            <blockpin signalname="XLXN_1234" name="I0" />
            <blockpin signalname="XLXN_231" name="I1" />
            <blockpin signalname="XLXN_1237" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_82">
            <blockpin signalname="XLXN_217" name="I0" />
            <blockpin signalname="XLXN_231" name="I1" />
            <blockpin signalname="CE" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_50">
            <blockpin signalname="XLXN_118" name="I0" />
            <blockpin signalname="XLXN_117" name="I1" />
            <blockpin signalname="XLXN_116" name="I2" />
            <blockpin signalname="XLXN_105" name="I3" />
            <blockpin signalname="XLXN_55" name="O" />
        </block>
        <block symbolname="Display4x7S" name="XLXI_83">
            <blockpin signalname="DI(15:0)" name="DI(15:0)" />
            <blockpin signalname="D7S_D(3:0)" name="D7S_D(3:0)" />
            <blockpin signalname="D7S_S(7:0)" name="D7S_S(7:0)" />
            <blockpin name="DP(3:0)" />
            <blockpin signalname="Clk_LF" name="Clk" />
            <blockpin signalname="Blank(3:0)" name="Blank(3:0)" />
        </block>
        <block symbolname="or2" name="XLXI_84">
            <blockpin signalname="XLXN_215" name="I0" />
            <blockpin signalname="X" name="I1" />
            <blockpin signalname="XLXN_217" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_86">
            <blockpin signalname="Q2" name="I" />
            <blockpin signalname="DI(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_87">
            <blockpin signalname="Q1" name="I" />
            <blockpin signalname="DI(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_88">
            <blockpin signalname="Q0" name="I" />
            <blockpin signalname="DI(0)" name="O" />
        </block>
        <block symbolname="RS232_RX" name="XLXI_62">
            <blockpin name="Reset" />
            <blockpin signalname="C" name="Clk_XT" />
            <blockpin signalname="XLXN_231" name="Rdy" />
            <blockpin signalname="D(7:0)" name="DO(7:0)" />
            <blockpin signalname="RS_RX" name="RS_RX" />
        </block>
        <block symbolname="buf" name="XLXI_91">
            <blockpin signalname="D(1)" name="I" />
            <blockpin signalname="DI(9)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_92">
            <blockpin signalname="D(2)" name="I" />
            <blockpin signalname="DI(10)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_93">
            <blockpin signalname="D(3)" name="I" />
            <blockpin signalname="DI(11)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_94">
            <blockpin signalname="D(4)" name="I" />
            <blockpin signalname="DI(12)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_95">
            <blockpin signalname="D(5)" name="I" />
            <blockpin signalname="DI(13)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_96">
            <blockpin signalname="D(6)" name="I" />
            <blockpin signalname="DI(14)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_97">
            <blockpin signalname="D(7)" name="I" />
            <blockpin signalname="DI(15)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_90">
            <blockpin signalname="D(0)" name="I" />
            <blockpin signalname="DI(8)" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_100">
            <blockpin signalname="Blank(1)" name="P" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
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
        <iomarker fontsize="28" x="2336" y="144" name="Q2" orien="R0" />
        <iomarker fontsize="28" x="2336" y="96" name="Q1" orien="R0" />
        <iomarker fontsize="28" x="2336" y="48" name="Q0" orien="R0" />
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
        <instance x="768" y="864" name="XLXI_49" orien="R0" />
        <branch name="XLXN_104">
            <wire x2="1008" y1="912" y2="912" x1="976" />
        </branch>
        <instance x="720" y="1008" name="XLXI_52" orien="R0" />
        <instance x="1008" y="1040" name="XLXI_53" orien="R0" />
        <branch name="XLXN_105">
            <wire x2="1360" y1="944" y2="944" x1="1264" />
            <wire x2="1360" y1="896" y2="944" x1="1360" />
        </branch>
        <instance x="768" y="1152" name="XLXI_54" orien="R0" />
        <branch name="Y">
            <wire x2="1072" y1="1648" y2="1648" x1="976" />
        </branch>
        <instance x="768" y="1296" name="XLXI_60" orien="R0" />
        <branch name="XLXN_116">
            <wire x2="1280" y1="1056" y2="1056" x1="1024" />
            <wire x2="1280" y1="960" y2="1056" x1="1280" />
            <wire x2="1360" y1="960" y2="960" x1="1280" />
        </branch>
        <branch name="XLXN_117">
            <wire x2="1312" y1="1200" y2="1200" x1="1024" />
            <wire x2="1360" y1="1024" y2="1024" x1="1312" />
            <wire x2="1312" y1="1024" y2="1200" x1="1312" />
        </branch>
        <branch name="XLXN_118">
            <wire x2="1360" y1="1344" y2="1344" x1="1024" />
            <wire x2="1360" y1="1088" y2="1344" x1="1360" />
        </branch>
        <instance x="768" y="1472" name="XLXI_61" orien="R0" />
        <instance x="2864" y="1216" name="XLXI_73" orien="R180" />
        <instance x="2864" y="1312" name="XLXI_74" orien="R180" />
        <branch name="D(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2896" y="1344" type="branch" />
            <wire x2="3120" y1="3312" y2="3312" x1="1568" />
            <wire x2="2896" y1="1344" y2="1344" x1="2864" />
            <wire x2="3120" y1="1344" y2="1344" x1="2896" />
            <wire x2="3536" y1="1344" y2="1344" x1="3120" />
            <wire x2="3120" y1="1344" y2="3312" x1="3120" />
        </branch>
        <branch name="D(1)">
            <attrtext style="alignment:SOFT-TCENTER" attrname="Name" x="2896" y="1824" type="branch" />
            <wire x2="2960" y1="2992" y2="2992" x1="1568" />
            <wire x2="2560" y1="2560" y2="2560" x1="2272" />
            <wire x2="2896" y1="1776" y2="1776" x1="2560" />
            <wire x2="2896" y1="1776" y2="1824" x1="2896" />
            <wire x2="2960" y1="1824" y2="1824" x1="2896" />
            <wire x2="3536" y1="1824" y2="1824" x1="2960" />
            <wire x2="2960" y1="1824" y2="2992" x1="2960" />
            <wire x2="2560" y1="1776" y2="2560" x1="2560" />
            <wire x2="2896" y1="1824" y2="1824" x1="2864" />
        </branch>
        <instance x="2864" y="1696" name="XLXI_75" orien="R180" />
        <branch name="XLXN_187">
            <wire x2="2448" y1="1312" y2="1312" x1="2272" />
            <wire x2="2448" y1="1312" y2="1344" x1="2448" />
            <wire x2="2640" y1="1344" y2="1344" x1="2448" />
            <wire x2="2448" y1="1344" y2="1776" x1="2448" />
            <wire x2="2448" y1="1776" y2="2240" x1="2448" />
            <wire x2="2448" y1="1776" y2="1776" x1="2272" />
            <wire x2="2448" y1="2240" y2="2240" x1="2272" />
        </branch>
        <instance x="2864" y="1600" name="XLXI_76" orien="R180" />
        <instance x="2864" y="1792" name="XLXI_77" orien="R180" />
        <instance x="2864" y="1888" name="XLXI_78" orien="R180" />
        <branch name="XLXN_191">
            <wire x2="2512" y1="1504" y2="1504" x1="2272" />
            <wire x2="2512" y1="1504" y2="1632" x1="2512" />
            <wire x2="2640" y1="1632" y2="1632" x1="2512" />
            <wire x2="2512" y1="1632" y2="1968" x1="2512" />
            <wire x2="2512" y1="1968" y2="2192" x1="2512" />
            <wire x2="2512" y1="1968" y2="1968" x1="2272" />
        </branch>
        <branch name="XLXN_195">
            <wire x2="2384" y1="1696" y2="1696" x1="2272" />
            <wire x2="2384" y1="1696" y2="1920" x1="2384" />
            <wire x2="2608" y1="1920" y2="1920" x1="2384" />
            <wire x2="2640" y1="1920" y2="1920" x1="2608" />
            <wire x2="2608" y1="1920" y2="2192" x1="2608" />
        </branch>
        <branch name="D(5)">
            <attrtext style="alignment:SOFT-TCENTER" attrname="Name" x="2896" y="1440" type="branch" />
            <wire x2="3088" y1="3248" y2="3248" x1="1568" />
            <wire x2="2464" y1="1376" y2="1376" x1="2272" />
            <wire x2="2464" y1="1376" y2="1392" x1="2464" />
            <wire x2="2896" y1="1392" y2="1392" x1="2464" />
            <wire x2="2896" y1="1392" y2="1440" x1="2896" />
            <wire x2="3088" y1="1440" y2="1440" x1="2896" />
            <wire x2="3536" y1="1440" y2="1440" x1="3088" />
            <wire x2="3088" y1="1440" y2="3248" x1="3088" />
            <wire x2="2464" y1="1392" y2="1840" x1="2464" />
            <wire x2="2464" y1="1840" y2="2192" x1="2464" />
            <wire x2="2464" y1="1840" y2="1840" x1="2272" />
            <wire x2="2896" y1="1440" y2="1440" x1="2864" />
        </branch>
        <instance x="2272" y="1184" name="ZERO" orien="R180" />
        <instance x="2272" y="1648" name="ONE" orien="R180" />
        <branch name="XLXN_194">
            <wire x2="2400" y1="1632" y2="1632" x1="2272" />
            <wire x2="2400" y1="1632" y2="1824" x1="2400" />
            <wire x2="2576" y1="1824" y2="1824" x1="2400" />
            <wire x2="2640" y1="1824" y2="1824" x1="2576" />
            <wire x2="2576" y1="1824" y2="2096" x1="2576" />
            <wire x2="2576" y1="2096" y2="2192" x1="2576" />
            <wire x2="2576" y1="2096" y2="2096" x1="2272" />
        </branch>
        <instance x="2272" y="2112" name="ESC" orien="R180" />
        <branch name="XLXN_193">
            <wire x2="2416" y1="1568" y2="1568" x1="2272" />
            <wire x2="2416" y1="1568" y2="1728" x1="2416" />
            <wire x2="2544" y1="1728" y2="1728" x1="2416" />
            <wire x2="2640" y1="1728" y2="1728" x1="2544" />
            <wire x2="2544" y1="1728" y2="2032" x1="2544" />
            <wire x2="2544" y1="2032" y2="2496" x1="2544" />
            <wire x2="2544" y1="2032" y2="2032" x1="2272" />
            <wire x2="2544" y1="2496" y2="2496" x1="2272" />
        </branch>
        <branch name="XLXN_186">
            <wire x2="2432" y1="1248" y2="1248" x1="2272" />
            <wire x2="2640" y1="1248" y2="1248" x1="2432" />
            <wire x2="2432" y1="1248" y2="1712" x1="2432" />
            <wire x2="2432" y1="1712" y2="2176" x1="2432" />
            <wire x2="2432" y1="1712" y2="1712" x1="2272" />
            <wire x2="2432" y1="2176" y2="2176" x1="2272" />
        </branch>
        <branch name="D(4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2896" y="1536" type="branch" />
            <wire x2="3056" y1="3184" y2="3184" x1="1568" />
            <wire x2="2416" y1="1440" y2="1440" x1="2272" />
            <wire x2="2416" y1="1440" y2="1456" x1="2416" />
            <wire x2="2496" y1="1456" y2="1456" x1="2416" />
            <wire x2="2496" y1="1456" y2="1536" x1="2496" />
            <wire x2="2896" y1="1536" y2="1536" x1="2496" />
            <wire x2="3056" y1="1536" y2="1536" x1="2896" />
            <wire x2="3536" y1="1536" y2="1536" x1="3056" />
            <wire x2="3056" y1="1536" y2="3184" x1="3056" />
            <wire x2="2496" y1="1536" y2="1904" x1="2496" />
            <wire x2="2496" y1="1904" y2="2368" x1="2496" />
            <wire x2="2496" y1="1904" y2="1904" x1="2272" />
            <wire x2="2496" y1="2368" y2="2368" x1="2272" />
        </branch>
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-TCENTER" attrname="Name" x="2896" y="1920" type="branch" />
            <wire x2="2928" y1="2928" y2="2928" x1="1568" />
            <wire x2="2592" y1="2160" y2="2160" x1="2272" />
            <wire x2="2592" y1="2160" y2="2624" x1="2592" />
            <wire x2="2592" y1="2624" y2="2624" x1="2272" />
            <wire x2="2896" y1="1872" y2="1872" x1="2592" />
            <wire x2="2896" y1="1872" y2="1920" x1="2896" />
            <wire x2="2928" y1="1920" y2="1920" x1="2896" />
            <wire x2="3536" y1="1920" y2="1920" x1="2928" />
            <wire x2="2928" y1="1920" y2="2928" x1="2928" />
            <wire x2="2592" y1="1872" y2="2160" x1="2592" />
            <wire x2="2896" y1="1920" y2="1920" x1="2864" />
        </branch>
        <instance x="1744" y="2384" name="XLXI_80" orien="R270" />
        <branch name="XLXN_215">
            <wire x2="2000" y1="1872" y2="1872" x1="1920" />
            <wire x2="2016" y1="1472" y2="1472" x1="2000" />
            <wire x2="2000" y1="1472" y2="1872" x1="2000" />
        </branch>
        <instance x="720" y="1744" name="XLXI_40" orien="R0" />
        <iomarker fontsize="28" x="1072" y="1648" name="Y" orien="R0" />
        <instance x="1360" y="1152" name="XLXI_50" orien="R0" />
        <iomarker fontsize="28" x="2960" y="736" name="C" orien="R270" />
        <instance x="2864" y="1408" name="XLXI_79" orien="R180" />
        <branch name="XLXN_228">
            <wire x2="2480" y1="2304" y2="2304" x1="2272" />
            <wire x2="2640" y1="1440" y2="1440" x1="2480" />
            <wire x2="2480" y1="1440" y2="2304" x1="2480" />
        </branch>
        <branch name="XLXN_1234">
            <wire x2="1680" y1="2384" y2="2400" x1="1680" />
            <wire x2="2016" y1="2400" y2="2400" x1="1680" />
        </branch>
        <branch name="CE">
            <wire x2="1680" y1="1568" y2="1568" x1="1520" />
            <wire x2="1520" y1="1568" y2="1632" x1="1520" />
            <wire x2="1792" y1="336" y2="336" x1="1680" />
            <wire x2="1680" y1="336" y2="640" x1="1680" />
            <wire x2="1792" y1="640" y2="640" x1="1680" />
            <wire x2="1680" y1="640" y2="1056" x1="1680" />
            <wire x2="1792" y1="1056" y2="1056" x1="1680" />
            <wire x2="1680" y1="1056" y2="1568" x1="1680" />
        </branch>
        <instance x="1616" y="1888" name="XLXI_82" orien="R270" />
        <branch name="X">
            <wire x2="688" y1="208" y2="208" x1="160" />
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
            <wire x2="768" y1="1344" y2="1344" x1="688" />
            <wire x2="160" y1="208" y2="1488" x1="160" />
            <wire x2="1968" y1="1488" y2="1488" x1="160" />
            <wire x2="1968" y1="1488" y2="1936" x1="1968" />
            <wire x2="2016" y1="1936" y2="1936" x1="1968" />
            <wire x2="688" y1="112" y2="208" x1="688" />
            <wire x2="1968" y1="1936" y2="1936" x1="1920" />
        </branch>
        <instance x="1920" y="1808" name="XLXI_84" orien="R180" />
        <branch name="XLXN_217">
            <wire x2="1552" y1="1888" y2="1904" x1="1552" />
            <wire x2="1664" y1="1904" y2="1904" x1="1552" />
        </branch>
        <branch name="XLXN_1237">
            <wire x2="1712" y1="1680" y2="1680" x1="1648" />
            <wire x2="1648" y1="1680" y2="2128" x1="1648" />
            <wire x2="1792" y1="496" y2="496" x1="1712" />
            <wire x2="1712" y1="496" y2="800" x1="1712" />
            <wire x2="1792" y1="800" y2="800" x1="1712" />
            <wire x2="1712" y1="800" y2="1216" x1="1712" />
            <wire x2="1792" y1="1216" y2="1216" x1="1712" />
            <wire x2="1712" y1="1216" y2="1680" x1="1712" />
        </branch>
        <instance x="240" y="1888" name="XLXI_83" orien="R270">
        </instance>
        <bustap x2="160" y1="2080" y2="2176" x1="160" />
        <bustap x2="192" y1="2080" y2="2176" x1="192" />
        <bustap x2="224" y1="2080" y2="2176" x1="224" />
        <bustap x2="256" y1="2080" y2="2176" x1="256" />
        <bustap x2="288" y1="2080" y2="2176" x1="288" />
        <bustap x2="320" y1="2080" y2="2176" x1="320" />
        <bustap x2="352" y1="2080" y2="2176" x1="352" />
        <bustap x2="384" y1="2080" y2="2176" x1="384" />
        <branch name="DI(12)">
            <wire x2="256" y1="2176" y2="3184" x1="256" />
            <wire x2="1344" y1="3184" y2="3184" x1="256" />
        </branch>
        <branch name="DI(11)">
            <wire x2="288" y1="2176" y2="3120" x1="288" />
            <wire x2="1344" y1="3120" y2="3120" x1="288" />
        </branch>
        <branch name="DI(9)">
            <wire x2="352" y1="2176" y2="2992" x1="352" />
            <wire x2="1344" y1="2992" y2="2992" x1="352" />
        </branch>
        <branch name="DI(8)">
            <wire x2="384" y1="2176" y2="2928" x1="384" />
            <wire x2="1344" y1="2928" y2="2928" x1="384" />
        </branch>
        <bustap x2="512" y1="2080" y2="1984" x1="512" />
        <bustap x2="656" y1="2080" y2="2176" x1="656" />
        <bustap x2="448" y1="2080" y2="1984" x1="448" />
        <bustap x2="480" y1="2080" y2="1984" x1="480" />
        <branch name="DI(3)">
            <wire x2="656" y1="2176" y2="2256" x1="656" />
        </branch>
        <branch name="DI(0)">
            <wire x2="384" y1="1328" y2="1408" x1="384" />
            <wire x2="448" y1="1408" y2="1408" x1="384" />
            <wire x2="448" y1="1408" y2="1984" x1="448" />
        </branch>
        <branch name="DI(1)">
            <wire x2="448" y1="1328" y2="1392" x1="448" />
            <wire x2="480" y1="1392" y2="1392" x1="448" />
            <wire x2="480" y1="1392" y2="1984" x1="480" />
        </branch>
        <instance x="480" y="1104" name="XLXI_86" orien="R90" />
        <instance x="416" y="1104" name="XLXI_87" orien="R90" />
        <instance x="352" y="1104" name="XLXI_88" orien="R90" />
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
            <wire x2="768" y1="1408" y2="1408" x1="656" />
            <wire x2="656" y1="1408" y2="1616" x1="656" />
            <wire x2="720" y1="1616" y2="1616" x1="656" />
            <wire x2="192" y1="704" y2="1040" x1="192" />
            <wire x2="384" y1="1040" y2="1040" x1="192" />
            <wire x2="384" y1="1040" y2="1104" x1="384" />
            <wire x2="656" y1="112" y2="272" x1="656" />
            <wire x2="768" y1="272" y2="272" x1="656" />
            <wire x2="656" y1="272" y2="384" x1="656" />
            <wire x2="768" y1="384" y2="384" x1="656" />
            <wire x2="656" y1="384" y2="544" x1="656" />
            <wire x2="768" y1="544" y2="544" x1="656" />
            <wire x2="656" y1="544" y2="704" x1="656" />
            <wire x2="2240" y1="992" y2="992" x1="2176" />
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
            <wire x2="768" y1="1280" y2="1280" x1="624" />
            <wire x2="208" y1="544" y2="1024" x1="208" />
            <wire x2="448" y1="1024" y2="1024" x1="208" />
            <wire x2="448" y1="1024" y2="1104" x1="448" />
            <wire x2="624" y1="112" y2="320" x1="624" />
            <wire x2="768" y1="320" y2="320" x1="624" />
            <wire x2="624" y1="320" y2="544" x1="624" />
            <wire x2="2224" y1="576" y2="576" x1="2176" />
        </branch>
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
            <wire x2="768" y1="1168" y2="1168" x1="592" />
            <wire x2="592" y1="1168" y2="1680" x1="592" />
            <wire x2="720" y1="1680" y2="1680" x1="592" />
            <wire x2="224" y1="384" y2="1008" x1="224" />
            <wire x2="512" y1="1008" y2="1008" x1="224" />
            <wire x2="512" y1="1008" y2="1104" x1="512" />
            <wire x2="592" y1="112" y2="144" x1="592" />
            <wire x2="768" y1="144" y2="144" x1="592" />
            <wire x2="592" y1="144" y2="384" x1="592" />
            <wire x2="2208" y1="272" y2="272" x1="2176" />
        </branch>
        <branch name="DI(2)">
            <wire x2="512" y1="1328" y2="1984" x1="512" />
        </branch>
        <branch name="D7S_D(3:0)">
            <wire x2="144" y1="1472" y2="1504" x1="144" />
        </branch>
        <iomarker fontsize="28" x="144" y="1472" name="D7S_D(3:0)" orien="R270" />
        <branch name="D7S_S(7:0)">
            <wire x2="208" y1="1472" y2="1504" x1="208" />
        </branch>
        <iomarker fontsize="28" x="208" y="1472" name="D7S_S(7:0)" orien="R270" />
        <branch name="Clk_LF">
            <wire x2="336" y1="1888" y2="1936" x1="336" />
        </branch>
        <branch name="C">
            <wire x2="1792" y1="400" y2="400" x1="1696" />
            <wire x2="1696" y1="400" y2="704" x1="1696" />
            <wire x2="1792" y1="704" y2="704" x1="1696" />
            <wire x2="1696" y1="704" y2="1120" x1="1696" />
            <wire x2="1776" y1="1120" y2="1120" x1="1696" />
            <wire x2="1792" y1="1120" y2="1120" x1="1776" />
            <wire x2="1776" y1="848" y2="1120" x1="1776" />
            <wire x2="2960" y1="848" y2="848" x1="1776" />
            <wire x2="4288" y1="848" y2="848" x1="2960" />
            <wire x2="4288" y1="848" y2="1648" x1="4288" />
            <wire x2="2960" y1="736" y2="848" x1="2960" />
            <wire x2="4288" y1="1648" y2="1648" x1="4224" />
        </branch>
        <branch name="RS_RX">
            <wire x2="3840" y1="1776" y2="1776" x1="3744" />
        </branch>
        <instance x="4224" y="1616" name="XLXI_62" orien="R180">
        </instance>
        <branch name="XLXN_231">
            <wire x2="1488" y1="1888" y2="2672" x1="1488" />
            <wire x2="1616" y1="2672" y2="2672" x1="1488" />
            <wire x2="3776" y1="2672" y2="2672" x1="1616" />
            <wire x2="1616" y1="2384" y2="2672" x1="1616" />
            <wire x2="3840" y1="1648" y2="1648" x1="3776" />
            <wire x2="3776" y1="1648" y2="2672" x1="3776" />
        </branch>
        <iomarker fontsize="28" x="3744" y="1776" name="RS_RX" orien="R180" />
        <bustap x2="3536" y1="1248" y2="1248" x1="3632" />
        <bustap x2="3536" y1="1344" y2="1344" x1="3632" />
        <bustap x2="3536" y1="1440" y2="1440" x1="3632" />
        <bustap x2="3536" y1="1536" y2="1536" x1="3632" />
        <bustap x2="3536" y1="1632" y2="1632" x1="3632" />
        <bustap x2="3536" y1="1824" y2="1824" x1="3632" />
        <bustap x2="3536" y1="1920" y2="1920" x1="3632" />
        <bustap x2="3536" y1="1728" y2="1728" x1="3632" />
        <branch name="D(7:0)">
            <wire x2="3632" y1="1184" y2="1248" x1="3632" />
            <wire x2="3632" y1="1248" y2="1344" x1="3632" />
            <wire x2="3632" y1="1344" y2="1440" x1="3632" />
            <wire x2="3632" y1="1440" y2="1536" x1="3632" />
            <wire x2="3632" y1="1536" y2="1632" x1="3632" />
            <wire x2="3632" y1="1632" y2="1712" x1="3632" />
            <wire x2="3808" y1="1712" y2="1712" x1="3632" />
            <wire x2="3840" y1="1712" y2="1712" x1="3808" />
            <wire x2="3808" y1="1712" y2="1728" x1="3808" />
            <wire x2="3632" y1="1728" y2="1824" x1="3632" />
            <wire x2="3632" y1="1824" y2="1920" x1="3632" />
            <wire x2="3632" y1="1920" y2="2432" x1="3632" />
            <wire x2="3808" y1="1728" y2="1728" x1="3632" />
        </branch>
        <branch name="D(3)">
            <attrtext style="alignment:SOFT-TCENTER" attrname="Name" x="2896" y="1632" type="branch" />
            <wire x2="3024" y1="3120" y2="3120" x1="1568" />
            <wire x2="2528" y1="2432" y2="2432" x1="2272" />
            <wire x2="2528" y1="1568" y2="2432" x1="2528" />
            <wire x2="2896" y1="1568" y2="1568" x1="2528" />
            <wire x2="2896" y1="1568" y2="1632" x1="2896" />
            <wire x2="3024" y1="1632" y2="1632" x1="2896" />
            <wire x2="3024" y1="1632" y2="3120" x1="3024" />
            <wire x2="3536" y1="1632" y2="1632" x1="3024" />
            <wire x2="2896" y1="1632" y2="1632" x1="2864" />
        </branch>
        <branch name="DI(15)">
            <wire x2="160" y1="2176" y2="3376" x1="160" />
            <wire x2="1344" y1="3376" y2="3376" x1="160" />
        </branch>
        <branch name="DI(10)">
            <wire x2="320" y1="2176" y2="3056" x1="320" />
            <wire x2="1344" y1="3056" y2="3056" x1="320" />
        </branch>
        <branch name="DI(13)">
            <wire x2="224" y1="2176" y2="3248" x1="224" />
            <wire x2="1344" y1="3248" y2="3248" x1="224" />
        </branch>
        <branch name="DI(14)">
            <wire x2="192" y1="2176" y2="3312" x1="192" />
            <wire x2="1344" y1="3312" y2="3312" x1="192" />
        </branch>
        <instance x="1568" y="2960" name="XLXI_91" orien="R180" />
        <instance x="1568" y="3024" name="XLXI_92" orien="R180" />
        <instance x="1568" y="3088" name="XLXI_93" orien="R180" />
        <instance x="1568" y="3152" name="XLXI_94" orien="R180" />
        <instance x="1568" y="3216" name="XLXI_95" orien="R180" />
        <instance x="1568" y="3280" name="XLXI_96" orien="R180" />
        <instance x="1568" y="3344" name="XLXI_97" orien="R180" />
        <instance x="1568" y="2896" name="XLXI_90" orien="R180" />
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2896" y="1728" type="branch" />
            <wire x2="2992" y1="3056" y2="3056" x1="1568" />
            <wire x2="2896" y1="1728" y2="1728" x1="2864" />
            <wire x2="2992" y1="1728" y2="1728" x1="2896" />
            <wire x2="3536" y1="1728" y2="1728" x1="2992" />
            <wire x2="2992" y1="1728" y2="3056" x1="2992" />
        </branch>
        <branch name="D(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2904" y="1248" type="branch" />
            <wire x2="3152" y1="3376" y2="3376" x1="1568" />
            <wire x2="2904" y1="1248" y2="1248" x1="2864" />
            <wire x2="3152" y1="1248" y2="1248" x1="2904" />
            <wire x2="3536" y1="1248" y2="1248" x1="3152" />
            <wire x2="3152" y1="1248" y2="3376" x1="3152" />
        </branch>
        <branch name="DI(15:0)">
            <wire x2="144" y1="1888" y2="2080" x1="144" />
            <wire x2="160" y1="2080" y2="2080" x1="144" />
            <wire x2="192" y1="2080" y2="2080" x1="160" />
            <wire x2="224" y1="2080" y2="2080" x1="192" />
            <wire x2="256" y1="2080" y2="2080" x1="224" />
            <wire x2="288" y1="2080" y2="2080" x1="256" />
            <wire x2="320" y1="2080" y2="2080" x1="288" />
            <wire x2="352" y1="2080" y2="2080" x1="320" />
            <wire x2="384" y1="2080" y2="2080" x1="352" />
            <wire x2="448" y1="2080" y2="2080" x1="384" />
            <wire x2="480" y1="2080" y2="2080" x1="448" />
            <wire x2="512" y1="2080" y2="2080" x1="480" />
            <wire x2="656" y1="2080" y2="2080" x1="512" />
        </branch>
        <branch name="Blank(3:0)">
            <wire x2="272" y1="1888" y2="1920" x1="272" />
            <wire x2="816" y1="1920" y2="1920" x1="272" />
            <wire x2="864" y1="1920" y2="1920" x1="816" />
            <wire x2="912" y1="1920" y2="1920" x1="864" />
            <wire x2="960" y1="1920" y2="1920" x1="912" />
            <wire x2="1392" y1="1920" y2="1920" x1="960" />
        </branch>
        <iomarker fontsize="28" x="336" y="1936" name="Clk_LF" orien="R90" />
        <bustap x2="864" y1="1920" y2="2016" x1="864" />
        <bustap x2="912" y1="1920" y2="2016" x1="912" />
        <bustap x2="960" y1="1920" y2="2016" x1="960" />
        <branch name="Blank(2)">
            <wire x2="864" y1="2016" y2="2048" x1="864" />
        </branch>
        <branch name="Blank(0)">
            <wire x2="960" y1="2016" y2="2048" x1="960" />
        </branch>
        <branch name="Blank(1)">
            <wire x2="912" y1="2016" y2="2096" x1="912" />
        </branch>
        <instance x="976" y="2096" name="XLXI_100" orien="R180" />
    </sheet>
</drawing>