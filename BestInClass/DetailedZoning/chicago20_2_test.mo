within BestInClass.DetailedZoning;
model chicago20_2_test
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
  parameter Modelica.Units.SI.PressureDifference dpBuiStaSet(displayUnit="Pa")=
       12 "Building static pressure";
  parameter Integer numZon=Building.numZon
    "Number of zones";

  parameter Modelica.Units.SI.MassFlowRate AHUAir_Nominal=2.347;

  parameter Modelica.Units.SI.MassFlowRate AHUHotWater_Nominal= AHUAir_Nominal*1006*(28 - 12)/4200/(55 - 45);

  parameter Modelica.Units.SI.MassFlowRate BuildingAir_Nominal= 5.66;

  parameter Modelica.Units.SI.MassFlowRate BuildingHotWater_Nominal= BuildingAir_Nominal *1006*(16.7 - 8.5)/4200/10;

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
    VDisSetMin_flow={16.3,14.5,14.5,6,100.2,100.2,33.5,33.5,27.5,114.5,110.3,
        26.9,50.7,22.4,112.4,115,123.7,135.1,26.9,13.8,13.8}/1000)
    annotation (Placement(transformation(extent={{156,4},{174,22}})));
  BestInClass.DetailedZoning.BaseClasses.AHUairtowater AHU(
    m_flow_nominal=Building.m_flow_sys,
    THeaOn=THeaOn,
    THeaOff=THeaOff,
    TCooOn=TCooOn,
    TCooOff=TCooOff,
    dpBuiStaSet=dpBuiStaSet)
    annotation (Placement(transformation(extent={{106,10},{126,30}})));
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
        fill(7200, numZon))
                         "Warm up and cool down time"
    annotation (Placement(transformation(extent={{-236,-92},{-224,-80}})));
  BaseClasses.HotWaterLoop_2 heatpump1
    annotation (Placement(transformation(extent={{242,30},{256,44}})));
  Buildings.Controls.OBC.CDL.Reals.MultiSum mulSum(nin=84)
    annotation (Placement(transformation(extent={{188,12},{202,26}})));
  Buildings.Controls.OBC.CDL.Reals.Add add2
    annotation (Placement(transformation(extent={{204,46},{218,60}})));
  Buildings.Fluid.FixedResistances.Junction splVal1(
    m_flow_nominal={PumpHotWater_Nominal,-AHUHotWater_Nominal,-
        BuildingHotWater_Nominal},
    redeclare package Medium = Buildings.Media.Water,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={183,81})));
  Buildings.Fluid.FixedResistances.Junction splVal2(
    m_flow_nominal={AHUHotWater_Nominal,-PumpHotWater_Nominal,
        BuildingHotWater_Nominal},
    redeclare package Medium = Buildings.Media.Water,
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flow splitter" annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={244,94})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant cooDowTim[numZon](final k=
        fill(0, numZon)) "Warm up and cool down time"
    annotation (Placement(transformation(extent={{-236,-70},{-224,-58}})));
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

