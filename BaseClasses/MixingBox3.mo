within BestInClass.DetailedZoning.BaseClasses;
model MixingBox3 "Outside air mixing box with non-interlocked air dampers"

  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium in the component";
  import Modelica.Constants;

  parameter Boolean allowFlowReversal=true
    "= false to simplify equations, assuming, but not enforcing, no flow reversal";

  parameter Boolean use_deltaM=true
    "Set to true to use deltaM for turbulent transition, else ReC is used";
  parameter Real deltaM=0.3
    "Fraction of nominal mass flow rate where transition to turbulent occurs";
  parameter Modelica.Units.SI.Velocity v_nominal=1 "Nominal face velocity";

  parameter Boolean roundDuct=false
    "Set to true for round duct, false for square cross section";
  parameter Real ReC=4000
    "Reynolds number where transition to turbulent starts";

  //parameter Boolean dp_nominalIncludesDamper=false
   // "set to true if dp_nominal includes the pressure loss of the open damper";

  parameter Modelica.Units.SI.MassFlowRate mOut_flow_nominal
    "Mass flow rate outside air damper";
  parameter Modelica.Units.SI.PressureDifference dpOut_nominal(min=0,
      displayUnit="Pa") "Pressure drop outside air leg";

  parameter Modelica.Units.SI.MassFlowRate mRec_flow_nominal
    "Mass flow rate recirculation air damper";
  parameter Modelica.Units.SI.PressureDifference dpRec_nominal(min=0,
      displayUnit="Pa") "Pressure drop recirculation air leg";

  parameter Modelica.Units.SI.MassFlowRate mExh_flow_nominal
    "Mass flow rate exhaust air damper";
  parameter Modelica.Units.SI.PressureDifference dpExh_nominal(min=0,
      displayUnit="Pa") "Pressure drop exhaust air leg";

  parameter Boolean from_dp=true
    "= true, use m_flow = f(dp) else dp = f(m_flow)";
  parameter Boolean linearized=false
    "= true, use linear relation between m_flow and dp for any flow rate";
  parameter Boolean use_constant_density=true
    "Set to true to use constant density for flow friction";
  parameter Real a=-1.51 "Coefficient a for damper characteristics";
  parameter Real b=0.105*90 "Coefficient b for damper characteristics";
  parameter Real yL=15/90 "Lower value for damper curve";
  parameter Real yU=55/90 "Upper value for damper curve";
  parameter Real k0=1E6
    "Flow coefficient for y=0, k0 = pressure drop divided by dynamic pressure";
  parameter Real k1=0.45
    "Flow coefficient for y=1, k1 = pressure drop divided by dynamic pressure";

  parameter Modelica.Units.SI.Time riseTime=15
    "Rise time of the filter (time to reach 99.6 % of an opening step)";
  parameter Modelica.Blocks.Types.Init init=Modelica.Blocks.Types.Init.InitialOutput
    "Type of initialization (no init/steady state/initial state/initial output)";
  parameter Real y_start=1 "Initial value of output";

  Modelica.Blocks.Interfaces.RealInput yRet(
    min=0,
    max=1,
    final unit="1") "Return damper position (0: closed, 1: open)";
  Modelica.Blocks.Interfaces.RealInput yOut(
    min=0,
    max=1,
    final unit="1") "Outdoor air damper signal (0: closed, 1: open)";
  Modelica.Blocks.Interfaces.RealInput yExh(
    min=0,
    max=1,
    final unit="1") "Exhaust air damper signal (0: closed, 1: open)";

  Modelica.Fluid.Interfaces.FluidPort_a port_Out(redeclare package Medium = Medium,
      m_flow(start=0, min=if allowFlowReversal then -Constants.inf else 0))
    "Fluid connector a (positive design flow direction is from port_a to port_b)";
  Modelica.Fluid.Interfaces.FluidPort_b port_Exh(redeclare package Medium = Medium,
      m_flow(start=0, max=if allowFlowReversal then +Constants.inf else 0))
    "Fluid connector b (positive design flow direction is from port_a to port_b)";
  Modelica.Fluid.Interfaces.FluidPort_a port_Ret(redeclare package Medium = Medium,
      m_flow(start=0, min=if allowFlowReversal then -Constants.inf else 0))
    "Fluid connector a (positive design flow direction is from port_a to port_b)";
  Modelica.Fluid.Interfaces.FluidPort_b port_Sup(redeclare package Medium = Medium,
      m_flow(start=0, max=if allowFlowReversal then +Constants.inf else 0))
    "Fluid connector b (positive design flow direction is from port_a to port_b)";

  Buildings.Fluid.Actuators.Dampers.Exponential damOut(
    redeclare package Medium = Medium,
    dpDamper_nominal=0,
    from_dp=from_dp,
    linearized=linearized,
    use_deltaM=use_deltaM,
    deltaM=deltaM,
    roundDuct=roundDuct,
    ReC=ReC,
    a=a,
    b=b,
    yL=yL,
    yU=yU,
    k0=k0,
    k1=k1,
    use_constant_density=use_constant_density,
    allowFlowReversal=allowFlowReversal,
    m_flow_nominal=mOut_flow_nominal,
    use_inputFilter=true,
    final riseTime=riseTime,
    final init=init,
    y_start=y_start) "Outdoor air damper";

  Buildings.Fluid.Actuators.Dampers.Exponential damExh(
    redeclare package Medium = Medium,
    m_flow_nominal=mExh_flow_nominal,
    dpDamper_nominal=0,
    from_dp=from_dp,
    linearized=linearized,
    use_deltaM=use_deltaM,
    deltaM=deltaM,
    roundDuct=roundDuct,
    ReC=ReC,
    a=a,
    b=b,
    yL=yL,
    yU=yU,
    k0=k0,
    k1=k1,
    use_constant_density=use_constant_density,
    allowFlowReversal=allowFlowReversal,
    use_inputFilter=true,
    final riseTime=riseTime,
    final init=init,
    y_start=y_start) "Exhaust air damper";

  Buildings.Fluid.Actuators.Dampers.Exponential damRet(
    redeclare package Medium = Medium,
    m_flow_nominal=mRec_flow_nominal,
    dpDamper_nominal=0,
    from_dp=from_dp,
    linearized=linearized,
    use_deltaM=use_deltaM,
    deltaM=deltaM,
    roundDuct=roundDuct,
    ReC=ReC,
    a=a,
    b=b,
    yL=yL,
    yU=yU,
    k0=k0,
    k1=k1,
    use_constant_density=use_constant_density,
    allowFlowReversal=allowFlowReversal,
    use_inputFilter=true,
    final riseTime=riseTime,
    final init=init,
    y_start=y_start) "Return air damper";

  Modelica.Fluid.Interfaces.FluidPort_a port_a
    annotation (Placement(transformation(extent={{-110,28},{-90,48}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b
    annotation (Placement(transformation(extent={{90,30},{110,50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1
    annotation (Placement(transformation(extent={{-110,-90},{-90,-70}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1
    annotation (Placement(transformation(extent={{90,-90},{110,-70}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-60,120})));
  Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={60,120})));
  Buildings.Fluid.Actuators.Dampers.Exponential damOA(
    redeclare final package Medium = Medium,
    final m_flow_nominal=mOut_flow_nominal,
    final dpDamper_nominal=dpDamOut_nominal,
    final dpFixed_nominal=dpFixOut_nominal,
    final from_dp=from_dp,
    final linearized=linearized,
    final use_deltaM=use_deltaM,
    final deltaM=deltaM,
    final roundDuct=roundDuct,
    final ReC=ReC,
    final a=a,
    final b=b,
    final yL=yL,
    final yU=yU,
    final l=l,
    final k1=k1,
    final use_constant_density=use_constant_density,
    final allowFlowReversal=allowFlowReversal,
    final use_inputFilter=false)
    "Outdoor air damper"
    annotation (Placement(transformation(extent={{-12,30},{8,50}})));
  Buildings.Fluid.Actuators.Dampers.Exponential damExh1(
    redeclare final package Medium = Medium,
    final m_flow_nominal=mExh_flow_nominal,
    final dpDamper_nominal=dpDamExh_nominal,
    final dpFixed_nominal=dpFixExh_nominal,
    final from_dp=from_dp,
    final linearized=linearized,
    final use_deltaM=use_deltaM,
    final deltaM=deltaM,
    final roundDuct=roundDuct,
    final ReC=ReC,
    final a=a,
    final b=b,
    final yL=yL,
    final yU=yU,
    final l=l,
    final k1=k1,
    final use_constant_density=use_constant_density,
    final allowFlowReversal=allowFlowReversal,
    final use_inputFilter=false)
    "Exhaust air damper"
    annotation (Placement(transformation(extent={{-22,-90},{-42,-70}})));
  Buildings.Fluid.Actuators.Dampers.Exponential damRec(
    redeclare final package Medium = Medium,
    final m_flow_nominal=mRec_flow_nominal,
    final dpDamper_nominal=dpDamRec_nominal,
    final dpFixed_nominal=dpFixRec_nominal,
    final from_dp=from_dp,
    final linearized=linearized,
    final use_deltaM=use_deltaM,
    final deltaM=deltaM,
    final roundDuct=roundDuct,
    final ReC=ReC,
    final a=a,
    final b=b,
    final yL=yL,
    final yU=yU,
    final l=l,
    final k1=k1,
    final use_constant_density=use_constant_density,
    final allowFlowReversal=allowFlowReversal,
    final use_inputFilter=false)
    "Recirculation air damper"
    annotation (
      Placement(transformation(
        origin={60,-20},
        extent={{-10,-10},{10,10}},
        rotation=90)));
protected
  parameter Medium.Density rho_default=Medium.density(sta_default)
    "Density, used to compute fluid volume";
  parameter Medium.ThermodynamicState sta_default=Medium.setState_pTX(
      T=Medium.T_default,
      p=Medium.p_default,
      X=Medium.X_default) "Default medium state";

equation
  connect(damOut.port_a, port_Out);
  connect(damExh.port_b, port_Exh);
  connect(port_Sup, damOut.port_b);
  connect(damRet.port_b, port_Sup);
  connect(port_Ret, damExh.port_a);
  connect(port_Ret, damRet.port_a);

  connect(damRet.y, yRet);
  connect(yOut, damOut.y);
  connect(yExh, damExh.y);
  connect(port_a, damOA.port_a) annotation (Line(points={{-100,38},{-98,38},{-98,
          40},{-12,40}}, color={0,127,255}));
  connect(damOA.port_b, port_b)
    annotation (Line(points={{8,40},{100,40}}, color={0,127,255}));
  connect(port_b1, damExh1.port_b)
    annotation (Line(points={{-100,-80},{-42,-80}}, color={0,127,255}));
  connect(damExh1.port_a, port_a1)
    annotation (Line(points={{-22,-80},{100,-80}}, color={0,127,255}));
  connect(damRec.port_b, port_b)
    annotation (Line(points={{60,-10},{60,40},{100,40}}, color={0,127,255}));
  connect(damRec.port_a, port_a1)
    annotation (Line(points={{60,-30},{60,-80},{100,-80}}, color={0,127,255}));
  connect(u, damRec.y)
    annotation (Line(points={{-60,120},{-60,-20},{48,-20}}, color={0,0,127}));
  connect(u1, damExh1.y) annotation (Line(points={{0,120},{0,60},{-24,60},{-24,-60},
          {-32,-60},{-32,-68}}, color={0,0,127}));
  connect(u2, damOA.y) annotation (Line(points={{60,120},{60,94},{-2,94},{-2,52}},
        color={0,0,127}));
end MixingBox3;
