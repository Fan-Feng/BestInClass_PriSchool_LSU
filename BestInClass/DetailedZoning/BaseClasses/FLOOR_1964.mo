within BestInClass.DetailedZoning.BaseClasses;
model FLOOR_1964
  "Model of a floor of the building with detailed zoning for G36"

  parameter String idfFile=idfFile;
  parameter String weaFile=weaFile;
  parameter String epwFile=epwFile;
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone[:]
    "Nominal mass flowrate of each zone";
  parameter Modelica.Units.SI.MassFlowRate m_flow_sys
    "Nominal mass flowrate of the system";
  parameter Modelica.Units.SI.MassFlowRate mRad_flow_nominal
    "Nominal water mass flowrate of the system";
  parameter Modelica.Units.SI.VolumeFlowRate VPriSysMax_flow=m_flow_sys/1.2
    "Maximum expected system primary airflow rate at design stage";
  parameter Modelica.Units.SI.VolumeFlowRate minZonPriFlo[numZon]={zoneVAV1.conVAVRoo.VDisSetMin_flow,
      zoneVAV2.conVAVRoo.VDisSetMin_flow,zoneVAV3.conVAVRoo.VDisSetMin_flow,
      zoneVAV4.conVAVRoo.VDisSetMin_flow,zoneVAV5.conVAVRoo.VDisSetMin_flow,
      zoneVAV6.conVAVRoo.VDisSetMin_flow,zoneVAV7.conVAVRoo.VDisSetMin_flow,
      zoneVAV8.conVAVRoo.VDisSetMin_flow,zoneVAV9.conVAVRoo.VDisSetMin_flow,
      zoneVAV10.conVAVRoo.VDisSetMin_flow,zoneVAV11.conVAVRoo.VDisSetMin_flow,
      zoneVAV12.conVAVRoo.VDisSetMin_flow,zoneVAV13.conVAVRoo.VDisSetMin_flow,
      zoneVAV14.conVAVRoo.VDisSetMin_flow,zoneVAV15.conVAVRoo.VDisSetMin_flow,
      zoneVAV16.conVAVRoo.VDisSetMin_flow,zoneVAV17.conVAVRoo.VDisSetMin_flow,
      zoneVAV18.conVAVRoo.VDisSetMin_flow,zoneVAV19.conVAVRoo.VDisSetMin_flow,
      zoneVAV20.conVAVRoo.VDisSetMin_flow,zoneVAV21.conVAVRoo.VDisSetMin_flow}
    "Minimum expected zone primary flow rate";
  parameter Integer numZon = 21 "Number of zones";

  parameter Modelica.Units.SI.VolumeFlowRate VDisSetMin_flow[numZon];

  parameter Modelica.Units.SI.Volume Vzone1=99.26;
  parameter Modelica.Units.SI.Volume Vzone2=88.4;
  parameter Modelica.Units.SI.Volume Vzone3=88.4;
  parameter Modelica.Units.SI.Volume Vzone4=36.33;
  parameter Modelica.Units.SI.Volume Vzone5=118.25;
  parameter Modelica.Units.SI.Volume Vzone6= 118.25;
  parameter Modelica.Units.SI.Volume Vzone7=204.21;
  parameter Modelica.Units.SI.Volume Vzone8= 204.21;
  parameter Modelica.Units.SI.Volume Vzone9=62.94;
  parameter Modelica.Units.SI.Volume Vzone10=345.09;
  parameter Modelica.Units.SI.Volume Vzone11=345.09;
  parameter Modelica.Units.SI.Volume Vzone12=115.56;
  parameter Modelica.Units.SI.Volume Vzone13=168.51;
  parameter Modelica.Units.SI.Volume Vzone14=136.63;
  parameter Modelica.Units.SI.Volume Vzone15=483.66;
  parameter Modelica.Units.SI.Volume Vzone16=494.9;
  parameter Modelica.Units.SI.Volume Vzone17=532.47;
  parameter Modelica.Units.SI.Volume Vzone18=581.35;
  parameter Modelica.Units.SI.Volume Vzone19=163.79;
  parameter Modelica.Units.SI.Volume Vzone20=84.23;
  parameter Modelica.Units.SI.Volume Vzone21=84.23;

  parameter Modelica.Units.SI.MassFlowRate m_flow_zone1=m_flow_zone[1];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone2=m_flow_zone[2];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone3=m_flow_zone[3];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone4=m_flow_zone[4];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone5=m_flow_zone[5];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone6=m_flow_zone[6];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone7=m_flow_zone[7];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone8=m_flow_zone[8];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone9=m_flow_zone[9];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone10=m_flow_zone[10];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone11=m_flow_zone[11];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone12=m_flow_zone[12];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone13=m_flow_zone[13];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone14=m_flow_zone[14];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone15=m_flow_zone[15];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone16=m_flow_zone[16];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone17=m_flow_zone[17];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone18=m_flow_zone[18];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone19=m_flow_zone[19];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone20=m_flow_zone[20];
  parameter Modelica.Units.SI.MassFlowRate m_flow_zone21=m_flow_zone[21];

  parameter Modelica.Units.SI.Area Azone1=36.19;
  parameter Modelica.Units.SI.Area Azone2=32.22;
  parameter Modelica.Units.SI.Area Azone3=32.22;
  parameter Modelica.Units.SI.Area Azone4=13.24;
  parameter Modelica.Units.SI.Area Azone5=43.11;
  parameter Modelica.Units.SI.Area Azone6=43.11;
  parameter Modelica.Units.SI.Area Azone7=74.44;
  parameter Modelica.Units.SI.Area Azone8=74.44;
  parameter Modelica.Units.SI.Area Azone9=22.94;
  parameter Modelica.Units.SI.Area Azone10=125.8;
  parameter Modelica.Units.SI.Area Azone11=125.8;
  parameter Modelica.Units.SI.Area Azone12=42.13;
  parameter Modelica.Units.SI.Area Azone13=61.43;
  parameter Modelica.Units.SI.Area Azone14=49.81;
  parameter Modelica.Units.SI.Area Azone15=176.31;
  parameter Modelica.Units.SI.Area Azone16=180.41;
  parameter Modelica.Units.SI.Area Azone17=194.1;
  parameter Modelica.Units.SI.Area Azone18=211.92;
  parameter Modelica.Units.SI.Area Azone19=59.71;
  parameter Modelica.Units.SI.Area Azone20=30.71;
  parameter Modelica.Units.SI.Area Azone21=30.71;

  parameter Modelica.Units.SI.Area AFlo[numZon]={Azone1,Azone2,Azone3,Azone4,
      Azone5,Azone6,Azone7,Azone8,Azone9,Azone10,Azone11,Azone12,Azone13,
      Azone14,Azone15,Azone16,Azone17,Azone18,Azone19,Azone20,Azone21}
    "Floor area of each zone";

  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone1=m_flow_sys -
      m_flow_zone1;
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone2=m_flow_sys - (
      m_flow_zone1 + m_flow_zone2);
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone3=m_flow_sys - (
      m_flow_zone1 + m_flow_zone2 + m_flow_zone3);
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone4=m_flow_sys - (
      m_flow_zone1 + m_flow_zone2 + m_flow_zone3 + m_flow_zone4);
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone5=m_flow_sys - (
      m_flow_zone1 + m_flow_zone2 + m_flow_zone3 + m_flow_zone4 + m_flow_zone5);
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone6=m_flow_sys - (
      m_flow_zone1 + m_flow_zone2 + m_flow_zone3 + m_flow_zone4 + m_flow_zone5 +
      m_flow_zone6);
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone7=m_flow_sys - (
      m_flow_zone1 + m_flow_zone2 + m_flow_zone3 + m_flow_zone4 + m_flow_zone5 +
      m_flow_zone6 + m_flow_zone7);
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone8=m_flow_sys - (
      m_flow_zone1 + m_flow_zone2 + m_flow_zone3 + m_flow_zone4 + m_flow_zone5 +
      m_flow_zone6 + m_flow_zone7 + m_flow_zone8);
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone9=m_flow_sys - (
      m_flow_zone1 + m_flow_zone2 + m_flow_zone3 + m_flow_zone4 + m_flow_zone5 +
      m_flow_zone6 + m_flow_zone7 + m_flow_zone8 + m_flow_zone9);
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone10=m_flow_sys - (
      m_flow_zone1 + m_flow_zone2 + m_flow_zone3 + m_flow_zone4 + m_flow_zone5 +
      m_flow_zone6 + m_flow_zone7 + m_flow_zone8 + m_flow_zone9 + m_flow_zone10);
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone11=m_flow_zone12 +
      m_flow_zone13 + m_flow_zone14 + m_flow_zone15  +
      m_flow_zone16 + m_flow_zone17 + m_flow_zone18 + m_flow_zone19 +
      m_flow_zone20 + m_flow_zone21;
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone12=m_flow_zone13 +
      m_flow_zone14 + m_flow_zone15 + m_flow_zone16 +
      m_flow_zone17 + m_flow_zone18 + m_flow_zone19 + m_flow_zone20 +
      m_flow_zone21;
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone13=m_flow_zone14 +
      m_flow_zone15 + m_flow_zone16 + m_flow_zone17 +
      m_flow_zone18 + m_flow_zone19 + m_flow_zone20 + m_flow_zone21;
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone14=m_flow_zone15 +
      m_flow_zone16 + m_flow_zone17 + m_flow_zone18 +
      m_flow_zone19 + m_flow_zone20 + m_flow_zone21;
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone15=
      m_flow_zone16 + m_flow_zone17 + m_flow_zone18 + m_flow_zone19 +
      m_flow_zone20 + m_flow_zone21;
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone16=
      m_flow_zone17 + m_flow_zone18 + m_flow_zone19 + m_flow_zone20 +
      m_flow_zone21;
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone17=m_flow_zone18 +
      m_flow_zone19 + m_flow_zone20 + m_flow_zone21;
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone18=m_flow_zone19 +
      m_flow_zone20 + m_flow_zone21;
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone19=m_flow_zone20 +
      m_flow_zone21;
  parameter Modelica.Units.SI.MassFlowRate mSpl_flow_zone20=m_flow_zone21;

  package MediumA = Buildings.Media.Air "Medium air";
  package MediumW = Buildings.Media.Water "Medium model";
  parameter Boolean allowFlowReversal = true
    "= false to simplify equations, assuming, but not enforcing, no flow reversal";
                                             //true
  parameter Boolean sampleModel = false
    "Set to true to time-sample the model, which can give shorter simulation time if there is already time sampling in the system model"
    annotation (
      Evaluate=true,
      Dialog(tab="Experimental (may be changed in future releases)"));

  Modelica.Blocks.Interfaces.RealInput TRooHeaSet(unit="K",displayUnit="degC")
    "Room heating setpoint" annotation (Placement(transformation(extent={{-412,24},
            {-380,56}}),     iconTransformation(extent={{-120,20},{-100,40}})));
  Modelica.Blocks.Interfaces.RealInput TRooCooSet(unit="K",displayUnit="degC")
    "Room cooling setpoint" annotation (Placement(transformation(extent={{-412,-36},
            {-380,-4}}),      iconTransformation(extent={{-120,-10},{-100,10}})));
   inner Buildings.ThermalZones.EnergyPlus_9_6_0.Building building(
   idfName=Modelica.Utilities.Files.loadResource(idfFile),
   epwName=Modelica.Utilities.Files.loadResource(epwFile),
   weaName=Modelica.Utilities.Files.loadResource(weaFile))
     annotation (Placement(transformation(extent={{-320,70},{-300,90}})));