public
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.Controller
    conAHU1(
    pMinSet=50,
    VPriSysMax_flow=Building.VPriSysMax_flow,
    pMaxSet=410,
    peaSysPop=54) "AHU controller"
    annotation (Placement(transformation(extent={{52,-308},{78,-268}})));
  Buildings.Controls.OBC.CDL.Integers.MultiSum TZonResReq1(nin=21)
    "Number of zone temperature requests"
    annotation (Placement(transformation(extent={{22,-378},{42,-358}})));
  Buildings.Controls.OBC.CDL.Integers.MultiSum PZonResReq1(nin=21)
    "Number of zone pressure requests"
    annotation (Placement(transformation(extent={{22,-408},{42,-388}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weather1(filNam=
        ModelicaServices.ExternalReferences.loadResource(
        "modelica://BestInClass/Resources/weather/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"))
    annotation (Placement(transformation(extent={{-238,-228},{-218,-208}})));
  BaseClasses.FLOOR_1964 Building1(
    idfFile=par.idfFile,
    weaFile=par.weaFile,
    epwFile=par.epwFile,
    m_flow_zone=par.m_flow_zone,
    m_flow_sys=par.m_flow_sys,
    VDisSetMin_flow={16.3,14.5,14.5,6,100.2,100.2,33.5,33.5,27.5,114.5,110.3,
        26.9,50.7,22.4,112.4,115,123.7,135.1,26.9,13.8,13.8}/1000)
    annotation (Placement(transformation(extent={{158,-304},{176,-286}})));
  BaseClasses.AHUairtowater                            AHU1(
    m_flow_nominal=Building.m_flow_sys,
    THeaOn=THeaOn,
    THeaOff=THeaOff,
    TCooOn=TCooOn,
    TCooOff=TCooOff,
    dpBuiStaSet=dpBuiStaSet)
    annotation (Placement(transformation(extent={{108,-298},{128,-278}})));
  Buildings.Controls.SetPoints.OccupancySchedule occupancy1(occupancy=3600*par.occupancyTable,
      period=365*24*3600)
    "Occupancy schedule"
    annotation (Placement(transformation(extent={{-238,-268},{-218,-248}})));
  Buildings.Controls.OBC.CDL.Routing.RealScalarReplicator reaRep2(final nout=
        numZon) "Replicate real input"
    annotation (Placement(transformation(extent={{-198,-268},{-178,-248}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booRep2(final nout
      =numZon)  "Replicate boolean input"
    annotation (Placement(transformation(extent={{-198,-298},{-178,-278}})));
  BaseClasses.InternalGains internalGains1(
    kLig=par.kLig,
    kEqu=par.kEqu,
    peoFile=par.peoFile,
    ligFile=par.ligFile,
    equFile=par.equFile)
    annotation (Placement(transformation(extent={{-238,-198},{-218,-178}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.SetPoints.OutdoorAirFlow.SumZone
    zonToSys1(final numZon=numZon)
                                  "Sum up zone calculation output"
    annotation (Placement(transformation(extent={{-18,-288},{2,-268}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.SetPoints.OutdoorAirFlow.Zone
    zonOutAirSet1
                [numZon](
    final AFlo=Building.AFlo,
    final have_occSen=fill(false, numZon),
    final have_winSen=fill(false, numZon),
    occDen={0,0,0,0,0.5,0.5,0,0,0.2,0.05,0.05,0.05,0.1,0,0.05,0.05,0.05,0.05,0,
        0,0},
    final desZonPop={0,0,0,0,21.6,21.6,0,0,4.6,6.3,6.3,2.12,6.15,0,8.83,9.03,
        9.72,10.61,0,0,0},
    final minZonPriFlo=Building.minZonPriFlo)
    "Zone level calculation of the minimum outdoor airflow setpoint"
    annotation (Placement(transformation(extent={{-58,-284},{-38,-264}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booRep3(final nout
      =numZon) "Replicate signal whether the outdoor airflow is required"
    annotation (Placement(transformation(extent={{-98,-268},{-78,-248}})));
  Buildings.Controls.OBC.CDL.Routing.RealScalarReplicator reaRep3(final nout=
        numZon) "Replicate design uncorrected minimum outdoor airflow setpoint"
    annotation (Placement(transformation(extent={{-98,-298},{-78,-278}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.ZoneStatus
    zonSta1
          [numZon] "Check zone temperature status"
    annotation (Placement(transformation(extent={{-198,-400},{-178,-372}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.GroupStatus
    zonGroSta1(final numZon=numZon)
    "Check zone group status according to the zones status"
    annotation (Placement(transformation(extent={{-138,-368},{-118,-328}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.OperationMode
    opeModSel1(final numZon=numZon)
    annotation (Placement(transformation(extent={{-78,-384},{-58,-352}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.SetPoints.ZoneTemperatures
    TZonSet1
           [numZon](final have_occSen=fill(false, numZon), final have_winSen=
        fill(false, numZon)) "Zone setpoint"
    annotation (Placement(transformation(extent={{-78,-422},{-58,-394}})));
  Buildings.Controls.OBC.CDL.Routing.IntegerScalarReplicator intRep1(final nout
      =numZon)  "All zones in same operation mode"
    annotation (Placement(transformation(extent={{-38,-378},{-18,-358}})));
  Buildings.Controls.OBC.CDL.Integers.Sources.Constant demLimLev1
                                                                [numZon](final k=
        fill(0, numZon))      "Demand limit level, assumes to be 0"
    annotation (Placement(transformation(extent={{-118,-434},{-98,-414}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Constant falSta1
                                                            [numZon](final k=
        fill(false, numZon))
    "All windows are closed, no zone has override switch"
    annotation (Placement(transformation(extent={{-238,-318},{-218,-298}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant warUpTim1
                                                            [numZon](final k=
        fill(7200, numZon))
                         "Warm up and cool down time"
    annotation (Placement(transformation(extent={{-234,-400},{-222,-388}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant cooDowTim1
                                                             [numZon](final k=
        fill(0, numZon)) "Warm up and cool down time"
    annotation (Placement(transformation(extent={{-234,-378},{-222,-366}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus1
                                                      annotation (Placement(
        transformation(extent={{36,-224},{48,-212}}),
                                                    iconTransformation(extent=
           {{-174,26},{-154,46}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.Controller
    conAHU2(
    pMinSet=50,
    VPriSysMax_flow=Building.VPriSysMax_flow,
    pMaxSet=410,
    peaSysPop=54) "AHU controller"
    annotation (Placement(transformation(extent={{630,0},{656,40}})));
  Buildings.Controls.OBC.CDL.Integers.MultiSum TZonResReq2(nin=21)
    "Number of zone temperature requests"
    annotation (Placement(transformation(extent={{600,-70},{620,-50}})));
  Buildings.Controls.OBC.CDL.Integers.MultiSum PZonResReq2(nin=21)
    "Number of zone pressure requests"
    annotation (Placement(transformation(extent={{600,-100},{620,-80}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weather2(filNam=
        ModelicaServices.ExternalReferences.loadResource(
        "modelica://BestInClass/Resources/weather/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"))
    annotation (Placement(transformation(extent={{340,80},{360,100}})));
  BaseClasses.FLOOR_1964 Building2(
    idfFile=par.idfFile,
    weaFile=par.weaFile,
    epwFile=par.epwFile,
    m_flow_zone=par.m_flow_zone,
    m_flow_sys=par.m_flow_sys,
    VDisSetMin_flow={16.3,14.5,14.5,6,100.2,100.2,33.5,33.5,27.5,114.5,110.3,
        26.9,50.7,22.4,112.4,115,123.7,135.1,26.9,13.8,13.8}/1000)
    annotation (Placement(transformation(extent={{736,4},{754,22}})));
  BaseClasses.AHUairtowater                            AHU2(
    m_flow_nominal=Building.m_flow_sys,
    THeaOn=THeaOn,
    THeaOff=THeaOff,
    TCooOn=TCooOn,
    TCooOff=TCooOff,
    dpBuiStaSet=dpBuiStaSet)
    annotation (Placement(transformation(extent={{686,10},{706,30}})));
  Buildings.Controls.SetPoints.OccupancySchedule occupancy2(occupancy=3600*par.occupancyTable,
      period=365*24*3600)
    "Occupancy schedule"
    annotation (Placement(transformation(extent={{340,40},{360,60}})));
  Buildings.Controls.OBC.CDL.Routing.RealScalarReplicator reaRep4(final nout=
        numZon) "Replicate real input"
    annotation (Placement(transformation(extent={{380,40},{400,60}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booRep4(final nout
      =numZon)  "Replicate boolean input"
    annotation (Placement(transformation(extent={{380,10},{400,30}})));
  BaseClasses.InternalGains internalGains2(
    kLig=par.kLig,
    kEqu=par.kEqu,
    peoFile=par.peoFile,
    ligFile=par.ligFile,
    equFile=par.equFile)
    annotation (Placement(transformation(extent={{340,110},{360,130}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.SetPoints.OutdoorAirFlow.SumZone
    zonToSys2(final numZon=numZon)
                                  "Sum up zone calculation output"
    annotation (Placement(transformation(extent={{560,20},{580,40}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.SetPoints.OutdoorAirFlow.Zone
    zonOutAirSet2
                [numZon](
    final AFlo=Building.AFlo,
    final have_occSen=fill(false, numZon),
    final have_winSen=fill(false, numZon),
    occDen={0,0,0,0,0.5,0.5,0,0,0.2,0.05,0.05,0.05,0.1,0,0.05,0.05,0.05,0.05,0,
        0,0},
    final desZonPop={0,0,0,0,21.6,21.6,0,0,4.6,6.3,6.3,2.12,6.15,0,8.83,9.03,
        9.72,10.61,0,0,0},
    final minZonPriFlo=Building.minZonPriFlo)
    "Zone level calculation of the minimum outdoor airflow setpoint"
    annotation (Placement(transformation(extent={{520,24},{540,44}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booRep5(final nout
      =numZon) "Replicate signal whether the outdoor airflow is required"
    annotation (Placement(transformation(extent={{480,40},{500,60}})));
  Buildings.Controls.OBC.CDL.Routing.RealScalarReplicator reaRep5(final nout=
        numZon) "Replicate design uncorrected minimum outdoor airflow setpoint"
    annotation (Placement(transformation(extent={{480,10},{500,30}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.ZoneStatus
    zonSta2
          [numZon] "Check zone temperature status"
    annotation (Placement(transformation(extent={{380,-92},{400,-64}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.GroupStatus
    zonGroSta2(final numZon=numZon)
    "Check zone group status according to the zones status"
    annotation (Placement(transformation(extent={{440,-60},{460,-20}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.OperationMode
    opeModSel2(final numZon=numZon)
    annotation (Placement(transformation(extent={{500,-76},{520,-44}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.SetPoints.ZoneTemperatures
    TZonSet2
           [numZon](final have_occSen=fill(false, numZon), final have_winSen=
        fill(false, numZon)) "Zone setpoint"
    annotation (Placement(transformation(extent={{500,-114},{520,-86}})));
  Buildings.Controls.OBC.CDL.Routing.IntegerScalarReplicator intRep2(final nout
      =numZon)  "All zones in same operation mode"
    annotation (Placement(transformation(extent={{540,-70},{560,-50}})));
  Buildings.Controls.OBC.CDL.Integers.Sources.Constant demLimLev2
                                                                [numZon](final k=
        fill(0, numZon))      "Demand limit level, assumes to be 0"
    annotation (Placement(transformation(extent={{460,-126},{480,-106}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Constant falSta2
                                                            [numZon](final k=
        fill(false, numZon))
    "All windows are closed, no zone has override switch"
    annotation (Placement(transformation(extent={{340,-10},{360,10}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant warUpTim2
                                                            [numZon](final k=
        fill(7200, numZon))
                         "Warm up and cool down time"
    annotation (Placement(transformation(extent={{344,-92},{356,-80}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant cooDowTim2
                                                             [numZon](final k=
        fill(0, numZon)) "Warm up and cool down time"
    annotation (Placement(transformation(extent={{344,-70},{356,-58}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus2
                                                      annotation (Placement(
        transformation(extent={{614,84},{626,96}}), iconTransformation(extent=
           {{-174,26},{-154,46}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.Controller
    conAHU3(
    pMinSet=50,
    VPriSysMax_flow=Building.VPriSysMax_flow,
    pMaxSet=410,
    peaSysPop=54) "AHU controller"
    annotation (Placement(transformation(extent={{644,-296},{670,-256}})));
  Buildings.Controls.OBC.CDL.Integers.MultiSum TZonResReq3(nin=21)
    "Number of zone temperature requests"
    annotation (Placement(transformation(extent={{614,-366},{634,-346}})));
  Buildings.Controls.OBC.CDL.Integers.MultiSum PZonResReq3(nin=21)
    "Number of zone pressure requests"
    annotation (Placement(transformation(extent={{614,-396},{634,-376}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weather3(filNam=
        ModelicaServices.ExternalReferences.loadResource(
        "modelica://BestInClass/Resources/weather/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"))
    annotation (Placement(transformation(extent={{354,-216},{374,-196}})));
  BaseClasses.FLOOR_1964 Building3(
    idfFile=par.idfFile,
    weaFile=par.weaFile,
    epwFile=par.epwFile,
    m_flow_zone=par.m_flow_zone,
    m_flow_sys=par.m_flow_sys,
    VDisSetMin_flow={16.3,14.5,14.5,6,100.2,100.2,33.5,33.5,27.5,114.5,110.3,
        26.9,50.7,22.4,112.4,115,123.7,135.1,26.9,13.8,13.8}/1000)
    annotation (Placement(transformation(extent={{750,-292},{768,-274}})));
  BaseClasses.AHUairtowater                            AHU3(
    m_flow_nominal=Building.m_flow_sys,
    THeaOn=THeaOn,
    THeaOff=THeaOff,
    TCooOn=TCooOn,
    TCooOff=TCooOff,
    dpBuiStaSet=dpBuiStaSet)
    annotation (Placement(transformation(extent={{700,-286},{720,-266}})));
  Buildings.Controls.SetPoints.OccupancySchedule occupancy3(occupancy=3600*par.occupancyTable,
      period=365*24*3600)
    "Occupancy schedule"
    annotation (Placement(transformation(extent={{354,-256},{374,-236}})));
  Buildings.Controls.OBC.CDL.Routing.RealScalarReplicator reaRep6(final nout=
        numZon) "Replicate real input"
    annotation (Placement(transformation(extent={{394,-256},{414,-236}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booRep6(final nout
      =numZon)  "Replicate boolean input"
    annotation (Placement(transformation(extent={{394,-286},{414,-266}})));
  BaseClasses.InternalGains internalGains3(
    kLig=par.kLig,
    kEqu=par.kEqu,
    peoFile=par.peoFile,
    ligFile=par.ligFile,
    equFile=par.equFile)
    annotation (Placement(transformation(extent={{354,-186},{374,-166}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.SetPoints.OutdoorAirFlow.SumZone
    zonToSys3(final numZon=numZon)
                                  "Sum up zone calculation output"
    annotation (Placement(transformation(extent={{574,-276},{594,-256}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.AHUs.MultiZone.VAV.SetPoints.OutdoorAirFlow.Zone
    zonOutAirSet3
                [numZon](
    final AFlo=Building.AFlo,
    final have_occSen=fill(false, numZon),
    final have_winSen=fill(false, numZon),
    occDen={0,0,0,0,0.5,0.5,0,0,0.2,0.05,0.05,0.05,0.1,0,0.05,0.05,0.05,0.05,0,
        0,0},
    final desZonPop={0,0,0,0,21.6,21.6,0,0,4.6,6.3,6.3,2.12,6.15,0,8.83,9.03,
        9.72,10.61,0,0,0},
    final minZonPriFlo=Building.minZonPriFlo)
    "Zone level calculation of the minimum outdoor airflow setpoint"
    annotation (Placement(transformation(extent={{534,-272},{554,-252}})));
  Buildings.Controls.OBC.CDL.Routing.BooleanScalarReplicator booRep7(final nout
      =numZon) "Replicate signal whether the outdoor airflow is required"
    annotation (Placement(transformation(extent={{494,-256},{514,-236}})));
  Buildings.Controls.OBC.CDL.Routing.RealScalarReplicator reaRep7(final nout=
        numZon) "Replicate design uncorrected minimum outdoor airflow setpoint"
    annotation (Placement(transformation(extent={{494,-286},{514,-266}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.ZoneStatus
    zonSta3
          [numZon] "Check zone temperature status"
    annotation (Placement(transformation(extent={{394,-388},{414,-360}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.GroupStatus
    zonGroSta3(final numZon=numZon)
    "Check zone group status according to the zones status"
    annotation (Placement(transformation(extent={{454,-356},{474,-316}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.Generic.SetPoints.OperationMode
    opeModSel3(final numZon=numZon)
    annotation (Placement(transformation(extent={{514,-372},{534,-340}})));
  Buildings.Obsolete.Controls.OBC.ASHRAE.G36_PR1.TerminalUnits.SetPoints.ZoneTemperatures
    TZonSet3
           [numZon](final have_occSen=fill(false, numZon), final have_winSen=
        fill(false, numZon)) "Zone setpoint"
    annotation (Placement(transformation(extent={{514,-410},{534,-382}})));
  Buildings.Controls.OBC.CDL.Routing.IntegerScalarReplicator intRep3(final nout
      =numZon)  "All zones in same operation mode"
    annotation (Placement(transformation(extent={{554,-366},{574,-346}})));
  Buildings.Controls.OBC.CDL.Integers.Sources.Constant demLimLev3
                                                                [numZon](final k=
        fill(0, numZon))      "Demand limit level, assumes to be 0"
    annotation (Placement(transformation(extent={{474,-422},{494,-402}})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Constant falSta3
                                                            [numZon](final k=
        fill(false, numZon))
    "All windows are closed, no zone has override switch"
    annotation (Placement(transformation(extent={{354,-306},{374,-286}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant warUpTim3
                                                            [numZon](final k=
        fill(7200, numZon))
                         "Warm up and cool down time"
    annotation (Placement(transformation(extent={{358,-388},{370,-376}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant cooDowTim3
                                                             [numZon](final k=
        fill(0, numZon)) "Warm up and cool down time"
    annotation (Placement(transformation(extent={{358,-366},{370,-354}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus3
                                                      annotation (Placement(
        transformation(extent={{628,-212},{640,-200}}),
                                                    iconTransformation(extent=
           {{-174,26},{-154,46}})));
equation
  connect(TZonResReq.y, conAHU.uZonTemResReq) annotation (Line(points={{42,-60},
          {46,-60},{46,4.44444},{48.7,4.44444}},   color={255,127,0}));
  connect(PZonResReq.y, conAHU.uZonPreResReq) annotation (Line(points={{42,-90},
          {46,-90},{46,2.77778},{48.7,2.77778}},      color={255,127,0}));
  connect(AHU.TSupAHU, conAHU.TSup) annotation (Line(points={{127,14.6},{127,4},
          {84,4},{84,-6},{42,-6},{42,4},{40,4},{40,17.2222},{48.7,17.2222}},
                                                             color={0,0,127}));
  connect(conAHU.ducStaPre, AHU.dpFan) annotation (Line(points={{48.7,33.8889},
          {48.7,42},{132,42},{132,23},{127,23}},             color={0,0,127}));
  connect(conAHU.ySupFanSpe, AHU.uFan) annotation (Line(points={{77.3,33.3333},
          {77.3,32},{88,32},{88,20},{105,20}},
                                          color={0,0,127}));
  connect(conAHU.yCoo, AHU.uCoo) annotation (Line(points={{77.3,10},{98,10},{98,
          14},{105,14}},
                     color={0,0,127}));
  connect(AHU.VOutFlo, conAHU.VOut_flow) annotation (Line(points={{127,25.6},{
          127,24},{126,24},{126,-6},{40,-6},{40,10.5556},{48.7,10.5556}},
                                                                     color={0,0,
          127}));
  connect(conAHU.TMix, AHU.TMixAHU) annotation (Line(points={{48.7,8.33333},{44,
          8.33333},{44,-2},{122,-2},{122,6},{127,6},{127,17.6}},
                                                               color={0,0,127}));
  connect(AHU.TRetAHU, conAHU.TOutCut) annotation (Line(points={{127,20.4},{126,
          20.4},{126,2},{82,2},{82,-4},{44,-4},{44,15.5556},{48.7,15.5556}},
                                                               color={0,0,127}));
  connect(conAHU.yOutDamPos, AHU.uOutDamPos) annotation (Line(points={{77.3,3.33333},
          {76,3.33333},{76,0},{100,0},{100,23},{105,23}},
                                     color={0,0,127}));
  connect(AHU.TSupAHU, Building.TSupAHU) annotation (Line(points={{127,14.6},{
          127,10.3},{155.1,10.3}},   color={0,0,127}));
  connect(AHU.supplyAir, Building.returnAir)   annotation (Line(points={{126,
          11.8},{126,10},{130,10},{130,6},{150,6},{150,0},{156,0},{156,5.62}},                  color={0,127,
          255},
      thickness=0.5));
  connect(AHU.returnAir, Building.supplyAir)   annotation (Line(points={{126,28},
          {152,28},{152,20.2},{156,20.2}},                                                color={0,127,
          255},
      thickness=0.5));
  connect(occupancy.occupied, booRep.u) annotation (Line(points={{-219,44},{
          -214,44},{-214,20},{-202,20}},
                                    color={255,0,255}));
  connect(occupancy.tNexOcc, reaRep.u) annotation (Line(points={{-219,56},{-214,
          56},{-214,50},{-202,50}}, color={0,0,127}));
  connect(internalGains.qGaiFlo, Building.qGaiFlo) annotation (Line(points={{-219,
          120},{140,120},{140,18.4},{155.1,18.4}},
                                        color={0,0,127}));
  connect(conAHU.yRetDamPos, AHU.uRetDamPos) annotation (Line(points={{77.3,6.66667},
          {88,6.66667},{88,22},{98,22},{98,26},{105,26}},
                                          color={0,0,127}));
  connect(AHU.uHea, conAHU.yHea) annotation (Line(points={{105,17},{86,17},{86,
          13.3333},{77.3,13.3333}},
                           color={0,0,127}));
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
  connect(Building.VDis, zonOutAirSet.VDis_flow) annotation (Line(points={{174.9,
          15.16},{180,15.16},{180,-28},{-66,-28},{-66,28},{-62,28}},
                                                             color={0,0,127}));
  connect(Building.TDis, zonOutAirSet.TDis) annotation (Line(points={{174.9,13},
          {182,13},{182,-32},{-68,-32},{-68,31},{-62,31}},
                                                      color={0,0,127}));
  connect(Building.yZonPreResReq, PZonResReq.u[1:21]) annotation (Line(points={{175.8,
          8.5},{174,8.5},{174,-106},{16,-106},{16,-86.6667},{18,-86.6667}},
        color={255,127,0}));
  connect(Building.yZonTemResReq, TZonResReq.u[1:21]) annotation (Line(points={{175.8,
          10.66},{175.8,-100},{10,-100},{10,-56.6667},{18,-56.6667}},
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
      points={{40,90},{86,90},{86,40},{98,40},{98,28},{107.6,28}},
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
          {-50,-60},{-50,-20},{140,-20},{140,7.6},{154.2,7.6}},color={255,127,0}));
  connect(intRep.y, TZonSet.uOpeMod) annotation (Line(points={{-18,-60},{-14,
          -60},{-14,-80},{-88,-80},{-88,-87},{-82,-87}}, color={255,127,0}));
  connect(TZonSet[1].TZonCooSet, Building.TRooCooSet) annotation (Line(points={{-58,-92},
          {6,-92},{6,-24},{144,-24},{144,13},{155.1,13}},         color={0,0,
          127}));
  connect(TZonSet[1].TZonHeaSet, Building.TRooHeaSet) annotation (Line(points={{-58,
          -100},{8,-100},{8,-26},{146,-26},{146,15.7},{155.1,15.7}},color={0,0,
          127}));
  connect(demLimLev.y, TZonSet.uCooDemLimLev) annotation (Line(points={{-98,
          -116},{-88,-116},{-88,-106},{-82,-106}}, color={255,127,0}));
  connect(demLimLev.y, TZonSet.uHeaDemLimLev) annotation (Line(points={{-98,
          -116},{-88,-116},{-88,-108},{-82,-108}}, color={255,127,0}));
  connect(warUpTim.y, zonSta.warUpTim)
    annotation (Line(points={{-222.8,-86},{-210,-86},{-210,-74},{-202,-74}},
                                                       color={0,0,127}));
  connect(Building.TRooAir, zonSta.TZon) annotation (Line(points={{174.9,17.5},
          {184,17.5},{184,-132},{-206,-132},{-206,-86},{-202,-86}},
                                                             color={0,0,127}));
  connect(Building.TRooAir, zonOutAirSet.TZon) annotation (Line(points={{174.9,
          17.5},{184,17.5},{184,-30},{-70,-30},{-70,34},{-62,34}},
                                                           color={0,0,127}));
  connect(reaRep.y, zonGroSta.tNexOcc) annotation (Line(points={{-178,50},{-172,
          50},{-172,-25},{-142,-25}}, color={0,0,127}));
  connect(booRep.y, zonGroSta.uOcc) annotation (Line(points={{-178,20},{-174,20},
          {-174,-23},{-142,-23}}, color={255,0,255}));
  connect(falSta.y, zonGroSta.zonOcc) annotation (Line(points={{-218,0},{-152,0},
          {-152,-21},{-142,-21}}, color={255,0,255}));
  connect(falSta.y, zonGroSta.uWin) annotation (Line(points={{-218,0},{-152,0},
          {-152,-59},{-142,-59}}, color={255,0,255}));
  connect(zonGroSta.TZon, Building.TRooAir) annotation (Line(points={{-142,-57},
          {-146,-57},{-146,-132},{184,-132},{184,17.5},{174.9,17.5}},
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
        points={{174.9,21.1},{178,21.1},{178,18.6417},{186.6,18.6417}},
        color={0,0,127}));
  connect(mulSum.y, add2.u2) annotation (Line(points={{203.4,19},{203.4,18},{
          208,18},{208,40},{196,40},{196,48.8},{202.6,48.8}}, color={0,0,127}));
  connect(conAHU.yHea, add2.u1) annotation (Line(points={{77.3,13.3333},{77.3,
          12},{86,12},{86,48},{190,48},{190,57.2},{202.6,57.2}},
        color={0,0,127}));
  connect(add2.y, heatpump1.u) annotation (Line(points={{219.4,53},{226,53},{
          226,37},{239.6,37}},   color={0,0,127}));
  connect(heatpump1.port_a, splVal1.port_1) annotation (Line(points={{240.2,
          38.3333},{240.2,64},{224,64},{224,70},{183,70},{183,76}},
                                                                 color={0,127,
          255}));
  connect(heatpump1.port_b, splVal2.port_2) annotation (Line(points={{243,
          38.3333},{236,38.3333},{236,82},{244,82},{244,88}},
                                      color={0,127,255}));
  connect(cooDowTim.y, zonSta.cooDowTim) annotation (Line(points={{-222.8,-64},
          {-220,-64},{-220,-70},{-202,-70}},color={0,0,127}));

  connect(Building.port_a, splVal1.port_3) annotation (Line(points={{171.3,3.1},
          {171.3,81},{178,81}},   color={0,127,255}));
  connect(Building.port_b, splVal2.port_3) annotation (Line(points={{158.7,3.1},
          {158.7,94},{238,94}},   color={0,127,255}));

  connect(splVal1.port_2, AHU.port_a1) annotation (Line(points={{183,86},{142,
          86},{142,10},{126,10}},      color={0,127,255}));
  connect(AHU.port_b, splVal2.port_1) annotation (Line(points={{106,10},{108,10},
          {108,100},{244,100}}, color={0,127,255}));
  connect(TZonResReq1.y, conAHU1.uZonTemResReq) annotation (Line(points={{44,-368},
          {48,-368},{48,-303.556},{50.7,-303.556}},       color={255,127,0}));
  connect(PZonResReq1.y, conAHU1.uZonPreResReq) annotation (Line(points={{44,-398},
          {48,-398},{48,-305.222},{50.7,-305.222}},       color={255,127,0}));
  connect(AHU1.TSupAHU, conAHU1.TSup) annotation (Line(points={{129,-293.4},{
          129,-304},{86,-304},{86,-314},{44,-314},{44,-304},{42,-304},{42,
          -290.778},{50.7,-290.778}}, color={0,0,127}));
  connect(conAHU1.ducStaPre, AHU1.dpFan) annotation (Line(points={{50.7,
          -274.111},{50.7,-266},{134,-266},{134,-285},{129,-285}}, color={0,0,
          127}));
  connect(conAHU1.ySupFanSpe, AHU1.uFan) annotation (Line(points={{79.3,
          -274.667},{79.3,-276},{90,-276},{90,-288},{107,-288}}, color={0,0,127}));
  connect(conAHU1.yCoo, AHU1.uCoo) annotation (Line(points={{79.3,-298},{100,
          -298},{100,-294},{107,-294}}, color={0,0,127}));
  connect(AHU1.VOutFlo, conAHU1.VOut_flow) annotation (Line(points={{129,-282.4},
          {129,-284},{128,-284},{128,-314},{42,-314},{42,-297.444},{50.7,
          -297.444}}, color={0,0,127}));
  connect(conAHU1.TMix, AHU1.TMixAHU) annotation (Line(points={{50.7,-299.667},
          {46,-299.667},{46,-310},{124,-310},{124,-302},{129,-302},{129,-290.4}},
        color={0,0,127}));
  connect(AHU1.TRetAHU, conAHU1.TOutCut) annotation (Line(points={{129,-287.6},
          {128,-287.6},{128,-306},{84,-306},{84,-312},{46,-312},{46,-292.444},{
          50.7,-292.444}}, color={0,0,127}));
  connect(conAHU1.yOutDamPos, AHU1.uOutDamPos) annotation (Line(points={{79.3,
          -304.667},{78,-304.667},{78,-308},{102,-308},{102,-285},{107,-285}},
        color={0,0,127}));
  connect(AHU1.TSupAHU, Building1.TSupAHU) annotation (Line(points={{129,-293.4},
          {129,-297.7},{157.1,-297.7}}, color={0,0,127}));
  connect(AHU1.supplyAir, Building1.returnAir) annotation (Line(
      points={{128,-296.2},{128,-298},{132,-298},{132,-302},{152,-302},{152,
          -308},{158,-308},{158,-302.38}},
      color={0,127,255},
      thickness=0.5));
  connect(AHU1.returnAir, Building1.supplyAir) annotation (Line(
      points={{128,-280},{154,-280},{154,-287.8},{158,-287.8}},
      color={0,127,255},
      thickness=0.5));
  connect(occupancy1.occupied, booRep2.u) annotation (Line(points={{-217,-264},
          {-212,-264},{-212,-288},{-200,-288}}, color={255,0,255}));
  connect(occupancy1.tNexOcc, reaRep2.u) annotation (Line(points={{-217,-252},{
          -212,-252},{-212,-258},{-200,-258}}, color={0,0,127}));
  connect(internalGains1.qGaiFlo, Building1.qGaiFlo) annotation (Line(points={{
          -217,-188},{142,-188},{142,-289.6},{157.1,-289.6}}, color={0,0,127}));
  connect(conAHU1.yRetDamPos, AHU1.uRetDamPos) annotation (Line(points={{79.3,
          -301.333},{90,-301.333},{90,-286},{100,-286},{100,-282},{107,-282}},
        color={0,0,127}));
  connect(AHU1.uHea, conAHU1.yHea) annotation (Line(points={{107,-291},{88,-291},
          {88,-294.667},{79.3,-294.667}}, color={0,0,127}));
  connect(zonOutAirSet1.yDesZonPeaOcc, zonToSys1.uDesZonPeaOcc) annotation (
      Line(points={{-36,-265},{-24,-265},{-24,-270},{-20,-270}}, color={0,0,127}));
  connect(zonOutAirSet1.VDesPopBreZon_flow, zonToSys1.VDesPopBreZon_flow)
    annotation (Line(points={{-36,-268},{-26,-268},{-26,-272},{-20,-272}},
        color={0,0,127}));
  connect(zonOutAirSet1.VDesAreBreZon_flow, zonToSys1.VDesAreBreZon_flow)
    annotation (Line(points={{-36,-271},{-28,-271},{-28,-274},{-20,-274}},
        color={0,0,127}));
  connect(zonOutAirSet1.VPriAir_flow, zonToSys1.VPriAir_flow) annotation (Line(
        points={{-36,-283},{-34,-283},{-34,-286},{-20,-286}}, color={0,0,127}));
  connect(zonOutAirSet1.yPriOutAirFra, zonToSys1.uPriOutAirFra) annotation (
      Line(points={{-36,-280},{-32,-280},{-32,-284},{-20,-284}}, color={0,0,127}));
  connect(zonOutAirSet1.VUncOutAir_flow, zonToSys1.VUncOutAir_flow) annotation
    (Line(points={{-36,-277},{-30,-277},{-30,-282},{-20,-282}}, color={0,0,127}));
  connect(zonOutAirSet1.yDesPriOutAirFra, zonToSys1.uDesPriOutAirFra)
    annotation (Line(points={{-36,-274},{-28,-274},{-28,-280},{-20,-280}},
        color={0,0,127}));
  connect(zonToSys1.ySumDesZonPop, conAHU1.sumDesZonPop) annotation (Line(
        points={{4,-269},{46,-269},{46,-277.444},{50.7,-277.444}}, color={0,0,
          127}));
  connect(zonToSys1.VSumDesPopBreZon_flow, conAHU1.VSumDesPopBreZon_flow)
    annotation (Line(points={{4,-272},{44,-272},{44,-279.111},{50.7,-279.111}},
        color={0,0,127}));
  connect(zonToSys1.yDesSysVenEff, conAHU1.uDesSysVenEff) annotation (Line(
        points={{4,-278},{38,-278},{38,-282.444},{50.7,-282.444}}, color={0,0,
          127}));
  connect(zonToSys1.uOutAirFra_max, conAHU1.uOutAirFra_max) annotation (Line(
        points={{4,-284},{34,-284},{34,-287.444},{50.7,-287.444}}, color={0,0,
          127}));
  connect(conAHU1.yReqOutAir, booRep3.u) annotation (Line(points={{79.3,
          -291.333},{82,-291.333},{82,-240},{-104,-240},{-104,-258},{-100,-258}},
        color={255,0,255}));
  connect(booRep3.y, zonOutAirSet1.uReqOutAir) annotation (Line(points={{-76,
          -258},{-72,-258},{-72,-271},{-60,-271}}, color={255,0,255}));
  connect(conAHU1.VDesUncOutAir_flow, reaRep3.u) annotation (Line(points={{79.3,
          -281.333},{84,-281.333},{84,-238},{-106,-238},{-106,-288},{-100,-288}},
        color={0,0,127}));
  connect(reaRep3.y, zonOutAirSet1.VUncOut_flow_nominal) annotation (Line(
        points={{-76,-288},{-72,-288},{-72,-283},{-60,-283}}, color={0,0,127}));
  connect(Building1.VDis, zonOutAirSet1.VDis_flow) annotation (Line(points={{
          176.9,-292.84},{182,-292.84},{182,-336},{-64,-336},{-64,-280},{-60,
          -280}}, color={0,0,127}));
  connect(Building1.TDis, zonOutAirSet1.TDis) annotation (Line(points={{176.9,
          -295},{184,-295},{184,-340},{-66,-340},{-66,-277},{-60,-277}}, color=
          {0,0,127}));
  connect(Building1.yZonPreResReq, PZonResReq1.u[1:21]) annotation (Line(points={{177.8,
          -299.5},{176,-299.5},{176,-414},{18,-414},{18,-394.667},{20,-394.667}},
                      color={255,127,0}));
  connect(Building1.yZonTemResReq, TZonResReq1.u[1:21]) annotation (Line(points={{177.8,
          -297.34},{177.8,-408},{12,-408},{12,-364.667},{20,-364.667}},
        color={255,127,0}));
  connect(zonSta1.yOccHeaHig, zonGroSta1.uOccHeaHig) annotation (Line(points={{
          -176,-380},{-170,-380},{-170,-343},{-140,-343}}, color={255,0,255}));
  connect(zonSta1.yHigOccCoo, zonGroSta1.uHigOccCoo) annotation (Line(points={{
          -176,-385},{-168,-385},{-168,-345},{-140,-345}}, color={255,0,255}));
  connect(zonSta1.THeaSetOff, zonGroSta1.THeaSetOff) annotation (Line(points={{
          -176,-388},{-164,-388},{-164,-351},{-140,-351}}, color={0,0,127}));
  connect(zonSta1.yUnoHeaHig, zonGroSta1.uUnoHeaHig) annotation (Line(points={{
          -176,-390},{-166,-390},{-166,-349},{-140,-349}}, color={255,0,255}));
  connect(zonSta1.yEndSetBac, zonGroSta1.uEndSetBac) annotation (Line(points={{
          -176,-392},{-162,-392},{-162,-353},{-140,-353}}, color={255,0,255}));
  connect(zonGroSta1.yOccHeaHig, opeModSel1.uOccHeaHig) annotation (Line(points
        ={{-116,-341},{-92,-341},{-92,-364},{-80,-364}}, color={255,0,255}));
  connect(zonGroSta1.yColZon, opeModSel1.totColZon) annotation (Line(points={{
          -116,-346},{-96,-346},{-96,-368},{-80,-368}}, color={255,127,0}));
  connect(zonGroSta1.ySetBac, opeModSel1.uSetBac) annotation (Line(points={{
          -116,-348},{-98,-348},{-98,-370},{-80,-370}}, color={255,0,255}));
  connect(zonGroSta1.yEndSetBac, opeModSel1.uEndSetBac) annotation (Line(points
        ={{-116,-350},{-100,-350},{-100,-372},{-80,-372}}, color={255,0,255}));
  connect(zonGroSta1.TZonMin, opeModSel1.TZonMin) annotation (Line(points={{
          -116,-363},{-110,-363},{-110,-376},{-80,-376}}, color={0,0,127}));
  connect(zonGroSta1.yHotZon, opeModSel1.totHotZon) annotation (Line(points={{
          -116,-353},{-102,-353},{-102,-378},{-80,-378}}, color={255,127,0}));
  connect(zonGroSta1.ySetUp, opeModSel1.uSetUp) annotation (Line(points={{-116,
          -355},{-104,-355},{-104,-380},{-80,-380}}, color={255,0,255}));
  connect(zonGroSta1.yEndSetUp, opeModSel1.uEndSetUp) annotation (Line(points={
          {-116,-357},{-106,-357},{-106,-382},{-80,-382}}, color={255,0,255}));
  connect(zonGroSta1.yOpeWin, opeModSel1.uOpeWin) annotation (Line(points={{
          -116,-367},{-112,-367},{-112,-366},{-80,-366}}, color={255,127,0}));
  connect(weaBus1, AHU1.weaBus) annotation (Line(
      points={{42,-218},{88,-218},{88,-268},{100,-268},{100,-280},{109.6,-280}},
      color={255,204,51},
      thickness=0.5));
  connect(zonSta1.THeaSetOn, TZonSet1.TZonHeaSetOcc) annotation (Line(points={{
          -176,-378},{-154,-378},{-154,-404},{-80,-404}}, color={0,0,127}));
  connect(zonSta1.THeaSetOff, TZonSet1.TZonHeaSetUno) annotation (Line(points={
          {-176,-388},{-150,-388},{-150,-406},{-80,-406}}, color={0,0,127}));
  connect(zonSta1.TCooSetOn, TZonSet1.TZonCooSetOcc) annotation (Line(points={{
          -176,-383},{-148,-383},{-148,-399},{-80,-399}}, color={0,0,127}));
  connect(opeModSel1.yOpeMod, intRep1.u)
    annotation (Line(points={{-56,-368},{-40,-368}}, color={255,127,0}));
  connect(opeModSel1.yOpeMod, conAHU1.uOpeMod) annotation (Line(points={{-56,
          -368},{-48,-368},{-48,-301.889},{50.7,-301.889}}, color={255,127,0}));
  connect(opeModSel1.yOpeMod, Building1.uOpeMod) annotation (Line(points={{-56,
          -368},{-48,-368},{-48,-328},{142,-328},{142,-300.4},{156.2,-300.4}},
        color={255,127,0}));
  connect(intRep1.y, TZonSet1.uOpeMod) annotation (Line(points={{-16,-368},{-12,
          -368},{-12,-388},{-86,-388},{-86,-395},{-80,-395}}, color={255,127,0}));
  connect(TZonSet1[1].TZonCooSet, Building1.TRooCooSet) annotation (Line(points
        ={{-56,-400},{8,-400},{8,-332},{146,-332},{146,-295},{157.1,-295}},
        color={0,0,127}));
  connect(TZonSet1[1].TZonHeaSet, Building1.TRooHeaSet) annotation (Line(points
        ={{-56,-408},{10,-408},{10,-334},{148,-334},{148,-292.3},{157.1,-292.3}},
        color={0,0,127}));
  connect(demLimLev1.y, TZonSet1.uCooDemLimLev) annotation (Line(points={{-96,
          -424},{-86,-424},{-86,-414},{-80,-414}}, color={255,127,0}));
  connect(demLimLev1.y, TZonSet1.uHeaDemLimLev) annotation (Line(points={{-96,
          -424},{-86,-424},{-86,-416},{-80,-416}}, color={255,127,0}));
  connect(warUpTim1.y, zonSta1.warUpTim) annotation (Line(points={{-220.8,-394},
          {-208,-394},{-208,-382},{-200,-382}}, color={0,0,127}));
  connect(Building1.TRooAir, zonSta1.TZon) annotation (Line(points={{176.9,
          -290.5},{186,-290.5},{186,-440},{-204,-440},{-204,-394},{-200,-394}},
        color={0,0,127}));
  connect(Building1.TRooAir, zonOutAirSet1.TZon) annotation (Line(points={{
          176.9,-290.5},{186,-290.5},{186,-338},{-68,-338},{-68,-274},{-60,-274}},
        color={0,0,127}));
  connect(reaRep2.y, zonGroSta1.tNexOcc) annotation (Line(points={{-176,-258},{
          -170,-258},{-170,-333},{-140,-333}}, color={0,0,127}));
  connect(booRep2.y, zonGroSta1.uOcc) annotation (Line(points={{-176,-288},{
          -172,-288},{-172,-331},{-140,-331}}, color={255,0,255}));
  connect(falSta1.y, zonGroSta1.zonOcc) annotation (Line(points={{-216,-308},{
          -150,-308},{-150,-329},{-140,-329}}, color={255,0,255}));
  connect(falSta1.y, zonGroSta1.uWin) annotation (Line(points={{-216,-308},{
          -150,-308},{-150,-367},{-140,-367}}, color={255,0,255}));
  connect(zonGroSta1.TZon, Building1.TRooAir) annotation (Line(points={{-140,
          -365},{-144,-365},{-144,-440},{186,-440},{186,-290.5},{176.9,-290.5}},
        color={0,0,127}));
  connect(TZonSet1[1].TZonCooSet, conAHU1.TZonCooSet) annotation (Line(points={{-56,
          -400},{8,-400},{8,-270.778},{50.7,-270.778}},      color={0,0,127}));
  connect(TZonSet1[1].TZonHeaSet, conAHU1.TZonHeaSet) annotation (Line(points={{-56,
          -408},{10,-408},{10,-269.111},{50.7,-269.111}},      color={0,0,127}));
  connect(weaBus1.TDryBul, conAHU1.TOut) annotation (Line(
      points={{42.03,-217.97},{48,-217.97},{48,-272.444},{50.7,-272.444}},
      color={255,204,51},
      thickness=0.5));
  connect(zonSta1.TCooSetOff, TZonSet1.TZonCooSetUno) annotation (Line(points={
          {-176,-395},{-152,-395},{-152,-401},{-80,-401}}, color={0,0,127}));
  connect(zonGroSta1.uGroOcc, opeModSel1.uOcc) annotation (Line(points={{-116,
          -329},{-84,-329},{-84,-354},{-80,-354}}, color={255,0,255}));
  connect(zonGroSta1.nexOcc, opeModSel1.tNexOcc) annotation (Line(points={{-116,
          -331},{-86,-331},{-86,-356},{-80,-356}}, color={0,0,127}));
  connect(zonGroSta1.yCooTim, opeModSel1.maxCooDowTim) annotation (Line(points=
          {{-116,-335},{-88,-335},{-88,-358},{-80,-358}}, color={0,0,127}));
  connect(zonGroSta1.yWarTim, opeModSel1.maxWarUpTim) annotation (Line(points={
          {-116,-337},{-90,-337},{-90,-362},{-80,-362}}, color={0,0,127}));
  connect(zonGroSta1.yHigOccCoo, opeModSel1.uHigOccCoo) annotation (Line(points
        ={{-116,-343},{-94,-343},{-94,-360},{-80,-360}}, color={255,0,255}));
  connect(zonSta1.yCooTim, zonGroSta1.uCooTim) annotation (Line(points={{-176,
          -373},{-174,-373},{-174,-337},{-140,-337}}, color={0,0,127}));
  connect(zonSta1.yWarTim, zonGroSta1.uWarTim) annotation (Line(points={{-176,
          -375},{-172,-375},{-172,-339},{-140,-339}}, color={0,0,127}));
  connect(zonSta1.TCooSetOff, zonGroSta1.TCooSetOff) annotation (Line(points={{
          -176,-395},{-158,-395},{-158,-359},{-140,-359}}, color={0,0,127}));
  connect(zonSta1.yHigUnoCoo, zonGroSta1.uHigUnoCoo) annotation (Line(points={{
          -176,-397},{-160,-397},{-160,-357},{-140,-357}}, color={255,0,255}));
  connect(zonSta1.yEndSetUp, zonGroSta1.uEndSetUp) annotation (Line(points={{
          -176,-399},{-156,-399},{-156,-361},{-140,-361}}, color={255,0,255}));
  connect(zonToSys1.VSumDesAreBreZon_flow, conAHU1.VSumDesAreBreZon_flow)
    annotation (Line(points={{4,-275},{42,-275},{42,-280.778},{50.7,-280.778}},
        color={0,0,127}));
  connect(zonToSys1.VSumUncOutAir_flow, conAHU1.VSumUncOutAir_flow) annotation
    (Line(points={{4,-281},{36,-281},{36,-284.111},{50.7,-284.111}}, color={0,0,
          127}));
  connect(zonToSys1.VSumSysPriAir_flow, conAHU1.VSumSysPriAir_flow) annotation
    (Line(points={{4,-287},{28,-287},{28,-285.778},{50.7,-285.778}}, color={0,0,
          127}));
  connect(weather1.weaBus, weaBus1) annotation (Line(
      points={{-218,-218},{42,-218}},
      color={255,204,51},
      thickness=0.5));
  connect(conAHU1.yAveOutAirFraPlu, zonToSys1.yAveOutAirFraPlu) annotation (
      Line(points={{79.3,-284.667},{86,-284.667},{86,-256},{-22,-256},{-22,-276},
          {-20,-276}}, color={0,0,127}));
  connect(cooDowTim1.y, zonSta1.cooDowTim) annotation (Line(points={{-220.8,
          -372},{-218,-372},{-218,-378},{-200,-378}}, color={0,0,127}));
  connect(TZonResReq2.y, conAHU2.uZonTemResReq) annotation (Line(points={{622,
          -60},{626,-60},{626,4.44444},{628.7,4.44444}}, color={255,127,0}));
  connect(PZonResReq2.y, conAHU2.uZonPreResReq) annotation (Line(points={{622,
          -90},{626,-90},{626,2.77778},{628.7,2.77778}}, color={255,127,0}));
  connect(AHU2.TSupAHU, conAHU2.TSup) annotation (Line(points={{707,14.6},{707,
          4},{664,4},{664,-6},{622,-6},{622,4},{620,4},{620,17.2222},{628.7,
          17.2222}}, color={0,0,127}));
  connect(conAHU2.ducStaPre, AHU2.dpFan) annotation (Line(points={{628.7,
          33.8889},{628.7,42},{712,42},{712,23},{707,23}}, color={0,0,127}));
  connect(conAHU2.ySupFanSpe, AHU2.uFan) annotation (Line(points={{657.3,
          33.3333},{657.3,32},{668,32},{668,20},{685,20}}, color={0,0,127}));
  connect(conAHU2.yCoo, AHU2.uCoo) annotation (Line(points={{657.3,10},{678,10},
          {678,14},{685,14}}, color={0,0,127}));
  connect(AHU2.VOutFlo, conAHU2.VOut_flow) annotation (Line(points={{707,25.6},
          {707,24},{706,24},{706,-6},{620,-6},{620,10.5556},{628.7,10.5556}},
        color={0,0,127}));
  connect(conAHU2.TMix, AHU2.TMixAHU) annotation (Line(points={{628.7,8.33333},
          {624,8.33333},{624,-2},{702,-2},{702,6},{707,6},{707,17.6}}, color={0,
          0,127}));
  connect(AHU2.TRetAHU, conAHU2.TOutCut) annotation (Line(points={{707,20.4},{
          706,20.4},{706,2},{662,2},{662,-4},{624,-4},{624,15.5556},{628.7,
          15.5556}}, color={0,0,127}));
  connect(conAHU2.yOutDamPos, AHU2.uOutDamPos) annotation (Line(points={{657.3,
          3.33333},{656,3.33333},{656,0},{680,0},{680,23},{685,23}}, color={0,0,
          127}));
  connect(AHU2.TSupAHU, Building2.TSupAHU) annotation (Line(points={{707,14.6},
          {707,10.3},{735.1,10.3}}, color={0,0,127}));
  connect(AHU2.supplyAir, Building2.returnAir) annotation (Line(
      points={{706,11.8},{706,10},{710,10},{710,6},{730,6},{730,0},{736,0},{736,
          5.62}},
      color={0,127,255},
      thickness=0.5));
  connect(AHU2.returnAir, Building2.supplyAir) annotation (Line(
      points={{706,28},{732,28},{732,20.2},{736,20.2}},
      color={0,127,255},
      thickness=0.5));
  connect(occupancy2.occupied, booRep4.u) annotation (Line(points={{361,44},{
          366,44},{366,20},{378,20}}, color={255,0,255}));
  connect(occupancy2.tNexOcc, reaRep4.u) annotation (Line(points={{361,56},{366,
          56},{366,50},{378,50}}, color={0,0,127}));
  connect(internalGains2.qGaiFlo, Building2.qGaiFlo) annotation (Line(points={{
          361,120},{720,120},{720,18.4},{735.1,18.4}}, color={0,0,127}));
  connect(conAHU2.yRetDamPos, AHU2.uRetDamPos) annotation (Line(points={{657.3,
          6.66667},{668,6.66667},{668,22},{678,22},{678,26},{685,26}}, color={0,
          0,127}));
  connect(AHU2.uHea, conAHU2.yHea) annotation (Line(points={{685,17},{666,17},{
          666,13.3333},{657.3,13.3333}}, color={0,0,127}));
  connect(zonOutAirSet2.yDesZonPeaOcc, zonToSys2.uDesZonPeaOcc) annotation (
      Line(points={{542,43},{554,43},{554,38},{558,38}}, color={0,0,127}));
  connect(zonOutAirSet2.VDesPopBreZon_flow, zonToSys2.VDesPopBreZon_flow)
    annotation (Line(points={{542,40},{552,40},{552,36},{558,36}}, color={0,0,
          127}));
  connect(zonOutAirSet2.VDesAreBreZon_flow, zonToSys2.VDesAreBreZon_flow)
    annotation (Line(points={{542,37},{550,37},{550,34},{558,34}}, color={0,0,
          127}));
  connect(zonOutAirSet2.VPriAir_flow, zonToSys2.VPriAir_flow) annotation (Line(
        points={{542,25},{544,25},{544,22},{558,22}}, color={0,0,127}));
  connect(zonOutAirSet2.yPriOutAirFra, zonToSys2.uPriOutAirFra) annotation (
      Line(points={{542,28},{546,28},{546,24},{558,24}}, color={0,0,127}));
  connect(zonOutAirSet2.VUncOutAir_flow, zonToSys2.VUncOutAir_flow) annotation
    (Line(points={{542,31},{548,31},{548,26},{558,26}}, color={0,0,127}));
  connect(zonOutAirSet2.yDesPriOutAirFra, zonToSys2.uDesPriOutAirFra)
    annotation (Line(points={{542,34},{550,34},{550,28},{558,28}}, color={0,0,
          127}));
  connect(zonToSys2.ySumDesZonPop, conAHU2.sumDesZonPop) annotation (Line(
        points={{582,39},{624,39},{624,30.5556},{628.7,30.5556}}, color={0,0,
          127}));
  connect(zonToSys2.VSumDesPopBreZon_flow, conAHU2.VSumDesPopBreZon_flow)
    annotation (Line(points={{582,36},{622,36},{622,28.8889},{628.7,28.8889}},
        color={0,0,127}));
  connect(zonToSys2.yDesSysVenEff, conAHU2.uDesSysVenEff) annotation (Line(
        points={{582,30},{616,30},{616,25.5556},{628.7,25.5556}}, color={0,0,
          127}));
  connect(zonToSys2.uOutAirFra_max, conAHU2.uOutAirFra_max) annotation (Line(
        points={{582,24},{612,24},{612,20.5556},{628.7,20.5556}}, color={0,0,
          127}));
  connect(conAHU2.yReqOutAir, booRep5.u) annotation (Line(points={{657.3,
          16.6667},{660,16.6667},{660,68},{474,68},{474,50},{478,50}}, color={
          255,0,255}));
  connect(booRep5.y, zonOutAirSet2.uReqOutAir) annotation (Line(points={{502,50},
          {506,50},{506,37},{518,37}}, color={255,0,255}));
  connect(conAHU2.VDesUncOutAir_flow, reaRep5.u) annotation (Line(points={{657.3,
          26.6667},{662,26.6667},{662,70},{472,70},{472,20},{478,20}},
        color={0,0,127}));
  connect(reaRep5.y, zonOutAirSet2.VUncOut_flow_nominal) annotation (Line(
        points={{502,20},{506,20},{506,25},{518,25}}, color={0,0,127}));
  connect(Building2.VDis, zonOutAirSet2.VDis_flow) annotation (Line(points={{
          754.9,15.16},{760,15.16},{760,-28},{514,-28},{514,28},{518,28}},
        color={0,0,127}));
  connect(Building2.TDis, zonOutAirSet2.TDis) annotation (Line(points={{754.9,
          13},{762,13},{762,-32},{512,-32},{512,31},{518,31}}, color={0,0,127}));
  connect(Building2.yZonPreResReq, PZonResReq2.u[1:21]) annotation (Line(points={{755.8,
          8.5},{754,8.5},{754,-106},{596,-106},{596,-86.6667},{598,-86.6667}},
                      color={255,127,0}));
  connect(Building2.yZonTemResReq, TZonResReq2.u[1:21]) annotation (Line(points={{755.8,
          10.66},{755.8,-100},{590,-100},{590,-56.6667},{598,-56.6667}},
        color={255,127,0}));
  connect(zonSta2.yOccHeaHig, zonGroSta2.uOccHeaHig) annotation (Line(points={{
          402,-72},{408,-72},{408,-35},{438,-35}}, color={255,0,255}));
  connect(zonSta2.yHigOccCoo, zonGroSta2.uHigOccCoo) annotation (Line(points={{
          402,-77},{410,-77},{410,-37},{438,-37}}, color={255,0,255}));
  connect(zonSta2.THeaSetOff, zonGroSta2.THeaSetOff) annotation (Line(points={{
          402,-80},{414,-80},{414,-43},{438,-43}}, color={0,0,127}));
  connect(zonSta2.yUnoHeaHig, zonGroSta2.uUnoHeaHig) annotation (Line(points={{
          402,-82},{412,-82},{412,-41},{438,-41}}, color={255,0,255}));
  connect(zonSta2.yEndSetBac, zonGroSta2.uEndSetBac) annotation (Line(points={{
          402,-84},{416,-84},{416,-45},{438,-45}}, color={255,0,255}));
  connect(zonGroSta2.yOccHeaHig, opeModSel2.uOccHeaHig) annotation (Line(points
        ={{462,-33},{486,-33},{486,-56},{498,-56}}, color={255,0,255}));
  connect(zonGroSta2.yColZon, opeModSel2.totColZon) annotation (Line(points={{
          462,-38},{482,-38},{482,-60},{498,-60}}, color={255,127,0}));
  connect(zonGroSta2.ySetBac, opeModSel2.uSetBac) annotation (Line(points={{462,
          -40},{480,-40},{480,-62},{498,-62}}, color={255,0,255}));
  connect(zonGroSta2.yEndSetBac, opeModSel2.uEndSetBac) annotation (Line(points
        ={{462,-42},{478,-42},{478,-64},{498,-64}}, color={255,0,255}));
  connect(zonGroSta2.TZonMin, opeModSel2.TZonMin) annotation (Line(points={{462,
          -55},{468,-55},{468,-68},{498,-68}}, color={0,0,127}));
  connect(zonGroSta2.yHotZon, opeModSel2.totHotZon) annotation (Line(points={{
          462,-45},{476,-45},{476,-70},{498,-70}}, color={255,127,0}));
  connect(zonGroSta2.ySetUp, opeModSel2.uSetUp) annotation (Line(points={{462,
          -47},{474,-47},{474,-72},{498,-72}}, color={255,0,255}));
  connect(zonGroSta2.yEndSetUp, opeModSel2.uEndSetUp) annotation (Line(points={
          {462,-49},{472,-49},{472,-74},{498,-74}}, color={255,0,255}));
  connect(zonGroSta2.yOpeWin, opeModSel2.uOpeWin) annotation (Line(points={{462,
          -59},{466,-59},{466,-58},{498,-58}}, color={255,127,0}));
  connect(weaBus2, AHU2.weaBus) annotation (Line(
      points={{620,90},{666,90},{666,40},{678,40},{678,28},{687.6,28}},
      color={255,204,51},
      thickness=0.5));
  connect(zonSta2.THeaSetOn, TZonSet2.TZonHeaSetOcc) annotation (Line(points={{
          402,-70},{424,-70},{424,-96},{498,-96}}, color={0,0,127}));
  connect(zonSta2.THeaSetOff, TZonSet2.TZonHeaSetUno) annotation (Line(points={
          {402,-80},{428,-80},{428,-98},{498,-98}}, color={0,0,127}));
  connect(zonSta2.TCooSetOn, TZonSet2.TZonCooSetOcc) annotation (Line(points={{
          402,-75},{430,-75},{430,-91},{498,-91}}, color={0,0,127}));
  connect(opeModSel2.yOpeMod, intRep2.u)
    annotation (Line(points={{522,-60},{538,-60}}, color={255,127,0}));
  connect(opeModSel2.yOpeMod, conAHU2.uOpeMod) annotation (Line(points={{522,
          -60},{530,-60},{530,6.11111},{628.7,6.11111}}, color={255,127,0}));
  connect(opeModSel2.yOpeMod, Building2.uOpeMod) annotation (Line(points={{522,
          -60},{530,-60},{530,-20},{720,-20},{720,7.6},{734.2,7.6}}, color={255,
          127,0}));
  connect(intRep2.y, TZonSet2.uOpeMod) annotation (Line(points={{562,-60},{566,
          -60},{566,-80},{492,-80},{492,-87},{498,-87}}, color={255,127,0}));
  connect(TZonSet2[1].TZonCooSet, Building2.TRooCooSet) annotation (Line(points
        ={{522,-92},{586,-92},{586,-24},{724,-24},{724,13},{735.1,13}}, color={
          0,0,127}));
  connect(TZonSet2[1].TZonHeaSet, Building2.TRooHeaSet) annotation (Line(points
        ={{522,-100},{588,-100},{588,-26},{726,-26},{726,15.7},{735.1,15.7}},
        color={0,0,127}));
  connect(demLimLev2.y, TZonSet2.uCooDemLimLev) annotation (Line(points={{482,
          -116},{492,-116},{492,-106},{498,-106}}, color={255,127,0}));
  connect(demLimLev2.y, TZonSet2.uHeaDemLimLev) annotation (Line(points={{482,
          -116},{492,-116},{492,-108},{498,-108}}, color={255,127,0}));
  connect(warUpTim2.y, zonSta2.warUpTim) annotation (Line(points={{357.2,-86},{
          370,-86},{370,-74},{378,-74}}, color={0,0,127}));
  connect(Building2.TRooAir, zonSta2.TZon) annotation (Line(points={{754.9,17.5},
          {764,17.5},{764,-132},{374,-132},{374,-86},{378,-86}}, color={0,0,127}));
  connect(Building2.TRooAir, zonOutAirSet2.TZon) annotation (Line(points={{
          754.9,17.5},{764,17.5},{764,-30},{510,-30},{510,34},{518,34}}, color=
          {0,0,127}));
  connect(reaRep4.y, zonGroSta2.tNexOcc) annotation (Line(points={{402,50},{408,
          50},{408,-25},{438,-25}}, color={0,0,127}));
  connect(booRep4.y, zonGroSta2.uOcc) annotation (Line(points={{402,20},{406,20},
          {406,-23},{438,-23}}, color={255,0,255}));
  connect(falSta2.y, zonGroSta2.zonOcc) annotation (Line(points={{362,0},{428,0},
          {428,-21},{438,-21}}, color={255,0,255}));
  connect(falSta2.y, zonGroSta2.uWin) annotation (Line(points={{362,0},{428,0},
          {428,-59},{438,-59}}, color={255,0,255}));
  connect(zonGroSta2.TZon, Building2.TRooAir) annotation (Line(points={{438,-57},
          {434,-57},{434,-132},{764,-132},{764,17.5},{754.9,17.5}}, color={0,0,
          127}));
  connect(TZonSet2[1].TZonCooSet, conAHU2.TZonCooSet) annotation (Line(points={{522,-92},
          {586,-92},{586,37.2222},{628.7,37.2222}},           color={0,0,127}));
  connect(TZonSet2[1].TZonHeaSet, conAHU2.TZonHeaSet) annotation (Line(points={{522,
          -100},{588,-100},{588,38.8889},{628.7,38.8889}},      color={0,0,127}));
  connect(weaBus2.TDryBul, conAHU2.TOut) annotation (Line(
      points={{620.03,90.03},{626,90.03},{626,35.5556},{628.7,35.5556}},
      color={255,204,51},
      thickness=0.5));
  connect(zonSta2.TCooSetOff, TZonSet2.TZonCooSetUno) annotation (Line(points={
          {402,-87},{426,-87},{426,-93},{498,-93}}, color={0,0,127}));
  connect(zonGroSta2.uGroOcc, opeModSel2.uOcc) annotation (Line(points={{462,
          -21},{494,-21},{494,-46},{498,-46}}, color={255,0,255}));
  connect(zonGroSta2.nexOcc, opeModSel2.tNexOcc) annotation (Line(points={{462,
          -23},{492,-23},{492,-48},{498,-48}}, color={0,0,127}));
  connect(zonGroSta2.yCooTim, opeModSel2.maxCooDowTim) annotation (Line(points=
          {{462,-27},{490,-27},{490,-50},{498,-50}}, color={0,0,127}));
  connect(zonGroSta2.yWarTim, opeModSel2.maxWarUpTim) annotation (Line(points={
          {462,-29},{488,-29},{488,-54},{498,-54}}, color={0,0,127}));
  connect(zonGroSta2.yHigOccCoo, opeModSel2.uHigOccCoo) annotation (Line(points
        ={{462,-35},{484,-35},{484,-52},{498,-52}}, color={255,0,255}));
  connect(zonSta2.yCooTim, zonGroSta2.uCooTim) annotation (Line(points={{402,
          -65},{404,-65},{404,-29},{438,-29}}, color={0,0,127}));
  connect(zonSta2.yWarTim, zonGroSta2.uWarTim) annotation (Line(points={{402,
          -67},{406,-67},{406,-31},{438,-31}}, color={0,0,127}));
  connect(zonSta2.TCooSetOff, zonGroSta2.TCooSetOff) annotation (Line(points={{
          402,-87},{420,-87},{420,-51},{438,-51}}, color={0,0,127}));
  connect(zonSta2.yHigUnoCoo, zonGroSta2.uHigUnoCoo) annotation (Line(points={{
          402,-89},{418,-89},{418,-49},{438,-49}}, color={255,0,255}));
  connect(zonSta2.yEndSetUp, zonGroSta2.uEndSetUp) annotation (Line(points={{
          402,-91},{422,-91},{422,-53},{438,-53}}, color={255,0,255}));
  connect(zonToSys2.VSumDesAreBreZon_flow, conAHU2.VSumDesAreBreZon_flow)
    annotation (Line(points={{582,33},{620,33},{620,27.2222},{628.7,27.2222}},
        color={0,0,127}));
  connect(zonToSys2.VSumUncOutAir_flow, conAHU2.VSumUncOutAir_flow) annotation
    (Line(points={{582,27},{614,27},{614,23.8889},{628.7,23.8889}}, color={0,0,
          127}));
  connect(zonToSys2.VSumSysPriAir_flow, conAHU2.VSumSysPriAir_flow) annotation
    (Line(points={{582,21},{606,21},{606,22.2222},{628.7,22.2222}}, color={0,0,
          127}));
  connect(weather2.weaBus, weaBus2) annotation (Line(
      points={{360,90},{620,90}},
      color={255,204,51},
      thickness=0.5));
  connect(conAHU2.yAveOutAirFraPlu, zonToSys2.yAveOutAirFraPlu) annotation (
      Line(points={{657.3,23.3333},{664,23.3333},{664,52},{556,52},{556,32},{
          558,32}}, color={0,0,127}));
  connect(cooDowTim2.y, zonSta2.cooDowTim) annotation (Line(points={{357.2,-64},
          {360,-64},{360,-70},{378,-70}}, color={0,0,127}));
  connect(TZonResReq3.y, conAHU3.uZonTemResReq) annotation (Line(points={{636,
          -356},{640,-356},{640,-291.556},{642.7,-291.556}}, color={255,127,0}));
  connect(PZonResReq3.y, conAHU3.uZonPreResReq) annotation (Line(points={{636,
          -386},{640,-386},{640,-293.222},{642.7,-293.222}}, color={255,127,0}));
  connect(AHU3.TSupAHU, conAHU3.TSup) annotation (Line(points={{721,-281.4},{
          721,-292},{678,-292},{678,-302},{636,-302},{636,-292},{634,-292},{634,
          -278.778},{642.7,-278.778}}, color={0,0,127}));
  connect(conAHU3.ducStaPre, AHU3.dpFan) annotation (Line(points={{642.7,
          -262.111},{642.7,-254},{726,-254},{726,-273},{721,-273}}, color={0,0,
          127}));
  connect(conAHU3.ySupFanSpe, AHU3.uFan) annotation (Line(points={{671.3,
          -262.667},{671.3,-264},{682,-264},{682,-276},{699,-276}}, color={0,0,
          127}));
  connect(conAHU3.yCoo, AHU3.uCoo) annotation (Line(points={{671.3,-286},{692,
          -286},{692,-282},{699,-282}}, color={0,0,127}));
  connect(AHU3.VOutFlo, conAHU3.VOut_flow) annotation (Line(points={{721,-270.4},
          {721,-272},{720,-272},{720,-302},{634,-302},{634,-285.444},{642.7,
          -285.444}}, color={0,0,127}));
  connect(conAHU3.TMix, AHU3.TMixAHU) annotation (Line(points={{642.7,-287.667},
          {638,-287.667},{638,-298},{716,-298},{716,-290},{721,-290},{721,
          -278.4}}, color={0,0,127}));
  connect(AHU3.TRetAHU, conAHU3.TOutCut) annotation (Line(points={{721,-275.6},
          {720,-275.6},{720,-294},{676,-294},{676,-300},{638,-300},{638,
          -280.444},{642.7,-280.444}}, color={0,0,127}));
  connect(conAHU3.yOutDamPos, AHU3.uOutDamPos) annotation (Line(points={{671.3,
          -292.667},{670,-292.667},{670,-296},{694,-296},{694,-273},{699,-273}},
        color={0,0,127}));
  connect(AHU3.TSupAHU, Building3.TSupAHU) annotation (Line(points={{721,-281.4},
          {721,-285.7},{749.1,-285.7}}, color={0,0,127}));
  connect(AHU3.supplyAir, Building3.returnAir) annotation (Line(
      points={{720,-284.2},{720,-286},{724,-286},{724,-290},{744,-290},{744,
          -296},{750,-296},{750,-290.38}},
      color={0,127,255},
      thickness=0.5));
  connect(AHU3.returnAir, Building3.supplyAir) annotation (Line(
      points={{720,-268},{746,-268},{746,-275.8},{750,-275.8}},
      color={0,127,255},
      thickness=0.5));
  connect(occupancy3.occupied, booRep6.u) annotation (Line(points={{375,-252},{
          380,-252},{380,-276},{392,-276}}, color={255,0,255}));
  connect(occupancy3.tNexOcc, reaRep6.u) annotation (Line(points={{375,-240},{
          380,-240},{380,-246},{392,-246}}, color={0,0,127}));
  connect(internalGains3.qGaiFlo, Building3.qGaiFlo) annotation (Line(points={{
          375,-176},{734,-176},{734,-277.6},{749.1,-277.6}}, color={0,0,127}));
  connect(conAHU3.yRetDamPos, AHU3.uRetDamPos) annotation (Line(points={{671.3,
          -289.333},{682,-289.333},{682,-274},{692,-274},{692,-270},{699,-270}},
        color={0,0,127}));
  connect(AHU3.uHea, conAHU3.yHea) annotation (Line(points={{699,-279},{680,
          -279},{680,-282.667},{671.3,-282.667}}, color={0,0,127}));
  connect(zonOutAirSet3.yDesZonPeaOcc, zonToSys3.uDesZonPeaOcc) annotation (
      Line(points={{556,-253},{568,-253},{568,-258},{572,-258}}, color={0,0,127}));
  connect(zonOutAirSet3.VDesPopBreZon_flow, zonToSys3.VDesPopBreZon_flow)
    annotation (Line(points={{556,-256},{566,-256},{566,-260},{572,-260}},
        color={0,0,127}));
  connect(zonOutAirSet3.VDesAreBreZon_flow, zonToSys3.VDesAreBreZon_flow)
    annotation (Line(points={{556,-259},{564,-259},{564,-262},{572,-262}},
        color={0,0,127}));
  connect(zonOutAirSet3.VPriAir_flow, zonToSys3.VPriAir_flow) annotation (Line(
        points={{556,-271},{558,-271},{558,-274},{572,-274}}, color={0,0,127}));
  connect(zonOutAirSet3.yPriOutAirFra, zonToSys3.uPriOutAirFra) annotation (
      Line(points={{556,-268},{560,-268},{560,-272},{572,-272}}, color={0,0,127}));
  connect(zonOutAirSet3.VUncOutAir_flow, zonToSys3.VUncOutAir_flow) annotation
    (Line(points={{556,-265},{562,-265},{562,-270},{572,-270}}, color={0,0,127}));
  connect(zonOutAirSet3.yDesPriOutAirFra, zonToSys3.uDesPriOutAirFra)
    annotation (Line(points={{556,-262},{564,-262},{564,-268},{572,-268}},
        color={0,0,127}));
  connect(zonToSys3.ySumDesZonPop, conAHU3.sumDesZonPop) annotation (Line(
        points={{596,-257},{638,-257},{638,-265.444},{642.7,-265.444}}, color={
          0,0,127}));
  connect(zonToSys3.VSumDesPopBreZon_flow, conAHU3.VSumDesPopBreZon_flow)
    annotation (Line(points={{596,-260},{636,-260},{636,-267.111},{642.7,
          -267.111}}, color={0,0,127}));
  connect(zonToSys3.yDesSysVenEff, conAHU3.uDesSysVenEff) annotation (Line(
        points={{596,-266},{630,-266},{630,-270.444},{642.7,-270.444}}, color={
          0,0,127}));
  connect(zonToSys3.uOutAirFra_max, conAHU3.uOutAirFra_max) annotation (Line(
        points={{596,-272},{626,-272},{626,-275.444},{642.7,-275.444}}, color={
          0,0,127}));
  connect(conAHU3.yReqOutAir, booRep7.u) annotation (Line(points={{671.3,
          -279.333},{674,-279.333},{674,-228},{488,-228},{488,-246},{492,-246}},
        color={255,0,255}));
  connect(booRep7.y, zonOutAirSet3.uReqOutAir) annotation (Line(points={{516,
          -246},{520,-246},{520,-259},{532,-259}}, color={255,0,255}));
  connect(conAHU3.VDesUncOutAir_flow, reaRep7.u) annotation (Line(points={{671.3,
          -269.333},{676,-269.333},{676,-226},{486,-226},{486,-276},{492,-276}},
                  color={0,0,127}));
  connect(reaRep7.y, zonOutAirSet3.VUncOut_flow_nominal) annotation (Line(
        points={{516,-276},{520,-276},{520,-271},{532,-271}}, color={0,0,127}));
  connect(Building3.VDis, zonOutAirSet3.VDis_flow) annotation (Line(points={{
          768.9,-280.84},{774,-280.84},{774,-324},{528,-324},{528,-268},{532,
          -268}}, color={0,0,127}));
  connect(Building3.TDis, zonOutAirSet3.TDis) annotation (Line(points={{768.9,
          -283},{776,-283},{776,-328},{526,-328},{526,-265},{532,-265}}, color=
          {0,0,127}));
  connect(Building3.yZonPreResReq, PZonResReq3.u[1:21]) annotation (Line(points={{769.8,
          -287.5},{768,-287.5},{768,-402},{610,-402},{610,-382.667},{612,
          -382.667}}, color={255,127,0}));
  connect(Building3.yZonTemResReq, TZonResReq3.u[1:21]) annotation (Line(points={{769.8,
          -285.34},{769.8,-396},{604,-396},{604,-352.667},{612,-352.667}},
        color={255,127,0}));
  connect(zonSta3.yOccHeaHig, zonGroSta3.uOccHeaHig) annotation (Line(points={{
          416,-368},{422,-368},{422,-331},{452,-331}}, color={255,0,255}));
  connect(zonSta3.yHigOccCoo, zonGroSta3.uHigOccCoo) annotation (Line(points={{
          416,-373},{424,-373},{424,-333},{452,-333}}, color={255,0,255}));
  connect(zonSta3.THeaSetOff, zonGroSta3.THeaSetOff) annotation (Line(points={{
          416,-376},{428,-376},{428,-339},{452,-339}}, color={0,0,127}));
  connect(zonSta3.yUnoHeaHig, zonGroSta3.uUnoHeaHig) annotation (Line(points={{
          416,-378},{426,-378},{426,-337},{452,-337}}, color={255,0,255}));
  connect(zonSta3.yEndSetBac, zonGroSta3.uEndSetBac) annotation (Line(points={{
          416,-380},{430,-380},{430,-341},{452,-341}}, color={255,0,255}));
  connect(zonGroSta3.yOccHeaHig, opeModSel3.uOccHeaHig) annotation (Line(points
        ={{476,-329},{500,-329},{500,-352},{512,-352}}, color={255,0,255}));
  connect(zonGroSta3.yColZon, opeModSel3.totColZon) annotation (Line(points={{
          476,-334},{496,-334},{496,-356},{512,-356}}, color={255,127,0}));
  connect(zonGroSta3.ySetBac, opeModSel3.uSetBac) annotation (Line(points={{476,
          -336},{494,-336},{494,-358},{512,-358}}, color={255,0,255}));
  connect(zonGroSta3.yEndSetBac, opeModSel3.uEndSetBac) annotation (Line(points
        ={{476,-338},{492,-338},{492,-360},{512,-360}}, color={255,0,255}));
  connect(zonGroSta3.TZonMin, opeModSel3.TZonMin) annotation (Line(points={{476,
          -351},{482,-351},{482,-364},{512,-364}}, color={0,0,127}));
  connect(zonGroSta3.yHotZon, opeModSel3.totHotZon) annotation (Line(points={{
          476,-341},{490,-341},{490,-366},{512,-366}}, color={255,127,0}));
  connect(zonGroSta3.ySetUp, opeModSel3.uSetUp) annotation (Line(points={{476,
          -343},{488,-343},{488,-368},{512,-368}}, color={255,0,255}));
  connect(zonGroSta3.yEndSetUp, opeModSel3.uEndSetUp) annotation (Line(points={
          {476,-345},{486,-345},{486,-370},{512,-370}}, color={255,0,255}));
  connect(zonGroSta3.yOpeWin, opeModSel3.uOpeWin) annotation (Line(points={{476,
          -355},{480,-355},{480,-354},{512,-354}}, color={255,127,0}));
  connect(weaBus3, AHU3.weaBus) annotation (Line(
      points={{634,-206},{680,-206},{680,-256},{692,-256},{692,-268},{701.6,
          -268}},
      color={255,204,51},
      thickness=0.5));
  connect(zonSta3.THeaSetOn, TZonSet3.TZonHeaSetOcc) annotation (Line(points={{
          416,-366},{438,-366},{438,-392},{512,-392}}, color={0,0,127}));
  connect(zonSta3.THeaSetOff, TZonSet3.TZonHeaSetUno) annotation (Line(points={
          {416,-376},{442,-376},{442,-394},{512,-394}}, color={0,0,127}));
  connect(zonSta3.TCooSetOn, TZonSet3.TZonCooSetOcc) annotation (Line(points={{
          416,-371},{444,-371},{444,-387},{512,-387}}, color={0,0,127}));
  connect(opeModSel3.yOpeMod, intRep3.u)
    annotation (Line(points={{536,-356},{552,-356}}, color={255,127,0}));
  connect(opeModSel3.yOpeMod, conAHU3.uOpeMod) annotation (Line(points={{536,
          -356},{544,-356},{544,-289.889},{642.7,-289.889}}, color={255,127,0}));
  connect(opeModSel3.yOpeMod, Building3.uOpeMod) annotation (Line(points={{536,
          -356},{544,-356},{544,-316},{734,-316},{734,-288.4},{748.2,-288.4}},
        color={255,127,0}));
  connect(intRep3.y, TZonSet3.uOpeMod) annotation (Line(points={{576,-356},{580,
          -356},{580,-376},{506,-376},{506,-383},{512,-383}}, color={255,127,0}));
  connect(TZonSet3[1].TZonCooSet, Building3.TRooCooSet) annotation (Line(points
        ={{536,-388},{600,-388},{600,-320},{738,-320},{738,-283},{749.1,-283}},
        color={0,0,127}));
  connect(TZonSet3[1].TZonHeaSet, Building3.TRooHeaSet) annotation (Line(points
        ={{536,-396},{602,-396},{602,-322},{740,-322},{740,-280.3},{749.1,
          -280.3}}, color={0,0,127}));
  connect(demLimLev3.y, TZonSet3.uCooDemLimLev) annotation (Line(points={{496,
          -412},{506,-412},{506,-402},{512,-402}}, color={255,127,0}));
  connect(demLimLev3.y, TZonSet3.uHeaDemLimLev) annotation (Line(points={{496,
          -412},{506,-412},{506,-404},{512,-404}}, color={255,127,0}));
  connect(warUpTim3.y, zonSta3.warUpTim) annotation (Line(points={{371.2,-382},
          {384,-382},{384,-370},{392,-370}}, color={0,0,127}));
  connect(Building3.TRooAir, zonSta3.TZon) annotation (Line(points={{768.9,
          -278.5},{778,-278.5},{778,-428},{388,-428},{388,-382},{392,-382}},
        color={0,0,127}));
  connect(Building3.TRooAir, zonOutAirSet3.TZon) annotation (Line(points={{
          768.9,-278.5},{778,-278.5},{778,-326},{524,-326},{524,-262},{532,-262}},
        color={0,0,127}));
  connect(reaRep6.y, zonGroSta3.tNexOcc) annotation (Line(points={{416,-246},{
          422,-246},{422,-321},{452,-321}}, color={0,0,127}));
  connect(booRep6.y, zonGroSta3.uOcc) annotation (Line(points={{416,-276},{420,
          -276},{420,-319},{452,-319}}, color={255,0,255}));
  connect(falSta3.y, zonGroSta3.zonOcc) annotation (Line(points={{376,-296},{
          442,-296},{442,-317},{452,-317}}, color={255,0,255}));
  connect(falSta3.y, zonGroSta3.uWin) annotation (Line(points={{376,-296},{442,
          -296},{442,-355},{452,-355}}, color={255,0,255}));
  connect(zonGroSta3.TZon, Building3.TRooAir) annotation (Line(points={{452,
          -353},{448,-353},{448,-428},{778,-428},{778,-278.5},{768.9,-278.5}},
        color={0,0,127}));
  connect(TZonSet3[1].TZonCooSet, conAHU3.TZonCooSet) annotation (Line(points={{536,
          -388},{600,-388},{600,-258.778},{642.7,-258.778}},      color={0,0,
          127}));
  connect(TZonSet3[1].TZonHeaSet, conAHU3.TZonHeaSet) annotation (Line(points={{536,
          -396},{602,-396},{602,-257.111},{642.7,-257.111}},      color={0,0,
          127}));
  connect(weaBus3.TDryBul, conAHU3.TOut) annotation (Line(
      points={{634.03,-205.97},{640,-205.97},{640,-260.444},{642.7,-260.444}},
      color={255,204,51},
      thickness=0.5));
  connect(zonSta3.TCooSetOff, TZonSet3.TZonCooSetUno) annotation (Line(points={
          {416,-383},{440,-383},{440,-389},{512,-389}}, color={0,0,127}));
  connect(zonGroSta3.uGroOcc, opeModSel3.uOcc) annotation (Line(points={{476,
          -317},{508,-317},{508,-342},{512,-342}}, color={255,0,255}));
  connect(zonGroSta3.nexOcc, opeModSel3.tNexOcc) annotation (Line(points={{476,
          -319},{506,-319},{506,-344},{512,-344}}, color={0,0,127}));
  connect(zonGroSta3.yCooTim, opeModSel3.maxCooDowTim) annotation (Line(points=
          {{476,-323},{504,-323},{504,-346},{512,-346}}, color={0,0,127}));
  connect(zonGroSta3.yWarTim, opeModSel3.maxWarUpTim) annotation (Line(points={
          {476,-325},{502,-325},{502,-350},{512,-350}}, color={0,0,127}));
  connect(zonGroSta3.yHigOccCoo, opeModSel3.uHigOccCoo) annotation (Line(points
        ={{476,-331},{498,-331},{498,-348},{512,-348}}, color={255,0,255}));
  connect(zonSta3.yCooTim, zonGroSta3.uCooTim) annotation (Line(points={{416,
          -361},{418,-361},{418,-325},{452,-325}}, color={0,0,127}));
  connect(zonSta3.yWarTim, zonGroSta3.uWarTim) annotation (Line(points={{416,
          -363},{420,-363},{420,-327},{452,-327}}, color={0,0,127}));
  connect(zonSta3.TCooSetOff, zonGroSta3.TCooSetOff) annotation (Line(points={{
          416,-383},{434,-383},{434,-347},{452,-347}}, color={0,0,127}));
  connect(zonSta3.yHigUnoCoo, zonGroSta3.uHigUnoCoo) annotation (Line(points={{
          416,-385},{432,-385},{432,-345},{452,-345}}, color={255,0,255}));
  connect(zonSta3.yEndSetUp, zonGroSta3.uEndSetUp) annotation (Line(points={{
          416,-387},{436,-387},{436,-349},{452,-349}}, color={255,0,255}));
  connect(zonToSys3.VSumDesAreBreZon_flow, conAHU3.VSumDesAreBreZon_flow)
    annotation (Line(points={{596,-263},{634,-263},{634,-268.778},{642.7,
          -268.778}}, color={0,0,127}));
  connect(zonToSys3.VSumUncOutAir_flow, conAHU3.VSumUncOutAir_flow) annotation
    (Line(points={{596,-269},{628,-269},{628,-272.111},{642.7,-272.111}}, color
        ={0,0,127}));
  connect(zonToSys3.VSumSysPriAir_flow, conAHU3.VSumSysPriAir_flow) annotation
    (Line(points={{596,-275},{620,-275},{620,-273.778},{642.7,-273.778}}, color
        ={0,0,127}));
  connect(weather3.weaBus, weaBus3) annotation (Line(
      points={{374,-206},{634,-206}},
      color={255,204,51},
      thickness=0.5));
  connect(conAHU3.yAveOutAirFraPlu, zonToSys3.yAveOutAirFraPlu) annotation (
      Line(points={{671.3,-272.667},{678,-272.667},{678,-244},{570,-244},{570,
          -264},{572,-264}}, color={0,0,127}));
  connect(cooDowTim3.y, zonSta3.cooDowTim) annotation (Line(points={{371.2,-360},
          {374,-360},{374,-366},{392,-366}}, color={0,0,127}));
  connect(AHU2.port_b, splVal2.port_1) annotation (Line(points={{686,10},{688,
          10},{688,-144},{280,-144},{280,100},{244,100}}, color={0,127,255}));
  connect(AHU3.port_b, splVal2.port_1) annotation (Line(points={{700,-286},{472,
          -286},{472,100},{244,100}}, color={0,127,255}));
  connect(AHU1.port_b, splVal2.port_1) annotation (Line(points={{108,-298},{108,
          -388},{282,-388},{282,104},{244,104},{244,100}}, color={0,127,255}));
  connect(Building2.port_b, splVal2.port_3) annotation (Line(points={{738.7,3.1},
          {238,3.1},{238,94}}, color={0,127,255}));
  connect(Building1.port_b, splVal2.port_3) annotation (Line(points={{160.7,
          -304.9},{160.7,-105.45},{238,-105.45},{238,94}}, color={0,127,255}));
  connect(Building3.port_b, splVal2.port_3) annotation (Line(points={{752.7,
          -292.9},{752.7,-440},{342,-440},{342,-16},{318,-16},{318,8},{286,8},{
          286,72},{238,72},{238,94}}, color={0,127,255}));
  connect(Building1.port_a, splVal1.port_3) annotation (Line(points={{173.3,
          -304.9},{256,-304.9},{256,16},{272,16},{272,120},{178,120},{178,81}},
        color={0,127,255}));
  connect(Building2.port_a, splVal1.port_3) annotation (Line(points={{751.3,3.1},
          {751.3,0},{776,0},{776,144},{178,144},{178,81}}, color={0,127,255}));
  connect(Building3.port_a, splVal1.port_3) annotation (Line(points={{765.3,
          -292.9},{178,-292.9},{178,81}}, color={0,127,255}));
  connect(AHU2.port_a1, splVal1.port_2) annotation (Line(points={{706,10},{704,
          10},{704,-16},{480,-16},{480,-8},{376,-8},{376,-24},{312,-24},{312,-8},
          {328,-8},{328,128},{183,128},{183,86}}, color={0,127,255}));
  connect(AHU1.port_a1, splVal1.port_2) annotation (Line(points={{128,-298},{
          128,-320},{288,-320},{288,-24},{312,-24},{312,-8},{328,-8},{328,128},
          {183,128},{183,86}}, color={0,127,255}));
  connect(AHU3.port_a1, splVal1.port_2) annotation (Line(points={{720,-286},{
          514,-286},{514,-190},{194,-190},{194,86},{183,86}}, color={0,127,255}));
  connect(Building2.mass_flow_rate, mulSum.u[22:42]) annotation (Line(points={{754.9,
          21.1},{754.9,24},{784,24},{784,-160},{392,-160},{392,-152},{296,-152},
          {296,-16},{192,-16},{192,0},{186.6,0},{186.6,18.9917}},       color={
          0,0,127}));
  connect(Building1.mass_flow_rate, mulSum.u[43:63]) annotation (Line(points={{176.9,
          -286.9},{176.9,-288},{192,-288},{192,0},{186.6,0},{186.6,19.3417}},
                     color={0,0,127}));
  connect(Building3.mass_flow_rate, mulSum.u[64:84]) annotation (Line(points={{768.9,
          -274.9},{186.6,-274.9},{186.6,19.6917}},       color={0,0,127}));
  connect(conAHU1.yHea, add2.u1) annotation (Line(points={{79.3,-294.667},{200,
          -294.667},{200,57.2},{202.6,57.2}}, color={0,0,127}));
  connect(conAHU2.yHea, add2.u1) annotation (Line(points={{657.3,13.3333},{200,
          13.3333},{200,57.2},{202.6,57.2}}, color={0,0,127}));
  connect(conAHU3.yHea, add2.u1) annotation (Line(points={{671.3,-282.667},{224,
          -282.667},{224,-166},{104,-166},{104,-112},{202.6,-112},{202.6,57.2}},
        color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-340,-780},{1260,140}})),
      experiment(
      StartTime = 0,
      StopTime=2592000,
      Interval=600,
      __Dymola_Algorithm="Radau"),
              Icon(coordinateSystem(preserveAspectRatio=false, extent={{-340,
            -780},{1260,140}})),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end chicago20_2_test;
