within BestInClass.DetailedZoning.BaseClasses;
model dual_condensing_Boiler_system

  parameter Real alpha = 1  "Sizing factor for overall system design capacity and mass flow rate";

  package MediumAir = Buildings.Media.Air(extraPropertiesNames={"CO2"}) "Buildings library air media package with CO2";
  package MediumCHW = Buildings.Media.Water "Medium model for chilled water";
  package MediumHeaWat = Buildings.Media.Water "Medium model for heating water";

  parameter Modelica.Units.SI.Pressure dP_nominal=478250
    "Nominal pressure drop";
  package MediumCW = Buildings.Media.Water
    "Medium model";
  BestInClass.DetailedZoning.BaseClasses.BoilerPlant
   boiWatPla(secPumCon(conPI(k=0.001)), redeclare package MediumHW =
        MediumHeaWat,
        alpha=alpha) "Boiler hot water plant"
    annotation (Placement(transformation(extent={{8,-16},{28,4}})));
  WriteWaterPlant writeWaterPlant
    annotation (Placement(transformation(extent={{-32,-16},{-12,6}})));
  Modelica.Blocks.Sources.Constant THWSupSet(k=273.15 + 80)
    "Hot water supply temperature setpoint"
    annotation (Placement(transformation(extent={{-74,4},{-54,24}})));
  Modelica.Blocks.Sources.Constant dpHotWatStaSet(k=478250*0.25)
    "Secondary hot water loop static Pressure setpoint"
    annotation (Placement(transformation(extent={{-74,-32},{-54,-12}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a
    annotation (Placement(transformation(extent={{90,2},{110,22}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b
    annotation (Placement(transformation(extent={{92,-22},{112,-2}})));
  Buildings.Fluid.Sensors.RelativePressure senRelPre(redeclare package Medium =
        Modelica.Media.Interfaces.PartialMedium)                                  annotation (Placement(transformation(extent={{48,12},
            {68,32}})));
equation
  connect(THWSupSet.y, writeWaterPlant.TW_set_in) annotation (Line(points={{-53,
          14},{-40,14},{-40,0},{-34,0}}, color={0,0,127}));
  connect(dpHotWatStaSet.y, writeWaterPlant.dp_set_in) annotation (Line(points={
          {-53,-22},{-40,-22},{-40,-10},{-34,-10}}, color={0,0,127}));
  connect(senRelPre.p_rel, boiWatPla.dp) annotation (Line(points={{58,13},{58,
          -36},{-6,-36},{-6,-6},{6,-6}},
                                    color={0,0,127}));
  connect(writeWaterPlant.TW_set_out, boiWatPla.THWSet)
    annotation (Line(points={{-11,0},{6,0}},         color={0,0,127}));
  connect(writeWaterPlant.dp_set_out, boiWatPla.dpSet)
    annotation (Line(points={{-11,-10},{-4,-10},{-4,-12},{6,-12}},
                                                 color={0,0,127}));
  connect(boiWatPla.port_b, port_b) annotation (Line(points={{28,-12},{102,-12}},
                               color={0,127,255}));
  connect(boiWatPla.port_a, port_a) annotation (Line(points={{28,-2},{84,-2},{
          84,12},{100,12}},
                         color={0,127,255}));
  connect(senRelPre.port_a, port_b) annotation (Line(points={{48,22},{44,22},{44,
          -12},{102,-12}}, color={0,127,255}));
  connect(senRelPre.port_b, port_a) annotation (Line(points={{68,22},{84,22},{84,
          12},{100,12}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end dual_condensing_Boiler_system;
