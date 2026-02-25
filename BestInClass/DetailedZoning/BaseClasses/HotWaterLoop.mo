within BestInClass.DetailedZoning.BaseClasses;
model HotWaterLoop
  "Model of a hydronic heating system with energy storage"
  replaceable package MediumA = Buildings.Media.Air(T_default=293.15)
    "Medium model for air";
  replaceable package MediumW = Buildings.Media.Water "Medium model";


  // Total heat pump capacity needed
  parameter Real capHea_nominal = 66401.65;//88548;//60000;//30889;

  parameter Modelica.Units.SI.PressureDifference dpPip_nominal = 1000
    "Main and distribution pipe friction";

  // 阀门压降
  parameter Modelica.Units.SI.PressureDifference dpVal_nominal = 6000
    "Two-way control valve at heat pump";

  // 末端设备压降 (AHU + Reheat coils)
  parameter Modelica.Units.SI.PressureDifference dpRoo_nominal = 6000
    "AHU heating coil and VAV reheat coils";

  // 三通混水阀压降
  parameter Modelica.Units.SI.PressureDifference dpThrWayVal_nominal = 6000
    "Three-way mixing valve";

  // 循环泵总扬程
  parameter Modelica.Units.SI.PressureDifference dp_nominal=
      dpPip_nominal + dpVal_nominal + dpRoo_nominal + dpThrWayVal_nominal
    "Total pump head = 150 kPa";


  // Room model
   replaceable package Medium = MediumW "Medium model for water";

  // Parameters
  parameter Modelica.Fluid.Types.Dynamics energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState
    "Type of energy balance: dynamic (3 initialization options) or steady state";
  parameter Modelica.Units.SI.MassFlowRate AHUAir_Nominal=4.26;

  parameter Modelica.Units.SI.MassFlowRate AHUHotWater_Nominal= AHUAir_Nominal*1006*(16.7 - 8.5)/4200/10;
  parameter Modelica.Units.SI.MassFlowRate BuildingAir_Nominal= 3.746187;

  parameter Modelica.Units.SI.MassFlowRate BuildingHotWater_Nominal= BuildingAir_Nominal*1006*(30 - 16.7)/4200/(55 - 45);

  parameter Modelica.Units.SI.MassFlowRate PumpHotWater_Nominal = AHUHotWater_Nominal + BuildingHotWater_Nominal;


  // Simple parameters for heat pump
  parameter Real mHeaWat_flow_nominal = capHea_nominal/4200/10
    "Nominal mass flow rate for heating water";

  // Parameters for outdoor temperature reset
  parameter Real TOut_min = 273.15 - 10 "Minimum outdoor temperature for reset curve [K]";
  parameter Real TOut_max = 273.15 + 15 "Maximum outdoor temperature for reset curve [K]";

  // DISTRIBUTION (SECONDARY) temperature setpoints
  parameter Real TDist_max = 273.15 + 75 "Maximum distribution temperature setpoint [K]";
  parameter Real TDist_min = 273.15 + 35 "Minimum distribution temperature setpoint [K]";

  // HEAT PUMP (PRIMARY) temperature offset
  parameter Real THp_offset = 10 "Heat pump temperature offset above distribution [K]";

  // NEW: Valve control parameters
  parameter Real valveMin = 0.15 "Minimum valve position when heat pump is running [0-1]";
  parameter Real valveOff = 0.0 "Valve position when heat pump is off [0-1]";

  // NEW: Freeze protection parameters
  parameter Real T_freeze_protection = 273.15 + 5 "Minimum water temperature for freeze protection [K]";
  parameter Real T_min_operation = 273.15 + 10 "Minimum temperature for normal operation [K]";

  // Heat pump data parameter - minimal configuration to avoid issues

  Buildings.Fluid.Movers.Preconfigured.SpeedControlled_y pumRad(
    redeclare package Medium = MediumW,
    m_flow_nominal=PumpHotWater_Nominal,
    dp_nominal=dp_nominal,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Pump that serves the radiators" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={616,102})));

  Buildings.Controls.OBC.CDL.Reals.PIDWithReset conPum(
    yMax=1,
    Td=60,
    yMin=0.05,
    k=0.5,
    Ti=15) "Controller for pump"
    annotation (Placement(transformation(extent={{516,152},{536,172}})));
  Buildings.Fluid.Sensors.RelativePressure dpSen(redeclare package Medium =
        MediumW)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={576,102})));
  Buildings.Fluid.Actuators.Valves.ThreeWayEqualPercentageLinear thrWayVal(
    redeclare package Medium = MediumW,
    dpValve_nominal=dpThrWayVal_nominal,
    l={0.01,0.01},
    tau=10,
    m_flow_nominal=PumpHotWater_Nominal,
    dpFixed_nominal={100,0},
    use_inputFilter=false,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) "Three-way valve"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={616,8})));
  Buildings.Controls.OBC.CDL.Reals.PIDWithReset conVal(
    yMax=1,
    yMin=0,
    xi_start=1,
    Td=60,
    k=0.1,
    Ti=120) "Controller for pump"
    annotation (Placement(transformation(extent={{542,42},{562,62}})));

  Buildings.Fluid.Sensors.TemperatureTwoPort temSup(
    redeclare package Medium = MediumW, m_flow_nominal=PumpHotWater_Nominal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={616,132})));
  Buildings.Fluid.Sensors.TemperatureTwoPort temRet(
    redeclare package Medium = MediumW,
    m_flow_nominal=mHeaWat_flow_nominal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={676,134})));
  Buildings.Controls.OBC.CDL.Reals.Hysteresis hysPum(uLow=0.01, uHigh=0.02)
    "Hysteresis for pump"
    annotation (Placement(transformation(extent={{402,142},{422,162}})));
  Buildings.Controls.OBC.CDL.Reals.MultiplyByParameter gain(k=1/dp_nominal)
    "Gain used to normalize pressure measurement signal"
    annotation (Placement(transformation(extent={{556,92},{536,112}})));
  Buildings.Fluid.FixedResistances.Junction splVal(
    dp_nominal={dpPip_nominal,0,0},
    m_flow_nominal=mHeaWat_flow_nominal*{1,-1,-1},
    redeclare package Medium = MediumW,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={694,8})));

  Buildings.Controls.OBC.CDL.Conversions.BooleanToReal booToRea
    "Conversion from boolean to real signal"
    annotation (Placement(transformation(extent={{476,152},{496,172}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant TRooOff2(k=1)
    "Low room temperature set point to switch heating off"
    annotation (Placement(transformation(extent={{354,140},{374,160}})));
  AirToWater hpAw(
    is_rev=false,
    show_T=true,
    redeclare final package MediumHeaWat = Medium,
    final dat=datHpAw,
    final energyDynamics= Modelica.Fluid.Types.Dynamics.FixedInitial)
    "Air-to-water heat pump"
  annotation (Placement(transformation(extent={{394,-66},{414,-46}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat1(filNam=
        Modelica.Utilities.Files.loadResource("modelica://BestInClass/Resources/weather/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"))
  annotation (Placement(transformation(extent={{-15,-16},{15,16}}, rotation=0, origin={59,-40})));

  Buildings.Fluid.Sensors.TemperatureTwoPort temRet1(redeclare package Medium =
        MediumW, m_flow_nominal=mHeaWat_flow_nominal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={474,-56})));
  Buildings.Fluid.Sensors.TemperatureTwoPort temRet2(redeclare package Medium =
        MediumW, m_flow_nominal=mHeaWat_flow_nominal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={500,-110})));
  Buildings.Fluid.Sensors.TemperatureTwoPort temRet3(redeclare package Medium =
        MediumW, m_flow_nominal=mHeaWat_flow_nominal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={190,-66})));
  Buildings.Fluid.Sensors.TemperatureTwoPort temSup1(redeclare package Medium =
        MediumW, m_flow_nominal=mHeaWat_flow_nominal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={616,74})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate
    annotation (Placement(transformation(extent={{580,-66},{600,-46}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={676,-64})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate2
    annotation (Placement(transformation(extent={{426,-120},{406,-100}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate3
    annotation (Placement(transformation(extent={{268,-76},{288,-56}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate4
    annotation (Placement(transformation(extent={{620,146},{640,166}})));

  Modelica.Fluid.Sensors.MassFlowRate massFlowRate5
    annotation (Placement(transformation(extent={{432,-66},{452,-46}})));
  parameter Buildings.Templates.Components.Data.HeatPump datHpAw(
    final cpHeaWat_default=4200,
    final cpSou_default=hpAw.cpSou_default,
    final typ=hpAw.typ,
    final is_rev=hpAw.is_rev,
    final typMod=hpAw.typMod,
    capHea_nominal = capHea_nominal,
    mHeaWat_flow_nominal = mHeaWat_flow_nominal,
    dpHeaWat_nominal=Buildings.Templates.Data.Defaults.dpHeaWatHp,
    THeaWatSup_nominal=Buildings.Templates.Data.Defaults.THeaWatSupMed,
    mChiWat_flow_nominal=datHpAw.capCoo_nominal/abs(datHpAw.TChiWatSup_nominal -
        Buildings.Templates.Data.Defaults.TChiWatRet)/Buildings.Utilities.Psychrometrics.Constants.cpWatLiq,
    capCoo_nominal=40000,
    TChiWatSup_nominal=Buildings.Templates.Data.Defaults.TChiWatSup,
    TSouCoo_nominal=Buildings.Templates.Data.Defaults.TOutHpCoo,
    TSouHea_nominal=Buildings.Templates.Data.Defaults.TOutHpHeaLow,
    perFit(hea(
        P=datHpAw.capHea_nominal/Buildings.Templates.Data.Defaults.COPHpAwHea,
        coeQ={-4.2670305442,-0.7381077035,6.0049480456,0,0},
        coeP={-4.9107455513,5.3665308366,0.5447612754,0,0},
        TRefLoa=Buildings.Templates.Data.Defaults.THeaWatRetMed,
        TRefSou=Buildings.Templates.Data.Defaults.TOutHpHeaLow),
        coo(
        P=datHpAw.capCoo_nominal/Buildings.Templates.Data.Defaults.COPHpAwCoo,
        coeQ={-2.2545246871,6.9089257665,-3.6548225094,0,0},
        coeP={-5.8086010402,1.6894933858,5.1167787436,0,0},
        TRefLoa=Buildings.Templates.Data.Defaults.TChiWatRet,
        TRefSou=Buildings.Templates.Data.Defaults.TOutHpCoo)))
    "Reversible AWHP parameters parameters"
    annotation (Placement(transformation(extent={{290,150},{310,170}})));

  Buildings.Controls.OBC.CDL.Conversions.BooleanToReal booToReaBoi
    "Signal converter for boiler"
    annotation (Placement(transformation(extent={{204,94},{224,114}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate6
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={676,96})));
  Buildings.Fluid.Sensors.TemperatureTwoPort temSup2(redeclare package Medium =
        MediumW, m_flow_nominal=mHeaWat_flow_nominal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={642,8})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate7
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={616,40})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate8
    annotation (Placement(transformation(extent={{660,-2},{680,18}})));
  Buildings.Controls.OBC.CDL.Reals.Hysteresis
                                    hysPum1(uLow=0.3, uHigh=0.5)
               "Hysteresis for pump"
    annotation (Placement(transformation(extent={{134,108},{154,128}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a
    annotation (Placement(transformation(extent={{610,270},{630,290}}),
    iconTransformation(extent={{-80,100},{-60,120}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b
    annotation (Placement(transformation(extent={{650,270},{670,290}}),
    iconTransformation(extent={{60,100},{80,120}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-20,138},{20,178}}),
    iconTransformation(extent={{-120,50},{-80,90}})));
  Buildings.Templates.Components.Interfaces.Bus bus "HP control bus"
    annotation (Placement(transformation(extent={{224,2},{264,42}}),
        iconTransformation(extent={{-276,6},{-236,46}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant THeaWatSupSet(k=273.15 + 60,
      y(final unit="K", displayUnit="degC")) "HW supply temperature setpoint"
  annotation (Placement(transformation(extent={{70,14},{90,34}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant THeaWatSupSet1(k=273.15 + 50,
      y(final unit="K", displayUnit="degC")) "HW supply temperature setpoint"
  annotation (Placement(transformation(extent={{462,42},{482,62}})));
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = Medium,
      nPorts=1)
    "Fixed pressure boundary condition, required to set a reference pressure"
    annotation (Placement(transformation(extent={{48,-92},{66,-74}})));
  Buildings.Fluid.FixedResistances.PressureDrop res(
    redeclare package Medium = MediumW,
    m_flow_nominal=PumpHotWater_Nominal,
    dp_nominal=100,
    linearized=true) "Flow resistance to decouple pressure state from boundary"
    annotation (Placement(transformation(extent={{112,-92},{94,-76}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=PumpHotWater_Nominal,
    from_dp=true,
    dpValve_nominal=dpVal_nominal)
    annotation (Placement(transformation(extent={{514,-66},{534,-46}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Constant y1Hea(k=true)
    annotation (Placement(transformation(extent={{94,54},{114,74}})));
  Buildings.Controls.OBC.CDL.Logical.TrueDelay delHp(delayTime=120)
    annotation (Placement(transformation(extent={{226,156},{246,176}})));
equation
  connect(pumRad.port_b, dpSen.port_a)
                                     annotation (Line(
      points={{616,112},{576,112}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dpSen.port_b, pumRad.port_a)
                                     annotation (Line(
      points={{576,92},{616,92}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(temSup.T, conVal.u_m) annotation (Line(
      points={{605,132},{594,132},{594,6},{552,6},{552,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conVal.y, thrWayVal.y) annotation (Line(
      points={{564,52},{592,52},{592,8},{604,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumRad.port_b, temSup.port_a) annotation (Line(
      points={{616,112},{616,122}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(conPum.y, pumRad.y) annotation (Line(
      points={{538,162},{596,162},{596,102},{604,102}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.u, dpSen.p_rel) annotation (Line(
      points={{558,102},{567,102}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, conPum.u_m) annotation (Line(
      points={{534,102},{526,102},{526,150}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(hysPum.y, conPum.trigger) annotation (Line(points={{424,152},{468,152},
          {468,142},{520,142},{520,150}},
                                  color={255,0,255}));
  connect(hysPum.y, booToRea.u)
    annotation (Line(points={{424,152},{468,152},{468,162},{474,162}},
                                               color={255,0,255}));
  connect(booToRea.y, conPum.u_s)
    annotation (Line(points={{498,162},{514,162}},
                                                 color={0,0,127}));
  connect(conVal.trigger, hysPum.y) annotation (Line(points={{546,40},{546,34},
          {528,34},{528,98},{466,98},{466,152},{424,152}},
                                                       color={255,0,255}));
  connect(TRooOff2.y, hysPum.u)
    annotation (Line(points={{376,150},{388,150},{388,152},{400,152}},
                                               color={0,0,127}));
  connect(weaDat1.weaBus, hpAw.busWea) annotation (Line(
      points={{74,-40},{398,-40},{398,-46}},
      color={255,204,51},
      thickness=0.5));
  connect(pumRad.port_a, temSup1.port_b)
    annotation (Line(points={{616,92},{616,84}}, color={0,127,255}));
  connect(massFlowRate.port_b, thrWayVal.port_1) annotation (Line(points={{600,-56},
          {616,-56},{616,-2}}, color={0,127,255}));
  connect(splVal.port_2, massFlowRate1.port_a)
    annotation (Line(points={{694,-2},{694,-54},{676,-54}},
                                                  color={0,127,255}));
  connect(massFlowRate1.port_b, temRet2.port_b) annotation (Line(points={{676,-74},
          {676,-110},{510,-110}}, color={0,127,255}));
  connect(temRet2.port_a, massFlowRate2.port_a)
    annotation (Line(points={{490,-110},{426,-110}}, color={0,127,255}));
  connect(massFlowRate2.port_b, hpAw.port_a) annotation (Line(points={{406,-110},
          {364,-110},{364,-56},{394,-56}}, color={0,127,255}));
  connect(temRet3.port_b, massFlowRate3.port_a)
    annotation (Line(points={{200,-66},{268,-66}}, color={0,127,255}));
  connect(massFlowRate3.port_b, hpAw.port_a) annotation (Line(points={{288,-66},
          {364,-66},{364,-56},{394,-56}}, color={0,127,255}));
  connect(temSup.port_b, massFlowRate4.port_a) annotation (Line(points={{616,142},
          {616,156},{620,156}}, color={0,127,255}));
  connect(massFlowRate5.port_b, temRet1.port_a)
    annotation (Line(points={{452,-56},{464,-56}}, color={0,127,255}));
  connect(massFlowRate5.port_a, hpAw.port_b)
    annotation (Line(points={{432,-56},{414,-56}}, color={0,127,255}));
  connect(temRet.port_b, massFlowRate6.port_a)
    annotation (Line(points={{676,124},{676,106}}, color={0,127,255}));
  connect(massFlowRate6.port_b, splVal.port_1)
    annotation (Line(points={{676,86},{676,18},{694,18}},
                                                 color={0,127,255}));
  connect(thrWayVal.port_3, temSup2.port_a)
    annotation (Line(points={{626,8},{632,8}}, color={0,127,255}));
  connect(temSup1.port_a, massFlowRate7.port_b)
    annotation (Line(points={{616,64},{616,50}}, color={0,127,255}));
  connect(massFlowRate7.port_a, thrWayVal.port_2)
    annotation (Line(points={{616,30},{616,18}}, color={0,127,255}));
  connect(massFlowRate8.port_b, splVal.port_3)
    annotation (Line(points={{680,8},{684,8}}, color={0,127,255}));
  connect(massFlowRate8.port_a, temSup2.port_b)
    annotation (Line(points={{660,8},{652,8}}, color={0,127,255}));
  connect(hysPum1.y, booToReaBoi.u) annotation (Line(points={{156,118},{192,118},
          {192,104},{202,104}}, color={255,0,255}));
  connect(u, hysPum1.u) annotation (Line(points={{0,158},{100,158},{100,118},{132,
          118}},     color={0,0,127}));
  connect(temRet.port_a, port_b) annotation (Line(points={{676,144},{684,144},{
          684,260},{660,260},{660,280}}, color={0,127,255}));
  connect(massFlowRate4.port_b, port_a) annotation (Line(points={{640,156},{648,
          156},{648,260},{620,260},{620,280}}, color={0,127,255}));
  connect(THeaWatSupSet.y, bus.TSet) annotation (Line(points={{92,24},{92,22},{
          244,22}},
                color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(bus, hpAw.bus) annotation (Line(
      points={{244,22},{296,22},{296,18},{404,18},{404,-46}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(THeaWatSupSet1.y, conVal.u_s) annotation (Line(points={{484,52},{540,52}},
                              color={0,0,127}));
  connect(res.port_b,bou. ports[1])
    annotation (Line(points={{94,-84},{80,-84},{80,-83},{66,-83}},
                                                          color={0,127,255}));
  connect(res.port_a, temRet3.port_a) annotation (Line(points={{112,-84},{168,-84},
          {168,-66},{180,-66}}, color={0,127,255}));
  connect(booToReaBoi.y, val.y) annotation (Line(points={{226,104},{452,104},{
          452,-28},{524,-28},{524,-44}}, color={0,0,127}));
  connect(temRet1.port_b, val.port_a)
    annotation (Line(points={{484,-56},{514,-56}}, color={0,127,255}));
  connect(val.port_b, massFlowRate.port_a)
    annotation (Line(points={{534,-56},{580,-56}}, color={0,127,255}));
  connect(y1Hea.y, bus.y1Hea) annotation (Line(points={{116,64},{244,64},{244,
          22}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(delHp.y, bus.y1) annotation (Line(points={{248,166},{248,164},{256,
          164},{256,52},{244,52},{244,22}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(hysPum1.y, delHp.u) annotation (Line(points={{156,118},{156,116},{196,
          116},{196,166},{224,166}}, color={255,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{20,-140},
            {720,280}})),
Documentation(info="<html>
<p>
This example demonstrates the implementation of a building that has the following properties:</p>
<p>
There are two rooms. (For simplicity, we only modeled two rooms, but more could be added.)
Each room is modeled using a dynamic model for the heat transfer through the opaque constructions.
The room <code>roo1</code> has a south- and west-facing window, the room <code>roo2</code> has a south- and
east-facing window.
The rooms are modeled as if they were in an intermediate floor, with the same temperature above and below
the room. The rooms share one common wall. The north facing wall is modeled as a partition wall, i.e., both
surfaces have the same boundary conditions.
Weather data are used from Chicago.
</p>
<p>
There is a hydronic heating system with a boiler, a storage tank and a radiator with
a thermostatic valve in each room.
The supply water temperature setpoint
is reset based on the outside temperature. A three-way-valve mixes the water from the tank with
the water from the radiator return. The pump has a variable frequency drive that controls the pump head.
</p>
<p>
A finite state machine is used to switch the boiler and its pump on and off.
The boiler and pump are switched on when the temperature
at the top of the tank is less then 1 Kelvin above the setpoint temperature
for the supply water temperature of the radiator loop.
The boiler and pump are switched off when the temperature at the bottom
of the tank reaches 55 degree Celsius.
The state transition of the finite state machine
is such that first the pump of the boiler is switched on.
Ten seconds later, the boiler will be switched on.
When the tank reaches its temperature, the boiler
is switched off, and ten seconds later, the pump will be switched off.
</p>
<p>
The building has a controlled fresh air supply. A heat recovery ventilator is used to preheat the
outside air.
Each room has a model for the leakage of the facade. If supply and exhaust air are unbalanced, then
the difference in air supply will flow through this leakage model.
</p>
<p>
The hydronic heating system is connected to an expansion vessel.
Some medium models for water compute the density as a function of
temperature, while others assume a constant density.
If the density is modeled as a function of temperature, then the water
volume will increase when heated, and the expansion vessel will
accumulate the added volume. As the water cools, this volume will flow from
the expansion vessel into the hydronic heating system.
If the medium model assumes the density to be constant, then the
expansion vessel provides a reference pressure for the hydronic heating
system.
</p>
<p>
The cooling of the two rooms is controlled using the
temperature of <code>roo1</code>.
The set point for mechanical cooling is <i>25</i> degree Celsius,
with a proportional band of <i>1</i> Kelvin.
</p>
<p>
If the room air temperature is above <i>22</i> degree Celsius,
the free cooling is enabled by opening the bypass damper of the heat
recovery. Free cooling is only allowed if the outside air temperature
is above <i>16</i> degree Celsius and <i>1</i> Kelvin below the
room air temperature.
</p>
<p>
The cooling control is implemented in the model
<a href=\"modelica://Buildings.Examples.HydronicHeating.TwoRoomsWithStorage.CoolingControl\">
Buildings.Examples.HydronicHeating.TwoRoomsWithStorage.CoolingControl</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
September 15, 2023, by Michael Wetter:<br/>
Changed tank to tank with enhanced stratification, and added junctions at the tank inlet and outlet.
</li>
<li>
February 24, 2023, by Michael Wetter:<br/>
Changed test to enable heating system which is now based on the outside air temperature,
rather than the room air temperature, as the latter can fall below the threshold
such as during window ventilation.
</li>
<li>
August 22, 2022, by Hongxiang Fu:<br/>
Replaced <code>pumRad</code> with a preconfigured pump model.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/2668\">issue #2668</a>.
</li>
<li>
June 9, 2022, by Michael Wetter:<br/>
Corrected outdoor temperature in instance <code>TOutSwi</code> at which system switches on and off.<br/>
This is for <a href=\"https://github.com/lbl-srg/modelica-buildings/issues/3059\">issue 3059</a>.
</li>
<li>
September 21, 2021, by Michael Wetter:<br/>
Updated controls to use blocks from the CDL package. Replaced PID controller with CDL version.<br/>
This is for <a href=\"https://github.com/lbl-srg/modelica-buildings/issues/2638\">issue 2638</a>.
</li>
<li>
September 16, 2021, by Michael Wetter:<br/>
Removed assignment of parameter <code>lat</code> as this is now obtained from the weather data reader.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1477\">IBPSA, #1477</a>.
</li>
<li>
March 4, 2021, by David Blum:<br/>
Changed <code>dpVal_nominal</code> to 6 kPa.
This is for <a href=\"https://github.com/lbl-srg/modelica-buildings/issues/2378\">issue 2378</a>.
</li>
<li>
April 6, 2016, by Michael Wetter:<br/>
Replaced <code>Modelica_StateGraph2</code> with <code>Modelica.StateGraph</code>.
This is for <a href=\"https://github.com/lbl-srg/modelica-buildings/issues/504\">issue 504</a>.
</li>
<li>
March 1, 2016, by Michael Wetter:<br/>
Removed parameter <code>dynamicBalance</code>.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/484\">#484</a>.
</li>
<li>
January 22, 2016, by Michael Wetter:<br/>
Corrected type declaration of pressure difference.
This is
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/404\">#404</a>.
</li>
<li>
September 24, 2015 by Michael Wetter:<br/>
Set default temperature for medium to avoid conflicting
start values for alias variables of the temperature
of the building and the ambient air.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/426\">issue 426</a>.
</li>
<li>
January 12, 2015 by Michael Wetter:<br/>
Made media instances replaceable.
This was done to simplify the numerical benchmarks.
</li>
<li>
December 22, 2014 by Michael Wetter:<br/>
Removed <code>Modelica.Fluid.System</code>
to address issue
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/311\">#311</a>.
</li>
<li>
October 15, 2013, by Michael Wetter:<br/>
Added free cooling and mechanical cooling.
</li>
<li>
October 14, 2013, by Michael Wetter:<br/>
Corrected wrong pump head for radiator and for boiler pump.
</li>
<li>
March 1, 2013, by Michael Wetter:<br/>
Removed assignment of <code>Kv_SI</code> because this is now a protected parameter.
</li>
<li>
December 6, 2011, by Michael Wetter:<br/>
Added internal heat gains, which were set to zero in the previous version.
</li>
<li>
January 30, 2009, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"),
    __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Examples/HydronicHeating/TwoRoomsWithStorage.mos"
        "Simulate and plot"),
    experiment(StopTime=604800, Tolerance=1e-6),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
end HotWaterLoop;
