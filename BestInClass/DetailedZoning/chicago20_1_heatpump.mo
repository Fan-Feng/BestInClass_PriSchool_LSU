within BestInClass.DetailedZoning;
model chicago20_1_heatpump
  "Guideline 36 controller for detailed zoning building model"

  extends Modelica.Icons.Example;

  parameter Real yFanMin = 0.1
    "Minimum fan speed";
  parameter Modelica.Units.SI.Temperature THeaOn= 273.15 + 22
    "Heating setpoint during on";                             //293.15
  parameter Modelica.Units.SI.Temperature THeaOff=273.15 + 20
    "Heating setpoint during off";                            //285.15
  parameter Modelica.Units.SI.Temperature TCooOn=297.15
    "Cooling setpoint during on";
  parameter Modelica.Units.SI.Temperature TCooOff=303.15
    "Cooling setpoint during off";
  parameter Modelica.Units.SI.PressureDifference dpBuiStaSet(displayUnit="Pa")= 250
        "Building static pressure";
  parameter Integer numZon=Building.numZon
    "Number of zones";

  parameter Modelica.Units.SI.MassFlowRate AHUAir_Nominal=4.26;

  parameter Modelica.Units.SI.MassFlowRate AHUHotWater_Nominal= AHUAir_Nominal*1006*(16.7 - 8.5)/4200/(55 - 45);

  parameter Modelica.Units.SI.MassFlowRate BuildingAir_Nominal= 3.746187;

  parameter Modelica.Units.SI.MassFlowRate BuildingHotWater_Nominal= BuildingAir_Nominal *1006*(30 - 16.7)/4200/10;

  parameter Modelica.Units.SI.MassFlowRate PumpHotWater_Nominal = AHUHotWater_Nominal + BuildingHotWater_Nominal;

  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.Controller
    conAHU(
    pMinSet=50,
    VPriSysMax_flow=Building.VPriSysMax_flow,
    pMaxSet=410,
    peaSysPop=54) "AHU controller"
    annotation (Placement(transformation(extent={{50,0},{76,40}})));
  Buildings.Controls.OBC.CDL.Integers.MultiSum TZonResReq(nin=21)
    "Number of zone temperature requests"
    annotation (Placement(transformation(extent={{20,-70},{40,-50}})));
  Buildings.Controls.OBC.CDL.Integers.MultiSum PZonResReq(nin=21)
    "Number of zone pressure requests"
    annotation (Placement(transformation(extent={{20,-100},{40,-80}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weather(filNam=
        ModelicaServices.ExternalReferences.loadResource("modelica://BestInClass/Resources/weather/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"))
    annotation (Placement(transformation(extent={{-240,80},{-220,100}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{34,84},{46,96}}),   iconTransformation(extent=
           {{-174,26},{-154,46}})));
  BaseClasses.FLOOR_1964 Building(
    idfFile=par.idfFile,
    weaFile=par.weaFile,
    epwFile=par.epwFile,
    m_flow_zone=par.m_flow_zone,
    m_flow_sys=par.m_flow_sys,
    mRad_flow_nominal = PumpHotWater_Nominal,
    VDisSetMin_flow={16.3,14.5,14.5,6,100.2,100.2,33.5,33.5,27.5,114.5,110.3,
        26.9,50.7,22.4,112.4,115,123.7,135.1,26.9,13.8,13.8}/1000)
    annotation (Placement(transformation(extent={{154,14},{172,30}})));
  BestInClass.DetailedZoning.BaseClasses.AHUairtowater AHU(
    m_flow_nominal=Building.m_flow_sys,
    THeaOn=THeaOn,
    THeaOff=THeaOff,
    TCooOn=TCooOn,
    TCooOff=TCooOff,
    dpBuiStaSet=dpBuiStaSet)
    annotation (Placement(transformation(extent={{94,6},{114,26}})));
  Buildings.Controls.SetPoints.OccupancySchedule occupancy(
  occupancy=3600*par.occupancyTable,
      period=365*24*3600)
    "Occupancy schedule"
    annotation (Placement(transformation(extent={{-240,40},{-220,60}})));

  Results res(
  final A=1660.75,
  PFan=AHU.fanSup.P + 0,
  PHea=AHU.heaCoi.Q2_flow +
       Building.zoneVAV1.VAVbox.terHea.Q1_flow +
       Building.zoneVAV2.VAVbox.terHea.Q1_flow +
       Building.zoneVAV3.VAVbox.terHea.Q1_flow +
       Building.zoneVAV4.VAVbox.terHea.Q1_flow +
       Building.zoneVAV5.VAVbox.terHea.Q1_flow +
       Building.zoneVAV6.VAVbox.terHea.Q1_flow +
       Building.zoneVAV7.VAVbox.terHea.Q1_flow +
       Building.zoneVAV8.VAVbox.terHea.Q1_flow +
       Building.zoneVAV9.VAVbox.terHea.Q1_flow +
       Building.zoneVAV10.VAVbox.terHea.Q1_flow +
       Building.zoneVAV11.VAVbox.terHea.Q1_flow +
       Building.zoneVAV12.VAVbox.terHea.Q1_flow +
       Building.zoneVAV13.VAVbox.terHea.Q1_flow +
       Building.zoneVAV14.VAVbox.terHea.Q1_flow +
       Building.zoneVAV15.VAVbox.terHea.Q1_flow +
       Building.zoneVAV16.VAVbox.terHea.Q1_flow +
       Building.zoneVAV17.VAVbox.terHea.Q1_flow +
       Building.zoneVAV18.VAVbox.terHea.Q1_flow +
       Building.zoneVAV19.VAVbox.terHea.Q1_flow +
       Building.zoneVAV20.VAVbox.terHea.Q1_flow +
       Building.zoneVAV21.VAVbox.terHea.Q1_flow,
  PCooSen=AHU.cooCoi.QSen2_flow,
  PCooLat=AHU.cooCoi.QLat2_flow,
   T1=Building.zoneVAV1.zon.TAir,
   T2=Building.zoneVAV2.zon.TAir,
   T3=Building.zoneVAV3.zon.TAir,
   T4=Building.zoneVAV4.zon.TAir,
   T5=Building.zoneVAV5.zon.TAir,
   T6=Building.zoneVAV6.zon.TAir,
   T7=Building.zoneVAV7.zon.TAir,
   T8=Building.zoneVAV8.zon.TAir,
   T9=Building.zoneVAV9.zon.TAir,
   T10=Building.zoneVAV10.zon.TAir,
   T11=Building.zoneVAV11.zon.TAir,
   T12=Building.zoneVAV12.zon.TAir,
   T13=Building.zoneVAV13.zon.TAir,
   T14=Building.zoneVAV14.zon.TAir,
   T15=Building.zoneVAV15.zon.TAir,
   T16=Building.zoneVAV16.zon.TAir,
   T17=Building.zoneVAV17.zon.TAir,
   T18=Building.zoneVAV18.zon.TAir,
   T19=Building.zoneVAV19.zon.TAir,
   T20=Building.zoneVAV20.zon.TAir,
   T21=Building.zoneVAV21.zon.TAir,
   TSetHea=Building.zoneVAV1.TRooHeaSet,
   TSetCoo=Building.zoneVAV1.TRooCooSet)
  "Results of the simulation";
  Buildings.Controls.OBC.CDL.Routing.RealScalarReplicator reaRep(final nout=
        numZon) "Replicate real input"
    annotation (Placement(transformation(extent={{-200,40},{-180,60}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booRep(final nout=
        numZon) "Replicate boolean input"
    annotation (Placement(transformation(extent={{-200,10},{-180,30}})));
  BaseClasses.Parameters par(
    idfFile="modelica://BestInClass/Resources/idf/1964_IDF_Files/2022/ASHRAE901_OfficeMedium_STD2019_Buffalo_test.idf",
    weaFile="modelica://BestInClass/Resources/weather/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos",
    epwFile="modelica://BestInClass/Resources/weather/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.epw",
    peoFile="modelica://BestInClass/Resources/intGai/people_loads.dat",
    ligFile="modelica://BestInClass/Resources/intGai/lighting_loads.dat",
    equFile="modelica://BestInClass/Resources/intGai/equipment_loads.dat",
    TSupSetCoo=285.15,
    pSetCon(displayUnit="Pa") = 410,
    minAirFra=0.1,
    TOutLow=289.15,
    TOutHigh=294.15,
    TSupSetCooLow=285.15,
    TSupSetCooHigh=291.15,
    pSetMin(displayUnit="Pa") = 50,
    pSetMax(displayUnit="Pa") = 410,
    kLig=1,
    kEqu=1,
    occupancyTable={32.0,42.0,56.0,66.0,80.0,90.0,152.0,162.0,176.0,186.0,200.0,
        210.0,224.0,234.0,248.0,258.0,320.0,330.0,344.0,354.0,368.0,378.0,392.0,
        402.0,416.0,426.0,512.0,522.0,536.0,546.0,560.0,570.0,584.0,594.0,656.0,
        666.0,680.0,690.0,704.0,714.0,728.0,738.0,752.0,762.0,824.0,834.0,848.0,
        858.0,872.0,882.0,896.0,906.0,920.0,930.0,992.0,1002.0,1016.0,1026.0,
        1040.0,1050.0,1064.0,1074.0,1088.0,1098.0,1184.0,1194.0,1208.0,1218.0,
        1232.0,1242.0,1256.0,1266.0,1328.0,1338.0,1352.0,1362.0,1376.0,1386.0,
        1400.0,1410.0,1424.0,1434.0,1496.0,1506.0,1520.0,1530.0,1544.0,1554.0,
        1568.0,1578.0,1592.0,1602.0,1664.0,1674.0,1688.0,1698.0,1712.0,1722.0,
        1736.0,1746.0,1760.0,1770.0,1832.0,1842.0,1856.0,1866.0,1880.0,1890.0,
        1904.0,1914.0,1928.0,1938.0,2000.0,2010.0,2024.0,2034.0,2048.0,2058.0,
        2072.0,2082.0,2096.0,2106.0,2168.0,2178.0,2192.0,2202.0,2216.0,2226.0,
        2240.0,2250.0,2264.0,2274.0,2336.0,2346.0,2360.0,2370.0,2384.0,2394.0,
        2408.0,2418.0,2432.0,2442.0,2504.0,2514.0,2528.0,2538.0,2552.0,2562.0,
        2576.0,2586.0,2600.0,2610.0,2672.0,2682.0,2696.0,2706.0,2720.0,2730.0,
        2744.0,2754.0,2768.0,2778.0,2840.0,2850.0,2864.0,2874.0,2888.0,2898.0,
        2912.0,2922.0,2936.0,2946.0,3008.0,3018.0,3032.0,3042.0,3056.0,3066.0,
        3080.0,3090.0,3104.0,3114.0,3176.0,3186.0,3200.0,3210.0,3224.0,3234.0,
        3248.0,3258.0,3272.0,3282.0,3344.0,3354.0,3368.0,3378.0,3392.0,3402.0,
        3416.0,3426.0,3440.0,3450.0,3536.0,3546.0,3560.0,3570.0,3584.0,3594.0,
        3608.0,3618.0,3680.0,3690.0,3704.0,3714.0,3728.0,3738.0,3752.0,3762.0,
        3776.0,3786.0,3848.0,3858.0,3872.0,3882.0,3896.0,3906.0,3920.0,3930.0,
        3944.0,3954.0,4016.0,4026.0,4040.0,4050.0,4064.0,4074.0,4088.0,4098.0,
        4112.0,4122.0,4184.0,4194.0,4208.0,4218.0,4232.0,4242.0,4256.0,4266.0,
        4280.0,4290.0,4352.0,4362.0,4376.0,4386.0,4400.0,4410.0,4448.0,4458.0,
        4520.0,4530.0,4544.0,4554.0,4568.0,4578.0,4592.0,4602.0,4616.0,4626.0,
        4688.0,4698.0,4712.0,4722.0,4736.0,4746.0,4760.0,4770.0,4784.0,4794.0,
        4856.0,4866.0,4880.0,4890.0,4904.0,4914.0,4928.0,4938.0,4952.0,4962.0,
        5024.0,5034.0,5048.0,5058.0,5072.0,5082.0,5096.0,5106.0,5120.0,5130.0,
        5192.0,5202.0,5216.0,5226.0,5240.0,5250.0,5264.0,5274.0,5288.0,5298.0,
        5360.0,5370.0,5384.0,5394.0,5408.0,5418.0,5432.0,5442.0,5456.0,5466.0,
        5528.0,5538.0,5552.0,5562.0,5576.0,5586.0,5600.0,5610.0,5624.0,5634.0,
        5696.0,5706.0,5720.0,5730.0,5744.0,5754.0,5768.0,5778.0,5792.0,5802.0,
        5888.0,5898.0,5912.0,5922.0,5936.0,5946.0,5960.0,5970.0,6032.0,6042.0,
        6056.0,6066.0,6080.0,6090.0,6104.0,6114.0,6128.0,6138.0,6200.0,6210.0,
        6224.0,6234.0,6248.0,6258.0,6272.0,6282.0,6296.0,6306.0,6368.0,6378.0,
        6392.0,6402.0,6416.0,6426.0,6440.0,6450.0,6464.0,6474.0,6536.0,6546.0,
        6560.0,6570.0,6584.0,6594.0,6608.0,6618.0,6632.0,6642.0,6704.0,6714.0,
        6728.0,6738.0,6752.0,6762.0,6776.0,6786.0,6800.0,6810.0,6896.0,6906.0,
        6920.0,6930.0,6944.0,6954.0,6968.0,6978.0,7040.0,7050.0,7064.0,7074.0,
        7088.0,7098.0,7112.0,7122.0,7136.0,7146.0,7208.0,7218.0,7232.0,7242.0,
        7256.0,7266.0,7280.0,7290.0,7304.0,7314.0,7376.0,7386.0,7400.0,7410.0,
        7424.0,7434.0,7448.0,7458.0,7472.0,7482.0,7568.0,7578.0,7592.0,7602.0,
        7616.0,7626.0,7640.0,7650.0,7712.0,7722.0,7736.0,7746.0,7760.0,7770.0,
        7784.0,7794.0,7808.0,7818.0,7880.0,7890.0,7904.0,7914.0,7928.0,7938.0,
        7976.0,7986.0,8048.0,8058.0,8072.0,8082.0,8096.0,8106.0,8120.0,8130.0,
        8144.0,8154.0,8216.0,8226.0,8240.0,8250.0,8264.0,8274.0,8288.0,8298.0,
        8312.0,8322.0,8384.0,8394.0,8408.0,8418.0,8432.0,8442.0,8456.0,8466.0,
        8480.0,8490.0,8552.0,8562.0,8576.0,8586.0,8624.0,8634.0,8648.0,8658.0,
        8720.0,8730.0,8744.0,8754.0},
    m_flow_zone=1.2*{0.066007, 0.059206, 0.059188, 0.026850, 0.184897, 0.175294, 0.188602,
     0.188681, 0.054296, 0.162594,0.172294, 0.115338,0.140254, 0.045,
     0.454357, 0.495230, 0.430493, 0.456583, 0.106146, 0.058899, 0.058760},
    m_flow_sys=1.2*4.26)
    "Parameters for parametric studies"
    annotation (Placement(transformation(extent={{160,102},{180,122}})));

  BaseClasses.InternalGains internalGains(
    kLig=par.kLig,
    kEqu=par.kEqu,
    peoFile=par.peoFile,
    ligFile=par.ligFile,
    equFile=par.equFile)
    annotation (Placement(transformation(extent={{-240,110},{-220,130}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.SetPoints.OutdoorAirFlow.SumZone
    zonToSys(final numZon=numZon) "Sum up zone calculation output"
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.SetPoints.OutdoorAirFlow.Zone
    zonOutAirSet[numZon](
    final AFlo=Building.AFlo,
    final have_occSen=fill(false, numZon),
    final have_winSen=fill(false, numZon),
    occDen={0,0,0,0,0.5,0.5,0,0,0.2,0.05,0.05,0.05,0.1,0,0.05,0.05,0.05,0.05,0,
        0,0},
    final desZonPop={0,0,0,0,21.6,21.6,0,0,4.6,6.3,6.3,2.12,6.15,0,8.83,9.03,
        9.72,10.61,0,0,0},
    final minZonPriFlo=Building.minZonPriFlo)
    "Zone level calculation of the minimum outdoor airflow setpoint"
    annotation (Placement(transformation(extent={{-60,24},{-40,44}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booRep1(final nout=
       numZon) "Replicate signal whether the outdoor airflow is required"
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Buildings.Controls.OBC.CDL.Routing.RealScalarReplicator reaRep1(final nout=
        numZon) "Replicate design uncorrected minimum outdoor airflow setpoint"
    annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.ZoneStatus
    zonSta[numZon] "Check zone temperature status"
    annotation (Placement(transformation(extent={{-200,-92},{-180,-64}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.GroupStatus
    zonGroSta(final numZon=numZon)
    "Check zone group status according to the zones status"
    annotation (Placement(transformation(extent={{-140,-60},{-120,-20}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.OperationMode
    opeModSel(final numZon=numZon)
    annotation (Placement(transformation(extent={{-80,-76},{-60,-44}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.SetPoints.ZoneTemperatures
    TZonSet[numZon](final have_occSen=fill(false, numZon), final have_winSen=
        fill(false, numZon)) "Zone setpoint"
    annotation (Placement(transformation(extent={{-80,-114},{-60,-86}})));
  Buildings.Controls.OBC.CDL.Routing.IntegerScalarReplicator intRep(final nout=
        numZon) "All zones in same operation mode"
    annotation (Placement(transformation(extent={{-40,-70},{-20,-50}})));
  Buildings.Controls.OBC.CDL.Integers.Sources.Constant demLimLev[numZon](final k=
        fill(0, numZon))      "Demand limit level, assumes to be 0"
    annotation (Placement(transformation(extent={{-120,-126},{-100,-106}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Constant falSta[numZon](final k=
        fill(false, numZon))
    "All windows are closed, no zone has override switch"
    annotation (Placement(transformation(extent={{-240,-10},{-220,10}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant warUpTim[numZon](final k=
        fill(3600, numZon))
                         "Warm up and cool down time"
    annotation (Placement(transformation(extent={{-244,-80},{-232,-68}})));
  Buildings.Controls.OBC.CDL.Reals.MultiSum mulSum(nin=21)
    annotation (Placement(transformation(extent={{188,12},{202,26}})));
  Buildings.Controls.OBC.CDL.Reals.Add add2
    annotation (Placement(transformation(extent={{204,46},{218,60}})));
  Buildings.Fluid.FixedResistances.Junction splVal2(
    m_flow_nominal={AHUHotWater_Nominal,-PumpHotWater_Nominal,
        BuildingHotWater_Nominal},
    redeclare package Medium = Buildings.Media.Water,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={244,98})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant cooDowTim[numZon](final k=
        fill(0, numZon)) "Warm up and cool down time"
    annotation (Placement(transformation(extent={{-244,-52},{-232,-40}})));
  Buildings.Fluid.FixedResistances.Junction splVal1(
    m_flow_nominal={PumpHotWater_Nominal,-AHUHotWater_Nominal,-
        BuildingHotWater_Nominal},
    redeclare package Medium = Buildings.Media.Water,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={215,87})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate
    annotation (Placement(transformation(extent={{192,74},{184,82}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1
    annotation (Placement(transformation(extent={{186,86},{178,94}})));
  BaseClasses.HotWaterLoop hotWaterLoop
    annotation (Placement(transformation(extent={{236,54},{256,74}})));
protected
  model Results "Model to store the results of the simulation"
    parameter Modelica.Units.SI.Area A "Floor area";
    input Modelica.Units.SI.Power PFan "Fan energy";
    input Modelica.Units.SI.Power PHea "Heating energy";
    input Modelica.Units.SI.Power PCooSen "Sensible cooling energy";
    input Modelica.Units.SI.Power PCooLat "Latent cooling energy";
    input Modelica.Units.SI.Temperature T1;
    input Modelica.Units.SI.Temperature T2;
    input Modelica.Units.SI.Temperature T3;
    input Modelica.Units.SI.Temperature T4;
    input Modelica.Units.SI.Temperature T5;
    input Modelica.Units.SI.Temperature T6;
    input Modelica.Units.SI.Temperature T7;
    input Modelica.Units.SI.Temperature T8;
    input Modelica.Units.SI.Temperature T9;
    input Modelica.Units.SI.Temperature T10;
    input Modelica.Units.SI.Temperature T11;
    input Modelica.Units.SI.Temperature T12;
    input Modelica.Units.SI.Temperature T13;
    input Modelica.Units.SI.Temperature T14;
    input Modelica.Units.SI.Temperature T15;
    input Modelica.Units.SI.Temperature T16;
    input Modelica.Units.SI.Temperature T17;
    input Modelica.Units.SI.Temperature T18;
    input Modelica.Units.SI.Temperature T19;
    input Modelica.Units.SI.Temperature T20;
    input Modelica.Units.SI.Temperature T21;
    input Modelica.Units.SI.Temperature TSetHea;
    input Modelica.Units.SI.Temperature TSetCoo;
     Real ErrCooling1, ErrCooling2, ErrCooling3, ErrCooling4, ErrCooling5,
          ErrCooling6, ErrCooling7, ErrCooling8, ErrCooling9, ErrCooling10,
          ErrCooling11, ErrCooling12, ErrCooling13, ErrCooling14, ErrCooling15,
          ErrCooling16, ErrCooling17, ErrCooling18, ErrCooling19, ErrCooling20,
          ErrCooling21, ErrCooling;
     Real ErrHeating1, ErrHeating2, ErrHeating3, ErrHeating4, ErrHeating5,
          ErrHeating6, ErrHeating7, ErrHeating8, ErrHeating9, ErrHeating10,
          ErrHeating11, ErrHeating12, ErrHeating13, ErrHeating14, ErrHeating15,
          ErrHeating16, ErrHeating17, ErrHeating18, ErrHeating19, ErrHeating20,
          ErrHeating21, ErrHeating;

    Real EFan(
      unit="J/m2",
      start=0,
      nominal=1E5,
      fixed=true) "Fan energy";
    Real EHea(
      unit="J/m2",
      start=0,
      nominal=1E5,
      fixed=true) "Heating energy";
    Real ECooSen(
      unit="J/m2",
      start=0,
      nominal=1E5,
      fixed=true) "Sensible cooling energy";
    Real ECooLat(
      unit="J/m2",
      start=0,
      nominal=1E5,
      fixed=true) "Latent cooling energy";
    Real ECoo(unit="J/m2") "Total cooling energy";
    Real DiscomfortCooling(start=0,fixed=true) "Discomfort in cooling mode";
    Real DiscomfortHeating(start=0,fixed=true) "Discomfort in heating mode";

  equation

    A*der(EFan) = PFan;
    A*der(EHea) = PHea;
    A*der(ECooSen) = PCooSen;
    A*der(ECooLat) = PCooLat;
    ECoo = ECooSen + ECooLat;

    ErrCooling1 = if T1<=TSetCoo then 0 else T1-TSetCoo;
    ErrCooling2 = if T2<=TSetCoo then 0 else T2-TSetCoo;
    ErrCooling3 = if T3<=TSetCoo then 0 else T3-TSetCoo;
    ErrCooling4 = if T4<=TSetCoo then 0 else T4-TSetCoo;
    ErrCooling5 = if T5<=TSetCoo then 0 else T5-TSetCoo;
    ErrCooling6 = if T6<=TSetCoo then 0 else T6-TSetCoo;
    ErrCooling7 = if T7<=TSetCoo then 0 else T7-TSetCoo;
    ErrCooling8 = if T8<=TSetCoo then 0 else T8-TSetCoo;
    ErrCooling9 = if T9<=TSetCoo then 0 else T9-TSetCoo;
    ErrCooling10 = if T10<=TSetCoo then 0 else T10-TSetCoo;
    ErrCooling11 = if T11<=TSetCoo then 0 else T11-TSetCoo;
    ErrCooling12 = if T12<=TSetCoo then 0 else T12-TSetCoo;
    ErrCooling13 = if T13<=TSetCoo then 0 else T13-TSetCoo;
    ErrCooling14 = if T14<=TSetCoo then 0 else T14-TSetCoo;
    ErrCooling15 = if T15<=TSetCoo then 0 else T15-TSetCoo;
    ErrCooling16 = if T16<=TSetCoo then 0 else T16-TSetCoo;
    ErrCooling17 = if T17<=TSetCoo then 0 else T17-TSetCoo;
    ErrCooling18 = if T18<=TSetCoo then 0 else T18-TSetCoo;
    ErrCooling19 = if T19<=TSetCoo then 0 else T19-TSetCoo;
    ErrCooling20 = if T20<=TSetCoo then 0 else T20-TSetCoo;
    ErrCooling21 = if T21<=TSetCoo then 0 else T21-TSetCoo;
    ErrCooling = (ErrCooling1+ErrCooling2+ErrCooling3+ErrCooling4+ErrCooling5+ErrCooling6+ErrCooling7+
                 ErrCooling8+ErrCooling9+ErrCooling10+ErrCooling11+ErrCooling12+ErrCooling13+ErrCooling14+
                 ErrCooling15+ErrCooling16+ErrCooling17+ErrCooling18+ErrCooling19+ErrCooling20+ErrCooling21)/3600;
    der(DiscomfortCooling)=ErrCooling;

    ErrHeating1 = if T1>=TSetHea then 0 else TSetHea-T1;
    ErrHeating2 = if T2>=TSetHea then 0 else TSetHea-T2;
    ErrHeating3 = if T3>=TSetHea then 0 else TSetHea-T3;
    ErrHeating4 = if T4>=TSetHea then 0 else TSetHea-T4;
    ErrHeating5 = if T5>=TSetHea then 0 else TSetHea-T5;
    ErrHeating6 = if T6>=TSetHea then 0 else TSetHea-T6;
    ErrHeating7 = if T7>=TSetHea then 0 else TSetHea-T7;
    ErrHeating8 = if T8>=TSetHea then 0 else TSetHea-T8;
    ErrHeating9 = if T9>=TSetHea then 0 else TSetHea-T9;
    ErrHeating10 = if T10>=TSetHea then 0 else TSetHea-T10;
    ErrHeating11 = if T11>=TSetHea then 0 else TSetHea-T11;
    ErrHeating12 = if T12>=TSetHea then 0 else TSetHea-T12;
    ErrHeating13 = if T13>=TSetHea then 0 else TSetHea-T13;
    ErrHeating14 = if T14>=TSetHea then 0 else TSetHea-T14;
    ErrHeating15 = if T15>=TSetHea then 0 else TSetHea-T15;
    ErrHeating16 = if T16>=TSetHea then 0 else TSetHea-T16;
    ErrHeating17 = if T17>=TSetHea then 0 else TSetHea-T17;
    ErrHeating18 = if T18>=TSetHea then 0 else TSetHea-T18;
    ErrHeating19 = if T19>=TSetHea then 0 else TSetHea-T19;
    ErrHeating20 = if T20>=TSetHea then 0 else TSetHea-T20;
    ErrHeating21 = if T21>=TSetHea then 0 else TSetHea-T21;
    ErrHeating = (ErrHeating1+ErrHeating2+ErrHeating3+ErrHeating4+ErrHeating5+ErrHeating6+ErrHeating7+
                 ErrHeating8+ErrHeating9+ErrHeating10+ErrHeating11+ErrHeating12+ErrHeating13+ErrHeating14+
                 ErrHeating15+ErrHeating16+ErrHeating17+ErrHeating18+ErrHeating19+ErrHeating20+ErrHeating21)/3600;
    der(DiscomfortHeating)=ErrHeating;

  end Results;

equation
  connect(TZonResReq.y, conAHU.uZonTemResReq) annotation (Line(points={{42,-60},
          {46,-60},{46,4.44444},{48.7,4.44444}},   color={255,127,0}));
  connect(PZonResReq.y, conAHU.uZonPreResReq) annotation (Line(points={{42,-90},
          {46,-90},{46,2.77778},{48.7,2.77778}},      color={255,127,0}));
  connect(AHU.TSupAHU, conAHU.TSup) annotation (Line(points={{115,10.6},{114,
          10.6},{114,-4},{42,-4},{42,17.2222},{48.7,17.2222}},
                                                             color={0,0,127}));
  connect(conAHU.ducStaPre, AHU.dpFan) annotation (Line(points={{48.7,33.8889},
          {48.7,42},{132,42},{132,20},{118,20},{118,19},{115,19}},
                                                             color={0,0,127}));
  connect(conAHU.ySupFanSpe, AHU.uFan) annotation (Line(points={{77.3,33.3333},
          {76,33.3333},{76,38},{84,38},{84,16},{93,16}},
                                          color={0,0,127}));
  connect(conAHU.yCoo, AHU.uCoo) annotation (Line(points={{77.3,10},{93,10}},
                     color={0,0,127}));
  connect(AHU.VOutFlo, conAHU.VOut_flow) annotation (Line(points={{115,21.6},{
          115,18},{114,18},{114,12},{116,12},{116,2},{114,2},{114,-2},{112,-2},
          {112,-4},{44,-4},{44,10.5556},{48.7,10.5556}},             color={0,0,
          127}));
  connect(conAHU.TMix, AHU.TMixAHU) annotation (Line(points={{48.7,8.33333},{44,
          8.33333},{44,-2},{48,-2},{48,-8},{120,-8},{120,4},{118,4},{118,13.6},
          {115,13.6}},                                         color={0,0,127}));
  connect(AHU.TRetAHU, conAHU.TOutCut) annotation (Line(points={{115,16.4},{114,
          16.4},{114,-4},{84,-4},{84,-2},{44,-2},{44,15.5556},{48.7,15.5556}},
                                                               color={0,0,127}));
  connect(conAHU.yOutDamPos, AHU.uOutDamPos) annotation (Line(points={{77.3,
          3.33333},{76,3.33333},{76,0},{84,0},{84,19},{93,19}},
                                     color={0,0,127}));
  connect(AHU.TSupAHU, Building.TSupAHU) annotation (Line(points={{115,10.6},{
          122,10.6},{122,19.6},{153.1,19.6}},
                                     color={0,0,127}));
  connect(AHU.supplyAir, Building.returnAir)   annotation (Line(points={{114,7.8},
          {154,7.8},{154,15.44}},                                                               color={0,127,
          255},
      thickness=0.5));
  connect(AHU.returnAir, Building.supplyAir)   annotation (Line(points={{114,24},
          {142,24},{142,28.4},{154,28.4}},                                                color={0,127,
          255},
      thickness=0.5));
  connect(occupancy.occupied, booRep.u) annotation (Line(points={{-219,44},{
          -214,44},{-214,20},{-202,20}},
                                    color={255,0,255}));
  connect(occupancy.tNexOcc, reaRep.u) annotation (Line(points={{-219,56},{-214,
          56},{-214,50},{-202,50}}, color={0,0,127}));
  connect(internalGains.qGaiFlo, Building.qGaiFlo) annotation (Line(points={{-219,
          120},{140,120},{140,26.8},{153.1,26.8}},
                                        color={0,0,127}));
  connect(conAHU.yRetDamPos, AHU.uRetDamPos) annotation (Line(points={{77.3,
          6.66667},{76,6.66667},{76,0},{84,0},{84,14},{82,14},{82,22},{93,22}},
                                          color={0,0,127}));
  connect(AHU.uHea, conAHU.yHea) annotation (Line(points={{93,13},{77.3,13},{
          77.3,13.3333}},  color={0,0,127}));
  connect(zonOutAirSet.yDesZonPeaOcc, zonToSys.uDesZonPeaOcc) annotation (Line(
        points={{-38,43},{-26,43},{-26,38},{-22,38}}, color={0,0,127}));
  connect(zonOutAirSet.VDesPopBreZon_flow, zonToSys.VDesPopBreZon_flow)
    annotation (Line(points={{-38,40},{-28,40},{-28,36},{-22,36}},
                                                 color={0,0,127}));
  connect(zonOutAirSet.VDesAreBreZon_flow, zonToSys.VDesAreBreZon_flow)
    annotation (Line(points={{-38,37},{-30,37},{-30,34},{-22,34}}, color={0,0,127}));
  connect(zonOutAirSet.VPriAir_flow, zonToSys.VPriAir_flow) annotation (Line(
        points={{-38,25},{-36,25},{-36,22},{-22,22}}, color={0,0,127}));
  connect(zonOutAirSet.yPriOutAirFra, zonToSys.uPriOutAirFra)
    annotation (Line(points={{-38,28},{-34,28},{-34,24},{-22,24}},
                                                 color={0,0,127}));
  connect(zonOutAirSet.VUncOutAir_flow, zonToSys.VUncOutAir_flow) annotation (
      Line(points={{-38,31},{-32,31},{-32,26},{-22,26}}, color={0,0,127}));
  connect(zonOutAirSet.yDesPriOutAirFra, zonToSys.uDesPriOutAirFra) annotation (
     Line(points={{-38,34},{-30,34},{-30,28},{-22,28}}, color={0,0,127}));
  connect(zonToSys.ySumDesZonPop, conAHU.sumDesZonPop) annotation (Line(points={{2,39},{
          44,39},{44,30.5556},{48.7,30.5556}},         color={0,0,127}));
  connect(zonToSys.VSumDesPopBreZon_flow, conAHU.VSumDesPopBreZon_flow)
    annotation (Line(points={{2,36},{42,36},{42,28.8889},{48.7,28.8889}}, color=
         {0,0,127}));
  connect(zonToSys.yDesSysVenEff, conAHU.uDesSysVenEff) annotation (Line(points={{2,30},{
          36,30},{36,25.5556},{48.7,25.5556}},         color={0,0,127}));
  connect(zonToSys.uOutAirFra_max, conAHU.uOutAirFra_max) annotation (Line(
        points={{2,24},{32,24},{32,20.5556},{48.7,20.5556}}, color={0,0,127}));
  connect(conAHU.yReqOutAir, booRep1.u) annotation (Line(points={{77.3,16.6667},
          {80,16.6667},{80,68},{-106,68},{-106,50},{-102,50}},   color={255,0,255}));
  connect(booRep1.y, zonOutAirSet.uReqOutAir) annotation (Line(points={{-78,50},
          {-74,50},{-74,37},{-62,37}},  color={255,0,255}));
  connect(conAHU.VDesUncOutAir_flow, reaRep1.u) annotation (Line(points={{77.3,
          26.6667},{82,26.6667},{82,70},{-108,70},{-108,20},{-102,20}},
                                                                 color={0,0,127}));
  connect(reaRep1.y, zonOutAirSet.VUncOut_flow_nominal) annotation (Line(points={{-78,20},
          {-74,20},{-74,25},{-62,25}},             color={0,0,127}));
  connect(Building.VDis, zonOutAirSet.VDis_flow) annotation (Line(points={{172.9,
          23.92},{180,23.92},{180,-28},{-66,-28},{-66,28},{-62,28}},
                                                             color={0,0,127}));
  connect(Building.TDis, zonOutAirSet.TDis) annotation (Line(points={{172.9,22},
          {182,22},{182,-32},{-68,-32},{-68,31},{-62,31}},
                                                      color={0,0,127}));
  connect(Building.yZonPreResReq, PZonResReq.u[1:21]) annotation (Line(points={{173.8,
          18},{173.8,-106},{16,-106},{16,-86.6667},{18,-86.6667}},
        color={255,127,0}));
  connect(Building.yZonTemResReq, TZonResReq.u[1:21]) annotation (Line(points={{173.8,
          19.92},{173.8,-100},{10,-100},{10,-56.6667},{18,-56.6667}},
        color={255,127,0}));
  connect(zonSta.yOccHeaHig,zonGroSta. uOccHeaHig) annotation (Line(points={{-178,
          -72},{-172,-72},{-172,-35},{-142,-35}}, color={255,0,255}));
  connect(zonSta.yHigOccCoo,zonGroSta. uHigOccCoo)
    annotation (Line(points={{-178,-77},{-170,-77},{-170,-37},{-142,-37}},
                                                     color={255,0,255}));
  connect(zonSta.THeaSetOff,zonGroSta. THeaSetOff) annotation (Line(points={{-178,
          -80},{-166,-80},{-166,-43},{-142,-43}}, color={0,0,127}));
  connect(zonSta.yUnoHeaHig,zonGroSta. uUnoHeaHig) annotation (Line(points={{-178,
          -82},{-168,-82},{-168,-41},{-142,-41}}, color={255,0,255}));
  connect(zonSta.yEndSetBac,zonGroSta. uEndSetBac) annotation (Line(points={{-178,
          -84},{-164,-84},{-164,-45},{-142,-45}}, color={255,0,255}));
  connect(zonGroSta.yOccHeaHig,opeModSel. uOccHeaHig) annotation (Line(points={{-118,
          -33},{-94,-33},{-94,-56},{-82,-56}},          color={255,0,255}));
  connect(zonGroSta.yColZon,opeModSel. totColZon) annotation (Line(points={{-118,
          -38},{-98,-38},{-98,-60},{-82,-60}},    color={255,127,0}));
  connect(zonGroSta.ySetBac,opeModSel. uSetBac) annotation (Line(points={{-118,
          -40},{-100,-40},{-100,-62},{-82,-62}},  color={255,0,255}));
  connect(zonGroSta.yEndSetBac,opeModSel. uEndSetBac) annotation (Line(points={{-118,
          -42},{-102,-42},{-102,-64},{-82,-64}},        color={255,0,255}));
  connect(zonGroSta.TZonMin,opeModSel. TZonMin) annotation (Line(points={{-118,
          -55},{-112,-55},{-112,-68},{-82,-68}},  color={0,0,127}));
  connect(zonGroSta.yHotZon,opeModSel. totHotZon) annotation (Line(points={{-118,
          -45},{-104,-45},{-104,-70},{-82,-70}},  color={255,127,0}));
  connect(zonGroSta.ySetUp,opeModSel. uSetUp) annotation (Line(points={{-118,
          -47},{-106,-47},{-106,-72},{-82,-72}},  color={255,0,255}));
  connect(zonGroSta.yEndSetUp,opeModSel. uEndSetUp) annotation (Line(points={{-118,
          -49},{-108,-49},{-108,-74},{-82,-74}},  color={255,0,255}));
  connect(zonGroSta.yOpeWin,opeModSel. uOpeWin) annotation (Line(points={{-118,
          -59},{-114,-59},{-114,-58},{-82,-58}},
                                             color={255,127,0}));
  connect(weaBus, AHU.weaBus) annotation (Line(
      points={{40,90},{88,90},{88,24},{95.6,24}},
      color={255,204,51},
      thickness=0.5));
  connect(zonSta.THeaSetOn,TZonSet. TZonHeaSetOcc) annotation (Line(points={{-178,
          -70},{-156,-70},{-156,-96},{-82,-96}},       color={0,0,127}));
  connect(zonSta.THeaSetOff,TZonSet. TZonHeaSetUno) annotation (Line(points={{-178,
          -80},{-152,-80},{-152,-98},{-82,-98}},       color={0,0,127}));
  connect(zonSta.TCooSetOn,TZonSet. TZonCooSetOcc) annotation (Line(points={{-178,
          -75},{-150,-75},{-150,-91},{-82,-91}},       color={0,0,127}));
  connect(opeModSel.yOpeMod, intRep.u)
    annotation (Line(points={{-58,-60},{-42,-60}}, color={255,127,0}));
  connect(opeModSel.yOpeMod, conAHU.uOpeMod) annotation (Line(points={{-58,-60},
          {-50,-60},{-50,6.11111},{48.7,6.11111}}, color={255,127,0}));
  connect(opeModSel.yOpeMod, Building.uOpeMod) annotation (Line(points={{-58,-60},
          {-50,-60},{-50,-20},{140,-20},{140,17.2},{152.2,17.2}},
                                                               color={255,127,0}));
  connect(intRep.y, TZonSet.uOpeMod) annotation (Line(points={{-18,-60},{-14,
          -60},{-14,-80},{-88,-80},{-88,-87},{-82,-87}}, color={255,127,0}));
  connect(TZonSet[1].TZonCooSet, Building.TRooCooSet) annotation (Line(points={{-58,-92},
          {6,-92},{6,-24},{144,-24},{144,22},{153.1,22}},         color={0,0,
          127}));
  connect(TZonSet[1].TZonHeaSet, Building.TRooHeaSet) annotation (Line(points={{-58,
          -100},{8,-100},{8,-26},{146,-26},{146,24.4},{153.1,24.4}},color={0,0,
          127}));
  connect(demLimLev.y, TZonSet.uCooDemLimLev) annotation (Line(points={{-98,
          -116},{-88,-116},{-88,-106},{-82,-106}}, color={255,127,0}));
  connect(demLimLev.y, TZonSet.uHeaDemLimLev) annotation (Line(points={{-98,
          -116},{-88,-116},{-88,-108},{-82,-108}}, color={255,127,0}));
  connect(warUpTim.y, zonSta.warUpTim)
    annotation (Line(points={{-230.8,-74},{-202,-74}}, color={0,0,127}));
  connect(Building.TRooAir, zonSta.TZon) annotation (Line(points={{172.9,26},{184,
          26},{184,-132},{-206,-132},{-206,-86},{-202,-86}}, color={0,0,127}));
  connect(Building.TRooAir, zonOutAirSet.TZon) annotation (Line(points={{172.9,26},
          {184,26},{184,-30},{-70,-30},{-70,34},{-62,34}}, color={0,0,127}));
  connect(reaRep.y, zonGroSta.tNexOcc) annotation (Line(points={{-178,50},{-172,
          50},{-172,-25},{-142,-25}}, color={0,0,127}));
  connect(booRep.y, zonGroSta.uOcc) annotation (Line(points={{-178,20},{-174,20},
          {-174,-23},{-142,-23}}, color={255,0,255}));
  connect(falSta.y, zonGroSta.zonOcc) annotation (Line(points={{-218,0},{-152,0},
          {-152,-21},{-142,-21}}, color={255,0,255}));
  connect(falSta.y, zonGroSta.uWin) annotation (Line(points={{-218,0},{-152,0},
          {-152,-59},{-142,-59}}, color={255,0,255}));
  connect(zonGroSta.TZon, Building.TRooAir) annotation (Line(points={{-142,-57},
          {-146,-57},{-146,-132},{184,-132},{184,26},{172.9,26}},
                                                                color={0,0,127}));
  connect(TZonSet[1].TZonCooSet, conAHU.TZonCooSet) annotation (Line(points={{-58,-92},
          {6,-92},{6,37.2222},{48.7,37.2222}},          color={0,0,127}));
  connect(TZonSet[1].TZonHeaSet, conAHU.TZonHeaSet) annotation (Line(points={{-58,
          -100},{8,-100},{8,38.8889},{48.7,38.8889}},     color={0,0,127}));
  connect(weaBus.TDryBul, conAHU.TOut) annotation (Line(
      points={{40.03,90.03},{46,90.03},{46,35.5556},{48.7,35.5556}},
      color={255,204,51},
      thickness=0.5));
  connect(zonSta.TCooSetOff, TZonSet.TZonCooSetUno) annotation (Line(points={{
          -178,-87},{-154,-87},{-154,-93},{-82,-93}}, color={0,0,127}));
  connect(zonGroSta.uGroOcc, opeModSel.uOcc) annotation (Line(points={{-118,-21},
          {-86,-21},{-86,-46},{-82,-46}}, color={255,0,255}));
  connect(zonGroSta.nexOcc, opeModSel.tNexOcc) annotation (Line(points={{-118,
          -23},{-88,-23},{-88,-48},{-82,-48}}, color={0,0,127}));
  connect(zonGroSta.yCooTim, opeModSel.maxCooDowTim) annotation (Line(points={{
          -118,-27},{-90,-27},{-90,-50},{-82,-50}}, color={0,0,127}));
  connect(zonGroSta.yWarTim, opeModSel.maxWarUpTim) annotation (Line(points={{
          -118,-29},{-92,-29},{-92,-54},{-82,-54}}, color={0,0,127}));
  connect(zonGroSta.yHigOccCoo, opeModSel.uHigOccCoo) annotation (Line(points={
          {-118,-35},{-96,-35},{-96,-52},{-82,-52}}, color={255,0,255}));
  connect(zonSta.yCooTim, zonGroSta.uCooTim) annotation (Line(points={{-178,-65},
          {-176,-65},{-176,-29},{-142,-29}}, color={0,0,127}));
  connect(zonSta.yWarTim, zonGroSta.uWarTim) annotation (Line(points={{-178,-67},
          {-174,-67},{-174,-31},{-142,-31}}, color={0,0,127}));
  connect(zonSta.TCooSetOff, zonGroSta.TCooSetOff) annotation (Line(points={{
          -178,-87},{-160,-87},{-160,-51},{-142,-51}}, color={0,0,127}));
  connect(zonSta.yHigUnoCoo, zonGroSta.uHigUnoCoo) annotation (Line(points={{
          -178,-89},{-162,-89},{-162,-49},{-142,-49}}, color={255,0,255}));
  connect(zonSta.yEndSetUp, zonGroSta.uEndSetUp) annotation (Line(points={{-178,
          -91},{-158,-91},{-158,-53},{-142,-53}}, color={255,0,255}));
  connect(zonToSys.VSumDesAreBreZon_flow, conAHU.VSumDesAreBreZon_flow)
    annotation (Line(points={{2,33},{40,33},{40,27.2222},{48.7,27.2222}}, color=
         {0,0,127}));
  connect(zonToSys.VSumUncOutAir_flow, conAHU.VSumUncOutAir_flow) annotation (
      Line(points={{2,27},{34,27},{34,23.8889},{48.7,23.8889}}, color={0,0,127}));
  connect(zonToSys.VSumSysPriAir_flow, conAHU.VSumSysPriAir_flow) annotation (
      Line(points={{2,21},{26,21},{26,22.2222},{48.7,22.2222}}, color={0,0,127}));
  connect(weather.weaBus, weaBus) annotation (Line(
      points={{-220,90},{40,90}},
      color={255,204,51},
      thickness=0.5));
  connect(conAHU.yAveOutAirFraPlu, zonToSys.yAveOutAirFraPlu) annotation (Line(
        points={{77.3,23.3333},{84,23.3333},{84,52},{-24,52},{-24,32},{-22,32}},
        color={0,0,127}));

  connect(Building.mass_flow_rate[1:21], mulSum.u[1:21]) annotation (Line(
        points={{172.9,29.2},{178,29.2},{178,19.6667},{186.6,19.6667}},
        color={0,0,127}));
  connect(mulSum.y, add2.u2) annotation (Line(points={{203.4,19},{203.4,18},{
          208,18},{208,40},{196,40},{196,48.8},{202.6,48.8}}, color={0,0,127}));
  connect(conAHU.yHea, add2.u1) annotation (Line(points={{77.3,13.3333},{77.3,
          12},{86,12},{86,48},{190,48},{190,52},{196,52},{196,57.2},{202.6,57.2}},
        color={0,0,127}));
  connect(cooDowTim.y, zonSta.cooDowTim) annotation (Line(points={{-230.8,-46},{
          -208,-46},{-208,-70},{-202,-70}}, color={0,0,127}));

  connect(Building.port_b, splVal2.port_3) annotation (Line(points={{156.7,13.2},
          {156.7,98},{238,98}},   color={0,127,255}));

  connect(Building.port_a, massFlowRate.port_b) annotation (Line(points={{169.3,
          13.2},{169.3,78},{184,78}},            color={0,127,255}));
  connect(AHU.port_a1, massFlowRate1.port_b)
    annotation (Line(points={{114,6},{178,6},{178,90}}, color={0,127,255}));
  connect(splVal2.port_1, AHU.port_b) annotation (Line(points={{244,104},{230,
          104},{230,0},{162,0},{162,6},{94,6}}, color={0,127,255}));
  connect(splVal1.port_3, massFlowRate.port_a)
    annotation (Line(points={{210,87},{210,78},{192,78}}, color={0,127,255}));
  connect(splVal1.port_2, massFlowRate1.port_a) annotation (Line(points={{215,92},
          {186,92},{186,90}},                       color={0,127,255}));
  connect(add2.y, hotWaterLoop.u) annotation (Line(points={{219.4,53},{219.4,52},
          {228,52},{228,71},{236,71}}, color={0,0,127}));
  connect(hotWaterLoop.port_a, splVal1.port_1)
    annotation (Line(points={{239,75},{215,75},{215,82}}, color={0,127,255}));
  connect(hotWaterLoop.port_b, splVal2.port_2)
    annotation (Line(points={{253,75},{244,75},{244,92}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(extent={{-260,-140},{200,140}})),
      experiment(
      StartTime = 0,
      StopTime=2592000,
      Interval=600,
      __Dymola_Algorithm="Radau"),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end chicago20_1_heatpump;