//       inner Buildings.ThermalZones.EnergyPlus_9_6_0.Building building(
//     idfName=Modelica.Utilities.Files.loadResource(
//       "modelica://BestInClass/Resources/idf/MediumOfficeDetailed_2004_la.idf"),
//     weaName=Modelica.Utilities.Files.loadResource(
//       "modelica://BestInClass/Resources/weather/USA_CA_Los.Angeles.Intl.AP.722950_TMY3.mos"),
//     epwName=Modelica.Utilities.Files.loadResource(
//       "modelica://BestInClass/Resources/weather/USA_CA_Los.Angeles.Intl.AP.722950_TMY3.epw"))
//     annotation (Placement(transformation(extent={{-320,70},{-300,90}})));


  ZoneVAV_1964WithValve zoneVAV1(
    zoneName="ActiveStorage_Top_1 ZN",
    mSpl_flow_nominal=mSpl_flow_zone1,
    mRoo_flow_nominal=m_flow_zone1,
    VDisSetMin_flow=VDisSetMin_flow[1],
    VRoo=Vzone1,
    AFlo=Azone1,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{-340,0},{-320,20}})));
  ZoneVAV_1964WithValve zoneVAV2(
    zoneName="ActiveStorage_Top_2 ZN",
    mSpl_flow_nominal=mSpl_flow_zone2,
    mRoo_flow_nominal=m_flow_zone2,
    VDisSetMin_flow=VDisSetMin_flow[2],
    VRoo=Vzone2,
    AFlo=Azone2,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{-300,0},{-280,20}})));

  ZoneVAV_1964WithValve zoneVAV3(
    zoneName="ActiveStorage_Top_3 ZN",
    mSpl_flow_nominal=mSpl_flow_zone3,
    mRoo_flow_nominal=m_flow_zone3,
    VDisSetMin_flow=VDisSetMin_flow[3],
    VRoo=Vzone3,
    AFlo=Azone3,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{-260,0},{-240,20}})));

  ZoneVAV_1964WithValve zoneVAV4(
    zoneName="ActiveStorage_Top_4 ZN",
    mSpl_flow_nominal=mSpl_flow_zone4,
    mRoo_flow_nominal=m_flow_zone4,
    VDisSetMin_flow=VDisSetMin_flow[4],
    VRoo=Vzone4,
    AFlo=Azone4,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{-220,0},{-200,20}})));

  ZoneVAV_1964WithValve zoneVAV5(
    zoneName="ConfRoom_Top_1 ZN",
    mRoo_flow_nominal=m_flow_zone5,
    mSpl_flow_nominal=mSpl_flow_zone5,
    VDisSetMin_flow=VDisSetMin_flow[5],
    VRoo=Vzone5,
    AFlo=Azone5,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{-180,0},{-160,20}})));

  ZoneVAV_1964WithValve zoneVAV6(
    zoneName="ConfRoom_Top_2 ZN",
    mRoo_flow_nominal=m_flow_zone6,
    mSpl_flow_nominal=mSpl_flow_zone6,
    VDisSetMin_flow=VDisSetMin_flow[6],
    VRoo=Vzone6,
    AFlo=Azone6,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{-140,0},{-120,20}})));

  ZoneVAV_1964WithValve zoneVAV7(
    zoneName="Corridor_Top_1 ZN",
    mRoo_flow_nominal=m_flow_zone7,
    mSpl_flow_nominal=mSpl_flow_zone7,
    VDisSetMin_flow=VDisSetMin_flow[7],
    VRoo=Vzone7,
    AFlo=Azone7,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));

  ZoneVAV_1964WithValve zoneVAV8(
    zoneName="Corridor_Top_2 ZN",
    mRoo_flow_nominal=m_flow_zone8,
    mSpl_flow_nominal=mSpl_flow_zone8,
    VDisSetMin_flow=VDisSetMin_flow[8],
    VRoo=Vzone8,
    AFlo=Azone8,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));

  ZoneVAV_1964WithValve zoneVAV9(
    zoneName="Dining_Top ZN",
    mRoo_flow_nominal=m_flow_zone9,
    mSpl_flow_nominal=mSpl_flow_zone9,
    VDisSetMin_flow=VDisSetMin_flow[9],
    VRoo=Vzone9,
    AFlo=Azone9,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));

  ZoneVAV_1964WithValve zoneVAV10(
    zoneName="EnclosedOffice_Top_1 ZN",
    mRoo_flow_nominal=m_flow_zone10,
    mSpl_flow_nominal=mSpl_flow_zone10,
    VDisSetMin_flow=VDisSetMin_flow[10],
    VRoo=Vzone10,
    AFlo=Azone10,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{20,0},{40,20}})));

  ZoneVAV_1964WithValve zoneVAV11(
    zoneName="EnclosedOffice_Top_2 ZN",
    mRoo_flow_nominal=m_flow_zone11,
    mSpl_flow_nominal=mSpl_flow_zone11,
    VDisSetMin_flow=VDisSetMin_flow[11],
    VRoo=Vzone11,
    AFlo=Azone11,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{60,0},{80,20}})));

  ZoneVAV_1964WithValve zoneVAV12(
    zoneName="EnclosedOffice_Top_3 ZN",
    mRoo_flow_nominal=m_flow_zone12,
    mSpl_flow_nominal=mSpl_flow_zone12,
    VDisSetMin_flow=VDisSetMin_flow[12],
    VRoo=Vzone12,
    AFlo=Azone12,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{100,0},{120,20}})));

  ZoneVAV_1964WithValve zoneVAV13(
    zoneName="Lobby_Top ZN",
    mRoo_flow_nominal=m_flow_zone13,
    mSpl_flow_nominal=mSpl_flow_zone13,
    VDisSetMin_flow=VDisSetMin_flow[13],
    VRoo=Vzone13,
    AFlo=Azone13,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{140,0},{160,20}})));

  ZoneVAV_1964WithValve_14 zoneVAV14(
    zoneName="Mechanical_Top ZN",
    mRoo_flow_nominal=m_flow_zone14,
    mSpl_flow_nominal=mSpl_flow_zone14,
    VDisSetMin_flow=VDisSetMin_flow[14],
    VRoo=Vzone14,
    AFlo=Azone14,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{180,0},{200,20}})));

  ZoneVAV_1964WithValve zoneVAV15(
    zoneName="OpenOffice_Top_1 ZN",
    mRoo_flow_nominal=m_flow_zone15,
    mSpl_flow_nominal=mSpl_flow_zone15,
    VDisSetMin_flow=VDisSetMin_flow[15],
    VRoo=Vzone15,
    AFlo=Azone15,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{220,0},{240,20}})));

  ZoneVAV_1964WithValve zoneVAV16(
    zoneName="OpenOffice_Top_2 ZN",
    mRoo_flow_nominal=m_flow_zone16,
    mSpl_flow_nominal=mSpl_flow_zone16,
    VDisSetMin_flow=VDisSetMin_flow[16],
    VRoo=Vzone16,
    AFlo=Azone16,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{260,0},{280,20}})));

  ZoneVAV_1964WithValve zoneVAV17(
    zoneName="OpenOffice_Top_3 ZN",
    mRoo_flow_nominal=m_flow_zone17,
    mSpl_flow_nominal=mSpl_flow_zone17,
    VDisSetMin_flow=VDisSetMin_flow[17],
    VRoo=Vzone17,
    AFlo=Azone17,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{300,0},{320,20}})));

  ZoneVAV_1964WithValve zoneVAV18(
    zoneName="OpenOffice_Top_4 ZN",
    mRoo_flow_nominal=m_flow_zone18,
    mSpl_flow_nominal=mSpl_flow_zone18,
    VDisSetMin_flow=VDisSetMin_flow[18],
    VRoo=Vzone18,
    AFlo=Azone18,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{340,0},{360,20}})));

  ZoneVAV_1964WithValve zoneVAV19(
    zoneName="Restroom_Top ZN",
    mRoo_flow_nominal=m_flow_zone19,
    mSpl_flow_nominal=mSpl_flow_zone19,
    VDisSetMin_flow=VDisSetMin_flow[19],
    VRoo=Vzone19,
    AFlo=Azone19,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{380,0},{400,20}})));

  ZoneVAV_1964WithValve zoneVAV20(
    zoneName="Stair_Top_1 ZN",
    mRoo_flow_nominal=m_flow_zone20,
    mSpl_flow_nominal=mSpl_flow_zone20,
    VDisSetMin_flow=VDisSetMin_flow[20],
    VRoo=Vzone20,
    AFlo=Azone20,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{420,0},{440,20}})));

  ZoneVAVLast_1964WithValve zoneVAV21(
    zoneName="Stair_Top_2 ZN",
    mRoo_flow_nominal=m_flow_zone21,
    VDisSetMin_flow=VDisSetMin_flow[21],
    VRoo=Vzone21,
    AFlo=Azone21,
    allowFlowReversal=allowFlowReversal)
    annotation (Placement(transformation(extent={{460,0},{480,20}})));

  Modelica.Blocks.Interfaces.RealInput TSupAHU "Supply air temperature"
    annotation (Placement(transformation(extent={{-412,-64},{-380,-32}}),
        iconTransformation(extent={{-120,-40},{-100,-20}})));
  Buildings.Controls.OBC.CDL.Interfaces.IntegerInput uOpeMod
    "Zone operation mode"
    annotation (Placement(transformation(extent={{-412,-96},{-380,-64}}),
        iconTransformation(extent={{-140,-80},{-100,-40}})));
  Buildings.Controls.OBC.CDL.Interfaces.IntegerOutput yZonTemResReq[numZon]
    "Zone cooling supply air temperature reset request"
    annotation (Placement(transformation(extent={{540,-86},{560,-66}}),
        iconTransformation(extent={{100,-46},{140,-6}})));
  Buildings.Controls.OBC.CDL.Interfaces.IntegerOutput yZonPreResReq[numZon]
    "Zone static pressure reset requests"
    annotation (Placement(transformation(extent={{540,-130},{560,-110}}),
        iconTransformation(extent={{100,-70},{140,-30}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir[numZon] "Zone air temperature"
    annotation (Placement(transformation(extent={{540,70},{560,90}}),
        iconTransformation(extent={{100,40},{120,60}})));
  Modelica.Blocks.Interfaces.RealOutput VDis[numZon] "Discharge air flow"
    annotation (Placement(transformation(extent={{540,8},{560,28}}),
        iconTransformation(extent={{100,14},{120,34}})));
  Modelica.Blocks.Interfaces.RealOutput TDis[numZon] "Discharge air temperature"
    annotation (Placement(transformation(extent={{540,-46},{560,-26}}),
        iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput qGaiFlo[3,21](unit="W/m2")
    "Internal heat gains" annotation (Placement(transformation(extent={{-412,44},
            {-380,76}}), iconTransformation(extent={{-120,50},{-100,70}})));
  Buildings.Fluid.FixedResistances.Junction splVal1(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone1 + mSpl_flow_zone1,-
        mSpl_flow_zone1,-m_flow_zone1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-320,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal2(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone2 + mSpl_flow_zone2,-
        mSpl_flow_zone2,-m_flow_zone2},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-290,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal3(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone3 + mSpl_flow_zone3,-
        mSpl_flow_zone3,-m_flow_zone3},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-246,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal4(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone4 + mSpl_flow_zone4,-
        mSpl_flow_zone4,-m_flow_zone4},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-202,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal5(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone5 + mSpl_flow_zone5,-
        mSpl_flow_zone5,-m_flow_zone5},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-162,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal6(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone6 + mSpl_flow_zone6,-
        mSpl_flow_zone6,-m_flow_zone6},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-130,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal7(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone7 + mSpl_flow_zone7,-
        mSpl_flow_zone7,-m_flow_zone7},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-92,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal8(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone8 + mSpl_flow_zone8,-
        mSpl_flow_zone8,-m_flow_zone8},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-46,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal9(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone9 + mSpl_flow_zone9,-
        mSpl_flow_zone9,-m_flow_zone9},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-8,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal10(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone10 + mSpl_flow_zone10,
        -mSpl_flow_zone10,-m_flow_zone10},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={34,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal11(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone11 + mSpl_flow_zone11,
        -mSpl_flow_zone11,-m_flow_zone11},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={72,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal12(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone12 + mSpl_flow_zone12,
        -mSpl_flow_zone12,-m_flow_zone12},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={122,-158})));
  Buildings.Fluid.FixedResistances.Junction splVal13(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone13 + mSpl_flow_zone13,
        -mSpl_flow_zone13,-m_flow_zone13},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={158,-158})));
  Buildings.Fluid.FixedResistances.Junction splVal14(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone14 + mSpl_flow_zone14,
        -mSpl_flow_zone14,-m_flow_zone14},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={194,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal15(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone15 + mSpl_flow_zone15,
        -mSpl_flow_zone15,-m_flow_zone15},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={232,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal16(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone16 + mSpl_flow_zone16,
        -mSpl_flow_zone16,-m_flow_zone16},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={274,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal17(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone17 + mSpl_flow_zone17,
        -mSpl_flow_zone17,-m_flow_zone17},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={314,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal18(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone18 + mSpl_flow_zone18,
        -mSpl_flow_zone18,-m_flow_zone18},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={352,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal19(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone19 + mSpl_flow_zone19,
        -mSpl_flow_zone19,-m_flow_zone19},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={394,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal20(
    m_flow_nominal=1006*(16.7 - 8.5)/4200/10*{m_flow_zone20 + m_flow_zone21,-
        m_flow_zone21,-m_flow_zone20},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={434,-160})));
  Buildings.Fluid.FixedResistances.Junction splVal23(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-296,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal24(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-252,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal25(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-216,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal26(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-176,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal27(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-136,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal28(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-96,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal29(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-58,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal30(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={-14,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal31(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={22,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal32(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={66,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal33(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={108,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal34(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={146,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal35(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={188,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal36(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={226,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal37(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={268,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal38(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={304,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal39(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={342,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal40(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={386,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal41(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={424,-190})));
  Buildings.Fluid.FixedResistances.Junction splVal42(
    m_flow_nominal=mRad_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={462,-190})));
  Modelica.Blocks.Interfaces.RealOutput mass_flow_rate[numZon] "mass_flow_rate"
    annotation (Placement(transformation(extent={{540,-162},{560,-142}}),
        iconTransformation(extent={{100,80},{120,100}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a
    annotation (Placement(transformation(extent={{-390,-170},{-370,-150}}),
    iconTransformation(extent={{60,-120},{80,-100}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b
    annotation (Placement(transformation(extent={{530,-200},{550,-180}}),
    iconTransformation(extent={{-80,-120},{-60,-100}})));
  Modelica.Fluid.Interfaces.FluidPort_a supplyAir(redeclare final package
      Medium = MediumA) "Supply air"
    annotation (Placement(transformation(extent={{-390,70},{-370,90}}),
        iconTransformation(extent={{-110,70},{-90,90}})));
  Modelica.Fluid.Interfaces.FluidPort_b returnAir( redeclare final package
      Medium = MediumA) "Return air"
    annotation (Placement(transformation(extent={{-390,-130},{-370,-110}}),
        iconTransformation(extent={{-110,-92},{-90,-72}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate
    annotation (Placement(transformation(extent={{-364,-170},{-344,-150}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate5
    annotation (Placement(transformation(extent={{448,-170},{468,-150}})));
equation

  connect(TRooHeaSet, zoneVAV1.TRooHeaSet) annotation (Line(
      points={{-396,40},{-362,40},{-362,15},{-341,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(TRooCooSet, zoneVAV1.TRooCooSet) annotation (Line(
      points={{-396,-20},{-368,-20},{-368,12},{-341,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{-396,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV3.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{-261,15},{-268,15},{-268,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV4.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{-221,15},{-226,15},{-226,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV5.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{-181,15},{-186,15},{-186,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV6.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{-141,15},{-144,15},{-144,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV7.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{-101,15},{-106,15},{-106,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV8.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{-61,15},{-68,15},{-68,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV9.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{-21,15},{-26,15},{-26,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV10.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{19,15},{16,15},{16,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV11.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{59,15},{50,15},{50,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV12.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{99,15},{92,15},{92,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV13.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{139,15},{132,15},{132,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV14.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{179,15},{172,15},{172,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV15.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{219,15},{214,15},{214,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV16.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{259,15},{252,15},{252,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV17.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{299,15},{294,15},{294,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV18.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{339,15},{334,15},{334,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV19.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{379,15},{374,15},{374,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV20.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{419,15},{412,15},{412,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV21.TRooHeaSet, zoneVAV2.TRooHeaSet) annotation (Line(
      points={{459,15},{452,15},{452,40},{-308,40},{-308,15},{-301,15}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(TRooCooSet, zoneVAV2.TRooCooSet) annotation (Line(
      points={{-396,-20},{-310,-20},{-310,12},{-301,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(TRooCooSet, zoneVAV3.TRooCooSet) annotation (Line(
      points={{-396,-20},{-272,-20},{-272,12},{-261,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(points={{-396,-20},
          {450,-20},{450,12},{459,12}}, color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV4.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{-221,12},{-228,12},{-228,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV5.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{-181,12},{-188,12},{-188,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV6.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{-141,12},{-148,12},{-148,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV7.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{-101,12},{-108,12},{-108,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV8.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{-61,12},{-68,12},{-68,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV9.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{-21,12},{-28,12},{-28,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV10.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{19,12},{12,12},{12,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV11.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{59,12},{52,12},{52,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV12.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{99,12},{86,12},{86,-22},{444,-22},{444,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV13.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{139,12},{132,12},{132,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV14.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{179,12},{172,12},{172,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV15.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{219,12},{212,12},{212,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV16.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{259,12},{252,12},{252,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV17.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{299,12},{292,12},{292,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV18.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{339,12},{332,12},{332,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV19.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{379,12},{372,12},{372,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV20.TRooCooSet, zoneVAV21.TRooCooSet) annotation (Line(
      points={{419,12},{412,12},{412,-20},{450,-20},{450,12},{459,12}},
      color={0,0,127},
      pattern=LinePattern.Dot));

  connect(zoneVAV1.returnAir1, zoneVAV2.supplyAir1)
    annotation (Line(points={{-320,18},{-300,18}}, color={0,127,255}));
  connect(zoneVAV1.supplyAir, zoneVAV2.returnAir)
    annotation (Line(points={{-320,2},{-300,2}}, color={0,127,255}));
  connect(zoneVAV2.returnAir1, zoneVAV3.supplyAir1)
    annotation (Line(points={{-280,18},{-260,18}}, color={0,127,255}));
  connect(zoneVAV2.supplyAir, zoneVAV3.returnAir)
    annotation (Line(points={{-280,2},{-260,2}}, color={0,127,255}));
  connect(zoneVAV3.returnAir1, zoneVAV4.supplyAir1)
    annotation (Line(points={{-240,18},{-220,18}}, color={0,127,255}));
  connect(zoneVAV3.supplyAir, zoneVAV4.returnAir)
    annotation (Line(points={{-240,2},{-220,2}}, color={0,127,255}));
  connect(zoneVAV4.returnAir1, zoneVAV5.supplyAir1)
    annotation (Line(points={{-200,18},{-180,18}}, color={0,127,255}));
  connect(zoneVAV4.supplyAir, zoneVAV5.returnAir)
    annotation (Line(points={{-200,2},{-180,2}}, color={0,127,255}));
  connect(zoneVAV5.returnAir1, zoneVAV6.supplyAir1)
    annotation (Line(points={{-160,18},{-140,18}}, color={0,127,255}));
  connect(zoneVAV5.supplyAir, zoneVAV6.returnAir)
    annotation (Line(points={{-160,2},{-140,2}}, color={0,127,255}));
  connect(zoneVAV6.returnAir1, zoneVAV7.supplyAir1)
    annotation (Line(points={{-120,18},{-100,18}}, color={0,127,255}));
  connect(zoneVAV6.supplyAir, zoneVAV7.returnAir)
    annotation (Line(points={{-120,2},{-100,2}}, color={0,127,255}));
  connect(zoneVAV7.returnAir1, zoneVAV8.supplyAir1)
    annotation (Line(points={{-80,18},{-60,18}}, color={0,127,255}));
  connect(zoneVAV7.supplyAir, zoneVAV8.returnAir)
    annotation (Line(points={{-80,2},{-60,2}}, color={0,127,255}));
  connect(zoneVAV8.returnAir1, zoneVAV9.supplyAir1)
    annotation (Line(points={{-40,18},{-20,18}}, color={0,127,255}));
  connect(zoneVAV8.supplyAir, zoneVAV9.returnAir)
    annotation (Line(points={{-40,2},{-20,2}}, color={0,127,255}));
  connect(zoneVAV9.returnAir1, zoneVAV10.supplyAir1)
    annotation (Line(points={{0,18},{20,18}}, color={0,127,255}));
  connect(zoneVAV9.supplyAir, zoneVAV10.returnAir)
    annotation (Line(points={{0,2},{20,2}}, color={0,127,255}));
  connect(zoneVAV10.returnAir1, zoneVAV11.supplyAir1)
    annotation (Line(points={{40,18},{60,18}}, color={0,127,255}));
  connect(zoneVAV10.supplyAir, zoneVAV11.returnAir)
    annotation (Line(points={{40,2},{60,2}}, color={0,127,255}));
  connect(zoneVAV11.returnAir1, zoneVAV12.supplyAir1)
    annotation (Line(points={{80,18},{100,18}}, color={0,127,255}));
  connect(zoneVAV11.supplyAir, zoneVAV12.returnAir)
    annotation (Line(points={{80,2},{100,2}}, color={0,127,255}));
  connect(zoneVAV12.returnAir1, zoneVAV13.supplyAir1)
    annotation (Line(points={{120,18},{140,18}}, color={0,127,255}));
  connect(zoneVAV12.supplyAir, zoneVAV13.returnAir)
    annotation (Line(points={{120,2},{140,2}}, color={0,127,255}));
  connect(zoneVAV13.returnAir1, zoneVAV14.supplyAir1)
    annotation (Line(points={{160,18},{180,18}}, color={0,127,255}));
  connect(zoneVAV13.supplyAir, zoneVAV14.returnAir)
    annotation (Line(points={{160,2},{180,2}}, color={0,127,255}));
  connect(zoneVAV14.returnAir1, zoneVAV15.supplyAir1)
    annotation (Line(points={{200,18},{220,18}}, color={0,127,255}));
  connect(zoneVAV14.supplyAir, zoneVAV15.returnAir)
    annotation (Line(points={{200,2},{220,2}}, color={0,127,255}));
  connect(zoneVAV15.returnAir1, zoneVAV16.supplyAir1)
    annotation (Line(points={{240,18},{260,18}}, color={0,127,255}));
  connect(zoneVAV15.supplyAir, zoneVAV16.returnAir)
    annotation (Line(points={{240,2},{260,2}}, color={0,127,255}));
  connect(zoneVAV16.returnAir1, zoneVAV17.supplyAir1)
    annotation (Line(points={{280,18},{300,18}}, color={0,127,255}));
  connect(zoneVAV16.supplyAir, zoneVAV17.returnAir)
    annotation (Line(points={{280,2},{300,2}}, color={0,127,255}));
  connect(zoneVAV17.returnAir1, zoneVAV18.supplyAir1)
    annotation (Line(points={{320,18},{340,18}}, color={0,127,255}));
  connect(zoneVAV17.supplyAir, zoneVAV18.returnAir)
    annotation (Line(points={{320,2},{340,2}}, color={0,127,255}));
  connect(zoneVAV18.returnAir1, zoneVAV19.supplyAir1)
    annotation (Line(points={{360,18},{380,18}}, color={0,127,255}));
  connect(zoneVAV18.supplyAir, zoneVAV19.returnAir)
    annotation (Line(points={{360,2},{380,2}}, color={0,127,255}));
  connect(zoneVAV19.returnAir1, zoneVAV20.supplyAir1)
    annotation (Line(points={{400,18},{420,18}}, color={0,127,255}));
  connect(zoneVAV19.supplyAir, zoneVAV20.returnAir)
    annotation (Line(points={{400,2},{420,2}}, color={0,127,255}));
  connect(zoneVAV20.returnAir1, zoneVAV21.supplyAir1)
    annotation (Line(points={{440,18},{460,18}}, color={0,127,255}));
  connect(zoneVAV20.supplyAir, zoneVAV21.returnAir)
    annotation (Line(points={{440,2},{460,2}}, color={0,127,255}));
  connect(TSupAHU, zoneVAV1.TSupAHU) annotation (Line(points={{-396,-48},{-360,-48},
          {-360,8},{-341,8}}, color={0,0,127}));
  connect(TSupAHU, zoneVAV2.TSupAHU) annotation (Line(
      points={{-396,-48},{-306,-48},{-306,8},{-301,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{-396,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV3.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{-261,8},{-266,8},{-266,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV4.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{-221,8},{-226,8},{-226,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV5.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{-181,8},{-186,8},{-186,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV6.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{-141,8},{-146,8},{-146,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV7.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{-101,8},{-106,8},{-106,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV8.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{-61,8},{-66,8},{-66,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV9.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{-21,8},{98,8},{98,34},{578,34},{578,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV10.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{19,8},{14,8},{14,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV11.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{59,8},{54,8},{54,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV12.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{99,8},{94,8},{94,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV13.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{139,8},{134,8},{134,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV14.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{179,8},{174,8},{174,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV15.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{219,8},{214,8},{214,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV16.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{259,8},{254,8},{254,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV17.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{299,8},{294,8},{294,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV18.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{339,8},{334,8},{334,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV19.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{379,8},{374,8},{374,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(zoneVAV20.TSupAHU, zoneVAV21.TSupAHU) annotation (Line(
      points={{419,8},{414,8},{414,-48},{454,-48},{454,8},{459,8}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{-396,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV20.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{418,5},{416,5},{416,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV19.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{378,5},{376,5},{376,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV18.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{338,5},{336,5},{336,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV17.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{298,5},{296,5},{296,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV16.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{258,5},{256,5},{256,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV15.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{218,5},{216,5},{216,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV14.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{178,5},{176,5},{176,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV13.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{138,5},{136,5},{136,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV12.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{98,5},{96,5},{96,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV11.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{58,5},{56,5},{56,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV10.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{18,5},{16,5},{16,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV9.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{-22,5},{-24,5},{-24,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV8.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{-62,5},{-64,5},{-64,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV7.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{-102,5},{-104,5},{-104,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV6.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{-142,5},{-144,5},{-144,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV5.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{-182,5},{-184,5},{-184,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV4.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{-222,5},{-224,5},{-224,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV3.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{-262,5},{-264,5},{-264,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV2.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{-302,5},{-304,5},{-304,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV1.uOpeMod, zoneVAV21.uOpeMod) annotation (Line(
      points={{-342,5},{-346,5},{-346,-80},{456,-80},{456,5},{458,5}},
      color={255,127,0},
      pattern=LinePattern.Dot));
  connect(zoneVAV1.TRooAir, TRooAir[1]);
  connect(zoneVAV2.TRooAir, TRooAir[2]);
  connect(zoneVAV3.TRooAir, TRooAir[3]);
  connect(zoneVAV4.TRooAir, TRooAir[4]);
  connect(zoneVAV5.TRooAir, TRooAir[5]);
  connect(zoneVAV6.TRooAir, TRooAir[6]);
  connect(zoneVAV7.TRooAir, TRooAir[7]);
  connect(zoneVAV8.TRooAir, TRooAir[8]);
  connect(zoneVAV9.TRooAir, TRooAir[9]);
  connect(zoneVAV10.TRooAir, TRooAir[10]);
  connect(zoneVAV11.TRooAir, TRooAir[11]);
  connect(zoneVAV12.TRooAir, TRooAir[12]);
  connect(zoneVAV13.TRooAir, TRooAir[13]);
  connect(zoneVAV14.TRooAir, TRooAir[14]);
  connect(zoneVAV15.TRooAir, TRooAir[15]);
  connect(zoneVAV16.TRooAir, TRooAir[16]);
  connect(zoneVAV17.TRooAir, TRooAir[17]);
  connect(zoneVAV18.TRooAir, TRooAir[18]);
  connect(zoneVAV19.TRooAir, TRooAir[19]);
  connect(zoneVAV20.TRooAir, TRooAir[20]);
  connect(zoneVAV21.TRooAir, TRooAir[21]);
  connect(zoneVAV1.VDis,VDis[1]);
  connect(zoneVAV2.VDis,VDis[2]);
  connect(zoneVAV3.VDis,VDis[3]);
  connect(zoneVAV4.VDis,VDis[4]);
  connect(zoneVAV5.VDis,VDis[5]);
  connect(zoneVAV6.VDis,VDis[6]);
  connect(zoneVAV7.VDis, VDis[7]);
  connect(zoneVAV8.VDis,VDis[8]);
  connect(zoneVAV9.VDis,VDis[9]);
  connect(zoneVAV10.VDis,VDis[10]);
  connect(zoneVAV11.VDis,VDis[11]);
  connect(zoneVAV12.VDis,VDis[12]);
  connect(zoneVAV13.VDis,VDis[13]);
  connect(zoneVAV14.VDis,VDis[14]);
  connect(zoneVAV15.VDis,VDis[15]);
  connect(zoneVAV16.VDis,VDis[16]);
  connect(zoneVAV17.VDis,VDis[17]);
  connect(zoneVAV18.VDis,VDis[18]);
  connect(zoneVAV19.VDis,VDis[19]);
  connect(zoneVAV20.VDis,VDis[20]);
  connect(zoneVAV21.VDis,VDis[21]);
  connect(zoneVAV1.TDis,TDis[1]);
  connect(zoneVAV2.TDis,TDis[2]);
  connect(zoneVAV3.TDis,TDis[3]);
  connect(zoneVAV4.TDis,TDis[4]);
  connect(zoneVAV5.TDis,TDis[5]);
  connect(zoneVAV6.TDis,TDis[6]);
  connect(zoneVAV7.TDis, TDis[7]);
  connect(zoneVAV8.TDis,TDis[8]);
  connect(zoneVAV9.TDis,TDis[9]);
  connect(zoneVAV10.TDis,TDis[10]);
  connect(zoneVAV11.TDis,TDis[11]);
  connect(zoneVAV12.TDis,TDis[12]);
  connect(zoneVAV13.TDis,TDis[13]);
  connect(zoneVAV14.TDis,TDis[14]);
  connect(zoneVAV15.TDis,TDis[15]);
  connect(zoneVAV16.TDis,TDis[16]);
  connect(zoneVAV17.TDis,TDis[17]);
  connect(zoneVAV18.TDis,TDis[18]);
  connect(zoneVAV19.TDis,TDis[19]);
  connect(zoneVAV20.TDis,TDis[20]);
  connect(zoneVAV21.TDis,TDis[21]);
  connect(zoneVAV1.yZonPreResReq, yZonPreResReq[1]);
  connect(zoneVAV2.yZonPreResReq, yZonPreResReq[2]);
  connect(zoneVAV3.yZonPreResReq, yZonPreResReq[3]);
  connect(zoneVAV4.yZonPreResReq, yZonPreResReq[4]);
  connect(zoneVAV5.yZonPreResReq, yZonPreResReq[5]);
  connect(zoneVAV6.yZonPreResReq, yZonPreResReq[6]);
  connect(zoneVAV7.yZonPreResReq, yZonPreResReq[7]);
  connect(zoneVAV8.yZonPreResReq, yZonPreResReq[8]);
  connect(zoneVAV9.yZonPreResReq, yZonPreResReq[9]);
  connect(zoneVAV10.yZonPreResReq, yZonPreResReq[10]);
  connect(zoneVAV11.yZonPreResReq, yZonPreResReq[11]);
  connect(zoneVAV12.yZonPreResReq, yZonPreResReq[12]);
  connect(zoneVAV13.yZonPreResReq, yZonPreResReq[13]);
  connect(zoneVAV14.yZonPreResReq, yZonPreResReq[14]);
  connect(zoneVAV15.yZonPreResReq, yZonPreResReq[15]);
  connect(zoneVAV16.yZonPreResReq, yZonPreResReq[16]);
  connect(zoneVAV17.yZonPreResReq, yZonPreResReq[17]);
  connect(zoneVAV18.yZonPreResReq, yZonPreResReq[18]);
  connect(zoneVAV19.yZonPreResReq, yZonPreResReq[19]);
  connect(zoneVAV20.yZonPreResReq, yZonPreResReq[20]);
  connect(zoneVAV21.yZonPreResReq, yZonPreResReq[21]);
  connect(zoneVAV1.yZonTemResReq, yZonTemResReq[1]);
  connect(zoneVAV2.yZonTemResReq, yZonTemResReq[2]);
  connect(zoneVAV3.yZonTemResReq, yZonTemResReq[3]);
  connect(zoneVAV4.yZonTemResReq, yZonTemResReq[4]);
  connect(zoneVAV5.yZonTemResReq, yZonTemResReq[5]);
  connect(zoneVAV6.yZonTemResReq, yZonTemResReq[6]);
  connect(zoneVAV7.yZonTemResReq, yZonTemResReq[7]);
  connect(zoneVAV8.yZonTemResReq, yZonTemResReq[8]);
  connect(zoneVAV9.yZonTemResReq, yZonTemResReq[9]);
  connect(zoneVAV10.yZonTemResReq, yZonTemResReq[10]);
  connect(zoneVAV11.yZonTemResReq, yZonTemResReq[11]);
  connect(zoneVAV12.yZonTemResReq, yZonTemResReq[12]);
  connect(zoneVAV13.yZonTemResReq, yZonTemResReq[13]);
  connect(zoneVAV14.yZonTemResReq, yZonTemResReq[14]);
  connect(zoneVAV15.yZonTemResReq, yZonTemResReq[15]);
  connect(zoneVAV16.yZonTemResReq, yZonTemResReq[16]);
  connect(zoneVAV17.yZonTemResReq, yZonTemResReq[17]);
  connect(zoneVAV18.yZonTemResReq, yZonTemResReq[18]);
  connect(zoneVAV19.yZonTemResReq, yZonTemResReq[19]);
  connect(zoneVAV20.yZonTemResReq, yZonTemResReq[20]);
  connect(zoneVAV21.yZonTemResReq, yZonTemResReq[21]);
  connect(qGaiFlo[:, 1], zoneVAV1.qGai_flow);
  connect(qGaiFlo[:, 2], zoneVAV2.qGai_flow);
  connect(qGaiFlo[:, 3], zoneVAV3.qGai_flow);
  connect(qGaiFlo[:, 4], zoneVAV4.qGai_flow);
  connect(qGaiFlo[:, 5], zoneVAV5.qGai_flow);
  connect(qGaiFlo[:, 6], zoneVAV6.qGai_flow);
  connect(qGaiFlo[:, 7], zoneVAV7.qGai_flow);
  connect(qGaiFlo[:, 8], zoneVAV8.qGai_flow);
  connect(qGaiFlo[:, 9], zoneVAV9.qGai_flow);
  connect(qGaiFlo[:, 10], zoneVAV10.qGai_flow);
  connect(qGaiFlo[:, 11], zoneVAV11.qGai_flow);
  connect(qGaiFlo[:, 12], zoneVAV12.qGai_flow);
  connect(qGaiFlo[:, 13], zoneVAV13.qGai_flow);
  connect(qGaiFlo[:, 14], zoneVAV14.qGai_flow);
  connect(qGaiFlo[:, 15], zoneVAV15.qGai_flow);
  connect(qGaiFlo[:, 16], zoneVAV16.qGai_flow);
  connect(qGaiFlo[:, 17], zoneVAV17.qGai_flow);
  connect(qGaiFlo[:, 18], zoneVAV18.qGai_flow);
  connect(qGaiFlo[:, 19], zoneVAV19.qGai_flow);
  connect(qGaiFlo[:, 20], zoneVAV20.qGai_flow);
  connect(qGaiFlo[:, 21], zoneVAV21.qGai_flow);
  connect(zoneVAV1.val_y, mass_flow_rate[1]);
  connect(zoneVAV2.val_y, mass_flow_rate[2]);
  connect(zoneVAV3.val_y, mass_flow_rate[3]);
  connect(zoneVAV4.val_y, mass_flow_rate[4]);
  connect(zoneVAV5.val_y, mass_flow_rate[5]);
  connect(zoneVAV6.val_y, mass_flow_rate[6]);
  connect(zoneVAV7.val_y, mass_flow_rate[7]);
  connect(zoneVAV8.val_y, mass_flow_rate[8]);
  connect(zoneVAV9.val_y, mass_flow_rate[9]);
  connect(zoneVAV10.val_y, mass_flow_rate[10]);
  connect(zoneVAV11.val_y, mass_flow_rate[11]);
  connect(zoneVAV12.val_y, mass_flow_rate[12]);
  connect(zoneVAV13.val_y, mass_flow_rate[13]);
  connect(zoneVAV14.val_y, mass_flow_rate[14]);
  connect(zoneVAV15.val_y, mass_flow_rate[15]);
  connect(zoneVAV16.val_y, mass_flow_rate[16]);
  connect(zoneVAV17.val_y, mass_flow_rate[17]);
  connect(zoneVAV18.val_y, mass_flow_rate[18]);
  connect(zoneVAV19.val_y, mass_flow_rate[19]);
  connect(zoneVAV20.val_y, mass_flow_rate[20]);
  connect(zoneVAV21.val_y, mass_flow_rate[21]);

  connect(splVal1.port_2, splVal2.port_1)
    annotation (Line(points={{-312,-160},{-298,-160}}, color={0,127,255}));
  connect(splVal6.port_2, splVal7.port_1)
    annotation (Line(points={{-122,-160},{-100,-160}}, color={0,127,255}));
  connect(splVal8.port_2, splVal9.port_1)
    annotation (Line(points={{-38,-160},{-16,-160}}, color={0,127,255}));
  connect(splVal9.port_2, splVal10.port_1)
    annotation (Line(points={{8.88178e-16,-160},{26,-160}},
                                                   color={0,127,255}));
  connect(splVal10.port_2, splVal11.port_1)
    annotation (Line(points={{42,-160},{64,-160}}, color={0,127,255}));
  connect(splVal11.port_2, splVal12.port_1)
    annotation (Line(points={{80,-160},{96,-160},{96,-158},{114,-158}},
                                                    color={0,127,255}));
  connect(splVal13.port_1, splVal12.port_2)
    annotation (Line(points={{150,-158},{130,-158}}, color={0,127,255}));
  connect(splVal13.port_2, splVal14.port_1)
    annotation (Line(points={{166,-158},{176,-158},{176,-160},{186,-160}},
                                                     color={0,127,255}));
  connect(splVal14.port_2, splVal15.port_1)
    annotation (Line(points={{202,-160},{224,-160}}, color={0,127,255}));
  connect(splVal15.port_2, splVal16.port_1)
    annotation (Line(points={{240,-160},{266,-160}}, color={0,127,255}));
  connect(splVal16.port_2, splVal17.port_1)
    annotation (Line(points={{282,-160},{306,-160}}, color={0,127,255}));
  connect(splVal17.port_2, splVal18.port_1)
    annotation (Line(points={{322,-160},{344,-160}}, color={0,127,255}));
  connect(splVal18.port_2, splVal19.port_1)
    annotation (Line(points={{360,-160},{386,-160}}, color={0,127,255}));
  connect(splVal19.port_2, splVal20.port_1)
    annotation (Line(points={{402,-160},{426,-160}}, color={0,127,255}));
  connect(splVal23.port_3, zoneVAV2.port_b) annotation (Line(points={{-296,-182},
          {-296,-4},{-290,-4}},       color={0,127,255}));
  connect(splVal23.port_2, splVal24.port_1)
    annotation (Line(points={{-288,-190},{-260,-190}}, color={0,127,255}));
  connect(splVal24.port_3, zoneVAV3.port_b) annotation (Line(points={{-252,-182},
          {-252,-4},{-250,-4}},       color={0,127,255}));
  connect(splVal24.port_2, splVal25.port_1)
    annotation (Line(points={{-244,-190},{-224,-190}}, color={0,127,255}));
  connect(splVal25.port_3, zoneVAV4.port_b) annotation (Line(points={{-216,-182},
          {-216,-4},{-210,-4}},       color={0,127,255}));
  connect(splVal25.port_2, splVal26.port_1)
    annotation (Line(points={{-208,-190},{-184,-190}}, color={0,127,255}));
  connect(splVal26.port_3, zoneVAV5.port_b) annotation (Line(points={{-176,-182},
          {-176,-4},{-170,-4}},       color={0,127,255}));
  connect(splVal26.port_2, splVal27.port_1)
    annotation (Line(points={{-168,-190},{-144,-190}}, color={0,127,255}));
  connect(splVal27.port_3, zoneVAV6.port_b) annotation (Line(points={{-136,-182},
          {-136,-4},{-130,-4}},       color={0,127,255}));
  connect(splVal27.port_2, splVal28.port_1)
    annotation (Line(points={{-128,-190},{-104,-190}}, color={0,127,255}));
  connect(splVal28.port_3, zoneVAV7.port_b) annotation (Line(points={{-96,-182},
          {-96,-4},{-90,-4}},       color={0,127,255}));
  connect(splVal28.port_2, splVal29.port_1)
    annotation (Line(points={{-88,-190},{-66,-190}}, color={0,127,255}));
  connect(splVal29.port_3, zoneVAV8.port_b) annotation (Line(points={{-58,-182},
          {-58,-126},{-50,-126},{-50,-4}},       color={0,127,255}));
  connect(splVal30.port_3, zoneVAV9.port_b) annotation (Line(points={{-14,-182},
          {-14,-4},{-10,-4}},       color={0,127,255}));
  connect(splVal30.port_1, splVal29.port_2)
    annotation (Line(points={{-22,-190},{-50,-190}}, color={0,127,255}));
  connect(splVal30.port_2, splVal31.port_1)
    annotation (Line(points={{-6,-190},{14,-190}}, color={0,127,255}));
  connect(splVal31.port_3, zoneVAV10.port_b) annotation (Line(points={{22,-182},
          {24,-182},{24,-4},{28,-4},{28,-4},{30,-4}},
                                            color={0,127,255}));
  connect(splVal31.port_2, splVal32.port_1)
    annotation (Line(points={{30,-190},{58,-190}}, color={0,127,255}));
  connect(splVal32.port_3, zoneVAV11.port_b) annotation (Line(points={{66,-182},
          {66,-4},{70,-4}},                 color={0,127,255}));
  connect(splVal32.port_2, splVal33.port_1)
    annotation (Line(points={{74,-190},{100,-190}}, color={0,127,255}));
  connect(splVal33.port_3, zoneVAV12.port_b) annotation (Line(points={{108,-182},
          {108,-176},{110,-176},{110,-4}},                  color={0,127,255}));
  connect(splVal33.port_2, splVal34.port_1)
    annotation (Line(points={{116,-190},{138,-190}}, color={0,127,255}));
  connect(splVal34.port_2, splVal35.port_1)
    annotation (Line(points={{154,-190},{180,-190}}, color={0,127,255}));
  connect(splVal35.port_3, zoneVAV14.port_b) annotation (Line(points={{188,-182},
          {188,-4},{190,-4}},       color={0,127,255}));
  connect(splVal35.port_2, splVal36.port_1)
    annotation (Line(points={{196,-190},{218,-190}}, color={0,127,255}));
  connect(splVal36.port_3, zoneVAV15.port_b) annotation (Line(points={{226,-182},
          {226,-4},{230,-4}},       color={0,127,255}));
  connect(splVal36.port_2, splVal37.port_1)
    annotation (Line(points={{234,-190},{260,-190}}, color={0,127,255}));
  connect(splVal37.port_3, zoneVAV16.port_b) annotation (Line(points={{268,-182},
          {268,-4},{270,-4}},       color={0,127,255}));
  connect(splVal37.port_2, splVal38.port_1)
    annotation (Line(points={{276,-190},{296,-190}}, color={0,127,255}));
  connect(splVal38.port_3, zoneVAV17.port_b) annotation (Line(points={{304,-182},
          {304,-4},{310,-4}},       color={0,127,255}));
  connect(splVal38.port_2, splVal39.port_1)
    annotation (Line(points={{312,-190},{334,-190}}, color={0,127,255}));
  connect(splVal39.port_3, zoneVAV18.port_b) annotation (Line(points={{342,-182},
          {342,-4},{350,-4}},       color={0,127,255}));
  connect(splVal39.port_2, splVal40.port_1)
    annotation (Line(points={{350,-190},{378,-190}}, color={0,127,255}));
  connect(splVal40.port_2, splVal41.port_1)
    annotation (Line(points={{394,-190},{416,-190}}, color={0,127,255}));
  connect(splVal41.port_3, zoneVAV20.port_b) annotation (Line(points={{424,-182},
          {424,-4},{430,-4}},       color={0,127,255}));
  connect(splVal41.port_2, splVal42.port_1)
    annotation (Line(points={{432,-190},{454,-190}}, color={0,127,255}));
  connect(splVal42.port_3, zoneVAV21.port_b) annotation (Line(points={{462,-182},
          {462,-0.2},{468.8,-0.2}}, color={0,127,255}));
  connect(splVal42.port_2, port_b)
    annotation (Line(points={{470,-190},{540,-190}}, color={0,127,255}));

  connect(splVal23.port_1, zoneVAV1.port_b) annotation (Line(points={{-304,-190},
          {-330,-190},{-330,-4}},       color={0,127,255}));
  connect(supplyAir, zoneVAV1.supplyAir1) annotation (Line(points={{-380,80},{-356,
          80},{-356,36},{-340,36},{-340,18}}, color={0,127,255}));
  connect(returnAir, zoneVAV1.returnAir) annotation (Line(points={{-380,-120},{-362,
          -120},{-362,2},{-340,2}}, color={0,127,255}));
  connect(splVal2.port_3, zoneVAV2.port_a) annotation (Line(points={{-290,-152},
          {-288,-152},{-288,-3.8},{-286.6,-3.8}}, color={0,127,255}));
  connect(splVal3.port_3, zoneVAV3.port_a) annotation (Line(points={{-246,-152},
          {-246,-78},{-246,-3.8},{-246.6,-3.8}}, color={0,127,255}));
  connect(splVal4.port_3, zoneVAV4.port_a) annotation (Line(points={{-202,-152},
          {-206.6,-152},{-206.6,-3.8}}, color={0,127,255}));
  connect(zoneVAV5.port_a, splVal5.port_3) annotation (Line(points={{-166.6,
          -3.8},{-166.6,-152},{-162,-152}}, color={0,127,255}));
  connect(splVal6.port_3, zoneVAV6.port_a) annotation (Line(points={{-130,-152},
          {-128,-152},{-128,-104},{-126.6,-104},{-126.6,-3.8}}, color={0,127,
          255}));
  connect(splVal7.port_3, zoneVAV7.port_a) annotation (Line(points={{-92,-152},
          {-88,-152},{-88,-3.8},{-86.6,-3.8}}, color={0,127,255}));
  connect(splVal8.port_3, zoneVAV8.port_a) annotation (Line(points={{-46,-152},
          {-44,-152},{-44,-3.8},{-46.6,-3.8}}, color={0,127,255}));
  connect(splVal9.port_3, zoneVAV9.port_a) annotation (Line(points={{-8,-152},{
          -8,-3.8},{-6.6,-3.8}}, color={0,127,255}));
  connect(splVal10.port_3, zoneVAV10.port_a) annotation (Line(points={{34,-152},
          {34,-3.8},{33.4,-3.8}}, color={0,127,255}));
  connect(splVal11.port_3, zoneVAV11.port_a) annotation (Line(points={{72,-152},
          {74,-152},{74,-3.8},{73.4,-3.8}}, color={0,127,255}));
  connect(zoneVAV12.port_a, splVal12.port_3) annotation (Line(points={{113.4,
          -3.8},{113.4,-150},{122,-150}}, color={0,127,255}));
  connect(splVal13.port_3, zoneVAV13.port_a) annotation (Line(points={{158,-150},
          {156,-150},{156,-3.8},{153.4,-3.8}}, color={0,127,255}));
  connect(splVal14.port_3, zoneVAV14.port_a) annotation (Line(points={{194,-152},
          {194,-78},{194,-3.8},{193.4,-3.8}}, color={0,127,255}));
  connect(splVal15.port_3, zoneVAV15.port_a) annotation (Line(points={{232,-152},
          {232,-3.8},{233.4,-3.8}}, color={0,127,255}));
  connect(splVal16.port_3, zoneVAV16.port_a) annotation (Line(points={{274,-152},
          {274,-3.8},{273.4,-3.8}},            color={0,127,255}));
  connect(splVal17.port_3, zoneVAV17.port_a) annotation (Line(points={{314,-152},
          {310,-152},{310,-130},{313.4,-130},{313.4,-3.8}}, color={0,127,255}));
  connect(splVal18.port_3, zoneVAV18.port_a) annotation (Line(points={{352,-152},
          {352,-122},{353.4,-122},{353.4,-3.8}}, color={0,127,255}));
  connect(splVal40.port_3, zoneVAV19.port_b) annotation (Line(points={{386,-182},
          {382,-182},{382,-4},{390,-4}},     color={0,127,255}));
  connect(splVal19.port_3, zoneVAV19.port_a) annotation (Line(points={{394,-152},
          {392,-152},{392,-3.8},{393.4,-3.8}}, color={0,127,255}));
  connect(splVal20.port_3, zoneVAV20.port_a) annotation (Line(points={{434,-152},
          {434,-78},{434,-3.8},{433.4,-3.8}}, color={0,127,255}));
  connect(port_a, massFlowRate.port_a)
    annotation (Line(points={{-380,-160},{-364,-160}}, color={0,127,255}));
  connect(massFlowRate.port_b, splVal1.port_1)
    annotation (Line(points={{-344,-160},{-328,-160}}, color={0,127,255}));
  connect(splVal1.port_3, zoneVAV1.port_a) annotation (Line(points={{-320,-152},
          {-320,-3.8},{-326.6,-3.8}}, color={0,127,255}));
  connect(splVal5.port_2, splVal6.port_1)
    annotation (Line(points={{-154,-160},{-138,-160}}, color={0,127,255}));
  connect(splVal20.port_2, massFlowRate5.port_a)
    annotation (Line(points={{442,-160},{448,-160}}, color={0,127,255}));
  connect(massFlowRate5.port_b, zoneVAV21.port_a) annotation (Line(points={{468,
          -160},{472,-160},{472,-0.2}}, color={0,127,255}));
  connect(splVal34.port_3, zoneVAV13.port_b) annotation (Line(points={{146,-182},
          {142,-182},{142,-4},{150,-4}}, color={0,127,255}));
  connect(splVal2.port_2, splVal3.port_1)
    annotation (Line(points={{-282,-160},{-254,-160}}, color={0,127,255}));
  connect(splVal3.port_2, splVal4.port_1)
    annotation (Line(points={{-238,-160},{-210,-160}}, color={0,127,255}));
  connect(splVal4.port_2, splVal5.port_1)
    annotation (Line(points={{-194,-160},{-170,-160}}, color={0,127,255}));
  connect(splVal7.port_2, splVal8.port_1)
    annotation (Line(points={{-84,-160},{-54,-160}}, color={0,127,255}));
  annotation (
  defaultComponentName="Building",
  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
  graphics={Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
      Polygon(
        points={{-2,92},{-80,50},{78,50},{-2,92}},
        lineColor={95,95,95},
        smooth=Smooth.None,
        fillPattern=FillPattern.Solid,
        fillColor={95,95,95}),
      Rectangle(
        extent={{-66,50},{62,-52}},
        lineColor={150,150,150},
        fillPattern=FillPattern.Solid,
        fillColor={150,150,150}),
      Rectangle(
        extent={{-44,8},{-16,36}},
        lineColor={255,255,255},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
      Rectangle(
        extent={{-44,-34},{-16,-6}},
        lineColor={255,255,255},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
      Rectangle(
        extent={{16,-34},{44,-6}},
        lineColor={255,255,255},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
      Rectangle(
        extent={{16,8},{44,36}},
        lineColor={255,255,255},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
          Bitmap(extent={{-54,-146},{84,-8}},
          fileName="modelica://Buildings/Resources/Images/ThermalZones/EnergyPlus/spawn_icon_darkbluetxmedres.png",
          visible=not usePrecompiledFMU),
                                        Text(
        extent={{-148,146},{152,106}},
        textString="%name",
        lineColor={0,0,255})}),
    Documentation(revisions="<html>
<ul>
<li>
March 17, 2020, by Kun Zhang:<br/>
First implementation.
</li>
</ul>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-380,-220},{540,
            100}})),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end FLOOR_1964;
