within Modelica_LinearSystems2.Utilities.Plot.Examples;
function plotParameterizedCurve1 "Plot two circles as parameterized curve"
  import Modelica.SIunits.Conversions.from_deg;
  import Modelica.Math.sin;
   input Modelica.SIunits.Conversions.NonSIunits.Angle_deg maxAngle = 300
    "Maximum opening angle";
   input Integer nPoints(min=2) = 100 "Number of points";
protected
   Real s[nPoints] = linspace(0,from_deg(maxAngle),nPoints);
   Real X[2,nPoints];
   Real Y[2,nPoints];
algorithm
   for i in 1:nPoints loop
     X[1,i] :=cos(s[i]);
     Y[1,i] :=sin(s[i]);
     X[2,i] :=X[1,i] - 0.5;
     Y[2,i] :=Y[1,i];
   end for;
   Modelica_LinearSystems2.Utilities.Plot.parameterizedCurves(
     diagram=  Modelica_LinearSystems2.Utilities.Plot.Records.ParametrizedCurves(
       X=X, Y=Y, s=s));

    annotation(__Dymola_interactive=true, Documentation(info="<html>
<p>
This function plots the following diagram (with default input arguments):
</p>

<blockquote>
<img src=\"modelica://Modelica_LinearSystems2/Resources/Images/Utilities/plotSine.png\">
</blockquote>

</html>"));
end plotParameterizedCurve1;
