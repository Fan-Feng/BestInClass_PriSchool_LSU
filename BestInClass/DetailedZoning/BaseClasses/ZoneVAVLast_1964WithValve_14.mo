within BestInClass.DetailedZoning.BaseClasses;
model ZoneVAVLast_1964WithValve_14

  package MediumA = Buildings.Media.Air "Medium air";
  package MediumW = Buildings.Media.Water "Medium water";
  parameter String zoneName "Thermal zone name from EnergyPlus";
  parameter Modelica.Units.SI.MassFlowRate mRoo_flow_nominal
    "Nominal mass flowrate of the thermal zone";
  parameter Modelica.Units.SI.VolumeFlowRate VRoo_flow_nominal=
      mRoo_flow_nominal/1.2;
  parameter Modelica.Units.SI.VolumeFlowRate VDisSetMin_flow;
  parameter Modelica.Units.SI.Volume VRoo "Room volumn";
  parameter Modelica.Units.SI.Area AFlo "Room area";
  parameter Modelica.Units.SI.Time samplePeriod=120;
  parameter Boolean allowFlowReversal
    "= false to simplify equations, assuming, but not enforcing, no flow reversal"
    annotation (Evaluate=true);

  Buildings.ThermalZones.EnergyPlus_9_6_0.ThermalZone zon(
    redeclare package Medium = MediumA,
    zoneName=zoneName,
    nPorts=2) "Thermal zone"
    annotation (Placement(transformation(extent={{-40,80},{0,120}})));

  Buildings.Fluid.Sensors.VolumeFlowRate VSupRoo_flow(
    redeclare package Medium = MediumA,
    initType=Modelica.Blocks.Types.Init.InitialState,
    m_flow_nominal=mRoo_flow_nominal,
    allowFlowReversal=allowFlowReversal) "Discharge air flow rate" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,10})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TSupRoo(
    redeclare package Medium = MediumA,
    initType=Modelica.Blocks.Types.Init.InitialState,
    m_flow_nominal=mRoo_flow_nominal,
    allowFlowReversal=allowFlowReversal) "Discharge air temperature"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-20})));

  Modelica.Blocks.Interfaces.RealInput TRooHeaSet annotation (Placement(
        transformation(extent={{-140,20},{-100,60}}), iconTransformation(extent={{-120,40},
            {-100,60}})));
  Modelica.Blocks.Interfaces.RealOutput TDis "Discharge air temperature"
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
        iconTransformation(extent={{100,-10},{120,10}})));
  BestInClass.DetailedZoning.BaseClasses.VAV_Controller
    conVAVRoo(
    final AFlo=AFlo,
    final V_flow_nominal=VRoo_flow_nominal,
    final samplePeriod=samplePeriod,
    kVal=0.01,
    TiVal=60,
    kDam=0.02,
    TiDam=120,
    final VDisSetMin_flow=VDisSetMin_flow,
    VDisHeaSetMax_flow=0.5*VRoo_flow_nominal)
    "Controller for terminal unit for the room"
    annotation (Placement(transformation(extent={{-78,-78},{-58,-58}})));
  Modelica.Blocks.Interfaces.RealInput TRooCooSet annotation (Placement(
        transformation(extent={{-140,-10},{-100,30}}), iconTransformation(
          extent={{-120,10},{-100,30}})));

  Modelica.Fluid.Interfaces.FluidPort_b returnAir(redeclare final package
      Medium = MediumA)  "Return air"
    annotation (Placement(transformation(extent={{-110,-90},{-90,-70}}),
        iconTransformation(extent={{-110,-90},{-90,-70}})));
  Modelica.Fluid.Interfaces.FluidPort_a supplyAir1(redeclare final package
      Medium = MediumA)  "Supply air"
    annotation (Placement(transformation(extent={{-110,70},{-90,90}}),
        iconTransformation(extent={{-110,70},{-90,90}})));
  Modelica.Blocks.Interfaces.RealOutput VDis "Discharge air flowrate"
    annotation (Placement(transformation(extent={{100,16},{120,36}}),
        iconTransformation(extent={{100,16},{120,36}})));
  Modelica.Blocks.Interfaces.RealInput TSupAHU "Supply air temperature"
    annotation (Placement(transformation(extent={{-140,-50},{-100,-10}}),
        iconTransformation(extent={{-120,-30},{-100,-10}})));
  Buildings.Controls.OBC.CDL.Interfaces.IntegerInput uOpeMod
    "Zone operation mode"
    annotation (Placement(transformation(extent={{-140,-70},{-100,-30}}),
        iconTransformation(extent={{-140,-70},{-100,-30}})));
  Buildings.Controls.OBC.CDL.Interfaces.IntegerOutput yZonTemResReq
    "Zone cooling supply air temperature reset request"
    annotation (Placement(transformation(extent={{100,-30},{120,-10}}),
        iconTransformation(extent={{100,-46},{140,-6}})));
  Buildings.Controls.OBC.CDL.Interfaces.IntegerOutput yZonPreResReq
    "Zone static pressure reset requests"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}}),
        iconTransformation(extent={{100,-70},{140,-30}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir "Zone air temperature"
    annotation (Placement(transformation(extent={{100,30},{120,50}}),
        iconTransformation(extent={{100,40},{120,60}})));
  Modelica.Blocks.Interfaces.RealInput qGai_flow[3](each unit="W/m2")
    "Radiant, convective and latent heat input into room (positive if heat gain)"
    annotation (Placement(transformation(extent={{-140,50},{-100,90}}),
        iconTransformation(extent={{-120,40},{-100,60}})));
  BestInClass.DetailedZoning.BaseClasses.VAVWithValve VAVbox(
    redeclare package MediumA = MediumA,
    redeclare package MediumW = MediumW,
    m_flow_nominal=mRoo_flow_nominal,
    VRoo=VRoo,
    allowFlowReversal=allowFlowReversal) "VAV box"
    annotation (Placement(transformation(extent={{-40,-80},{-8,-48}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a
    annotation (Placement(transformation(extent={{10,-112},{30,-92}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b
    annotation (Placement(transformation(extent={{-22,-112},{-2,-92}})));
  Buildings.Fluid.Sensors.MassFlowRate senMasFlo annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=90,
        origin={13,-77})));
  Modelica.Blocks.Interfaces.RealOutput val_y annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={46,-112})));
equation
  connect(VSupRoo_flow.port_b, zon.ports[1]) annotation (Line(points={{-30,20},{
          -30,80},{-21,80},{-21,80.9}},
                                  color={0,127,255}));
  connect(TSupRoo.port_b, VSupRoo_flow.port_a)   annotation (Line(points={{-30,-10},{-30,0}},color={0,127,255}));
  connect(returnAir, returnAir) annotation (Line(points={{-100,-80},{-100,-80},
          {-98,-80},{-98,-80},{-100,-80},{-100,-80}}, color={0,127,255}));
  connect(conVAVRoo.VDis_flow, VSupRoo_flow.V_flow) annotation (Line(points={{-80,
          -69.6667},{-86,-69.6667},{-86,10},{-41,10}},
                                             color={0,0,127}));
  connect(TSupRoo.T, conVAVRoo.TDis) annotation (Line(points={{-41,-20},{-86,
          -20},{-86,-73},{-80,-73}},
                                color={0,0,127}));
  connect(TRooHeaSet, conVAVRoo.TZonHeaSet) annotation (Line(points={{-120,40},
          {-94,40},{-94,-59.6667},{-80,-59.6667}},
                                        color={0,0,127}));
  connect(TRooCooSet, conVAVRoo.TZonCooSet) annotation (Line(points={{-120,10},
          {-96,10},{-96,-61.3333},{-80,-61.3333}},
                                        color={0,0,127}));
  connect(TSupAHU, conVAVRoo.TSupAHU) annotation (Line(points={{-120,-30},{-90,
          -30},{-90,-74.6667},{-80,-74.6667}},
                                color={0,0,127}));
  connect(uOpeMod, conVAVRoo.uOpeMod) annotation (Line(points={{-120,-50},{-80,
          -50},{-80,-76.3333}}, color={255,127,0}));
  connect(conVAVRoo.yZonTemResReq, yZonTemResReq) annotation (Line(points={{-56,
          -66.3333},{-56,-92},{20,-92},{20,-20},{110,-20}},      color={255,127,
          0}));
  connect(yZonPreResReq, yZonPreResReq)
    annotation (Line(points={{110,-60},{110,-60}}, color={255,127,0}));
  connect(conVAVRoo.yZonPreResReq, yZonPreResReq) annotation (Line(points={{-56,
          -69.6667},{-56,-94},{26,-94},{26,-60},{110,-60}},      color={255,127,
          0}));
  connect(conVAVRoo.TZon, zon.TAir) annotation (Line(points={{-80,-68},{-80,
          -100},{24,-100},{24,118},{1,118}},          color={0,0,127}));
  connect(VSupRoo_flow.V_flow, VDis) annotation (Line(points={{-41,10},{-60,10},
          {-60,26},{110,26}}, color={0,0,127}));
  connect(TSupRoo.T, TDis) annotation (Line(points={{-41,-20},{-60,-20},{-60,0},
          {110,0}}, color={0,0,127}));
  connect(zon.TAir, TRooAir) annotation (Line(points={{1,118},{24,118},{24,40},{
          110,40}},  color={0,0,127}));
  connect(qGai_flow, zon.qGai_flow) annotation (Line(points={{-120,70},{-60,70},
          {-60,110},{-42,110}}, color={0,0,127}));
  connect(conVAVRoo.yDam, VAVbox.yVAV) annotation (Line(points={{-56,-59.6667},
          {-56,-57.6},{-43.2,-57.6}},color={0,0,127}));
  connect(VAVbox.y_actual, conVAVRoo.yDam_actual) annotation (Line(points={{-6.4,
          -51.2},{-6.4,-46},{-88,-46},{-88,-71.3333},{-80,-71.3333}}, color={0,0,
          127}));
  connect(TSupRoo.port_a, VAVbox.port_b)
    annotation (Line(points={{-30,-30},{-30,-48},{-32,-48}},
                                                   color={0,127,255}));
  connect(VAVbox.port_b1, port_b) annotation (Line(points={{-8,-70.4},{0,-70.4},
          {0,-88},{-12,-88},{-12,-102}}, color={0,127,255}));
  connect(returnAir, VAVbox.port_a) annotation (Line(points={{-100,-80},{-78,
          -80},{-78,-112},{-32,-112},{-32,-80}},
                                            color={0,127,255}));
  connect(supplyAir1, zon.ports[2]) annotation (Line(points={{-100,80},{-19,80},
          {-19,80.9}}, color={0,127,255}));

  connect(VAVbox.port_a1, senMasFlo.port_b) annotation (Line(points={{-8,-57.6},
          {10,-57.6},{10,-70},{13,-70}}, color={0,127,255}));
  connect(senMasFlo.port_a, port_a) annotation (Line(points={{13,-84},{14,-84},
          {14,-90},{20,-90},{20,-102}}, color={0,127,255}));
  connect(conVAVRoo.yVal, VAVbox.u) annotation (Line(points={{-56,-63},{-50,-63},
          {-50,-70.4},{-43.2,-70.4}}, color={0,0,127}));

  connect(conVAVRoo.yVal, val_y) annotation (Line(points={{-56,-63},{-2,-63},{
          -2,-96},{46,-96},{46,-112}}, color={0,0,127}));
  annotation (Icon(                                             graphics={
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid)}),                        Diagram(
        coordinateSystem(extent={{-100,-140},{100,140}})),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
             Icon(                                             graphics={
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid)}),                        Diagram(
        coordinateSystem(extent={{-100,-140},{100,140}})),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ZoneVAVLast_1964WithValve_14;
